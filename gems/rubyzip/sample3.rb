require 'zip'
require 'pry'

def uncompress(path, outpath)
  entrys = []
  Dir.mkdir(outpath) unless Dir.exist?(outpath)
  # 2つ目の引数はoffset
  Zip::InputStream.open(path, 0) do |input|
    # get_next_entryするとinputのoffset（ポインタ）が動く
    while (entry = input.get_next_entry)
      # 書き出し先を作る
      save_path = File.join(outpath, entry.name)
      File.open(save_path) do |wf|
        # get_next_entryでポインタが動いているので、毎回input.readでOK
        wf.puts(input.read)
      end
      entrys << save_path
    end
  end
  # 解凍されたファイルたちを返却する
  entrys
end
