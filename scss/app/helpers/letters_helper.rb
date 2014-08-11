module LettersHelper
  def format_letter(body)
    body.gsub(/\n/, '<br>')
  end
end
