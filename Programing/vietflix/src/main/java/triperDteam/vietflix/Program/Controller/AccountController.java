package triperDteam.vietflix.Program.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import triperDteam.vietflix.Program.Entity.Member.Member;
import triperDteam.vietflix.Program.Model.MemberModel;
import triperDteam.vietflix.Program.Service.AccountService;

import java.util.List;
@CrossOrigin(origins = "http://localhost:5173/", maxAge = 3600)
@RestController
@RequestMapping("api/members")
public class AccountController {
    @Autowired
    AccountService accountService;

    @GetMapping("/viewMemberInfo/{id}")
    public ResponseEntity<Member> viewMemBerInfo(@PathVariable int id)
    {
        try{
            Member member = accountService.setMemberInfo(id);
            if(member == null)
            {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(member, HttpStatus.OK);
        }catch (Exception e)
        {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/checkBoughtPackage/{id}")
    public ResponseEntity<Boolean> checkMemberBoughtPackage(@PathVariable int id)
    {
        boolean alreadyBought = accountService.checkMemberPackageExpirationDate(id);
        return new ResponseEntity<>(alreadyBought, HttpStatus.OK);
    }

    @GetMapping("/login/{data}")
    public ResponseEntity<Member> memberLogin(@PathVariable String data)
    {
        try{
            Member member = accountService.matchingMemberAccount(data);
            if(member == null)
            {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(member, HttpStatus.OK);
        }catch (Exception e)
        {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/getMemberPass/{id}")
    public ResponseEntity<String> viewMemberPass(@PathVariable int id)
    {
        String pass = accountService.getMemberPass(id);
        return new ResponseEntity<>(pass, HttpStatus.OK);
    }

    @PostMapping("/changeInfo")
    public ResponseEntity<String> changeMemberInfo(@RequestBody Member member)
    {
        String result = accountService.saveNewMemberInfo(member);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

}
