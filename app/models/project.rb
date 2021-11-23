class Project < ApplicationRecord
  has_one_attached :autocad_file
  serialize :dxf_layers, Hash

  validate :acceptable_autocad_file

  after_save :schedule_autocad_file_parse

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
      DxfReaderJob.set(wait: 2.seconds).perform_later(self.id)
    end
  end


end

#after_create_commit :parse_autocad_file, if: ->{autocad_file.attached?}

# private
# def parse_autocad_file
#   require "./lib/tasks/dxf2ruby"
#   pp "OH SHIT, HERE WE GO AGAIN!"
#   pp autocad_file
#   # autocad_file.open do |file|
#   file = autocad_file.open
#     pp file
#     dxf_parsed = JF::Dxf2Ruby.parse(file.path)
#   # end
#   dxf_parsed['ENTITIES'].each do |entity|
#     if entity[0] != 'POLYLINE'
#       if entity[10] != nil
#         case entity[0]
#         when 'VERTEX'
#           dxf_layers[entity[8]+entity[330]] ||= []
#           dxf_layers[entity[8]+entity[330]] << {
#             shape: entity[0],
#             id: entity[5],
#             x: entity[10],
#             y: entity[20],
#             z: entity[30]
#           } #layer name
#         when 'POINT'
#           dxf_layers[entity[8]] ||= []
#           dxf_layers[entity[8]] << {
#             shape: entity[0],
#             id: entity[5],
#             x: entity[10],
#             y: entity[20],
#             z: entity[30]
#           } #layer name
#         end
#       end
#     end
#   end
#   self.save!
# end
