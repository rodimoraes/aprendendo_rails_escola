class ClassesController < ApplicationController
    before_action :set_classe, only: [:show, :edit, :update, :destroy]
    
    def index
        @classes = Classe.all
    end

    def new
        @classe = Classe.new
    end

    def create
        @classe = Classe.new(classe_params)
        respond_to do |format|
        if @classe.save
            format.html{redirect_to @classe,notice: 'Classe cadastrado com sucesso!'}
            format.json{render :show, status: :created, location: @classe }
        else
            format.html{render :new}
            format.json{render json: @classe.errors, status: :unprocessable_entity}
        end
    end
end

    def show
    
    end
    def edit
    
    end
    def update
        respond_to do |format|
            if @classe.update (classe_params)
                format.html {redirect_to @classe, notice: 'Classe atualizada com sucesso!'}
                format.json {render :show,status: :ok, location: @classe}
            else
                format.html {render :edit}
                format.json {render json: @classe.erros, status: :unprocessable_entity}
            end
        end
    end

    def destroy
        @classe.destroy
        respond_to do |format|
        format.html {redirect_to classes_path,notice: 'Classe excluida com sucesso!'}
        format.json {head :no_content}
        end
    end



    private 
    def set_classe
        @classe = Classe.find(params[:id])
    end

    def classe_params
        params.require(:classe).permit(:nome)
    end
end
