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

    public Member matchingMemberAccount(String data)
    {
        String[] memberData = data.split("-");
        String mail = memberData[0];
        String pass = memberData[1];
        Member returnMember = null;
        List<Member> members = memberDal.getListMember();
        for (Member member: members)
        {
            if(member.getMail().equals(mail) && member.getPass().equals(pass))
            {
                returnMember = member;
            }
        }
        return returnMember;
    }

    public String getMemberPass(int id)
    {
        Member member = memberDal.getMemberInfoById(id);
        return member.getPass();
    }

    public String saveNewMemberInfo(Member member)
    {
        return memberDal.updateMemberInfo(member);
    }
}
