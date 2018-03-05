Menu = {
    init: function(root) {
        Menu.root = $(root);
        Menu.switch = Menu.root.find("#menu-switch")
        Menu.cartSwitch = Menu.root.find("#display-cart")

        Menu.root.find("a").click(function() {
            Menu.switch.prop("checked", false);
            Menu.cartSwitch.prop("checked", false);
            $("html").removeClass("stop-scroll");
        });

        Menu.switch.on("change", function(){
            if (Menu.switch.prop("checked") == true) {
                $("html").addClass("stop-scroll");
            } else {
                if (Menu.cartSwitch.prop("checked") == false) {
                    $("html").removeClass("stop-scroll");
                }
            }
        });

        if ($(window).width() <= 1000) {
            Menu.cartSwitch.on("change", function(){
                if (Menu.cartSwitch.prop("checked") == true) {
                    $("html").addClass("stop-scroll");
                } else {
                    if (Menu.switch.prop("checked") == false) {
                        $("html").removeClass("stop-scroll");
                    }
                }
            });
        }
    }
};

$( document ).ready(function() {
    Menu.init("#main-menu");
});
