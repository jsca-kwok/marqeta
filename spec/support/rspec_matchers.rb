RSpec::Matchers.define :have_const do |field|
  match do |object_instance|
    object_instance.const_defined?(field)
  end
end