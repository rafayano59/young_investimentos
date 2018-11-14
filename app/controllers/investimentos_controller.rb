class InvestimentosController < ApplicationController
  before_action :set_investimento, only: [:show, :edit, :update, :destroy]

  # GET /investimentos
  # GET /investimentos.json
  def index
    @investimentos = Investimento.all
  end

  # GET /investimentos/1
  # GET /investimentos/1.json
  def show
  end

  # GET /investimentos/new
  def new
    @investimento = Investimento.new
  end

  # GET /investimentos/1/edit
  def edit
  end

  # POST /investimentos
  # POST /investimentos.json
  def create
    @investimento = Investimento.new(investimento_params)

    respond_to do |format|
      if @investimento.save
        format.html { redirect_to @investimento, notice: 'Investimento was successfully created.' }
        format.json { render :show, status: :created, location: @investimento }
      else
        format.html { render :new }
        format.json { render json: @investimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /investimentos/1
  # PATCH/PUT /investimentos/1.json
  def update
    respond_to do |format|
      if @investimento.update(investimento_params)
        format.html { redirect_to @investimento, notice: 'Investimento was successfully updated.' }
        format.json { render :show, status: :ok, location: @investimento }
      else
        format.html { render :edit }
        format.json { render json: @investimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /investimentos/1
  # DELETE /investimentos/1.json
  def destroy
    @investimento.destroy
    respond_to do |format|
      format.html { redirect_to investimentos_url, notice: 'Investimento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investimento
      @investimento = Investimento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def investimento_params
      params.require(:investimento).permit(:titulo, :nivel, :valor, :lucro-porcentagem, :lucro-valor, :dataretirada)
    end
end
