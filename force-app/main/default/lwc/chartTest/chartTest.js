import { LightningElement, track,api } from "lwc"
import chartjs from "@salesforce/resourceUrl/chartJSLib";
import { loadScript } from "lightning/platformResourceLoader";
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class ChartTest extends LightningElement {
    @api chartDataset; 
    chart;    
  
  renderedCallback() {    
    Promise.all([loadScript(this, chartjs)])
      .then(() => {        
      const ctx = this.template.querySelector("canvas");
       this.chart = new window.Chart(ctx, JSON.parse(JSON.stringify(this.chartDataset)));         
           })
           .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error loading Chart',
                        message: error.message,
                        variant: 'error',
                    })
                );
            });
  }
}