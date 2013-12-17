function scrollToTags() {
  // offset of the element from the top
  $distanceToScroll = $('.tagsection').offset().top;
  // make sure there's enough screen to scroll
     $minScreenHeight = $(window).height();
  $('.tagsection').css('min-height', $minScreenHeight);
  // animate the scroll
  $('body, html').animate({ scrollTop: $distanceToScroll }, 200, 'easeInOutQuint', function() {
    // callback in here if needed
  });
}


$(document).ready(function(){
    $('.maincontent').fadeTo(200,1);

    $('a.ascdesc').hover(function() {
      $this = $(this);
      if($this.css('background-position') == ('50% 100%')) {
        $this.css('background-position', '50% 0%');
      } else {
        $this.css('background-position', '50% 100%');
      }
    }, function() {
      $this = $(this);
      if($this.css('background-position') == ('50% 0%')) {
        $this.css('background-position', '50% 100%');
      } else {
        $this.css('background-position', '50% 0%');
      }
    });

    $('.cyclethis').cycle();

    // highlight items with the same tag
    $('.taglink').hover(function() {
      var theTag = $(this).attr('rel');
      $('.thumbimagebox.' + theTag).stop().css({boxShadow: '0 0 20px #fbec5d'},200);
    }, function() {
      $('.thumbimagebox').stop().css({boxShadow: '0 0 20px rgba(255,255,255,0.5)'},200);
    });

    $('.recipeouter').hover(function() {
      $servesTabThis =  $('.servestab',this);
      $priceTabThis =  $('.pricetab',this);
      $timeTabThis = $('.timetab',this);
      $servesTabThis.stop().fadeTo(200,1);
      $priceTabThis.stop().fadeTo(200,1);
      $timeTabThis.stop().fadeTo(200,0.9).delay(500).fadeTo(200,0);

      $('.titleblock',this).stop().animate({top:'-100%'},200);


    }, function() {
      $('.titleblock',this).stop().animate({top:'0%'},200);
      $servesTabThis.stop().animate({'bottom': '0px'},500, 'swing');
      $priceTabThis.stop().animate({'bottom': '0px'},500, 'swing');
    });

    // highlight items with the same tag
    $('.taglink').hover(function() {
      var theTag = $(this).attr('rel');
      $('.thumbimagebox.' + theTag).stop().css({boxShadow: '0 0 20px #fbec5d'},200);
    }, function() {
      $('.thumbimagebox').stop().css({boxShadow: '0 0 20px rgba(255,255,255,0.5)'},200);
    });

    // tag tab
    $('.tagtab').hover(function() {
      $(this).stop().animate({'left':'-15px'},200,'easeInOutQuint');
    }, function() {
      $(this).stop().animate({'left':'-33px'},200,'easeInOutQuint');
    });

    $('a.tagtab').click(function() {
      scrollToTags();
      return false;
    });

    // glow the logo on resize
    $(window).resize(function(){
      $('a h1.logo').css('background-position','50% 100%');
    });
    // reset the logo when resize ends
    var doit;
    $(window).resize(function(){
      clearTimeout(doit);
      doit = setTimeout(function(){
        $('a h1.logo').css('background-position','50% 0%');
      }, 100);
    });


});
