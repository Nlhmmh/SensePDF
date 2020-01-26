<template>
  <div id="app">
    <div id="nav">
      <b-navbar type="dark" variant="dark">
        <ul>
          <li><router-link to="/">ホーム</router-link></li>
          <li><router-link to="/viewdata">ビュー</router-link></li>
          <!-- <li><router-link :to="{ path: '/about', params: { pdfName: 'dd' } }">PDFプレビュー</router-link></li>
          <li><router-link to="/about">PDFプレビュー</router-link></li> -->
        </ul>
      </b-navbar>
    </div>
    <router-view/>
  </div>
</template>

<style>
* {
  margin: 2px;
  /* padding: 0; */
  text-align: left;
}
body {
  font-family: Arial, Helvetica, sans-serif;
  line-height: 1.4;
  background-color: lightgreen;
}
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
/*
#nav {
  margin-top: 5px;
  margin-bottom: 12px;
}
*/
#nav a.router-link-exact-active {
  background-color: rgb(20, 187, 20);
}
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #302525;
}
li {
  float: left;
}
li a {
  width: 200px;
  padding: 16px;
  border: 1px solid darkred;
  display: block;
  color: white;
  text-align: center;
  font-size: 17px;
  font-weight: bold;
  text-decoration: none;
  background-color: rgb(74, 83, 57);
}
li a:hover {
  background-color: #6ee241;
  text-decoration: none;
  color: white;
}
.table-style {
  width: 1000px;
  height: 100%;
  margin-left: auto;
  margin-right: auto;
}
.table-style td {
  text-align: left;
}
.table-style td.small-header {
  font-weight: bold;
}
.table-style td.align-left {
  text-align: left;
}
.table-style td.align-right {
  text-align: right;
}
.table-style td.field-1 {
  width: 50px;
}
.table-style td.field-2 {
  width: 150px;
}
.table-style td.field-3 {
  width: 30px;
}
.table-style td.field-4 {
  width: 500px;
}
.blank-line {
  height: 10px;
}
.text-area {
  height: 80px;
}
.btn-submit-form {
  margin: auto;
  margin-top: 5px;
  margin-bottom: 5px;
  width: 120px;
  height: 40px;
  border: 2px solid black;
  background-color: yellow;
  text-align: center;
}
.div-border {
  margin-bottom: 10px;
  border: 2px solid black;
  background-color: rgb(241, 241, 110);
}
.text-idToCreatePDF {
  text-align: center;
  width: 120px;
  height: 40px;
  border: 2px solid black;
}
.p-header {
  margin-top: 10px;
  width: 500px;
  height: 50px;
  text-align: center;
  border: 3px solid black;
  font-size: 30px; 
  font-weight: bolder;
  background-color: lightgoldenrodyellow;
}
</style>