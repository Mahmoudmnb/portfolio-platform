<?php

namespace App\Policies;

use App\Models\User;

class OwnerPolicy
{
    public function manage(User $user): bool
    {
        return $user->enabled;
    }
}
