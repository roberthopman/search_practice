groups = Array.new(4){(0...4).map{(rand(10)) }.join}
groups.each{ |title| 
  Group.create(title: title, expiration_date: rand(10).weeks.ago, status: rand(2)) 
}

entries = Array.new(20){rand(1000)}
entries.each{ |title| 
  Entry.create(title: title, expiration_date: rand(10).weeks.ago, status: rand(2), group_id: Group.all.offset(rand(4)).first.id) 
}
