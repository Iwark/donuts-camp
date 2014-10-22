class Entry < ActiveRecord::Base

  belongs_to :user
  belongs_to :camp

  # status: 
  #    going:  参加予定
  #    cancel: キャンセル
  enum status: { going: 10, cancel: 20 }
  validates :status, inclusion: { in: %w(going cancel) }

end
