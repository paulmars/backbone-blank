logDebug = false

$container = $(".container")

Page = Backbone.Model.extend
  defaults:
    copy: ''

PagesCollection = Backbone.Collection.extend
  model: Page
  url: '/api/pages.json'
  # localStorage: new Store('pages')

pages = new PagesCollection()
thePage = null

createDefaultPage = ->
  console.log "len", pages.length if logDebug
  if pages.length > 0
    console.log "found page" if logDebug
    thePage = pages.at(0)
    $container.html(thePage.get("copy"))
  else
    console.log "create page" if logDebug
    thePage = pages.create({
      copy: $container.html()
    })

postFetch = ->
  createDefaultPage()

saveText = ->
  console.log "save text", thePage
  thePage.set("copy", $container.html())
  thePage.save()

debouncedSave = _.debounce(saveText, 100)
$container.keyup debouncedSave

pageFetch = pages.fetch()
pageFetch.done postFetch
