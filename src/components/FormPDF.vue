<template>
  <div>
    <div style="text-align: center;">
      <p class="p-header">
        設立時に提出する書類一式に入力
      </p>
    </div>

    <div class="div-border"> 
      <!-- 
        ■官公庁や自治体に書類を提出する日 
        ■ day to submit the documents to the government agencies and local governments
      -->
      <b-form-group label-size="lg" label-class="font-weight-bold" label="官公庁や自治体に書類を提出する日">
        <b-col sm="2">
          <b-form-input
            v-model="form.dateToSubmit"
            placeholder="2019/12/10"
          ></b-form-input>
        </b-col>
        <b-col :sm="alertSize">
          <b-alert v-model="showDismissableAlert" dismissible variant="warning">
            {{ errorMessage }}
          </b-alert>
        </b-col>
      </b-form-group>

      <!-- 
        ■宛先（税務署、都道府県税事務所の管轄はインターネットで検索できます）		
        ■ destination (tax office, the jurisdiction of the prefectural tax office can be found on the Internet)
      -->
      <h5 style="font-weight:bold">宛先（税務署、都道府県税事務所の管轄はインターネットで検索できます）</h5>

      <!--・税務署- Tax Office -->
      <b-form-group label-cols-md="2" :label-cols-lg="labelColSizeLG" label-align-sm="right" label="税務署" >
        <b-col :sm="columnSize">
          <b-form-input
            v-model="form.taxOffice"
            placeholder="練馬西"
          ></b-form-input>
        </b-col>
      </b-form-group>

      <!--・都道府県税事務所 Prefectural tax office-->
      <b-form-group label-cols-md="3" :label-cols-lg="labelColSizeLG" label-align-sm="right" label="都道府県税事務所">
        <b-col :sm="columnSize">
          <b-form-input
            v-model="form.prefecturalTaxOffice"
            placeholder="豊島"
          ></b-form-input>
          <b-form-select
            v-model="form.selectForPrefecturalTaxOffice"
            :options="selectForPrefecturalTaxOfficeList"
          ></b-form-select>
        </b-col>
      </b-form-group>

      <!--・市町村· Municipalities -->
      <b-form-group label-cols-md="3" :label-cols-lg="labelColSizeLG" label-align-sm="right" label="市町村">
        <b-col :sm="columnSize">
          <b-form-input
            v-model="form.municipalities"
            placeholder="上井草"
          ></b-form-input>
          <b-form-select
            v-model="form.selectForMunicipalities"
            :options="selectForMunicipalitiesList"
          ></b-form-select>
        </b-col>
      </b-form-group>

      <!--
        ■会社情報	
        ■ company information	
      -->
      <h5 style="font-weight:bold">会社情報</h5>

      <!--・法人名ふりがな corporate name Phonetic -->
      <b-form-group label-cols-md="3" :label-cols-lg="labelColSizeLG" label-align-sm="right" label="法人名ふりがな" >
        <b-col :sm="columnSize">
          <b-form-textarea
            v-model="form.corporateNameFurigana"  
            rows="4"
            placeholder="かぶしきがいしゃにしだやすたかこうにんかいけいしちゅうしょうきぎょうしんだんしぜいりしじむしょ"
          ></b-form-textarea>
        </b-col>
      </b-form-group>

      <!-- ・法人名 ·Corporate name -->
      <b-form-group label-cols-md="3" :label-cols-lg="labelColSizeLG" label-align-sm="right" label="法人名" >
        <b-col :sm="columnSize">
          <b-form-textarea
            v-model="form.corporateName"  
            rows="2"
            placeholder="株式会社西田恭隆公認会計士中小企業診断士税理士事務所"
          ></b-form-textarea>
        </b-col>
      </b-form-group>

      <!-- ・本店住所 - Head Office Address -->
      <b-form-group label-cols-md="3" :label-cols-lg="labelColSizeLG" label-align-sm="right" label="本店住所" >
        <b-col :sm="columnSize">
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text">〒</span>
            </div>
            <input 
              class="form-control"
              style="margin-top: 4px"
              v-model="form.headOfficeAddress1"
              placeholder="177-0042">
          </div>
          <b-form-textarea
            v-model="form.corporateName"  
            rows="2"
            placeholder="東京都練馬区下石神井4-20-24○○マンション301号"
          ></b-form-textarea>
        </b-col>
      </b-form-group>

      <!--・電話番号 -->
      <b-form-group label-cols-md="3" :label-cols-lg="labelColSizeLG" label-align-sm="right" label="電話番号" >
        <b-col :sm="columnSize">
          <b-form-input
            v-model="form.companyPhoneNo"
            placeholder="03-5372-4677"
          ></b-form-input>
        </b-col>
      </b-form-group>

      <!-- ・納税地 · Jurisdictions-->
      <b-form-group label-cols-md="3" :label-cols-lg="labelColSizeLG" label-align-sm="right" label="納税地" >
        <b-col :sm="columnSize">
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text">〒</span>
            </div>
            <input 
              class="form-control"
              style="margin-top: 4px"
              v-model="form.jurisdictionsAddress1"
              placeholder="">
          </div>
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text">住所</span>
            </div>
            <textarea 
            class="form-control"
            style="margin-top: 2px"
            v-model="form.jurisdictionsAddress2"
            placeholder="同上"></textarea>
          </div>
        </b-col>
      </b-form-group>

      <!-- ・連絡先、送付先 · Contact, destination-->
      <b-form-group label-cols-md="3" :label-cols-lg="labelColSizeLG" label-align-sm="right" label="連絡先、送付先" >
        <b-col :sm="columnSize">
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text">〒</span>
            </div>
            <input 
              class="form-control"
              style="margin-top: 4px"
              v-model="form.contactAddress1"
              placeholder="">
          </div>
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text">住所</span>
            </div>
            <textarea 
            class="form-control"
            style="margin-top: 2px"
            v-model="form.contactAddress2"
            placeholder="同上"></textarea>
          </div>
        </b-col>
      </b-form-group>

      <!-- ・代表者ふりがな · Representative phonetic-->
      <b-form-group label-cols-md="3" :label-cols-lg="labelColSizeLG" label-align-sm="right" label="代表者ふりがな" >
        <b-col :sm="columnSize">
          <b-form-input
            v-model="form.representativeFurigana"
            placeholder="にしだやすたか"
          ></b-form-input>
        </b-col>
      </b-form-group>

      <!-- ・代表者氏名 · Representative's name -->
      <b-form-group label-cols-md="3" :label-cols-lg="labelColSizeLG" label-align-sm="right" label="代表者氏名" >
        <b-col :sm="columnSize">
          <b-form-input
            v-model="form.representativeName"
            placeholder="西田恭隆"
          ></b-form-input>
        </b-col>
      </b-form-group>

      <!-- ・代表者住所 - Representative Address -->
      <b-form-group label-cols-md="3" :label-cols-lg="labelColSizeLG" label-align-sm="right" label="代表者住所" >
        <b-col :sm="columnSize">
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text">〒</span>
            </div>
            <input 
              class="form-control"
              style="margin-top: 4px"
              v-model="form.representativeAddress1"
              placeholder="177-0042">
          </div>
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text">住所</span>
            </div>
            <textarea 
            class="form-control"
            style="margin-top: 2px"
            v-model="form.representativeAddress2"
            placeholder="東京都練馬区下石神井4-20-24○○マンション302号"></textarea>
          </div>
        </b-col>
      </b-form-group>

      <!-- ・資本金 - Capital-->
      <b-form-group label-cols-md="3" :label-cols-lg="labelColSizeLG" label-align-sm="right" label="資本金" >
        <b-col :sm="columnSize">
          <div class="input-group mb-3" >
            <input 
              class="form-control" 
              style="margin-top: 2px"
              v-model="form.capital"
              placeholder="10000000">
            <div class="input-group-append" style="margin-top: 0">
              <span class="input-group-text">円</span>
            </div>
          </div>
          <div>
            （うち、現物出資財産）
          </div>
          <div class="input-group mb-3" >
            <input 
              class="form-control" 
              style="margin-top: 2px"
              v-model="form.investment"
              placeholder="3000000">
            <div class="input-group-append" style="margin-top: 0">
              <span class="input-group-text">円</span>
            </div>
          </div>
        </b-col>
      </b-form-group>

      <!-- ・会社設立日 · Company founded Date-->
      <b-form-group label-cols-md="3" :label-cols-lg="labelColSizeLG" label-align-sm="right" label="会社設立日" >
        <b-col :sm="columnSize">
          <b-form-input
            v-model="form.companyFoundedDate"
            placeholder="2013/07/01"
          ></b-form-input>
        </b-col>
      </b-form-group>

      <!-- ・事業年度の月日 Month of-fiscal year-->
      <b-form-group label-cols-md="3" :label-cols-lg="labelColSizeLG" label-align-sm="right" label="事業年度の月日" >
        <b-col :sm="columnSize">
          <b-form-input
            v-model="form.fiscalKara"
            placeholder="月 日"
          ></b-form-input>
          <span>から</span>
          <b-form-input
            v-model="form.fiscalMade"
            placeholder="月 日"
          ></b-form-input>
          <span>まで</span>
        </b-col>
      </b-form-group>

      <!-- ・1年目の事業年度終わりの年月日 - the first year the date of the end of fiscal year-->
      <b-form-group label-cols-md="3" :label-cols-lg="labelColSizeLG" label-align-sm="right" label="1年目の事業年度終わりの年月日" >
        <b-col :sm="columnSize">
          <b-form-input
            v-model="form.endOfFiscalYear"
            placeholder="平成 年 月 日"
          ></b-form-input>
        </b-col>
      </b-form-group>

      <!-- ・事業の目的 And purpose of business-->
      <b-form-group label-cols-md="3" :label-cols-lg="labelColSizeLG" label-align-sm="right" label="事業の目的" >
        <b-col :sm="columnSize">
          <b-form-textarea
            v-model="form.purposeOfBusiness"  
            rows="2"
            placeholder="会社設立、創業融資支援、事業計画書作成、資金調達支援、税務相談"
          ></b-form-textarea>
        </b-col>
      </b-form-group>

      <!-- ・事業種目 And business events -->
      <b-form-group label-cols-md="3" :label-cols-lg="labelColSizeLG" label-align-sm="right" label="事業の目的" >
        <b-col :sm="columnSize">
          <div class="input-group mb-3" >
            <input 
              class="form-control" 
              style="margin-top: 2px"
              v-model="form.businessEvent"
              placeholder="会計税務サービス">
            <div class="input-group-append">
              <span class="input-group-text">業</span>
            </div>
          </div>
        </b-col>
      </b-form-group>

      <!-- ・事業開始見込み年月 And business start expected date-->
      <b-form-group label-cols-md="3" :label-cols-lg="labelColSizeLG" label-align-sm="right" label="事業開始見込み年月" >
        <b-col :sm="columnSize">
          <b-form-input
            v-model="form.businessStartExpectedDate"
            placeholder="2013/08/01"
          ></b-form-input>
        </b-col>
      </b-form-group>

      <!-- ・役員と従業員の人数と給与支払い方法 And officials and the number of employee salary payment method-->
      <b-form-group label-cols-md="3" :label-cols-lg="labelColSizeLG" label-align-sm="right" label="役員と従業員の人数と給与支払い方法" >
        <b-col :sm="columnSize">
          <!-- 役員 Officer-->
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text">役員</span>
            </div>
            <input 
              class="form-control"
              style="margin-top: 4px"
              v-model="form.officer"
              placeholder="1">
            <div class="input-group-append">
              <span class="input-group-text">人</span>
            </div>
          </div>
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text">給与支払方法</span>
            </div>
            <select class="form-control" style="margin-top: 4px" v-model="form.officerSalary">
              <option value="月給">月給</option>
              <option value="日給">日給</option>
              <option value="時給">時給</option>
              <option value="年俸">年俸</option>
            </select>
          </div>

          <!-- 事務職員 office worker-->
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text">事務職員</span>
            </div>
            <input 
              class="form-control"
              style="margin-top: 4px"
              v-model="form.officeWorker"
              placeholder="2">
            <div class="input-group-append">
              <span class="input-group-text">人</span>
            </div>
          </div>
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text">給与支払方法</span>
            </div>
            <select class="form-control" style="margin-top: 4px" v-model="form.officeWorkerSalary">
              <option value="月給">月給</option>
              <option value="日給">日給</option>
              <option value="時給">時給</option>
              <option value="年俸">年俸</option>
            </select>
          </div>

          <!-- 営業・工員 Sales and factory workers-->
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text">営業・工員</span>
            </div>
            <input 
              class="form-control"
              style="margin-top: 4px"
              v-model="form.salesFactoryWorkers"
              placeholder="3">
            <div class="input-group-append">
              <span class="input-group-text">人</span>
            </div>
          </div>
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text">給与支払方法</span>
            </div>
            <select class="form-control" style="margin-top: 4px" v-model="form.salesFactoryWorkersSalary">
              <option value="月給">月給</option>
              <option value="日給">日給</option>
              <option value="時給">時給</option>
              <option value="年俸">年俸</option>
            </select>
          </div>

          <!-- その他 Others-->
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text">その他</span>
            </div>
            <input 
              class="form-control"
              style="margin-top: 4px"
              v-model="form.others"
              placeholder="">
            <div class="input-group-append">
              <span class="input-group-text">人</span>
            </div>
          </div>
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text">給与支払方法</span>
            </div>
            <select class="form-control" style="margin-top: 4px" v-model="form.othersSalary">
              <option value="月給">月給</option>
              <option value="日給">日給</option>
              <option value="時給">時給</option>
              <option value="年俸">年俸</option>
            </select>
          </div>
        </b-col>
      </b-form-group>

      <!--
        ■税理士(税理士に申請書を作ってもらう場合、以下の欄に入力します。ご自身でつくる場合は入力不要です。)	
        ■ company information	・法人名ふりがな
      -->
      <h5 style="font-weight:bold">■税理士(税理士に申請書を作ってもらう場合、以下の欄に入力します。ご自身でつくる場合は入力不要です。)</h5>

      <!-- ・税理士ふりがな & Tax Phonetic-->
      <b-form-group label-cols-md="3" :label-cols-lg="labelColSizeLG" label-align-sm="right" label="税理士ふりがな" >
        <b-col :sm="columnSize">
          <b-form-input
            v-model="form.taxFurigana"
            placeholder="にしだやすたか"
          ></b-form-input>
        </b-col>
      </b-form-group>

      <!-- ・税理士氏名 & Tax name-->
      <b-form-group label-cols-md="3" :label-cols-lg="labelColSizeLG" label-align-sm="right" label="税理士氏名" >
        <b-col :sm="columnSize">
          <b-form-input
            v-model="form.taxName"
            placeholder="西田恭隆"
          ></b-form-input>
        </b-col>
      </b-form-group>

      <!-- ・税理士住所 & Tax Address-->
      <b-form-group label-cols-md="3" :label-cols-lg="labelColSizeLG" label-align-sm="right" label="税理士住所" >
        <b-col :sm="columnSize">
          <b-form-textarea
            v-model="form.taxAddress"  
            rows="2"
            placeholder="東京都練馬区下石神井4-20-24○○マンション301号"
          ></b-form-textarea>
        </b-col>
      </b-form-group>

      <!-- ・税理士電話 & Tax Telephone-->
      <b-form-group label-cols-md="3" :label-cols-lg="labelColSizeLG" label-align-sm="right" label="税理士電話" >
        <b-col :sm="columnSize">
          <b-form-input
            v-model="form.taxPhone"
            placeholder="03-5372-4677"
          ></b-form-input>
        </b-col>
      </b-form-group>
    </div>
    
    <div class="div-border">
      <!-- <b-button style="margin: 5px;" v-on:click="$emit('create-pdf', form)" variant="primary">PDF直接作成</b-button>  -->
      <b-button style="margin: 5px;" v-on:click="$emit('preview-pdf', form)" variant="primary">プレビューPDF</b-button>
      <b-button style="margin: 5px;" v-on:click="clear(form)" variant="primary">クリア</b-button>
    </div>

    <div class="div-border">
      <b-button style="margin: 5px;" v-on:click="fillDefault(form)" variant="secondary">デフォルトデータ入力</b-button>
      <b-button style="margin: 5px;" v-on:click="fillEnglish(form)" variant="secondary">Fill English</b-button>
      <b-button style="margin: 5px;" v-on:click="checkForm();" variant="secondary">フォーム提出</b-button>
    </div>
  </div>
</template>

<script>
export default {
  name: "FormPDF",
  data: function() {
    return {
      columnSize: "6",
      labelColSizeLG: "3",
      alertSize: "6",
      showDismissableAlert: false,
      errorMessage: "",
      selectForPrefecturalTaxOfficeList: [{text: '選択する', value: null}, '都', '道', '府', '県'],
      selectForMunicipalitiesList: [{text: '選択する', value: null}, '市', '町', '村'],
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
    fillDefault(form) {
      form.dateToSubmit = "2019/07/20";
      form.taxOffice =  "練馬西";
      form.prefecturalTaxOffice =  "豊島";
      form.selectForPrefecturalTaxOffice =  "都";
      form.municipalities =  "上井草";
      form.selectForMunicipalities =  "市";
      form.corporateNameFurigana =  "かぶしきがいしゃにしだやすたかこうにんかいけいしちゅうしょうきぎょうしんだんしぜいりしじむしょ";
      form.corporateName =  "株式会社西田恭隆公認会計士中小企業診断士税理士事務所";
      form.headOfficeAddress1 =  "177-0042";
      form.headOfficeAddress2 =  "東京都練馬区下石神井4-20-24○○マンション301号";
      form.companyPhoneNo =  "03-5372-4677";
      form.jurisdictionsAddress1 =  "";
      form.jurisdictionsAddress2 =  "同上";
      form.contactAddress1 =  "";
      form.contactAddress2 =  "同上";
      form.representativeFurigana =  "にしだやすたか";
      form.representativeName =  "西田恭隆";
      form.representativeAddress1 =  "177-0042";
      form.representativeAddress2 =  "東京都練馬区下石神井4-20-24○○マンション302号";
      form.capital =  "10000000";
      form.investment =  "3000000";
      form.companyFoundedDate =  "2019/01/20";
      form.fiscalKara =  "4月1日";
      form.fiscalMade =  "3月31日";
      form.endOfFiscalYear =  "平成26年3月31日";
      form.purposeOfBusiness =  "会社設立、創業融資支援、事業計画書作成、資金調達支援、税務相談";
      form.businessEvent =  "会計税務サービス";
      form.businessStartExpectedDate =  "2020/01/30";
      form.officer =  "1";
      form.officerSalary =  "月給";
      form.officeWorker =  "2";
      form.officeWorkerSalary =  "月給";
      form.salesFactoryWorkers =  "3";
      form.salesFactoryWorkersSalary =  "月給";
      form.others =  "";
      form.othersSalary =  "";
      form.taxFurigana =  "にしだやすたか";
      form.taxName =  "西田恭隆";
      form.taxAddress =  "東京都練馬区下石神井4-20-24○○マンション301号";
      form.taxPhone =  "03-5372-4677"
    },
    fillEnglish(form) {
      form.dateToSubmit = "2019/07/20";
      form.taxOffice =  "Yangon";
      form.prefecturalTaxOffice =  "Kamayut";
      form.selectForPrefecturalTaxOffice =  "Township";
      form.municipalities =  "HlaingTharYar";
      form.selectForMunicipalities =  "City";
      form.corporateNameFurigana =  "NLHBusiness NLHBusiness NLHBusiness NLHBusiness NLHBusiness NLHBusiness NLHBusiness";
      form.corporateName =  "NLHBusiness NLHBusiness NLHBusiness NLHBusiness NLHBusiness NLHBusiness NLHBusiness";
      form.headOfficeAddress1 =  "177-0042";
      form.headOfficeAddress2 =  "12-A, Kamayut Township, Yangon \n Kamayut Township, YangonKamayut Township, YangonKamayut Township, Yangon";
      form.companyPhoneNo =  "03-5372-4677";
      form.jurisdictionsAddress1 =  "";
      form.jurisdictionsAddress2 =  "Same as above";
      form.contactAddress1 =  "";
      form.contactAddress2 =  "Same as above";
      form.representativeFurigana =  "Myint";
      form.representativeName =  "Myint";
      form.representativeAddress1 =  "177-0042";
      form.representativeAddress2 =  "HlaingTharYarKamayut Township, YangonKamayut Township, YangonKamayut Township, YangonKamayut Township, YangonKamayut Township, Yangon";
      form.capital =  "10000000";
      form.investment =  "3000000";
      form.companyFoundedDate =  "2019/01/20";
      form.fiscalKara =  "4M1D";
      form.fiscalMade =  "3M31D";
      form.endOfFiscalYear =  "2021/12/12";
      form.purposeOfBusiness =  "Game DevelopmentGame DevelopmentGame DevelopmentGame DevelopmentGame DevelopmentGame DevelopmentGame Development";
      form.businessEvent =  "Burma Hero";
      form.businessStartExpectedDate =  "2020/01/30";
      form.officer =  "1";
      form.officerSalary =  "月給";
      form.officeWorker =  "2";
      form.officeWorkerSalary =  "月給";
      form.salesFactoryWorkers =  "3";
      form.salesFactoryWorkersSalary =  "月給";
      form.others =  "";
      form.othersSalary =  "";
      form.taxFurigana =  "Company Name";
      form.taxName =  "Company Name";
      form.taxAddress =  "NayPyiTaw";
      form.taxPhone =  "03-5372-4677"
    },
    clear(form) {
      form.dateToSubmit = "";
      form.taxOffice =  "";
      form.prefecturalTaxOffice =  "";
      form.selectForPrefecturalTaxOffice =  "";
      form.municipalities =  "";
      form.selectForMunicipalities =  "";
      form.corporateNameFurigana =  "";
      form.corporateName =  "";
      form.headOfficeAddress1 =  "";
      form.headOfficeAddress2 =  "";
      form.companyPhoneNo =  "";
      form.jurisdictionsAddress1 =  "";
      form.jurisdictionsAddress2 =  "";
      form.contactAddress1 =  "";
      form.contactAddress2 =  "";
      form.representativeFurigana =  "";
      form.representativeName =  "";
      form.representativeAddress1 =  "";
      form.representativeAddress2 =  "";
      form.capital =  "";
      form.investment =  "";
      form.companyFoundedDate =  "";
      form.fiscalKara =  "";
      form.fiscalMade =  "";
      form.endOfFiscalYear =  "";
      form.purposeOfBusiness =  "";
      form.businessEvent =  "";
      form.businessStartExpectedDate =  "";
      form.officer =  "";
      form.officerSalary =  "";
      form.officeWorker =  "";
      form.officeWorkerSalary =  "";
      form.salesFactoryWorkers =  "";
      form.salesFactoryWorkersSalary =  "";
      form.others =  "";
      form.othersSalary =  "";
      form.taxFurigana =  "";
      form.taxName =  "";
      form.taxAddress =  "";
      form.taxPhone =  ""
    },
    checkForm() {
      if (!this.form.dateToSubmit) {
        this.errorMessage = "Field Empty"
        this.showDismissableAlert = true
      } else {
        this.errorMessage = ""
      }
    }
  }
};
</script>