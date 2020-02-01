class AlunosController < ApplicationController
    before_action :set_aluno, only: [:show, :edit, :update, :destroy]
    #metodos internos
    def calc_media(b1,b2)
        media = (b1 + b2) /2
        return media
    end

    def status_atualiza(calc_media)
        if calc_media >=7
            status = 'APROVADO'
        else
            status = 'REPROVADO'
        end
        return status
    end    

    #Fim metodos internos

    
    def index
        @alunos = Aluno.all
    end

    def show
    end

    def new
        @aluno = Aluno.new
    end
    
    def update
        respond_to do |format|
            if @aluno.update (aluno_params)
                media = calc_media(@aluno.b1,@aluno.b2)
                status = status_atualiza(media)
                @aluno.update_attribute(:media, media)
                @aluno.update_attribute(:status, status)
                format.html {redirect_to @aluno, notice: 'Aluno atualizado com sucesso!'}
                format.json {render :show,status: :ok, location: @aluno}
            else
                format.html {render :edit}
                format.json {render json: @aluno.erros, status: :unprocessable_entity}
            end
        end
    end

    def destroy
        @aluno.destroy
        respond_to do |format|
            format.html {redirect_to alunos_path,notice: 'Aluno excluido com sucesso!'}
            format.json {head :no_content}
        end
    end


    def create
        @aluno = Aluno.new(aluno_params)
        media = calc_media(@aluno.b1,@aluno.b2)
        status = status_atualiza(media)
        @aluno.media = media
        @aluno.status = status
        respond_to do |format|
        if @aluno.save
            format.html{redirect_to @aluno,notice: 'Aluno cadastrado com sucesso!'}
            format.json{render :show, status: :created, location: @aluno }    
        else
            format.html{render :new}
            format.json{render json: @aluno.errors, status: :unprocessable_entity}
        end
    end
end
    
    private 
    def set_aluno
        @aluno = Aluno.find(params[:id])
    end

    def aluno_params
        params.require(:aluno).permit(:nome,:classe,:endereco,:data_nasc,:b1,:b2)
    end
    
end



