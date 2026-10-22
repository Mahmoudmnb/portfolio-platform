<?php

namespace App\Http\Resources;

use App\Models\Category;
use App\Models\PortfolioEntry;
use App\Models\Service;
use App\Models\SiteSetting;
use App\Models\TeamMember;
use App\Models\Technology;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ContentResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        $resource = match (true) {
            $this->resource instanceof PortfolioEntry => new EntryResource($this->resource),
            $this->resource instanceof Category => new CategoryResource($this->resource),
            $this->resource instanceof Technology => new TechnologyResource($this->resource),
            $this->resource instanceof TeamMember => new TeamMemberResource($this->resource),
            $this->resource instanceof Service => new ServiceResource($this->resource),
            $this->resource instanceof SiteSetting => new SettingsResource($this->resource),
            default => throw new \LogicException('Unsupported content resource')
        };

        return $resource->toArray($request);
    }
}
