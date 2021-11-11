<?php

namespace App\Repositories;

use Prettus\Repository\Eloquent\BaseRepository;
use Prettus\Repository\Criteria\RequestCriteria;
use App\Repositories\DimensionRepository;
use App\Models\Dimension;
use App\Validators\DimensionValidator;

/**
 * Class DimensionRepositoryEloquent.
 *
 * @package namespace App\Repositories;
 */
class DimensionRepositoryEloquent extends BaseRepository implements DimensionRepository
{
    /**
     * Specify Model class name
     *
     * @return string
     */
    public function model()
    {
        return Dimension::class;
    }

    

    /**
     * Boot up the repository, pushing criteria
     */
    public function boot()
    {
        $this->pushCriteria(app(RequestCriteria::class));
    }
    
}
