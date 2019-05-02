<!-- <ul>
  <template v-for="item in items">
    <li>{{ item.msg }}</li>
    <li class="divider" role="presentation"></li>
    <h4> Testing </h4>
  </template>
  <li>{{ metricSource }}</li>
</ul>
 -->
<template>
  <div ref="holder" style="position: relative; z-index: 5">
    <h4>oh my god why isn't this working?!?</h4>
     <h4>{{metricSource}}</h4>
     <h4>{{title}}</h4>
     <h4>{{source}}</h4>
  </div>
</template>

<script>
export default {
  props: ['source', 'title'],
  data() {
    return {
      values: [],
      metricSource: "testing"
    }
  },
  created() {
    //this.metricSource = this.source
    this.metricSource = "Testing"
  },
  computed: {
    repo() {
      return this.$store.state.baseRepo
    },
    // chart() {
    //   $(this.$el).find('.showme').addClass('invis')
    //   $(this.$el).find('.textchart').addClass('loader')
    //   if (this.repo) {
    //     window.AugurRepos[this.repo][this.source]().then((data) => {
    //       $(this.$el).find('.showme, .hidefirst').removeClass('invis')
    //       $(this.$el).find('.textchart').removeClass('loader')
    //       this.values = data
    //       console.log('Data:')
    //       console.log(data)
    //     })
    //   }
    // }
  }
}

</script>