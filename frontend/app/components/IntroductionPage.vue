<template>

<div class="is-table-container">
    <div class="fullwidth">
      <augur-header></augur-header>
    </div>
    <section>
    <h3>Augur Introduction Page</h3>
    </section>
</div>
</template>

<script>
import AugurHeader from './AugurHeader'
export default {

  name: 'MetricsStatus',
  components: {
    AugurHeader
  },
  data () {
    return {
      metricsStatus: [],
      metadata: {
        metricStatusMetadata: [],
        groups: [],
        sources: [],
        metric_types: []
      },
      filters: {
        selected_group: 'all',
        selected_source: 'all',
        selected_metric_type: 'all',
        selected_backend_status: 'all',
        selected_frontend_status: 'all',
        seletec_is_defined: 'all'
      }
    }
  },
  methods: {
      getMetricsStatus() {
        var query_string = "group=" + this.selected_group +
                           "&data_source=" + this.selected_source +
                           "&metric_type=" + this.selected_metric_type +
                           "&backend_status=" + this.selected_backend_status +
                           "&frontend_status=" + this.selected_frontend_status +
                           "&is_defined=" + this.selected_is_defined

          window.AugurAPI.getMetricsStatus(query_string).then((data) => {
            this.metricsStatus = data
        })
      },
      getMetricsStatusMetadata() {
        window.AugurAPI.getMetricsStatusMetadata().then((data) => {
          this.metadata['metricStatusMetadata'] = data

          this.metadata['groups'] = Object.keys(data[0].groups)

          this.metadata['data_sources'] = data[0].data_sources

          this.metadata['metric_types'] = data[0].metric_types
        })
      },
      getImplementationStatusColor(metric, location) {
        if (metric[location] == "unimplemented") {
          return "#c00"
        }
        else if (metric[location] == "implemented") {
          return "#0c0"
        }
      },
      getBackendStatusColor(metric) {
        if (metric["backend_status"] == "unimplemented") {
          return "#c00"
        }
        else if (metric["backend_status"] == "implemented") {
          return "#0c0"
        }
      },
      getFrontendStatusColor(metric) {
        if (metric["frontend_status"] == "unimplemented") {
          return "#c00"
        }
        else if (metric["frontend_status"] == "implemented") {
          return "#0c0"
        }
      },
    },
  mounted() {
    this.selected_group = 'all'
    this.selected_source = 'all'
    this.selected_metric_type = 'all'
    this.selected_backend_status = 'all'
    this.selected_frontend_status = 'all'
    this.selected_is_defined = 'all'
    this.getMetricsStatus()
    this.getMetricsStatusMetadata()
  }
}
</script>
=======
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

<style scoped>

  .input {
   display: inline-block;
   width: 49%;
   padding-bottom: 50px;
   padding-top: 50px;
  }

</style>