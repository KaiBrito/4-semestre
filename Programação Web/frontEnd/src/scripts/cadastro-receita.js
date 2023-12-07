let recipeForm = document.getElementById('recipe-register-form');
let contadorIngredientes = 1;


function getCategories(recipeCategoryInputs){
    let categories = '';
    recipeCategoryInputs.forEach((input) => {
        if(input.checked){
            categories += input.value + ';';
        }
    })

    if(categories.length !== 0){
        categories = categories.substring(0, categories.length - 1);
    }

    return categories;
}

function getIngredients(){
    let ingredientFields = recipeForm.getElementsByClassName('ingredient');
    let ingredientsString = '';
    let count = 0;


    for(let field of ingredientFields){
        ingredientsString += `${field.value}`;

        if(count === 2){
            count = 0;
            ingredientsString += ';';
        }else{
            count++;
            ingredientsString += ',';
        }
    }

    return ingredientsString.substring(0, ingredientsString.length - 1);
}

recipeForm.addEventListener('submit', (e) => {
    e.preventDefault();

    let data = new FormData()

    alert(e.target.images.files[0])

    data.append('author', e.target.author.value);
    data.append('recipeName', e.target.recipeName.value);
    data.append('description', e.target.description.value);
    data.append('images', e.target.images.files[0]);
    data.append('categories', getCategories(e.target.categorias))
    data.append('cookingMethod', e.target.method.value);
    data.append('nutricionalValue', e.target.nutricionalValue.value);
    data.append('portions', e.target.portions.value);
    data.append('preparationTime', e.target.preparationTime.value);
    data.append('preparationInstructions', e.target.preparationInstructions.value);
    data.append('ingredients', getIngredients());

    fetch('http://127.0.0.1:8080/app/recipes',{
        method : 'POST',
        body : data,
        credentials : 'include'
    })  
});

function adicionarIngrediente() {
    const listaIngredientes = document.getElementById('lista-ingredientes');

    const novoIngrediente = document.createElement('div');

    novoIngrediente.classList.add('ingredientes');

    novoIngrediente.innerHTML = `
        <label for="nomeIngrediente${contadorIngredientes}">Nome do Ingrediente:</label>
        <input type="text" id="nomeIngrediente${contadorIngredientes}" name="nomeIngrediente[]" class="ingredient" required>
        <label for="quantidade${contadorIngredientes}">Quantidade:</label>
        <input type="number" id="quantidade${contadorIngredientes}" name="quantidade[]" class="ingredient" required>
        <label for="unidade${contadorIngredientes}">Unidade:</label>
        <input type="text" id="unidade${contadorIngredientes}" name="unidade[]" class="ingredient" required>
    `;

    listaIngredientes.appendChild(novoIngrediente);

    // Fazendo ids únicos
    contadorIngredientes++;
}
