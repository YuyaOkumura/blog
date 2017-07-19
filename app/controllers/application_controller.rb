class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_tags
  before_action :set_base_breadcrumb
  before_action :set_archives

  before_action do
    case
    when request.user_agent.present? && (request.user_agent.include?('iPhone') || request.user_agent.include?('Android'))
      request.variant = :mobile
    end
  end

  def set_tags
    @default_tags = Tag.limit(5)
  end

  def set_base_breadcrumb
    add_breadcrumb 'ホーム', root_path
  end

  def set_archives
    archives = Article.group('YEAR(created_at)').group('MONTH(created_at)').count
    @archives = archives.map { |archive| [archive[0].join, archive[1]] }
  end
end
