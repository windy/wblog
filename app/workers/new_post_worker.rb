class NewPostWorker
  include Sidekiq::Worker

  sidekiq_retry_in do |count|
    3
  end

  def perform(post_id)
    Subscribe.subscribe_list.each do |email|
      Rails.logger.info "new post #{post_id}, send to #{email}"
      PostMailer.new(post_id.to_s, email).deliver
    end
  end
end

