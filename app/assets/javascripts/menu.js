Menu = {
    init: function(root) {
        Menu.root = $(root);
        Menu.root.find("#submenu a").click(function() {
            Menu.root.find("#menu-switch").prop("checked", false);
        });
    }
};

$( document ).ready(function() {
    Menu.init("#main-menu");
});
