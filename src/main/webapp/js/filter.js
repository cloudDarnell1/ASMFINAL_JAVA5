const baseUrl = window.location.origin;

const productContainer = document.querySelector('.products');

const filterBar = document.querySelector('input[type=range]');

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

    const  result = await fetch(baseUrl + "/products", {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })

    const html = await result.text()

    productContainer.innerHTML = html
};

filter();