<?php

namespace Database\Factories;

use App\Models\Media;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

/** @extends Factory<Media> */
class MediaFactory extends Factory
{
    protected $model = Media::class;

    public function definition(): array
    {
        return ['storage_key' => (string) Str::uuid(), 'disk' => 'public', 'original_filename' => 'fictional.png', 'mime_type' => 'image/png', 'bytes' => 100, 'width' => 20, 'height' => 20, 'status' => 'ready', 'uploader_id' => User::query()->value('id') ?? User::factory()];
    }
}
