$('form').html("<%= j(render 'edit_form') %>")
$('.alerts').html("<%= j(render 'layouts/flashes') %>")