Menu = {
    init: function(root) {
        Menu.root = $(root);
        Menu.switch = Menu.root.find("#menu-switch")
        Menu.root.find("#submenu a").click(function() {
            Menu.switch.prop("checked", false);
        });

        Menu.switch.on("change", function(){
            if (Menu.switch.prop("checked") == true) {
                $("html").addClass("stop-scroll");
            } else {
                $("html").removeClass("stop-scroll");
            }
        });
    }
};

$( document ).ready(function() {
    Menu.init("#main-menu");
});
