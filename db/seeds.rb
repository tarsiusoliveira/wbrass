# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Project.create!(
  temperature: 21.0,
  pressure: 1.0,
  humidity: 40.0,
  sampleRate: 44100,
  irDuration: 3.0,
  maxReflections: 50,
  energyDecay: -60,
  numRays: 10000,
  clusterOrder: 3,
  diffuseProcessing: false,
  saveLateRays: false,
  artificialTail: true,
  saveDiffuseRays: false,
  auralization: false,
)
