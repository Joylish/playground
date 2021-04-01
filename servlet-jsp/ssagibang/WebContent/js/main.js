$(document).ready(function () {
  $(".type-group > li > a").click(function (event) {
    event.preventDefault();
    var active_tab_selector = $(".type-group > li.active > a").attr("href");
    //find actived navigation and remove 'active' css
    var actived_nav = $(".type-group > li.active");
    actived_nav.removeClass("active");
    //add 'active' css into clicked navigation
    $(this).parents("li").addClass("active");
    //hide displaying tab content
    $(active_tab_selector).removeClass("active");
    $(active_tab_selector).addClass("hide");
    //show target tab content
    var target_tab_selector = $(this).attr("href");
    $(target_tab_selector).removeClass("hide");
    $(target_tab_selector).addClass("active");
  });

  /*
   * Love button for Design it & Code it
   * http://designitcodeit.com/i/9
   */
  $(".btn-counter").on("click", function (event, count) {
    event.preventDefault();

    var $this = $(this),
      count = $this.attr("data-count"),
      active = $this.hasClass("active"),
      multiple = $this.hasClass("multiple-count");

    // First method, allows to add custom function
    // Use when you want to do an ajax request
    /* if (multiple) {
  $this.attr('data-count', ++count);
  // Your code here
  } else {
  $this.attr('data-count', active ? --count : ++count).toggleClass('active');
  // Your code here
  } */

    // Second method, use when ... I dunno when but it looks cool and that's why it is here
    $.fn.noop = $.noop;
    $this
      .attr("data-count", !active || multiple ? ++count : --count)
      [multiple ? "noop" : "toggleClass"]("active");
  });
});
