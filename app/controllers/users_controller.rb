class UsersController < ApplicationController


def show
  @the_user = User.find_by!(id: params.fetch(:id))

end



end
