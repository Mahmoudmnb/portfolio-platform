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
            $t->timestampsTz();
        });
        DB::statement('CREATE UNIQUE INDEX users_single_owner ON users ((true))');
        DB::statement('ALTER TABLE users ADD CONSTRAINT users_normalized_email CHECK (email = lower(trim(email)))');
    }

    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};
