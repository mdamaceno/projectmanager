collection :roles do
  entity     Role
  repository RoleRepository

  attribute :id,   String
  attribute :name, String
end
