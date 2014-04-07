class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  field :content, :type => String
  field :email,	:type=>String

  belongs_to :post

  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: '地址无效' }
  validates :content, presence: true
  validates_presence_of :post_id

  def reply_emails
    Comment.where(post_id: self.post_id).where(:id.ne => self.id).collect(&:email).uniq
  end

  after_create do
    if ENV['SENDCLOUD_USER'].present? && ENV['ADMIN_USER'].present? && ENV['ADMIN_USER'] =~ /@/
      Rails.logger.info 'comment created, comment worker start'
      NewCommentWorker.perform_async(self.name, self.content, self.post.title, ENV['ADMIN_USER'])
    end

    if ENV['SENDCLOUD_USER'].present?
      Rails.logger.info 'comment created, reply worker start'
      reply_emails.each do |comment|
        next if Subscribe.unsubscribe?(email)
        NewReplyPostWorker.perform_async(self.name, self.post.title, self.content, self.post.id.to_s, email)
      end
    end
  end
end
