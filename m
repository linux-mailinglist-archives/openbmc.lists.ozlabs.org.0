Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE49B401902
	for <lists+openbmc@lfdr.de>; Mon,  6 Sep 2021 11:41:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H33Lk4RLfz2xXQ
	for <lists+openbmc@lfdr.de>; Mon,  6 Sep 2021 19:41:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=J/aGV6bB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex.com (client-ip=185.132.180.100;
 helo=mx07-002d6701.pphosted.com;
 envelope-from=prvs=38830dd135=chris.chen3@flex.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256
 header.s=dkim header.b=J/aGV6bB; dkim-atps=neutral
Received: from mx07-002d6701.pphosted.com (mx07-002d6701.pphosted.com
 [185.132.180.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H33L96gn7z2xrr
 for <openbmc@lists.ozlabs.org>; Mon,  6 Sep 2021 19:40:48 +1000 (AEST)
Received: from pps.filterd (m0132504.ppops.net [127.0.0.1])
 by mx07-002d6701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1869XggU021516
 for <openbmc@lists.ozlabs.org>; Mon, 6 Sep 2021 09:40:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=dkim; bh=g/aYm5MghJ/eM9RBDJDYE40KRMOPMuS7nlAxdmmoPU4=;
 b=J/aGV6bB516YTgGPgZXdNbr3NGpVoKRLhrDhhSCVSVYtLBmZ2t3TmhBRbqOFfQOXwEpt
 rzb1akyOLe5yRLMmku93B9usnf9Su1u4Ho7WOdv0msun/hMUZUDnNaQysx4rMVKjvzUq
 JmsniSzHr/0gR3Gp9Oagny0sh6ITB7B4A2qN9FKJtb72Ri8nrRGZEuo/1lnaLaXef/we
 YyMRr+eBbsJzvjb1fAlY8/BpVZLsJ38DV+A+tnlkTF3l1jjF4kycIlqGyCZcgJG6o56e
 /QJHVM+gfy9qrehbbotO6BijPdCptAmyPesGK10lLmNU77xpODBCZW98ojImoJCLTdGo CA== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2177.outbound.protection.outlook.com [104.47.73.177])
 by mx07-002d6701.pphosted.com with ESMTP id 3auyd16qe7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 06 Sep 2021 09:40:43 +0000
Received: from DM6PR06CA0012.namprd06.prod.outlook.com (2603:10b6:5:120::25)
 by SJ0PR08MB6704.namprd08.prod.outlook.com (2603:10b6:a03:2de::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Mon, 6 Sep
 2021 09:40:40 +0000
Received: from DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:120:cafe::ed) by DM6PR06CA0012.outlook.office365.com
 (2603:10b6:5:120::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Mon, 6 Sep 2021 09:40:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 144.49.247.29)
 smtp.mailfrom=flex.com; lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=fail action=oreject
 header.from=flex.com;
Received-SPF: Fail (protection.outlook.com: domain of flex.com does not
 designate 144.49.247.29 as permitted sender) receiver=protection.outlook.com; 
 client-ip=144.49.247.29; helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (144.49.247.29) by
 DM6NAM11FT020.mail.protection.outlook.com (10.13.172.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Mon, 6 Sep 2021 09:40:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JOwoJIRB/q+C4fE+9cJcyiFAK8x1t6ljk0TGNBRRxbjB/li8bpvvDLubfKLjXZ88J5NWWlvAj0ZEx5Lbc/TRKhcRyhu34IaRNxTH/LuhrDzmzlidNvBaKHCe7uLLYBTCtTH2BhKADu2AlEDF5twkmF6O5YKSUBYldOnhMGpjLhDK1bjnSxbqNR8QNvjQ9CNdw+UxNZT6EmdubobAm+tnmCF1N1dB5mT9aGvM5mx3QKaBDnwxQH2zcu7euktkj8DkVOOrgP0NLmxbkyVOoAI7Ugs78qPyXuHr3tBveM+ZkcXX3U6Bo4w6bbXCQV4DxpdYawsiDIqdgVB4/H0wz4pZIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=g/aYm5MghJ/eM9RBDJDYE40KRMOPMuS7nlAxdmmoPU4=;
 b=Y4s99wgRS1SN91XOqpOtCg1ctfCogLfA4hnAEBNKoDVkw3bLw5rzBBbY8CSjueqL35KwzkcbYz/ZJwtkFKf2RF8GZExqot94PrU7I7d+lTdTdRV5FCR6lHFIKj26QplOo+UPAtZH+A4pGdozrDNeR7LI5a5mR5ylRo9ytJG360Axem4kET0/3e4vgwu/l38Mkm+dKsorET/QKmMGB9DWfUNsXH+8GwF7j16IULNVLnJrrsVo16BQqaQwMNlBLS9fHifEMeiLvtDmJQLuuu+mwv4bc/n9k5HRTaxWP2x3iWY9Z/ixTyR1ad30qsUb5hcHdnIOyL1/ElosLvyRBUPeMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from DM6PR08MB5514.namprd08.prod.outlook.com (2603:10b6:5:10a::33)
 by DM5PR08MB3433.namprd08.prod.outlook.com (2603:10b6:4:61::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Mon, 6 Sep
 2021 09:40:37 +0000
Received: from DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::f5ad:4d37:9d66:b9ac]) by DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::f5ad:4d37:9d66:b9ac%3]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 09:40:37 +0000
From: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: =?big5?B?pl7C0DogW3Bob3NwaG9yLWhvc3QtaXBtaWRdIFF1ZXN0aW9ucyBhYm91dCBJUE1J?=
 =?big5?Q?_(OEM)_command_development?=
Thread-Topic: [phosphor-host-ipmid] Questions about IPMI (OEM) command
 development
Thread-Index: AQHXn55HfvXlhYxihUiF8XEtvcIIK6uWwmNJ
Date: Mon, 6 Sep 2021 09:40:37 +0000
Message-ID: <DM6PR08MB55145854126B411F1A9AFE29DCD29@DM6PR08MB5514.namprd08.prod.outlook.com>
References: <DM6PR08MB5514D818A3029FA77BFB523BDCCE9@DM6PR08MB5514.namprd08.prod.outlook.com>
In-Reply-To: <DM6PR08MB5514D818A3029FA77BFB523BDCCE9@DM6PR08MB5514.namprd08.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 4c240e12-be75-8d6f-a052-cc6c0653d925
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=flex.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 80678ff6-00a8-459c-5ea5-08d9711a631a
x-ms-traffictypediagnostic: DM5PR08MB3433:|SJ0PR08MB6704:
X-Microsoft-Antispam-PRVS: <SJ0PR08MB670401B479E3ACF60346F6D3DCD29@SJ0PR08MB6704.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: YNgRjzsvQJkDqQxuJIwP2uZkaFPxrszTCPmJqQRJrluUu4G52ZRkePZyHSGsyVmLR3Chcee7UC1Eh+Yg1CDes+K8BjsYCxKlUNZfZ6JH1hmNwOccyoNfGd5Qmv7LkRxrKQTdcwDKUua3o+R3hMUirUxuQ+sFDf4j01cDmy9vK55FPyWiA9TtiV+OA0kV3Zz0aUgn8J3t4Dj7i/mvcYSjZIzFp4XUaHkF0vImSlX8QlflyVbyoi98cj8SZzqcSLBcdzS9U4jU50qY4I+PmjOXd+YRvl4/lOnBbfGWdov6jBaKTiMH8fXa3A5vES6V4bWaKnJRXDgxMlwspyWkw1Ro6Pbq5b5bL2H3j05CDkrHyg0MNFDRvpuPZocsZROZnMnw2Ehnm5MEzDdpagSOTUsl4aZAHYuPxEy+8CpYxrVYsvGVIXyomxnU62JYnpoSty/9k58MKwOXo03HLBo2YoOdviVtaCA4SB8K2D1TrUkDHIhC/ME+YahQX5prHpgorgCddZ6EVtTXy2PfMtxnOy37GBuqtG7KZkPNRjYBbpU+JnUrCYPTp7UGBTc7WySDHA3FDe6sZpZ4Xy821BioDN/Ha4zqIMojKyFvCnj8W4X9dzk8XOwMQ6Ei+6UwE6e8gRHHRcj/IQYugOy6iyiCXlHB4LCUVyNaQsPV+K8CLZBkRQMi0W1Rpz8oWEAVOTfEGXByIiaVpfXPyPIKAUUOWNUzY69yMctFxtTfWKklHb7Lh2QUq87Rxc8xPBYFrNb84/Yo751ZpQ0fFdt9OFIxqCH2hdNxrcpJm/Xbif/2tJuA/gYfTqixuSFM1aLeW0VYYB+M
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR08MB5514.namprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(346002)(376002)(136003)(396003)(366004)(39860400002)(166002)(55016002)(224303003)(9686003)(66946007)(66476007)(6916009)(71200400001)(7696005)(91956017)(2906002)(66446008)(86362001)(38070700005)(478600001)(83380400001)(64756008)(316002)(66556008)(76116006)(19627405001)(38100700002)(122000001)(8936002)(6506007)(186003)(33656002)(5660300002)(52536014)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?Z1JZMncvMnhZUFlUNzMxZWNlY0tGTWxUTlRscmdqb2NDM2d6clRWK1ZBZDB2ajZE?=
 =?big5?B?SmlxQ28xbFRwbVd5MmdrU3c0aHVTVUF3dDdRM3RNZlVDcmwyN3dIMy9lcU1nQUxX?=
 =?big5?B?dk1Cdlo0QWhHdUtFbjhIYVdrMyt3WUxoZmVxU00zYldkcEl4MmxDZklrUHZBNUtR?=
 =?big5?B?UElITmtaamYzSElHKzZwSkdFNHl4UU03VmJzbjljWjB1enBjKzYzT1ZVVXdqUzk2?=
 =?big5?B?aE1nTTd0Vy9rV0FEd2QrQkRqeFB3VktSMGpGNU9TMWtybHVXdEUrY2l4QldHd3Fp?=
 =?big5?B?MHJCQVNoczRVSUsxZHh1aHZqcFBLL2pYR0ROZStRcmI0Qndqc3BKRHAxQlhzTEFu?=
 =?big5?B?LzFjdER5dXMwaHFnODE5dW9CbU42ZytFRXFmbkUrYVl5TEJ0MXA5UFJoMmJKU3dO?=
 =?big5?B?Uk80dFRUb05ueGxEQStHank4V3pvbk5uWUNJSS9lWjRkSUVOa21OZTdFWldKOG40?=
 =?big5?B?K3B4MjlmeFNJSVRUZDl5NkFHNGM3TFdrbFQwSys5RjBXd0trREliWndvUUtGOER1?=
 =?big5?B?cStabVdYUkxSbGUyTWFSUzBxK0cxTmVkZ0p2U3c4UFBsck1yQnNBUjBhVnp4WHg1?=
 =?big5?B?MzFnSlFody8yQm8xL1dMY3pWQXdSTFhpNE1ZRlYyckdlVUsxeExkRzlab3VuWmgy?=
 =?big5?B?ZS9ad2MxYUpqUkNBdzgvQ0RyN1pNdlJacXB5M01oa3AxUW9QbGVEM3VSOHp2ZWZj?=
 =?big5?B?N3lTR0dPMjQ4R1NwcHo3N21rcDh3emRaWkM3bENFTjNrUTdPMWtvYjdHS1ROalB0?=
 =?big5?B?dnVLeENyYlZnS1BleW14OUljbCtjdm5QNkQ1RjBmQ09yeG9jRDZNY3Q2eVk0YjNl?=
 =?big5?B?bEQxQXR0WEJZcFV0b3BGeHZjSkUwZ28zVFp1dTVBVjFFWTVYV3RDanhyUm1wYzRR?=
 =?big5?B?TVNiOEpidHRqenJhZ251Yk9ZTUxEYzRiamZvNDhCcktRUjlqSkxUSUJteUU5VkFm?=
 =?big5?B?N3lweEg0SXZzOXRnV0xoL3dodE9oTFJOVjBQMzFuSXAzRjhJR2syU1MrZ0V1NkhK?=
 =?big5?B?MjlGMWhpVHhZQXIrb3JPQWNabTI3d240ZldxelNSZWc0TmxLNGl3L1RBRHRuNndj?=
 =?big5?B?TDJ5eWVFUWNtNmo0UVZVVS9IWDU4NHpabEVYZFl6dC9aY0JRV0hmcGZjMTdiNGUr?=
 =?big5?B?MlN6bmZlZ083WHl4Uk56TEZvVjE2ODM4TklTUXhZSFNreDcwUml5c1ExMVR4bE0x?=
 =?big5?B?NitFUGhuSkpnNHV2NTE5b1lWbmc1bFVqTCtwK1lxdEJMYlB4d0ZhUlRsZzcyTGZj?=
 =?big5?B?Y2gwYm9oNWhUVU9QdFRlcSt2bjZjT0ZoTVpxcGRBZzRaZjZNQVVWN1VET25LTUlB?=
 =?big5?B?ZGZTdXRCZFl6TGE3eVFFNDJBczFYTjdobzhqcEVnTFlDc3pRT2RRSjJBUVQxTnJ5?=
 =?big5?B?Rk5JaXBLa3FVWit0TXg0YzBRZUNuZTlqckZMOWRBSDZQeGE3bFZ4QTR4SEtHUEdF?=
 =?big5?B?ZzRuaXdvTVlEYW8wRVByWVFYK1I0Z3MxaGk4UTlPTWRxdUlrbjNDeFFjOWlLNk5i?=
 =?big5?B?bnRabmdCVXFWcjRwSTVRT3RuZXIrN2lDTkxLNU1yZGFUYVpzMWRmaS80S3NsdDJY?=
 =?big5?B?L0NiTFdZT3N5bTRoTmtxMTFkSjdESFA4Z25FWkdwdTFCL0JWMFpWVmJZY3dwQ3Jp?=
 =?big5?B?dWhNSGwwazNFek1ZcWZWUk5mVjhRLzVxQSsyei9tbnhYM2p2ZDBtZGFRNXA2UVdN?=
 =?big5?Q?l6urIqXuYzECq+M2e/ACIR0gWgLpJoMFgCQVGSHOHvI=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DM6PR08MB55145854126B411F1A9AFE29DCD29DM6PR08MB5514namp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR08MB3433
X-CFilter-Loop: Reflected
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 00550d53-0739-4ad1-a906-08d9711a61d0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Ho/rnXmjgXV/c+9SJ1S0Je/m7e2UnygeH+13/6Bmmsw/Bp4ZmhfKPYb54zyWMiI38mqKHsSo+GnToHPvOjnesW6DOGTwx3tJT1RfwyWcfR9drUKOYqNHwnaKZZnVO8PGwfJ7uckaENdOUzcqbr9kBanDhA79FemFLQpY1pWORbf/wVkJIrny0UYsWyJ61bh0KqTiTzQwyACwrblVhu6Oaubp+hDHrnoAL2G1dJ7H8BYVpBxrABQXpWPRjNKD0ei+61YEuuDlepYFk68272dVE+MqkPaqVE8L3Mt2XKyA3wUJpfaNt/e4rug28KUeDYLJqlXuWokrwEzakKr2Mw3lJEbTMed7LRXwOcL7TNyYO+gUQzEgbzJJ6tZ9NBxxFHOw9/cTGXOcuOk8hAkmjlWynOj+MNsBfqP3vsh4RpE2laJn2DavYfKsEuh/aTMIptvg08wp0rujXC76MWnqHaQme9ocvQsTmnMd0uQ95wOpsFllZB2idxAGhKb/jJUbQfzw2NNbeQMhpemi1kWVCc3DQCYnPnO8eTWpIrmCLCdbkfdl/R30uqPMM75OifiTxDo0VLqqt8E79zkOMfHdZRReJQgw8/Y/iZvIk7gKlzNodPvldMAMHH40nvYqbN0tLX3Q1BTEGwFe5Dlj2pn4WK37eqoQd+4FZZqgw1BWkzpJOJzikJISb1jnQEXvzXW4F915/KGMRAnWbYyaLK/ovzBRdZMa2eJ3wC9IIKX12Hd+5JcAj2wTwNPrB/oUwnaHODi1FwFvRY8fUAW7Rel79Hx1pnG9HNEWDQedm6ilaEfF+EiVKAqdHlv+nJhg2SetqvP2pWuUbLFiOUPsR9RVSPguA==
X-Forefront-Antispam-Report: CIP:144.49.247.29; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.ds.dlp.protect.symantec.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(39860400002)(396003)(346002)(376002)(136003)(46966006)(36840700001)(33656002)(82740400003)(52536014)(81166007)(336012)(478600001)(224303003)(316002)(5660300002)(70586007)(55016002)(166002)(186003)(6916009)(9686003)(19627405001)(70206006)(356005)(83380400001)(6506007)(7696005)(86362001)(26005)(2906002)(8936002)(4186021)(82310400003)(47076005)(36860700001)(21314003)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 09:40:39.2608 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80678ff6-00a8-459c-5ea5-08d9711a631a
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e; Ip=[144.49.247.29];
 Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR08MB6704
X-Proofpoint-GUID: X6qAFajxVaXfH7XlIpIRDBkCMB3-_8Dr
X-Proofpoint-ORIG-GUID: X6qAFajxVaXfH7XlIpIRDBkCMB3-_8Dr
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-06_05:2021-09-03,
 2021-09-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 bulkscore=0 spamscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109060060
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_DM6PR08MB55145854126B411F1A9AFE29DCD29DM6PR08MB5514namp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgYWxsLA0KDQpJIGd1ZXNzIHRoaXMgbWFpbCB3YXMgZ290IG92ZXJ3aGVsbWVkIGJ5IGJ1bmNo
ZXMgb2YgZW1haWxzLCBzbyBwbGVhc2UgbGV0IG1lIHJlc2VuZCBpdCBhbmQgaG9wZSBzb21lb25l
IGNvdWxkIGhlbHAgbWUuIEFub3RoZXIsIEkgYWRkIG9uZSBtb3JlIHF1ZXN0aW9uIG1hcmtlZCAj
NSBiZWxvdy4NCg0KVGhhbmsgeW91Lg0KDQpSZWdhcmRzLA0KQ2hyaXMgQ2hlbg0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0KsUil86rMOiBvcGVuYm1jIDxvcGVuYm1jLWJvdW5j
ZXMrY2hyaXMuY2hlbjM9ZmxleC5jb21AbGlzdHMub3psYWJzLm9yZz4gpU6q7SBDaHJpcyBDaGVu
IChUUEkpIDxDaHJpcy5DaGVuM0BmbGV4LmNvbT4NCrFIpfOk6bTBOiAyMDIxpn45pOsypOkgpFWk
yCAwNjozNA0Kpqyl86rMOiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcgPG9wZW5ibWNAbGlzdHMu
b3psYWJzLm9yZz4NCqVEpq46IFtwaG9zcGhvci1ob3N0LWlwbWlkXSBRdWVzdGlvbnMgYWJvdXQg
SVBNSSAoT0VNKSBjb21tYW5kIGRldmVsb3BtZW50DQoNCkhpIGFsbCwNCg0KSSBoYXZlIHN0dWRp
ZWQgInBob3NwaG9yLWhvc3QtaXBtaWQiIHBhY2thZ2UgZm9yIGEgY291cGxlIG9mIHdlZWtzIGFu
ZCBnb3QgdW5kZXJzdGFuZGluZyB0aGF0IGl0IGhhcyBpbXBsZW1lbnRlZCBzb21lIG1hbmRhdG9y
eSBhbmQgb3B0aW9uYWwgY29tbWFuZHMgYWxyZWFkeS4gQW5kIEkgYWxzbyBrbmV3IHRoYXQgSSdt
IGFibGUgdG8gbGV2ZXJhZ2UgImludGVsLWlwbWktb2VtIiBwYWNrYWdlIHRvIGdldCBtb3JlIGNv
bW1hbmQgaGFuZGxlcnMuIEJ1dCB0aGVyZSdyZSBzb21lIHF1ZXN0aW9ucyByYWlzZWQgaW4gbXkg
bWluZCwgSSBob3BlIHNvbWVvbmUgY291bGQgZ2l2ZSBtZSBzb21lIHN1Z2dlc3Rpb25zLg0KDQog
IDEuICBXaGF0J3MgdGhlIG5vcm1hbCBkZXZlbG9wbWVudCBwcm9jZWR1cmUgaW4gY2FzZSBJIHdh
bnQgdG8gbWFrZSBvdXIgb3duIE9FTSBjb21tYW5kcz8gSSBtZWFuIGRvIHlvdSBndXlzIGVuY291
cmFnZSBtZSB0byBjcmVhdGUgYSBuZXcgInh4eC1pcG1pLW9lbSIgcGFja2FnZSBvciB0byBsZXZl
cmFnZSAiaW50ZWwtaXBtaS1vZW0iIGFuZCB0aGVuIGFkZCBvdXIgb3duIGNvbW1hbmRzIGluIGl0
Pw0KICAyLiAgSSBmb3Igbm93IGFkZGVkICJpbnRlbC1pcG1pLW9lbSIgcGFja2FnZSBvbmx5IGZv
ciB1c2luZyBpdHMgIjxDaGFzc2lzPjo8U2V0IEZyb250IFBhbmVsIEVuYWJsZXM+IiBjb21tYW5k
IGJlY2F1c2UgSSBmaWd1cmVkIG91dCB0aGUgc2FtZSBjb21tYW5kIGluIHRoZSAicGhvc3Bob3It
aG9zdC1pcG1pZCIgaXMgbm90IGFibGUgdG8gbWF0Y2ggdGhlIGQtYnVzIGludGVyZmFjZSBpbiB0
aGUgIng4Ni1wb3dlci1jb250cm9sIi4gSSdtIG5vdCBzdXJlIGlmIEkgd2lsbCBuZWVkIG90aGVy
IGNvbW1hbmRzIGluIHRoZSAiaW50ZWwtaXBtaS1vZW0iLCBidXQgd2hhdCBpZiBJIGRvbid0IG5l
ZWQgb3RoZXIgY29tbWFuZHMsIGhvdyB0byByZW1vdmUgdGhlbT8gdG8gdXNlIHRoZSB3aGl0ZWxp
c3QgbWVjaGFuaXNtPw0KICAzLiAgSXMgaXQgb2theSB0byBhZGQgbW9yZSB0aGFuIDEgeHh4LWlw
bWktb21lIHBhY2thZ2VzPyBJZiB5ZXMsIGhvdyB0byBtYW5hZ2UgdGhlIHdoaXRlbGlzdCBiZXR3
ZWVuIHRoZXNlIDIgT0VNIHBhY2thZ2VzPw0KICA0LiAgQW0gSSBhYmxlIHRvIHVzZSAiaW50ZWwt
aXBtaS1vZW0iIG9uIGEgcGxhdGZvcm0gdGhhdCBpcyB1c2luZyBBTUQgQ1BVPw0KICA1LiAgSG93
IHRvIHByaW50IHRoZSAiZW50cnkoIlNFTkRFUj0lcyIsIHNlbmRlci5jX3N0cigpKSIgcGFydHM/
IEkgbWVhbiBJIGZvciBub3cgY2FuIHByaW50IG91dCAiU2V0IHVwIGlwbWkgY29udGV4dCIgc3Ry
aW5nIGFmdGVyIGZvbGxvd2luZyB0aGUgaW5zdHJ1Y3Rpb24gbGlzdGVkIGluICJodHRwczovL2dp
dGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1jL3dpa2kvRGVidWdnaW5nLU9wZW5CTUMjZW5hYmxpbmct
YXBwbGljYXRpb24tZGVidWciLCBidXQgSSBkb24ndCBzZWUgIlNFTkRFUj0iIHdoZW4gSSBleGVj
dXRlZCAiam91cm5hbGN0bCAtdCBpcG1pZCIgY29tbWFuZC4NCiAgNi4NCg0KICAxLg0KbG9nPGxl
dmVsOjpERUJVRz4oIlNldCB1cCBpcG1pIGNvbnRleHQiLCBlbnRyeSgiU0VOREVSPSVzIiwgc2Vu
ZGVyLmNfc3RyKCkpLA0KICAgICAgICAgICAgICAgICAgICAgIGVudHJ5KCJORVRGTj0weCVYIiwg
bmV0Rm4pLCBlbnRyeSgiTFVOPTB4JVgiLCBsdW4pLA0KICAgICAgICAgICAgICAgICAgICAgIGVu
dHJ5KCJDTUQ9MHglWCIsIGNtZCksIGVudHJ5KCJDSEFOTkVMPSV1IiwgY2hhbm5lbCksDQogICAg
ICAgICAgICAgICAgICAgICAgZW50cnkoIlVTRVJJRD0ldSIsIHVzZXJJZCksDQogICAgICAgICAg
ICAgICAgICAgICAgZW50cnkoIlNFU1NJT05JRD0weCVYIiwgc2Vzc2lvbklkKSwNCiAgICAgICAg
ICAgICAgICAgICAgICBlbnRyeSgiUFJJVklMRUdFPSV1Iiwgc3RhdGljX2Nhc3Q8dWludDhfdD4o
cHJpdmlsZWdlKSksDQogICAgICAgICAgICAgICAgICAgICAgZW50cnkoIlJRU0E9JXgiLCBycVNB
KSk7DQoNCg0KVGhhbmsgeW91Lg0KDQpSZWdhcmRzLA0KQ2hyaXMgQ2hlbg0KTGVnYWwgRGlzY2xh
aW1lciA6DQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgbWVzc2FnZSBtYXkgYmUg
cHJpdmlsZWdlZCBhbmQgY29uZmlkZW50aWFsLg0KSXQgaXMgaW50ZW5kZWQgdG8gYmUgcmVhZCBv
bmx5IGJ5IHRoZSBpbmRpdmlkdWFsIG9yIGVudGl0eSB0byB3aG9tIGl0IGlzIGFkZHJlc3NlZA0K
b3IgYnkgdGhlaXIgZGVzaWduZWUuIElmIHRoZSByZWFkZXIgb2YgdGhpcyBtZXNzYWdlIGlzIG5v
dCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LA0KeW91IGFyZSBvbiBub3RpY2UgdGhhdCBhbnkgZGlz
dHJpYnV0aW9uIG9mIHRoaXMgbWVzc2FnZSwgaW4gYW55IGZvcm0sDQppcyBzdHJpY3RseSBwcm9o
aWJpdGVkLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIG1lc3NhZ2UgaW4gZXJyb3IsDQpwbGVh
c2UgaW1tZWRpYXRlbHkgbm90aWZ5IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSBvciBkZXN0cm95IGFu
eSBjb3B5IG9mIHRoaXMgbWVzc2FnZSENCg==

--_000_DM6PR08MB55145854126B411F1A9AFE29DCD29DM6PR08MB5514namp_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi all,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I guess this mail was got overwhelmed by bunches of emails, so please let m=
e resend it and hope someone could help me. Another, I add one more questio=
n marked #5 below.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thank you.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Chris Chen</div>
<div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>=B1H=A5=F3=AA=CC:</b> openbmc &=
lt;openbmc-bounces+chris.chen3=3Dflex.com@lists.ozlabs.org&gt; =A5N=AA=ED C=
hris Chen (TPI) &lt;Chris.Chen3@flex.com&gt;<br>
<b>=B1H=A5=F3=A4=E9=B4=C1:</b> 2021=A6~9=A4=EB2=A4=E9 =A4U=A4=C8 06:34<br>
<b>=A6=AC=A5=F3=AA=CC:</b> openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlab=
s.org&gt;<br>
<b>=A5D=A6=AE:</b> [phosphor-host-ipmid] Questions about IPMI (OEM) command=
 development</font>
<div>&nbsp;</div>
</div>
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"font-size:12pt; font-family:Calibri,Helvetica,sans-serif">Hi=
 all,</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"font-size:12pt; font-family:Calibri,Helvetica,sans-serif">I =
have studied &quot;phosphor-host-ipmid&quot; package for a couple of weeks =
and got understanding that it has implemented some mandatory and optional c=
ommands already. And I also knew that I'm able
 to leverage &quot;intel-ipmi-oem&quot; package to get more command handler=
s. But there're some questions raised in my mind, I hope someone could give=
 me some suggestions.</span><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<ol>
<li><span style=3D"font-size:12pt; font-family:Calibri,Helvetica,sans-serif=
">What's the normal development procedure in case I want to make our own OE=
M commands? I mean do you guys encourage me to create a new &quot;xxx-ipmi-=
oem&quot; package or to leverage &quot;intel-ipmi-oem&quot;
 and then add our own commands in it?</span></li><li><span style=3D"font-si=
ze:12pt; font-family:Calibri,Helvetica,sans-serif">I for now added &quot;</=
span><span style=3D"background-color:rgb(255,255,255); display:inline!impor=
tant; font-size:12pt; font-family:Calibri,Helvetica,sans-serif">intel-ipmi-=
oem&quot; package only
 for using its &quot;&lt;Chassis&gt;:&lt;Set Front Panel Enables&gt;&quot; =
command because I figured out the same command in the&nbsp;</span><span sty=
le=3D"background-color:rgb(255,255,255); display:inline!important"><span st=
yle=3D"text-align:start; background-color:rgb(255,255,255); display:inline!=
important; font-size:12pt; font-family:Calibri,Helvetica,sans-serif">&quot;=
phosphor-host-ipmid&quot;
 is not able to match the d-bus interface in the &quot;x86-power-control&qu=
ot;. I'm not sure if I will need other commands in the &quot;intel-ipmi-oem=
&quot;, but what if I don't need other commands, how to remove them? to use=
 the whitelist mechanism?</span><span style=3D"text-align:start; background=
-color:rgb(255,255,255); display:inline!important"><span style=3D"text-alig=
n:left; background-color:rgb(255,255,255); display:inline!important"><span =
style=3D"margin:0px; background-color:rgb(255,255,255); display:inline!impo=
rtant"></span></span></span></span></li><li><span style=3D"background-color=
:rgb(255,255,255); display:inline!important"><span style=3D"text-align:star=
t; background-color:rgb(255,255,255); display:inline!important; font-size:1=
2pt; font-family:Calibri,Helvetica,sans-serif">Is it okay to add more than =
1
 xxx-ipmi-ome packages? If yes, how to manage the whitelist between these 2=
 OEM packages?</span></span></li><li><span style=3D"background-color:rgb(25=
5,255,255); display:inline!important"><span style=3D"text-align:start; back=
ground-color:rgb(255,255,255); display:inline!important; font-size:12pt; fo=
nt-family:Calibri,Helvetica,sans-serif">Am I able to use&nbsp;</span><span =
style=3D"text-align:start; background-color:rgb(255,255,255); display:inlin=
e!important"><span style=3D"text-align:left; background-color:rgb(255,255,2=
55); display:inline!important; font-size:12pt; font-family:Calibri,Helvetic=
a,sans-serif">&quot;intel-ipmi-oem&quot;
 on a platform that is using AMD CPU?</span></span></span></li><li><span st=
yle=3D"background-color:rgb(255,255,255); display:inline!important"><span s=
tyle=3D"text-align:start; background-color:rgb(255,255,255); display:inline=
!important"><span style=3D"text-align:left; background-color:rgb(255,255,25=
5); display:inline!important; font-size:12pt; font-family:Calibri,Helvetica=
,sans-serif">How
 to print the &quot;entry(&quot;SENDER=3D%s&quot;, sender.c_str())&quot; pa=
rts? I mean I for now can print out &quot;Set up ipmi context&quot; string =
after following the instruction listed in &quot;<a href=3D"https://github.c=
om/openbmc/openbmc/wiki/Debugging-OpenBMC#enabling-application-debug" id=3D=
"LPlnk">https://github.com/openbmc/openbmc/wiki/Debugging-OpenBMC#enabling-=
application-debug</a>&quot;,
 but I don't see &quot;SENDER=3D&quot; when I executed &quot;journalctl -t =
ipmid&quot; command.</span></span></span></li><li style=3D"display:block">
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview _EReadonly_=
1"></div>
</li></ol>
<ol start=3D"6">
<li style=3D"display: block;"><span style=3D"background-color:rgb(255,255,2=
55); display:inline!important"><span style=3D"text-align:start; background-=
color:rgb(255,255,255); display:inline!important"><span style=3D"text-align=
:left; background-color:rgb(255,255,255); display:inline!important; font-si=
ze:12pt; font-family:Calibri,Helvetica,sans-serif">
<div style=3D"color:#d4d4d4;background-color:#1e1e1e;font-family:'Droid San=
s Mono', 'monospace', monospace, 'Droid Sans Fallback';font-weight:normal;f=
ont-size:14px;line-height:19px">
<span><span style=3D"color:#dcdcaa">log</span><span>&lt;</span><span style=
=3D"color:#4ec9b0">level</span><span>::</span><span style=3D"color:#4ec9b0"=
>DEBUG</span><span>&gt;(</span><span style=3D"color:#ce9178">&quot;Set up i=
pmi context&quot;</span><span>,
</span><span style=3D"color:#dcdcaa">entry</span><span>(</span><span style=
=3D"color:#ce9178">&quot;SENDER=3D</span><span style=3D"color:#9cdcfe">%s</=
span><span style=3D"color:#ce9178">&quot;</span><span>,
</span><span style=3D"color:#9cdcfe">sender</span><span>.</span><span style=
=3D"color:#dcdcaa">c_str</span><span>()),</span></span>
<div><span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; </span><span style=3D"color:#dcdcaa">entry</span><span>(</span=
><span style=3D"color:#ce9178">&quot;NETFN=3D0x</span><span style=3D"color:=
#9cdcfe">%X</span><span style=3D"color:#ce9178">&quot;</span><span>, netFn)=
,
</span><span style=3D"color:#dcdcaa">entry</span><span>(</span><span style=
=3D"color:#ce9178">&quot;LUN=3D0x</span><span style=3D"color:#9cdcfe">%X</s=
pan><span style=3D"color:#ce9178">&quot;</span><span>, lun),</span></div>
<div><span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; </span><span style=3D"color:#dcdcaa">entry</span><span>(</span=
><span style=3D"color:#ce9178">&quot;CMD=3D0x</span><span style=3D"color:#9=
cdcfe">%X</span><span style=3D"color:#ce9178">&quot;</span><span>, cmd),
</span><span style=3D"color:#dcdcaa">entry</span><span>(</span><span style=
=3D"color:#ce9178">&quot;CHANNEL=3D</span><span style=3D"color:#9cdcfe">%u<=
/span><span style=3D"color:#ce9178">&quot;</span><span>, channel),</span></=
div>
<div><span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; </span><span style=3D"color:#dcdcaa">entry</span><span>(</span=
><span style=3D"color:#ce9178">&quot;USERID=3D</span><span style=3D"color:#=
9cdcfe">%u</span><span style=3D"color:#ce9178">&quot;</span><span>, userId)=
,</span></div>
<div><span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; </span><span style=3D"color:#dcdcaa">entry</span><span>(</span=
><span style=3D"color:#ce9178">&quot;SESSIONID=3D0x</span><span style=3D"co=
lor:#9cdcfe">%X</span><span style=3D"color:#ce9178">&quot;</span><span>, se=
ssionId),</span></div>
<div><span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; </span><span style=3D"color:#dcdcaa">entry</span><span>(</span=
><span style=3D"color:#ce9178">&quot;PRIVILEGE=3D</span><span style=3D"colo=
r:#9cdcfe">%u</span><span style=3D"color:#ce9178">&quot;</span><span>,
</span><span style=3D"color:#569cd6">static_cast</span><span>&lt;</span><sp=
an style=3D"color:#569cd6">uint8_t</span><span>&gt;(privilege)),</span></di=
v>
<span><span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; </span><span style=3D"color:#dcdcaa">entry</span><span>(</spa=
n><span style=3D"color:#ce9178">&quot;RQSA=3D</span><span style=3D"color:#9=
cdcfe">%x</span><span style=3D"color:#ce9178">&quot;</span><span>, rqSA));<=
/span></span></div>
<br>
</span></span></span></li></ol>
<div><span style=3D"background-color:rgb(255,255,255); display:inline!impor=
tant"><span style=3D"text-align:start; background-color:rgb(255,255,255); d=
isplay:inline!important"><span style=3D"text-align:left; background-color:r=
gb(255,255,255); display:inline!important; font-size:12pt; font-family:Cali=
bri,Helvetica,sans-serif">Thank
 you.</span></span></span></div>
<div><span style=3D"background-color:rgb(255,255,255); display:inline!impor=
tant"><span style=3D"text-align:start; background-color:rgb(255,255,255); d=
isplay:inline!important"><span style=3D"text-align:left; background-color:r=
gb(255,255,255); display:inline!important"><br>
</span></span></span></div>
<div><span style=3D"background-color:rgb(255,255,255); display:inline!impor=
tant"><span style=3D"text-align:start; background-color:rgb(255,255,255); d=
isplay:inline!important"><span style=3D"text-align:left; background-color:r=
gb(255,255,255); display:inline!important; font-size:12pt; font-family:Cali=
bri,Helvetica,sans-serif">Regards,</span></span></span></div>
<div><span style=3D"background-color:rgb(255,255,255); display:inline!impor=
tant"><span style=3D"text-align:start; background-color:rgb(255,255,255); d=
isplay:inline!important"><span style=3D"text-align:left; background-color:r=
gb(255,255,255); display:inline!important; font-size:12pt; font-family:Cali=
bri,Helvetica,sans-serif">Chris
 Chen</span></span></span></div>
</div>
<div>Legal Disclaimer :<br>
The information contained in this message may be privileged and confidentia=
l. <br>
It is intended to be read only by the individual or entity to whom it is ad=
dressed
<br>
or by their designee. If the reader of this message is not the intended rec=
ipient,
<br>
you are on notice that any distribution of this message, in any form, <br>
is strictly prohibited. If you have received this message in error, <br>
please immediately notify the sender and delete or destroy any copy of this=
 message!<br>
</div>
</div>
</div>
</body>
</html>

--_000_DM6PR08MB55145854126B411F1A9AFE29DCD29DM6PR08MB5514namp_--
