<template>
  <div class="modal fade" id="deleteUser" role="dialog" aria-modal="true" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content" v-if="currentUser.status_active">
        <div class="modal-header">
          <h5 class="modal-title">{{ $t('user.delete_user') }} <strong>{{ currentUser.full_name }}</strong></h5>
        </div>
        <div class="modal-body">
          <span>{{ $t('user.confirmation.perform_delete_user') }} <span class="text-danger">{{ currentUser.full_name }}</span>?</span>
          <hr/>
          <InputToggleSwitch :labelText="$t('user.confirmation.yes')" inputId="confirm" v-model="confirm" @checked="confirm = $event"/>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">{{ $t('user.confirmation.close') }}</button>
          <button type="button" class="btn btn-danger btn-delete" data-dismiss="modal" @click="submitDelete">{{ $t('user.delete') }}</button>
        </div>
      </div>
      <div class="modal-content" v-else>
        <div class="modal-header">
          <h5 class="modal-title">{{ $t('user.info') }}</h5>
        </div>
        <div class="modal-body">
          <span>{{ $t('user.self') }} <strong class="text-danger">{{ currentUser.full_name }}</strong> {{ $t('user.deleted') }}</span>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">{{ $t('user.confirmation.close') }}</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from 'vuex'
import InputToggleSwitch from '../components/inputToggleSwitch'

export default {
  components: {
    InputToggleSwitch
  },
  computed: {
    ...mapState({
      currentUser: state => state.user.currentUser
    })
  },
  data: function() {
    return {
      params: {},
      confirm : false
    }
  },
  watch: {
    currentUser: function(val) {
      this.confirm = false
      this.params = {
        id: val.id
      }
    }
  },
  methods: {
    submitDelete: function() {
      if (!this.confirm) return
      this.$store.dispatch('user/deleteUser', { params: this.params })
    }
  },
  updated: function() {
    $('.btn-delete').prop('disabled', !this.confirm)
  }
}
</script>

<style>

</style>
