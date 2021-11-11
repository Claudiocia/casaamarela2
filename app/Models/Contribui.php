<?php

namespace App\Models;

use Bootstrapper\Interfaces\TableInterface;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Prettus\Repository\Contracts\Transformable;
use Prettus\Repository\Traits\TransformableTrait;

/**
 * Class Contribui.
 *
 * @package namespace App\Models;
 */
class Contribui extends Model implements Transformable, TableInterface
{
    use TransformableTrait;
    use SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email','tema', 'contribui',
        'lida', 'aprov', 'user_id'
    ];

    public function getTableHeaders()
    {
        return ['Nome', 'Tema', 'Aproveit.' ,'Status'];
    }

    public function getValueForHeader($header)
    {
        switch ($header){
            case 'Nome':
                return $this->name;
            case 'Tema':
                return $this->tema;
            case 'Aproveit.':
                if($this->aprov == 'n'){
                    return 'Não Aproveitada';
                }else{
                    return 'Aproveitada';
                }
            case 'Status':
                if($this->lida == 'n'){
                    return 'Não Lida';
                }else{
                    return 'Lida';
                }
        }
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
