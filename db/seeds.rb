(1..100).each do |number|
  Message.create(title: 'test title ' + number.to_s, content: 'test content ' + number.to_s)
end