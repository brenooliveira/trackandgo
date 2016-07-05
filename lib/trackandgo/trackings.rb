module Trackings
  extend self

  @_trackings = {}
  attr_reader :_trackings

  def load!(filename, options = {})
    newsets = ::YAML::load_file(filename).extend DeepSymbolizable
    newsets = newsets.deep_symbolize
    newsets = newsets[options[:env].to_sym] if options[:env] && newsets[options[:env].to_sym]
    deep_merge!(@_trackings, newsets)
  end

  def deep_merge!(target, data)
    merger = proc{|key, v1, v2|
      Hash === v1 && Hash === v2 ? v1.merge(v2, &merger) : v2 }
    target.merge! data, &merger
  end

  def method_missing(name, *args, &block)
    @_trackings[name] || fail(NoMethodError, "Unknown tracking for #{name}", caller)
  end
end
