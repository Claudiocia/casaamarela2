<?php

namespace App\Repositories;

use Prettus\Repository\Eloquent\BaseRepository;
use Prettus\Repository\Criteria\RequestCriteria;
use App\Repositories\ContribuiRepository;
use App\Models\Contribui;
use App\Validators\ContribuiValidator;

/**
 * Class ContribuiRepositoryEloquent.
 *
 * @package namespace App\Repositories;
 */
class ContribuiRepositoryEloquent extends BaseRepository implements ContribuiRepository
{
    /**
     * Specify Model class name
     *
     * @return string
     */
    public function model()
    {
        return Contribui::class;
    }

    

    /**
     * Boot up the repository, pushing criteria
     */
    public function boot()
    {
        $this->pushCriteria(app(RequestCriteria::class));
    }
    
}
