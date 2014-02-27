require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
test "A user should enter a first name" do
  user = User.new
  assert !user.save
  assert !user.errors[:firstName].empty?
end

test "A user should enter a last name" do
  user = User.new
  assert !user.save
  assert !user.errors[:lastName].empty?
end

test "A user should enter a profile name" do
  user = User.new
  assert !user.save
  assert !user.errors[:profileName].empty?
end

test "A users profile name is unique" do
  user = User.new
  user.profileName = users(:test).profileName
  assert !user.save
  assert !user.errors[:profileName].empty?
end

test "A users profile name has no spaces" do
  user = User.new
  user.profileName = "My profile"

  assert !user.save
  assert !user.errors[:profileName].empty?
  assert  user.errors[:profileName].include?("Must be formatted correctly.")
end

end
