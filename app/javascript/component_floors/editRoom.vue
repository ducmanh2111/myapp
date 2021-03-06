<template>
  <div class="modal fade" id="editRoom" role="dialog" aria-modal="true" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">{{ $t('floor.edit_room') }} {{currentRoom.room_number}}</h5>
        </div>
        <div v-show="isRegistration">
          <div class="modal-body">
            <InputNumber inputId="room_number" :labelText="$t('floor.room_number')" :valueInput="params.room_number" v-model="params.room_number"/>
            <InputNumber inputId="area" :labelText="$t('floor.room_area')" :valueInput="params.area" v-model="params.area"/>
            <InputSelect2 inputId="holder_id" :labelText="$t('floor.room_holder')"
              :options="collectionUsers"
              :selected="params.holder_id"
              v-model="params.holder_id"
              :placeHolder="$t('floor.select_holder')"
              typeSelect="single_select"
            />
            <InputRadioButtons inputId="status" :labelText="$t('floor.room_status')" :options="status" :valueInput="params.status" v-model="params.status"/>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">{{ $t('floor.close') }}</button>
            <button type="button" class="btn btn-primary" @click="submitConfirm">{{ $t('floor.submit') }}</button>
          </div>
        </div>

        <div v-show="isConfirm">
          <div class="modal-body">
            <FieldConfirm :labelText="$t('floor.room_number')" :value="params.room_number"/>
            <FieldConfirm :labelText="$t('floor.room_area')" :value="params.area"/>
            <FieldConfirm :labelText="$t('floor.room_holder')" :value="collectionUsers[params.holder_id]"/>
            <FieldConfirm :labelText="$t('floor.room_status')" :value="status[params.status]"/>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" @click="backToRegistration">{{ $t('floor.back') }}</button>
            <button type="button" class="btn btn-primary" data-dismiss="modal" @click="submitForm">{{ $t('floor.save_change') }}</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex'
import InputNumber from '../components/inputNumber.vue'
import InputRadioButtons from '../components/inputRadioButtons'
import InputSelect2 from '../components/inputSelect2.vue'
import FieldConfirm from '../components/fieldConfirm.vue'

import show_flash_mixins from '../mixins/show_flash'

export default {
  components: {
    InputNumber,
    InputRadioButtons,
    InputSelect2,
    FieldConfirm
  },
  computed: {
    ...mapState({
      currentRoom: state => state.floor.currentRoom,
      roomStatus: state => state.floor.roomStatus,
      collectionUsers: state => state.floor.users,
      isValid: state => state.floor.isValid
    }),
    status: function() {
      const self = this

      return this.roomStatus.reduce(function(status, el) {
          status[el] = self.$t(`floor.${el}`)
          return status
        }
      , {} )
    }
  },
  data: function() {
    return {
      isRegistration: true,
      isConfirm: false,
      params: {}
    }
  },
  watch: {
    currentRoom: function(val) {
      this.params = {
        id: val.id,
        room_number: val.room_number,
        area: val.area,
        holder_id: val.holder_id,
        status: val.status
      }
    }
  },
  methods: {
    submitForm: async function() {
      await this.$store.dispatch('floor/editRoom', { params: this.params })
      this.isRegistration = true
      this.isConfirm = false

      this.show_flash(this.isValid)
    },
    submitConfirm: function() {
      this.isRegistration = false
      this.isConfirm = true
    },
    backToRegistration: function() {
      this.isConfirm = false
      this.isRegistration = true
    }
  },
  mixins: [show_flash_mixins]
}
</script>
