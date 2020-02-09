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

end
