class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hash = 0
    i = 1
    self.each do |ele|
      if ele.is_a?(Integer)
        hash += (ele ^ i**2).hash
        i += 1
      elsif ele.is_a?(String)
        hash += ele.hash
        i += 1
      end
    end
    hash
  end
end

class String

  def hash
    hash = 0
    chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ /.,1234567890-=`!@#$%^&*()_+~|}{[];'?><"
    self.each_char.with_index do |char, i|
      hash += (chars.index(char) ^ i**2).hash
    end
    hash
  end
  
end

class Hash
  def hash
    keys = self.keys.sort
    values = self.values.sort
    keys.hash + values.hash
  end
end
