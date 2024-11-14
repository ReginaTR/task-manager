class Task < ApplicationRecord
    enum status: { pendente: 0, em_progresso: 1, concluida: 2, falha: 3 }

    validates :title, presence: true
    validates :url, presence: true
end
