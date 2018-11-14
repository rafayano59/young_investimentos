class InvestimentosController < ApplicationController
  before_action :set_investimento, only: [:edit, :update, :show, :destroy]
  
  def index
    @investimentos = Investimento.all
  end
  
  def new
    @investimento = Investimento.new
  end
  
  def create
    @investimento = Investimento.new(investimento_params)
    if @investimento.valor < 500
      @investimento.nivel = 1
      @investimento.lucroporcentagem = 0.05
      @investimento.lucrovalor = @investimento.valor * 0.05
    elsif @investimento.valor >= 500 && @investimento.valor < 1000
      @investimento.nivel = 2
      @investimento.lucroporcentagem = 0.10
      @investimento.lucrovalor = @investimento.valor * 0.10
    elsif @investimento.valor >= 1000 && @investimento.valor <= 5000
      @investimento.nivel = 3
      @investimento.lucroporcentagem = 0.15
      @investimento.lucrovalor = @investimento.valor * 0.15
    end
    
    if @investimento.save
      flash[:notice] = "Seu investimento foi recebido! Agradecemos a confiança."
      redirect_to investimento_path(@investimento)
    else
      render 'new'
    end
  end
  
  def show

  end
  
  def edit

  end
  
  def update

    if @investimento.update(investimento_params)
      flash[:notice] = "Investimento atualizado"
      redirect_to investimento_path(@investimento)
    else
      render 'edit'
    end
  end
  
  def destroy
    
    @investimento.destroy
    flash[:notice] = "A exclusão do investimento foi sucedida"
    redirect_to investimentos_path
  end
  
  private
    def set_investimento
      @investimento = Investimento.find(params[:id])
    end
    def investimento_params
      params.require(:investimento).permit(:titulo, :valor)
    end
    
end
