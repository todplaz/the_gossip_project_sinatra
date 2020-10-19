require 'bundler'
Bundler.require

class Gossip
	attr_accessor :mon_auteur,:ma_description
	
	def initialize (mon_auteur,ma_description)
		@mon_auteur = mon_auteur
		@ma_description = ma_description
	end

	def save 
		 CSV.open("./db/gossip.csv", "ab") do |csv|
    	csv << [self.mon_auteur, self.ma_description]
		end
	end

	def self.all
		all_gossips = []
		CSV.read("./db/gossip.csv").each do |csv_line|
		  all_gossips << Gossip.new(csv_line[0], csv_line[1])
		end
		return all_gossips
	  end

	  def self.find(id)
        data_base = CSV.read("./db/gossip.csv")
        return data_base[id]
    end
	

end


