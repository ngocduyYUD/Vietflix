package triperDteam.vietflix.Program.Bank;

import org.springframework.stereotype.Service;
import triperDteam.vietflix.Program.Entity.Transaction.Transaction;
@Service
public class BankService {

    private Boolean cartCheck(String cardHolderName, String cardNumber,int securityCode, String expiratonDate)
    {
        if(cardHolderName.equals("BUI NGOC DUY") && cardNumber.equals("1234567812345678")
                && securityCode == 123)

        {return true;}
        return false;
    }
    private Boolean checkBalance()
    {
        return true;
    }

    public String newTransaction(Transaction transaction)
    {
        if(!cartCheck(transaction.getCardHolderName(), transaction.getCardNumber(), transaction.getSecurityCode(), transaction.getExpiratonDate()))
        {
            return "WRONG CART INFO";
        }
        if(checkBalance())
        {
            return "BUY SUCCESSFULLY";
        }
        else
        {
            return "NOT ENOUGH BALANCE";
        }
    }
}
