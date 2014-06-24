require 'pry'
require 'chefspec'
require 'chefspec/berkshelf'
require 'chefspec/api'

include ChefSpec::API
ChefSpec::Berkshelf.setup!

def node_attributes
  @node_attributes ||= {}
end

def cookbook_name
  "ark"
end

def step_into
  { :step_into => [cookbook_name] }
end

def example_recipe
  @example_recipe
end

def chef_run
  @chef_run ||= ChefSpec::Runner.new(node_attributes.merge(step_into)).converge(example_recipe)
end

def current_resource
  @current_resource
end

def parse_resource(name)
  name.gsub(" ","_")
end

def parse_action(name)
  name == "created" ? "create" : name
end
