package triperDteam.vietflix.Program.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import triperDteam.vietflix.Program.DAL.Member_DAL;
import triperDteam.vietflix.Program.Entity.Member.Member;

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

}
