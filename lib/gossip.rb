require 'bundler'
Bundler.require

class Gossip

  attr_accessor  :author, :content, :id

  #On initialize l'auteur et le content
  def initialize(author, content)
    @author = author
    @content = content
  end

  #on enregistre dans un array la cle auteur et la valeur content
  def save 
    CSV.open("/Users/emma/Desktop/THP/1910_hello_wolrd_sinatra/the_gossip_project_sinatra/db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all 
    all_gossips = [] #on initialise un array vide
      # va chercher chacune des lignes du csv do
    CSV.read("./db/gossip.csv").each do |csv_line|
      # crée un gossip avec les infos de la ligne
      all_gossips << Gossip.new(csv_line[0],csv_line[1])
    end
      # all_gossips << gossip qui vient d'être créé
    # end
    return all_gossips #on retourne un array rempli d'objets Gossip 

  end

  #on affiche les id  de la base de donnees
  def self.find(id)
    data_base = CSV.read("./db/gossip.csv")
    return data_base[id]
  end

end