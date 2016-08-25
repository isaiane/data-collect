function maskInput() {
	var maskBehavior = function (val) {
    return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009';
  },
  options = {
    onKeyPress: function(val, e, field, options) {
    field.mask(maskBehavior.apply({}, arguments), options);
    }
  };

 $('[data-phone]').mask(maskBehavior, options);
  $('[data-date]').mask('00/00/0000');
  $('[data-cpf]').mask('000.000.000-00', {reverse: false});
  $('[data-cnpj]').mask('00.000.000/0000-00', {reverse: false});
  $('[data-cep]').mask('00.000-00', {reverse: false});
  $('[data-km]').mask('000.000.000.000 km', {reverse: false});
  $('[data-real]').maskMoney({
    prefix : "R$ ",
    decimal : ",",
    thousands : "."
  });
};