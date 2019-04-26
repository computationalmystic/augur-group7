<template>
  <div ref="holder" style="position: relative; z-index: 5">
    <div class="chart">
      <h3 style="text-align: center">{{ title }}</h3>
      <vega-lite :spec="spec" :data="values"></vega-lite>
      <p> {{ chart }} </p>
    </div>
  </div>
</template>


<script>
import { mapState } from 'vuex'
import AugurStats from 'AugurStats'

 export default {
  props: ['source', 'citeUrl', 'citeText', 'title', 'disableRollingAverage', 'alwaysByDate', 'data'],
  data() {
    return {
      values: [],
    }
  },
  computed: {
    repo() {
      return this.$store.state.baseRepo
    },
    spec() {
        // IF YOU WANT TO CALL YOUR ENDPOINT IN THE CHART FILE, THIS IS WHERE/HOW YOU SHOULD DO IT:
      let repo = window.AugurAPI.Repo({ githubURL: this.repo })
      repo[this.source]().then((data) => {
        console.log("HERE", data)
        this.values = data
      })
      //FINISH CALLING ENDPOINT
      
      // THIS IS A SAMPLE 'spec', SPECS ARE WHAT CREATE THE VEGA-LITE FILE, 
      // YOU CAN PLAY WITH SAMPLE SPEC OF A LINE CHART AT: 
      // https://vega.github.io/editor/#/examples/vega-lite/line
      // AND SEE THE DATA THAT THEY ARE USING AT:
      // https://vega.github.io/vega-lite/data/stocks.csv
      let config = {
        "$schema": "https://vega.github.io/schema/vega-lite/v2.json",
        "width": 950,
        "height": 300,
        "mark": "line",
        "encoding": {
          "x": {
            "field": "date", "type": "temporal",
          },
          "y": {
            "field": "value","type": "quantitative",
          },
        }
      }
      return config
    }
  },
  methods: {
    //define any methods you may need here
    //you can call them anywhere with: this.methodName()
  }
} 
</script>
