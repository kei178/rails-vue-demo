<template>
  <div>
    <button @click="fetchProducts()">Fetch Products</button>
    <button @click="deleteProducts()">Delete Products</button>
    <hr>
    <template v-if="productsPresent">
      <ul>
      　　<li v-for="product in products">
            {{ product.id }}: {{ product.name }}
          </li>
      </ul>
    </template>
    <template v-else>
      <p>Please fetch your products.</p>
    </template>
  </div>
</template>

<script>
    import axios from 'axios'
    axios.defaults.headers.get["Accepts"] = 'application/json'

    export default {
    data: function () {
      return {
        products: []
      }
    },
    computed: {
      productsPresent() {
        return this.products.length > 0
      }
    },
    methods:{
      fetchProducts() {
        axios.get('/api/v1/products', {
          params: {}
        })
        .then(res => {
          this.products = res.data['products']
        })
      },
      deleteProducts() {
        this.products = []
      }
    }
  }
</script>

<style scoped>
</style>
