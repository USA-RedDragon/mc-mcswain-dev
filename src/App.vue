<script setup>
import { RouterLink, RouterView } from 'vue-router'
</script>

<template>
  <span>
    <header>
      <div class="header">
        <h1><span class="red mctext">DragonMC</span></h1>
        <h2 class="mctext">Vanilla-like <span class="survival">Survival</span> and <span class="creative">Creative</span> + <span class="skyblock">Skyblock</span></h2>

        <nav>
          <RouterLink to="/">Home</RouterLink>
          <RouterLink to="/news">News</RouterLink>
          <RouterLink to="/commands">Commands</RouterLink>
          <a href="https://dynmap.mc.mcswain.dev">Map</a>
        </nav>
      </div>
    </header>

    <RouterView />
  </span>
</template>

<style scoped>
.header {
  color: #FFF;
}

.survival {
  color: #FF5;
}

.creative {
  color: #F5F;
}

.skyblock {
  color: #5FF;
}

header {
  line-height: 1.5;
  max-height: 100vh;
}

.logo {
  display: block;
  margin: 0 auto 2rem;
}

nav {
  width: 100%;
  font-size: 12px;
  text-align: center;
  margin-top: 2rem;
}

nav a.router-link-exact-active {
  color: var(--color-text);
}

nav a.router-link-exact-active:hover {
  background-color: transparent;
}

nav a {
  display: inline-block;
  padding: 0 1rem;
  border-left: 1px solid var(--color-border);
}

nav a:first-of-type {
  border: 0;
}

@media (min-width: 1024px) {
  header {
    display: flex;
    place-items: center;
    padding-right: calc(var(--section-gap) / 2);
  }

  .logo {
    margin: 0 2rem 0 0;
  }

  header .wrapper {
    display: flex;
    place-items: flex-start;
    flex-wrap: wrap;
  }

  nav {
    text-align: left;
    margin-left: -1rem;
    font-size: 1rem;

    padding: 1rem 0;
    margin-top: 1rem;
  }
}
</style>
