<?php

namespace App\Repositories;

use Prettus\Repository\Eloquent\BaseRepository;
use Prettus\Repository\Criteria\RequestCriteria;
use App\Repositories\RepresentanteRepository;
use App\Models\Representante;
use App\Validators\RepresentanteValidator;

/**
 * Class RepresentanteRepositoryEloquent.
 *
 * @package namespace App\Repositories;
 */
class RepresentanteRepositoryEloquent extends BaseRepository implements RepresentanteRepository
{
    /**
     * Specify Model class name
     *
     * @return string
     */
    public function model()
    {
        return Representante::class;
    }

    

    /**
     * Boot up the repository, pushing criteria
     */
    public function boot()
    {
        $this->pushCriteria(app(RequestCriteria::class));
    }
    
}
