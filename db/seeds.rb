# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Entrées
Starter.create(
    name_en: "Tataki de thon",
    name_fr: "Tataki de thon",
    description_en: "Tataki de thon, salade d’algues, julienne de pommes & confit de citron",
    description_fr: "Tataki de thon, salade d’algues, julienne de pommes & confit de citron",
    price: 13.00,
    img_url: "/pics/tataki.jpg"
)

Starter.create(
    name_en: "Tarte fine de canard",
    name_fr: "Tarte fine de canard",
    description_en: "Gésier, magret fumé, foie gras mi-cuit, accompagnés de ses purées de légumes & pickles",
    description_fr: "Gésier, magret fumé, foie gras mi-cuit, accompagnés de ses purées de légumes & pickles",
    price: 13.00,
    img_url: "/pics/tarte.jpg"
)

Starter.create(
    name_en: "Bouillon Thaï",
    name_fr: "Bouillon Thaï",
    description_en: "Bouillon & dés de saumon mariné à la sauce soja",
    description_fr: "Bouillon & dés de saumon mariné à la sauce soja",
    price: 10.00,
    img_url: "/pics/thai.jpg"
)

Starter.create(
    name_en: "Poke Bowl",
    name_fr: "Poke Bowl",
    description_en: "Poke Bowl végétarien",
    description_fr: "Poke Bowl végétarien",
    price: 10.00,
    img_url: "/pics/poke.jpg"
)

# Plats
boeuf = Dish.create(
    name_en: "Beef",
    name_fr: "Boeuf",
    description_en: "",
    description_fr: "",
    ask_roasting: true,
    price: 21.00
)

volaille = Dish.create(
    name_en: "Poultry",
    name_fr: "Volaille",
    description_en: "",
    description_fr: "",
    price: 19.00
)

gambas = Dish.create(
    name_en: "Shrimp",
    name_fr: "Gambas",
    description_en: "",
    description_fr: "",
    price: 20.00
)

# Modes de cuissons
papillote = Baking.create(
    name_en: "Papillote",
    name_fr: "Papillote",
    description_en: "",
    description_fr: "",
    ingredient_en: "Légumes cuit sous vide (pomme de terre, carotte, poivron rouge, oignon, céleri branche)",
    ingredient_fr: "Légumes cuit sous vide (pomme de terre, carotte, poivron rouge, oignon, céleri branche)"
)

fusio = Baking.create(
    name_en: "Fusio",
    name_fr: "Fusio",
    description_en: "",
    description_fr: "",
    ingredient_en: "Potatoes de pommes de terre, patate douce & céleri, parfumées aux herbes de Provence",
    ingredient_fr: "Potatoes de pommes de terre, patate douce & céleri, parfumées aux herbes de Provence"
)

wok = Baking.create(
    name_en: "Wok",
    name_fr: "Wok",
    description_en: "",
    description_fr: "",
    ingredient_en: "Nouilles chinoise, légumes & sauce soja",
    ingredient_fr: "Nouilles chinoise, légumes & sauce soja"
)

# Marinades
Marinade.create(
    name_en: "",
    name_fr: "",
    description_en: "Marinade sauce saté & paprika",
    description_fr: "Marinade sauce saté & paprika",
    baking: papillote,
    dish: boeuf
)


Marinade.create(
    name_en: "",
    name_fr: "",
    description_en: "Marinade lait de coco & curry",
    description_fr: "Marinade lait de coco & curry",
    baking: papillote,
    dish: volaille
)

Marinade.create(
    name_en: "",
    name_fr: "",
    description_en: "Marinade gingembre & citron vert",
    description_fr: "Marinade gingembre & citron vert",
    baking: papillote,
    dish: gambas
)

Marinade.create(
    name_en: "",
    name_fr: "",
    description_en: "Marinade huile d’olive, thym & ail",
    description_fr: "Marinade huile d’olive, thym & ail",
    baking: fusio,
    dish: boeuf
)

Marinade.create(
    name_en: "",
    name_fr: "",
    description_en: "Marinade huile d’olive & jus de citron vert",
    description_fr: "Marinade huile d’olive & jus de citron vert",
    baking: fusio,
    dish: volaille
)

Marinade.create(
    name_en: "",
    name_fr: "",
    description_en: "Marinade huile d’olive & Martini rouge",
    description_fr: "Marinade huile d’olive & Martini rouge",
    baking: fusio,
    dish: gambas
)

# Desserts
Dessert.create(
    name_en: "Patate douce et ananas dans un parfait assemblage",
    name_fr: "Patate douce et ananas dans un parfait assemblage",
    description_en: "noix de coco, ananas & patate douce",
    description_fr: "noix de coco, ananas & patate douce",
    price: 10.00,
    img_url: "/pics/patate.jpg"
)

Dessert.create(
    name_en: "Panais confit à la façon d'une crème brûlée",
    name_fr: "Panais confit à la façon d'une crème brûlée",
    description_en: "panais & cerfeuil tubéreux",
    description_fr: "panais & cerfeuil tubéreux",
    price: 10.00,
    img_url: "/pics/panais.jpg"
)

Dessert.create(
    name_en: "Poivron rouge en crémeux, monté comme un 1000 feuilles",
    name_fr: "Poivron rouge en crémeux, monté comme un 1000 feuilles",
    description_en: "vanille, banane & poivrons",
    description_fr: "vanille, banane & poivrons",
    price: 10.00,
    img_url: "/pics/1000.jpg"
)

Dessert.create(
    name_en: "Carotte cake, agrumes et petits pois",
    name_fr: "Carotte cake, agrumes et petits pois",
    description_en: "Mariage de la carotte douce avec l'acidité des agrumes et la fraîcheur des petits pois",
    description_fr: "Mariage de la carotte douce avec l'acidité des agrumes et la fraîcheur des petits pois",
    price: 10.00,
    img_url: "/pics/carrot.jpg"
)

FormulaTemplate.create(
    # Stand alone starter
    has_starter: true,
    has_dish: false,
    has_dessert: false,
    has_wine: false
)

FormulaTemplate.create(
    # Stand alone dish
    has_starter: false,
    has_dish: true,
    has_dessert: false,
    has_wine: false
)

FormulaTemplate.create(
    # Stand alone dessert
    has_starter: false,
    has_dish: false,
    has_dessert: true,
    has_wine: false
)

FormulaTemplate.create(
    name_en: "Starter and Dish Formula",
    name_fr: "Formule Entrée + Plat",
    has_starter: true,
    has_dish: true,
    has_dessert: false,
    has_wine: false,
    price: 27.00
)

FormulaTemplate.create(
    name_en: "Dish and Dessert Formula",
    name_fr: "Formule Plat + Dessert",
    has_starter: false,
    has_dish: true,
    has_dessert: true,
    has_wine: false,
    price: 27.00
)

FormulaTemplate.create(
    name_en: "Starter and Dish with 2 Glass of Wine Formula",
    name_fr: "Formule Entrée + Plat avec 2 Verres de Vin",
    has_starter: true,
    has_dish: true,
    has_dessert: false,
    has_wine: true,
    price: 35.00
)

FormulaTemplate.create(
    name_en: "Dish and Dessert with 2 Glass of Wine Formula",
    name_fr: "Formule Plat + Dessert avec 2 Verres de Vin",
    has_starter: false,
    has_dish: true,
    has_dessert: true,
    has_wine: true,
    price: 35.00
)

FormulaTemplate.create(
    name_en: "Starter, Dish and Dessert Formula",
    name_fr: "Formule Entrée + Plat + Dessert",
    has_starter: true,
    has_dish: true,
    has_dessert: true,
    has_wine: false,
    price: 33.00
)

FormulaTemplate.create(
    name_en: "Starter, Dish and Dessert with 2 Glass of Wine and 1 Cocktail Formula",
    name_fr: "Formule Entrée + Plat + Dessert avec 2 Verres de Vin et 1 Cocktail",
    has_starter: true,
    has_dish: true,
    has_dessert: true,
    has_wine: true,
    price: 45.00
)

meal_13_mars_2018 = Meal.create(
    start_time: DateTime.new(2018,3,13,11,30),
    end_time: DateTime.new(2018,3,13,15,00)
)

Service.create(
    start_time: DateTime.new(2018,3,13,18,00),
    end_time: DateTime.new(2018,3,13,19,00),
    meal: meal_13_mars_2018,
    seats: 20
)
=begin
meal_today = Meal.create(
    start_time: Date.today,
    end_time: Date.tomorrow
)

Service.create(
    start_time: Date.today,
    end_time: Date.today + 11.hours,
    meal: meal_today,
    seats: 12
)

Service.create(
    start_time: Date.today + 12.hours,
    end_time: Date.today + 23.hours,
    meal: meal_today,
    seats: 12
)
=end

User.create(
    email: "cookmeupstartup@gmail.com",
    password: "SupinfoCookMeUp2018"
)
