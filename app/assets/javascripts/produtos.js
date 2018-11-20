class Produto{
    constructor(){
        this._tipo_produto = $("#produto_tipo_produto_id");
        this._nome = $("#pedido_nome");
        this.set_select2();
    }

    set_select2(){
        this._tipo_produto.select2();
    }
}

$(document).on("turbolinks:load", function() {
    produto = new Produto();
});
