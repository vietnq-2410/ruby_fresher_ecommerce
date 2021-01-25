$(document).ready(function () {
	$('.checkout-cart').on('click', 'a[href="#remove"]', function () {
		$(this).parents('.media').fadeOut('300');
	});
	$('.checkout-cart').on('click', '.input-group button[data-action="plus"]', function () {
		$(this).parents('.input-group').find('input').val(parseInt($(this).parents('.input-group').find('input').val()) + 1);
	});
	$('.checkout-cart').on('click', '.input-group button[data-action="minus"]', function () {
		if (parseInt($(this).parents('.input-group').find('input').val()) > 1) {
			$(this).parents('.input-group').find('input').val(parseInt($(this).parents('.input-group').find('input').val()) - 1);
		}
	});
});