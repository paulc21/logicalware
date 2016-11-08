products = Product.create([
  { code: 1, name: "Scotland Flag", price: 20.0, vat_rate:"zero", discount: "{ \"count\":2, \"value\":-5 }" },
  { code: 2, name: "Children's Car Seat", price: 33.9, vat_rate: "reduced" },
  { code: 3, name: "Magnetic Wrist Band", price: 9.0, vat_rate: "standard" }
])
