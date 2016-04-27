class Client < ActiveRecord::Base

  def client_name
    if self.first_name.empty?
      "Company"
    else
      self.first_name + " " + self.last_name
    end
  end

  def client_company
    if self.company_name.empty?
      "Individual"
    else
      self.company_name
    end
  end

end
