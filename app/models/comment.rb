class Comment < ApplicationRecord
  belongs_to :post
  validates_presence_of :post_id

  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: I18n.t('comment_attributes.email') }
  validates :content, presence: true

  def reply_emails
    Comment.where(post_id: self.post_id).collect(&:email).uniq - [ self.email ] - Subscribe.unsubscribe_list - [ ENV['ADMIN_USER'] ]
  end

  after_commit on: :create do
    if ENV['MAIL_SERVER'].present? && ENV['ADMIN_USER'].present? && ENV['ADMIN_USER'] =~ /@/ && ENV['ADMIN_USER'] != self.email
      Rails.logger.info 'comment created, comment worker start'
      NewCommentWorker.perform_async(self.id.to_s, ENV['ADMIN_USER'])
    end

    if ENV['MAIL_SERVER'].present?
      Rails.logger.info 'comment created, reply worker start'
      NewReplyPostWorker.perform_async(self.id.to_s)
    end
  end
end
