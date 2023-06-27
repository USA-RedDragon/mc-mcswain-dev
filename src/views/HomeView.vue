<script setup>
import { RouterLink } from 'vue-router'

import WelcomeItem from '../components/WelcomeItem.vue'
import DocumentationIcon from '../components/icons/IconDocumentation.vue'
import ToolingIcon from '../components/icons/IconTooling.vue'
import CommunityIcon from '../components/icons/IconCommunity.vue'
import SupportIcon from '../components/icons/IconSupport.vue'
</script>

<template>
  <main>
    <WelcomeItem>
      <template #icon>
        <ToolingIcon />
      </template>
      <template #heading>About</template>
      <span class="red mctext">DragonMC</span> only has one rule: <span style="font-weight: bold;">Don't be a dick</span>.
      <p>The server is basically vanilla survival Minecraft, with worlds for creative and skyblock.</p>
      <ul>
        <li>Deaths aren't awful. If you die, a chest will be placed near your death point with all your items contained within that can only be accessed by you. You can use <span class="mctext">/back</span> to teleport back near the chest.</li>
        <li>Teleports and homes are available for convenience.</li>
        <li>KeepChunks: Running a redstone-powered pipeline or a slow farm that needs to stay loaded even when you walk away? Ask me to keep the chunk in memory.</li>
      </ul>
    </WelcomeItem>

    <WelcomeItem>
      <template #icon>
        <CommunityIcon />
      </template>
      <template #heading>News</template>

      Get official server update details and maybe some admin blogs <RouterLink to="/commands">on our news page</RouterLink>.
    </WelcomeItem>

    <WelcomeItem>
      <template #icon>
        <DocumentationIcon />
      </template>
      <template #heading>Documentation</template>

      <span class="red mctext">DragonMC</span>'s plugins have commands, and the
      <RouterLink to="/commands">official documentation</RouterLink>
      provides you with all information you need to get started.
    </WelcomeItem>

    <WelcomeItem>
      <template #icon>
        <SupportIcon />
      </template>
      <template #heading>Support&nbsp; <span class="red mctext">DragonMC</span></template>
      As a single-owner server, <span class="red mctext">DragonMC</span> relies on community backing for its sustainability. You can help
      us by <a href="#">becoming a sponsor</a>.
    </WelcomeItem>
  </main>
</template>
