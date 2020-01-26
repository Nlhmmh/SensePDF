<template>
  <div class="div-border">
      <b-button style="margin: 10px;" type="submit" variant="primary" v-on:click="getForms">フォームデータ取得</b-button>

      <b-alert style="margin: 10px;" v-model="showDismissableAlert" dismissible variant="warning">
        {{ response }}
      </b-alert>

      <b-row style="margin: 10px;">
        <table class="tt" width='100%'>
          <tr>
            <th class="tsmall"></th>
            <th class="tsmall">id</th> 
            <th class="tbig">dateToSubmit</th> <!-- 1 -->
            <th class="tbig">taxOffice</th> <!-- 2 -->
            <th class="tbig">prefecturalTaxOffice</th> <!-- 3 -->
            <th class="tbig">selectForPrefecturalTaxOffice</th>
            <th class="tbig">municipalities</th> <!-- 4 -->
            <th class="tbig">selectForMunicipalities</th> <!--  -->
            <th class="tbig">corporateNameFurigana</th> <!-- 5 -->
            <th class="tbig">corporateName</th> <!-- 6 -->
            <th class="tbig">headOfficeAddress1</th> <!-- 7 -->
            <th class="tbig">headOfficeAddress2</th> <!-- 8 -->
            <th class="tbig">companyPhoneNo</th> <!-- 9 -->
            <th class="tbig">jurisdictionsAddress1</th> <!-- 10 -->
            <th class="tbig">jurisdictionsAddress2</th> <!-- 11 -->
            <th class="tbig">contactAddress1</th> <!-- 12 -->
            <th class="tbig">contactAddress2</th> <!-- 13 -->
            <th class="tbig">representativeFurigana</th> <!-- 14 -->
            <th class="tbig">representativeName</th> <!-- 15 -->
            <th class="tbig">representativeAddress1</th> <!-- 16 -->
            <th class="tbig">representativeAddress2</th> <!-- 17 -->
            <th class="tbig">capital</th> <!-- 18 -->
            <th class="tbig">investment</th> <!-- 19 -->
            <th class="tbig">companyFoundedDate</th> <!-- 20 -->
            <th class="tbig">fiscalKara</th> <!-- 21 -->
            <th class="tbig">fiscalMade</th> <!-- 22 -->
            <th class="tbig">endOfFiscalYear</th> <!-- 23 -->
            <th class="tbig">purposeOfBusiness</th> <!-- 24 -->
            <th class="tbig">businessEvent</th> <!-- 25 -->
            <th class="tbig">businessStartExpectedDate</th> <!-- 26 -->
            <th class="tbig">officer</th> <!-- 27 -->
            <th class="tbig">officerSalary</th> <!--  -->
            <th class="tbig">officeWorker</th> <!-- 28 -->
            <th class="tbig">officeWorkerSalary</th> <!--  -->
            <th class="tbig">salesFactoryWorkers</th> <!-- 29 -->
            <th class="tbig">salesFactoryWorkersSalary</th> <!--  -->
            <th class="tbig">others</th> <!-- 30 -->
            <th class="tbig">othersSalary</th> <!--  -->
            <th class="tbig">taxFurigana</th> <!-- 31 -->
            <th class="tbig">taxName</th> <!-- 32 -->
            <th class="tbig">taxAddress</th> <!-- 33 -->
            <th class="tbig">taxPhone</th> <!-- 34 -->
          </tr>
          <tr v-bind:key="f.id" v-for='f in forms'>
            <td>
              <b-button style="margin: 5px;" v-on:click="deleteForm(f.id)" variant="danger">削除</b-button>
            </td>
            <td>{{ f.id }}</td>
            <td>{{ f.dateToSubmit }}</td>
            <td>{{ f.taxOffice }}</td>
            <td>{{ f.prefecturalTaxOffice }}</td>
            <td>{{ f.selectForPrefecturalTaxOffice }}</td>
            <td>{{ f.municipalities }}</td>
            <td>{{ f.selectForMunicipalities }}</td>
            <td>{{ f.corporateNameFurigana }}</td>
            <td>{{ f.corporateName }}</td>
            <td>{{ f.headOfficeAddress1 }}</td>
            <td>{{ f.headOfficeAddress2 }}</td>
            <td>{{ f.companyPhoneNo }}</td>
            <td>{{ f.jurisdictionsAddress1 }}</td>
            <td>{{ f.jurisdictionsAddress2 }}</td>
            <td>{{ f.contactAddress1 }}</td>
            <td>{{ f.contactAddress2 }}</td>
            <td>{{ f.representativeFurigana }}</td>
            <td>{{ f.representativeName }}</td>
            <td>{{ f.representativeAddress1 }}</td>
            <td>{{ f.representativeAddress2 }}</td>
            <td>{{ f.capital }}</td>
            <td>{{ f.investment }}</td>
            <td>{{ f.companyFoundedDate }}</td>
            <td>{{ f.fiscalKara }}</td>
            <td>{{ f.fiscalMade }}</td>
            <td>{{ f.endOfFiscalYear }}</td>
            <td>{{ f.purposeOfBusiness }}</td>
            <td>{{ f.businessEvent }}</td>
            <td>{{ f.businessStartExpectedDate }}</td>
            <td>{{ f.officer }}</td>
            <td>{{ f.officerSalary }}</td>
            <td>{{ f.officeWorker }}</td>
            <td>{{ f.officeWorkerSalary }}</td>
            <td>{{ f.salesFactoryWorkers }}</td>
            <td>{{ f.salesFactoryWorkersSalary }}</td>
            <td>{{ f.others }}</td>
            <td>{{ f.othersSalary }}</td>
            <td>{{ f.taxFurigana }}</td>
            <td>{{ f.taxName }}</td>
            <td>{{ f.taxAddress }}</td>
            <td>{{ f.taxPhone }}</td>
          </tr>
        </table>
      </b-row> 
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: "viewdata",
  data: function() {
    return {
        idToDelete: "",
        response: "",
        showDismissableAlert: false,
        forms: [],
        form: {
            id: "",
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
    getForms() {
      axios({
        method: 'GET',
        url: 'http://localhost:8085/api/getForms'
      })
      .then(
        res => {
          this.forms = res.data
          console.log(this.form)
        }
      )
      .catch(err => console.log(err));
    },
    deleteForm(ID) {
      axios({
        method: 'DELETE',
        url: 'http://localhost:8085/api/deleteForm',
        params: {
          id : ID
        } 
      })
      .then(
        res => {
          this.response = res.data
          console.log(res.data)
          this.getForms()
          this.showDismissableAlert = true
        }
      )
      .catch(err => console.log(err));
    }
  }
}
</script>

<style scoped>
.tt {
    table-layout: fixed;
    display: block;
    overflow-x: scroll;
    white-space: nowrap;
    border: 2px solid black;
    border-collapse: collapse; 
    background-color: lightgoldenrodyellow;
}
.tt td {
    text-align: center;
    border-right: 2px solid black;
}
.tt th {
    border-right: 2px solid black;
    border-bottom: 2px solid black;
    padding-left: 4px;
    padding-right: 4px;
}
.tsmall {
    width: 50px;
    text-align: center;
}
.tbig {
    width: 250px;
    text-align: center;
}
.btn-view {
    padding: 5px;
    border: 2px solid black;
    background-color: yellow;
    text-align: center;
}
.text-view {
    margin-top: 5px;
    margin-bottom: 5px;
    width: 100px;
    height: 20px;
    text-align: center;
}
.message {
    width: 30%;
    margin-bottom: 5px;
    padding: 5px;
    background-color: green;
    color: white;
}
</style>