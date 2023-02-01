module EkoiosCoin::ekoios_coin{

    use std::signer;
    use aptos_framework::managed_coin;

    struct EkoiosCoin{}

    fun init_module(sender: &signer) {
        aptos_framework::managed_coin::initialize<EkoiosCoin>(
            sender,
            b"Ekoios  Coin",
            b"EKOIOS",
            6,
            false,
        );

        register_coin(sender);

        aptos_framework::managed_coin::mint<EkoiosCoin>(
            sender,
            signer::address_of(sender),
            10000000000000
        );
    }

    public entry fun register_coin(sender: &signer){
        aptos_framework::managed_coin::register<EkoiosCoin>(sender);
    }

}