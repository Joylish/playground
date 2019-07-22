package ajou.realCoding.my_refactoring.dirt;

public class Item {
    public String Name;

    public int SellIn;

    public int Quality;

    public Item(String name, int sellIn, int quality) {
        this.Name = name;
        this.SellIn = sellIn;
        this.Quality = quality;
    }

    @Override
    public String toString() {
        return this.Name + ", " + this.SellIn + ", " + this.Quality;
    }
}
