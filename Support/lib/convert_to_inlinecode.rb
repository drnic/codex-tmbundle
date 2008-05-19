module ConvertToInlinecode
  extend self
  def run(current_line)
    return "" unless file_name = current_line.match(%r{\s*:code\s+(.*)})
    file_name = File.join root_path, file_name[1]
    ":inlinecode\n" +
      (File.read(file_name) rescue "") +
    "\n:endinlinecode\n"
  end

  # Use ENV['TM_PROJECT_DIRECTORY'] or else assume
  # that the root of the project is the parent folder of the current file
  def root_path
    ENV['TM_PROJECT_DIRECTORY'] || File.join(ENV['TM_DIRECTORY'], "..")
  end
end