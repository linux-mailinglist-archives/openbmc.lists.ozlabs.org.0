Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6337C2774F9
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 17:14:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bxz9458kXzDqjk
	for <lists+openbmc@lfdr.de>; Fri, 25 Sep 2020 01:14:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=hcl.com (client-ip=2a01:111:f400:fe9d::71b;
 helo=jpn01-ty1-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=BdRmw7Oe; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=BdRmw7Oe; 
 dkim-atps=neutral
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-ty1jpn01on071b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe9d::71b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bxz7V0BfXzDqZ1
 for <openbmc@lists.ozlabs.org>; Fri, 25 Sep 2020 01:12:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3im47mayXfnGDIg2Xy5ciRz3Jx0cXQQztafNrFdjNVM=;
 b=BdRmw7Oe0UvPB4NY6h/eDzeWOFfZJJw+Z8mvgeMOZISGTy26kt16G5THcHskB355e36J8Rwfe02wu7O0Bv9GLMK7Qw9/H69HNZZ4nkEoatWpMXZvbcT++GIsTK5YbFHvdRiOrwsIrqiCd1J5mOfjLTU6UWQBAiQHFuoR6vTqUDQ=
Received: from SG2PR03CA0126.apcprd03.prod.outlook.com (2603:1096:4:91::30) by
 TYAPR04MB2496.apcprd04.prod.outlook.com (2603:1096:404:25::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.11; Thu, 24 Sep 2020 15:12:29 +0000
Received: from SG2APC01FT114.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:91:cafe::82) by SG2PR03CA0126.outlook.office365.com
 (2603:1096:4:91::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.10 via Frontend
 Transport; Thu, 24 Sep 2020 15:12:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.57)
 smtp.mailfrom=hcl.com; tanous.net; dkim=pass (signature was verified)
 header.d=HCL.COM;tanous.net; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.57; helo=APC01-PU1-obe.outbound.protection.outlook.com;
Received: from APC01-PU1-obe.outbound.protection.outlook.com (192.8.195.57) by
 SG2APC01FT114.mail.protection.outlook.com (10.152.250.193) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.21 via Frontend Transport; Thu, 24 Sep 2020 15:12:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nDwVJ/MgVCHs4p6kjLu/FaUJzF//z+3ETvp80Srxuh4nDNt5oaA1NJ5j8D5iah6A5Pv2TEwLN6egML6gOMfkB5aSqkolQOJpEQuVqMymUbT3p8Hxjh+cXnNzoUU6z7haxfWTABNDH4LLtx3pQKGhyrXIrSIdH84fVQ6e/tqJQNe+hRdeXH3t5cJ6FZ6LzWA0lQEOqnz2kt6WYkYoIxgKhGaLZZC85DjpoNGBUO5r3WSvirTnu/SiE6bEOU0wYvtwLYqU6loLVeh9mBqzIsJMfAq0yzEa9iAdzdVyqixVhQQdnoRBQZHPvALJx5bVuQu7EjvJcOAyba4x3T8mi1UU5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3im47mayXfnGDIg2Xy5ciRz3Jx0cXQQztafNrFdjNVM=;
 b=hzR76cP4Z0wclIddVQZva2QpIBbqoqgURFQ5knWAGtz7RKGsUFHIIXvj/rBY0qtl3jzZAiI0GJdLXvGcIwCcJVkGXWk37Uvm9OfxkgVH1wjTDjtDxLyajPlpRLCzWtcDia0H9CfwjNLVL1q0y/GpabxFvnYDSbXibSMsnFxutQosm+3CEoVt46GavURx0EfKUPiaB9sT3oEcpAG68ZipYp18cFeYAeYuj3YdcKJq2ktNQmXQ/o0RXRwfhUzgzqTFrcOXZ8GsKxAFvtnC+NTcwVn5jc4uyvMoGDZod1rrT3JAEpHUJSwtevM/GuPeOel2shuRcpYp5jThgBTbRrBe5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3im47mayXfnGDIg2Xy5ciRz3Jx0cXQQztafNrFdjNVM=;
 b=BdRmw7Oe0UvPB4NY6h/eDzeWOFfZJJw+Z8mvgeMOZISGTy26kt16G5THcHskB355e36J8Rwfe02wu7O0Bv9GLMK7Qw9/H69HNZZ4nkEoatWpMXZvbcT++GIsTK5YbFHvdRiOrwsIrqiCd1J5mOfjLTU6UWQBAiQHFuoR6vTqUDQ=
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com (2603:1096:203:5d::15)
 by HKAPR04MB3922.apcprd04.prod.outlook.com (2603:1096:203:d7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Thu, 24 Sep
 2020 15:12:24 +0000
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::89f5:e366:be7b:b4f0]) by HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::89f5:e366:be7b:b4f0%3]) with mapi id 15.20.3391.027; Thu, 24 Sep 2020
 15:12:24 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: Ed Tanous <ed@tanous.net>
Subject: RE: Read FRU of host through ipmi in Entity manager.
Thread-Topic: Read FRU of host through ipmi in Entity manager.
Thread-Index: AdaKtjzUbcfxCnsRS1m0flxOovD9XQABka8AACeJKwABMecIAAA+UnaAAEnPHPA=
Date: Thu, 24 Sep 2020 15:12:24 +0000
Message-ID: <HK0PR04MB2964505F096883ED235141ABFD390@HK0PR04MB2964.apcprd04.prod.outlook.com>
References: <HK0PR04MB2964FFC6D5EF008F106FFC13FD230@HK0PR04MB2964.apcprd04.prod.outlook.com>
 <CACWQX80fpcLGEjuvUnj4JpinY=SS6eXbHR0i6wdEtjNpMsAHMg@mail.gmail.com>
 <3D149923-0A95-4CE6-82EF-8338677EF831@fb.com>
 <HK0PR04MB29649824A0F904C61F35152AFD3A0@HK0PR04MB2964.apcprd04.prod.outlook.com>
 <CACWQX821UAEHGadwcOoYMDFM-G_JDsipx9cVo96W0L+U21ysEA@mail.gmail.com>
In-Reply-To: <CACWQX821UAEHGadwcOoYMDFM-G_JDsipx9cVo96W0L+U21ysEA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-hclclassification: HCL_Cla5s_1nt3rnal
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiNGZiZjg4NmItYWRlMi00MmQxLWI0ZmMtOTFiZGVhZTMzOWE2IiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzXzFudDNybmFsIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE4LjQuMTg0My4xMjMiLCJUcnVzdGVkTGFiZWxIYXNoIjoiYVlpTVdER0cwbGE3enlIdXUyQTZiUTlmQmNMYVQ5bFphY0RmN1dEYmlmNzlSSnVqWkN5Z1kyQms0aFZKYzNSTyJ9
Authentication-Results-Original: tanous.net; dkim=none (message not signed)
 header.d=none;tanous.net; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [106.211.237.225]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 8cf42aea-3f1d-44a5-cf2c-08d8609c40bc
x-ms-traffictypediagnostic: HKAPR04MB3922:|TYAPR04MB2496:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <TYAPR04MB249687A9C4E236E2DD6709DEFD390@TYAPR04MB2496.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 2KPbPoxQRDxSWRj238mdziaD/HRnXxeCbNDhbiyeawB4vvuiif5zsTErR4t0SwC8UR0ppdzGIgXj/keQ8dMr/1yaFgnmicVnInwrVTks32qu1Uwra42r9ZGDdqWo7M98jz1yv6eGhCrusW2/kS77TlV+/gn1hISnJwS/u38VoaRlzp6AM0WziiP7ZZgr+NqwxVkT3Hi+DRWCkaYd7Y6npZZKDqpsoaxlK/aEx67yNrcw12Prz5ZuijeLFJ+yej7YA70XkkHD7/heVQYWgLlfHj7Ki7hoe8VRloTeB1y5ZzwjEryTlpTQbF4tUKYMv58gS4kpoH7UkfAv6jLe6dIV9A==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HK0PR04MB2964.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(54906003)(53546011)(86362001)(66476007)(66946007)(52536014)(4326008)(33656002)(66446008)(316002)(2906002)(71200400001)(64756008)(83380400001)(66556008)(186003)(55016002)(9686003)(7696005)(76116006)(5660300002)(6506007)(8936002)(478600001)(8676002)(55236004)(26005)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: db5yi46qmZNFIbycV1XlmzuR30ktuxeBo1euK0s4Tm+He8D5v+MzPwdLl1O1BJiiJypFDAOIvav7kVppjInoBrqGpunEDD8FoNkXHpfnA0OMxZnpBQL39cy2CffUtQnrx257ACXEauxlFxH9Bp/S7zlu9etK9/gWcu35wwE5eluVjEfQGBSunuwwmPXentlPC+VTYDSy2McN4KxprCFIHClbsKdbpLc0y20f0HwNnW848kmwHEdKrU/21Zi3JdEE0iyqbGG3jSqe+AJZdLPsvM56fT8iMmu8vBEORaPblYc/2F2kDNkUksYMwdjK9rPdwzYHHXzqV34cysuxPM3OATS4KbU7CqhkzdXGKo01V9KWmUuZesqq+TrD9bz+YEWphzesZocRIzcKS5jqDbzhxc+nllx+xzGDPj5vr3wSVV7Qj1ZMQSw0S37h3HgXZkSpG301lZGOMYdsINqr5eV0z060bNA/df5SfTr9P5rhbbGhjx7c15Pr8g3uyaSQV/86R7dhVOyq3n94b4cbXba3aQUzj54a0BhfWtHtvC0P/nGM8Icu7DER/E1JO1Pp6GDB95nfI1WR/H7OiWffqXyHuBQFd0XaFTChVD5sDpu78Fi9QnxSuPWLiEdgGQzM8dZjYSA5uPVeuDsACmtclgN0Sg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HKAPR04MB3922
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT114.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2541fc23-41e4-4090-5427-08d8609c3e1e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kPXk3KYj2CiCYs9U9Ehsx5XOxSnkyTMmseXWAk2ZfB4J8AVwKhNFkapgj2KRmYjlImBU9FX66nuGkjCpThmffHwFLZ6bKDcGTkcN81GJyopDeotBTszx6MYcZRSPdkojqqAfBvczdy8IC7gxlH78AD7ygOfGoLXIE8ry5WZTzSrnrJOcAJyGAbAl97Y0hz1QOjoVzK0zj8GQlS6ueP8m7ffEtoKG9EImFfinnnYaQJHbcI+KnUSWRSx8z4KOlknAcGOfwybHTDDWP1kPp6566qymjPdrxdgokH4/bgsknrGYiFVULx4/IY5+CCsWSEqdqYeFsBjkDXrD9Nlyqh0nv5pH5Kf8oLuhaTAASLTsCKGb3d8N1MJdSrHzpIsWcv2EpL2uGPHaHDrOhs8X9Vx2e/jG7cXBlS9caNgpjP/ei5Lnai8BiVUxQESVU8rgRt0Z00oBxxvrGDZ6crpM2yjD+muxBpGY5TcTxkd/AYj9NSM=
X-Forefront-Antispam-Report: CIP:192.8.195.57; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-PU1-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(136003)(346002)(46966005)(8676002)(54906003)(86362001)(81166007)(6916009)(356005)(4326008)(83380400001)(52536014)(316002)(36906005)(2906002)(5660300002)(6506007)(53546011)(33656002)(336012)(7696005)(70206006)(8936002)(186003)(47076004)(82740400003)(55016002)(9686003)(26005)(478600001)(70586007)(55236004)(34020700004)(82310400003);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 15:12:28.1179 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cf42aea-3f1d-44a5-cf2c-08d8609c40bc
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.57];
 Helo=[APC01-PU1-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT114.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR04MB2496
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Patrick Williams <patrickw3@fb.com>, James Feist <james.feist@linux.intel.com>,
 "Velumani T-ERS, HCLTech" <velumanit@hcl.com>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Q2xhc3NpZmljYXRpb246IEhDTCBJbnRlcm5hbA0KDQpIaSBFZCwNCg0KICAgICBUaGFua3MgZm9y
IHlvdXIgY29tbWVudHMgb24gdGhpcy4NCg0KVGhhbmtzLA0KS3VtYXIuDQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBFZCBUYW5vdXMgPGVkQHRhbm91cy5uZXQ+DQpTZW50OiBX
ZWRuZXNkYXksIFNlcHRlbWJlciAyMywgMjAyMCAxOjM0IEFNDQpUbzogS3VtYXIgVGhhbmdhdmVs
IDx0aGFuZ2F2ZWwua0BoY2wuY29tPg0KQ2M6IFZpamF5IEtoZW1rYSA8dmlqYXlraGVta2FAZmIu
Y29tPjsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBKYWUgSHl1biBZb28gPGphZS5oeXVuLnlv
b0BsaW51eC5pbnRlbC5jb20+OyBWZXJub24gTWF1ZXJ5IDx2ZXJub24ubWF1ZXJ5QGxpbnV4Lmlu
dGVsLmNvbT47IEphbWVzIEZlaXN0IDxqYW1lcy5mZWlzdEBsaW51eC5pbnRlbC5jb20+OyBWZWx1
bWFuaSBULUVSUyxIQ0xUZWNoIDx2ZWx1bWFuaXRAaGNsLmNvbT47IFBhdHJpY2sgV2lsbGlhbXMg
PHBhdHJpY2t3M0BmYi5jb20+DQpTdWJqZWN0OiBSZTogUmVhZCBGUlUgb2YgaG9zdCB0aHJvdWdo
IGlwbWkgaW4gRW50aXR5IG1hbmFnZXIuDQoNCltDQVVUSU9OOiBUaGlzIEVtYWlsIGlzIGZyb20g
b3V0c2lkZSB0aGUgT3JnYW5pemF0aW9uLiBVbmxlc3MgeW91IHRydXN0IHRoZSBzZW5kZXIsIERv
buKAmXQgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyBhcyBpdCBtYXkgYmUgYSBQaGlz
aGluZyBlbWFpbCwgd2hpY2ggY2FuIHN0ZWFsIHlvdXIgSW5mb3JtYXRpb24gYW5kIGNvbXByb21p
c2UgeW91ciBDb21wdXRlci5dDQoNCk9uIE1vbiwgU2VwIDIxLCAyMDIwIGF0IDk6NDQgQU0gS3Vt
YXIgVGhhbmdhdmVsIDx0aGFuZ2F2ZWwua0BoY2wuY29tPiB3cm90ZToNCj4NCj4gQ2xhc3NpZmlj
YXRpb246IEhDTCBJbnRlcm5hbA0KPg0KPiBIaSBBbGwsDQo+DQo+ICAgICAgICAgICAgIFRoYW5r
cyBmb3IgeW91ciBjb21tZW50cyBhbmQgc3VnZ2VzdGlvbnMuDQo+DQo+ICAgICAgICAgICAgIEFz
IHN1Z2dlc3RlZCwgd2UgYXJlIHBsYW5uaW5nIHRvIGltcGxlbWVudCBhIG5ldyBwcm9jZXNzL3Nl
cnZpY2UgbGlrZSAgeHl6Lm9wZW5ibWNfcHJvamVjdC5JUE1CLkZydURldmljZSBpbiBlbnRpdHkg
bWFuYWdlciBtb2R1bGUgdG8gc3VwcG9ydCBIb3N0IEZSVSB0aHJvdWdoIGlwbWIgcmF0aGVyIHRo
YW4gdXNpbmcgZGJ1cy1zZW5zb3JzL2lwbWJzZW5zb3JzIGZpbGUuDQo+DQo+ICAgICAgICAgICAg
IEZvbGxvd2luZyBhcmUgdGhlIGFkdmFudGFnZXMsIGlmIGhvc3QgRlJVIGhhbmRsaW5nIGluIGVu
dGl0eSBtYW5hZ2VyIHJlcG8uDQo+DQo+ICAgICAgICAgICAgIDEuIEFsbCB0aGUgRlJVIGluZm9y
bWF0aW9uIGlzIGhhbmRsaW5nIGluIHRoZSBzYW1lIHJlcG8uDQoNCkJ1dCBJUE1CIGluZm9ybWF0
aW9uIGlzIGJpZnVyY2F0ZWQgaW4geW91ciBwbGFuLiAgSWRlYWxseSwgRnJ1LURldmljZSB3b3Vs
ZG4ndCBldmVuIGJlIGluIHRoZSBlbnRpdHktbWFuYWdlciByZXBvLCBpdCdzIHRoZXJlIG5vdyBq
dXN0IGFzIGFuIGFydGlmYWN0IG9mIHRoZSBoaXN0b3J5IG9mIGhvdyBpdCB3YXMgYnVpbHQuDQpP
ay4NCg0KPiAgICAgICAgICAgICAyLiBFbnRpdHkgbWFuYWdlciBQcm9iZSBjYW4gd29yay4NCg0K
SSdtIG5vdCB1bmRlcnN0YW5kaW5nIHRoaXM7ICBFbnRpdHkgbWFuYWdlciBwcm9iZXMgY2FuIHdv
cmsgcmVnYXJkbGVzcyBvZiB3aGVyZSB0aGUgY29kZSBpcyBjaGVja2VkIGluLg0KDQpPay4NCg0K
PiAgICAgICAgICAgICAzLiBBbGwgdGhlIEZSVSBGdW5jdGlvbnMgYXJlIGluIHRoZSBzYW1lIHJl
cG8uIFdlIGNhbiB0cnkgdG8gcmV1c2UgbW9zdCBvZiB0aGUgZnVuY3Rpb25zLg0KDQpUaGlzIGlz
IGEgdmFsaWQgcG9pbnQuICBNYXliZSBzb21lIG9mIHRoZSBmdW5jdGlvbnMgbmVlZCBhYnN0cmFj
dGVkIG91dCBpbnRvIHRoZWlyIG93biBsaWJyYXJpZXM/DQoNCk9rLg0KDQo+ICAgICAgICAgICAg
IDQuIEFkZGluZyBGcnUgb2JqZWN0IHRvIGRidXMgaGFuZGxpbmcgYXJlIGRvbmUuDQoNCkknbSBu
b3QgZm9sbG93aW5nIHRoaXMgcG9pbnQuICBBcmUgeW91IHNheWluZyB0aGF0IGNvZGUgd291bGRu
J3QgbmVlZCBkdXBsaWNhdGVkPw0KDQpZZXMuICBQbGFubmluZyB0byByZXVzZSB0aGUgZnVuY3Rp
b25zIGZvciBhZGRpbmcgZnJ1IG9iamVjdCB0byBkYnVzIGhhbmRsaW5nLg0KDQo+ICAgICAgICAg
ICAgIDUuIEFsbCBGUlUgdmFsaWRhdGlvbnMgYXJlIGRvbmUgaGVyZSBsaWtlIEZvcm1hdCBmcnUs
IHVwZGF0ZSBmcnUgcHJvcGVydHksIHZhbGlkYXRlIGhlYWRlciwgRnJ1IEFyZWFMZW4gYW5kIGNo
ZWNrc3VtLiBXZSBjYW4gdHJ5IHRvIHJldXNlIHRob3NlIHZhbGlkYXRpb25zLg0KDQpTZWUgcHJl
dmlvdXMgcG9pbnQgYWJvdXQgIm1heWJlIHdlIG5lZWQgYSBsaWJyYXJ5Ii4NCg0KPg0KPiAgICAg
ICAgICAgICBGb3Igc2Nhbm5pbmcgdGhlIC9kZXYvaXBtaS0qIG5vZGVzLCB3ZSBhcmUgdGhpbmtp
bmcgdG8gdXNlIGlwbWItY2hhbm5lbHMuanNvbiBjb2ZpZyBlbnRyaWVzIGluIGVudGl0eSBtYW5h
Z2VyIHJlcG8gc2luY2UgdGhpcyBjb25maWcgZmlsZSBoYXMgdmFsaWQgc2xhdmUgcGF0aCBhbmQg
YnVzIGFkZHJlc3MuDQoNCg0KSXQgc2hvdWxkIGJlIG5vdGVkLCB0aGVyZSdzIGdvaW5nIHRvIG5l
ZWQgdG8gYmUgc2lnbmlmaWNhbnRseSBtb3JlIGNvZGUgYWRkZWQgdG8gYmUgYWJsZSB0byBzY2Fu
IGFuZCBwYXJzZSB0aGUgU0RSLiAgSSdtIGFzc3VtaW5nIHRoYXQgY29kZSBhbG9uZSB3aWxsIGJl
IGxhcmdlciB0aGFuIEZydURldmljZSBpcyB0b2RheS4NCjo6RElTQ0xBSU1FUjo6DQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0KVGhlIGNvbnRlbnRzIG9mIHRoaXMgZS1tYWlsIGFu
ZCBhbnkgYXR0YWNobWVudChzKSBhcmUgY29uZmlkZW50aWFsIGFuZCBpbnRlbmRlZCBmb3IgdGhl
IG5hbWVkIHJlY2lwaWVudChzKSBvbmx5LiBFLW1haWwgdHJhbnNtaXNzaW9uIGlzIG5vdCBndWFy
YW50ZWVkIHRvIGJlIHNlY3VyZSBvciBlcnJvci1mcmVlIGFzIGluZm9ybWF0aW9uIGNvdWxkIGJl
IGludGVyY2VwdGVkLCBjb3JydXB0ZWQsIGxvc3QsIGRlc3Ryb3llZCwgYXJyaXZlIGxhdGUgb3Ig
aW5jb21wbGV0ZSwgb3IgbWF5IGNvbnRhaW4gdmlydXNlcyBpbiB0cmFuc21pc3Npb24uIFRoZSBl
IG1haWwgYW5kIGl0cyBjb250ZW50cyAod2l0aCBvciB3aXRob3V0IHJlZmVycmVkIGVycm9ycykg
c2hhbGwgdGhlcmVmb3JlIG5vdCBhdHRhY2ggYW55IGxpYWJpbGl0eSBvbiB0aGUgb3JpZ2luYXRv
ciBvciBIQ0wgb3IgaXRzIGFmZmlsaWF0ZXMuIFZpZXdzIG9yIG9waW5pb25zLCBpZiBhbnksIHBy
ZXNlbnRlZCBpbiB0aGlzIGVtYWlsIGFyZSBzb2xlbHkgdGhvc2Ugb2YgdGhlIGF1dGhvciBhbmQg
bWF5IG5vdCBuZWNlc3NhcmlseSByZWZsZWN0IHRoZSB2aWV3cyBvciBvcGluaW9ucyBvZiBIQ0wg
b3IgaXRzIGFmZmlsaWF0ZXMuIEFueSBmb3JtIG9mIHJlcHJvZHVjdGlvbiwgZGlzc2VtaW5hdGlv
biwgY29weWluZywgZGlzY2xvc3VyZSwgbW9kaWZpY2F0aW9uLCBkaXN0cmlidXRpb24gYW5kIC8g
b3IgcHVibGljYXRpb24gb2YgdGhpcyBtZXNzYWdlIHdpdGhvdXQgdGhlIHByaW9yIHdyaXR0ZW4g
Y29uc2VudCBvZiBhdXRob3JpemVkIHJlcHJlc2VudGF0aXZlIG9mIEhDTCBpcyBzdHJpY3RseSBw
cm9oaWJpdGVkLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGVtYWlsIGluIGVycm9yIHBsZWFz
ZSBkZWxldGUgaXQgYW5kIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5LiBCZWZvcmUgb3Bl
bmluZyBhbnkgZW1haWwgYW5kL29yIGF0dGFjaG1lbnRzLCBwbGVhc2UgY2hlY2sgdGhlbSBmb3Ig
dmlydXNlcyBhbmQgb3RoZXIgZGVmZWN0cy4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fDQo=
