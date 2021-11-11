<?php

namespace App\Models;

use Bootstrapper\Interfaces\TableInterface;
use Illuminate\Database\Eloquent\Model;
use Prettus\Repository\Contracts\Transformable;
use Prettus\Repository\Traits\TransformableTrait;

/**
 * Class Eixo.
 *
 * @package namespace App\Models;
 */
class Eixo extends Model implements Transformable, TableInterface
{
    use TransformableTrait;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'descr', 'forca', 'fraqu',
        'oport', 'ameac', 'publica',
        'dimension_id', 'user_id', 'altera',
        ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function dimension()
    {
        return $this->belongsTo(Dimension::class);
    }

    public function getTableHeaders()
    {
        return ['Eixo', ''];
    }

    public function getValueForHeader($header)
    {
        // TODO: Implement getValueForHeader() method.
    }
}
