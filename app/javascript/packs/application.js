import Vue from 'vue'
import App from './App.vue'

// vuex
import { store } from './store/store'

// vue-router
import VueRouter from 'vue-router'
import { routes } from './routes'
Vue.use(VueRouter)

const router = new VueRouter({
    mode: 'history',
    routes,
    scrollBehavior (_to, _from, _savedPosition) {
        return new Promise((resolve, _reject) => {
            setTimeout(() => {
                resolve({ x: 0, y: 0 })
            }, 200)
        })
    }
})

document.addEventListener('DOMContentLoaded', () => {
    const el = document.body.appendChild(document.createElement('application'))
    const app = new Vue({
        el,
        router,
        store,
        render: h => h(App)
    })
})
