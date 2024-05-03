sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'dash/test/integration/FirstJourney',
		'dash/test/integration/pages/BTPUserList',
		'dash/test/integration/pages/BTPUserObjectPage'
    ],
    function(JourneyRunner, opaJourney, BTPUserList, BTPUserObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('dash') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheBTPUserList: BTPUserList,
					onTheBTPUserObjectPage: BTPUserObjectPage
                }
            },
            opaJourney.run
        );
    }
);