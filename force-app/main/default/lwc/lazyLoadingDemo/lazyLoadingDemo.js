import { LightningElement, track } from 'lwc';
import loadDataById from '@salesforce/apex/LazyLoadingController.loadDataById';
import loadMoreData from '@salesforce/apex/LazyLoadingController.loadMoreData';
import AccountRecordCount from '@salesforce/apex/LazyLoadingController.AccountRecordCount';
import getAccounts from '@salesforce/apex/LazyLoadingController.getAccounts';

const columns = [
    { label: 'Id', fieldName: 'Id', type: 'text' },
    { label: 'Name', fieldName: 'Name', type: 'text'},
    { label: 'Industry', fieldName: 'Industry', type: 'text'},
    { label: 'Rating', fieldName: 'Rating', type: 'text'}
];

export default class LazyLoadingDemo extends LightningElement {

    columns = columns;
    error;
    columns = columns;
    rowLimit =25;
    rowOffSet=0;
    data = [];
    // totalRecord = 0;
    // recordLoaded = 0;

    connectedCallback() {
        this.loadData();
    }

    loadData(){
        return  getAccounts({ limitSize: this.rowLimit , offset : this.rowOffSet })
        .then(result => {
            let updatedRecords = [...this.data, ...result];
            this.data = updatedRecords;
            this.error = undefined;
        })
        .catch(error => {
            this.error = error;
            this.data = undefined;
        });
    }

    handleMoreData(event) {
        const currentRecord = this.data;
        const { target } = event;
        target.isLoading = true;

        this.rowOffSet = this.rowOffSet + this.rowLimit;
        this.loadData()
            .then(()=> {
                target.isLoading = false;
            });   
    }

    // async loadData() {
    //     try {

    //         this.totalRecord = await AccountRecordCount();
    //         this.data = await loadDataById();
    //         this.recordLoaded = this.data.length;
            
    //     } catch (error) {
    //         console.log('Error :: ', error);
    //     }
    // }

    // async handleMoreData(event) {
    //     try {
    //         const { target } = event;
    //         target.isLoading = true;
    //         let currentRecord = this.data;
    //         let lastRecord = currentRecord[currentRecord.length - 1];
    //         let newRecords = await loadMoreData({lastName: lastRecord.Name, lastId: lastRecord.Id});

    //         this.data = [...currentRecord, ...newRecords];
    //         target.isLoading = false;
    //     } catch (error) {
    //         console.log('Error ', error);
    //     }
    // }
}