<?php

namespace App\Support;

use Symfony\Component\HttpKernel\Exception\HttpException;

class ApiException extends HttpException
{
    public function __construct(string $message, int $status = 409)
    {
        parent::__construct($status, $message);
    }
}
