redis = require('redis').createClient()
csv = require "csv"
__ = require "../../vendor/underscore"

module.exports =
  storeCountry: (line) ->

  storePopulatedPlace: (line) ->
    data = line.split("\t")
    id = data[0]
    name = data[1]
    lon = data[4]
    lat = data[5]
    featurecode = data[7]
    state_id = data[10]
    population = data[14]
    country_iso = data[8]
  
  importData: (filename, importfunction) ->
    console.log("jdksjdkjK§")
    csv().fromPath filename,
      delimiter: "\t"
      escape: ""
    .transform (data) ->
      importfunction data
    .on "data", (data, index) ->
      importfunction data
    .on "end", (count) ->
      console.log "Number of lines: " + count
    .on "error", (error) ->
      console.log error.message
  storeCountryAndAdminDivision: (countrycode = "DE") ->
    console.log(process.env)
    importfunction = (data) ->
      doo = "DE"+":"+data[1]
      console.log(doo)
    @importData("./spec/fixtures/admin1CodesASCII.txt", importfunction)
