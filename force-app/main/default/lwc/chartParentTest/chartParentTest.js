import { LightningElement, track, api, wire } from 'lwc';
import getOpportunityList from '@salesforce/apex/OpportunityController.getOpportunityList';

export default class ChartParentTest extends LightningElement {
    @track oppBarConfig;
    @track oppPieConfig;
    @track oppDoughnutConfig;
    @track oppPolarAreaConfig;
    @track oppBubbleConfig;
    @track oppLineConfig;
    @track chartBackgroundColorMap = new Map();

    connectedCallback() {
        this.chartBackgroundColorMap.set(0, 'rgb(255, 99, 132)'); // red
        this.chartBackgroundColorMap.set(1, 'rgb(255, 205, 86)'); // yellow
        this.chartBackgroundColorMap.set(2, 'rgb(3, 145, 15)');   // green
        this.chartBackgroundColorMap.set(3, 'rgb(54, 162, 235)'); // blue
        this.chartBackgroundColorMap.set(4, 'rgb(235, 111, 54)'); // orange
        this.chartBackgroundColorMap.set(5, 'rgb(75, 192, 192)'); // light green
        this.chartBackgroundColorMap.set(6, 'rgb(163, 75, 192)'); // purple
    }

    @wire(getOpportunityList)
    wiredOpportunityList({ error, data }) {
        if (data) {
            let opportunityStages = [];
            let stageDataCounts = [];
            let backgroundColors = [];
            let opportunityDataMap = new Map();

            data.forEach(opportunity => {
                if (!opportunityDataMap.has(opportunity.StageName)) {
                    opportunityDataMap.set(opportunity.StageName, 1);
                } else {
                    opportunityDataMap.set(opportunity.StageName, opportunityDataMap.get(opportunity.StageName) + 1);
                }
            });

            let colorIndex = 0;
            opportunityDataMap.forEach((value, key) => {
                console.log('Stage: ' + key + ' | Count: ' + value);
                opportunityStages.push(key);
                stageDataCounts.push(value);
                backgroundColors.push(this.chartBackgroundColorMap.get(colorIndex));
                colorIndex++;
            });

            if (stageDataCounts.length > 0) {
                const chartData = {
                    labels: opportunityStages,
                    datasets: [{
                        label: 'Opportunities',
                        data: stageDataCounts,
                        backgroundColor: backgroundColors,
                        borderColor: backgroundColors,
                        borderWidth: 1
                    }]
                };

                const chartOptions = {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                };

                this.oppBarConfig = {
                    type: 'bar',
                    data: chartData,
                    options: chartOptions,
                };

                this.oppPieConfig = {
                    type: 'funnel',
                    data: chartData,
                    options: chartOptions,
                };

                this.oppDoughnutConfig = {
                    type: 'doughnut',
                    data: chartData,
                    options: chartOptions,
                };

                this.oppPolarAreaConfig = {
                    type: 'polarArea',
                    data: chartData,
                    options: chartOptions,
                };

                this.oppBubbleConfig = {
                    type: 'bubble',
                    data: chartData,
                    options: chartOptions,
                };

                this.oppLineConfig = {
                    type: 'line',
                    data: chartData,
                    options: chartOptions,
                };
            }
        } else if (error) {
            console.error(error);
        }
    }
}