# ------------------------------------------------------------- #
# This function read the test data from the "roster.yml" file #
# @return value corresponding to the key                        #
# ------------------------------------------------------------- #

def read_config name
	path = absolutePath()
	path = path+"/support/"+"roster.yml"
	config = YAML.load_file(path)
	@title = config[name]
	return @title	
end

def absolutePath
  path = File.expand_path(File.dirname(File.dirname(__FILE__)))
  return path
end

