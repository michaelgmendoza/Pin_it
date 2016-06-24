function masonryAllPages (){
  $('.pin_it-grid').imagesLoaded(function(){
    $('.pin_it-grid').masonry({
      // options
      itemSelector: '.pin-item',
      columnWidth: '.pin-item'
    });
  })
}
$(document).ready(masonryAllPages);
$(document).on('page:load', masonryAllPages);



f
