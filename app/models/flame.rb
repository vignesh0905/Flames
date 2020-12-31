class Flame < ApplicationRecord

    validates :yourname, :crushname, presence:true

    before_save :set_result

    def set_result

        name1 = yourname.downcase
        name2 = crushname.downcase

        name1 = name1.gsub(" ","")
        name2 = name2.gsub(" ","")

        name1.each_char do |i|
            name2.each_char do |j|
                if i==j
                    name1 = name1.sub(i,"")
                    name2 = name2.sub(j,"")
                    break
                end
            end
        end

        count = (name1 + name2).length

        if (count >0)
            list1 = ["friend", "love", "affection", "marriage", "enemy", "sibblings"]
            while (list1.length() > 1)
                c = count%(list1.length())
                s_index = c-1
                if s_index >=0
                    left = list1[s_index+1,list1.length-1]
                    right = list1[0,s_index]
                    list1 = left + right
                else
                    list1 = list1[0,list1.length-1]
                end
            end
            self[:result] = list1[0]
        end
    end


end
