<template>
  <div>
    <span class="floor_name">{{ $t('floor.self') }} {{floor.floor_number}}</span>
    <div class="grid-container row">
      <RowRoom :room="room" v-for="(room, index) in floor.rooms" :key="index"/>
    </div>
  </div>
</template>

<script>
import RowRoom from './rowRoom.vue'
export default {
  components: {
    RowRoom
  },
  props: {
    floor: {
      type: Object,
      required: true
    }
  }
}
</script>

<style lang="scss" scoped>

.grid-container {
  // display: grid;
  // grid-template-columns: 20% 20% 20% 20% 20%;
  grid-gap: 1px;
  padding: 1px;
}

.grid-container > div {
  border: 1px solid #2196F3;
  background-color: white;
  padding: 1px 0;
  font-size: 1rem;
  height: 150px;
}

.floor_name {
  font-size: 2rem;
}

</style>
