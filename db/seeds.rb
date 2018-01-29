# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Entrées
Starter.create(name: "Tataki de thon", description: "Tataki de thon, salade d’algues, julienne de pommes & confit de citron")
Starter.create(name: "Tarte fine de canard", description: "Gésier, magret fumé, foie gras mi-cuit, accompagnés de ses purées de légumes & pickles")
Starter.create(name: "Bouillon Thaï", description: "Bouillon & dés de saumon mariné à la sauce soja")
Starter.create(name: "Poke Bowl", description: "Poke Bowl végétarien")

# Plats
boeuf = Dish.create(name: "Boeuf", description: "", ask_roasting: true)
volaille = Dish.create(name: "Volaille", description: "")
gambas = Dish.create(name: "Gambas", description: "")

# Modes de cuissons
papillote = Baking.create(name: "Papilote", description: "", ingredient: "Légumes cuit sous vide (pomme de terre, carotte, poivron rouge, oignon, céleri branche)")
fusio = Baking.create(name: "Fusio", description: "", ingredient: "Potatoes de pommes de terre, patate douce & céleri, parfumées aux herbes de Provence")
wok = Baking.create(name: "Wok", description: "", ingredient: "Nouilles chinoise, légumes & sauce soja")

# Marinades
Marinade.create(name: "", description: "Marinade sauce saté & paprika", baking: papillote, dish: boeuf )
Marinade.create(name: "", description: "Marinade lait de coco & curry", baking: papillote, dish: volaille)
Marinade.create(name: "", description: "Marinade gingembre & citron vert", baking: papillote, dish: gambas)
Marinade.create(name: "", description: "Marinade huile d’olive, thym & ail", baking: fusio, dish: boeuf)
Marinade.create(name: "", description: "Marinade huile d’olive & jus de citron vert", baking: fusio, dish: volaille)
Marinade.create(name: "", description: "Marinade huile d’olive & Martini rouge", baking: fusio, dish: gambas)

# Desserts
Dessert.create(name: "Verrine Coco", description: "noix de coco, ananas & patate douce")
Dessert.create(name: "Crème Brulée", description: "panais & cerfeuil tubéreux")
Dessert.create(name: "Mille Feuille", description: "vanille, banane & poivrons")
Dessert.create(name: "Tartelette carotte", description: "carotte")
