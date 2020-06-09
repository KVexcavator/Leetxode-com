#coding: utf-8
# Дана строка s и словарь dict, содержащий некие слова. Определите, можно ли
# строку s сегментировать в последовательность разделенных пробелом слов,
# содержащихся в словаре dict.
# Пример: дано, s = «двадесятка», dict = [«два», «десятка», «девятка»]. Программа
# должна вернуть true , потому что «двадесятка» могут быть сегментированы как «два
# десятка».

s = "  дв  аде сятка   "
dict = ["два", "десятка", "девятка"]

def search_segment (str, arr)
  # блок подготовки строки
  str = str.gsub(/\s+/,'') if str.match?(/\s+/)

  arr.each_with_index do |w,i|
    # каждый член словаря захватываем, как регвыражение
    re = /#{Regexp.escape(w)}/ 
    # если есть совпадение в строке запускается рекурсия
    if re.match?(str)
      begin 
        m = re.match(str)
        # передаётся остаток строки и словоря
        if m.pre_match == ""
          search_segment m.post_match, arr
          arr.shift
          puts true if i>=1
        end 
      rescue SystemStackError
        puts "Error!"
      end 
    end
  end
end 

search_segment s, dict
