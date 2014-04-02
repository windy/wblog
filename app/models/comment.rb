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

  after_create do
    if ENV['SENDCLOUD_USER'].present? && ENV['ADMIN_USER'].present? && ENV['ADMIN_USER'] =~ /@/
      Rails.logger.info 'comment created, comment worker start'
      NewCommentWorker.perform_async(self.name, self.content, self.post.title, ENV['ADMIN_USER'])
    end
  end
end
