<?php

namespace App\Enums;

enum EventName: string
{
    case PageView = 'page_view';
    case EntryView = 'entry_view';
    case ContactClick = 'contact_click';
}
