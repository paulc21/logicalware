# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

products = Product.create([
  { code: 1, name: "Scotland Flag", price: 20.0, vat_rate:"zero" },
  { code: 2, name: "Children's Car Seat", price: 33.9, vat_rate: "reduced" },
  { code: 3, name: "Magnetic Wrist Band", price: 9.0, vat_rate: "standard" }
])
