package triperDteam.vietflix.Program.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import triperDteam.vietflix.Program.Entity.Member.Member;
import triperDteam.vietflix.Program.Model.MemberModel;
import triperDteam.vietflix.Program.Service.AccountService;

import java.util.List;

@RestController
@RequestMapping("api/members")
public class AccountController {
    @Autowired
    AccountService accountService;

    @GetMapping("/viewMemberInfo/{id}")
    public ResponseEntity<MemberModel> viewMemBerInfo(@PathVariable int id)
    {
        try{
            Member member = accountService.setMemberInfo(id);
            MemberModel memberModel = new MemberModel(member);
            if(memberModel == null)
            {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(memberModel, HttpStatus.OK);
        }catch (Exception e)
        {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }


}
