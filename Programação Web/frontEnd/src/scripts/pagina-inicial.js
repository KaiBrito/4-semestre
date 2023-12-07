let recentLogin = window.localStorage.getItem('newLogin');


let card = document.getElementsByClassName('card')[0];

console.log(card);

function createCard(cardsData){
    let cardClone = card.cloneNode(true);
    cardClone.getElementsByTagName('img')[0].src = 'http://127.0.0.1:8080/' + cardsData.

    console.log(cardClone);
}

createCard();

if(recentLogin === 'true'){
    window.alert('O login foi realizado com sucesso! Bem-vindo(a)');
    window.localStorage.clear();
}