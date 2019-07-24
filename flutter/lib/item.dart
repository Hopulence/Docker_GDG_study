
class Item {
  String title;
  String content;

  Item({this.title, this.content});

  @override
  String toString() {
    return "Item($title, $content)";
  }
}