<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('users', function (Blueprint $t) {
            $t->id();
            $t->string('name', 120);
            $t->string('email', 254)->unique();
            $t->string('password');
            $t->boolean('enabled')->default(true);
            $t->unsignedTinyInteger('owner_slot')->storedAs('1')->unique('users_single_owner');
            $t->dateTime('created_at', 6)->nullable();
            $t->dateTime('updated_at', 6)->nullable();
        });
        DB::statement('ALTER TABLE users ADD CONSTRAINT users_enabled_boolean CHECK (enabled IN (0,1))');
        DB::statement('ALTER TABLE users ADD CONSTRAINT users_normalized_email CHECK (BINARY email = BINARY lower(trim(email)))');
    }

    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};
