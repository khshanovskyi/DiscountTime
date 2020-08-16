package ua.com.discounttime.repository.entity;

import lombok.*;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "size", schema = "discount_time")
@Getter
@Setter
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Size {

    @Id
    @Column(name = "id")
    private int id;

    @Column(name = "uk")
    private double uk;

    @Column(name = "eur")
    private double eur;

    @Column(name = "international")
    private String international;

    @ManyToMany(mappedBy = "sizes")
    private Collection<ItemSize> sizesItems;
}
