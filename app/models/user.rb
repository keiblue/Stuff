class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file( :avatar,
      styles: {medium: "300x300", thumb: "100x100"},
      default_url: "/images/:style/missing.jpg",
      default_style: :medium,
      :storage => :s3,
      :path => "/images/users/user_:user_id/:style/avatar.:extension"
 )
  Paperclip.interpolates :user_id  do |attachment, style|
    attachment.instance.id
  end
  validates_attachment_content_type :avatar, :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png)$/, :message => 'file type is not allowed (only jpeg/png/jpg images)'
  validates_attachment_size :avatar, :in => 0.megabytes..1.megabytes

end
