import { LitElement, html} from 'https://cdn.skypack.dev/lit-element';

import './my-header.js';

class HeyYo extends LitElement {
    render() {
        return html`<div><h1>Hello world!</h1></div>
        <my-header></my-header>`
    }
}

// class HeyYo extends HTMLElement {
//     connectedCallback() {
//         let label = document.createElement('label');
//         label.innerText = 'label!';
//         this.appendChild(label);
//     }
// }

customElements.define('hey-yo', HeyYo);