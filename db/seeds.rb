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
    name_en: "Verrine Coco",
    name_fr: "Verrine Coco",
    description_en: "noix de coco, ananas & patate douce",
    description_fr: "noix de coco, ananas & patate douce",
    price: 10.00,
    img_url: "/pics/patate.jpg"
)

Dessert.create(
    name_en: "Crème Brulée",
    name_fr: "Crème Brulée",
    description_en: "panais & cerfeuil tubéreux",
    description_fr: "panais & cerfeuil tubéreux",
    price: 10.00,
    img_url: "/pics/panais.jpg"
)

Dessert.create(
    name_en: "Mille Feuille",
    name_fr: "Mille Feuille",
    description_en: "vanille, banane & poivrons",
    description_fr: "vanille, banane & poivrons",
    price: 10.00,
    img_url: "/pics/1000.jpg"
)

Dessert.create(
    name_en: "Tartelette carotte",
    name_fr: "Tartelette carotte",
    description_en: "carotte",
    description_fr: "carotte",
    price: 10.00,
    img_url: "/pics/carrot.jpg"
)
