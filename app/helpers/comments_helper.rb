module CommentsHelper
  def get_time comment_time
    time_now = Time.now
    time_now.day - comment_time.day
  end
end
