package ua.com.discounttime.repository.entity;

import lombok.*;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "item_size", schema = "discount_time")
@Getter
@Setter
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ItemSize {

    @Id
    @Column(name = "item_article")
    private int itemArticle;

    @Id
    @Column(name = "size_id")
    private int sizeId;

    @Column(name = "quantity")
    private int quantity;

    @ManyToMany(mappedBy = "itemsSizes")
    private Collection<Item> items;

    @ManyToMany(mappedBy = "sizesItems")
    private Collection<Size> sizes;
}
