json.extract! project, :id, :temperature, :pressure, :humidity, :sampleRate, :irDuration, :maxReflections, :energyDecay, :numRays, :clusterOrder, :diffuseProcessing, :saveLateRays, :artificialTail, :saveDiffuseRays, :auralization, :created_at, :updated_at
json.url project_url(project, format: :json)
