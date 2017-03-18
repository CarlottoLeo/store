class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  def index
    @q      = Person.ransack(params[:q])
    @people = @q.result(distinct: true).order(name: :asc)
    @people = @people.paginate(page: params[:page], per_page: params[:per_page])
    respond_to do |format|
      format.html
      format.json
      format.pdf { render template: 'people/report', pdf: 'report' }
    end
    authorize @people
  end

  def show
    authorize @person
  end

  def new
    @person = Person.new

    authorize @person
  end

  def edit
    authorize @person
  end

  def create
    @person         = Person.new(person_params)
    @person.address = Address.new(person_params[:address])

    authorize @person

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @person

    respond_to do |format|
      if @person.update(person_params)
        # @person.address = Address.new(person_params[:address])
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @person

    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_person
    @person = Person.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def person_params
    params.require(:person).permit(
      :name, :cpf, :email, :profession,
      :address, :number, :district, :country, :cep, :city, :state
    )
  end
end
