Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 584474B8AC4
	for <lists+openbmc@lfdr.de>; Wed, 16 Feb 2022 14:50:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzK8Y6WFMz3bW9
	for <lists+openbmc@lfdr.de>; Thu, 17 Feb 2022 00:50:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-armh-onmicrosoft-com header.b=rNJxt+UE;
	dkim=pass (1024-bit key) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-armh-onmicrosoft-com header.b=rNJxt+UE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=2a01:111:f400:7e1b::62a;
 helo=eur05-am6-obe.outbound.protection.outlook.com;
 envelope-from=gilbert.chen@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-armh-onmicrosoft-com header.b=rNJxt+UE;
 dkim=pass (1024-bit key) header.d=armh.onmicrosoft.com
 header.i=@armh.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-armh-onmicrosoft-com header.b=rNJxt+UE; 
 dkim-atps=neutral
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1b::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzK822h2Fz2yK2
 for <openbmc@lists.ozlabs.org>; Thu, 17 Feb 2022 00:49:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aODIi1DHNPhKnj84kYfzHUBqa+GuVV7y2S1C8joalig=;
 b=rNJxt+UEYwg+Iawp81vsygpSAh6svgd7mO29M3oaSP+1XSQms5mxXPC2jRcHqDzzq18OVCbNpGKl5hnave7kt5ZYw5aNVoS3EfpK99t1QpqsvwGFRPoIYqJ8ONGPTh2C7hnWJkdcuxDWRtph1KaLxPw0pvJeoYuddbWLcnN92EA=
Received: from AM6PR08CA0008.eurprd08.prod.outlook.com (2603:10a6:20b:b2::20)
 by AM5PR0802MB2499.eurprd08.prod.outlook.com (2603:10a6:203:a1::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 16 Feb
 2022 13:49:13 +0000
Received: from AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::cc) by AM6PR08CA0008.outlook.office365.com
 (2603:10a6:20b:b2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16 via Frontend
 Transport; Wed, 16 Feb 2022 13:49:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT030.mail.protection.outlook.com (10.152.16.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Wed, 16 Feb 2022 13:49:12 +0000
Received: ("Tessian outbound 826a6d8e58c3:v113");
 Wed, 16 Feb 2022 13:49:12 +0000
X-CR-MTA-TID: 64aa7808
Received: from 291bd694307e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6658B62F-99EA-4065-AFA8-10455CCE83C6.1; 
 Wed, 16 Feb 2022 13:49:06 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 291bd694307e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Feb 2022 13:49:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNjJJ631aHXwKhdalTeOy84cZJ0zubpmeDGO7vja0++vDJMVR4NPypnMAAiJ79pgbmPgtJ7HKrADsjkQFhiyWlkzc5jRfYtA3HNIfFG7sLPFRreTDmeZKaI20gKXatqGj3wfi37ie0bXpTWxTcHaq3KE1QQz8MxkgosH7VYecqXu9av10XakcIcbEwWGkaZ5ONu9/hXnv6ghd/XPENiFdJapO2ZGosQgl6jocClTrtisufqp9NGYvABIPfOh/wgmPBZQW0lc5FfDj2JW+HLMBogRWcpMpd/DnP9mvR5WwtdwhApW7IdfQkVnN+wGJ1C2nenIsBCjwrK8eckN2zNS2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aODIi1DHNPhKnj84kYfzHUBqa+GuVV7y2S1C8joalig=;
 b=hpHY+c6fTGeTyckBkTJtH7Qk1fdgVUY2RF9b8RVDJc7K1d4A5l4Ck5u/raZGQALs49oQGICV3WidnvRxkAzgMmPTkTQSLpCu1wWTyW9HfQVsuvJSBk7xUk+1BidJj7GiHMDDRR8MytuP/cEbnvadFkeqXqcHgP8C7oDhSSuswuHFdonl4lD4G2IUkeKr0/wIBtstZA+TqxfvA0ayI3YmcGq6bO0Qjqj4w1TOQFyL7eKlz7LzIbNm1OwhRrAf/gCyb2Wxq+v7I/QTMO8U6GncVIYluBBNRz0k6u59wCEvByBhb3YZDakpCP/aTmNFaTlN0kGGHwqrRrjBOlc5y9Htxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aODIi1DHNPhKnj84kYfzHUBqa+GuVV7y2S1C8joalig=;
 b=rNJxt+UEYwg+Iawp81vsygpSAh6svgd7mO29M3oaSP+1XSQms5mxXPC2jRcHqDzzq18OVCbNpGKl5hnave7kt5ZYw5aNVoS3EfpK99t1QpqsvwGFRPoIYqJ8ONGPTh2C7hnWJkdcuxDWRtph1KaLxPw0pvJeoYuddbWLcnN92EA=
Received: from PAXPR08MB6560.eurprd08.prod.outlook.com (2603:10a6:102:12d::23)
 by VI1PR08MB4319.eurprd08.prod.outlook.com (2603:10a6:803:f9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Wed, 16 Feb
 2022 13:48:56 +0000
Received: from PAXPR08MB6560.eurprd08.prod.outlook.com
 ([fe80::e535:68c7:ce64:ca0e]) by PAXPR08MB6560.eurprd08.prod.outlook.com
 ([fe80::e535:68c7:ce64:ca0e%5]) with mapi id 15.20.4975.017; Wed, 16 Feb 2022
 13:48:56 +0000
From: Gilbert Chen <Gilbert.Chen@arm.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: request to add Gilbert Chen to CLA repository ACL
Thread-Topic: request to add Gilbert Chen to CLA repository ACL
Thread-Index: AdgefHr+K+LPiKmjTIejIcfAs/OXJQAOuZyAAALgWqABHcrncA==
Date: Wed, 16 Feb 2022 13:48:55 +0000
Message-ID: <PAXPR08MB6560715A7152F90C9274667B86359@PAXPR08MB6560.eurprd08.prod.outlook.com>
References: <PAXPR08MB6560EBD9F7A7DB8A23A9997E862F9@PAXPR08MB6560.eurprd08.prod.outlook.com>
 <af16b2be83e516ee1315ed6c238e98384fdf473b.camel@fuzziesquirrel.com>
 <PAXPR08MB6560E663519DBD5399A077CB862F9@PAXPR08MB6560.eurprd08.prod.outlook.com>
In-Reply-To: <PAXPR08MB6560E663519DBD5399A077CB862F9@PAXPR08MB6560.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: F2085DE8AF15DA48B38EAF85039397D8.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 91be83c3-40da-40ba-d63c-08d9f1531d7b
x-ms-traffictypediagnostic: VI1PR08MB4319:EE_|AM5EUR03FT030:EE_|AM5PR0802MB2499:EE_
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2499109112AE3E2EBE0F47D186359@AM5PR0802MB2499.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3276;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: WmKgl2Hi771MrA0htqTwaSbZ7XX5QJikbNJxAGFiByQbl53c/bu8zQay824YzzwWWUnHMSqg5biyrIIJQ6KL8Ji/69KGfBWkfwWxOEhBjGI77rLn6dB9LQhS7L6Sew57Hy/vDeFCzRSptRb1yRQ17lBUDO9G7YyBlgb2fn3lGdR7Qe83N4K82pP4KgS3FvPQhK1alJ3rOq0nALdOGc+isGHLyyW7IEm8jQzEnyTMgu/MsgnB0UeyVe+a/3BHcZucav/UOxDlcp9dr+xZf3wUPD72OEwJ7GUdnMTYePA7zaEWFqOdxFVFyYunFy1KTkMy/KP58tImF449p5tYB+wbFW6Fc5Tn3tnmqhJIRoZW5mu6IYhE0k5wzr2S26scp5ARg4P69UbtxbT7bMjLvscB2nGNH9g1xE7A5jOaDXakg9bjob0zhnflmxwyLyaXcNCpJ81KMJ21iaO4CEBLtpHhkkxjMp3BGIyXmiMHn3fg3Y36o+J2hV7+kLk5sX8VZVOCOKc1L2WCqyM7CpelCpP2vcNwO4Xpz9PaIlvpyR9KznaVUzwdUdoEasFirkAu8ZCkaxXquHV4SJNDxr/Onfhi0zDww8cAb3X+8ij7wxmoYKsvhovjVJu8Mugx6fffuEmK9Hy6BVXGwTmhfFSU3nInazvxAIfD8S79pHj6lDLOiT7Gi2OT3HjZa4a2Mbx8DIaTHNy2iv1Hn5yZAxlFzChJKieIf+w+A//IgIlsXDo+zhLj/PIe4foL9Fl7PXcBhkUDHFzHY+ABr5L2RPoTpMMd/L3uYfOs36tvrgJ3YZDnja0=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR08MB6560.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(84040400005)(110136005)(5660300002)(83380400001)(122000001)(33656002)(316002)(55016003)(66476007)(8936002)(66446008)(52536014)(8676002)(64756008)(76116006)(186003)(66946007)(6506007)(66556008)(2906002)(38070700005)(38100700002)(9686003)(71200400001)(86362001)(7696005)(508600001)(966005)(53546011);
 DIR:OUT; SFP:1101; 
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4319
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: c63c1aa7-869c-4639-dc48-08d9f15313af
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nCbuYDJH+3aBkCvbYG9u1GEa1sB15QTC4MGmoG121v7XSYvAOP8Y9PaVtQo9z4G0F+5L5uiwgBPgq8vcdSvQudvv7RaI6ErgQu5ciMTitS8i3zh4MWYBFEftDuPU4q5vt2TjK638O8v+8A4Lavb+7GWFZyhIxq+8igKsVRTV9CDZX8CIwy2SKYG/mmdPV+j5S4VmXZRc7sRXe3tkZ3YpZOFxF6Ao8MQC6e8Ki14zr9f5sAjUbL6oHqyPs/yLcLUk5tkZd3dH7euBb/RUdk/IsvKaCOe6retrTal9mzJAI90YZ7fXb4EWri1L40M1jysk/K/+4cf1mHpifzuz2hfPyx2QwetylLLfpac2QwiftmAjXF/oXuiIAcqA+dN9pNAmmIrKubYIOIg+v3nfkwaqQlSQPEHgyqVIBF/3OtCrPFSVB6KuK6RLiJktjUS8gQ1wyrd8t21nw2kBEid5Eb900EucfwW2JCtaniMITj788B5OjUYhKYpb3XCprHf21iUiaj359Q+WIJbcm0/jLRcQAi6n589TWzaX+1I/AjCVXNVIl6wPnFsXD4+ZAKle/bwkBSTZ5k4/zwDciHOcUlI/cDolQAvAGq0ZFnFcY+emHp6ycVuZX7AjA5+Kfv6S+gUimgI0QkvqSOfyZfiLPvbLMkEeYl+EfGkmnwdbm4AlzemQkoqOyrf7AyGHJODMYqhi2cSNgCfoFUHaq9RzF/+KVIq3/9PWVFnlBKDomtzMUH1PP7QB/7/BZDrSqO5Fr7bo
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230001)(4636009)(84040400005)(46966006)(36840700001)(40470700004)(336012)(86362001)(40460700003)(7696005)(52536014)(508600001)(53546011)(9686003)(966005)(36860700001)(2906002)(81166007)(6506007)(316002)(83380400001)(55016003)(70206006)(110136005)(33656002)(26005)(5660300002)(8676002)(186003)(82310400004)(70586007)(8936002)(47076005)(356005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 13:49:12.8401 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91be83c3-40da-40ba-d63c-08d9f1531d7b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2499
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

SGkgQnJhZCwNCg0KVGhlIGNoYW5nZSBvZiBvcGVuYm1jLWJ1aWxkLXNjcmlwdHMgaGFzIGJlZW4g
bWVyZ2VkLiBNeSBnZXJyaXQgYWNjb3VudCBpcyBhbHNvIGluIGFybS9jaS1hdXRob3JpemVkIGdy
b3VwLg0KQnV0IHRoZSBnZXJyaXQgcGF0Y2ggSSBzdWJtaXRlZCBzdGlsbCBjYW5ub3QgbGV0IE9w
ZW5CTUMgQ0kgd29yayBmb3IgbWUuIFdoZW4gSSBwdXNoIG5ldyBjb21taXQuDQpUaGUgY2hhbmdl
IGxvZyBvZiBnZXJyaXQgc3RpbGwgc2hvd3MgIlVzZXIgbm90IGFwcHJvdmVkLCBzZWUgYWRtaW4g
Q0kiDQpodHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6L2Mvb3BlbmJtYy9wbGRtLysv
NTExODQNCg0KU29ycnkgZm9yIHRyb3VibGUgeW91IGFnYWluLiBEbyB5b3Uga25vdyBpZiBhbnl0
aGluZyBJIG1pc3NlZD8NCg0KVGhhbmtzLA0KR2lsYmVydA0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogR2lsYmVydCBDaGVuDQpTZW50OiBUaHVyc2RheSwgRmVicnVhcnkgMTAs
IDIwMjIgOToxNSBQTQ0KVG86ICdCcmFkIEJpc2hvcCcgPGJyYWRsZXliQGZ1enppZXNxdWlycmVs
LmNvbT47IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KU3ViamVjdDogUkU6IHJlcXVlc3QgdG8g
YWRkIEdpbGJlcnQgQ2hlbiB0byBDTEEgcmVwb3NpdG9yeSBBQ0wNCg0KSGkgQnJhZCwNCg0KVGhh
bmtzIGZvciB5b3VyIGhlbHAuIEkgaGF2ZSBzdWJtaXR0ZWQgYSBjaGFuZ2UgdG8gYWRkIGFybSBp
biAvamVua2lucy91c2VyaWQtdmFsaWRhdGlvbg0KaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9q
ZWN0Lnh5ei9jL29wZW5ibWMvb3BlbmJtYy1idWlsZC1zY3JpcHRzLysvNTExMjUNCg0KR2lsYmVy
dA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQnJhZCBCaXNob3AgPGJyYWRs
ZXliQGZ1enppZXNxdWlycmVsLmNvbT4NClNlbnQ6IFRodXJzZGF5LCBGZWJydWFyeSAxMCwgMjAy
MiA3OjUwIFBNDQpUbzogR2lsYmVydCBDaGVuIDxHaWxiZXJ0LkNoZW5AYXJtLmNvbT47IG9wZW5i
bWNAbGlzdHMub3psYWJzLm9yZw0KU3ViamVjdDogUmU6IHJlcXVlc3QgdG8gYWRkIEdpbGJlcnQg
Q2hlbiB0byBDTEEgcmVwb3NpdG9yeSBBQ0wNCg0KT24gVGh1LCAyMDIyLTAyLTEwIGF0IDEyOjUy
ICswMDAwLCBHaWxiZXJ0IENoZW4gd3JvdGU6DQo+IEhpLA0KPg0KPiBDYW4geW91IGhlbHAgYWRk
IG1lIHRvIGFwcHJvcHJpYXRlIENMQSByZXBvc2l0b3J5IEFDTCBzaW5jZSBJIHdhbnQgdG8NCj4g
c3VibWl0IGNvZGUgY2hhbmdlcyB0byBnZXJyaXQgYnV0IHRoZSBnZXJyaXQgc2hvd3MgIk9wZW5C
TUMgQ0kgLSBVc2VyDQo+IG5vdCBhcHByb3ZlZCwgc2VlIGFkbWluLCBubyBDSSIuDQo+DQo+IEkg
aGF2ZSBiZWVuIGFkZGVkIGluIEFSTSBDQ0xBLg0KPiBodHRwczovL2RyaXZlLmdvb2dsZS5jb20v
ZmlsZS9kLzFpMFNrZkx2UjlfbG9SVFowelptQzZMX3NET1p5UWpaQi92aWV3DQo+DQo+IFRoYW5r
cywNCj4gR2lsYmVydA0KDQpIaSBHaWxiZXJ0DQoNCkkgY3JlYXRlZCBhcm0vY2ktYXV0aG9yaXpl
ZCBhbmQgYXJtL2NpLWF1dGhvcml6ZWQtb3duZXJzIGdyb3VwcyBvbiBHZXJyaXQuICBJIHB1dCBT
YW1lciBpbiBhcm0vY2ktYXV0aG9yaXplZC1vd25lcnMgc28gaGUgc2hvdWxkIGJlIGFibGUgdG8g
YWRkIGFkZGl0aW9uYWwgcGVvcGxlIHRvIGFybS9jaS1hdXRob3JpemVkIGluIHRoZSBmdXR1cmUu
DQoNCkJlZm9yZSBDSSB3aWxsIHVzZSB0aGVzZSBncm91cHMgdGhvdWdoLCB5b3UnbGwgaGF2ZSB0
byBzdWJtaXQgYSBjaGFuZ2Ugc2ltaWxhciB0byB0aGlzIG9uZToNCg0KaHR0cHM6Ly9nZXJyaXQu
b3BlbmJtYy1wcm9qZWN0Lnh5ei9jL29wZW5ibWMvb3BlbmJtYy1idWlsZC1zY3JpcHRzLysvNDYw
OTMNCklNUE9SVEFOVCBOT1RJQ0U6IFRoZSBjb250ZW50cyBvZiB0aGlzIGVtYWlsIGFuZCBhbnkg
YXR0YWNobWVudHMgYXJlIGNvbmZpZGVudGlhbCBhbmQgbWF5IGFsc28gYmUgcHJpdmlsZWdlZC4g
SWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgcGxlYXNlIG5vdGlmeSB0aGUg
c2VuZGVyIGltbWVkaWF0ZWx5IGFuZCBkbyBub3QgZGlzY2xvc2UgdGhlIGNvbnRlbnRzIHRvIGFu
eSBvdGhlciBwZXJzb24sIHVzZSBpdCBmb3IgYW55IHB1cnBvc2UsIG9yIHN0b3JlIG9yIGNvcHkg
dGhlIGluZm9ybWF0aW9uIGluIGFueSBtZWRpdW0uIFRoYW5rIHlvdS4NCg==
