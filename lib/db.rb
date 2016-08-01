require "logger"

module DB

  LOGGER = Logger.new(STDOUT)

  def self.seed(model, fields, values)
    begin
      result = model.import fields, values
      failed_instances = result.failed_instances.count
      DB::LOGGER.error "#{failed_instances} #{model.model_name} couldn't be created" if failed_instances > 0
      result
    rescue => e
      DB::LOGGER.error e
    end
  end

  def self.seed_from_file(path, model, fields)
    begin
      file = File.open(path)
      hash = JSON.parse(file.read)
      values = hash.map{ |s| s.values }
      seed(model, fields, values)
    rescue => e
      puts e
    end
  end

end
