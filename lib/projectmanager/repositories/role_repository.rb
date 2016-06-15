class RoleRepository
  include Hanami::Repository

  def create_or_update(attrs)
    found = find(attrs.id)
    attrs = role_attributes(attrs)

    if found
      found.update(attrs)
      update found
    else
      create Role.new(attrs)
    end
  end

  private

  def role_attributes(attrs)
    attrs.to_h.slice(:name)
  end
end
