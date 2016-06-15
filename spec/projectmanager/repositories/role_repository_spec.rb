require 'spec_helper'

describe RoleRepository do
  before do
    clear_repositories
    @role = RoleRepository.new.create_or_update(build(:role, name: 'admin'))
  end

  after do
    clear_repositories
  end

  it 'creates a new role' do
    @role.name.must_equal 'admin'
  end

  it 'updates a role' do
    role = RoleRepository.new.find(@role.id)
    role.name = 'editor'
    role = RoleRepository.new.create_or_update(role)
    role.name.must_equal 'editor'
  end
end
