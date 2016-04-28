# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class CommentChannel < ApplicationCable::Channel
  def subscribed
    stream_from "comment_post_#{params[:post_id]}"
  end
end
