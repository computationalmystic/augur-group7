<template>
<section>
  <div id="row">
    <h3>Introduction Page</h3>
      
      <div class="input">
        <h4>Description</h4>
        <textarea rows="5">
        </textarea> 
      </div>
      <div class="input">
        <h4>Languages</h4>  
        <textarea rows="5">
        </textarea> 
      </div>
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
      <dynamic-line-chart source="getLanguage"
        title="Languages"
        cite-url=""
        cite-text=""
        disable-rolling-average=1>
      </dynamic-line-chart>
    </div>
  </div>
  <div class="row">
    <language-list-chart></language-list-chart>
  </div>
  <div class="row">
    <div class="col col-6">
      <dynamic-line-chart source="communityEngagement:issues_open"
        title="Community Engagement: Open Issues"
        cite-url="https://github.com/augurlabs/wg-gmd/blob/master/activity-metrics/open-issues.md"
        cite-text="Open Issues"
        disable-rolling-average=1>
      </dynamic-line-chart>
    </div>
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
import LanguageListChart from './charts/LanguageListChart'

module.exports = {
  data() {
    return {
      //colors: ["#FF3647", "#4736FF","#3cb44b","#ffe119","#f58231","#911eb4","#42d4f4","#f032e6"]
    }
  },
  components: {
    DynamicLineChart,
    LanguageListChart
  }
};

</script>

<style scoped>

  .input {
   display: inline-block;
   width: 49%;
   padding-bottom: 50px;
   padding-top: 50px;
  }

</style>