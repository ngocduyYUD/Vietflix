package triperDteam.vietflix.Program.Entity.Transaction;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Transaction {
    private String cardHolderName;
    private String cardNumber;
    private int securityCode;
    private String expiratonDate;
    private Float packagePrice;
    private int memberId;
    private int packageId;
}

