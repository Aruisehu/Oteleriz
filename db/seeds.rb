# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Starter.create(name: "Tataki de thon", description: "Tataki de thon, salade d’algues, julienne de pommes & confit de citron")
Starter.create(name: "Tarte fine de canard", description: "Gésier, magret fumé, foie gras mi-cuit, accompagnés de ses purées de légumes & pickles")
Starter.create(name: "Bouillon Thaï", description: "Bouillon & dés de saumon mariné à la sauce soja")
Starter.create(name: "Poke Bowl", description: "Poke Bowl végétarien")

Dish.create(name: "Boeuf", description: "", ask_roasting: true)
Dish.create(name: "Volaille", description: "")
Dish.create(name: "Gambas", description: "")

Dessert.create(name: "Verrine Coco", description: "noix de coco, ananas & patate douce")
Dessert.create(name: "Crème Brulée", description: "panais & cerfeuil tubéreux")
Dessert.create(name: "Mille Feuille", description: "vanille, banane & poivrons")
Dessert.create(name: "Tartelette carotte", description: "carotte")
