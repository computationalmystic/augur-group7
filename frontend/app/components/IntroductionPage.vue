<template>
<section>
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
  <div class="row">
    <div class="col col-6">
      <dynamic-line-chart source="watchers" 
         title="Watchers / Week " 
          cite-url="https://github.com/augurlabs/wg-gmd/tree/master/activity-metrics/watchers.md"
          cite-text="Watchers"> 
      </dynamic-line-chart>
    </div>
      <div class="col col-6">
        <dynamic-line-chart source="openIssues"
          title="Open Issues / Week"
          cite-url="https://github.com/augurlabs/wg-gmd/blob/master/activity-metrics/open-issues.md"
          cite-text="Issues Open">
        </dynamic-line-chart>
      </div>
  </div>
</section>

</template>

<script>

import DynamicLineChart from './charts/DynamicLineChart'
import BubbleChart from './charts/BubbleChart'
import StackedBarChart from './charts/StackedBarChart'

module.exports = {
  data() {
    return {
      colors: ["#FF3647", "#4736FF","#3cb44b","#ffe119","#f58231","#911eb4","#42d4f4","#f032e6"]
    }
  },
  components: {
    DynamicLineChart,
    BubbleChart,
    StackedBarChart
  }
};

</script>

<style scoped>

  .input {
   padding-top: 10%;
   padding-bottom: 10%;
   padding-right:10%;
   display:inline-block;
  }

</style>