Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C613B2185F8
	for <lists+openbmc@lfdr.de>; Wed,  8 Jul 2020 13:22:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1xjB1sflzDr2j
	for <lists+openbmc@lfdr.de>; Wed,  8 Jul 2020 21:22:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.128.100; helo=kor01-ps2-obe.outbound.protection.outlook.com;
 envelope-from=velumanit@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=ifnRmYKn; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=ifnRmYKn; 
 dkim-atps=neutral
Received: from KOR01-PS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1280100.outbound.protection.outlook.com [40.107.128.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1xh11YRyzDr8m
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jul 2020 21:21:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRxKFPkqsewydh8dE2Hn7NN0+XLOcv8ai62mJ1YANK4=;
 b=ifnRmYKnthp07wmu5e8HQG+xzky7mJZbUeIGkwB1+w0tz6BIjvK4SA06FaNBXz8QjTE+34wK7cNKXpdb2D4owds6REI2HuWVnVIWZQ3+A9mPrjOb/+QfT8YzUMoGXBk3gMC7fiZBn8rA+h2CoQ2vebRRjHf0RXXRRxYHz+SB8IA=
Received: from SG2PR01CA0136.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::16) by SL2PR04MB3002.apcprd04.prod.outlook.com
 (2603:1096:100:3b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23; Wed, 8 Jul
 2020 11:20:55 +0000
Received: from SG2APC01FT009.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:8f:cafe::c9) by SG2PR01CA0136.outlook.office365.com
 (2603:1096:4:8f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend
 Transport; Wed, 8 Jul 2020 11:20:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.53)
 smtp.mailfrom=hcl.com; linux.intel.com; dkim=pass (signature was verified)
 header.d=HCL.COM; linux.intel.com; dmarc=pass action=none header.from=hcl.com; 
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.53; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.245.53) by
 SG2APC01FT009.mail.protection.outlook.com (10.152.250.158) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.24 via Frontend Transport; Wed, 8 Jul 2020 11:20:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gx05qtjhfS6oEirlnG97ecPtl3tt2A+YGyv7r1jw/Ys/rxXTLJXzud567XsNMnyBckId1Rt/hgNTR4GMcBtjiG6kdj7x5+7v9Q8pbXOuWfUmuYQrDftVN2f/etlILFnCPNzDiNjtpHJXUSDycqIq/kZZSsLZyQ1artydsFtLIvRdM1fM8oY+RCJLixydGSx5d4kdlhlQpkgcl/phg5Uls25j8hjef95EGudTD7lCaIxWkdACHWiH+lwKD1q5y4T3zpRHdjc/TaNfHqZNWExMYlYxHIIKTpCQYnPogBxUwNyrRg79VBD7hD4L+Q6+IJlgWdFss/8tsTepJW+GG7p5tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRxKFPkqsewydh8dE2Hn7NN0+XLOcv8ai62mJ1YANK4=;
 b=CDm6+dXjjE2VsG9ITjvMn8uw3OghH2uWaCK9JY+leBzQOXh9p/YRj0BvQVjUDjT4CqPpqY1nAsACQrDzv3RxTq8oHTlQwPKKUhM6GIJfdNm84Eb+5YGMfyZB1sBB/vQiXXy4PhiCua49En/dr9Dp391vMyGSUXJIvF3s2Cc6lH56g8kVKyps+SBKpCYhQGvx0MfO9TxuSJJqlRYNq3rKejQcRNPvEOsrjpuHf2/su1sUuRJxcW98t8aWeiMmdUiRil1z6ImufBDJAB5U0SPVhFlkz9cjOdAc+jOkPmiZvfjEy2HP5vcTyL2fW52D4m1i32pgSDNpICDUEFTMbJdekQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRxKFPkqsewydh8dE2Hn7NN0+XLOcv8ai62mJ1YANK4=;
 b=ifnRmYKnthp07wmu5e8HQG+xzky7mJZbUeIGkwB1+w0tz6BIjvK4SA06FaNBXz8QjTE+34wK7cNKXpdb2D4owds6REI2HuWVnVIWZQ3+A9mPrjOb/+QfT8YzUMoGXBk3gMC7fiZBn8rA+h2CoQ2vebRRjHf0RXXRRxYHz+SB8IA=
Received: from HK0PR04MB3153.apcprd04.prod.outlook.com (2603:1096:203:80::9)
 by HK0PR04MB3090.apcprd04.prod.outlook.com (2603:1096:203:80::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Wed, 8 Jul
 2020 11:20:52 +0000
Received: from HK0PR04MB3153.apcprd04.prod.outlook.com
 ([fe80::41c7:ca16:98b6:9f1a]) by HK0PR04MB3153.apcprd04.prod.outlook.com
 ([fe80::41c7:ca16:98b6:9f1a%7]) with mapi id 15.20.3153.029; Wed, 8 Jul 2020
 11:20:52 +0000
From: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: RE: Multi-host support in ipmbbridged and phosphor-host-ipmid
Thread-Topic: Multi-host support in ipmbbridged and phosphor-host-ipmid
Thread-Index: AdZRW6ztFSJjWqCCRaaKJObGR/aPLwCf4EmAAE9K/bA=
Date: Wed, 8 Jul 2020 11:20:52 +0000
Message-ID: <HK0PR04MB31531DBABB66AD867D547A34A7670@HK0PR04MB3153.apcprd04.prod.outlook.com>
References: <SG2PR04MB316063EDE5B383B87F33D96BA76A0@SG2PR04MB3160.apcprd04.prod.outlook.com>
 <20200706211949.GA47395@mauery.jf.intel.com>
In-Reply-To: <20200706211949.GA47395@mauery.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiOGE5NTZiY2EtYjk0MC00MGU1LWI1NjAtZjZmNzAwNmU5YjgzIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoibnVsbCJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6IlQ1RWt2UEdMNE5XbHdSelRDT2t1MGwxaEhrVVJWU2RGS2hIbmh1eWRPNWR6ZHpDK3R3bnMyYlE0RWtXbHRlTWEifQ==
x-hclclassification: null
Authentication-Results-Original: linux.intel.com; dkim=none (message not
 signed) header.d=none;linux.intel.com; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [122.174.180.60]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 578c0639-43be-4c0a-2a26-08d82330fb44
x-ms-traffictypediagnostic: HK0PR04MB3090:|SL2PR04MB3002:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <SL2PR04MB3002454FF3CAA4142D56B867A7670@SL2PR04MB3002.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: NeRgVAk219iztMKcpvAY4nKM2k8k8hlFx5D31PfIj6gJKxf004p52pup/kWQQYALOiv+ylSzUR353dSGAsaNhF0l2UEeaipK6+NmMSiBbBTfFncbgxqzoKYm3nsQgpO2jChvUp8Q07KGtgOQBtEavBFf3bLNwP5i+V4NBRvR0bcQnx4lbNGrcvSCEwbPW+Ck+4cvrTkaaLvAz8eETR8yHyvlrGjIy7tgeh2teP5XyqR2N3atsAOUuz11rPSoH01XMKSJ8LUeDgt8QEECZyBjRGwKEfKNDj0I85hD3qdOckri6HZRgAuTRoWw1ujEjf1uJ5o4v0YWd40AOOlIEyWQ1I0grsGzKvpNI8bnkmC1WNU=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HK0PR04MB3153.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(7696005)(53546011)(6506007)(8936002)(4326008)(6916009)(66946007)(966005)(26005)(86362001)(8676002)(64756008)(66446008)(52536014)(66476007)(66556008)(2906002)(5660300002)(76116006)(186003)(71200400001)(316002)(54906003)(478600001)(33656002)(55016002)(83380400001)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: /g18XBrMSqdK8yQmprH5PWNvS5kMl8XDsS9IHlRmmD3V8VJon2k32/Hz/GpGCr2JlMjWZbtoc93A7fSO7iTxbPyvredXYxYR0lOjlY8oR4omktafn7DLJx6uolBO3Rjne40cpDnRUj5YyayVE0PGDdns5D8gJpSSWwVBZCgw/RUGz8dCvXvrmNJ1dnpNN0nCYosRBm3orZcp+l6XvmrhGjlzhIbKcqjLOudfWKGgqU8QZtaGbAiFcdpU3G3dUtPZDSL1lXJT2vihVGRTeKRluXN5A7hvgVAW5bNDTF5Ubad34oouLhfBxPB+6GDWjG2i+h5zrm0wsFICie9DVXvbwmVmaXEg67JA0Nx3uCX/KGlbhvFAO3gemk970XMwNpAUFhyyD1y2jePTcy7xZvhHszDbtaRBHB0SyStcedO4nBNuL1Ag8O+ai7gBDP9djdTjg6TYxqhVSD8GZeqgTXWom7qNRyfGhHCbIHLOrFvlwnSV4rIkp564pyOqpDRPy9nn
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB3090
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT009.eop-APC01.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:192.8.245.53; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-SG2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(46966005)(8676002)(5660300002)(86362001)(82310400002)(356005)(52536014)(83380400001)(966005)(478600001)(8936002)(4326008)(81166007)(47076004)(186003)(82740400003)(26005)(33656002)(336012)(2906002)(9686003)(6916009)(55016002)(7696005)(6506007)(53546011)(70586007)(70206006)(36906005)(316002)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 041b8fb6-4e7a-43db-1e5e-08d82330f9bd
X-Forefront-PRVS: 04583CED1A
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gS1vNXZjDpgH67tDe6IgSwGRZOx/SjpNW3wETWAYe0X7+CKgbwdvlzC7d6xcmFL036Bbtbp/35m7wrdBx4H01Zyjq8tpwErDwZJh4u3GpG0jRg/8rTZJ8I1y47AGojHbHh7czYLymKDorUcWi62KZ+5zQvCYDh8IDE7hLH+xFYREoIzoic+CZO48eObQsxUOVxRQw/aYPZ3MkbwgRcht/VlXneBIfHIYLjj/2JmlS7gSA1cQdyBLh94nBDxSRWv2MxDha2R4XW8HNxuJ1LK0kAHopr7I1zXQOtsu5i2DoZCtO90+RfFZJUTo4vTq6w7+gidavwQoXUjLEGXAhNg+kCrRxQ0SBeiWj2IxCGaKd+mjGn70Ci8lh1t/Guo19oxY3oSZR177TyNqCs+2618r5OWKF3Xb9eYMKKEGPw6bjegGzY/FG4J2eUtJM3uHos3X
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2020 11:20:54.9618 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 578c0639-43be-4c0a-2a26-08d82330fb44
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.53];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT009.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR04MB3002
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
Cc: Kumar Thangavel <thangavel.k@hcl.com>, Ed Tanous <ed.tanous@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@us.ibm.com>, Vijay Khemka <vijaykhemka@fb.com>,
 Dawid Frycki <dawid.frycki@intel.com>, Patrick Williams <patrickw3@fb.com>,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgVmVybm9uLA0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudHMuIFBsZWFzZSBmaW5kIG15IHJl
c3BvbnNlIGlubGluZS4gQXMgc3VnZ2VzdGVkIGJ5IEFuZHJldyBJIGhhdmUgbW92ZWQgdGhlIGRl
c2lnbiBkb2MgdG8gZ2Vycml0LiBXZSB3aWxsIHVzZSB0aGUgc2FtZSBnb2luZyBmb3J3YXJkLiBL
aW5kbHkgcHJvdmlkZSB5b3VyIGNvbW1lbnRzIGluIGdlcnJpdC4NCg0KR2Vycml0IGxpbms6IGh0
dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJvamVjdC54eXovYy9vcGVuYm1jL2RvY3MvKy8zNDQ2NA0K
DQpSZWdhcmRzLA0KVmVsdQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogVmVy
bm9uIE1hdWVyeSA8dmVybm9uLm1hdWVyeUBsaW51eC5pbnRlbC5jb20+IA0KU2VudDogVHVlc2Rh
eSwgSnVseSA3LCAyMDIwIDI6NTAgQU0NClRvOiBWZWx1bWFuaSBULUVSUyxIQ0xUZWNoIDx2ZWx1
bWFuaXRAaGNsLmNvbT4NCkNjOiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc7IERhd2lkIEZyeWNr
aSA8ZGF3aWQuZnJ5Y2tpQGludGVsLmNvbT47IEVkIFRhbm91cyA8ZWQudGFub3VzQGludGVsLmNv
bT47IEFkcmlhbmEgS29ieWxhayA8YW5vb0B1cy5pYm0uY29tPjsgUGF0cmljayBXaWxsaWFtcyA8
cGF0cmlja3czQGZiLmNvbT47IEt1bWFyIFRoYW5nYXZlbCA8dGhhbmdhdmVsLmtAaGNsLmNvbT47
IFZpamF5IEtoZW1rYSA8dmlqYXlraGVta2FAZmIuY29tPjsgUmF0YW4gR3VwdGEgPHJhdGFndXB0
QGxpbnV4LnZuZXQuaWJtLmNvbT4NClN1YmplY3Q6IFJlOiBNdWx0aS1ob3N0IHN1cHBvcnQgaW4g
aXBtYmJyaWRnZWQgYW5kIHBob3NwaG9yLWhvc3QtaXBtaWQNCg0KW0NBVVRJT046IFRoaXMgRW1h
aWwgaXMgZnJvbSBvdXRzaWRlIHRoZSBPcmdhbml6YXRpb24uIFVubGVzcyB5b3UgdHJ1c3QgdGhl
IHNlbmRlciwgRG9u4oCZdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIGFzIGl0IG1h
eSBiZSBhIFBoaXNoaW5nIGVtYWlsLCB3aGljaCBjYW4gc3RlYWwgeW91ciBJbmZvcm1hdGlvbiBh
bmQgY29tcHJvbWlzZSB5b3VyIENvbXB1dGVyLl0NCg0KT24gMDMtSnVsLTIwMjAgMDU6MjIgUE0s
IFZlbHVtYW5pIFQtRVJTLEhDTFRlY2ggd3JvdGU6DQo+SGkgQWxsLA0KPg0KPldlIGhhdmUgYSBt
dWx0aS1ob3N0IHN5c3RlbSBhbmQgd2FudGVkIHRvIGFkZCBzdXBwb3J0IGluIG9wZW5ibWMgdG8g
aGFuZGxlIGFsbCBpcG1pIGNvbW1hbmRzLiBXZSBoYXZlIGNvbWUgdXAgd2l0aCB0aGUgZGVzaWdu
IGFwcHJvYWNoIHRoYXQgY291bGQgaGVscCB1cyBpbiBoYW5kbGluZyBpcG1pIGNvbW1hbmQgd2l0
aCBtdWx0aWhvc3Qgc3lzdGVtLiBQbGVhc2UgZmluZCB0aGUgYXR0YWNoZWQgZGVzaWduIHByb3Bv
c2FsIGFuZCBwcm92aWRlIGZlZWRiYWNrL3N1Z2dlc3Rpb25zLg0KPg0KPlJlZ2FyZHMsDQo+VmVs
dQ0KPg0KPjo6RElTQ0xBSU1FUjo6DQo+X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18N
Cj5UaGUgY29udGVudHMgb2YgdGhpcyBlLW1haWwgYW5kIGFueSBhdHRhY2htZW50KHMpIGFyZSBj
b25maWRlbnRpYWwgYW5kIGludGVuZGVkIGZvciB0aGUgbmFtZWQgcmVjaXBpZW50KHMpIG9ubHku
IEUtbWFpbCB0cmFuc21pc3Npb24gaXMgbm90IGd1YXJhbnRlZWQgdG8gYmUgc2VjdXJlIG9yIGVy
cm9yLWZyZWUgYXMgaW5mb3JtYXRpb24gY291bGQgYmUgaW50ZXJjZXB0ZWQsIGNvcnJ1cHRlZCwg
bG9zdCwgZGVzdHJveWVkLCBhcnJpdmUgbGF0ZSBvciBpbmNvbXBsZXRlLCBvciBtYXkgY29udGFp
biB2aXJ1c2VzIGluIHRyYW5zbWlzc2lvbi4gVGhlIGUgbWFpbCBhbmQgaXRzIGNvbnRlbnRzICh3
aXRoIG9yIHdpdGhvdXQgcmVmZXJyZWQgZXJyb3JzKSBzaGFsbCB0aGVyZWZvcmUgbm90IGF0dGFj
aCBhbnkgbGlhYmlsaXR5IG9uIHRoZSBvcmlnaW5hdG9yIG9yIEhDTCBvciBpdHMgYWZmaWxpYXRl
cy4gVmlld3Mgb3Igb3BpbmlvbnMsIGlmIGFueSwgcHJlc2VudGVkIGluIHRoaXMgZW1haWwgYXJl
IHNvbGVseSB0aG9zZSBvZiB0aGUgYXV0aG9yIGFuZCBtYXkgbm90IG5lY2Vzc2FyaWx5IHJlZmxl
Y3QgdGhlIHZpZXdzIG9yIG9waW5pb25zIG9mIEhDTCBvciBpdHMgYWZmaWxpYXRlcy4gQW55IGZv
cm0gb2YgcmVwcm9kdWN0aW9uLCBkaXNzZW1pbmF0aW9uLCBjb3B5aW5nLCBkaXNjbG9zdXJlLCBt
b2RpZmljYXRpb24sIGRpc3RyaWJ1dGlvbiBhbmQgLyBvciBwdWJsaWNhdGlvbiBvZiB0aGlzIG1l
c3NhZ2Ugd2l0aG91dCB0aGUgcHJpb3Igd3JpdHRlbiBjb25zZW50IG9mIGF1dGhvcml6ZWQgcmVw
cmVzZW50YXRpdmUgb2YgSENMIGlzIHN0cmljdGx5IHByb2hpYml0ZWQuIElmIHlvdSBoYXZlIHJl
Y2VpdmVkIHRoaXMgZW1haWwgaW4gZXJyb3IgcGxlYXNlIGRlbGV0ZSBpdCBhbmQgbm90aWZ5IHRo
ZSBzZW5kZXIgaW1tZWRpYXRlbHkuIEJlZm9yZSBvcGVuaW5nIGFueSBlbWFpbCBhbmQvb3IgYXR0
YWNobWVudHMsIHBsZWFzZSBjaGVjayB0aGVtIGZvciB2aXJ1c2VzIGFuZCBvdGhlciBkZWZlY3Rz
Lg0KPl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQoNCj4NCj4NCj4jIE11bHRpLWhv
c3QgSVBNSSBkZXNpZ24NCj4tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4NCj5BdXRob3JzOg0K
PiAgVmVsdW1hbmkgVCwgW3ZlbHVtYW5pdEBoY2xdKG1haWx0bzp2ZWx1bWFuaXRAaGNsLmNvbSkN
Cj4gIEt1bWFyIFQsIFt0aGFuZ2F2ZWwua0BoY2wuY29tXShtYWlsdG86dGhhbmdhdmVsLmtAaGNs
LmNvbSkNCj4NCj5QcmltYXJ5IGFzc2lnbmVlOg0KPg0KPk90aGVyIGNvbnRyaWJ1dG9yczoNCj4N
Cj5DcmVhdGVkOg0KPiAgMjAyMC0wNi0yNg0KPg0KPjEuIElzc3VlIERlc2NyaXB0aW9ucHRpb246
DQo+LS0tLS0tLS0tLS0tLS0tLS0tLS0NCj5UaGUgY3VycmVudCB2ZXJzaW9uIG9mIG9wZW5ibWMg
ZG9lcyBub3Qgc3VwcG9ydCBtdWx0aS1ob3N0IA0KPmltcGxlbWVudGF0aW9uIGluIGlwbWkgY29t
bWFuZHMgaGFuZGxpbmcuIFdlIGhhdmUgYSBtdWx0aS1ob3N0IHN5c3RlbSANCj5hbmQgcHJvcG9z
aW5nIHRoZSBkZXNpZ24gdG8gc3VwcG9ydCBtdWx0aS1ob3N0Lg0KPg0KPkFzIGRldGFpbGVkIGJl
bG93IHRoZSBob3N0cyBhcmUgY29ubmVjdGVkIGluIHRoZSBpcG1iIGludGVyZmFjZSwgYWxsIA0K
Pmhvc3QgcmVsYXRlZCBjb21tdW5pY2F0aW9uIGlzIGJhc2VkIG9uIGlwbWIuIFRoZSBvcGVuYm1j
IHVzZXMgDQo+aXBtYmJyaWRnZWQgdG8gbWFuYWdlIGlwbWIgYnVzc2VzIGFuZCB0aGUgaXBtYiBt
ZXNzYWdlcyBhcmUgcm91dGVkIHRvIGlwbWlkLg0KPg0KPklzc3VlIDE6IGlwbWJyaWRnZWQgZG9l
cyBub3Qgc3VwcG9ydCBtb3JlIHRoYW4gMiBjaGFubmVscw0KDQppcG1iYnJpZGdlZCBzaG91bGQg
c3VwcG9ydCBhcyBtYW55IGNoYW5uZWxzIGFzIGFyZSBzcGVjaWZpZWQgaW4gdGhlIGNvbmZpZ3Vy
YXRpb24gZmlsZS4gQSBjaGFuZ2UgbGlrZSB0aGlzIHdvdWxkIGdvIGluIHlvdXIgYmJhcHBlbmQg
aW4geW91ciBwbGF0Zm9ybSBsYXllci4NCg0KW1ZlbHVdIFllcy4gV2Ugd2lsbCB1c2UgdGhlIGNv
bmZpZyBmaWxlIGZvciBhZGRpbmcgdGhlIG1vcmUgY2hhbm5lbC4gQ3VycmVudGx5IHRoaXMgaXMg
bm90IHdvcmtpbmcgYW5kIGRlYnVnZ2luZyB0aGUgc2FtZS4gQnV0IHdlIGhhdmUgdXBkYXRlZCB0
aGUgZGVzaWduIGRvY3VtZW50IHdpdGggeW91ciBjb21tZW50cy4NCg0KPklzc3VlIDI6IGlwbWlk
IGRvZXMgbm90IGhhdmUgdGhlIGluZm9ybWF0aW9uIG9uIHdoaWNoIGlwbWIgY2hhbm5lbCB0aGUg
DQo+cmVxdWVzdCBoYXMgY29tZSBmcm9tLiBUaGUgaXBtaWQgaGFuZGxlcnMgc2hvdWxkIGhhdmUg
dGhlIGhvc3QgZGV0YWlscyANCj50byBmZXRjaCB0aGUgaG9zdCBzcGVjaWZpYyByZXNwb25zZXMu
DQoNCkl0IGhhcyBlbm91Z2ggaW5mb3JtYXRpb24gdG8gbWFwIGl0IHRvIGFuIElQTUkgY2hhbm5l
bCBhbmQgdG8gc2VuZCBpdCBiYWNrIHRvIHRoZSByZXF1ZXN0ZXIuDQpbVmVsdV0gWWVzLCB3ZSBw
bGFuIHRvIHVzZSB0aGUgcGFyYW1ldGVyICJvcHRpb25zIg0KDQoNCj4yLiBJUE1JIGFuZCBJUE1C
IFN5c3RlbSBhcmNoaXRlY3R1cmU6DQo+LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0NCj4gICAgICAgKy0tLS0tLS0tLS0tKyAgICAgICArLS0tLS0tLS0tLS0tKyAgICAgICst
LS0tLS0tLSsNCj4gICAgICAgfCAgICAgICAgICAgfCAgICAgICB8ICAgICAgICAgICAgfCBpcG1i
MXwgICAgICAgIHwNCj4gICAgICAgfCAgICAgICAgICAgfCAgICAgICB8ICAgICAgICAgICAgfC0t
LS0tLXwgSG9zdC0xIHwNCj4gICAgICAgfCAgICAgICAgICAgfCAgICAgICB8ICAgICAgICAgICAg
fCAgICAgIHwgICAgICAgIHwNCj4gICAgICAgfCAgICAgICAgICAgfCAgICAgICB8ICAgICAgICAg
ICAgfCAgICAgICstLS0tLS0tLSsNCj4gICAgICAgfCAgICAgICAgICAgfCAgICAgICB8ICAgICAg
ICAgICAgfA0KPiAgICAgICB8ICAgICAgICAgICB8ICAgICAgIHwgICAgICAgICAgICB8DQo+ICAg
ICAgIHwgICAgICAgICAgIHwgZGJ1cyAgfCAgICAgICAgICAgIHwgICAgICArLS0tLS0tLS0rDQo+
ICAgICAgIHwgaXBtaWQgICAgIHwtLS0tLS0tfCBJcG1iYnJpZGdlZHwgaXBtYjJ8ICAgICAgICB8
DQo+ICAgICAgIHwgICAgICAgICAgIHwgICAgICAgfCAgICAgICAgICAgIHwtLS0tLS18IEhvc3Qt
MiB8DQo+ICAgICAgIHwgICAgICAgICAgIHwgICAgICAgfCAgICAgICAgICAgIHwgICAgICB8ICAg
ICAgICB8DQo+ICAgICAgIHwgICAgICAgICAgIHwgICAgICAgfCAgICAgICAgICAgIHwgICAgICAr
LS0tLS0tLS0rDQo+ICAgICAgIHwgICAgICAgICAgIHwgICAgICAgfCAgICAgICAgICAgIHwNCj4g
ICAgICAgfCAgICAgICAgICAgfCAgICAgICB8ICAgICAgICAgICAgfA0KPiAgICAgICB8ICAgICAg
ICAgICB8ICAgICAgIHwgICAgICAgICAgICB8ICAgICAgKy0tLS0tLS0tKw0KPiAgICAgICB8ICAg
ICAgICAgICB8ICAgICAgIHwgICAgICAgICAgICB8IGlwbWIgfCAgICAgICAgfA0KPiAgICAgICB8
ICAgICAgICAgICB8ICAgICAgIHwgICAgICAgICAgICB8LS0tLS0tfCBIb3N0LU4gfA0KPiAgICAg
ICB8ICAgICAgICAgICB8ICAgICAgIHwgICAgICAgICAgICB8ICAgICAgfCAgICAgICAgfA0KPiAg
ICAgICArLS0tLS0tLS0tLS0rICAgICAgICstLS0tLS0tLS0tLS0rICAgICAgKy0tLS0tLS0tKw0K
Pg0KPkhvc3RzIGFyZSBjb25uZWN0ZWQgd2l0aCBpcG1iIGludGVyZmFjZSwgdGhlIGhvc3RzIGNh
biBiZSAxIHRvIE4uIFRoZSANCj5pcG1iIHJlcXVlc3QgY29taW5nIGZyb20gdGhlIGhvc3RzIGFy
ZSByb3V0ZWQgdG8gaXBtaWQgYnkgdGhlIGlwbWJicmlkZ2VkLg0KPlRoZSBpcG1kIHJlcXVlc3Rz
IGFyZSByb3V0ZWQgZnJvbSBpcG1pZCBvciBhbnkgc2VydmljZSBieSBkLWJ1cyANCj5pbnRlcmZh
Y2UgYW5kIHRoZSBpcG1iYnJpZGdlZCByb3V0ZXMgdG8gaXBtYiBpbnRlcmZhY2UuDQo+DQo+My4g
UHJvcG9zZWQgRGVzaWduOg0KPi0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+VG8gYWRkcmVzcyBpc3N1
ZTEgYW5kIGlzc3VlMiwgd2UgcHJvcG9zZSB0aGUgZm9sbG93aW5nIGRlc2lnbiBjaGFuZ2VzIA0K
PmluIGlwbWJicmlkZ2VkIGFuZCBpcG1pZC4NCj4NCj4zLjEgQ2hhbmdlcyBpbiBpcG1iYnJpZGdl
ZDoNCj4tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj5UaGUgY3VycmVudCBpcG1iYnJpZGdl
ZCBzdXBwb3J0cyBvbmx5IDIgY2hhbm5lbHMgYW5kIHRoaXMgbmVlZHMgdG8gYmUgDQo+ZW5oYW5j
ZWQgdG8gbW9yZSBjaGFubmVscy4NCj5pcG1iYnJpZGdlZCB0byBzZW5kIHRoZSBjaGFubmVsIGRl
dGFpbHMgZnJvbSB3aGVyZSB0aGUgcmVxdWVzdCBpcyANCj5yZWNlaXZlZA0KPg0KPjMuMS4xIENo
YW5nZTEgOiBzdXBwb3J0IG1vcmUgdGhhbiAyIGNoYW5uZWxzDQo+LS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+VG8gc3VwcG9ydCBtb3JlIHRoYW4gMiBjaGFu
bmVscywgd2UgcHJvcG9zZSB0byBhZGQgYWRkaXRpb25hbCBjaGFubmVscyANCj5uYW1lZCAiaG9z
dDEiLCAiaG9zdDIiIC4uLiJob3N0biINCj4NCj5UaGlzIGNhbiBiZSBkZWNpZGVkIGJ5IHRoZSBj
b25maWcgZmlsZSAiaXBtYi1jaGFubmVscy5qc29uIiwgVGhlIGNoYW5nZSANCj53aWxsIGxvb2sg
bGlrZSBiZWxvdw0KPg0KPnsNCj4gICJjaGFubmVscyI6IFsNCj4gICAgew0KPiAgICAgICJ0eXBl
IjogIm1lIiwNCj4gICAgICAic2xhdmUtcGF0aCI6ICIvZGV2L2lwbWItMSIsDQo+ICAgICAgImJt
Yy1hZGRyIjogMzIsDQo+ICAgICAgInJlbW90ZS1hZGRyIjogNDQNCj4gICAgfSwNCj4gICAgew0K
PiAgICAgICJ0eXBlIjogImlwbWIiLA0KPiAgICAgICJzbGF2ZS1wYXRoIjogIi9kZXYvaXBtYi0y
IiwNCj4gICAgICAiYm1jLWFkZHIiOiAzMiwNCj4gICAgICAicmVtb3RlLWFkZHIiOiA5Ng0KPiAg
ICB9DQo+ICAgICAgIHsNCj4gICAgICAidHlwZSI6ICJob3N0MSIsDQoNCkkgZG9uJ3QgdW5kZXJz
dGFuZCB3aHkgeW91IG5lZWQgdG8gaGF2ZSBhIG5ldyB0eXBlIGhlcmUuIEVhY2ggb2YgdGhlc2Ug
Y2hhbm5lbHMgYXJlIElQTUIgY2hhbm5lbHMgKGFjY29yZGluZyB0byB0aGUgSVBNSSBzcGVjaWZp
Y2F0aW9uKQ0KDQpZb3UgZG8gbmVlZCBzb21ld2hlcmUgdG8gbWFyayB0aGUgSUQgb2YgdGhlIGhv
c3QsIGJ1dCBJIGZlZWwgdGhhdCB3b3VsZCBiZSBiZXR0ZXIgc3VpdGVkIGFzIGEgbmV3IGVudHJ5
DQogICAgICAgImhvc3QiOiAxLA0KW1ZlbHVdIEFncmVlZCwgd2Ugd2lsbCB1c2UgYSBuZXcgZW50
cnkgYXMgc3VnZ2VzdGVkLiBVcGRhdGVkIHRoZSBkZXNpZ24gZG9jdW1lbnQuDQoNCj4gICAgICAi
c2xhdmUtcGF0aCI6ICIvZGV2L2lwbWItMyIsDQo+ICAgICAgImJtYy1hZGRyIjogMzIsDQo+ICAg
ICAgInJlbW90ZS1hZGRyIjogNjQNCj4gICAgfQ0KPiAgICAgICB7DQo+ICAgICAgInR5cGUiOiAi
aG9zdDIiLA0KPiAgICAgICJzbGF2ZS1wYXRoIjogIi9kZXYvaXBtYi00IiwNCj4gICAgICAiYm1j
LWFkZHIiOiAzMiwNCj4gICAgICAicmVtb3RlLWFkZHIiOiA2NA0KPiAgICB9DQo+ICAgICAgIHsN
Cj4gICAgICAidHlwZSI6ICJob3N0MyIsDQo+ICAgICAgInNsYXZlLXBhdGgiOiAiL2Rldi9pcG1i
LTQiLA0KPiAgICAgICJibWMtYWRkciI6IDMyLA0KPiAgICAgICJyZW1vdGUtYWRkciI6IDY0DQo+
ICAgIH0NCj4gIF0NCj59DQo+DQo+UmVhZGluZyB0aGUganNvbiBmaWxlIGlwbWJicmlkZ2VkIHRv
IHN1cHBvcnQgaG9zdCBjaGFubmVscyBvcHRpb25hbGx5Lg0KPg0KPjMuMS4yLiBDaGFuZ2UgMjog
U2VuZGluZyBIb3N0IGRldGFpbCBhcyBhZGRpb25hbCBwYXJhbWV0ZXINCj4tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPldoaWxlIHJv
dXRpbmcgdGhlIGlwbWIgcmVxdWVzdHMgY29taW5nIGZyb20gdGhlIGhvc3QgY2hhbm5lbCwgdGhl
IA0KPmlwbWJicmlkZ2VkIGFkZHMgdGhlIGlwbWIgYnVzIGRldGFpbHMgY29uZmlndXJlZCBpbiB0
aGUganNvbiBmaWxlIGtleSAidHlwZSIuDQo+SW4gdGhlIGFib3ZlIGV4YW1wbGUgdGhlIGlwbWIg
cmVxdWVzdCBjb21pbmcgZnJvbSAiL2Rldi9pcG1iLTQiIHRoZSANCj5pcG1iIHdpbGwgc2VuZCAi
aG9zdDIiIGFzIG9wdGlvbmFsIHBhcmFtZXRlciBpbiB0aGUgZC1idXMgaW50ZXJmYWNlIHRvIGlw
bWlkLg0KDQpCZXR0ZXIgd291bGQgYmUgYSBob3N0OjIgZW50cnkNCg0KPjMuMiBDaGFuZ2VzIGlu
IGlwbWlkOg0KPi0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPlJlY2VpdmUgdGhlIG9wdGlvbmFsIHBh
cmFtZXRlciBzZW50IGJ5IHRoZSBpcG1iYnJpZ2VkIGFzIGhvc3QgZGV0YWlscywgDQo+d2hpbGUg
cmVjZWl2aW5nIHRoZSBwYXJhbWV0ZXIgaW4gdGhlIGV4ZWN1dGlvbkVudHJ5IG1ldGhvZCBjYWxs
IHRoZSANCj5zYW1lIHdpbGwgYmUgcGFzc2VkIHRvIHRoZSBjb21tYW5kIGhhbmRsZXJzIGluIGJv
dGggY29tbW9uIGFuZCBvZW0gaGFuZGxlcnMuDQo+VGhlIGNvbW1hbmQgaGFuZGxlcnMgY2FuIG1h
a2UgdXNlIG9mIHRoZSBob3N0IGluZm9ybWF0aW9uIHRvIGZldGNoIGhvc3QgDQo+c3BlY2lmaWMg
ZGF0YS4NCg0KSSB3b3VsZCBzdWdnZXN0IHRoYXQgdGhpcyBpcyBhIG5ldyBpdGVtIGluIHRoZSBp
cG1pOjpDb250ZXh0IGNsYXNzLiBJdCBzaG91bGQgZGVmYXVsdCB0byAwIChmaXJzdCBob3N0KSwg
YW5kIGNhbiBiZSBzZXQgYnkgYnkgYSBicmlkZ2UgKGlwbWJicmlkZ2VkLCBrY3NicmlkZ2VkLCBl
dGMuKS4NCg0KW1ZlbHVdIE9LLiBXZSB3aWxsIHVzZSBpcG1pOjpDb250ZXh0IGNsYXNzLg0KDQo+
Rm9yIGV4YW1wbGUsIGhvc3QxIHNlbmQgYSByZXF1ZXN0IHRvIGdldCBib290IG9yZGVyIGZyb20g
Ym1jLCBibWMgDQo+bWFpbnRhaW5zIGRhdGEgc2VwYXJhdGVseSBmb3IgZWFjaCBob3N0LiBXaGVu
IHRoaXMgY29tbWFuZCBjb21lcyB0byANCj5pcG1pZCB0aGUgY29tbWFuZHMgaGFuZGxlciBnZXRz
IHRoZSBob3N0IGluIHdoaWNoIHRoZSBjb21tYW5kIHJlY2VpdmVkLiANCj5UaGUgaGFuZGxlciB3
aWxsIGZldGNoDQo+aG9zdDEgYm9vdCBvcmRlciBkZXRhaWxzIGFuZCByZXNwb25kIGZyb20gdGhl
IGNvbW1hbmQgaGFuZGxlci4gVGhpcyBpcyANCj5hcHBsaWNhYmxlIGZvciBib3RoIGNvbW1vbiBh
bmQgb2VtIGhhbmRsZXJzLg0KDQpJdCB3b3VsZCBiZSB1cCB0byB0aGUgaGFuZGxlciB0byBiZWhh
dmUgY29ycmVjdGx5IGJ5IGNoZWNraW5nIHRoZSBpcG1pOjpDb250ZXh0Lg0KW1ZlbHVdIE9LLg0K
LS1WZXJub24NCg==
