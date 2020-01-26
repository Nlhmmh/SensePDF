<template>
  <div class="about">
    <h3>DefaultForm.pdf</h3>
    <pdf
        src="../DefaultForm.pdf"
        v-for="i in numPages"
        :key="i"
        :page="i"
        style="display: inline-block; width: 100%"
    ></pdf>
  </div>
</template>

<script>
import pdf from 'vue-pdf';

// var pdfPath = pdf.createLoadingTask('F:/1_All_Projects_&_Testings/Vue/formpdfVue/src/form20200121222516.pdf');

export default {
    name: "about",
    components: {
      pdf
    },
    data() {
      return {
        // src: pdfPath,
        numPages: 6,
        currentPage: 0,
        pageCount: 0
      }
    }
    // mounted() {
    //   this.src.then(pdf => {
    //     this.numPages = pdf.numPages;
    //   });
    // }
}
</script>
