package ua.com.discounttime.repository.entity.views;

import lombok.Data;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "item_info_view", schema = "discount_time")
@Data
public class ItemInfoView {

    @Id
    @Column(name = "article")
    private int article;

    @Column(name = "name")
    private String name;

    @Column(name = "brand")
    private String brand;

    @Column(name = "discount_on_brand")
    private int discountOnBrand;

    @Column(name = "category")
    private String category;

    @Column(name = "discount_on_category")
    private int discountOnCategory;

    @Column(name = "type")
    private String type;

    @Column(name = "discount_on_type")
    private int discountOnType;

    @Column(name = "collection")
    private String collection;

    @Column(name = "discount_on_collection")
    private int discountOnCollection;

    @Column(name = "price")
    private BigDecimal price;

    @Column(name = "item_discount")
    private int itemDiscount;
}
