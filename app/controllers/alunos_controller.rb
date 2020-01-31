class AlunosController < ApplicationController
    before_action :set_aluno, only: [:show, :edit, :update, :destroy]
    def index
        @alunos = Aluno.all
    end
    def show
    end
    def new
        @aluno = Aluno.new
    end
    
    def update
    end

    def destroy
    end

    def create
        @aluno = Aluno.new(aluno_params)
        #media = calc_media(@aluno.b1,@aluno.b2)
        media = (@aluno.b1+@aluno.b2)/2
        if media >= 7
            @status = "APROVADO"
        else 
            @status = "REPROVADO"
        end
        @aluno.media = media
        @aluno.status = @status
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
