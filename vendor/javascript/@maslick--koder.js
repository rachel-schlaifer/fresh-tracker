import{C as e}from"./_/58a47ce7.js";import"path";import"fs";import"process";class Koder{get initialized(){return(async()=>{console.log("ESM");this.mod=await e();this.api={createBuffer:this.mod.cwrap("createBuffer","number",["number"]),deleteBuffer:this.mod.cwrap("deleteBuffer","",["number"]),triggerDecode:this.mod.cwrap("triggerDecode","number",["number","number","number"]),getScanResults:this.mod.cwrap("getScanResults","number",[])};return this})()}decode(e,t,r){const s=this.api.createBuffer(t*r*4);this.mod.HEAPU8.set(e,s);const i=[];if(this.api.triggerDecode(s,t,r)>0){const e=this.api.getScanResults();i.push(this.mod.UTF8ToString(e));this.api.deleteBuffer(e)}return i.length>0?i[0]:null}}export{Koder as default};

