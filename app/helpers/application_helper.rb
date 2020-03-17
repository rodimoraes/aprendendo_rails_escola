module ApplicationHelper
    def format_data (data)
        data.strftime("%d/%m/%Y")
    end
    
    def classe_identifica(id)
        classes = Classe.all 
        classes.each do |classe|
            if classe.id == id
               return classe.nome
            else
                "Classe Não Cadastrada"
            end
          end
    end

    def aprovacao(status)
        if status == true
            return 'Aprovado'
        else
            return 'Reprovado'
    end
end


    def format_telefone(telefone)
        tel = ''
        telefone = telefone.to_s
        tel << '('+ telefone[0..1]
        tel << ')'+ telefone[2..6]
        tel << '-'+ telefone[7..10]
        return tel
    
    end

end
