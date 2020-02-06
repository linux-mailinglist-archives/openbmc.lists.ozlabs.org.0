Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 853A9154965
	for <lists+openbmc@lfdr.de>; Thu,  6 Feb 2020 17:40:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48D40f1C9bzDqbW
	for <lists+openbmc@lfdr.de>; Fri,  7 Feb 2020 03:40:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=40.107.7.70; helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=supreeth.venkatesh@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-armh-onmicrosoft-com header.b=glC6lX/V;
 dkim=pass (1024-bit key) header.d=armh.onmicrosoft.com
 header.i=@armh.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-armh-onmicrosoft-com header.b=glC6lX/V; 
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70070.outbound.protection.outlook.com [40.107.7.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48D3zj12BSzDqYV
 for <openbmc@lists.ozlabs.org>; Fri,  7 Feb 2020 03:39:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTAqM32liWcZ0sDPluCd0XjbbrsxDTsbykwtGB66274=;
 b=glC6lX/VXayJos9fP6793nAm452ES6TBTH1cRbJZsL607uyRojrn4JYqyhoxzW7uFcASj3I9aux9TV/yMlbiSTyyEhBrcE+5fSog/MenYViygSMTEjxBlIOf1wM1/VuzGDb0OLBR/vYDD2XaxneGlyazUtkXrSIiFAk3KZPakP8=
Received: from VI1PR0801CA0085.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::29) by DB6PR0801MB1846.eurprd08.prod.outlook.com
 (2603:10a6:4:35::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.23; Thu, 6 Feb
 2020 16:39:00 +0000
Received: from DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::201) by VI1PR0801CA0085.outlook.office365.com
 (2603:10a6:800:7d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.21 via Frontend
 Transport; Thu, 6 Feb 2020 16:39:00 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;lists.ozlabs.org; dmarc=bestguesspass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT004.mail.protection.outlook.com (10.152.20.128) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.18 via Frontend Transport; Thu, 6 Feb 2020 16:39:00 +0000
Received: ("Tessian outbound 1f9bda537fdc:v42");
 Thu, 06 Feb 2020 16:39:00 +0000
X-CR-MTA-TID: 64aa7808
Received: from fca9adb96db0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 271173DC-0242-466D-9B7B-DF2A6770C6CC.1; 
 Thu, 06 Feb 2020 16:38:55 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fca9adb96db0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 06 Feb 2020 16:38:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gf3askKl0xD9ua8PUYfYGeY+pbBzC5+VbCnAjTN09BdqjPO+V37SxJAgvBTuEqa4W1S/ggTS6/iuJZHM/BVst/7Nl59awZFzKGnyRbBdHNvzG4ctKlXhmZGfhKPnt/hMwauR3L03IXYLRwQeQ6eLIOb0IdW5p5jfs37VQbPMnyGGX8tS0WVMXmG9vMCwYmBSPE5mcl3473X0rLBykuTC4TAuwSq2nJIYD53jLeqqJXD4jxyd0RqffLSDHNDSCpNvv9LbFlyXJh6p+MJsnofGrNg6ZdBMrDFUdtCqXkkKVsngwfLxa4ZobLCM0w56w2VzGpVCTUZ/0H3a/AjCCchk2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTAqM32liWcZ0sDPluCd0XjbbrsxDTsbykwtGB66274=;
 b=K2HL9Rwz7jyaiCgs8nhQ9YzSn5qyGNV8P0rCRl4o5CoySs0+IBpwYr9T96FNjBF9jNccxBjdgOkgxhqtxdi3n4hVM9tGcU4wouleTFGFZSiUzaefj3N9289Q0fw576qhhgEbpcSWBXDlJhCTEt289P8AALcW0k5nclNsooVGRF5aQUchCobJBQWARgHYiP0nRzu5ZSoUxszzzoHv6PFXv+Nbb2ZpZCJsObR41Dt8eq7oLJ5rXrg+LiS01sJ7YhGxPVzfzz9CrsNcEpLFtK8UbYeLU61KBS4+EspoEUGDRQGS2tov1D3vXAv6X1Kw//82esgXTtCjBVV3GwyqFnQ7rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTAqM32liWcZ0sDPluCd0XjbbrsxDTsbykwtGB66274=;
 b=glC6lX/VXayJos9fP6793nAm452ES6TBTH1cRbJZsL607uyRojrn4JYqyhoxzW7uFcASj3I9aux9TV/yMlbiSTyyEhBrcE+5fSog/MenYViygSMTEjxBlIOf1wM1/VuzGDb0OLBR/vYDD2XaxneGlyazUtkXrSIiFAk3KZPakP8=
Received: from VE1PR08MB5165.eurprd08.prod.outlook.com (20.179.31.32) by
 VE1PR08MB4912.eurprd08.prod.outlook.com (10.255.114.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Thu, 6 Feb 2020 16:38:53 +0000
Received: from VE1PR08MB5165.eurprd08.prod.outlook.com
 ([fe80::3d8a:3442:a1ad:d5e5]) by VE1PR08MB5165.eurprd08.prod.outlook.com
 ([fe80::3d8a:3442:a1ad:d5e5%7]) with mapi id 15.20.2686.034; Thu, 6 Feb 2020
 16:38:53 +0000
From: Supreeth Venkatesh <Supreeth.Venkatesh@arm.com>
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 Bruce Mitchell <Bruce_Mitchell@phoenix.com>, Andrew Jeffery
 <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Deepak
 Kodihalli <dkodihal@linux.vnet.ibm.com>, "tomjoseph@in.ibm.com"
 <tomjoseph@in.ibm.com>, "Winiarska, Iwona" <iwona.winiarska@intel.com>,
 "piotr.matuszczak@intel.com" <piotr.matuszczak@intel.com>, Brad Bishop
 <bradleyb@fuzziesquirrel.com>, "sumanth.bhat@linux.intel.com"
 <sumanth.bhat@linux.intel.com>, James Mihm <james.mihm@intel.com>, Richard
 Hanley <rhanley@google.com>, Vijay Khemka <vijaykhemka@fb.com>
Subject: RE: OpenBMC PMCI Working group - Kick start Feb 10th
Thread-Topic: OpenBMC PMCI Working group - Kick start Feb 10th
Thread-Index: AQHV3Pjr04GoGJSgY0WirxbQtP36sagOXYAg
Date: Thu, 6 Feb 2020 16:38:53 +0000
Message-ID: <VE1PR08MB5165118C5D7CB83AF984773C801D0@VE1PR08MB5165.eurprd08.prod.outlook.com>
References: <67e599e4-0b45-aa01-1e27-d49c52873646@linux.intel.com>
 <4469ca80-8df5-43be-876b-f3e393407e59@www.fastmail.com>
 <acadebfec93f429e804443d76462456e@SCL-EXCHMB-13.phoenix.com>
 <7333abcd-873d-422d-fc94-2a0bc91f6d5d@linux.intel.com>
In-Reply-To: <7333abcd-873d-422d-fc94-2a0bc91f6d5d@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 2dfedcaf-a494-4daa-8b7f-26869d953be1.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Supreeth.Venkatesh@arm.com; 
x-originating-ip: [2600:1700:8c61:400:8dbc:9b6c:8775:714a]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a5697d36-c4a1-45e1-6314-08d7ab23117a
X-MS-TrafficTypeDiagnostic: VE1PR08MB4912:|DB6PR0801MB1846:
X-Microsoft-Antispam-PRVS: <DB6PR0801MB18464423BF4E2FBD044FC4EA801D0@DB6PR0801MB1846.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:9508;
x-forefront-prvs: 0305463112
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(199004)(189003)(81156014)(76116006)(7416002)(81166006)(71200400001)(966005)(478600001)(110136005)(86362001)(7696005)(66556008)(64756008)(8936002)(66476007)(66446008)(52536014)(66946007)(186003)(316002)(8676002)(6506007)(9686003)(53546011)(55016002)(5660300002)(2906002)(33656002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4912;
 H:VE1PR08MB5165.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: tUCLVoIvzvjK70Lp++GqrsCO0k+MWS4cTfMORMgH+NNGBFPieHeQwrH3A1Zc+qMJdrwhSvVsOHb2CIiyMgZQvv/jvggmLPAWuIcKmSP5/KrE/1YykZH4fYc4/EkYEMM2ResAS90ZOU1rWAmw+KaMeNdeGfAi1ccBtU7csvWEQ6cT7dyCySXXGZSgtpcIZwITWaiiYfocoXTjAo5l35lpT7MGEPxN9qU64j8cCFLqFY85iF1bW5fszF7VwQ6o2FNcWKgQr8Y1HdOuocGRfrfbKWJB5Pu6VDfFN1v3pvZFVbYbefAMNVotcWigsX6gM7yWzWGLMD78ZTFemxtkeqWLOR2Y7yzG/3bcuxmxRlVipO0YIwJpMjl6HqVi4GViYbENuO1tn64Yt5IUtKAEg51y3lmPawSOz8uC9brrsZRXUlYkcuOrc6U7ciEsd4vAcbpY448tTh8TRDzspQ3NO+YL4xaWz1eOUc2SwUgE8zJvhao8DSXbO9WPZLKvBlGBeNP55tTjmEi+DrnYKUIq87lQ4Sw25Z6GpQGU10TqFVb1o+wMKgSuI8ywieCqtkXbm5oaAzzhZC3tKgbCZ9giw2Y4+g==
x-ms-exchange-antispam-messagedata: 50VtNwAZ0Dir8U52e6ZzG0p+X8iXh9ApLS/Sbp/xfZqxRhhu+WtKSgMW44nmB0Z4iHZxzv5+p4HIkZ5yrGE5M7uEc6ZmNvyvyv6Q++wciiiczPuZxoSF1h2v6J+n3oW5vpGglJ+eFVbSR0lDFW6qul/QlzqUMsGRsCX3TFQhXHw5B6yXklM9YuMTv2/ln1tao+01ls4EtLTlSJvWD0HWcA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4912
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Supreeth.Venkatesh@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(136003)(199004)(189003)(6506007)(53546011)(8676002)(336012)(8936002)(81166006)(81156014)(110136005)(316002)(52536014)(356004)(70206006)(70586007)(5660300002)(9686003)(55016002)(7696005)(86362001)(26005)(33656002)(2906002)(186003)(966005)(478600001)(26826003)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0801MB1846;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3f99e0cc-aeb5-4bbb-bc49-08d7ab230d55
X-Forefront-PRVS: 0305463112
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qwWyP3Qx5BcfrHihGxbvrWMfJsTceus0wrkWkqn9h43ukfcoTYOVFrTMYazV2fEeHi8qQjs7VvcgU91/J93U588Emi+fUehBj6Gjc6AeGsZEGERQ1NixpmDwKRKDGRoXBeSW+W6SDW8BeFgvf+RqKOMlvqdkSUXmZIjy2ykdAUNGtO8X2zZjDbpsVftZGa53fe25FtTx2URTIDAZGDEM3TFYTIA3xmrEPUAhSA7H7k5yXRTyx6GUI8Mfz4lGmJQ+I158l3pF/d+j8KH9tFHVs0PbE9vF4LqZ/raaISvIK80PfhjRO87jJP5nibRImMaBKcBm0Os4O0MVcsBQBpHT2CAJzStKoNIKS9Wb86Nlmw9pZXEnydjYlWMnXdbqdSdPoMs9W4fenkGdMp7Ofe/W/fn18phWdrgOKtfAnGis8YYhrbjZkf9uxX/wnhlPNgWFDn7jj2UO4uyOgCoscxJQAXTXJcKLXeoh7ldOju4wAQMn6vFDXmiTBAsKVEXLT4+qpNFUy9YvOv7T+iQqTuKQ1Lo28+EDhDk5UZHyRpPvPvwkUKsBArUi7+vJfkhaE2T71baAvEGsNudJrFixg7jXkw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2020 16:39:00.1112 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5697d36-c4a1-45e1-6314-08d7ab23117a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1846
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

UmljaGFyZCwNCg0KSWYgdGhlcmUgd2lsbCBiZSBvbmUgZm9yIFVTLCBJIGFtIGludGVyZXN0ZWQg
YXMgd2VsbC4NCg0KVGhhbmtzLA0KU3VwcmVldGgNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCkZyb206IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNlcytzdXByZWV0aC52ZW5rYXRlc2g9YXJt
LmNvbUBsaXN0cy5vemxhYnMub3JnPiBPbiBCZWhhbGYgT2YgVGhvbWFpeWFyLCBSaWNoYXJkIE1h
cmlhbg0KU2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDYsIDIwMjAgODoyMCBBTQ0KVG86IEJydWNl
IE1pdGNoZWxsIDxCcnVjZV9NaXRjaGVsbEBwaG9lbml4LmNvbT47IEFuZHJldyBKZWZmZXJ5IDxh
bmRyZXdAYWouaWQuYXU+OyBPcGVuQk1DIE1haWxsaXN0IDxvcGVuYm1jQGxpc3RzLm96bGFicy5v
cmc+OyBEZWVwYWsgS29kaWhhbGxpIDxka29kaWhhbEBsaW51eC52bmV0LmlibS5jb20+OyB0b21q
b3NlcGhAaW4uaWJtLmNvbTsgV2luaWFyc2thLCBJd29uYSA8aXdvbmEud2luaWFyc2thQGludGVs
LmNvbT47IHBpb3RyLm1hdHVzemN6YWtAaW50ZWwuY29tOyBCcmFkIEJpc2hvcCA8YnJhZGxleWJA
ZnV6emllc3F1aXJyZWwuY29tPjsgc3VtYW50aC5iaGF0QGxpbnV4LmludGVsLmNvbTsgSmFtZXMg
TWlobSA8amFtZXMubWlobUBpbnRlbC5jb20+OyBSaWNoYXJkIEhhbmxleSA8cmhhbmxleUBnb29n
bGUuY29tPjsgVmlqYXkgS2hlbWthIDx2aWpheWtoZW1rYUBmYi5jb20+DQpTdWJqZWN0OiBPcGVu
Qk1DIFBNQ0kgV29ya2luZyBncm91cCAtIEtpY2sgc3RhcnQgRmViIDEwdGgNCg0KQWxsLA0KDQpM
ZXQncyBzdGFydCBvdXIgZmlyc3QgT3BlbkJNQyBQTUNJIHdvcmsgZ3JvdXAgb24gRmViIDEwIC0g
M1BNIHRvIDQgUE0gSVNUIChHTVQrNTMwKSAoU2VsZWN0ZWQgdGhpcyB0aW1lem9uZSwgYmFzZWQg
b24gdGhlIG1heGltdW0gcmVzcG9uc2VzKS4NCg0KQ2FsbCBpbiBkZXRhaWxzIGFyZSBpbg0KaHR0
cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3BlbmJtYy93aWtpL09wZW5CTUMtUE1DSS1XRw0KDQpO
b3RlOiBXaWxsIHBsYW4gdG8gaG9zdCAxIG1lZXRpbmcgYXQtbGVhc3QgMiBvciAzIHdlZWtzIG9u
Y2UgaW4gVVMgRnJpZW5kbHkgdGltZXpvbmUuIFdpbGwgY2FwdHVyZSBhbGwgdGhlIG1pbnV0ZXMg
aW4gdGhlIHdpa2kgcGFnZSB0byBrZWVwIGV2ZXJ5b25lIGluIHN5bmMuDQoNClJlZ2FyZHMsDQoN
ClJpY2hhcmQNCg0KSU1QT1JUQU5UIE5PVElDRTogVGhlIGNvbnRlbnRzIG9mIHRoaXMgZW1haWwg
YW5kIGFueSBhdHRhY2htZW50cyBhcmUgY29uZmlkZW50aWFsIGFuZCBtYXkgYWxzbyBiZSBwcml2
aWxlZ2VkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2Ugbm90
aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYW5kIGRvIG5vdCBkaXNjbG9zZSB0aGUgY29udGVu
dHMgdG8gYW55IG90aGVyIHBlcnNvbiwgdXNlIGl0IGZvciBhbnkgcHVycG9zZSwgb3Igc3RvcmUg
b3IgY29weSB0aGUgaW5mb3JtYXRpb24gaW4gYW55IG1lZGl1bS4gVGhhbmsgeW91Lg0K
