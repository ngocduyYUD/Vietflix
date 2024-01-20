package triperDteam.vietflix.Program.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import triperDteam.vietflix.Program.DAL.Member_DAL;
import triperDteam.vietflix.Program.Entity.Member.Member;
import triperDteam.vietflix.Program.Entity.Transaction.Transaction;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class AccountService {
    @Autowired
    Member_DAL memberDal;
    public Member setMemberInfo(int id)
    {
        return memberDal.getMemberInfoById(id);
    }

    public Boolean checkMemberPackageExpirationDate(int id)
    {
        Member member = memberDal.getMemberInfoById(id);
        if(member.getPackage_id() == 0)
        {
            return false;
        }
        return true;
    }
    public void updateMemberPackage(Transaction transaction)
    {
        memberDal.updatePackageMember(transaction.getMemberId(), transaction.getPackageId());
    }

    public void saveMovieToHistory(String id)
    {
        String[] allId = id.split("-");
        int movieId = Integer.parseInt(allId[0]);
        int userId = Integer.parseInt(allId[1]);
        memberDal.updateHistory(movieId, userId);
    }
}
