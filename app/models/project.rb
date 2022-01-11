class Project < ApplicationRecord
  has_one_attached :autocad_file
  serialize :dxf_layers, Hash

  validate :acceptable_autocad_file

  after_save :schedule_autocad_file_parse
  has_many :sources

  def acceptable_autocad_file
    return unless autocad_file.attached?

    unless autocad_file.byte_size <= 1.megabyte
      errors.add(:autocad_file, "is to big")
    end

    acceptable_type = ["image/vnd.dxf"]
    unless acceptable_type.include?(autocad_file.content_type)
      errors.add(:autocad_file, "must be a DXF file")
    end
  end

  private
  def schedule_autocad_file_parse
    if self.autocad_file.attached?
      DxfReaderJob.set(wait: 3.seconds).perform_later(self.id)
    end
  end


end
