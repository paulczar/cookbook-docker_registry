# Guardfile built by Meez ( http://github.com/paulczar/meez )
# for testing your chef cookbooks.

guard :rubocop do
  watch(%r{.+\.rb$})
  watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
end
