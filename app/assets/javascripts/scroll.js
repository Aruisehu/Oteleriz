ScrollMenu = {
    init: function(root) {
        ScrollMenu.root = $(root);
        ScrollMenu.height = ScrollMenu.root.outerHeight()+15,

        // All list items
        ScrollMenu.menuItems = ScrollMenu.root.find("#submenu > a"),

        ScrollMenu.anchorItems = ScrollMenu.menuItems.map(function(){
            var item = $($(this).attr("href"));
            if (item.length) { return item; }
        });

        // Bind to scroll
        $(window).scroll(function(){
            // Get container scroll position
            var fromTop = $(this).scrollTop() + ScrollMenu.height;


            // Get id of current scroll item
            var cur = ScrollMenu.anchorItems.map(function(){

                if ($(this).offset().top < fromTop)
                return this;
            });

            // Get the id of the current element
            cur = cur[cur.length-1];

            var id = cur && cur.length ? cur[0].id : "";

            // Set/remove active class
            ScrollMenu.menuItems.removeClass("current")
            ScrollMenu.root.find("[href='#" + id + "']").addClass("current");
        });
    }
};

$( document ).ready(function() {
    ScrollMenu.init("#main-menu");
});
