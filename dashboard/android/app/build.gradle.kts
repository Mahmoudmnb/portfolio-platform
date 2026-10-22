import java.util.Properties
import java.net.URI
import java.util.Base64

plugins {
    id("com.android.application")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

val signingFile = rootProject.file("key.properties")
val privateSigning = Properties().apply {
    if (signingFile.isFile) signingFile.inputStream().use { load(it) }
}
fun signingValue(property: String, environment: String): String? =
    System.getenv(environment)?.takeIf { it.isNotBlank() }
        ?: privateSigning.getProperty(property)?.takeIf { it.isNotBlank() }
val signingInputs = mapOf(
    "storeFile" to signingValue("storeFile", "BANNAN_KEYSTORE_FILE"),
    "storePassword" to signingValue("storePassword", "BANNAN_STORE_PASSWORD"),
    "keyAlias" to signingValue("keyAlias", "BANNAN_KEY_ALIAS"),
    "keyPassword" to signingValue("keyPassword", "BANNAN_KEY_PASSWORD"),
)
fun validateReleasePreparation() {
    val defines = (project.findProperty("dart-defines") as? String).orEmpty()
        .split(',').mapNotNull {
            runCatching { String(Base64.getDecoder().decode(it), Charsets.UTF_8) }.getOrNull()
        }
    val api = defines.firstOrNull { it.startsWith("API_BASE_URL=") }?.substringAfter('=')
    val uri = runCatching { URI(api.orEmpty()) }.getOrNull()
    val host = uri?.host.orEmpty().lowercase()
    val placeholder = host in listOf("localhost", "127.0.0.1", "::1", "your-api-host") ||
        listOf(".test", ".invalid", ".localhost").any { host.endsWith(it) } ||
        Regex("(^|\\.)example\\.(com|org|net)$").containsMatchIn(host)
    require(uri?.scheme == "https" && host.isNotBlank() && !placeholder &&
        uri.userInfo == null && uri.query == null && uri.fragment == null &&
        uri.path.trimEnd('/') == "/api/v1") {
        "Release requires an explicit, non-placeholder HTTPS API_BASE_URL ending in /api/v1."
    }
    val target = (project.findProperty("target") as? String ?: "lib/main.dart").replace('\\', '/')
    require(target == "lib/main.dart" || target.endsWith("/lib/main.dart")) {
        "Release must use the ordinary lib/main.dart entry point, never a test/driver target."
    }
    require(signingInputs.values.all { !it.isNullOrBlank() }) {
        "Private release signing is missing. Supply the four BANNAN_* signing inputs or ignored android/key.properties."
    }
    require(file(signingInputs.getValue("storeFile")!!).isFile) {
        "The configured private keystore file is unavailable. No certificate was generated."
    }
}
val releaseRequested = gradle.startParameter.taskNames.any { it.contains("release", ignoreCase = true) }
if (releaseRequested) validateReleasePreparation()
tasks.register("validateReleasePreparation") {
    group = "verification"
    description = "Validate release endpoint, normal target and private signing inputs without building or publishing."
    doLast { validateReleasePreparation() }
}

android {
    namespace = "com.mahmoudbannan.portfolio_admin"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        applicationId = "com.mahmoudbannan.portfolio_admin"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        // Uses the version code from pubspec.yaml. When using split APKs, 1000 * ABI_VERSION
        // is added automatically by Flutter. (https://developer.android.com/studio/build/configure-apk-splits#configure-APK-versions)
        // You can force using the value of versionCode by specifying the `-P force-version-code-ignoring-abi=true`
        // flag during build.
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        if (signingInputs.values.all { !it.isNullOrBlank() }) {
            create("privateRelease") {
                storeFile = file(signingInputs.getValue("storeFile")!!)
                storePassword = signingInputs.getValue("storePassword")
                keyAlias = signingInputs.getValue("keyAlias")
                keyPassword = signingInputs.getValue("keyPassword")
            }
        }
    }
    buildTypes {
        release {
            isDebuggable = false
            if (signingInputs.values.all { !it.isNullOrBlank() }) {
                signingConfig = signingConfigs.getByName("privateRelease")
            }
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

flutter {
    source = "../.."
}
