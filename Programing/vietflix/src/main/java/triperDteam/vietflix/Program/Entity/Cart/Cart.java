package triperDteam.vietflix.Program.Entity.Cart;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
public class Cart {
    private String cardHolderName;
    private String cardNumber;
    private int securityCode;
    private String expiratonDate;
}

