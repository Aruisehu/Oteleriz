Flashes = {
    init: function(root) {
        Flashes.root = $(root);

        setTimeout(function(){
            Flashes.root.children().addClass("disappear");

            setTimeout(function(){
                Flashes.root.children().remove()
            }, 500);

        }, 6000);

        Flashes.root.children().click(function() {
            this.remove();
        });
    },
};

$( document ).ready(function() {
    Flashes.init(".flashes");
});
