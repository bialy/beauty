$('.menuitem').on('click', function(e) {
    e.preventDefault();
    $('.active').removeClass('active');
    $(this).addClass('active');
});
