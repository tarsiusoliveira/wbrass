module ProjectsHelper

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
            
            f.write("<LAYERS::SOURCE>\n")
            if project.sources.exists?
                project.sources.each do |s|
                    f.write("#{s.name} #{s.directionality} #{s.potency} #{s.freq63hz} #{s.freq125hz} #{s.freq250hz} #{s.freq500hz} #{s.freq1khz} #{s.freq2khz} #{s.freq4khz} #{s.freq8khz} #{s.freq16khz} \n")
                end
            end
            f.write("</LAYERS::SOURCE>\n\n")

            f.write("<SOURCES>\n")
            if project.sources.exists?
                project.sources.each do |s|
                    Source.all.where(name: s.name).each do |su|
                        f.write("#{su.x} #{su.y} #{su.z} #{su.numRays} #{su.rotAz} #{su.rotEl} #{su.spl1m} #{su.name}\n")
                    end
                end
            end
            f.write("</SOURCES>\n\n")

            f.write("<LAYERS::RECEIVER>\n")
            if project.receivers.exists?
                project.receivers.each do |r|
                    f.write("#{r.name}\n")
                end
            end
            f.write("</LAYERS::RECEIVER>\n\n")

            f.write("<RECEIVERS>\n")
            if project.receivers.exists?
                project.receivers.each do |r|
                    Receiver.all.where(name: r.name).each do |ru|
                        f.write("#{ru.x} #{ru.y} #{ru.z} #{ru.reception_ray} #{ru.rotation} #{ru.name}\n")
                    end
                end
            end
            f.write("</RECEIVERS>\n\n")
            
            f.write("<MATERIALS>\n")
            if project.plans.exists?
                project.plans.each do |p|
                    if p.material != nil
                        m = Material.find_by(name: p.material)
                        f.write("#{m.name} #{m.freq63hz} #{m.freq125hz} #{m.freq250hz} #{m.freq500hz} #{m.freq1k} #{m.freq2k} #{m.freq4k} #{m.freq8k} #{m.freq16k} #{m.scattering_coefficient}\n")
                    end
                end
            end
            f.write("</MATERIALS>\n\n")
            
            f.write("<LAYERS::PLANE>\n")
            if project.plans.exists?
                project.plans.each do |p|
                    f.write("#{p.name} #{p.material}\n")
                end
            end
            f.write("</LAYERS::PLANE>\n\n")

            f.write("<LAYERS::COLOR>\n")
            if project.plans.exists?
                project.plans.each do |p|
                    colr = []
                    if p.color != nil
                        colr << p.color[1..2].hex
                        colr << p.color[3..4].hex
                        colr << p.color[5..6].hex
                        f.write("#{p.name} #{colr[0]} #{colr[1]} #{colr[2]}\n")
                    end
                end
            end
            f.write("</LAYERS::COLOR>\n\n")

            f.write("<PLANES>\n")
            if project.plans.exists?
                project.plans.each do |p|
                    f.write("#{p.vertices} #{p.xyz} #{p.xyz} #{p.name}\n")
                end
            end
            f.write("</PLANES>\n\n")

            f.close()
        end      
    end
end
