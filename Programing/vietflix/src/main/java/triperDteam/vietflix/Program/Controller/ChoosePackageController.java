package triperDteam.vietflix.Program.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import triperDteam.vietflix.Program.Bank.BankService;
import triperDteam.vietflix.Program.Entity.Transaction.Transaction;
import triperDteam.vietflix.Program.Entity.Package.Package;
import triperDteam.vietflix.Program.Service.AccountService;
import triperDteam.vietflix.Program.Service.PackageService;

import java.util.List;

@RestController
@RequestMapping("api/package")
public class ChoosePackageController {
    @Autowired
    PackageService packageService;
    @Autowired
    BankService bankService;
    @Autowired
    AccountService accountService;

    @GetMapping("/viewAllPackage")
    public ResponseEntity<List<Package>> viewAllPackage()
    {
        try {
            List<Package> packages = packageService.setListPackage();
            if(packages.isEmpty())
            {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(packages, HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping("/pay")
    public ResponseEntity<String> pay(@RequestBody Transaction transaction)
    {
        String result = bankService.newTransaction(transaction);
        if(result.equals("BUY SUCCESSFULLY"))
        {
            accountService.updateMemberPackage(transaction);
        }
        return new ResponseEntity<>(result, HttpStatus.OK);
    }
}
