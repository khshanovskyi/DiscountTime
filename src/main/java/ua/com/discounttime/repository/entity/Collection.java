package ua.com.discounttime.repository.entity;

import lombok.*;

import javax.persistence.*;

@Entity
@Table(name = "collection", schema = "discount_time")
@Getter
@Setter
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Collection {

    @Id
    @Column(name = "id")
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "discount")
    private int discount;

    @OneToMany(mappedBy = "collection")
    private java.util.Collection<Item> items;
}
