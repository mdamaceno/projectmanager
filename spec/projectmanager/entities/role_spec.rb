require 'spec_helper'

describe Role do
  it 'can be initialised with its attributes' do
    role = Role.new(name: 'admin')
    role.name.must_equal 'admin'
  end
end
