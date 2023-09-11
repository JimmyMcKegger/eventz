# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `CategoriesController`.
# Please instead update this file by running `bin/tapioca dsl CategoriesController`.

class CategoriesController
  sig { returns(HelperProxy) }
  def helpers; end

  module HelperMethods
    include ::Turbo::DriveHelper
    include ::Turbo::FramesHelper
    include ::Turbo::IncludesHelper
    include ::Turbo::StreamsHelper
    include ::ActionView::Helpers::CaptureHelper
    include ::ActionView::Helpers::OutputSafetyHelper
    include ::ActionView::Helpers::TagHelper
    include ::Turbo::Streams::ActionHelper
    include ::ActionText::ContentHelper
    include ::ActionText::TagHelper
    include ::Importmap::ImportmapTagsHelper
    include ::ActionController::Base::HelperMethods
    include ::ApplicationHelper
    include ::CategoriesHelper
    include ::EventsHelper
    include ::LikesHelper
    include ::RegistrationsHelper
    include ::SessionsHelper
    include ::UsersHelper

    sig { returns(T.untyped) }
    def current_user; end

    sig { params(user: T.untyped).returns(T.untyped) }
    def current_user?(user); end

    sig { returns(T.untyped) }
    def current_user_admin?; end
  end

  class HelperProxy < ::ActionView::Base
    include HelperMethods
  end
end
