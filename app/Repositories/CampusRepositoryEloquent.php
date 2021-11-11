<?php

namespace App\Repositories;

use Prettus\Repository\Eloquent\BaseRepository;
use Prettus\Repository\Criteria\RequestCriteria;
use App\Repositories\CampusRepository;
use App\Models\Campus;
use App\Validators\CampusValidator;

/**
 * Class CampusRepositoryEloquent.
 *
 * @package namespace App\Repositories;
 */
class CampusRepositoryEloquent extends BaseRepository implements CampusRepository
{
    /**
     * Specify Model class name
     *
     * @return string
     */
    public function model()
    {
        return Campus::class;
    }

    

    /**
     * Boot up the repository, pushing criteria
     */
    public function boot()
    {
        $this->pushCriteria(app(RequestCriteria::class));
    }
    
}
