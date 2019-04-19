<template>

<div id="wrapper">
  <h3>Introduction Page</h3>
    <div class="input">
      <h4>Description</h4>
      <textarea rows="4" cols="50">

      </textarea> 

      <form>
        <div id="submit_button">
          <button class="submit" type="submit">Submit</button>
        </div>
      </form>
    </div>
    <div class="input">    
      <h4>Languages</h4>  
      <textarea rows="4" cols="50">

      </textarea> 

      <form>
        <div id="submit_button">
          <button class="submit" type="submit">Submit</button>
        </div>
      </form>
    </div>
    <div id="issues">
    <h4>Issues For Newcomers</h4>
    </div>
</div>

</template>

<script>

  module.exports = {

    data() {

      return {



      }

    },

    methods: {



    },

    computed: {



    }

  }


</script>

<style scoped>

  .input {
   padding-bottom: 10%;
   padding-right:10%;
   display:inline-block;
  }

</style>