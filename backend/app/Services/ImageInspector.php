<?php

namespace App\Services;

use Illuminate\Validation\ValidationException;

class ImageInspector
{
    public function inspect(string $path): array
    {
        $info = @getimagesize($path);
        $bytes = @filesize($path);
        if (! $info || ! in_array($info[2], [IMAGETYPE_JPEG, IMAGETYPE_PNG, IMAGETYPE_WEBP], true) || $bytes < 1 || $bytes > 10485760 || $info[0] < 1 || $info[1] < 1 || $info[0] > 8000 || $info[1] > 8000 || $info[0] * $info[1] > 20000000) {
            throw ValidationException::withMessages(['file' => ['Use a valid JPEG, PNG or WebP up to 10 MiB, 8000 pixels per side and 20 megapixels.']]);
        }
        // Decode only after header bounds to constrain decompression memory.
        $image = @imagecreatefromstring(file_get_contents($path));
        if (! $image) {
            throw ValidationException::withMessages(['file' => ['The image cannot be decoded.']]);
        }
        imagedestroy($image);

        return ['mime_type' => $info['mime'], 'bytes' => $bytes, 'width' => $info[0], 'height' => $info[1]];
    }
}
