products = Product.create([
  { code: "001", name: "Scotland Flag", price: 20.0, vat_rate:"zero", discount: "{ \"count\":2, \"value\":-5 }" },
  { code: "002", name: "Children's Car Seat", price: 33.9, vat_rate: "reduced" },
  { code: "003", name: "Magnetic Wrist Band", price: 9.0, vat_rate: "standard" }
])
