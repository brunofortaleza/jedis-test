module ApplicationHelper

  def flash_messages
    flash_messages = []

    flash.each do |key, value|
      if key == 'notice'
        flash_messages << "<div class='alert alert-success alert-dismissible fade show' role='alert'>#{value}<button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button></div>"
      elsif key == 'alert'
        flash_messages << "<div class='alert alert-danger alert-dismissible fade show' role='alert'>#{value}<button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button></div>"
      end
    end

    flash_messages.join.html_safe
  end

  def state_options
    [
      ['AC', 'Acre'],
      ['AL', 'Alagoas'],
      ['AP', 'Amapá'],
      ['AM', 'Amazonas'],
      ['BA', 'Bahia'],
      ['CE', 'Ceará'],
      ['DF', 'Distrito Federal'],
      ['ES', 'Espírito Santo'],
      ['GO', 'Goiás'],
      ['MA', 'Maranhão'],
      ['MT', 'Mato Grosso'],
      ['MS', 'Mato Grosso do Sul'],
      ['MG', 'Minas Gerais'],
      ['PA', 'Pará'],
      ['PB', 'Paraíba'],
      ['PR', 'Paraná'],
      ['PE', 'Pernambuco'],
      ['PI', 'Piauí'],
      ['RJ', 'Rio de Janeiro'],
      ['RN', 'Rio Grande do Norte'],
      ['RS', 'Rio Grande do Sul'],
      ['RO', 'Rondônia'],
      ['RR', 'Roraima'],
      ['SC', 'Santa Catarina'],
      ['SP', 'São Paulo'],
      ['SE', 'Sergipe'],
      ['TO', 'Tocantins']
    ]
  end
end
