User.create!(name: "Yosuke Narumi",
  email: "naru@naru.com",
  password:           "yosuke",
  password_confirmation:  "yosuke",
  admin: true)
  
User.create!(name: "ゲストユーザー",
  email: "gest_user@rerec.com",
  password:           "rerec12345",
  password_confirmation:  "rerec12345",
  admin: false)