export default class Gate{

    constructor(user){
        this.user = user;
    }

    isSuperAdmin(){
        return this.user.type === 'super-admin';
    }

    isManager(){
        return this.user.type === 'manager';
    }

    isAdmin(){
        return this.user.type === 'admin';
    }

    isPramuniaga(){
        return this.user.type === 'pramuniaga';
    }

    isSales(){
        return this.user.type === 'sales';
    }

    isProduksi(){
        return this.user.type === 'produksi';
    }

    isManagerAndAdmin(){
        if(this.user.type === 'manager' || this.user.type === 'admin'){
            return true;
        }
    }

    // isAdminAndUser(){
    //     if(this.user.type === 'admin' || this.user.type === 'user'){
    //         return true;
    //     }
    // }

}
