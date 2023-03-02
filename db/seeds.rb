puts "destroying seeds"
Line.destroy_all
Node.destroy_all
Map.destroy_all
User.destroy_all

puts "creating seeds"
# Create users
user1 = User.create(name: "John Doe", email: "john.doe@example.com", password: "password")
user2 = User.create(name: "Jane Doe", email: "jane.doe@example.com", password: "password")
user3 = User.create(name: "Bob Smith", email: "bob.smith@example.com", password: "password")

# Create maps for each user
user1_maps = []
user2_maps = []
user3_maps = []

3.times do
  user1_maps << user1.maps.create(title: "Map for #{user1.name}")
  user2_maps << user2.maps.create(title: "Map for #{user2.name}")
  user3_maps << user3.maps.create(title: "Map for #{user3.name}")
end

# Create nodes and lines for each map
user1_maps.each do |map|
  # Create nodes
  node1 = map.nodes.create(label: "Node 1", x: 100, y: 100)
  node2 = map.nodes.create(label: "Node 2", x: 200, y: 100)
  node3 = map.nodes.create(label: "Node 3", x: 150, y: 200)

  # Create lines
  map.lines.create(parent_id: node1.id, child_id: node2.id)
  map.lines.create(parent_id: node2.id, child_id: node3.id)
  map.lines.create(parent_id: node1.id, child_id: node3.id)
end

user2_maps.each do |map|
  # Create nodes
  node1 = map.nodes.create(label: "Node A", x: 100, y: 100)
  node2 = map.nodes.create(label: "Node B", x: 200, y: 100)
  node3 = map.nodes.create(label: "Node C", x: 150, y: 200)

  # Create lines
  map.lines.create(parent_id: node1.id, child_id: node2.id)
  map.lines.create(parent_id: node2.id, child_id: node3.id)
  map.lines.create(parent_id: node1.id, child_id: node3.id)
end

user3_maps.each do |map|
  # Create nodes
  node1 = map.nodes.create(label: "Start", x: 100, y: 100)
  node2 = map.nodes.create(label: "Middle", x: 200, y: 100)
  node3 = map.nodes.create(label: "End", x: 150, y: 200)

  # Create lines
  map.lines.create(parent_id: node1.id, child_id: node2.id)
  map.lines.create(parent_id: node2.id, child_id: node3.id)
  map.lines.create(parent_id: node1.id, child_id: node3.id)
end


puts "seeding finished!"
