class Task < ApplicationRecord
    validates :title, presence: true
    validates :url, presence: true
    validates :status, presence: true
    
    validates :status, inclusion: { in: %w(pendente em_progresso concluida falha) }
    enum status: { pendente: "pendente", em_progresso: "em_progresso", concluida: "concluida", falha: "falha" }

    def self.ransackable_attributes(auth_object = nil)
        ["status"]
      end
end
