
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
  Teacher.create!(nom_complet: 'Arsene Jiro', addresse: "Kibati N0 #{i}", niveau_etude: "#{i}e de licence", classe_enseignee: "#{i} eme", phone: "090#{i}898#{i}#{i}82")
end

3.times do |i|
  Communique.create!(titre: 'Inscriptions', description: "Cher parent numero 1#{i} sachez que les inscription vont s'arreter bientot et les places sont limitees")
end

3.times do |i|
  Message.create!(name: 'Inscriptions', titre: "Eleve handicapes", message: "Pourrais je avoir des informations sur les eleves handicapes ?")
end

4.times do |e|
  Event.create!(date: "2023-05-1#{e}-",title: "Proclammation", description: "Le dimanche, chaque eleve vient avec son parent" )
end