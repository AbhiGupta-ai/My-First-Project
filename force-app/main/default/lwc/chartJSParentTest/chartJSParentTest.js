import { LightningElement , track, api, wire} from 'lwc'
import getOpportunityList from '@salesforce/apex/OpportunityController.getOpportunityList';

export default class ChartJSParentTest extends LightningElement {
    oppBarconfig;
    oppPieconfig;
    oppDoughnutConfig;
    oppPolarAreaConfig;
    oppBubbleConfig;
    oppLineConfig;

    mapChartBackgroundColor = new Map();

    connectedCallback() {
        this.mapChartBackgroundColor.set(0, 'rgb(255, 99, 132)'); // red
        this.mapChartBackgroundColor.set(1, 'rgb(255, 205, 86)'); // yellow
        this.mapChartBackgroundColor.set(2, 'rgb(3, 145, 15)'); // green
        this.mapChartBackgroundColor.set(3, 'rgb(54, 162, 235)'); // blue
        this.mapChartBackgroundColor.set(4, 'rgb(235, 111, 54)'); // orange
        this.mapChartBackgroundColor.set(5, 'rgb(75, 192, 192)'); // light green
        this.mapChartBackgroundColor.set(6, 'rgb(163, 75, 192)'); // purple
    }

    @wire(getOpportunityList)
    wiredOpportunityList({ error, data }) {
        if (data) {
            const listOfOppStatus = [];
            const listOfOppStatusDataCount = [];
            const listOfBackgroundColor = [];
            const mapOppData = new Map();

            data.forEach(opportunity => {
                if (!mapOppData.has(opportunity.StageName)) {
                    mapOppData.set(opportunity.StageName, 1);
                } else {
                    mapOppData.set(opportunity.StageName, mapOppData.get(opportunity.StageName) + 1);
                }
            });

            let index = 0;
            const bgColor = this.mapChartBackgroundColor;

            mapOppData.forEach((value, key) => {
                console.log(`Key -> ${key}, Value -> ${value}`);
                listOfOppStatus.push(key);
                listOfOppStatusDataCount.push(value);
                listOfBackgroundColor.push(bgColor.get(index));
                index++;
            });

            if (listOfOppStatusDataCount.length > 0) {
                this.oppBarconfig = {
                    type: "bar",
                    data: {
                        labels: listOfOppStatus,
                        datasets: [{
                            label: 'Opportunity',
                            data: listOfOppStatusDataCount,
                            backgroundColor: listOfBackgroundColor,
                            borderColor: listOfBackgroundColor,
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                };

                this.oppPieconfig = {
                    type: "pie",
                    data: {
                        labels: listOfOppStatus,
                        datasets: [{
                            label: 'Opportunity',
                            data: listOfOppStatusDataCount,
                            backgroundColor: listOfBackgroundColor,
                            borderColor: listOfBackgroundColor,
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                };

                this.oppDoughnutConfig = {
                    type: "doughnut",
                    data: {
                        labels: listOfOppStatus,
                        datasets: [{
                            label: 'Opportunity',
                            data: listOfOppStatusDataCount,
                            backgroundColor: listOfBackgroundColor,
                            borderColor: listOfBackgroundColor,
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                };

                this.oppPolarAreaConfig = {
                    type: "polarArea",
                    data: {
                        labels: listOfOppStatus,
                        datasets: [{
                            label: 'Opportunity',
                            data: listOfOppStatusDataCount,
                            backgroundColor: listOfBackgroundColor,
                            borderColor: listOfBackgroundColor,
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                };

                this.oppBubbleConfig = {
                    type: "bubble",
                    data: {
                        labels: listOfOppStatus,
                        datasets: [{
                            label: 'Opportunity',
                            data: listOfOppStatusDataCount,
                            backgroundColor: listOfBackgroundColor,
                            borderColor: listOfBackgroundColor,
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                };

                this.oppLineConfig = {
                    type: "line",
                    data: {
                        labels: listOfOppStatus,
                        datasets: [{
                            label: 'Opportunity',
                            data: listOfOppStatusDataCount,
                            backgroundColor: listOfBackgroundColor,
                            borderColor: listOfBackgroundColor,
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                };
            }
        } else if (error) {
            console.log(error);
        }
    }
}