// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require tether
//= require turbolinks
//= require bootstrap-sprockets
//= require cocoon
//= require chosen
//= require_tree .
//= require blueimp-gallery
//= require blueimp-gallery-fullscreen
//= require blueimp-gallery-indicator
//= require blueimp-gallery-video
//= require blueimp-gallery-youtube
//= require jquery.blueimp-gallery
//= require bootstrap-image-gallery


$(function () { 
 $('#story_tag_ids').chosen({
      allow_single_deselect: true,
      width: '100%'
    })
    $('#video_tag_ids').chosen({
      allow_single_deselect: true,
      width: '100%'
    })
    $('#picture_tag_ids').chosen({
      allow_single_deselect: true,
      width: '100%'
    })
    $(".story_picture_id").chosen()
    $('[data-toggle="tooltip"]').tooltip()
});

  $(document).on(' ready page:after-remove', function () {
    $('#story_tag_ids').chosen({
      allow_single_deselect: true,
      width: '100%'
    })
    $('#video_tag_ids').chosen({
      allow_single_deselect: true,
      width: '100%'
    })
    $('#picture_tag_ids').chosen({
      allow_single_deselect: true,
      width: '100%'
    })
    $(".story_picture_id").chosen()
    $('[data-toggle="tooltip"]').tooltip()
  });
 