Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CDE3D447B
	for <lists+openbmc@lfdr.de>; Sat, 24 Jul 2021 05:06:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWrg32kj4z30Hn
	for <lists+openbmc@lfdr.de>; Sat, 24 Jul 2021 13:06:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=eyY1uou0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex.com (client-ip=185.132.180.100;
 helo=mx07-002d6701.pphosted.com;
 envelope-from=prvs=18391762fe=chris.chen3@flex.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256
 header.s=dkim header.b=eyY1uou0; dkim-atps=neutral
Received: from mx07-002d6701.pphosted.com (mx07-002d6701.pphosted.com
 [185.132.180.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWrfd0Qkbz2ywx
 for <openbmc@lists.ozlabs.org>; Sat, 24 Jul 2021 13:05:43 +1000 (AEST)
Received: from pps.filterd (m0132504.ppops.net [127.0.0.1])
 by mx07-002d6701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16O2uVV8007539; Sat, 24 Jul 2021 03:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=dkim; bh=E/lKhaik/SmvWQc3xwYkeYS3cfAn0YRPG8RRw0bhvx8=;
 b=eyY1uou0In1An3IJJDGdc3A8d+89RxTW6a6ezaJsdGnDlpdDJ6oETUupaiV39DASaoPu
 WvYzLE++3OUIT0HiZtdZdqHPvM05tap9ScFsCDrGSFmFcBUr177A5tKiGsW4M5qD+t0e
 G+ubNpVT4wEDV1Tp257ZzfCnLW0E5PybGSDLSxzVDLT9P49EpR6cRKIneKsRF7OJoBmj
 mtNLpxh2xYtQ9QYQNrxspt7spZa6OEcwDzEqG7bgDbI/RFJWdiD81fBPyk6PZDxlmWqo
 x7ZRDCh3KMEi6wuCbImNdgJrD68Nhjr0fxWLizVF4rJe4UeUJXkCyRz/7grpzMRO2NWo Kw== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by mx07-002d6701.pphosted.com with ESMTP id 3a09f085cv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 24 Jul 2021 03:04:34 +0000
Received: from BN6PR22CA0045.namprd22.prod.outlook.com (2603:10b6:404:37::31)
 by SA1PR08MB7245.namprd08.prod.outlook.com (2603:10b6:806:1a0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Sat, 24 Jul
 2021 03:04:32 +0000
Received: from BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:37:cafe::96) by BN6PR22CA0045.outlook.office365.com
 (2603:10b6:404:37::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend
 Transport; Sat, 24 Jul 2021 03:04:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 144.49.247.24)
 smtp.mailfrom=flex.com; linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=fail action=oreject
 header.from=flex.com;
Received-SPF: Fail (protection.outlook.com: domain of flex.com does not
 designate 144.49.247.24 as permitted sender) receiver=protection.outlook.com; 
 client-ip=144.49.247.24; helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (144.49.247.24) by
 BN8NAM11FT030.mail.protection.outlook.com (10.13.177.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Sat, 24 Jul 2021 03:04:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4eP997cHispMtkVzmslc5HC7p1cpMUeCNYrCHhdQr2P8/U8u4Yshr3DjbxTqSk099IK8DOG6vf4SxP/7thw8DKhaqBil6bmnebQUJ9DZWhMPVuqAfbq+aQnBFYI7sVi9XY1mNgs7FGK62inK6xqJzVH8cH4O6GqNBWTMOtlJOk24XQzEqoQZsajEGHg6hBjv0n8nm2YU7Cq54AXLW7/1/92wesY6sM2G4JNgUukBv5Xdp/0ot/pjSgelLSKDnHfm0dWenqH8R2eqk2TPaHdBs7H1rVz3X4GQjE/DD7U86eg8qNQOZMmlhG7+zAhCrnbzFnuOvSfQGidVEuvdMndfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/lKhaik/SmvWQc3xwYkeYS3cfAn0YRPG8RRw0bhvx8=;
 b=K1j9RhpZ7Cxs1yVGbQfw5RMUDTKbM87+PuAjpNACZq7aAFMe24C9VqmkIMPQ/HU6du4jLY9jp4VFHZs3QUVGvOi2VBIHQagGc55wfSKkelwMnTzcigpTgawTi5FM6xNiachfJv0a/d0uam0qIDmWfwhCnnPTKlT5eT+i4Ixu8r+m0jZSIM2ayiGsCGAyKFg0w+rBoeSBoZPW1P64Nw4GPesDjL+OGWKPH1a+5/4GHW/kmTlCuz+wk5Bs/sqinS9W/iv3NL8YSsUIyHceV2ZvyShj0Zt8JIxwjvNwXAI9wETwjggS7/axhOMN2KlSFJZ39gZHchAb/Xa1Bod5yWPllw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from DM6PR08MB5514.namprd08.prod.outlook.com (2603:10b6:5:10a::33)
 by DM6PR08MB4043.namprd08.prod.outlook.com (2603:10b6:5:8d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Sat, 24 Jul
 2021 03:04:30 +0000
Received: from DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::8167:8105:865f:8efe]) by DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::8167:8105:865f:8efe%3]) with mapi id 15.20.4331.034; Sat, 24 Jul 2021
 03:04:29 +0000
From: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: =?big5?B?pl7C0DogW3g4Ni1wb3dlci1jb250cm9sXTogcHJlc3MgdGhlIHBvd2VyIGJ1dHRv?=
 =?big5?B?biBmb3IgYSBsb25nIHRpbWUgdGhhdCBjYW4ndCBmb3JjZSB0dXJuIG9mZiBzeXN0?=
 =?big5?Q?em_power?=
Thread-Topic: [x86-power-control]: press the power button for a long time that
 can't force turn off system power
Thread-Index: AQHXf6gYYJZb/HtYO0+mc2S9Lrz5zKtRBZ8AgABlph0=
Date: Sat, 24 Jul 2021 03:04:29 +0000
Message-ID: <DM6PR08MB551464D29CE9BD91FFE1B20ADCE69@DM6PR08MB5514.namprd08.prod.outlook.com>
References: <DM6PR08MB55145CD3DC0AD96D30B70771DCE59@DM6PR08MB5514.namprd08.prod.outlook.com>,
 <8fcc9529-0f7b-df46-aa28-1569d254eb20@linux.intel.com>
In-Reply-To: <8fcc9529-0f7b-df46-aa28-1569d254eb20@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: linux.intel.com; dkim=none (message not
 signed) header.d=none;linux.intel.com; dmarc=none action=none
 header.from=flex.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: bc44fa48-540e-4a31-8e2a-08d94e4fc25c
x-ms-traffictypediagnostic: DM6PR08MB4043:|SA1PR08MB7245:
X-Microsoft-Antispam-PRVS: <SA1PR08MB7245AE1CEF6DF4D645849669DCE69@SA1PR08MB7245.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: DB56SoG2aQllbdBIKYKVQehAJCSSpifhaJlQiZVxhtlE7ONsft2pBEkTPXbUmIo7SGzMJ9sa9LpqcklDXuRl3A6Ncwq7gujmw/DdJQ49hhh3rSQ+aoWK8IGxvNztK7ugYwqO3RPjkFm5RXpflqqFS9WMeQMzISy6j7q3dQ281fiV6NdfsNDPX9uCfnUYx2GoNUobZ0iaUwsI0Nmib/HFU5+HjvO9uh4C+X1OezpwJW6Rt/y2zfJjRkrC+h+OIEGBHXBWM5gi9IODWmpTl4XHQ8BSZKSDp1Rhumrbs2p/79efJyoct0BPg+dZq1o++9rGnDMGZkmNHVuz3bS6xw21hfZ3P2v+bhAP3giCd8ONqoQjvqaRVpOr2UVKmWQDRoMzilS5T8BlemC9r4j3YTjyEH8/IywLJ4qSHbQWVhr8C9sA6sDMYvEist1Z5UjKvvWJPnjlIIGide6KNUCAO9Jzkivx/HtRX0UidYyyXnZQvkrtgzt5+A65QRa0WN7zz+RvQQ/d/INs3XuEPK9f4TW3sMCfx9lCwwtoy7MQTS/B/C/9CsjdEBATYcxuq+zaAe6UYeVoVU8vJaWA/ZxWQ2M3pbyZol6SXhFSYBUO/lCU0te970t/LflUp6IgK0fIJFYXZzH0rmvkRd/KkOv359/NYlTtKb6ZVBp8Yat+034od2D6e+p1WFQoBJtPR3/1NrMH0kca1UVi+cDC49iqYAz+dQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR08MB5514.namprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(366004)(346002)(376002)(136003)(26005)(66476007)(5660300002)(52536014)(8936002)(76116006)(316002)(2906002)(91956017)(66556008)(53546011)(64756008)(83380400001)(478600001)(66946007)(110136005)(186003)(6506007)(33656002)(55016002)(71200400001)(38100700002)(66446008)(7696005)(224303003)(19627405001)(86362001)(9686003)(122000001)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?aUcrMzJFdjdydE8wSEU2MCtKcW4xQ0VwNk5CdHdvdnVNcW5IOExnRHpjeU1RcXNz?=
 =?big5?B?YU5FT2dVcUs4eUhpMmNYVXNnZW1yZkNUNTc1a2pNMGVBY0ZNODNrUzFxS1lOWVhD?=
 =?big5?B?dXpYZGNZdUxIWFVnbzhkYklhQUR5NE8xS0pEL3J2TGZUVUladEVyaG15S0V4a0Jy?=
 =?big5?B?OFRkd1RuN2phMEZJSytjdFhXd0JlV1E3OHptcG96dkJuL3hvbzdqNGVOQzlQazdo?=
 =?big5?B?bVVkZXpxU0hCQ2NXeTg5bzZzOC8zR3FyeDBLNjBWbW9pallUOVF6b1NLdVd2cUZC?=
 =?big5?B?NGt0QlJBSy9kWXcvTDAwV0dURzRtc0gwNG9XaHBqakJ6S0JQR0xIZUNQb0dGWDQw?=
 =?big5?B?MitqWDNRb3ROMzljMlV3aExXNVc5Z1lBbDFWL2JrOEh3T1pOVVFHd3puV3FvVGZz?=
 =?big5?B?V1UxK3ZCaWd0dHk5VUpEeHBjN3pUdEVJQlFFSjJNWDMxRVRHNlNSK29MUnoxR09u?=
 =?big5?B?UjNIUVM1YThYMUdEcHNmc0lWZ2UzTnM1R2ZScjFTWUlQWWwwKzkvd016eHlOTExo?=
 =?big5?B?c1pjMXJ4RDRnYkNLZXJOVU1VdFNVL2c4dzlwV25VM3BSOExtb3VHNStzSWNnMFps?=
 =?big5?B?aDVXUHFRSVhuRVZCNkVIU3BNNXdPUXEySE4wSC9lVDRGZHd6ZC9OSXZwdEszdVlK?=
 =?big5?B?cGRrcWNZY2MrcWR4MUpwRXNDWTkyS2p6SWRueDFUdXA3cVRTcEJMc3pKS0k0Qmhx?=
 =?big5?B?UnFwaW9uSWdsbXBkQWIySEJuQklaaGlSZGJVQWNSU0hrYWU1clhPTEhDNHZLYUsy?=
 =?big5?B?ZDA3R293YmJvRkNkdHRyVGdHRU04UzhSVVlIRHBHeG1nUTUrdzFrT3ppN09DYWgy?=
 =?big5?B?RUtaUkM5N21RTzNwV2ZoYmg5Sk5oRGwrVTNsSEg4SFN3VURuMlNpTzJiK3VsdXYv?=
 =?big5?B?ejhZU0F0NTNUdTNXbnhMckRvMDBta0RGNDZ1aCtTM1FjWnFRWVBIOVN6T0JkS3Er?=
 =?big5?B?ZW5RVExpOC8yMEFrRFhtK1JFSUNIbkY5Y096OC9yeGZSbFdtNnlob0xjYWl0WHU4?=
 =?big5?B?ZlpCcXdIa1g3UXR3enc2cTFPSCttclliOHk0UkRtUnN1NVJ5RzRML3pnckd0SjVh?=
 =?big5?B?RGo4Sk53VnZtT0VGRzhRY0VrMWFObHhJUExQL01nY3pHUnFKRTdqVTZkM2l2aW1Q?=
 =?big5?B?Q3NUVWxGTUZjREtIVnErakY0elVKaTBNejhucFd6eXEyMkJWQ2RlVUNFY1hVSis1?=
 =?big5?B?UUxMeEFGQXJjZ2t3WWtPQmozak9ESjM4Nm5MUTFTS2dpR0pKWm5jbXdyWDM1bUp3?=
 =?big5?B?K3M1bkJOTHBUdkpDU212TlVxcVlFSmtnOTkxUnQwTVJqcEhWTXVKd2lMOW9lV3Z5?=
 =?big5?B?MWNWSS94NVMxVE1ZcVlZWkRlZFVNRGlxOVN5SU5Xa3g0N25HdmVjMFc1a0VoR241?=
 =?big5?B?TFlVdXNPckhQb0tORU1ObllPekk0ZE80UkhXblU3UnROdkJlK1NpeVgwZ01KRzlr?=
 =?big5?B?YUlNd09icmtaYjYyeDhBSkt4MFBIQ2k3alJVZ0NLWTMyK0lhS0RZNW9PeWNNQ1A5?=
 =?big5?B?WjY0alh0V3cvOXVjaXNaTitQOGZEeW1wekZsWDc3blN0MG42aXVzeVdZK2NUUmJY?=
 =?big5?B?NzhNOFJOdUhXNGwxdHJUVlBuMUdmTnFEUjk0MVh4Sng2cHQ3ZCsvMXloem9WdDlY?=
 =?big5?Q?0rkn3jDn01MqcDsUeDzJVfTeI+8=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DM6PR08MB551464D29CE9BD91FFE1B20ADCE69DM6PR08MB5514namp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB4043
X-CFilter-Loop: Reflected
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 938c72c3-b55c-45dd-b471-08d94e4fc108
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RLl1T+hM4nbhET5bY3jBdW0AjCOnt+RwRDK7pStoNIzHDcnexJ45KHSwhhTSuk64FGdAM3Fa96KglWo0VPocUm9XYakMxfheTq/S5deLfKjB28tmife0fdqxcnVu2tvnz2wTljkZiQ6VlY4Ifmjwqcwgadtc2TBXtGsyFs3SBxx6Un7buBiKlIBcc55s4GWXmPFxv0dNO0vSL6oTVibAeuz/bA68cYyW7FJnm4l2aFZ0rx9e+AckHdv6bb4xxt+uhSfiepZwi2Pp0WmEKBauB7e2r70lQg1AjPfTCdb5kakI9bS3XByw7wqk1M2rZ/FZu9RIQ7sKNlW0JrE8zogsaAsnkCxUaLJjKYRxFvqL22yNiWiUYWdAd1Cn6LCBhkmqyUL0uQsJY0Q/bZuTN3tnL71W0qoOaP3YgFrWmm7jhO5ngrKc8eejyc3c9ASnBWzUFG6etG2d0LCgVm7r9L4VhFN9A08Hc45OwPljAm2C8i870qg4nlb8bhG5vI5xlFp/g+A6biTm/hwzWXM6n2X2N1t6jTNcktv85cUgEBScIk6PkLMAECLHFQBKTh623f1bFnFMH2r0sarMRVr/cW/T5prcSnmW/+LIz4xq4JLpnqf5ePHj3NDB+lEtdO/V9Z/WnNjw8tKJxas3+rus4kkLNZbIu5ppAa+hOzXRzH7s5RkBEYzjdEpFc6W1e+GFzai5ATEo1gnpyeI6BBQNzT9dpxnh0U8Cm6Vnx6/yfcZq6ZA=
X-Forefront-Antispam-Report: CIP:144.49.247.24; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.ds.dlp.protect.symantec.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(376002)(396003)(136003)(346002)(39860400002)(36840700001)(46966006)(47076005)(70586007)(9686003)(30864003)(81166007)(82740400003)(55016002)(82310400003)(83380400001)(8936002)(356005)(70206006)(26005)(19627405001)(33656002)(186003)(110136005)(36860700001)(478600001)(316002)(7696005)(224303003)(336012)(5660300002)(4186021)(86362001)(2906002)(53546011)(6506007)(52536014)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2021 03:04:31.7395 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc44fa48-540e-4a31-8e2a-08d94e4fc25c
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e; Ip=[144.49.247.24];
 Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR08MB7245
X-Proofpoint-GUID: Swfu8mGTaMDy9yzJXbXsg9ILgUlVo-Y6
X-Proofpoint-ORIG-GUID: Swfu8mGTaMDy9yzJXbXsg9ILgUlVo-Y6
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-24_01:2021-07-23,
 2021-07-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0
 impostorscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 mlxscore=0
 phishscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107240018
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

--_000_DM6PR08MB551464D29CE9BD91FFE1B20ADCE69DM6PR08MB5514namp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgSmFzb24sDQoNClRoYW5rcyBmb3IgeW91ciBwcm9tcHQgcmVwbHkuDQoNClRoZSBzeXN0ZW0g
c3RheXMgb24sIGJlY2F1c2UgSSBjYW4gaGVhciB0aGUgZmFuIGluIFBTVSBpcyBzdGlsbCBydW5u
aW5nIGFuZCBDUFUgaGVhdHNpbmsgaXMgaG90LCBiZXNpZGVzLCB0aGUgbG9nIHdvdWxkIHNob3cg
IkdyYWNlZnVsIHBvd2VyLW9mZiB0aW1lciBjb21wbGV0ZWQiIGFuZCAiSG9zdDA6IE1vdmluZyB0
byAiT24iIHN0YXRlIiBhZnRlciA1IG1pbnV0ZXMuIEhlcmUgYXJlIGFsbCBsb2dzIG9mIHRoZSBw
b3dlci1jb250cm9sIGZvciB5b3VyIHJlZmVyZW5jZS4gSG9wZSB0aGlzIGNhbiBwcm92aWRlIG1v
cmUgZGV0YWlscy4NCg0KPT09PT0NCnJvb3RAaHVkc29uYmF5LW9ibWM6fiMgam91cm5hbGN0bCB8
IGdyZXAgLWUgInBvd2VyLWNvbnRyb2wiIC1lICJwb3dlciBjb250cm9sIiAtZSAiUG93ZXIgQ29u
dHJvbCINCkp1bCAyNCAxMDozNjowNiBodWRzb25iYXktb2JtYyBzeXN0ZW1kWzFdOiBTdGFydGlu
ZyBJbnRlbCBQb3dlciBDb250cm9sLi4uDQpKdWwgMjQgMTA6MzY6MDkgaHVkc29uYmF5LW9ibWMg
cG93ZXItY29udHJvbFsxOThdOiBTdGFydCBDaGFzc2lzIHBvd2VyIGNvbnRyb2wgc2VydmljZS4u
Lg0KSnVsIDI0IDEwOjM2OjA5IGh1ZHNvbmJheS1vYm1jIHN5c3RlbWRbMV06IFN0YXJ0ZWQgSW50
ZWwgUG93ZXIgQ29udHJvbC4NCkp1bCAyNCAxMDozNjowOSBodWRzb25iYXktb2JtYyBwb3dlci1j
b250cm9sWzE5OF06IE5NSV9PVVQgc2V0IHRvIDANCkp1bCAyNCAxMDozNjowOSBodWRzb25iYXkt
b2JtYyBwb3dlci1jb250cm9sWzE5OF06IFBPV0VSX09VVCBzZXQgdG8gMQ0KSnVsIDI0IDEwOjM2
OjA5IGh1ZHNvbmJheS1vYm1jIHBvd2VyLWNvbnRyb2xbMTk4XTogUkVTRVRfT1VUIHNldCB0byAx
DQpKdWwgMjQgMTA6MzY6MDkgaHVkc29uYmF5LW9ibWMgcG93ZXItY29udHJvbFsxOThdOiBOTUkg
U291cmNlIFByb3BlcnR5IE1vbml0b3INCkp1bCAyNCAxMDozNjowOSBodWRzb25iYXktb2JtYyBw
b3dlci1jb250cm9sWzE5OF06IEluaXRpYWxpemluZyBwb3dlciBzdGF0ZS4NCkp1bCAyNCAxMDoz
NjowOSBodWRzb25iYXktb2JtYyBwb3dlci1jb250cm9sWzE5OF06IEhvc3QwOiBNb3ZpbmcgdG8g
Ik9uIiBzdGF0ZQ0KSnVsIDI0IDEwOjM2OjA5IGh1ZHNvbmJheS1vYm1jIHBvd2VyLWNvbnRyb2xb
MTk4XTogUE9IIHRpbWVyIHN0YXJ0ZWQNCkp1bCAyNCAxMDozNjozOCBodWRzb25iYXktb2JtYyBw
b3dlci1jb250cm9sWzE5OF06IHBvd2VyU3RhdGVPbjogUE9TVCBDb21wbGV0ZSBhc3NlcnQgZXZl
bnQgcmVjZWl2ZWQNCkp1bCAyNCAxMDozNjozOCBodWRzb25iYXktb2JtYyBwb3dlci1jb250cm9s
WzE5OF06IE5vIGFjdGlvbiB0YWtlbi4NCkp1bCAyNCAxMDozNjo0MSBodWRzb25iYXktb2JtYyBw
b3dlci1jb250cm9sWzE5OF06IHBvd2VyU3RhdGVPbjogUE9TVCBDb21wbGV0ZSBkZS1hc3NlcnQg
ZXZlbnQgcmVjZWl2ZWQNCkp1bCAyNCAxMDozNjo0MSBodWRzb25iYXktb2JtYyBwb3dlci1jb250
cm9sWzE5OF06IEhvc3QwOiBNb3ZpbmcgdG8gIkNoZWNrIGZvciBXYXJtIFJlc2V0IiBzdGF0ZQ0K
SnVsIDI0IDEwOjM2OjQxIGh1ZHNvbmJheS1vYm1jIHBvd2VyLWNvbnRyb2xbMTk4XTogV2FybSBy
ZXNldCBjaGVjayB0aW1lciBzdGFydGVkDQpKdWwgMjQgMTA6MzY6NDEgaHVkc29uYmF5LW9ibWMg
cG93ZXItY29udHJvbFsxOThdOiBSZXN0YXJ0Q2F1c2Ugc2V0IHRvIHh5ei5vcGVuYm1jX3Byb2pl
Y3QuU3RhdGUuSG9zdC5SZXN0YXJ0Q2F1c2UuU29mdFJlc2V0DQpKdWwgMjQgMTA6MzY6NDEgaHVk
c29uYmF5LW9ibWMgcG93ZXItY29udHJvbFsxOThdOiBIb3N0IHN5c3RlbSBEQyBwb3dlciBpcyBv
ZmYNCkp1bCAyNCAxMDozNjo0MSBodWRzb25iYXktb2JtYyBwb3dlci1jb250cm9sWzE5OF06IFBP
SCB0aW1lciBjYW5jZWxlZA0KSnVsIDI0IDEwOjM2OjQxIGh1ZHNvbmJheS1vYm1jIHBvd2VyLWNv
bnRyb2xbMTk4XTogZmFpbGVkIHRvIHJlc2V0IEFDQm9vdCBwcm9wZXJ0eQ0KSnVsIDI0IDEwOjM2
OjQyIGh1ZHNvbmJheS1vYm1jIHBvd2VyLWNvbnRyb2xbMTk4XTogV2FybSByZXNldCBjaGVjayB0
aW1lciBjb21wbGV0ZWQNCkp1bCAyNCAxMDozNjo0MiBodWRzb25iYXktb2JtYyBwb3dlci1jb250
cm9sWzE5OF06IHBvd2VyU3RhdGVDaGVja0Zvcldhcm1SZXNldDogd2FybSByZXNldCBkZXRlY3Rl
ZCBldmVudCByZWNlaXZlZA0KSnVsIDI0IDEwOjM2OjQyIGh1ZHNvbmJheS1vYm1jIHBvd2VyLWNv
bnRyb2xbMTk4XTogSG9zdDA6IE1vdmluZyB0byAiT24iIHN0YXRlDQpKdWwgMjQgMTA6MzY6NDIg
aHVkc29uYmF5LW9ibWMgcG93ZXItY29udHJvbFsxOThdOiBQT0ggdGltZXIgc3RhcnRlZA0KSnVs
IDI0IDEwOjM2OjQyIGh1ZHNvbmJheS1vYm1jIHBvd2VyLWNvbnRyb2xbMTk4XTogSG9zdCBzeXN0
ZW0gREMgcG93ZXIgaXMgb24NCkp1bCAyNCAxMDozODoxNiBodWRzb25iYXktb2JtYyBwb3dlci1j
b250cm9sWzE5OF06IHBvd2VyU3RhdGVPbjogUE9TVCBDb21wbGV0ZSBhc3NlcnQgZXZlbnQgcmVj
ZWl2ZWQNCkp1bCAyNCAxMDozODoxNiBodWRzb25iYXktb2JtYyBwb3dlci1jb250cm9sWzE5OF06
IE5vIGFjdGlvbiB0YWtlbi4NCkp1bCAyNCAxMDozODozNCBodWRzb25iYXktb2JtYyBwb3dlci1j
b250cm9sWzE5OF06IFBvd2VyQ29udHJvbDogcG93ZXIgYnV0dG9uIHByZXNzZWQNCkp1bCAyNCAx
MDozODozNCBodWRzb25iYXktb2JtYyBwb3dlci1jb250cm9sWzE5OF06IHBvd2VyU3RhdGVPbjog
cG93ZXIgYnV0dG9uIHByZXNzZWQgZXZlbnQgcmVjZWl2ZWQNCkp1bCAyNCAxMDozODozNCBodWRz
b25iYXktb2JtYyBwb3dlci1jb250cm9sWzE5OF06IEhvc3QwOiBNb3ZpbmcgdG8gIkdyYWNlZnVs
IFRyYW5zaXRpb24gdG8gT2ZmIiBzdGF0ZQ0KSnVsIDI0IDEwOjM4OjM0IGh1ZHNvbmJheS1vYm1j
IHBvd2VyLWNvbnRyb2xbMTk4XTogR3JhY2VmdWwgcG93ZXItb2ZmIHRpbWVyIHN0YXJ0ZWQNCkp1
bCAyNCAxMDo0MzozNCBodWRzb25iYXktb2JtYyBwb3dlci1jb250cm9sWzE5OF06IEdyYWNlZnVs
IHBvd2VyLW9mZiB0aW1lciBjb21wbGV0ZWQNCkp1bCAyNCAxMDo0MzozNCBodWRzb25iYXktb2Jt
YyBwb3dlci1jb250cm9sWzE5OF06IHBvd2VyU3RhdGVHcmFjZWZ1bFRyYW5zaXRpb25Ub09mZjog
Z3JhY2VmdWwgcG93ZXItb2ZmIHRpbWVyIGV4cGlyZWQgZXZlbnQgcmVjZWl2ZWQNCkp1bCAyNCAx
MDo0MzozNCBodWRzb25iYXktb2JtYyBwb3dlci1jb250cm9sWzE5OF06IEhvc3QwOiBNb3Zpbmcg
dG8gIk9uIiBzdGF0ZQ0KPT09PT0NCg0KVGhhbmtzLg0KDQpSZWdhcmRzLA0KQ2hyaXMgQ2hlbg0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KsUil86rMOiBvcGVuYm1jIDxvcGVu
Ym1jLWJvdW5jZXMrY2hyaXMuY2hlbjM9ZmxleC5jb21AbGlzdHMub3psYWJzLm9yZz4gpU6q7SBC
aWxscywgSmFzb24gTSA8amFzb24ubS5iaWxsc0BsaW51eC5pbnRlbC5jb20+DQqxSKXzpOm0wTog
MjAyMaZ+N6TrMjSk6SCkV6TIIDA0OjM2DQqmrKXzqsw6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9y
ZyA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KpUSmrjogUmU6IFt4ODYtcG93ZXItY29udHJv
bF06IHByZXNzIHRoZSBwb3dlciBidXR0b24gZm9yIGEgbG9uZyB0aW1lIHRoYXQgY2FuJ3QgZm9y
Y2UgdHVybiBvZmYgc3lzdGVtIHBvd2VyDQoNCg0KDQpPbiA3LzIzLzIwMjEgNDoyOCBBTSwgQ2hy
aXMgQ2hlbiAoVFBJKSB3cm90ZToNCj4gSGkgYWxsLA0KPg0KPiBJIGFtIHdvcmtpbmcgb24gYW4g
YXN0MjYwMCB3aXRoIEludGVsIENQVS4NCj4gVGhlIHN5c3RlbSBwb3dlciBjdXJyZW50bHkgaXMg
YWJsZSB0byB0dXJuIG9uIGR1cmluZyBQaG9zcGhvciBPcGVuQk1DDQo+IGJvb3QgdXAgYWZ0ZXIg
SSBjb21wbGV0ZWQgd29ya3MgZm9sbG93aW5nOg0KPg0KPiAgMS4gZW5hYmxlIEFDUEkgaW4gdS1i
b290DQo+ICAyLiBzZXQgR1BJT1AwIH4gUDMgcGFzcy10aHJvdWdoIGluIHUtYm9vdA0KPiAgMy4g
cG9ydGluZyBFU1BJIGRyaXZlciBmcm9tIEFTVCBTREsgdjYuMDEgdG8gbGludXgtYXNwZWVkIHJl
cG9zaXRvcnkNCj4gIDQuIGFkZCAiJmdwaW8wIiB3aXRoIGdwaW8tbGluZS1uYW1lcyB3aGljaCBo
YXMgUE9XRVJfQlVUVE9OLCBQT1dFUl9PVVQsDQo+ICAgICBTSU9fUzMsIFNJT19TNSwgZXRjLiBk
ZWZpbnRpb24gaW4gdGhlIGR0cywgSSB0aGluayB0aGUNCj4gICAgICJ4ODYtcG93ZXItY29udHJv
bCIgcmVwb3NpdG9yeSByZXF1aXJlZCB0aGVzZS4NCj4gIDUuIGFwcGVuZCAieDg2LXBvd2VyLWNv
bnRyb2wiIGFuZCAiaW50ZWwtaXBtaS1vZW0iIHJlcG9zaXRvcmllcyB0byBpbWFnZQ0KPg0KPiBI
b3dldmVyLCBJIGFsd2F5cyBvbmx5IGdvdCB0aGUgZm9sbG93aW5nIGxvZ3Mgd2hlbiBJIHByZXNz
ZWQgdGhlIHBvd2VyDQo+IGJ1dHRvbiBmb3IgYSBsb25nIHRpbWUgKD4gNHMpLg0KPiA9PT09PQ0K
PiBwb3dlci1jb250cm9sWzI2M106IFBvd2VyQ29udHJvbDogcG93ZXIgYnV0dG9uIHByZXNzZWQN
Cj4gcG93ZXItY29udHJvbFsyNjNdOiBwb3dlclN0YXRlT246IHBvd2VyIGJ1dHRvbiBwcmVzc2Vk
IGV2ZW50IHJlY2VpdmVkDQo+IHBvd2VyLWNvbnRyb2xbMjYzXTogSG9zdDA6IE1vdmluZyB0byAi
R3JhY2VmdWwgVHJhbnNpdGlvbiB0byBPZmYiIHN0YXRlDQo+IHBvd2VyLWNvbnRyb2xbMjYzXTog
R3JhY2VmdWwgcG93ZXItb2ZmIHRpbWVyIHN0YXJ0ZWQNCj4gPT09PT0NCj4NCj4gSXQgZG9lc24n
dCBvY2N1ciAiU0lPX09OQ09OVFJPTCB2YWx1ZSBjaGFuZ2VkOiAxIC0+IFNJTyBwb3dlciBnb29k
DQo+IGRlLWFzc2VydCBldmVudCByZWNlaXZlZCIsIGV0Yy4gb3BlcmF0aW9ucyBhbmQgdGhlbiB0
byB0dXJuIG9mZiB0aGUgcG93ZXIuDQo+DQo+IENhbiBhbnlvbmUgZG8gbWUgYSBmYXZvciB0byBn
aXZlIG1lIHNvbWUgY2x1ZXMgZm9yIHdoYXQgSSB3YXMgd3Jvbmc/DQpIaSBDaHJpcywNCg0KSG9s
ZGluZyB0aGUgcG93ZXIgYnV0dG9uIHNob3VsZCBmb3JjZSBhIGhhcmR3YXJlIHNodXRkb3duLiAg
VGhlIEJNQyBvbmx5DQptb25pdG9ycyB0aGlzIGZsb3cgYW5kIGRvZXNuJ3QgcGFydGljaXBhdGUu
DQoNCkRpZCB5b3VyIHN5c3RlbSBzaHV0IGRvd24gY29ycmVjdGx5IGFuZCB5b3UganVzdCBub3Qg
c2VlIHRoZSBsb2dzIGluDQpCTUM/ICBPciwgZGlkIHRoZSBzeXN0ZW0gc3RheSBvbj8NCg0KVGhh
bmtzLA0KLUphc29uDQo+DQo+DQo+IFRoYW5rIHlvdSBpbiBhZHZhbmNlIGZvciB5b3VyIGhlbHAu
DQo+DQo+IFJlZ2FyZHMsDQo+IENocmlzIENoZW4NCj4NCj4gTGVnYWwgRGlzY2xhaW1lciA6DQo+
IFRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBtZXNzYWdlIG1heSBiZSBwcml2aWxl
Z2VkIGFuZA0KPiBjb25maWRlbnRpYWwuDQo+IEl0IGlzIGludGVuZGVkIHRvIGJlIHJlYWQgb25s
eSBieSB0aGUgaW5kaXZpZHVhbCBvciBlbnRpdHkgdG8gd2hvbSBpdCBpcw0KPiBhZGRyZXNzZWQN
Cj4gb3IgYnkgdGhlaXIgZGVzaWduZWUuIElmIHRoZSByZWFkZXIgb2YgdGhpcyBtZXNzYWdlIGlz
IG5vdCB0aGUgaW50ZW5kZWQNCj4gcmVjaXBpZW50LA0KPiB5b3UgYXJlIG9uIG5vdGljZSB0aGF0
IGFueSBkaXN0cmlidXRpb24gb2YgdGhpcyBtZXNzYWdlLCBpbiBhbnkgZm9ybSwNCj4gaXMgc3Ry
aWN0bHkgcHJvaGliaXRlZC4gSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGluIGVy
cm9yLA0KPiBwbGVhc2UgaW1tZWRpYXRlbHkgbm90aWZ5IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSBv
ciBkZXN0cm95IGFueSBjb3B5IG9mDQo+IHRoaXMgbWVzc2FnZSENCg==

--_000_DM6PR08MB551464D29CE9BD91FFE1B20ADCE69DM6PR08MB5514namp_
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
Hi Jason,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks for your prompt reply.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
The system stays on, because I can hear the fan in PSU is still running and=
 CPU heatsink is hot, besides, the log would show &quot;Graceful power-off =
timer completed&quot; and &quot;Host0: Moving to &quot;On&quot; state&quot;=
 after 5 minutes. Here are all logs of the power-control for your
 reference. Hope this can provide more details.<span style=3D"color: rgb(0,=
 0, 0); font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt=
;"></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
=3D=3D=3D=3D=3D</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
root@hudsonbay-obmc:~# journalctl | grep -e &quot;power-control&quot; -e &q=
uot;power control&quot; -e &quot;Power Control&quot;
<div>Jul 24 10:36:06 hudsonbay-obmc systemd[1]: Starting Intel Power Contro=
l...</div>
<div>Jul 24 10:36:09 hudsonbay-obmc power-control[198]: Start Chassis power=
 control service...</div>
<div>Jul 24 10:36:09 hudsonbay-obmc systemd[1]: Started Intel Power Control=
.</div>
<div>Jul 24 10:36:09 hudsonbay-obmc power-control[198]: NMI_OUT set to 0</d=
iv>
<div>Jul 24 10:36:09 hudsonbay-obmc power-control[198]: POWER_OUT set to 1<=
/div>
<div>Jul 24 10:36:09 hudsonbay-obmc power-control[198]: RESET_OUT set to 1<=
/div>
<div>Jul 24 10:36:09 hudsonbay-obmc power-control[198]: NMI Source Property=
 Monitor</div>
<div>Jul 24 10:36:09 hudsonbay-obmc power-control[198]: Initializing power =
state.</div>
<div>Jul 24 10:36:09 hudsonbay-obmc power-control[198]: Host0: Moving to &q=
uot;On&quot; state</div>
<div>Jul 24 10:36:09 hudsonbay-obmc power-control[198]: POH timer started</=
div>
<div>Jul 24 10:36:38 hudsonbay-obmc power-control[198]: powerStateOn: POST =
Complete assert event received</div>
<div>Jul 24 10:36:38 hudsonbay-obmc power-control[198]: No action taken.</d=
iv>
<div>Jul 24 10:36:41 hudsonbay-obmc power-control[198]: powerStateOn: POST =
Complete de-assert event received</div>
<div>Jul 24 10:36:41 hudsonbay-obmc power-control[198]: Host0: Moving to &q=
uot;Check for Warm Reset&quot; state</div>
<div>Jul 24 10:36:41 hudsonbay-obmc power-control[198]: Warm reset check ti=
mer started</div>
<div>Jul 24 10:36:41 hudsonbay-obmc power-control[198]: RestartCause set to=
 xyz.openbmc_project.State.Host.RestartCause.SoftReset</div>
<div>Jul 24 10:36:41 hudsonbay-obmc power-control[198]: Host system DC powe=
r is off</div>
<div>Jul 24 10:36:41 hudsonbay-obmc power-control[198]: POH timer canceled<=
/div>
<div>Jul 24 10:36:41 hudsonbay-obmc power-control[198]: failed to reset ACB=
oot property</div>
<div>Jul 24 10:36:42 hudsonbay-obmc power-control[198]: Warm reset check ti=
mer completed</div>
<div>Jul 24 10:36:42 hudsonbay-obmc power-control[198]: powerStateCheckForW=
armReset: warm reset detected event received</div>
<div>Jul 24 10:36:42 hudsonbay-obmc power-control[198]: Host0: Moving to &q=
uot;On&quot; state</div>
<div>Jul 24 10:36:42 hudsonbay-obmc power-control[198]: POH timer started</=
div>
<div>Jul 24 10:36:42 hudsonbay-obmc power-control[198]: Host system DC powe=
r is on</div>
<div>Jul 24 10:38:16 hudsonbay-obmc power-control[198]: powerStateOn: POST =
Complete assert event received</div>
<div>Jul 24 10:38:16 hudsonbay-obmc power-control[198]: No action taken.</d=
iv>
<div>Jul 24 10:38:34 hudsonbay-obmc power-control[198]: PowerControl: power=
 button pressed</div>
<div>Jul 24 10:38:34 hudsonbay-obmc power-control[198]: powerStateOn: power=
 button pressed event received</div>
<div>Jul 24 10:38:34 hudsonbay-obmc power-control[198]: Host0: Moving to &q=
uot;Graceful Transition to Off&quot; state</div>
<div>Jul 24 10:38:34 hudsonbay-obmc power-control[198]: Graceful power-off =
timer started</div>
<div>Jul 24 10:43:34 hudsonbay-obmc power-control[198]: Graceful power-off =
timer completed</div>
<div>Jul 24 10:43:34 hudsonbay-obmc power-control[198]: powerStateGracefulT=
ransitionToOff: graceful power-off timer expired event received</div>
Jul 24 10:43:34 hudsonbay-obmc power-control[198]: Host0: Moving to &quot;O=
n&quot; state<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"background-color:rgb(255, 255, 255);display:inline !importan=
t">=3D=3D=3D=3D=3D</span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks.</div>
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
lt;openbmc-bounces+chris.chen3=3Dflex.com@lists.ozlabs.org&gt; =A5N=AA=ED B=
ills, Jason M &lt;jason.m.bills@linux.intel.com&gt;<br>
<b>=B1H=A5=F3=A4=E9=B4=C1:</b> 2021=A6~7=A4=EB24=A4=E9 =A4W=A4=C8 04:36<br>
<b>=A6=AC=A5=F3=AA=CC:</b> openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlab=
s.org&gt;<br>
<b>=A5D=A6=AE:</b> Re: [x86-power-control]: press the power button for a lo=
ng time that can't force turn off system power</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText"><br>
<br>
On 7/23/2021 4:28 AM, Chris Chen (TPI) wrote:<br>
&gt; Hi all,<br>
&gt; <br>
&gt; I am working on an ast2600 with Intel CPU.<br>
&gt; The system power currently is able to turn on during Phosphor OpenBMC =
<br>
&gt; boot up after I completed works following:<br>
&gt; <br>
&gt;&nbsp; 1. enable ACPI in u-boot<br>
&gt;&nbsp; 2. set GPIOP0 ~ P3 pass-through in u-boot<br>
&gt;&nbsp; 3. porting ESPI driver from AST SDK v6.01 to linux-aspeed reposi=
tory<br>
&gt;&nbsp; 4. add &quot;&amp;gpio0&quot; with gpio-line-names which has POW=
ER_BUTTON, POWER_OUT,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; SIO_S3, SIO_S5, etc. defintion in the dts, I t=
hink the<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &quot;x86-power-control&quot; repository requi=
red these.<br>
&gt;&nbsp; 5. append &quot;x86-power-control&quot; and &quot;intel-ipmi-oem=
&quot; repositories to image<br>
&gt; <br>
&gt; However, I always only got the following logs when I pressed the power=
 <br>
&gt; button for a long time (&gt; 4s).<br>
&gt; =3D=3D=3D=3D=3D<br>
&gt; power-control[263]: PowerControl: power button pressed<br>
&gt; power-control[263]: powerStateOn: power button pressed event received<=
br>
&gt; power-control[263]: Host0: Moving to &quot;Graceful Transition to Off&=
quot; state<br>
&gt; power-control[263]: Graceful power-off timer started<br>
&gt; =3D=3D=3D=3D=3D<br>
&gt; <br>
&gt; It doesn't occur &quot;SIO_ONCONTROL value changed: 1 -&gt; SIO power =
good <br>
&gt; de-assert event received&quot;, etc. operations and then to turn off t=
he power.<br>
&gt; <br>
&gt; Can anyone do me a favor to give me some clues for what I was wrong?<b=
r>
Hi Chris,<br>
<br>
Holding the power button should force a hardware shutdown.&nbsp; The BMC on=
ly <br>
monitors this flow and doesn't participate.<br>
<br>
Did your system shut down correctly and you just not see the logs in <br>
BMC?&nbsp; Or, did the system stay on?<br>
<br>
Thanks,<br>
-Jason<br>
&gt; <br>
&gt; <br>
&gt; Thank you in advance for your help.<br>
&gt; <br>
&gt; Regards,<br>
&gt; Chris Chen<br>
&gt; <br>
&gt; Legal Disclaimer :<br>
&gt; The information contained in this message may be privileged and <br>
&gt; confidential.<br>
&gt; It is intended to be read only by the individual or entity to whom it =
is <br>
&gt; addressed<br>
&gt; or by their designee. If the reader of this message is not the intende=
d <br>
&gt; recipient,<br>
&gt; you are on notice that any distribution of this message, in any form,<=
br>
&gt; is strictly prohibited. If you have received this message in error,<br=
>
&gt; please immediately notify the sender and delete or destroy any copy of=
 <br>
&gt; this message!<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_DM6PR08MB551464D29CE9BD91FFE1B20ADCE69DM6PR08MB5514namp_--
