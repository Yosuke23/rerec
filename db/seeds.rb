User.create!(name: "Yosuke",
  email: "yosuke612@gmail.com",
  password:           "yosuke",
  password_confirmation:  "yosuke",
  admin: true)
  
User.create!(name: "ゲストユーザー",
  email: "gest_user@rerec.com",
  password:           "rerec12345",
  password_confirmation:  "rerec12345",
  admin: false)