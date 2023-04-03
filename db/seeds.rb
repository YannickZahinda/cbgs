
# Create an Admin user
User.create!(
  email: 'admin@test.com',
  password: 'password@1',
  is_admin: true
)

# Create a Normal user
User.create!(
  email: 'yan@test.com',
  password: 'password@1',
  is_admin: false
)

10.times do |i|
  Teacher.create!(nom_complet: 'Rails Auto', addresse: "New Car #{i}", niveau_etude: "200#{i}", classe_enseignee: "5 eme", phone: "teacher@test.com")
end