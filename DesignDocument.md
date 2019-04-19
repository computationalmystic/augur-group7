# Sprint 2 Design Document:
# Logan Jakuboski
# Tim Kwon
# Eric Mitchell
# Drew Smith
## What is necessary for your whole system to work:
### Data Sources:
* ghtorrent.py in Augur datasources folder
* githubapi.py in Augur datasources folder
* Form input from user
### Functions:
* In the template in IntroductionPage.vue component:
```
<section>
  <div id="row">
    <h3>Introduction Page</h3>
      <div class="col col-6 input">
        <h4>Description</h4>
        <textarea rows="4" cols="50">

        </textarea> 

        <form>
          <div id="submit_button">
            <button class="submit" type="submit">Submit</button>
          </div>
        </form>
      </div>
      <div class="col col-6 input">    
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
```
* In script tag in IntroductionPage.vue component:
```
<script>

import DynamicLineChart from './charts/DynamicLineChart'

module.exports = {
  data() {
    return {
      colors: ["#FF3647", "#4736FF","#3cb44b","#ffe119","#f58231","#911eb4","#42d4f4","#f032e6"]
    }
  },
  components: {
    DynamicLineChart
  }
};

</script>
```
* In Router.js:
```
import IntroductionPage from '../components/IntroductionPage.vue'
```
and
```
 children: [
          {
            path: "intro",
            name: "intro",
            components: {
              header: AugurHeader,
              tabs: Tabs,
              controls: MainControls,
              content: IntroductionPage
            }
          },
```
* In the Tabs.vue component template:
```
<li :class="{ active: (currentTab == 'intro') }"><a href="#" @click="changeTab" data-value="intro">Introduction</a></li>
```
## Show clearly how the different software components communicate
### Document the reasons for your decisions where you have choices in design.
* We have decided to make our software component a tab because we feel it is best suited to be a standalone component. It didn't fit under any other existing tabs
* We have the layout of the page when creating it in the style of a form because this is supposed to be something that can accept input from the community managers
* We have the issues underneath the form inputs to help newcomers with quick access to the issues pertaining to the project, giving them a good place to look where to start
* We have the specific metrics underneath the introduction, languages, and issues because we feel like they provide a good set of data for newcomers to get a visual understanding of the current state of the project
