//document.addEventListener("turbolinks:before-cache", function(){
//  $('.slider.slick-initialized').slick('unslick');
  $(document).on('turbolinks:load', function() {
    $('.slider').slick({
        arrows: false,  //ボタン非表示
        autoplay: true, //自動再生
        autoplaySpeed: 2000, //再生スピード
    });
  });

//$(function() {
//  $('.slider').slick({
//      arrows: false,  //ボタン非表示
//      autoplay: true, //自動再生
//      autoplaySpeed: 3000, //再生スピード
//  });
//});

