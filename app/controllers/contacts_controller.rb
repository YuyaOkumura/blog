class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    add_breadcrumb 'お問い合わせ', new_contact_path

    set_meta_tags(
      title: 'お問い合わせ',
      description: 'お問い合わせページです。今後、運用の参考となるご意見をお待ちしております。'
    )
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      result = @contact
      text =
        "ユーザー名 : [#{@contact.user_name}]
ご意見 : [#{@contact.title}]
内容 : [#{@contact.content}]"
      slack_notify(text)
    else
      result = false
    end
    render json: result
  end

  private
    def contact_params
      params.require(:contact).permit(:user_name, :title, :content)
    end

    def slack_notify(text, channel: "#901_blog_notification")
      Rails.logger.info "notified | #{text}"
      webhook = "https://hooks.slack.com/services/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"
      notifier = Slack::Notifier.new webhook, channel: channel
      notifier.ping "#{text}
#{Rails.env}環境からの通知です"
    end
end
