<template>
  <div class="commands">
    <h1>Commands</h1>
    <br/>
    <p>Options in <span class="mctext">[square brackets]</span> are optional. Options in <span class="mctext">&lt;angled brackets&gt;</span> are required.</p>
    <br />
    <h2>Home Commands</h2>
    <table class="command-table" align="left">
      <tr>
        <th class="regtext">Command</th>
        <th class="regtext">Description</th>
        <th class="regtext">Example</th>
      </tr>
      <tr>
        <td class="mctext">/home&nbsp; [name]</td>
        <td>Teleports you to your home.</td>
        <td class="mctext">/home icehome</td>
      </tr>
      <tr>
        <td><span class="mctext">/homes&nbsp; [page]</span> or <span class="mctext">/homelist [page]</span></td>
        <td>Lists your homes.</td>
        <td class="mctext">/homes</td>
      </tr>
      <tr>
        <td class="mctext">/sethome [name]</td>
        <td>Sets your home and optionally gives it a name. Name defaults to &nbsp;<span class="mctext">home</span>.</td>
        <td class="mctext">/sethome icehome</td>
      </tr>
      <tr>
        <td class="mctext">/delhome [name]</td>
        <td>Delete your home by name.</td>
        <td class="mctext">/delhome icehome</td>
      </tr>
      <tr>
        <td class="mctext">/edithome &lt;name&gt; rename &lt;newname&gt;</td>
        <td>Renames your home.</td>
        <td class="mctext">/edithome icehome rename igloohome</td>
      </tr>
      <tr>
        <td class="mctext">/edithome &lt;name&gt; description &lt;description&gt;</td>
        <td>Edit home description.</td>
        <td class="mctext">/edithome icehome description "My cool igloo"</td>
      </tr>
      <tr>
        <td class="mctext">/edithome &lt;name&gt; relocate</td>
        <td>Relocates your home to your current position.</td>
        <td class="mctext">/edithome icehome relocate</td>
      </tr>
      <tr>
        <td class="mctext">/edithome &lt;name&gt; privacy public</td>
        <td>Sets your home to public (anyone can teleport to it with <span class="mctext">/phome</span>).</td>
        <td class="mctext">/edithome icehome privacy public</td>
      </tr>
      <tr>
        <td class="mctext">/edithome &lt;name&gt; privacy private</td>
        <td>Sets your home to private (only you can teleport to it).</td>
        <td class="mctext">/edithome icehome privacy private</td>
      </tr>
      <tr>
        <td class="mctext">/phome &lt;ownername.homename&gt;</td>
        <td>Teleports to <span class="mctext">ownername</span>'s house named <span class="mctext">homename</span>.</td>
        <td class="mctext">/phome username.icehome</td>
      </tr>
      <tr>
        <td><span class="mctext">/phomes&nbsp; [page]</span> or <span class="mctext">/phomelist [page]</span></td>
        <td>List public homes.</td>
        <td class="mctext">/phomes</td>
      </tr>
    </table>
    <h2>Teleport Commands</h2>
    <table class="command-table" align="left">
      <tr>
        <th class="regtext">Command</th>
        <th class="regtext">Description</th>
        <th class="regtext">Example</th>
      </tr>
      <tr>
        <td class="mctext">/rtp</td>
        <td>Randomly teleport up to 3000 blocks away. This command will avoid teleporting you too close to spawn. Use this to find land for your home and use <span class="mctext">/tpa</span>, <span class="mctext">/tpahere</span>, and <span class="mctext">/phome</span> to get around.</td>
        <td class="mctext">/rtp</td>
      </tr>
      <tr>
        <td class="mctext">/spawn</td>
        <td>Teleports you to spawn.</td>
        <td class="mctext">/spawn</td>
      </tr>
      <tr>
        <td><span class="mctext">/warps&nbsp; [page]</span> or <span class="mctext">/warplist [page]</span></td>
        <td>List warps.</td>
        <td class="mctext">/warps</td>
      </tr>
      <tr>
        <td class="mctext">/warp &lt;name&gt;</td>
        <td>Warp to a server warp point. We currently have <span class="mctext">spawn</span>, <span class="mctext">skyblock</span>, and <span class="mctext">survival</span>.</td>
        <td class="mctext">/warp spawn</td>
      </tr>
      <tr>
        <td class="mctext">/tpa &lt;player&gt;</td>
        <td>Request to teleport to another player.</td>
        <td class="mctext">/tpa username</td>
      </tr>
      <tr>
        <td class="mctext">/tpahere &lt;player&gt;</td>
        <td>Request another player to teleport to you.</td>
        <td class="mctext">/tpahere username</td>
      </tr>
      <tr>
        <td><span class="mctext">/tpyes [player]</span> or <span class="mctext">/tpaccept</span></td>
        <td>Accept a teleport request.</td>
        <td class="mctext">/tpyes username</td>
      </tr>
      <tr>
        <td><span class="mctext">/tpno [player]</span> or <span class="mctext">/tpdeny</span></td>
        <td>Deny a teleport request.</td>
        <td class="mctext">/tpno username</td>
      </tr>
      <tr>
        <td class="mctext">/tpignore</td>
        <td>Toggle whether you receive teleport requests.</td>
        <td class="mctext">/tpignore</td>
      </tr>
      <tr>
        <td class="mctext">/back</td>
        <td>Teleport to your previous location.</td>
        <td class="mctext">/back</td>
      </tr>
    </table>
    <h2>Anti-Grief Commands</h2>
    <p>
      Craft the following recipe to receive 3x <img alt="emerald-block" src="@/assets/32-block-protection-device.png" style="margin-bottom: -0.6em" width="32" height="32" />&nbsp;<span class="mctext">32 Block Protection Device</span>.
      After placing it, you may use the following commands.
    </p>
    <br/>
    <img alt="crafting" src="@/assets/32-block-protection-crafting.png" width="128" height="128" />
    <br/>
    <p>If you want a tutorial, this isn't a bad start: <a href="https://www.youtube.com/watch?v=2BsLPyxIag0" target="_blank">https://www.youtube.com/watch?v=2BsLPyxIag0</a></p>
    <table class="command-table" align="left">
      <tr>
        <th class="regtext">Command</th>
        <th class="regtext">Description</th>
        <th class="regtext">Example</th>
      </tr>
      <tr>
        <td class="mctext">/ps info [members | owners | flags]</td>
        <td>Use this command inside a protected region to see more information about it.</td>
        <td class="mctext">/ps info owners</td>
      </tr>
      <tr>
        <td class="mctext">/ps add [-a] &lt;player&gt;</td>
        <td>Use this command to add or remove a member of your protected region. Add <span class="mctext">-a</span> to add to all regions you own.</td>
        <td class="mctext">/ps add -a username</td>
      </tr>
      <tr>
        <td class="mctext">/ps remove [-a] &lt;player&gt;</td>
        <td>Use this command to add or remove a member of your protected region. Add <span class="mctext">-a</span> to remove from all regions you own.</td>
        <td class="mctext">/ps remove -a username</td>
      </tr>
      <tr>
        <td class="mctext">/ps addowner &lt;player&gt;</td>
        <td>Use this command to add or remove an owner of your protected region.</td>
        <td class="mctext">/ps addowner username</td>
      </tr>
      <tr>
        <td class="mctext">/ps removeowner &lt;player&gt;</td>
        <td>Use this command to add or remove an owner of your protected region.</td>
        <td class="mctext">/ps removeowner username</td>
      </tr>
      <tr>
        <td class="mctext">/ps flag &lt;flag&gt; &lt;value&gt;</td>
        <td>Use this command to change the flags of your protected region. Use <span class="mctext">default</span> as the value to reset it.</td>
        <td class="mctext">/ps flag pvp deny</td>
      </tr>
      <tr>
        <td class="mctext">/ps flag</td>
        <td>Use this command to change the flags of your protected region.</td>
        <td class="mctext">/ps flag</td>
      </tr>
      <tr>
        <td class="mctext">/ps hide</td>
        <td>Use this command to hide your protection stone.</td>
        <td class="mctext">/ps hide</td>
      </tr>
      <tr>
        <td class="mctext">/ps unhide</td>
        <td>Use this command to unhide your protection stone.</td>
        <td class="mctext">/ps unhide</td>
      </tr>
      <tr>
        <td><span class="mctext">/ps toggle</span> or <span class="mctext">/ps off</span> or <span class="mctext">/ps on</span></td>
        <td>Use this command to turn on or off placement of protection stones blocks for yourself.</td>
        <td class="mctext">/ps toggle</td>
      </tr>
      <tr>
        <td class="mctext">/ps view</td>
        <td>Use this command to see the boundaries of your protected region.</td>
        <td class="mctext">/ps view</td>
      </tr>
      <tr>
        <td class="mctext">/ps unclaim</td>
        <td>Use this command to unclaim your protected region.</td>
        <td class="mctext">/ps unclaim</td>
      </tr>
      <tr>
        <td class="mctext">/ps merge</td>
        <td>Use this command to merge your protected region with an adjacent region also owned by you.</td>
        <td class="mctext">/ps merge</td>
      </tr>
    </table>
  </div>
</template>

<style scoped>
.command-table {
  text-align: left;
}

table {
  border-collapse: collapse;
  margin-bottom: 2em;
}

th {
  font-size: large;
}

tr {
  border-bottom: 1px solid white;
}

th, td {
  padding: 15px;
}

.regtext {
  font-family: initial;
}
</style>
