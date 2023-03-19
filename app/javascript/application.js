// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import "./src/jquery"
import "./src/jquery-ui"

$(function(){
    console.log("hello world")
    $(".datepicker").datepicker({
        dateFormat: 'dd/mm/yy',
        closeText:"Fechar",
        prevText:"&#x3C;Anterior",
        nextText:"Próximo&#x3E;",
        currentText:"Hoje",
        monthNames: ["Janeiro","Fevereiro","Março","Abril","Maio","Junho","Julho","Agosto","Setembro","Outubro","Novembro","Dezembro"],
        monthNamesShort:["Jan","Fev","Mar","Abr","Mai","Jun","Jul","Ago","Set","Out","Nov","Dez"],
        dayNames:["Domingo","Segunda-feira","Terça-feira","Quarta-feira","Quinta-feira","Sexta-feira","Sábado"],
        dayNamesShort:["Dom","Seg","Ter","Qua","Qui","Sex","Sáb"],
        dayNamesMin:["Dom","Seg","Ter","Qua","Qui","Sex","Sáb"],
        weekHeader:"Sm",
        firstDay:1
    });
})

import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = false
