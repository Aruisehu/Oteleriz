# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Entrées
Starter.create(name: "Tataki de thon", description: "Tataki de thon, salade d’algues, julienne de pommes & confit de citron")
Starter.create(name: "Tarte fine de canard", description: "Gésier, magret fumé, foie gras mi-cuit, accompagnés de ses purées de légumes & pickles")
Starter.create(name: "Bouillon Thaï", description: "Bouillon & dés de saumon mariné à la sauce soja")
Starter.create(name: "Poke Bowl", description: "Poke Bowl végétarien")

# Plats
boeuf = Dish.create(
    name_en: "Beef",
    name_fr: "Boeuf",
    description_en: "",
    description_fr: "",
    ask_roasting: true
)

volaille = Dish.create(
    name_en: "Poultry",
    name_fr: "Volaille",
    description_en: "",
    description_fr: ""
)

gambas = Dish.create(
    name_en: "Shrimp",
    name_fr: "Gambas",
    description_en: "",
    description_fr: ""
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
Dessert.create(name: "Verrine Coco", description: "noix de coco, ananas & patate douce")
Dessert.create(name: "Crème Brulée", description: "panais & cerfeuil tubéreux")
Dessert.create(name: "Mille Feuille", description: "vanille, banane & poivrons")
Dessert.create(name: "Tartelette carotte", description: "carotte")
