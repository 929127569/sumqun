<template>
  <div id="app">
    
      <my-header></my-header>
      <!-- <router-link to="/banner">Banner<router-link> -->
      <!-- <my-footer></my-footer> -->
      <router-view/>
      <my-footer></my-footer>
  </div>
</template>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>
