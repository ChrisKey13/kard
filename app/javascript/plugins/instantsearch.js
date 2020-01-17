const searchClient = algoliasearch('YourApplicationID', 'YourSearchOnlyAPIKey');

const search = instantsearch({
  indexName: 'demo_ecommerce',
  searchClient,
});

search.addWidgets([
instantsearch.widgets.searchBox({
  container: document.querySelector('#searchbox'),
}),

  instantsearch.widgets.hits({
    container: '#hits',
  })
]);

search.start();
