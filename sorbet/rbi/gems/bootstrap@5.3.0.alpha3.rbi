# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `bootstrap` gem.
# Please instead update this file by running `bin/tapioca gem bootstrap`.

# source://bootstrap//lib/bootstrap/version.rb#3
module Bootstrap
  class << self
    # source://bootstrap//lib/bootstrap.rb#41
    def assets_path; end

    # Paths
    #
    # source://bootstrap//lib/bootstrap.rb#29
    def gem_path; end

    # @return [Boolean]
    #
    # source://bootstrap//lib/bootstrap.rb#54
    def hanami?; end

    # source://bootstrap//lib/bootstrap.rb#37
    def javascripts_path; end

    # Inspired by Kaminari
    #
    # source://bootstrap//lib/bootstrap.rb#9
    def load!; end

    # @return [Boolean]
    #
    # source://bootstrap//lib/bootstrap.rb#50
    def rails?; end

    # Environment detection helpers
    #
    # @return [Boolean]
    #
    # source://bootstrap//lib/bootstrap.rb#46
    def sprockets?; end

    # source://bootstrap//lib/bootstrap.rb#33
    def stylesheets_path; end

    private

    # source://bootstrap//lib/bootstrap.rb#69
    def register_hanami; end

    # source://bootstrap//lib/bootstrap.rb#60
    def register_rails_engine; end

    # source://bootstrap//lib/bootstrap.rb#64
    def register_sprockets; end
  end
end

# source://bootstrap//lib/bootstrap/version.rb#5
Bootstrap::BOOTSTRAP_SHA = T.let(T.unsafe(nil), String)

# source://bootstrap//lib/bootstrap/engine.rb#7
module Bootstrap::Rails; end

# source://bootstrap//lib/bootstrap/engine.rb#8
class Bootstrap::Rails::Engine < ::Rails::Engine
  class << self
    # source://activesupport/7.0.4.3/lib/active_support/callbacks.rb#68
    def __callbacks; end
  end
end

# source://bootstrap//lib/bootstrap/version.rb#4
Bootstrap::VERSION = T.let(T.unsafe(nil), String)
