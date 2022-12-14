module uim.baklava.views.components.forms;

@safe:
import uim.baklava;

// Main
public import uim.baklava.views.components.forms.form;

// Packages
public import uim.baklava.views.components.forms.components;
public import uim.baklava.views.components.forms.crud;

// Modules
public import uim.baklava.views.components.forms.login;
public import uim.baklava.views.components.forms.login2;


template FormThis(string name, bool withEntity = false, bool withEntities = false) {
  const char[] FormThis = `
this() { super(); this.name("`~name~`"); initialize; }
this(DBKLView myView) { this().view(myView); }
this(string myName) { this().name(myName); }
this(DBKLView myView, string myName) { this(myView).name(myName); }`~
(withEntity ? `
this(DOOPEntity myEntity) { this().entity(myEntity); }
this(DBKLView myView, DOOPEntity myEntity) { this(myView).entity(myEntity); }
this(string myName, DOOPEntity myEntity) { this(myName).entity(myEntity); }
this(DBKLView myView, string myName, DOOPEntity myEntity) { this(myView, myName).entity(myEntity); }
` : ``)~
(withEntities ? `
this(DOOPEntity[] myEntities) { this().entities(myEntities); }
this(DBKLView myView, DOOPEntity[] myEntities) { this(myView).entities(myEntities); }
this(string myName, DOOPEntity[] myEntities) { this(myName).entities(myEntities); }
this(DBKLView myView, string myName, DOOPEntity[] myEntities) { this(myView, myName).entities(myEntities); }
` : ``);
}

template FormCalls(string name, bool withEntity = false, bool withEntities = false) {
  const char[] FormCalls = `
auto `~name~`() { return new D`~name~`(); }
auto `~name~`(DBKLView myView) { return new D`~name~`(myView); }
auto `~name~`(string myName) { return new D`~name~`(myName); }
auto `~name~`(DBKLView myView, string myName) { return new D`~name~`(myView, myName); }`~
(withEntity ? `
auto `~name~`(DOOPEntity myEntity) { return new D`~name~`(myEntity); }
auto `~name~`(DBKLView myView, DOOPEntity myEntity) { return new D`~name~`(myView, myEntity); }
auto `~name~`(string myName, DOOPEntity myEntity) { return new D`~name~`(myName, myEntity); }
auto `~name~`(DBKLView myView, string myName, DOOPEntity myEntity) { return new D`~name~`(myView, myName, myEntity); }
` : ``)~
(withEntities ? `
auto `~name~`(DOOPEntity[] myEntities) { return new D`~name~`(myEntities); }
auto `~name~`(DBKLView myView, DOOPEntity[] myEntities) { return new D`~name~`(myView, myEntities); }
auto `~name~`(string myName, DOOPEntity[] myEntities) { return new D`~name~`(myName, myEntities); }
auto `~name~`(DBKLView myView, string myName, DOOPEntity[] myEntities) { return new D`~name~`(myView, myName, myEntities); }
` : ``);
}

