
require "./lib/tasks/dxf2ruby"
dxf = JF::Dxf2Ruby.parse("teste-thalles.dxf")
header = dxf['HEADER']
acad_version = header['$ACADVER'][1] # ==> "AC1015"
pp dxf["tables"]
