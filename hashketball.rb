require 'pry'

def game_hash

box_score = {
  :home => {:team_name => "Brooklyn Nets",
            :colors => ["Black", "White"],
            :players => {
              "Alan Anderson" => {
                :number => 0,
                :shoe => 16,
                :points => 22,
                :rebounds => 12,
                :assists => 12,
                :steals => 3,
                :blocks => 1,
                :slam_dunks => 1 },
              "Reggie Evans" => {
                :number => 30,
                :shoe => 14,
                :points => 12,
                :rebounds => 12,
                :assists => 12,
                :steals => 12,
                :blocks => 12,
                :slam_dunks => 7 
              },
              "Brook Lopez" => {
                :number => 11,
                :shoe => 17,
                :points => 17,
                :rebounds => 19,
                :assists => 10,
                :steals => 3,
                :blocks => 1,
                :slam_dunks => 15 
              },
              "Mason Plumlee" => {
                :number => 1,
                :shoe => 19,
                :points => 26,
                :rebounds => 12,
                :assists => 6,
                :steals => 3,
                :blocks => 8,
                :slam_dunks => 5
              },
              "Jason Terry" => {
                :number => 31,
                :shoe => 15,
                :points => 19,
                :rebounds => 2,
                :assists => 2,
                :steals => 4,
                :blocks => 11,
                :slam_dunks => 1
              }
            }
  },
  :away => {:team_name => "Charlotte Hornets",
            :colors => ["Turquoise", "Purple"],
            :players => {
              "Jeff Adrien" => {
                :number => 4,
                :shoe => 18,
                :points => 10,
                :rebounds => 1,
                :assists => 1,
                :steals => 2,
                :blocks => 7,
                :slam_dunks => 2
              },
              "Bismak Biyombo" => {
                :number => 0,
                :shoe => 16,
                :points => 12,
                :rebounds => 4,
                :assists => 7,
                :steals => 7,
                :blocks => 15,
                :slam_dunks => 10  
              },
              "DeSagna Diop" => {
                :number => 2,
                :shoe => 14,
                :points => 24,
                :rebounds => 12,
                :assists => 12,
                :steals => 4,
                :blocks => 5,
                :slam_dunks => 5 
              },
              "Ben Gordon" => {
                :number => 8,
                :shoe => 15,
                :points => 33,
                :rebounds => 3,
                :assists => 2,
                :steals => 1,
                :blocks => 1,
                :slam_dunks => 0
              },
              "Brendan Haywood" => {
                :number => 33,
                :shoe => 15,
                :points => 6,
                :rebounds => 12,
                :assists => 12,
                :steals => 22,
                :blocks => 5,
                :slam_dunks => 12  
              }
            }
  }
}

end


def num_points_scored(player_name)
  game_hash.each do |game_stats, team|
    team.each do |category, info|
      if info.include?(player_name)
        return game_hash[game_stats][category][player_name][:points]
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |game_stats, team|
    team.each do |category, info|
      if info.include?(player_name)
        return game_hash[game_stats][category][player_name][:shoe]
      end
    end
  end
end


def team_colors(team_name)
  final_colors = ""
  
  game_hash.each do |game_stats, team|

    if game_hash[game_stats].values.include?(team_name)
   
      team.each do |category, info|
      
        if category == :colors
          final_colors = info
        end
      end
    end 
  end
  final_colors
end 

def team_names
  final_names = []
  game_hash.each do |game_stats, team|
    team.each do |category, info|
      #binding.pry
      if category == :team_name
        final_names.push(info)
      end
    end
  end
  return final_names
end

def player_numbers(team_name)
  final_numbers = []
    game_hash.each do |game_stats, team|
      if game_hash[game_stats].values.include?(team_name)
        team.each do |category, info|
          if category == :players
            info.each do |player, number|
              number.each do |player_stat|
                if player_stat[0] == :number
                final_numbers.push(player_stat[1])
                end
              end
            end
          end
        end
      end
    end
  final_numbers.sort
end
  
def player_stats(player_name)
  game_hash.each do |game_stats, team|
    team.each do |category, info|
      if info.include?(player_name)
        return game_hash[game_stats][category][player_name]
      end
    end  
  end
end

def big_shoe_rebounds
  shoe_size = 0
  big_foot = ""
  game_hash.each do |game_stats, team|
    
    team.each do |category, info|
      if category == :players
        info.each do |player, number|
         binding.pry
          number.each do |player_stat, stat|
        
            #binding.pry
            if player_stat == :shoe
              if stat > shoe_size
              shoe_size = stat
              big_foot = player
              end
            end
          end
        end
       return game_hash[game_stats][category][big_foot][:rebounds]
      end
    end
  end
end









