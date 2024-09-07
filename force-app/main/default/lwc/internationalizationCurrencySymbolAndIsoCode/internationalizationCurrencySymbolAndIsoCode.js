import { LightningElement, track } from 'lwc';
import LOCALE from "@salesforce/i18n/locale";
import CURRENCY from "@salesforce/i18n/currency";
import TIMEZONE from "@salesforce/i18n/timeZone";

export default class InternationalizationCurrencySymbolAndIsoCode extends LightningElement {

    @track buttonClicked = false;
    @track number = 10050.5;
    @track formattedCurrency;
    @track timeZone;
    @track formattedDate;
    date = new Date(2022, 6, 25);

    connectedCallback() {
    }

    // formating the date for their locale
    handleFormattedDate() {
        this.formattedDate = new Intl.DateTimeFormat(LOCALE).format(this.date);
    }

    // fetching the timezone through standard salesforce 
    handleTimeZone() {
        this.timeZone = TIMEZONE;
        this.buttonClicked = true;
    }

    handleFormattedCurrency() {
        this.formattedCurrency = new Intl.NumberFormat(LOCALE, {
        style: "currency",
        currency: CURRENCY,
        currencyDisplay: "symbol"
        }).format(this.number)+ ' ' + CURRENCY;
    }

    handleClick() {
        console.log('button click');
        this.handleFormattedCurrency();
        this.handleTimeZone();
        this.handleFormattedDate();
        this.buttonClicked = true;
    }

    handleCancel() {
        this.buttonClicked = false;
    }
}