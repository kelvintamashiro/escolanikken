// Responsive hamburger menu

$(document).ready(function () {
    $('.menu-anchor').on('click touchstart', function (e) {
        $('html').toggleClass('menu-active');
        e.preventDefault();
    });
});

// Fixed Header

$(document).on("scroll", function () {
    if ($(document).scrollTop() > 400) {
        $('header').addClass('shrink');
    } else {
        $('header').removeClass('shrink');
    }
});

// Menu go to and change menu color

$('section.arrow-down, .goto, .dropdown-menu, .tabs').find('a').click(function () {
    var $href = $(this).attr('href');
    var $anchor = $('#' + $href);
    $('html, body').animate({scrollTop: $anchor.offset().top - 180}, 800).focus();
    return false;
});


jQuery(document).ready(function ($) {
    var contentSections = $('.section'),
            navigationItems = $('.navy a');

    updateNavigation();
    $(window).on('scroll', function () {
        updateNavigation();
    });

    function updateNavigation() {
        contentSections.each(function () {
            $this = $(this);
            var activeSection = $('.nav a[href="' + $this.attr('id') + '"]').data('number') - 1;
            if (($this.offset().top - $(window).height() / 2 < $(window).scrollTop()) && ($this.offset().top + $this.height() - $(window).height() / 2 > $(window).scrollTop())) {
                navigationItems.eq(activeSection).addClass('is-selected');
            } else {
                navigationItems.eq(activeSection).removeClass('is-selected');
            }
        });
    }

});

// Carousel	Produtos

$('.center').slick({
    centerMode: true,
    dots: true,
    infinite: true,
    centerPadding: '120px',
    slidesToShow: 3,
    slidesToScroll: 1,
    accessibility: true,
    adaptiveHeight: true,
    responsive: [
        {
            breakpoint: 1081,
            settings: {
                centerMode: true,
                dots: true,
                infinite: true,
                centerPadding: '90px',
                slidesToShow: 2,
                slidesToScroll: 2,
                accessibility: true
            }
        },
        {
            breakpoint: 769,
            settings: {
                centerMode: true,
                centerPadding: '63px',
                infinite: true,
                slidesToShow: 2
            }
        },
        {
            breakpoint: 576,
            settings: {
                centerMode: true,
                centerPadding: '20px',
                infinite: true,
                slidesToShow: 1
            }
        }
    ]
});
$('.autoplay').slick({
    centerMode: true,
    dots: false,
    arrows: false,
    infinite: true,
    slidesToShow: 3,
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 1000,
    accessibility: true,
    adaptiveHeight: true,
    responsive: [
        {
            breakpoint: 1081,
            settings: {
                centerMode: true,
                dots: true,
                infinite: true,
                centerPadding: '90px',
                slidesToShow: 2,
                slidesToScroll: 2,
                accessibility: true
            }
        },
        {
            breakpoint: 769,
            settings: {
                centerMode: true,
                centerPadding: '63px',
                infinite: true,
                slidesToShow: 2
            }
        },
        {
            breakpoint: 576,
            settings: {
                centerMode: true,
                centerPadding: '20px',
                infinite: true,
                slidesToShow: 1
            }
        }
    ]
});

// Carousel soluções

$('.solutions-carousel').slick({
    centerMode: true,
    dots: true,
    infinite: true,
    centerPadding: '0px',
    slidesToShow: 3,
    slidesToScroll: 1,
    accessibility: true,
    adaptiveHeight: true,
    responsive: [
        {
            breakpoint: 1081,
            settings: {
                centerMode: true,
                dots: true,
                infinite: true,
                centerPadding: '0',
                slidesToShow: 3,
                slidesToScroll: 1,
                accessibility: true
            }
        },
        {
            breakpoint: 769,
            settings: {
                centerMode: true,
                centerPadding: '0',
                infinite: true,
                slidesToShow: 2
            }
        },
        {
            breakpoint: 576,
            settings: {
                centerMode: true,
                centerPadding: '0px',
                infinite: true,
                slidesToShow: 1
            }
        }
    ]
});

// Carousel unidades Abre

$(".lazy").slick({
    dots: true,
    infinite: true,
    arrows: false
});



/*
 Load more content with jQuery - May 21, 2013
 (c) 2013 @ElmahdiMahmoud
 */

$(function () {
    $("li.load").slice(0, 0).show();
    $("#loadMore").on('click', function (e) {
        e.preventDefault();
        $("li.load:hidden").slice(0, 100).slideDown();
        if ($("li.load:hidden").length == 0) {
            $("#load").fadeOut('slow');
        }
    });
});


// Login modal (codedrops)

jQuery(document).ready(function ($) {
    var formModal = $('.cd-user-modal'),
            formSignup = formModal.find('#cd-signup'),
            mainNav = $('.main-nav');

    //open modal
    mainNav.on('click', function (event) {
        $(event.target).is(mainNav) && mainNav.children('ul').toggleClass('is-visible');
    });

    //open sign-up form
    mainNav.on('click', '.cd-signup', signup_selected);

    //close modal
    formModal.on('click', function (event) {
        if ($(event.target).is(formModal) || $(event.target).is('.cd-close-form')) {
            formModal.removeClass('is-visible');
        }
    });

    //close modal when clicking the esc keyboard button
    $(document).keyup(function (event) {
        if (event.which == '27') {
            formModal.removeClass('is-visible');
        }
    });

    //hide or show password
    $('.hide-password').on('click', function () {
        var togglePass = $(this),
                passwordField = togglePass.prev('input');

        ('password' == passwordField.attr('type')) ? passwordField.attr('type', 'text') : passwordField.attr('type', 'password');
        ('Ocultar' == togglePass.text()) ? togglePass.text('Mostrar') : togglePass.text('Ocultar');
        //focus and move cursor to the end of input field
        passwordField.putCursorAtEnd();
    });

    function signup_selected() {
        mainNav.children('ul').removeClass('is-visible');
        formModal.addClass('is-visible');
        formLogin.removeClass('is-selected');
        formSignup.addClass('is-selected');
    }

});

// Add input field


$(document).ready(function () {
    var max_fields = 10;
    var wrapper = $(".add-field-container");
    var add_button = $(".add-form-field");

    var x = 1;
    $(add_button).click(function (e) {
        e.preventDefault();
        if (x < max_fields) {
            x++;
            $(wrapper).append('<div class="form-group"><input class="input-field language-field" id="other-tongue" type="text" placeholder="" required="required" pattern=""><div class="delete"></div></div>'); //add input box
        } else
        {
            alert('You Reached the limits')
        }
    });

    $(wrapper).on("click", ".delete", function (e) {
        e.preventDefault();
        $(this).parent('div').remove();
        x--;
    })
});




// card vagas

// Hide the extra content initially, using JS so that if JS is disabled, no problemo:
$('.read-more-content').addClass('hide')
$('.read-more-show, .read-more-hide').removeClass('hide')

// Set up the toggle effect:
$('.read-more-show').on('click', function (e) {
    $(this).next('.read-more-content').removeClass('hide');
    $(this).addClass('hide');
    e.preventDefault();
});

// Changes contributed by @diego-rzg
$('.read-more-hide').on('click', function (e) {
    var p = $(this).parent('.read-more-content');
    p.addClass('hide');
    p.prev('.read-more-show').removeClass('hide'); // Hide only the preceding "Read More"
    e.preventDefault();

});