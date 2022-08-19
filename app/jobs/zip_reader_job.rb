class ZipReaderJob < ApplicationJob
  queue_as :default

  def perform(project_id)
    require 'rubygems'
    require 'zip'

    project = Project.find(project_id)
    acd = ActiveStorage::Blob.service.send(:path_for, project.results_file.blob.key)

    file_content = {}

    Zip::File.open("#{acd}") { |zip_file|
      zip_file.each { |f|
        pp "leu o arquivo"
        f_path = File.join("project_#{project_id}", f.name)
        FileUtils.mkdir_p(File.dirname(f_path))
        zip_file.extract(f, f_path) unless File.exist?(f_path)
  
        file_content[f.name] ||= []
        file_content[f.name] << {content: f.get_input_stream.read}
      }
    }
    project.update_columns(results: file_content)

    project.results.each do |name, content|
      Report.find_or_create_by(filename:name, project_id: project_id).update_columns(content:content[0].values.first)
    end
  end
end
