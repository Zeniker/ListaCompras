class Pedido{
    constructor(){
        this._produto = $("#pedido_produto_id");
        this._quantidade = $("#pedido_quantidade");
        this._unidade_medida = $("#pedido_unidade_medida_id");
        this.set_masks();
        this.set_select2();
    }

    get quantidade(){
        return this._quantidade;
    }

    set_masks(){
        this._quantidade.inputmask("numeric", {
            radixPoint: ",",
            groupSeparator: "",
            digits: 2,
            autoGroup: true,
            prefix: '', //No Space, this will truncate the first character
            rightAlign: false,
            oncleared: function () { self.Value(''); }
        });
    }

    set_select2(){
        this._produto.select2();
        this._unidade_medida.select2();
    }
}

$(document).on("turbolinks:load", function() {
    pedido = new Pedido();
});

