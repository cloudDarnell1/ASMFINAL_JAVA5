Element.prototype.setAttributes = function (attrs) {
    for (var idx in attrs) {
        if ((idx === 'styles' || idx === 'style') && typeof attrs[idx] === 'object') {
            for (var prop in attrs[idx]) {
                this.style[prop] = attrs[idx][prop];
            }
        } else if (idx === 'html') {
            this.innerHTML = attrs[idx];
        } else {
            this.setAttribute(idx, attrs[idx]);
        }
    }
};

async function postData(url = '', data = {}) {
    // Default options are marked with *
    const response = await fetch(url, {
        method: 'POST', // *GET, POST, PUT, DELETE, etc.
        mode: 'cors', // no-cors, *cors, same-origin
        cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
        credentials: 'same-origin', // include, *same-origin, omit
        headers: {
            'Content-Type': 'application/json'
            // 'Content-Type': 'application/x-www-form-urlencoded',
        },
        redirect: 'follow', // manual, *follow, error
        referrerPolicy: 'no-referrer', // no-referrer, *no-referrer-when-downgrade, origin, origin-when-cross-origin, same-origin, strict-origin, strict-origin-when-cross-origin, unsafe-url
        body: JSON.stringify(data) // body data type must match "Content-Type" header
    });
    return response.json(); // parses JSON response into native JavaScript objects
};
window.cart = {
    _isOpenCart: false,
    sumArray: function (array, forView, templateName) {
        if (forView) {
            if (array.length <= 0) return '';
            return eval(`array.map(purchased => cart.${templateName}(purchased)).join('')`);
        }
        if (array.length <= 0) return 0;
        return array.reduce((accumulator, currentValue) => accumulator + currentValue);
    },
    getCart: function () {
        return localStorage.cart === undefined ? new Map() : new Map(JSON.parse(localStorage.cart));
    },
    getTotalMoney: function (carts = cart.getCart()) {
        return cart.sumArray(Array.from(carts.values()).map(purchased => purchased.amount * purchased.price))
    },
    getTotalMoneyProduct: function (product) {
        return (+product.price) * (+product.amount);
    },
    getPurchasedAmount: function (carts = cart.getCart()) {
        return cart.sumArray(Array.from(carts.values()).map(purchased => purchased.amount));
    },
    storeCart: function (cartTemp) {
        if (!cartTemp instanceof Map) return;
        localStorage.setItem('cart', JSON.stringify(Array.from(cartTemp.entries())));
    },
    getInCartProduct: function (productId) {
        return cart.getCart.get(productId);
    },
    setStoreObj: function (product, amount, size) {
        return {
            ...product,
            amount,
            size,
            getMoney: function () {
                return this.amount * +this.price
            }
        }
    },
    amountValidation: function (event) {
        let input = event.target;
        if (+input.value < 0) input.value = 0;
    },
    validateBeforeAdd: function (amount, size) {
        if (size === "Select Size") {
            alert("vui long chon size! ");
            return true;
        }
        if (amount === 0) {
            alert("vui long chon so luong! ");
            return true;
        }
        return false;
    }, setPurchasedAmountView: function () {
        let purchasedView = document.querySelector('#purchased');
        let amount = cart.getPurchasedAmount();
        if (amount <= 0) {
            purchasedView.innerText = '';
            return
        }
        ;
        cart.setPusrchasedAmountStyle(amount, purchasedView);
        purchasedView.innerText = amount;
    }, setPusrchasedAmountStyle: function (range, purchasedView) {
        if (range < 10) {
            purchasedView.setAttributes({
                'styles': {
                    "left": "50%",
                    "top": "60%",
                    "transform": "translate(-50%, -50%)",
                    "font-size": "16px",
                    "color": "#f44242",
                }
            })
        } else if (range >= 10 && range < 100) {
            purchasedView.setAttributes({
                'styles': {
                    "left": "50%",
                    "top": "62%",
                    "font-size": "14.5px",
                    "transform": "translate(-50%, -50%)",
                    "color": "#f44242",
                }
            })
        } else {
            purchasedView.setAttributes({
                'styles': {
                    "left": "50%",
                    "top": "62.2%",
                    "font-size": "11.3px",
                    "transform": "translate(-50%, -50%)",
                    "color": "#f44242",
                }
            })
        }
    }, setInCartTemplate: function (purchased) {
        return `<div class='incart-item' id ="${purchased.size}${purchased.id}">
					<div class='incart-item-img'> 
						<img src="/images/${purchased.img}"  id="incart-productImg">
					</div>
					<div class='incart-item-body'>
						<h2>${purchased.catname}</h2>
						<h5>${purchased.name}</h5>
						<h4>$${cart.getTotalMoneyProduct(purchased)}</h4>
						<input type="text" value="${purchased.size}" disabled >
						<input type="number" value="${purchased.amount}" id='incart-amount' onchange='let id = "${purchased.size}${purchased.id}";let size = "${purchased.size}"; cart.add(this,true,id,size,event)'>
						<button class="btn" onclick='let id ="${purchased.size}${purchased.id}";cart.remove(id)'>Remove From Cart</button>
					</div>
				</div>`
    }, setCartDetailTemplate: function (purchased) {
        return `
        <tr id="${purchased.size}${purchased.id}">
            <td>
                <div class="cart-info">
                    <img src="/images/${purchased.img}">
                    <div>
                        <p>${purchased.name}</p>
                        <small>Price: $${purchased.price}</small>
                        <br>
                        <button style="
                        border: none;
                        background-color: transparent;
                        color: #ff523b;
                        font-size: 12px;
                        cursor: pointer" 
                        onclick='let id ="${purchased.size}${purchased.id}";cart.remove(id,event)'>Remove</button>
                    </div>
                </div>
            </td>
            <td><input type="text" value="${purchased.amount}" disabled></td>
            <td>$${cart.getTotalMoneyProduct(purchased)}</td>
        </tr>
        `
    },
    loadView: function (carts, renderPoint = document.querySelector('.incart-container'), contentHeader = `<span class='closecart-btn' onclick='cart.close(this)'>x</span>`, templateName = 'setInCartTemplate') {
        return new Promise((resolve, reject) => {
            if (!carts instanceof Map) reject('data giỏ hàng sai kiểu dữ liệu type Map');
            else {
                if (!carts instanceof Map) console.error('data giỏ hàng sai kiểu dữ liệu type Map');
                let element = renderPoint;
                element.innerHTML = contentHeader;
                element.innerHTML += cart.sumArray(Array.from(carts.values()), true, templateName)
                cart.setPurchasedAmountView();
                resolve({carts, templateName});
            }
        })
    }, close: function (closebtn) {
        if (cart._isOpenCart) closebtn.parentElement.style.display = 'none'
    }, open: function () {
        temp = location.href.split('/');
        if (temp[temp.length - 1] === 'CartDetail') return;
        if (cart._isOpenCart) return
        cart._isOpenCart = true;
        let container = document.querySelector('.incart-container')
        container.style.display = 'block'
    },
    setCart: function (product, amount, size, isInCart) {
        let curCart = cart.getCart();
        let inCartProduct = curCart.get(`${size}${product.id}`)
        if (inCartProduct !== undefined) {
            if (isInCart !== undefined) inCartProduct.amount = amount;
            else inCartProduct.amount += amount;
        } else {
            curCart.set(`${size}${product.id}`, cart.setStoreObj(product, amount, size));
        }
        cart.storeCart(curCart);
        cart.loadView(curCart);
    }, add: function (element, isInCart, id, sizetemp, event) {

        if (isInCart) {
            if (+element.value < 0) {
                event.preventDefault();
                event.target.value = cart.getCart().get(id).amount;
                return;
            }
            if (+element.value === 0) return cart.remove(id);
            return cart.setCart(cart.getCart().get(id), +element.value, sizetemp, isInCart)
        }
        let product = element.parentElement.dataset
        let amount = +document.querySelector('#amount').value
        let size = document.querySelector('#size').value
        if (cart.validateBeforeAdd(amount, size)) return;
        cart.setCart(product, amount, size)
    }, remove: function (purchasedID, event, carts = cart.getCart()) {
        let curCart = carts;
        if (curCart.has(purchasedID)) {
            curCart.delete(purchasedID);
            if (event !== undefined || event !== null) {
                document.querySelector(`tr[id=${purchasedID}]`).remove();
                cart.cartDetailResult(curCart);
            }
        }
        if (cart._isOpenCart) {
            cart.storeCart(curCart);
            cart.loadView(curCart);
        } else cart.storeCart(curCart);
        cart.setPurchasedAmountView();
    }, setOrderObj: function (totalPurhased = 0, totalMoney = 0, listPurchased = []) {
        return {totalPurhased, totalMoney, listPurchased};
    }, payment: function () {

        let curCart = cart.getCart()

        if (curCart.size <= 0) return;

        const order = cart.setOrderObj(
            cart.getPurchasedAmount(),
            cart.getTotalMoney(),
            Array.from(curCart.values())
        )

        postData('http://localhost:8080/payment/check', order)
            .then(data => {
                let {msg, error} = data;
                if (error === false) {
                    localStorage.clear();
                    alert(msg)
                    location.href = '/';
                } else console.log('lam gi do neu thanh toan fail')
            }
        );
    }, cartDetailResult: function (carts) {
        let taxText = document.querySelector('#tax').innerText;
        document.querySelector('#cartTotalMoneyBeforeTax').innerText = cart.getTotalMoney(carts) + '$'
        document.querySelector('#cartTotalMoney').innerText = (cart.getTotalMoney(carts) + (carts.size === 0 ? 0 : +taxText.slice(0, taxText.length - 1))) + '$'
        document.querySelector('#cartTotalAmount').innerText = cart.getPurchasedAmount(carts) + '$'
    }
}