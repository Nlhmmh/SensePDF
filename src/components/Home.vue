<template>
  <div class="home" >
    <b-row>
      <b-col class="col">
        <NavBar  />
      </b-col>
      <b-col class="col-8">
        <FormPDF 
          style="margin-bottom: 10px;" 
          v-on:preview-pdf="previewPDF"
        />
      </b-col>
    </b-row>

    <div>
      <b-alert 
        :show="dismissCountDown"
        dismissible
        variant="success"
        @dismissed="dismissCountDown=0"
        @dismiss-count-down="countDownChanged"
      >
        {{ springResponse }}
      </b-alert>
    </div>
  </div>
</template>

<script>
import FormPDF from "../components/FormPDF.vue";
import axios from 'axios';
import NavBar from "../components/NavBar.vue"

export default {
  name: "home",
  components: {
    FormPDF,
    NavBar
  },
  data: function() {
    return {
      springResponse : "",
      dismissSecs: 3,
      dismissCountDown: 0,
      form: {
        dateToSubmit: "",
        taxOffice: "",
        prefecturalTaxOffice: "",
        selectForPrefecturalTaxOffice: "",
        municipalities: "",
        selectForMunicipalities: "",
        corporateNameFurigana: "",
        corporateName: "",
        headOfficeAddress1: "",
        headOfficeAddress2: "",
        companyPhoneNo: "",
        jurisdictionsAddress1: "",
        jurisdictionsAddress2: "",
        contactAddress1: "",
        contactAddress2: "",
        representativeFurigana: "",
        representativeName: "",
        representativeAddress1: "",
        representativeAddress2: "",
        capital: "",
        investment: "",
        companyFoundedDate: "",
        fiscalKara: "",
        fiscalMade: "",
        endOfFiscalYear: "",
        purposeOfBusiness: "",
        businessEvent: "",
        businessStartExpectedDate: "",
        officer: "",
        officerSalary: "",
        officeWorker: "",
        officeWorkerSalary: "",
        salesFactoryWorkers: "",
        salesFactoryWorkersSalary: "",
        others: "",
        othersSalary: "",
        taxFurigana: "",
        taxName: "",
        taxAddress: "",
        taxPhone: ""
      }
    };
  },
  methods: {
    submitForm(form) {
      this.form = form
      axios({
        method: 'POST',
        url: 'http://localhost:8085/api/submitForm',
        data: {
          dateToSubmit: this.form.dateToSubmit,
          taxOffice: this.form.taxOffice,
          prefecturalTaxOffice: this.form.prefecturalTaxOffice,
          selectForPrefecturalTaxOffice: this.form.selectForPrefecturalTaxOffice,
          municipalities: this.form.municipalities,
          selectForMunicipalities: this.form.selectForMunicipalities,
          corporateNameFurigana: this.form.corporateNameFurigana,
          corporateName: this.form.corporateName,
          headOfficeAddress1: this.form.headOfficeAddress1,
          headOfficeAddress2: this.form.headOfficeAddress2,
          companyPhoneNo: this.form.companyPhoneNo,
          jurisdictionsAddress1: this.form.jurisdictionsAddress1,
          jurisdictionsAddress2: this.form.jurisdictionsAddress2,
          contactAddress1: this.form.contactAddress1,
          contactAddress2: this.form.contactAddress2,
          representativeFurigana: this.form.representativeFurigana,
          representativeName: this.form.representativeName,
          representativeAddress1: this.form.representativeAddress1,
          representativeAddress2: this.form.representativeAddress2,
          capital: this.form.capital,
          investment: this.form.investment,
          companyFoundedDate: this.form.companyFoundedDate,
          fiscalKara: this.form.fiscalKara,
          fiscalMade: this.form.fiscalMade,
          endOfFiscalYear: this.form.endOfFiscalYear,
          purposeOfBusiness: this.form.purposeOfBusiness,
          businessEvent: this.form.businessEvent,
          businessStartExpectedDate: this.form.businessStartExpectedDate,
          officer: this.form.officer,
          officerSalary: this.form.officerSalary,
          officeWorker: this.form.officeWorker,
          officeWorkerSalary: this.form.officeWorkerSalary,
          salesFactoryWorkers: this.form.salesFactoryWorkers,
          salesFactoryWorkersSalary: this.form.salesFactoryWorkersSalary,
          others: this.form.others,
          othersSalary: this.form.othersSalary,
          taxFurigana: this.form.taxFurigana,
          taxName: this.form.taxName,
          taxAddress: this.form.taxAddress,
          taxPhone: this.form.taxPhone
        },
        headers: {
          'charset' : 'utf-8'
        }
      })
      .then(
          res => {
              this.springResponse = res.data
              console.log(res.data)
              this.showAlert()
          }
      )
      .catch(err => console.log(err));
    },
    previewPDF(form) {
      this.form = form
      axios({
        method: 'POST',
        url: 'http://localhost:8085/api/previewPDF',
        data: {
          dateToSubmit: this.form.dateToSubmit,
          taxOffice: this.form.taxOffice,
          prefecturalTaxOffice: this.form.prefecturalTaxOffice,
          selectForPrefecturalTaxOffice: this.form.selectForPrefecturalTaxOffice,
          municipalities: this.form.municipalities,
          selectForMunicipalities: this.form.selectForMunicipalities,
          corporateNameFurigana: this.form.corporateNameFurigana,
          corporateName: this.form.corporateName,
          headOfficeAddress1: this.form.headOfficeAddress1,
          headOfficeAddress2: this.form.headOfficeAddress2,
          companyPhoneNo: this.form.companyPhoneNo,
          jurisdictionsAddress1: this.form.jurisdictionsAddress1,
          jurisdictionsAddress2: this.form.jurisdictionsAddress2,
          contactAddress1: this.form.contactAddress1,
          contactAddress2: this.form.contactAddress2,
          representativeFurigana: this.form.representativeFurigana,
          representativeName: this.form.representativeName,
          representativeAddress1: this.form.representativeAddress1,
          representativeAddress2: this.form.representativeAddress2,
          capital: this.form.capital,
          investment: this.form.investment,
          companyFoundedDate: this.form.companyFoundedDate,
          fiscalKara: this.form.fiscalKara,
          fiscalMade: this.form.fiscalMade,
          endOfFiscalYear: this.form.endOfFiscalYear,
          purposeOfBusiness: this.form.purposeOfBusiness,
          businessEvent: this.form.businessEvent,
          businessStartExpectedDate: this.form.businessStartExpectedDate,
          officer: this.form.officer,
          officerSalary: this.form.officerSalary,
          officeWorker: this.form.officeWorker,
          officeWorkerSalary: this.form.officeWorkerSalary,
          salesFactoryWorkers: this.form.salesFactoryWorkers,
          salesFactoryWorkersSalary: this.form.salesFactoryWorkersSalary,
          others: this.form.others,
          othersSalary: this.form.othersSalary,
          taxFurigana: this.form.taxFurigana,
          taxName: this.form.taxName,
          taxAddress: this.form.taxAddress,
          taxPhone: this.form.taxPhone
        },
        headers: {
          'charset' : 'utf-8'
        }
      })
      .then(
          res => {
            this.response = res.data,
            console.log(res.data),
            window.open("/" + res.data, '_blank')
          }    
      )
      .catch(err => console.log(err));
    },
    countDownChanged(dismissCountDown) {
      this.dismissCountDown = dismissCountDown
    },
    showAlert() {
      this.dismissCountDown = this.dismissSecs
    }
  }
};
</script>
