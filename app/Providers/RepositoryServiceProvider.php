<?php

namespace App\Providers;

use App\Repositories\CampusRepository;
use App\Repositories\CampusRepositoryEloquent;
use App\Repositories\CategoriaRepository;
use App\Repositories\CategoriaRepositoryEloquent;
use App\Repositories\CommentRepository;
use App\Repositories\CommentRepositoryEloquent;
use App\Repositories\ContactRepository;
use App\Repositories\ContactRepositoryEloquent;
use App\Repositories\ContribuiRepository;
use App\Repositories\ContribuiRepositoryEloquent;
use App\Repositories\CursoRepository;
use App\Repositories\CursoRepositoryEloquent;
use App\Repositories\DepartamentoRepository;
use App\Repositories\DepartamentoRepositoryEloquent;
use App\Repositories\DimensionRepository;
use App\Repositories\DimensionRepositoryEloquent;
use App\Repositories\EixoRepository;
use App\Repositories\EixoRepositoryEloquent;
use App\Repositories\LiderRepository;
use App\Repositories\LiderRepositoryEloquent;
use App\Repositories\MunicipioRepository;
use App\Repositories\MunicipioRepositoryEloquent;
use App\Repositories\PostRepository;
use App\Repositories\PostRepositoryEloquent;
use App\Repositories\RepresentanteRepository;
use App\Repositories\RepresentanteRepositoryEloquent;
use App\Repositories\TagRepository;
use App\Repositories\TagRepositoryEloquent;
use Illuminate\Support\ServiceProvider;

class RepositoryServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->bind(MunicipioRepository::class, MunicipioRepositoryEloquent::class);
        $this->app->bind(DepartamentoRepository::class, DepartamentoRepositoryEloquent::class);
        $this->app->bind(CursoRepository::class, CursoRepositoryEloquent::class);
        $this->app->bind(LiderRepository::class, LiderRepositoryEloquent::class);
        $this->app->bind(RepresentanteRepository::class, RepresentanteRepositoryEloquent::class);
        $this->app->bind(CampusRepository::class, CampusRepositoryEloquent::class);
        $this->app->bind(ContactRepository::class, ContactRepositoryEloquent::class);
        $this->app->bind(DimensionRepository::class, DimensionRepositoryEloquent::class);
        $this->app->bind(EixoRepository::class, EixoRepositoryEloquent::class);
        $this->app->bind(ContribuiRepository::class, ContribuiRepositoryEloquent::class);
        $this->app->bind(CategoriaRepository::class, CategoriaRepositoryEloquent::class);
        $this->app->bind(TagRepository::class, TagRepositoryEloquent::class);
        $this->app->bind(PostRepository::class, PostRepositoryEloquent::class);
        $this->app->bind(CommentRepository::class, CommentRepositoryEloquent::class);
        //:end-bindings:
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
