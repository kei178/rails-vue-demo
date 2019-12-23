<template>
  <div>
    <span>Count: {{ $store.state.counter }}</span>
    <button @click="increment()">Count Up</button>
    <button @click="reset()">Reset</button>
    <hr>
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
    methods: {
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
      },
      increment() {
        this.$store.commit("increment");
      },
      reset() {
        this.$store.commit("reset");
      }
    }
  }
</script>

<style scoped>
</style>
