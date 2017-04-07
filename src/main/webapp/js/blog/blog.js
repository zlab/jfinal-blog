$(function () {

  $('.prettyprint').addClass('linenums');

  // prettify
  prettyPrint();

  $('.prettyprint .pln').each(function () {
    var parent = $(this).parent();
    if (parent.children().length == 1) {
      parent.css('line-height', 1);
    }
  });

  // lazyload
  var loading = ctx + '/images/loading.gif';
  $('img.lazy').prop('src', loading).lazyload({
    effect: 'fadeIn'
  });

  // scrollUp
  $.scrollUp({
    scrollName: 'scrollUp',      // Element ID
    scrollDistance: 300,         // Distance from top/bottom before showing element (px)
    scrollFrom: 'top',           // 'top' or 'bottom'
    scrollSpeed: 300,            // Speed back to top (ms)
    easingType: 'linear',        // Scroll to top easing (see http://easings.net/)
    animation: 'fade',           // Fade, slide, none
    animationSpeed: 200,         // Animation speed (ms)
    scrollTrigger: false,        // Set a custom triggering element. Can be an HTML string or jQuery object
    scrollTarget: false,         // Set a custom target element for scrolling to. Can be element or number
    scrollText: 'Scroll to top', // Text for element, can contain HTML
    scrollTitle: false,          // Set a custom <a> title if required.
    scrollImg: false,            // Set true to use image
    activeOverlay: false,        // Set CSS color to display scrollUp active point, e.g '#00FFFF'
    zIndex: 2147483647           // Z-Index for the overlay
  });


  // 多说评论
  try {
    DUOSHUO.ThreadCount();
  } catch (e) {

  }

});