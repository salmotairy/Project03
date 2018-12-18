class StacksController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
    @stacks = Stack.all
  end

  def show
    @stack = Stack.find_by(id: params[:id])
  end

  def new
    @stack = Stack.new
    all_cards = Card.all
    @not_my_cards = []
    all_cards.each do |c|
      if c.user.id != current_user.id
        @not_my_cards.push c
      end
    end
  end

  def create
    stack = Stack.create(stack_params)
    redirect_to stack_path(stack)
  end

  def edit
    @stack = Stack.find_by(id: params[:id])
    all_cards = Card.all
    @not_my_cards = []
    all_cards.each do |c|
      if c.user.id != current_user.id
        @not_my_cards.push c
      end
    end
  end

  def update
    stack = Stack.find_by(id: params[:id])
    stack = Stack.create(stack_params)
    redirect_to stack_path(stack)
  end

  def destroy
    stack = Stack.find_by(id: params[:id])
    stack.destroy
    redirect_to stacks_path
  end

  private

  def stack_params
    params.require(:stack).permit(:name, card_ids: []).merge(user_id: current_user.id)
  end
end
