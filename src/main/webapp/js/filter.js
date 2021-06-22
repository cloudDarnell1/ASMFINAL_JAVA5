const baseUrl = window.location.origin;

const productContainer = document.querySelector('.products');

const filterBar = document.querySelector('input[type=range]');

const btnSearch = document.querySelector('.search-btn')

const inputSearch = document.querySelector('input[name=keywords]')

btnSearch.addEventListener('click', async function () {
    await callApiAndInner(baseUrl+"/product/search?keywords="+inputSearch.value)
})

inputSearch.addEventListener('keypress',  async function (event) {
    if (event.keyCode === 13) {
        await callApiAndInner(baseUrl+"/product/search?keywords="+inputSearch.value)
    }
})

const data = {
    from: 10,
    to: 10000000
}

if (filterBar) {
    filterBar.addEventListener('change',  async function (event) {
        data.from = parseInt(filterBar.value)
        await filter()
    })
}

async function filter() {

    if (filterBar) {
        data.from = parseInt(filterBar.value)
    }

    await callApiAndInner(baseUrl + "/products")

};

async function callApiAndInner (url) {
    const  result = await fetch(url, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })

    const html = await result.text()

    productContainer.innerHTML = html
}

filter();