module uim.baklava.views.components.forms.components.contents.cards;

@safe:
import uim.baklava;

class DBKLCardsFormContent : DBKLEntitiesViewComponent {
  mixin(BKLViewComponentThis!("BKLCardsFormContent"));

  mixin(OProperty!("DBKLEntityViewComponent", "card"));

  override void initialize() {
    debugMethodCall(moduleName!DBKLCardsFormContent~"::DBKLCardsFormContent("~this.name~"):initialize");   
    super.initialize;
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DBKLEntitiesFormContent~"DBKLEntitiesFormContent::toH5");
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }
    debug writeln("Found entities for table = ", entities.length);

    DH5Obj[] cards = entities.map!(entity => entity ? card.entity(entity).toH5 : null).join; 
      
    return [
      BS5Row(["row-cards"], cards)
    ].toH5;
  } 
}
mixin(BKLViewComponentCalls!("BKLCardsFormContent", "DBKLCardsFormContent"));

version(test_baklava) { unittest {
  assert(BKLCardsFormContent);
}}