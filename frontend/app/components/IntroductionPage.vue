<template>
<section>
  <div class="container">
    <div>
    <h2 style="display: inline-block; color: black !important">{{ $store.state.gitRepo }}</h2>
    </div>
      <div class="a">
        <h4>Description</h4>
        <div class="results">
          <description-list source="getDescription"
            title="Project Description">
          </description-list>
        </div>
    </div>
      <div class="a">
        <h4>Languages</h4>
        <div class="results">
          <language-list source="getLanguage"
            title="Project Languages">
          </language-list>
        </div>
    </div>
  </div> 
  <div class="input">
    <h4>Edit Description</h4>
    <div id="editor">
      <textarea :value="input" @input="update"></textarea>
      <div v-html="compiledMarkdown"></div>
    </div>
  </div> 
    <div id="issues">
      <h4>Issues For Newcomers</h4>
      <div class="results">
        <issue-list source="getIssues"
          title="Project Issues">s
        </issue-list>
      </div>
    </div>
      <div>
      <h4>Community Metrics:</h4>
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
import LanguageList from './charts/LanguageList'
import DescriptionList from './charts/DescriptionList'
import IssueList from './charts/IssueList'

module.exports = {
  data() {
    return {
      colors: ["#FF3647", "#4736FF","#3cb44b","#ffe119","#f58231","#911eb4","#42d4f4","#f032e6"]
    }
  },
  components: {
    DynamicLineChart,
    LanguageList,
    DescriptionList,
    IssueList
  }
};

</script>

<script src="https://unpkg.com/marked@0.3.6"></script>
<script src="https://unpkg.com/lodash@4.16.0"></script>

<style scoped>

  .input {
   display: inline-block;
   width: 49%;
   padding-bottom: 50px;
   padding-top: 50px;
  }
  .a {
    display: inline-block;
    vertical-align: top;
    width: 49%;
    font-size: 1.2em;
  }
  .results {
    background:  #eaeaea;
  }
  .container {
    overflow: hidden;
  }

html, body, #editor {
  margin: 0;
  height: 100%;
  font-family: 'Helvetica Neue', Arial, sans-serif;
  color: #333;
}

textarea, #editor div {
  display: inline-block;
  width: 49%;
  height: 100%;
  vertical-align: top;
  box-sizing: border-box;
  padding: 0 20px;
}

textarea {
  border: none;
  border-right: 1px solid #ccc;
  resize: none;
  outline: none;
  background-color: #f6f6f6;
  font-size: 14px;
  font-family: 'Monaco', courier, monospace;
  padding: 20px;
}

code {
  color: #f66;
}

</style>