import { LitElement, html} from 'https://cdn.skypack.dev/lit-element';

class MyHeader extends LitElement {
    render() {
        return html`<div>Hello This is my-header</div>`;
    }
}
customElements.define('my-header', MyHeader);