Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAA910C2C9
	for <lists+openbmc@lfdr.de>; Thu, 28 Nov 2019 04:16:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NjTs3KxQzDqJ3
	for <lists+openbmc@lfdr.de>; Thu, 28 Nov 2019 14:16:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=wiwynn.com (client-ip=103.200.3.19; helo=segapp01.wistron.com;
 envelope-from=bright_cheng@wiwynn.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=Wistron.onmicrosoft.com
 header.i=@Wistron.onmicrosoft.com header.b="a0gEyZfT"; 
 dkim-atps=neutral
Received: from segapp01.wistron.com (segapp02.wistron.com [103.200.3.19])
 by lists.ozlabs.org (Postfix) with ESMTP id 47NjSx0J2rzDqxh
 for <openbmc@lists.ozlabs.org>; Thu, 28 Nov 2019 14:15:43 +1100 (AEDT)
Received: from EXCHAPP04.whq.wistron (unverified [10.37.38.27]) by 
 TWNHUMSW5.wistron.com (Clearswift SMTPRS 5.6.0) with ESMTP id 
 <Tdbbe220f8dc0a8167311d0@TWNHUMSW5.wistron.com>; Thu, 28 Nov 2019 
 11:15:41 +0800
Received: from EXCHAPP03.whq.wistron (10.37.38.26) by EXCHAPP04.whq.wistron 
 (10.37.38.27) with Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 
 15.1.1713.5; Thu, 28 Nov 2019 11:15:37 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (10.37.38.70) by 
 mail.wistron.com (10.37.38.26) with Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 
 15.1.1713.5 via Frontend Transport; Thu, 28 Nov 2019 11:15:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none; 
 b=Bh9029JrUj46eM3iZq05FpGp7so0Cv20md1KQ5+u75EAdkhTdQXpFAJrzT8vSRaWv28GKd/zS6fRbDdrYdNtFt/DXA3ddn9xP9PLOiWqSG2TDSG6TKrVP/qJ1B+kDSh4nbD5Ghcp/sL08QAnIoxaltS9umNf/ZRnqXsGvgWvR+rMJQnQVSc8nndW61FrXfF5P41w3qnLahILaMAYGq/hdw70WlVlJc51Sf4PysajMh+xdmSn1LG2W4RuSQESCiMWnLWFeOkLoseAxGjr1vFW913rnE3uDomDLt/guLm/dn9VgziT8s7ZZgGdmY5wfgt3333lcoBu7WVPN0UIBWDkNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2v1bh2V44FK9Q/K4bOGsg/IwIsejfoYUwbj/hV6rp4=; 
 b=I/1F8cwbxV9QyLkQemEXTrIQXVyO2mSpQzfAgiLTeVUCJa+NRIGoy7KU9fg2qmDTV+QZUmpDycrtFLs3aJJ6wjrejdXJXiG7NU3BAXGu72ituDBjrrHybNMby+jsJaObZJhYjXfgWUy6ZJkUEqGNXaJL78i1LA8hRATaLtOyJHShwMZidkvAQAe8fbGaYZ8Cy+XbBZJtJ2WQVjzF0hicdM5JowHhWOC6Mm1HWcl+J69y8CcBiE4b7iZN9gDJZd7D8scBUjOzmQAy1BC+6k55TTkqF9zLfxERrcL6lbpg3Z/LYXfSiBjRJm9/8vy3TshDpujGN6/ld4g/qu1w3YOGOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass 
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none 
 header.from=wiwynn.com; dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; 
 d=Wistron.onmicrosoft.com; s=selector2-Wistron-onmicrosoft-com; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2v1bh2V44FK9Q/K4bOGsg/IwIsejfoYUwbj/hV6rp4=; 
 b=a0gEyZfT5cpOpOUsZOrtu10Qi92BYfKS5szUdTJs9o1dZMvYNPZCS25ApvEU6h0Bi4qvPRfRpEtNEMqiQH3uGWBrHi+QiOu6+iqkqBZ3yspclI0ieXKvKBUg+O0qewdYxHx26uQmjtF44xKkRhpVT4Bwej1pVMu1OmZaIDZAXWA=
Received: from HK0PR02MB3348.apcprd02.prod.outlook.com (20.177.68.82) by 
 HK0PR02MB3426.apcprd02.prod.outlook.com (20.177.31.10) with Microsoft 
 SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 
 15.20.2474.22; Thu, 28 Nov 2019 03:15:35 +0000
Received: from HK0PR02MB3348.apcprd02.prod.outlook.com 
 ([fe80::9193:1f5:b919:4de3]) by 
 HK0PR02MB3348.apcprd02.prod.outlook.com 
 ([fe80::9193:1f5:b919:4de3%5]) with mapi id 15.20.2474.023; Thu, 28 
 Nov 2019 03:15:35 +0000
From: Bright Cheng/WYHQ/Wiwynn <Bright_Cheng@wiwynn.com>
To: Adriana Kobylak <anoo@linux.ibm.com>
Subject: RE: phosphor-bmc-code-memt: Support redfish remote firmware update
 with static layout image
Thread-Topic: phosphor-bmc-code-memt: Support redfish remote firmware update 
 with static layout image
Thread-Index: AdWbW9KkyR3t7kg+SUGh/ZISxSBNlgAA8GuAABuL+gABIZI1UAAgTVcAATCBS2A=
Date: Thu, 28 Nov 2019 03:15:34 +0000
Message-ID: <HK0PR02MB33484B8CB1B26EA8D7EBD29E9F470@HK0PR02MB3348.apcprd02.prod.outlook.com>
References: <HK0PR02MB33487C8E6D56DD2143034D0C9F700@HK0PR02MB3348.apcprd02.prod.outlook.com>
 <CAARXrtnjxJw4S25CoBACzY8A8hQtV+8excmoM2iNR5sLqhxcXg@mail.gmail.com> 
 <0f356ff58ad9ec48b19e86f9da5eb7cc@linux.vnet.ibm.com> 
 <HK0PR02MB33485DDBFBED11F8ED70C4D99F4E0@HK0PR02MB3348.apcprd02.prod.outlook.com>
 <e265ea9fecc389df33c0e7dce0861e05@linux.vnet.ibm.com>
In-Reply-To: <e265ea9fecc389df33c0e7dce0861e05@linux.vnet.ibm.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) 
 smtp.mailfrom=Bright_Cheng@wiwynn.com; 
x-originating-ip: [125.227.140.245]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb275da8-b7cc-481f-894c-08d773b13c2f
x-ms-traffictypediagnostic: HK0PR02MB3426:|HK0PR02MB3426:
x-ms-exchange-purlcount: 3
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR02MB3426F1F6F34430953CDC29949F470@HK0PR02MB3426.apcprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0235CBE7D0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(346002)(396003)(376002)(366004)(39860400002)(13464003)(189003)(199004)(478600001)(76176011)(8676002)(4326008)(2906002)(3846002)(8936002)(6116002)(80792005)(14454004)(71190400001)(33656002)(66476007)(66556008)(66946007)(76116006)(446003)(71200400001)(81166006)(81156014)(64756008)(15650500001)(99286004)(9686003)(11346002)(45080400002)(66446008)(6306002)(7696005)(53546011)(6436002)(86362001)(256004)(6506007)(66066001)(966005)(25786009)(575854001)(14444005)(55016002)(316002)(54906003)(229853002)(186003)(74316002)(52536014)(5660300002)(6916009)(7736002)(305945005)(6246003)(102836004)(26005);
 DIR:OUT;SFP:1102;SCL:1;SRVR:HK0PR02MB3426;
 H:HK0PR02MB3348.apcprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;
 PTR:InfoNoRecords;MX:1;A:1;
received-spf: None 
 (protection.outlook.com: wiwynn.com does not designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RL1GMTrJl79kruE8oee6NbYgY2+jZSGdXBeVPbLhjeVs3/KNEHZN02rFeiV2KYewqZnI9PzIEpkOoBTtRkidQAPMPBnmNlY4fIrRavZcjf+7CvDwCTwOS783psW/EvjBCqG9UgZRwZFBlRe55KEIq4xUwlmDWKWlK+bJo12IPWklvi2/Qw5vXlwP/QvkWgg1TOKjmjNVt9ihGqzs8TvFtb5GD5pCZYahwll9tjv+3qZhgEqFb6cSoWJjyN6WzZSb7Vd6VVgU+hTMOfZoA0TksVqHEDWs6Nf4Azph0zimSu44wwFKtGH/hW03T+puCHE1XITta1d14RLoBH+eNZClNyhiCG6rYArkT3FXKTAb6oOZBgaL8D7iTr1xvDeWJXusZgP24ogtLTF3VmRFR+Utxqk8LfFhD6LICxAoSEU2W7M9EVmece16QrYTtvUmS7ihW2UCg7H/51YhcHRy21CrcANuZUs65HX71BAvJGbzHOU=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fb275da8-b7cc-481f-894c-08d773b13c2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2019 03:15:35.0509 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: de0795e0-d7c0-4eeb-b9bb-bc94d8980d3b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eYS85nlCFW+zIxhpDUwswcMTk8ECYAyA8g1leDoaDTTk7x0U9WvIKF6JF+zW66+4pF+f3gAlREXZ99EjwgpYCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR02MB3426
X-OriginatorOrg: wiwynn.com
X-TM-SNTS-SMTP: EEDA77D9E8A942176689417C752A00650CBDD1DDFF94771DF34C17E53452E7202000:8
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@us.ibm.com>, Neeraj Ladkani <neladk@microsoft.com>,
 Delphine Chiu/WYHQ/Wiwynn <DELPHINE_CHIU@wiwynn.com>,
 Jayanth Othayoth <ojayanth@in.ibm.com>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Adriana,

Thanks for your friendly reminder, I actually missed the steps to link gith=
ub account to gerrit.

We separate our the code into two commits and submit to gerrit:
1. Support static layout image-bmc
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-bmc-code-mgmt/+/27620
2. Add ApplyTime checking
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-bmc-code-mgmt/+/27621

Please let us know if you have any questions with our submit.
Thank you for your attention !

-----Original Message-----
From: Adriana Kobylak [mailto:anoo@linux.ibm.com]=20
Sent: Friday, November 22, 2019 9:36 AM
To: Bright Cheng/WYHQ/Wiwynn <Bright_Cheng@wiwynn.com>
Cc: Lei YU <mine260309@gmail.com>; openbmc@lists.ozlabs.org; Adriana Kobyla=
k <anoo@us.ibm.com>; Neeraj Ladkani <neladk@microsoft.com>; Delphine Chiu/W=
YHQ/Wiwynn <DELPHINE_CHIU@wiwynn.com>; Jayanth Othayoth <ojayanth@in.ibm.co=
m>; Gunnar Mills <gmills@linux.vnet.ibm.com>; Ratan Gupta <ratagupt@linux.v=
net.ibm.com>
Subject: RE: phosphor-bmc-code-memt: Support redfish remote firmware update=
 with static layout image

Hi, you may be missing some setup steps to link your github account to gerr=
it, here are the instructions:
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Fopenbmc%2Fdocs%2Fblob%2Fmaster%2Fdevelopment%2Fgerrit-setup.md&amp;da=
ta=3D02%7C01%7CBright_Cheng%40wiwynn.com%7C566894981bb44427584108d76eec7485=
%7Cde0795e0d7c04eebb9bbbc94d8980d3b%7C1%7C0%7C637099834173075475&amp;sdata=
=3DCy64J0xWrJTNgLbD4Sj8st172VsvAik64QJ1zUKdNec%3D&amp;reserved=3D0

---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------
This email contains confidential or legally privileged information and is f=
or the sole use of its intended recipient.=20
Any unauthorized review, use, copying or distribution of this email or the =
content of this email is strictly prohibited.
If you are not the intended recipient, you may reply to the sender and shou=
ld delete this e-mail immediately.
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------
