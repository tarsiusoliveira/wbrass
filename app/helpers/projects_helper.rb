module ProjectsHelper
    class FalseClass; def to_i; 0 end end
    class TrueClass; def to_i; 1 end end

    def txtFileMaker(project)

        filename = "Project_#{project.id}"
        File.open(filename, File::WRONLY|File::CREAT) do |f|
            f.write("<ENVIRONMENT>\n")
            f.write("TEMPERATURE =          #{project.temperature}\n")
            f.write("PRESSURE =             #{project.pressure}\n")
            f.write("HUMIDITY =             #{project.pressure}\n")
            f.write("</ENVIRONMENT>\n\n")
            f.write("<SIMULATION>\n")
            f.write("MAX_TIME =             #{project.irDuration}\n")
            f.write("STOP_DECAY =           #{project.energyDecay}\n")
            f.write("SAMPLE_RATE =          #{project.sampleRate}\n")
            f.write("CLUSTER_ORDER =        #{project.clusterOrder}\n")
            f.write("MAX_RAYTRAC_REF =      #{project.maxReflections}\n")
            f.write("SAVE_LATE_RAYS =       #{project.saveLateRays ? 1 : 0}\n")
            f.write("DIFFUSE_PROCESSING =   #{project.diffuseProcessing ? 1 : 0}\n")
            f.write("SAVE_DIFFUSE_RAYS =    #{project.saveDiffuseRays ? 1 : 0}\n")
            f.write("ARTIFICIAL_TAIL =      #{project.artificialTail ? 1 : 0}\n")
            f.write("AURALIZATION =         #{project.auralization ? 1 : 0}\n")
            f.write("</SIMULATION>\n\n")
            f.write("<LAYERS::SOURCE>")
            f.close()
        end      
    end
end
