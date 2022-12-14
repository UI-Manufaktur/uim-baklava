module uim.baklava.views.components.forms.login2;

@safe:
import uim.baklava;

class DBKLLogin2Form : DBKLForm {
  mixin(BKLViewComponentThis!("BKLLogin2Form"));

  override void initialize() {
    super.initialize;
  }
  
  override DH5Obj[] toH5(STRINGAA options = null) {
    super.toH5(options);

    DH5Obj[] results;

    results ~= 
      H5Form("loginForm", ["card", "card-md"], ["method":"post", "autocomplete":"off", "action":"login2_action"], 
        BS5InputHidden("loginId", ["name":"loginId"]).value(options.get("loginId", null)),
        H5Div(["card-body"], 
          H5H2(["card-title", "text-center", "mb-4"], "Anmeldung"),
          H5Div(["mb-2"], 
            H5Label(["form-label"], H5String("Passwort"),
              H5Span(["form-label-description"], 
                H5A(["href":"/lostpassword"], "Passwort vergessen?"))),
            H5Div(["input-group input-group-flat"], 
              UIMPasswordInput.id("loginPW").name("loginPW").placeholder("Passwort eingeben").addAttributes(["autocomplete":"off"]),
              H5Span(["input-group-text"], 
                H5A(["link-secondary"], 
                  ["href":"#", "title":"", "data-bs-toggle":"tooltip", "data-bs-original-title":"Passwort anzeigen."], 
                  tablerIcon("exe")))),
          H5Div(["invalid-feedback"], "Bitte ein gültiges Passwort eingeben")
        ),
        H5Div(["form-footer"], 
          BS5ButtonSubmit(["btn-primary w-100"], "Zur Anmeldung")
        )
      ));

    return results;
  }
}
mixin(BKLViewComponentCalls!("BKLLogin2Form", "DBKLLogin2Form"));

version(test_baklava) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    // TODO
}}
