<?php

use Illuminate\Support\Facades\Schedule;

Schedule::command('app:prune')->dailyAt('02:15')->timezone('UTC')->withoutOverlapping();
Schedule::command('queue:prune-failed --hours=168')->daily()->withoutOverlapping();
