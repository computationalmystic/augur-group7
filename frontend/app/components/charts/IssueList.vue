<template>
  <div>
    <ul>
      <li v-for="item in values">{{ "https://wwww.github.com/twitter/" + item.name + "/issues/" item.issue_id }}</li>
      <li class="divider" role="presentation"></li>
    </ul>
  </div>
</template>


<script>
export default {
  props: ['source', 'title'],
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
  },
  created(){
    let repo = window.AugurAPI.Repo({ githubURL: this.repo })
    repo.getIssues().then((data) =>{
    this.values = data
    console.log('Data starts here:')
    console.log(data)

  })
  },
  methods: {
  }
}

</script>