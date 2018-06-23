Order = {
    init: function(root) {
        Order.root = $(root);
        Order.dish = Order.getDishName();
        Order.baking = Order.getBakingName();
        Order.roasting = Order.getRoastingName();
        Order.hasRoasting = Order.checkRoasting();

        Order.root.find("input").change(function() { Order.compute() });

        Order.compute();
    },

    compute: function() {
        Order.setStarterName();
        Order.setDishName();
        Order.setDessertName();
        Order.setRoasting();
        Order.setMarinade();
        Order.setIngredient();
    },

    getDessertName: function() {
        return Order.root.find('.dessert input:checked + label h6').text().trim();
    },

    getBakingName: function() {
        Order.baking = Order.root.find('.dish .baking input:checked + label h6').text().trim();
        return Order.baking;
    },

    getRoastingName: function() {
        Order.roasting = Order.root.find('.dish .roasting input:checked + label h6').text().trim();
        if (Order.hasRoasting)
        {
            return Order.roasting;
        }
        else
        {
            return "";
        }
    },

    getDishName: function() {
        Order.dish = Order.root.find('.dish .base input:checked + label h6').text().trim();
        return Order.dish;
    },

    getStarterName: function() {
        return Order.root.find('.starter input:checked + label h6').text().trim();
    },

    setDessertName: function() {
        choice = Order.root.find(".dessert .choice");
        choice.text(Order.getDessertName());
    },

    setDishName: function() {
        choice = Order.root.find(".dish .choice");

        choice.text(Order.getDishName() + " " + Order.getBakingName().toLowerCase() + " " + (Order.checkRoasting() ? Order.getRoastingName().toLowerCase() : ""));
    },

    setStarterName: function() {
        choice = Order.root.find(".starter .choice");
        choice.text(Order.getStarterName());
    },

    setRoasting: function() {
        if (Order.checkRoasting())
        {
            Order.root.find(".dish .roasting").removeClass("hidden");
        }
        else
        {
            Order.root.find(".dish .roasting").addClass("hidden");
            Order.roasting = "";
        }
    },

    checkRoasting: function() {
        if (Order.dish.toLowerCase() == "boeuf" || Order.dish.toLowerCase() == "beef") {
            return true
        }
        return false
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
