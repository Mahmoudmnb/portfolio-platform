<?php

namespace App\Http\Controllers;

use App\Http\Requests\LoginRequest;
use App\Http\Requests\PasswordRequest;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function login(LoginRequest $request): JsonResponse
    {
        $user = User::where('email', mb_strtolower(trim($request->validated('email'))))->first();
        $valid = Hash::check($request->validated('password'), ($user === null ? '$2y$12$jzkeNwHAs9H/zz7NokRTduP7hpBwIXX/R72XDl7JUacSeiUmzRVYe' : $user->password));
        abort_unless($valid && $user?->enabled, 401, 'Invalid credentials.');

        return DB::transaction(function () use ($user, $request) {
            $user = User::whereKey($user->id)->lockForUpdate()->firstOrFail();
            abort_unless($user->enabled, 401, 'Invalid credentials.');
            $expires = now()->addMinutes(config('sanctum.expiration'));
            $token = $user->createToken($request->validated('device_name'), ['owner'], $expires);

            return response()->json(['data' => ['token' => $token->plainTextToken, 'token_type' => 'Bearer', 'expires_at' => $expires->toISOString(), 'user' => ['id' => $user->id, 'name' => $user->name, 'email' => $user->email]]]);
        });
    }

    public function me(Request $request): JsonResponse
    {
        $u = $request->user();

        return response()->json(['data' => ['id' => $u->id, 'name' => $u->name, 'email' => $u->email]]);
    }

    public function logout(Request $request): Response
    {
        $request->user()->currentAccessToken()->delete();

        return response()->noContent();
    }

    public function logoutAll(Request $request): Response
    {
        $request->user()->tokens()->delete();

        return response()->noContent();
    }

    public function password(PasswordRequest $request): JsonResponse
    {
        DB::transaction(function () use ($request) {
            $u = User::whereKey($request->user()->id)->lockForUpdate()->firstOrFail();
            abort_unless(Hash::check($request->validated('current_password'), $u->password), 422, 'Current password is incorrect.');
            $u->update(['password' => $request->validated('password')]);
            $u->tokens()->delete();
        });

        return response()->json(['data' => ['message' => 'Password changed. Please log in again.']]);
    }
}
