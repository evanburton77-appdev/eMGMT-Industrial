class AgentsController < ApplicationController


def show
  @the_agent = Agent.find_by!(id: params.fetch(:id))

end



end
