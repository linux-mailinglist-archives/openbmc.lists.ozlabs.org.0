Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C22F278646
	for <lists+openbmc@lfdr.de>; Fri, 25 Sep 2020 13:50:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ByVbs434lzDqnF
	for <lists+openbmc@lfdr.de>; Fri, 25 Sep 2020 21:50:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.131.113; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=j4emqToC; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=j4emqToC; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310113.outbound.protection.outlook.com [40.107.131.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ByVZr1R81zDqlB;
 Fri, 25 Sep 2020 21:49:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MT7bKPBx4mFkPVUJ6BLho1OeI8F9KJhP/m+lDMtu4c=;
 b=j4emqToCNJUTfEzf4AjwqpzTO38NX3/IeDLkVjcfiI9AylL5/aCmFjqdmAtapj6x2e3snTY4Wv90dpvCCMtVBGeP2UhJwToCgdGFpKvk0AWBCNR6A0idT+XuoPJDM9plTBhk/5/gLW/5zRp9+OESrbR3UHqEkJT36usj4nrUKC8=
Received: from SG2PR0302CA0004.apcprd03.prod.outlook.com (2603:1096:3:2::14)
 by SG2PR04MB4073.apcprd04.prod.outlook.com (2603:1096:0:e::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.24; Fri, 25 Sep 2020 11:49:49 +0000
Received: from SG2APC01FT031.eop-APC01.prod.protection.outlook.com
 (2603:1096:3:2:cafe::6a) by SG2PR0302CA0004.outlook.office365.com
 (2603:1096:3:2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.15 via Frontend
 Transport; Fri, 25 Sep 2020 11:49:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.56)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.56 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.56; helo=KOR01-PS2-obe.outbound.protection.outlook.com;
Received: from KOR01-PS2-obe.outbound.protection.outlook.com (192.8.195.56) by
 SG2APC01FT031.mail.protection.outlook.com (10.152.250.217) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.21 via Frontend Transport; Fri, 25 Sep 2020 11:49:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m8h1BIY9uUeFXYhV5B0Sadv6VqM3f/4T0UyA+c7zEYJ6X1/px78ipQDDbocNiL1xwfKdT0tLKYIGqnXx40lnxpiazL1Dh237fD5mUPOjBs7A+VQlFXSdxEb7fKZR1l1o+ljyTR9zLBScQAkjWzTvWb9tc6H7aJwvdqKBC1B9nGCS6+k6cJgQYBn1sWKLmur40Kosj41uWrraaNxPCSo9jYKE3yEjDzlwalkToazKTKguT2VwH4o+EW+v6lpFte42auwlF8reW+36c42wki5iTzn/aUWM3qLEfKp8yOZYlKJtq28j4QfJShx08Ap2KO0ZutbIZfWb7fI1hI0KCOUSeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MT7bKPBx4mFkPVUJ6BLho1OeI8F9KJhP/m+lDMtu4c=;
 b=KNcDueP0MV7RWvrkVlAAHA97V00Nn2AQYU4jHREsksrzYIM/aHo0WpbN2viVkgPiS3PpmUe3PxR6LVdAwuW6P/RzDK/+b8J0nrE68Sr9fZgeO6SMqjxWfhTrY0PCaero7UIFWhgHlgrdETBGeTBXKdjD9x6imFsKPwwOO2viV7un6M5kwkE/9ZEAv8cqTQ6littGx0XrQW+nsN92Tynaa4Q64gKgFRl7tC8S/7FZm/lmwTFYPJkZccnToPzk+hLJUwhdf9v73cWVJQvVyLJ/jCxZFwVJ5aBscoHl6DAFK3NA5ywUQK9FCxZAnLKJ0lAaJy5Ssm2oMbgbHRXyo44phQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MT7bKPBx4mFkPVUJ6BLho1OeI8F9KJhP/m+lDMtu4c=;
 b=j4emqToCNJUTfEzf4AjwqpzTO38NX3/IeDLkVjcfiI9AylL5/aCmFjqdmAtapj6x2e3snTY4Wv90dpvCCMtVBGeP2UhJwToCgdGFpKvk0AWBCNR6A0idT+XuoPJDM9plTBhk/5/gLW/5zRp9+OESrbR3UHqEkJT36usj4nrUKC8=
Received: from SL2PR04MB3097.apcprd04.prod.outlook.com (2603:1096:100:38::9)
 by SL2PR04MB3241.apcprd04.prod.outlook.com (2603:1096:100:3d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Fri, 25 Sep
 2020 11:49:43 +0000
Received: from SL2PR04MB3097.apcprd04.prod.outlook.com
 ([fe80::4128:2b2a:c765:c9c1]) by SL2PR04MB3097.apcprd04.prod.outlook.com
 ([fe80::4128:2b2a:c765:c9c1%4]) with mapi id 15.20.3412.020; Fri, 25 Sep 2020
 11:49:42 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Read Firmware Versions
Thread-Topic: Read Firmware Versions
Thread-Index: AdaQIMU5ljsiRzlYTUW3d3oi6MD/gwACmf2AAC39YUAANv8YAAAJ2/UA///kioCAAIVoAP/97TAQ
Date: Fri, 25 Sep 2020 11:49:42 +0000
Message-ID: <SL2PR04MB3097964C3083440779871FC9E1360@SL2PR04MB3097.apcprd04.prod.outlook.com>
References: <SG2PR04MB3093CAA5913439BB892C16E5E13A0@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <20200921152337.GJ6152@heinlein>
 <SG2PR04MB3093A25A217B7E1FFD65D8A8E13B0@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <20200923153510.GP6152@heinlein>
 <974e9c2abdf54c96038585730403d5b9@linux.vnet.ibm.com>
 <5FEF272B-706E-4C48-978D-1C3CEB137CFD@fb.com>
 <CAGm54UHW=ZdCOAVskjt8PiAn7FRcpAM7dL3J4UvB8g0bP+Qbaw@mail.gmail.com>
In-Reply-To: <CAGm54UHW=ZdCOAVskjt8PiAn7FRcpAM7dL3J4UvB8g0bP+Qbaw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiYjM1MGI1NWEtMDRmYy00YmEzLWI5ZDAtMzhhNzQyNTY2NmIxIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzXzFudDNybmFsIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE4LjQuMTg0My4xMjMiLCJUcnVzdGVkTGFiZWxIYXNoIjoidkQ3UHZxdDVnVWwzckZlUFlLSG9aaDFWcHVrU0ErbDFKSTRIVEVJbmlndEZcL1g4OXJJcVQwTHRDVHBvSnB3Z3QifQ==
x-hclclassification: HCL_Cla5s_1nt3rnal
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [2409:4072:38a:3b6c:8004:1ed4:6269:7a0c]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 31d7278b-d5da-44d8-e398-08d861491a76
x-ms-traffictypediagnostic: SL2PR04MB3241:|SG2PR04MB4073:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <SG2PR04MB407340487589FCEC8BCB45A1E1360@SG2PR04MB4073.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: ehDImIJ0gVtzw41EPudiBO2xss+ltbdTMglR7TLskOL3QKaII9kXZAL1CR2gbQ+H5trErIQTQMDZxS8pMq9mx/mGw6mSLhJ5OoHiqfqCCtHSYcD3RubFyjKdsXQm35vgJZ4VKBMnjetTlXmysYjBdjn7Tp5ReFZfdIY1oOGk60GQZsjwLUCGhuoHeKpgiXLCacE3WceC0Q45PITBtvqVWu+X39oU69kr+cq240RLGEw8aRP6T7I61yBMSPI8h7YikqAyUB856YOVAFqtuKR7EgpBBzyqDkkdac1iIrGy1fRprAv1l+O9gYekt1UGYiAGyUhynmlD6csxI6fxTvDC45/SPRm2fFh/uZELM1uKNlZFSKCtzKFwFOYTnehH4dbs
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SL2PR04MB3097.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(8936002)(7116003)(316002)(3480700007)(478600001)(71200400001)(54906003)(8676002)(66946007)(76116006)(66556008)(83380400001)(7696005)(6916009)(66446008)(9686003)(6506007)(52536014)(66476007)(186003)(5660300002)(64756008)(86362001)(2906002)(55016002)(4326008)(33656002)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: mZjTVuyvDKLoPf9c/9TUnfIvxFmWqq73HfJAWy6/n2+aWsM2omwjBWY/xZf7sF56zXFYUON+t+JbsbIeraZIeoImqBA6rkGYY01lyWxZPPjQ7y6tKTUaqrl/ZBEmffthUEMcHgD+MuUS7sU5g8kbNaycBcub6ZTidjAaLiJbKah7Wj3JeILiFnRyyxEX6uDfGw1jyWIiH8aDkNtV8k9zTR1Sp7cdST+W2yKcRHAevmhSnpdZrzt/793lFONUd7P2V2pMhJmUMDvK6zImArzCogM5j5spr0CipjqDUxU2NWJJpHUGGlqHAP2O6vg/eFss0OjrnHSUXDp5rn71z5WYGVHQH9eVw5CkujojblKJbxaSf5EN3oabp3XXLAdeVmWOVrbt3ImJWF6fRUFnCtD2FLOqHcKtFXFfbGC2hysLWGVDziCchp1V2ifCPgW97BdUk7ZuI3oRGA/wGsSTeW/q7TUO0lUwIe/PL76AR/2CpeJF+y1wxEtiSf29YGICQMNsI+ofsJhvVD7v/ceafBGJ9esMRhP0bexdtGKqKIO5Am1bFDkvL5909qeHU2bzHR64+H1w89jOD0xT54oOjomiHIhYEfjYK2XbrI0Q1etGP26hr1UN2+A7AoTTEW5u/CHbF9uYqGp0HzSQiLl+FiqunRCuUJnu5gDOL4TrQRUVbyF6vz85pCM3pa+SiKNBngWDWcb8lSXZDrf6rxIng7mhkg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR04MB3241
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT031.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 801ff7dc-b62b-4e1d-f65c-08d8614917a0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fVh/dO3IRfzmMWXpEFAE8Zwx7qjugJKda+ouZdA55FU46f/uDKLgXT5iBi+wcpcYEbbOPJc9RPDXpDcVf7jlno0zq1ooXH3la+AlENlH/TnABKcCEse98KN0VeuDzFsYylRW1ayKCoiWS+D9j8NO9dfd7RzB7LPsX+2iejJ27y0FA8ZoJHyM3cO9swJuxHDClDIbesIM94Hvl1Wq6NBek5hbLQiyfVA8JzbnSbFR1ycaNuJyN/Mtp1Ye6cx8tksJaw195LR6IjkYVfLvBcSOhRYv8Yv92N+WYvd2If4K4mVFPnoOBjWu+4QpkFap7iLDdpnmaknTiCQ1mm6xlnz7kbm26IBghZN5dmy14/ZS9RLtJ4yhiBjxx0onY1j9+yuLvoUF9qAFH71Hud2fuXUT5w0a640kng4y6j0njDmcGXf9JPGgcio3wcm9AF/JrFErK+RBOku6VmBrhEDrYAa+OSWhv3l1aw+Gh7K8npXuG3s=
X-Forefront-Antispam-Report: CIP:192.8.195.56; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KOR01-PS2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(46966005)(186003)(336012)(316002)(53546011)(36906005)(70206006)(70586007)(47076004)(33656002)(6506007)(7696005)(356005)(54906003)(82740400003)(81166007)(82310400003)(83380400001)(34020700004)(8936002)(9686003)(2906002)(6916009)(3480700007)(478600001)(55016002)(26005)(52536014)(5660300002)(86362001)(4326008)(8676002)(7116003);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2020 11:49:46.7325 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31d7278b-d5da-44d8-e398-08d861491a76
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.56];
 Helo=[KOR01-PS2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT031.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB4073
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
Cc: Lei Yu <yulei.sh@bytedance.com>,
 openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>, Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Q2xhc3NpZmljYXRpb246IEhDTCBJbnRlcm5hbA0KDQoNCk9uIFRodSwgU2VwIDI0LCAyMDIwIGF0
IDk6NDAgQU0gVmlqYXkgS2hlbWthIDx2aWpheWtoZW1rYUBmYi5jb20+IHdyb3RlOg0KPg0KPg0K
Pg0KPiDvu79PbiA5LzIzLzIwLCAxOjE5IFBNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgQWRyaWFu
YSBLb2J5bGFrIiA8b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxh
YnMub3JnIG9uIGJlaGFsZiBvZiBhbm9vQGxpbnV4LmlibS5jb20+IHdyb3RlOg0KPg0KPiAgICAg
T24gMjAyMC0wOS0yMyAxMDozNSwgUGF0cmljayBXaWxsaWFtcyB3cm90ZToNCj4gICAgID4gT24g
VHVlLCBTZXAgMjIsIDIwMjAgYXQgMDE6MzQ6NTBQTSArMDAwMCwgSmF5YXNocmVlIEQgd3JvdGU6
DQo+ICAgICA+PiBDbGFzc2lmaWNhdGlvbjogSENMIEludGVybmFsDQo+ICAgICA+Pg0KPiAgICAg
Pj4gVGhhbmtzIFBhdHJpY2sgZm9yIHlvdXIgcmVzcG9uc2UuDQo+ICAgICA+Pg0KPiAgICAgPj4g
SW4gcGhvc3Bob3ItYm1jLWNvZGUtbWdtdCwgSSBhbSBzZWVpbmcgdGhlIHNvZnR3YXJlIGltYWdl
IGlzIHVwZ3JhZGVkDQo+ICAgICA+PiBhbmQgYmFzZWQgb24gdGhlIGltYWdlIHVwZGF0ZSwgdmVy
c2lvbiBpcyB1cGRhdGVkLg0KPiAgICAgPj4gQnV0IGluIG15IHBsYXRmb3JtLCBJIGhhdmUgdG8g
cmVhZCBmaXJtd2FyZSB2ZXJzaW9ucyB1c2luZyBvZW0NCj4gICAgID4+IGNvbW1hbmRzIGFuZCB0
aGF0IHZlcnNpb24gc2hvdWxkIGJlIGRpc3BsYXllZCB1bmRlciBkYnVzIG9iamVjdHMuDQo+ICAg
ICA+PiBXaGV0aGVyIHBob3NwaG9yLWJtYy1jb2RlLW1nbXQgcmVwbyB3aWxsIGJlIHN1aXRhYmxl
IHRvIGRpc3BsYXkgdGhlDQo+ICAgICA+PiBmaXJtd2FyZSB2ZXJzaW9uIHVzaW5nIGRidXMgb2Jq
ZWN0cz8NCj4gICAgID4NCj4gICAgID4gVmlqYXkgcmVjZW50bHkgYWRkZWQgYSBzaW1wbGUgQklP
UyBmbGFzaCBtYW5hZ2VtZW50IHRvDQo+ICAgICA+IHBob3NwaG9yLWJtYy1jb2RlLW1nbXQsIGJ1
dCB0aGVyZSBpcyBhbHNvIGEgb3BlbnBvd2VyLXBub3ItY29kZS1tZ210DQo+ICAgICA+IGZvcg0K
PiAgICAgPiB0aGUgZXF1aXZhbGVudCBvZiBCSU9TIG1hbmFnZW1lbnQgb24gb3BlbnBvd2VyIHN5
c3RlbXMuICBTaW5jZSB5b3VyDQo+ICAgICA+IGNvZGUNCj4gICAgID4gdXBkYXRlIHNjaGVtZSBp
cyBsaWtlbHkgdG8gYmUgc3BlY2lmaWMgdG8geW91ciBJUE1CIGNvbW1hbmRzLCBJIGRvbid0DQo+
ICAgICA+IGtub3cgaWYgdGhhdCB3b3VsZCBiZSBiZXN0IGluIGEgc2VwYXJhdGUgcmVwb3NpdG9y
eSBvciBhbiBleHRlbnNpb24NCj4gICAgID4gb250bw0KPiAgICAgPiBwaG9zcGhvci1ibWMtY29k
ZS1tZ210Lg0KPiAgICAgPg0KPiAgICAgPiBBZHJpYW5hLCBhbnkgb3BpbmlvbnM/DQo+DQo+ICAg
ICBJdCBjb3VsZCBmaXQgaW4gcGhvc3Bob3ItYm1jLWNvZGUtbWdtdCwgc29tZSB0aG91Z2h0czoN
Cj4NCj4gICAgIFRoZSBkLWJ1cyBvYmplY3RzIGdldCBjcmVhdGVkIGF0IDIgZGlmZmVyZW50IHRp
bWVzOg0KPg0KPiAgICAgMS4gT25lIHNjZW5hcmlvIGlzIHdoZW4gYW4gaW1hZ2UgaXMgdXBsb2Fk
ZWQgdG8gYmUgdXBkYXRlZCwgdGhpcyBpcyB0aGUNCj4gICAgIHN1cHBvcnQgdGhhdCBWaWpheSBh
ZGRlZCB3aGljaCBhbGxvd3MgYSBjdXN0b20gc2NyaXB0IHRvIGJlIHJ1biB0bw0KPiAgICAgdXBk
YXRlIHRoZSBCSU9TIGltYWdlLiBJZiB5b3UncmUgaW50ZXJlc3RlZCBpbiB0aGlzIG1ldGhvZCBm
b3IgdXBkYXRpbmcNCj4gICAgIHlvdXIgQklPUywgeW91IGNvdWxkIHBvdGVudGlhbGx5IGFkZCB5
b3VyIElQTUIgY29tbWFuZHMgaW4gdGhhdCBzZXJ2aWNlDQo+ICAgICBhbmQgdXNlIHRoZSBBY3Rp
dmF0aW9uIGludGVyZmFjZXMgdG8gZHJpdmUgdGhlIHVwZGF0ZS4NCj4NCj4gICAgIDIuIFRoZSBz
ZWNvbmQgc2NlbmFyaW8gaXMgd2hlbiB0aGUgQk1DIHJlYm9vdHMgYW5kIGl0IHJlY3JlYXRlcyB0
aGUNCj4gICAgIGQtYnVzIG9iamVjdHMuIEZvciB0aGlzIHNjZW5hcmlvLCB0aGVyZSdzIG5vIGN1
cnJlbnRseSBzdXBwb3J0IGZvciBCSU9TLA0KPiAgICAgc28gZm9yIGV4YW1wbGUgdGhlIHN1cHBv
cnQgdGhhdCBWaWpheSBhZGRlZCBkb2VzIG5vdCBjcmVhdGUgYSBkLWJ1cw0KPiAgICAgaW50ZXJm
YWNlIGlmIHRoZSBCTUMgcmVib290cywgd2hpY2ggaXMgb2sgaWYgeW91IG9ubHkgd2FudCB0byB1
c2UgdGhlDQo+ICAgICBBY3RpdmF0aW9uIGludGVyZmFjZSB0byB0cmlnZ2VyIHRoZSB1cGRhdGUu
IEJ1dCBzb3VuZHMgbGlrZSB5b3Ugd2FudCB0bw0KPiAgICAgYWx3YXlzIGhhdmUgdGhlIHZlcnNp
b24gaW5mb3JtYXRpb24gYXMgYSBkLWJ1cyBvYmplY3QsIHNvIHN1cHBvcnQgZm9yDQo+ICAgICBC
SU9TIGNvdWxkIGJlIGFkZGVkLiBGb3IgZXhhbXBsZSwgdG8gZ2V0IHRoZSBCTUMgbGV2ZWxzLCB0
aGUgY29kZSBsb29rcw0KPiAgICAgZm9yIHZlcnNpb24gaW5mb3JtYXRpb24gaW4gdGhlIEJNQyBp
biB0aGUgbWVkaWEgZGlyZWN0b3J5LiBJZiB5b3UgZ2V0DQo+ICAgICB5b3VyIGFwcCB0byBnZXQg
dGhlIHZlcnNpb24gaW5mb3JtYXRpb24gdmlhIHRoZSBvZW0gY29tbWFuZHMgeW91DQo+ICAgICBt
ZW50aW9uZWQgYW5kIGNyZWF0ZSBhIGZpbGUgaW4gdGhlIGJtYyBpbiB0aGUgbWVkaWEgZGlyZWN0
b3J5IHdlIGNvdWxkDQo+ICAgICBleHRlbmQgdGhlIGxvZ2ljIHRvIGNyZWF0ZSB0aGUgVmVyc2lv
biBkLWJ1cyBvYmplY3RzIGZvciBlYWNoIEJJT1MNCj4gICAgIHZlcnNpb24gd2hlbiB0aGUgQk1D
IHJlYm9vdHMuIFdlJ2QganVzdCBuZWVkIHRvIHdvcmsgb3V0IHRoZSBkZXRhaWxzIGZvcg0KPiAg
ICAgdGhlIGZvcm1hdCBmb3IgdGhlIGZpbGVzIHRoYXQgd291bGQgaG9zdCB0aGUgdmVyc2lvbiBp
bmZvcm1hdGlvbiwgYW5kDQo+ICAgICBob3cgdG8gaWRlbnRpZnkgdGhleSdyZSBCSU9TIHZlcnNp
b25zIHZzIEJNQy4NCj4NCj4gSSBhbHJlYWR5IGNyZWF0ZSBhIGZpbGUgYWZ0ZXIgcmVhZGluZyBi
aW9zIHZlcnNpb24gdmlhIG9lbSBjb21tYW5kcywNCj4gSXMgdGhlcmUgYSBwYXR0ZXJuIHdoZXJl
IHNob3VsZCB3ZSBrZWVwIHRoaXMgZmlsZSBhbmQgd2hhdCBpcyB0aGUgbmFtZQ0KPiBvZiBmaWxl
LiBBbHNvIEkgdGhvdWdodCB0aGVyZSBpcyBhIGRidXMgaW50ZXJmYWNlIGZvciBiaW9zIG1hbmFn
ZW1lbnQNCj4gYWxyZWFkeSBjcmVhdGVkIGJ5IHNvbWUgZGFlbW9uIG5ld2x5IGFkZGVkIHdoaWNo
IGNhbiBrZWVwIGJpb3MgdmVyc2lvbi4NCj4NCg0KPldlIHBsYW4gdG8gZG8gc29tZXRoaW5nIGxp
a2UgdGhpczoNCj4xLiBUaGUgQklPUyB2ZXJzaW9uIGlzIHN0b3JlZCBpbiBhbiBlZXByb207IDIu
IE9uIEJNQyBib290LCBwaG9zcGhvci1ibWMtY29kZS1tZ210IGNyZWF0ZXMgdGhlIGJpb3Mgb2Jq
ZWN0LCBhbmQgZmlsbCB0aGUgdmVyc2lvbiByZWFkID5mcm9tIHRoZSBlZXByb207IDMuIFdoZW4g
dGhlIGhvc3QgaXMgc3RhcnRlZCwgQklPUyBzZW5kcyBpdHMgdmVyc2lvbiB2aWEgT0VNIGlwbWkg
Y29tbWFuZDsgNC4gQk1DIHdpbGwgdXBkYXRlIGFuZCB3cml0ZSB0aGUgdmVyc2lvbiB0byA+dGhl
IGVlcHJvbSBpZiB0aGUgdmVyc2lvbiBpcyBkaWZmZXJlbnQuDQoNCkkgdW5kZXJzdGFuZCB0aGF0
IGN1cnJlbnRseSB0aGVyZSBpcyBubyBzZXBhcmF0ZSByZXBvIHRvIGRlYWwgd2l0aCBhbGwgdGhl
IGZpcm13YXJlIHZlcnNpb25zIChNRSwgQ1BMRCwgVlIsIEJyaWRnZSBJQywgQklPUykuIFdoZXRo
ZXIgYW55IG5ldyByZXBvIGNhbiBiZSBjcmVhdGVkIHRvIHBsYWNlIGFsbCBwcm9ncmFtbWFibGUg
dmVyc2lvbnMgaW4gb3BlbmJtYy4NCk9yIGlzIHRoZXJlIGFueSB3YXkgdG8gcmVhZCBhbGwgdGhl
IGZpcm13YXJlIHZlcnNpb25zIGZyb20gYW55IG90aGVyIHJlcG8gdXNpbmcgb2VtIGNvbW1hbmRz
DQpLaW5kbHkgcHJvdmlkZSB5b3VyIGNvbW1lbnRzIG9uIHRoaXMuDQoNClJlZ2FyZHMsDQpKYXlh
c2hyZWUNCjo6RElTQ0xBSU1FUjo6DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0K
VGhlIGNvbnRlbnRzIG9mIHRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudChzKSBhcmUgY29u
ZmlkZW50aWFsIGFuZCBpbnRlbmRlZCBmb3IgdGhlIG5hbWVkIHJlY2lwaWVudChzKSBvbmx5LiBF
LW1haWwgdHJhbnNtaXNzaW9uIGlzIG5vdCBndWFyYW50ZWVkIHRvIGJlIHNlY3VyZSBvciBlcnJv
ci1mcmVlIGFzIGluZm9ybWF0aW9uIGNvdWxkIGJlIGludGVyY2VwdGVkLCBjb3JydXB0ZWQsIGxv
c3QsIGRlc3Ryb3llZCwgYXJyaXZlIGxhdGUgb3IgaW5jb21wbGV0ZSwgb3IgbWF5IGNvbnRhaW4g
dmlydXNlcyBpbiB0cmFuc21pc3Npb24uIFRoZSBlIG1haWwgYW5kIGl0cyBjb250ZW50cyAod2l0
aCBvciB3aXRob3V0IHJlZmVycmVkIGVycm9ycykgc2hhbGwgdGhlcmVmb3JlIG5vdCBhdHRhY2gg
YW55IGxpYWJpbGl0eSBvbiB0aGUgb3JpZ2luYXRvciBvciBIQ0wgb3IgaXRzIGFmZmlsaWF0ZXMu
IFZpZXdzIG9yIG9waW5pb25zLCBpZiBhbnksIHByZXNlbnRlZCBpbiB0aGlzIGVtYWlsIGFyZSBz
b2xlbHkgdGhvc2Ugb2YgdGhlIGF1dGhvciBhbmQgbWF5IG5vdCBuZWNlc3NhcmlseSByZWZsZWN0
IHRoZSB2aWV3cyBvciBvcGluaW9ucyBvZiBIQ0wgb3IgaXRzIGFmZmlsaWF0ZXMuIEFueSBmb3Jt
IG9mIHJlcHJvZHVjdGlvbiwgZGlzc2VtaW5hdGlvbiwgY29weWluZywgZGlzY2xvc3VyZSwgbW9k
aWZpY2F0aW9uLCBkaXN0cmlidXRpb24gYW5kIC8gb3IgcHVibGljYXRpb24gb2YgdGhpcyBtZXNz
YWdlIHdpdGhvdXQgdGhlIHByaW9yIHdyaXR0ZW4gY29uc2VudCBvZiBhdXRob3JpemVkIHJlcHJl
c2VudGF0aXZlIG9mIEhDTCBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgaGF2ZSByZWNl
aXZlZCB0aGlzIGVtYWlsIGluIGVycm9yIHBsZWFzZSBkZWxldGUgaXQgYW5kIG5vdGlmeSB0aGUg
c2VuZGVyIGltbWVkaWF0ZWx5LiBCZWZvcmUgb3BlbmluZyBhbnkgZW1haWwgYW5kL29yIGF0dGFj
aG1lbnRzLCBwbGVhc2UgY2hlY2sgdGhlbSBmb3IgdmlydXNlcyBhbmQgb3RoZXIgZGVmZWN0cy4N
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo=
