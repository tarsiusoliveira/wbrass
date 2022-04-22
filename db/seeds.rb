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

Material.create!([
  {
    name:                   "Rough concrete",
    freq63hz:               0.02,
    freq125hz:              0.02,
    freq250hz:              0.03,
    freq500hz:              0.03,
    freq1k:                 0.03,
    freq2k:                 0.04,
    freq4k:                 0.07,
    freq8k:                 0.07,
    freq16k:                0.07,
    scattering_coefficient: 5
  },
  {
    name:                   "Standard brickwork",
    freq63hz:               0.05,
    freq125hz:              0.05,
    freq250hz:              0.04,
    freq500hz:              0.02,
    freq1k:                 0.04,
    freq2k:                 0.05,
    freq4k:                 0.05,
    freq8k:                 0.05,
    freq16k:                0.05,
    scattering_coefficient: 20
  },
  {
    name:                   "4mm glass",
    freq63hz:               0.30,
    freq125hz:              0.30,
    freq250hz:              0.20,
    freq500hz:              0.10,
    freq1k:                 0.07,
    freq2k:                 0.05,
    freq4k:                 0.02,
    freq8k:                 0.02,
    freq16k:                0.02,
    scattering_coefficient: 21
  }

  ]
)