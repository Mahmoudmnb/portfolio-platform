<?php

namespace Tests;

use Illuminate\Foundation\Testing\TestCase as BaseTestCase;

abstract class TestCase extends BaseTestCase
{
    public function createApplication()
    {
        $app = parent::createApplication();
        if (! $app->environment('testing') || ! in_array(config('database.default'), ['mysql', 'mariadb'], true) || ! str_ends_with((string) config('database.connections.'.config('database.default').'.database'), '_testing')) {
            throw new \RuntimeException('Tests require an isolated MySQL/MariaDB database ending in _testing.');
        }

        return $app;
    }

    public function call($method, $uri, $parameters = [], $cookies = [], $files = [], $server = [], $content = null)
    {
        // Each HTTP request has a fresh guard in production. Reset the test application's cached guard too.
        $this->app->make('auth')->forgetGuards();

        return parent::call($method, $uri, $parameters, $cookies, $files, $server, $content);
    }
}
