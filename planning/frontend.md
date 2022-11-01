# Frontend Planning

Doc to summarize major changes to the frontend for the tracker. 

## Improved `Read Contract` Section Including Sending Txs to Any Method

Right now the tracker has a `Read Contract` section which allows users to hit read-only methods but crucially does not allow the user to execute Txs to write methods. There is a tool in use in the ecosystem by Yudus Labs that allows users to connect a wallet and use that to run arbitrary Txs against the contract. It would be very helpful to users if they were able to do all this from within the tracker. 

## Integrate HANA Wallet 

Pretty simple, HANA Wallet should be the default login provider for the tracker. ICONex should still be supported with perhaps some toggle or something to switch between the two. 

## Analytics Dashboards 

It would be really cool if we had a section for dashboards showing user activity and other interesting metrics about the network. Talking with two members of the community about that right now. Backend needs to be built first but there is already a lot you can do with the existing one. A working group will be created before plans are made. 

## Rebuild Frontend 

This is something that will not be handled by sudoblock but is something that has been discussed with other teams already. Current version of the tracker was focused on integrating existing frontend with new backend. Next version will be focused on building new front with minimal changes to existing backend. 
