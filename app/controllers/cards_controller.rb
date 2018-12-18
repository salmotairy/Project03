class CardsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
    @cards = current_user.cards
  end

  def show
    @card = Card.find_by(id: params[:id])
  end

  def new
    @card = Card.new
  end

  def create
    card = Card.create(card_params)
    redirect_to card_path(card)
  end

  def edit
    @card = Card.find_by(id: params[:id])
  end

  def update
    card = Card.find_by(id: params[:id])
    card.update(card_params)
    redirect_to card_path(card)
  end

  def destroy
    card = Card.find_by(id: params[:id])
    card.destroy
    redirect_to cards_path # I need to check which card later after creating stacks
  end

  private

  def card_params
    params.require(:card).permit(:name, :company_name, :email, :phone_number, :role).merge(user_id: current_user.id)
  end
end

# Finish off the cards CRUD system
#  new
#  create
#  edit
#  update
#  destroy
