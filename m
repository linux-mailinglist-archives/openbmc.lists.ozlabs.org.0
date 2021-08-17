Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D413EEBD2
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 13:36:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gpps337j6z30KQ
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 21:36:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=FeiotaW4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex.com (client-ip=185.183.28.62;
 helo=mx08-002d6701.pphosted.com;
 envelope-from=prvs=286394fd64=chris.chen3@flex.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256
 header.s=dkim header.b=FeiotaW4; dkim-atps=neutral
X-Greylist: delayed 1113 seconds by postgrey-1.36 at boromir;
 Tue, 17 Aug 2021 21:36:10 AEST
Received: from mx08-002d6701.pphosted.com (mx08-002d6701.pphosted.com
 [185.183.28.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpprV5yVmz308G
 for <openbmc@lists.ozlabs.org>; Tue, 17 Aug 2021 21:36:09 +1000 (AEST)
Received: from pps.filterd (m0211473.ppops.net [127.0.0.1])
 by mx08-002d6701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17HBCS81031118; Tue, 17 Aug 2021 11:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=dkim;
 bh=g2oX8h8RSKhb3NwrLeXP9xgyLYEgzv5Dy3N24Wwaqew=;
 b=FeiotaW4Uzz3zYKwVLD5ub39MZZpyZxRvPLKtAjWo+vaCTFSjMsjRM2OX2ZlCVLbQNUz
 AEZXKKqr2dnHsfkyz06bscHLWeMGtLZhlN98kC8W8euCeinr+rrrew4aE0TXVV91l2z9
 31Ux6yweNFc+Kfv9uUPEjRQ8I+y+21kHm0R4C1XlYmpKq/n4GIX2KR7HLBeV0q8xW7NT
 EMbln/MTi0ICFuSXpy0BnWc/RTvsUX9kXIC35KQfUbcMWQDxPlUBUD6BwDbK8/uyLvM6
 RdnnlRotRs31r8UQa0a9T4ZEPuJQAzytf8TNR3Y86bsISW4MHGZDHAc19V0HYFsM8o5A XA== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2043.outbound.protection.outlook.com [104.47.73.43])
 by mx08-002d6701.pphosted.com with ESMTP id 3agbqfr3n2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Aug 2021 11:17:25 +0000
Received: from BN0PR04CA0147.namprd04.prod.outlook.com (2603:10b6:408:ed::32)
 by BYAPR08MB6072.namprd08.prod.outlook.com (2603:10b6:a03:d1::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Tue, 17 Aug
 2021 11:17:22 +0000
Received: from BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ed:cafe::70) by BN0PR04CA0147.outlook.office365.com
 (2603:10b6:408:ed::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 17 Aug 2021 11:17:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 144.49.247.22)
 smtp.mailfrom=flex.com; aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=fail action=oreject header.from=flex.com;
Received-SPF: Fail (protection.outlook.com: domain of flex.com does not
 designate 144.49.247.22 as permitted sender) receiver=protection.outlook.com; 
 client-ip=144.49.247.22; helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (144.49.247.22) by
 BN8NAM11FT060.mail.protection.outlook.com (10.13.177.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Tue, 17 Aug 2021 11:17:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OGBFCmoGnYNlmGO0padRpe6dzku2+lOVVBAbQXwiEBgrI4wi6T4scUGS1cRYSN0C0zzsXzFxNTmOtlwg5DQ21no2d29sJ7DgxjmrPshgS5hKXAVr1YJTiQNc0H7OU1XOIsjgKJCxlHxDA8vhjdMKxYWDNiesixAg0hSrXfVOqtFVHSB9VKMS8ZEAs9cFzWgDm/0l7wV2252QTL9nGiKPhV1G7JKgLKAnbLG/Fhcl9JahDX0uHTiAvGczldPkIZ48w2YaOk/d+byqCuEqug9DpsK6R8dltCDMEpLNtZSefRngSZLdEDjXq4SNRYFa7CHgmTQOB5mxYQvkQyffTAP97w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2oX8h8RSKhb3NwrLeXP9xgyLYEgzv5Dy3N24Wwaqew=;
 b=e7ZGd4ATCqFhD2mjR1D8SOvVFptm/FIGBJ4duAALWcAsDjkV08txiK5wvkNkuTK/OSA6UJ2BE6R0tvHlRGQRw9EP0laFMnArka+abo3Qso7P3Vzs/mqrg/ZnF5oUrXgQsVEU61VQ9XFXcX6xSzQMcR+Cc3+2AcH6ZXR36PFvMjGx9fXVLRHRlHVWzjR45t+XHU0Fc1ka1alG+hZIrJaJavekYmo0GB4DIxDtzP2I1S7HQWQi2E3jI5sEKsrz+kqDCYtFAh+ilQA9bUmZVocRe0tJOVS7VSvge4CWDEqQ3rg/3YsJron++usDKwLzhwg6+o2haVNxDUiM/kPUTinlrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from DM6PR08MB5514.namprd08.prod.outlook.com (2603:10b6:5:10a::33)
 by DM5PR08MB3433.namprd08.prod.outlook.com (2603:10b6:4:61::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Tue, 17 Aug
 2021 11:17:20 +0000
Received: from DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::1129:cf56:3e5d:251]) by DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::1129:cf56:3e5d:251%6]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 11:17:14 +0000
From: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
To: Andrew Jeffery <andrew@aj.id.au>, "Bills, Jason M"
 <jason.m.bills@linux.intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: [x86-power-control]: press the power button for a long time that
 can't force turn off system power
Thread-Topic: [x86-power-control]: press the power button for a long time that
 can't force turn off system power
Thread-Index: AQHXkmhH5ZD2Fz+Ed0uVX3qFyM9Mfqt17RpVgAEEj4CAAJA2UA==
Date: Tue, 17 Aug 2021 11:17:14 +0000
Message-ID: <DM6PR08MB5514BD820BCA7BCD3B810BFDDCFE9@DM6PR08MB5514.namprd08.prod.outlook.com>
References: <DM6PR08MB55145CD3DC0AD96D30B70771DCE59@DM6PR08MB5514.namprd08.prod.outlook.com>
 <8fcc9529-0f7b-df46-aa28-1569d254eb20@linux.intel.com>
 <DM6PR08MB551464D29CE9BD91FFE1B20ADCE69@DM6PR08MB5514.namprd08.prod.outlook.com>
 <b133d936-c788-1800-7b72-e197b69387cc@linux.intel.com>
 <DM6PR08MB55145A59C44D48FFD5B70C26DCFD9@DM6PR08MB5514.namprd08.prod.outlook.com>
 <878c1c79-662f-468d-82d1-a890a8aeab2e@www.fastmail.com>
 <DM6PR08MB551444C4EAB80473CB576740DCFD9@DM6PR08MB5514.namprd08.prod.outlook.com>
 <aef11e4c-0b18-47a3-8116-36db990b998c@www.fastmail.com>
In-Reply-To: <aef11e4c-0b18-47a3-8116-36db990b998c@www.fastmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=flex.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5ca6fe39-83cf-415c-7428-08d9617095c9
x-ms-traffictypediagnostic: DM5PR08MB3433:|BYAPR08MB6072:
X-Microsoft-Antispam-PRVS: <BYAPR08MB6072E40AE3B6F3D78F18404FDCFE9@BYAPR08MB6072.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: W170uLipJiDmj11RO5+gHYNaUqr9X+meDHOJ/mA8O6gE++GSHO0RnfNdlCBlRKNPWHOuTh1z+dOcv1SPdwhmGtBsu5KLLTmrGwjIjTxXikm80Nkr2oaUJxTlKut9hwuaPxl3MbsKm/lRKm5h6pWYjFBQUAjNKQmkJimsEYXm7V4GTG0T6mjrCwXih0kgbICiew88MYv+1DNfrmmeSIBRnccBYygJbq5gCFH+/A9AwRUF50bjWvLzwo6c/kRJxc8uJicd8LtufuG/c+kbZJsYSUrfyhSDWoEe+1m21tesORkWOD6gt8aZPw0yCdxT7rb6Y0woYNquCsaO5KYv24dv3Gd97TERWbRnXrmv0PlhsIeWyXH9G9F/tDKs8tSyekbVCjyMmohSaSNjVnf9pjRNyHVtw3/ydCQ7UtDsc+hIUNfA6rYncEuypch4DmyH0ZMn/Yn+Uv+eyh01habd6Bi2cvF6EWuiWe70hfFd2hysXeK+6Bd/2tZ11/OdrYUIrFhkj45hjFp69X56My36SLBABpBiQxkUBFXqNrOfmxQ58TvKFLdJK7qKkCN0GVKiavzJSFsogLirV4DFwIHffWjQtNbveDPr9VqI2Rgx5LAP/hxZx1UJoOJ1XTb1MgxZgRMh93txIBETk8qtAE+xd6oejqbubKF5IgjE3aEDO5dY/I9EGIYIi1fAwbxlUGY7IIkf+J18dus9TipRiIxi/p8L2g==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR08MB5514.namprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(136003)(396003)(346002)(39860400002)(366004)(376002)(66476007)(66556008)(64756008)(66446008)(86362001)(7696005)(66946007)(33656002)(26005)(71200400001)(8676002)(53546011)(186003)(2906002)(8936002)(6506007)(52536014)(38070700005)(76116006)(110136005)(5660300002)(55016002)(9686003)(122000001)(316002)(38100700002)(478600001)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?m+ajHxeXklWUPEWoZr4oaoTFME9JOhW2yqRk4qYTMBL32+rhV1tPA3XK+MH/?=
 =?us-ascii?Q?saKT8XN0okr62GIVJTI/+57xoo5FDjcoHC0ZDvWgsFGOVea1rB1BTknDNgk9?=
 =?us-ascii?Q?0z0BVGmk0keg+JjVGnMGe75pUq4dSDeFSKt3iHbUx2ynAb+wyaptIBAilUPI?=
 =?us-ascii?Q?fvWeqoo4Sutq7P+0K/kJMf49LfeJWdC/cSseDdOXXdJwzCx20SRd67KpEZ/K?=
 =?us-ascii?Q?dbgZGB98Qkn9U7YQhyifTNfi3cMNkujFeMzVTrjRmaylpu8pLmalaEMG3yu7?=
 =?us-ascii?Q?Gohip57In5po2mFZXKwJ527aoE2RgDYq8io3zadSu00sJfmD1UVSLEKFkIcU?=
 =?us-ascii?Q?m92fcmX/jtvAqXgNjs0jL4lXhr+iQZDuJ1mx/dsorglDPm6Z6rhCG6AXOjcV?=
 =?us-ascii?Q?THbkqMJOQVtpexGcN0zD+z+v1c28rqHEBwdE12+xvwnuZN8d33yClMFmoO2A?=
 =?us-ascii?Q?OktMRrvKDscE0SogU3xVTjTBzkeX0dAMlvhw0C8/seFh6XYA94+1Go0VNOMc?=
 =?us-ascii?Q?PjeB3a+f9i8MRPfEWattWrDrkeJeJI07nh0JYY1/lyTHmQL+w+NrPOx07Js8?=
 =?us-ascii?Q?ByCihrNPZqJVZFwNsRs2wYs7asUwMpO3ntlNpZQbbZkinWsYWvtyDd1jKVxV?=
 =?us-ascii?Q?Rnecl3m6br0yFuI2TcZtK81nXl8B2suLXhrMXTs/4Jsz+MZiyNSHSmc1zmO0?=
 =?us-ascii?Q?UoUCa6MVjErL50NyLNnIiuiVS6zEMhgRNdl9iLHkZaaMSldR+rOMar4NryzL?=
 =?us-ascii?Q?HD1YIrTUQi2L/Gka0cQd8L4VqLrj78oJydrNLh5jbkzvOTSt/WPfmM3Kx2h4?=
 =?us-ascii?Q?KTCY64fm1fx2874juWutO6TTiAVDGXGoA2Ee2YIt0y7C2Fe2OVdrSwQogO5V?=
 =?us-ascii?Q?l3Jo7GjJnv8EsJMfhu/mvDSoj0CxdKLGPXR4ygwwZ7Nxxk5K+z/8bmvjOmeH?=
 =?us-ascii?Q?f2zRYJsqpLxp+vNKD/lcMscgkWvyspJJrljhUaNCPwVTwbjOtAJbbVapqwbB?=
 =?us-ascii?Q?3xKlvQ3kRTYnlIEhxUwAuxrmTvn8kgvN064tVZuuasEnvc9IxrNJfEMH8dpP?=
 =?us-ascii?Q?Nek8MEnYG2kjhye3NcLL4QN3XcEawdVlHn0o+LeWDBzqwhDhyjMNz4MSu9Bw?=
 =?us-ascii?Q?BsD46/chE3x4K73L21QU3d2s4gRrRRFsAGarIR3QSqlFxHFlIXMYG4lZ4WoF?=
 =?us-ascii?Q?K5dJtXv99qL6piXTQkHzwNrri2cflWmMPPtXNnC4a0QXoJBC+GgU+a2aSYB3?=
 =?us-ascii?Q?5g+S4BIB4nCjiyTZmXTsrWDtPa6Kso+iDyxXMPw7Q7iO0kSfaqtjpk5Umzum?=
 =?us-ascii?Q?tJ7qGa1tQO1jPl7AlwsZL0Qy?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR08MB3433
X-CFilter-Loop: Reflected
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 067c02a2-4669-49b5-befb-08d9617090e0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O+jDrDdByPFNcmdrm9rd9D8zogTXMXFXhRztub/WuhyfsecDicXQ9Kh026tuNjwuffGKPRSHWVujtm9CbfDRutDIGouzHU3EMoBquhOx9wY4CqYbBSswzhholfrvOpilAeBKc47Br8FKJk1od5aouUKWTkRGm2hnBTIMWkRNc3Mgr/OvnGruy2UvfY9A/1uQbOaTVyQZ1vzBAub9KXtlGl/IqNW6BUkt8hFp2A+rtMvRr8EXyfOmXJSoGCF3r+0oO/ifVrSx2j9GtKDfyFL85b3tIvybM3QoVuXUCTVqdNhKLWY3qJDAP3tK1+oJWf46/lBhpiexen1FZBHh4+AkbmUm/WZ4JCZwNdWyfd3fHQaMknA3OShmfDzjOyDnXoHnzZ77Wui/5DD+hYd2Tlm1pTyZ+SLviyWQFbNAOEtHoxZ/vfMQmzGOqO34RSsdKjXHRi/jiqrk6GYsxkhyH4W0unSMiowWfeRbYLDKK5lXBx8ICrbtYqYMGizrxZX7OEFDtQkH6XOQ78oQEzNAYcAlM8psIE/DxZ0yTqA0yP5Owlv9FFocdsPVJM/6pgJ5Z3u9mSjuqx7QXqFWpfAJ2kT+f+mkI84jVWUYJvobOjlzaVpO4g5ABmt9Ijnrmvm9K6YwXDmUakg9oX0UVBHX1jA5Hu3p8dBL4QG2xLOfbti1ygq49G80b16TTyUgfVSlDLwKQgQ8QsjAOoH3YS9X0vsBLSiHDgceT6TYqUUwIxdS0+U=
X-Forefront-Antispam-Report: CIP:144.49.247.22; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.ds.dlp.protect.symantec.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(346002)(376002)(136003)(39860400002)(396003)(36840700001)(46966006)(4186021)(5660300002)(356005)(33656002)(110136005)(47076005)(82740400003)(52536014)(36860700001)(2906002)(81166007)(7696005)(316002)(9686003)(82310400003)(70586007)(86362001)(55016002)(83380400001)(8936002)(6506007)(26005)(8676002)(186003)(336012)(70206006)(53546011)(478600001)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 11:17:22.4456 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ca6fe39-83cf-415c-7428-08d9617095c9
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e; Ip=[144.49.247.22];
 Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB6072
X-Proofpoint-ORIG-GUID: Kv6h_JBjpxC83iNml9mn84ub1ekYN2SV
X-Proofpoint-GUID: Kv6h_JBjpxC83iNml9mn84ub1ekYN2SV
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-17_03:2021-08-16,
 2021-08-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108170070
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

Hi Andrew,

That means I'm able to choose one of following 2 options to achieve pass-th=
rough behavior when I using x86-power-control package, is my understanding =
correct?

1. Add code to re-enable GPIOP0 and GPIOP1 into a pass-through function aft=
er they are requested as a GPIO function in the x86-power-control package. =
(Or maybe to create a script with "devmem > 0x1e6e24BC 32 0x0F000000" comma=
nd that will be run automatically after system up to change register direct=
ly.)

2. Modify pinctrl in Kernel that will not disable GPIOP0 and GPIOP1's pass-=
through function if they already are configured as a pass-through when they=
 are requesting as a GPIO function.


Regards,
Chris Chen

-----Original Message-----
From: Andrew Jeffery <andrew@aj.id.au>=20
Sent: Tuesday, August 17, 2021 9:58 AM
To: Chris Chen (TPI) <Chris.Chen3@flex.com>; Bills, Jason M <jason.m.bills@=
linux.intel.com>; openbmc@lists.ozlabs.org
Subject: Re: [x86-power-control]: press the power button for a long time th=
at can't force turn off system power

On Mon, 16 Aug 2021, at 20:15, Chris Chen (TPI) wrote:
>  Hi Andrew,
>=20
> Thanks for your hint (CONFIG_DEBUG_PINCTRL=3Dy) that let me see where=20
> the passthrough setting was disabled.
> =3D=3D=3D=3D=3D=3D
> [   11.631044] aspeed-g6-pinctrl 1e6e2000.syscon:pinctrl: request pin=20
> 120 (AB22) for 1e780000.gpio:120=20
> [   11.631064] Muxing pin 120 for GPIO
> [   11.631071] Disabling signal PWM8 for PWM8
> [   11.631087] Want SCU41C[0x01000000]=3D0x1, got 0x0 from 0x000000C0
> [   11.631094] Disabling signal THRUIN0 for THRU0
> [   11.631102] Want SCU4BC[0x01000000]=3D0x1, got 0x1 from 0x0F000000
> [   11.631118] Want SCU4BC[0x01000000]=3D0x0, got 0x0 from 0x0E000000
> [   11.631124] Enabling signal GPIOP0 for GPIOP0
> =3D=3D=3D=3D=3D=3D
>=20
> But something strange is the logs seems from "x86-power-control"=20
> package because it would not appear after I commented out partial code=20
> as below in the package.
> Could you or others tell me why, please? I mean did I miss any=20
> configurations or code changes or anything when using the=20
> "x86-power-control" package?
>=20
> #if 0 //Added by Chris for testing=20
>     // Request POWER_BUTTON GPIO events
>     if (!powerButtonName.empty())
>     {
>         if (!requestGPIOEvents(powerButtonName, powerButtonHandler,
>                                powerButtonLine, powerButtonEvent))
>         {
>             return -1;
>         }
>     }
>     else
>     {
>         phosphor::logging::log<phosphor::logging::level::ERR>(
>             "powerButton name should be configured from json config file"=
);
>         return -1;
>     }
> #endif //Added by Chris for testing

Requesting the pin as GPIO removes the pass-through mux configuration.

If you want the pass-through behaviour when you obtain the pin as a GPIO th=
en you need to also do that in software by requesting the GPIOP1 pin and se=
tting it to the state of the GPIOP0 pin when GPIOP0 changes.

This is a limitation of the kernel, though I'm open to ideas on how to avoi=
d it.

Separately, I encourage you to encourage the author of the kernel patch tha=
t added pass-through support to send their changes upstream.

>=20
> Another, last time I forgot to say that I have tried to use "devmem=20
> 0x1e6e24BC 32 0x0F000000" to set passthrough back manually and the=20
> power button works fine. This is why I think the passthrough was gone=20
> after the system booting up.

I think it's possible to sense the input pin state even in the pass-through=
 configuration, but at the point where you request the GPIO via pinctrl we'=
ve lost the intent of the request and the mux configuration mustn't assume =
any particular mode of use. As such it disables the pass-through mode and p=
uts GPIOP0 in regular GPIO mode.

> Legal Disclaimer :
> The information contained in this message may be privileged and=20
> confidential.
> It is intended to be read only by the individual or entity to whom it=20
> is addressed or by their designee. If the reader of this message is=20
> not the intended recipient, you are on notice that any distribution of=20
> this message, in any form, is strictly prohibited. If you have=20
> received this message in error, please immediately notify the sender=20
> and delete or destroy any copy of this message!

On a separate note, please don't include these disclaimers on mail sent to =
the mailing list.

Andrew
