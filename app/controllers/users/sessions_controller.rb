class Users::SessionsController < Devise::SessionsController
  def new
    super
  end
 
  def create
    super
  end
 
  def destroy
    entry = Entry.where(user_id: current_user.id, camp_id: 1).first
    if entry
      if entry.status != "cancel"
        entry.status = "cancel"
        entry.save
      end
    end
    super
  end
end