<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('application_locks', function (Blueprint $table) {
            $table->string('name', 64)->primary();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('application_locks');
    }
};
