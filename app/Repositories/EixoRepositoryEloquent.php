<?php

namespace App\Repositories;

use Prettus\Repository\Eloquent\BaseRepository;
use Prettus\Repository\Criteria\RequestCriteria;
use App\Repositories\EixoRepository;
use App\Models\Eixo;
use App\Validators\EixoValidator;

/**
 * Class EixoRepositoryEloquent.
 *
 * @package namespace App\Repositories;
 */
class EixoRepositoryEloquent extends BaseRepository implements EixoRepository
{
    /**
     * Specify Model class name
     *
     * @return string
     */
    public function model()
    {
        return Eixo::class;
    }

    

    /**
     * Boot up the repository, pushing criteria
     */
    public function boot()
    {
        $this->pushCriteria(app(RequestCriteria::class));
    }
    
}
