Order = {
    init: function(root) {
        Order.root = $(root);
        Order.dish = Order.getDishName();
        Order.baking = Order.getBakingName();
        Order.roasting = Order.getStarterName();

        Order.root.find("input").change(function() { Order.compute() });

        Order.compute();
    },

    compute: function() {
        Order.setStarterName();
        Order.setDishName();
        Order.setDessertName();
        Order.setMarinade();
        Order.setIngredient();
    },

    getDessertName: function() {
        return Order.root.find('.dessert input:checked + label').text().trim();
    },

    getBakingName: function() {
        Order.baking = Order.root.find('.dish .baking input:checked + label').text().trim();
        return Order.baking;
    },

    getRoastingName: function() {
        Order.roasting = Order.root.find('.dish .roasting input:checked + label').text().trim();
        return Order.roasting;
    },

    getDishName: function() {
        Order.dish = Order.root.find('.dish .base input:checked + label').text().trim();
        return Order.dish;
    },

    getStarterName: function() {
        return Order.root.find('.starter input:checked + label').text().trim();
    },

    setDessertName: function() {
        choice = Order.root.find(".dessert .choice");
        choice.text(Order.getDessertName());
    },

    setDishName: function() {
        choice = Order.root.find(".dish .choice");

        choice.text(Order.getDishName() + " " + Order.getBakingName().toLowerCase() + " " + Order.getRoastingName().toLowerCase());
    },

    setStarterName: function() {
        choice = Order.root.find(".starter .choice");
        choice.text(Order.getStarterName());
    },

    hideMarinades: function() {
        Order.root.find(".marinade").addClass("hidden");
    },

    hideIngredients: function() {
        Order.root.find(".ingredient").addClass("hidden");
    },

    setMarinade: function() {
        Order.hideMarinades();
        Order.root.find(".marinade[data-dish='" + Order.dish.toLowerCase() + "'][data-baking='" + Order.baking.toLowerCase() + "']").removeClass("hidden");
    },

    setIngredient: function() {
        Order.hideIngredients();
        Order.root.find(".ingredient[data-baking='" + Order.baking.toLowerCase() + "']").removeClass("hidden");
    }
};

$( document ).ready(function() {
    Order.init("#add_formula");
});
