<?php

namespace App\Enums;

enum Availability: string
{
    case Available = 'available';
    case Limited = 'limited';
    case Unavailable = 'unavailable';
}
