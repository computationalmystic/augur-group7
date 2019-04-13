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