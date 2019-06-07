$(function() {
  $('body').vegas({
    transitionDuration: 2000,
    delay: 7000,
    timer: false,
    animation: 'kenburnsRight',
    slides: [
      { src: "/img/yurt.jpg" },
      { src: "/img/market-stall.jpg" },
      { src: "/img/interior.jpg" },
    ]
  });
});
