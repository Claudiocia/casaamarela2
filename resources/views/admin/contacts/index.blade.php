@extends('layouts.casaamarela')
@section('conteudo')
    <div class="p-6 sm:px-20 bg-white border-b border-gray-200">
        <div id="admin-content" style="margin-top: 80px;">
            <div class="container-admin">
                <div class="row">
                    <div class="col-md-12">
                        <div class="w-auto p-3">
                            <div class="panel-heading-admin">
                                <h5>Lista de mensagens</h5>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="row btn-new-reset" style="width: 100px; margin-left: 15px; margin-bottom: 15px;">
                                {!! Button::primary('Voltar')->asLinkTo(route('dashboard')) !!}
                            </div>
                            <div class="row" style="margin-left: 10px; margin-right: 10px;">
                                {!!
                                    Table::withContents($contacts)->striped()
                                    ->callback('Actions', function ($field, $contact){
                                        $linkShow = route('admin.contacts.show', ['contact' => $contact->id]);
                                        return Button::LINK('<i class="fas fa-eye"></i>')->asLinkTo($linkShow);
                                    })
                                !!}
                            </div>
                        </div>
                    </div>
                    {{$contacts->links()}}
                </div>
            </div>
        </div>
    </div>
@endsection
