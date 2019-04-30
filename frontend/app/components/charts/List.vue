<ul>
  <template v-for="item in items">
    <li>{{ item.msg }}</li>
    <li class="divider" role="presentation"></li>
  </template>
</ul>


<script>
export default {
  props: ['source', 'citeUrl', 'citeText', 'title'],
  data() {
    return {
      values: []
    }
  },
  computed: {
    repo() {
      return this.$store.state.baseRepo
    },
    chart() {
      $(this.$el).find('.showme').addClass('invis')
      $(this.$el).find('.textchart').addClass('loader')
      if (this.repo) {
        window.AugurRepos[this.repo][this.source]().then((data) => {
          $(this.$el).find('.showme, .hidefirst').removeClass('invis')
          $(this.$el).find('.textchart').removeClass('loader')
          this.values = data
          console.log('Data:')
          console.log(data)
        })
      }
    }
  }
}

</script>