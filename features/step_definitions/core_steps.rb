When(/^I converge (?:an?|the) recipe "(.*?)"$/) do |recipe|
  @example_recipe = recipe
end

Then(/^(?:I expect )?for that resource to notify the execute resource,(?: named)?\s?"(.*?)" to run$/) do |name|
  expect(current_resource).to notify("execute[#{name}]").to(:run)
end


Then(/^(?:I expect )?(?:an?|the) ([^,]+) resource,(?: named)?\s?"(.*?)",( not)? to(?: be)? (.+)$/) do |resource,name,negation,action|
  negation = negation =~ / ?not/
  expectation = negation ? "not_to" : "to"
  resource = parse_resource(resource)
  action = parse_action(action)

  @current_resource = chef_run.find_resource(resource,name)

  expect(chef_run).send(expectation,send("#{action}_#{resource}",name))
end