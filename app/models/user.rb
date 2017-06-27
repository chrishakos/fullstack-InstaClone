class User < ApplicationRecord
  validates :username, :session_token, presence: true
  validates :username, uniqueness: true
  validates :password, length: {minimum: 6, allow_nil: true}

  after_initialize :ensure_session_token

  has_many :likes
  has_many :photos
  has_many :comments

  has_many :followers,
  class_name: :Follow,
  foreign_key: :followee_id,
  primary_key: :id

  has_many :followings,
  class_name: :Follow,
  foreign_key: :follower_id,
  primary_key: :id


  has_attached_file :avatar, default_url: "mr_T.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


  attr_accessor :password

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token
    self.session_token = User.generate_session_token
    self.save!
    return self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil unless user
    user.password_is?(password) ? user : nil
  end

  def password_is? (password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end


  def current_user_follows(current_user)
    # debugger
    follows = false
    self.followers.each do |follow|
      if (follow.follower_id == current_user.id)
        follows = true
      end
    end
    return follows
 end

 def current_user_follow_id(current_user)
   id = nil
   self.followers.each do |follow|
     if (follow.follower_id == current_user.id)
       id = follow.id
     end
   end
     return id
 end

def get_user_photos(user)
  if(!user)
    return []
  end
  # debugger
  photos = Photo.where(user_id: user.id).to_a
  # photos_array = []
  # photos.each do |photo|
  #   debugger
  #   photo_obj = {}
  #
  #   photo_obj[caption] = photo.caption
  #   photo_obj[created_at] = photo.created_at
  #   photo_obj[created_at] = photo.create_at
  #   photo_obj[id] = photo.id
  #   photo_obj[user_id] = photo.user_id
  #   photo_obj[image_url] = image_path(photo.image.url)
  #
  #   photos_arr.unshift(photo_obj)
  # end
  return photos.reverse
end

  # def photo_likes_hash
  #   zipped_likes = likes.pluck(:photo_id).zip(likes)
  #   likes_hash = {}
  #
  #   zipped_likes.each do |(id, like)|
  #     likes_hash[id] = like
  #   end
  #
  #   likes_hash
  # end

end
