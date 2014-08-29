$(document).ready(function() {
	var i = 1;
	$('#stores')
	.on('cocoon:before-insert', function(e, s) {
		s.fadeIn('slow');
	})
	.on('cocoon:after-insert', function(e, s) {
		s.attr('id','oioioi')
	})
	.on('cocoon:before-remove', function(e, s) {
		$(this).data('remove-timeout', 1000);
		s.fadeOut('slow');
	});
});