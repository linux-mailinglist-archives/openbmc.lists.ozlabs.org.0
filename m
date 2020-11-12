Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 400042B0039
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 08:14:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWtBX2sSQzDqxZ
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 18:14:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.128.139; helo=kor01-ps2-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=a/Ei/bbW; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=a/Ei/bbW; 
 dkim-atps=neutral
Received: from KOR01-PS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1280139.outbound.protection.outlook.com [40.107.128.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWt9S4SzxzDqxV
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2020 18:13:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lPUnW0z/8H5N0c7+wYXYvnL06iB06LbuGPP49Giv0I=;
 b=a/Ei/bbWxbsRyAhUkUkOaPn3q0fwM+YGGzuJ+wNL3djNQNxPKNbbadkUlXK0QYY3BylkTyvE59dOFq91WScfuE3+zQ57BSbYr5pRHJ8ToGgpTgEz5ypIIWUseE0Lb/wokGOEdXz4Vdu/iJUuapw+zEjsDYV9s6c3+uD1ocNe2FQ=
Received: from SL2P216CA0055.KORP216.PROD.OUTLOOK.COM (2603:1096:100:19::17)
 by PS2PR04MB3624.apcprd04.prod.outlook.com (2603:1096:300:63::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.23; Thu, 12 Nov
 2020 07:12:53 +0000
Received: from PU1APC01FT027.eop-APC01.prod.protection.outlook.com
 (2603:1096:100:19:cafe::3b) by SL2P216CA0055.outlook.office365.com
 (2603:1096:100:19::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Thu, 12 Nov 2020 07:12:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.52)
 smtp.mailfrom=hcl.com; google.com; dkim=pass (signature was verified)
 header.d=HCL.COM;google.com; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.52 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.52; helo=APC01-PU1-obe.outbound.protection.outlook.com;
Received: from APC01-PU1-obe.outbound.protection.outlook.com (192.8.245.52) by
 PU1APC01FT027.mail.protection.outlook.com (10.152.252.232) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Thu, 12 Nov 2020 07:12:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aW1pJ4yKBoJCyynfXqERm/s/HkJaJX3oEbrJ+17ptri8g6hRFXrKWqM5VA4kw6G+a73Gls7FTyqYJo/PjOmbLOsIt0foTK9ehrtg9YzQyKcF1NIgvaQi2qxBbTKQG7Y81vRWtP4ILW1wGQPL67bo1S/zy0ACTWQMApzE/TKIfZ40v/9MYUrWZqVqgXi2e0fhQ1vHFRCtkX39dlkBHaq9+skedvSmTIYRYGOE23HCN3qqBExvrf7KCQGIxREN63rZx/NMDuZLYpruxvUImMEaYCzkkJdObd8MEImwvoDemnQUFILOvq8l2nMU46tsFTnCPEOL6LKeJI+gpEDfBEd+3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lPUnW0z/8H5N0c7+wYXYvnL06iB06LbuGPP49Giv0I=;
 b=SGPI1cuoGpAMJNoB7XABCfuIm8+oXYzs67DHXpQowSBaiaJVoSOQtFSX/UQof8Mfrq9QzLaYWhZ6Q31NaXrZ8f4qZxdpdOz5MpMym+t4lRfkoqHQ29z5PUr/fn6JFZ2uE/7FIn3tyM/Rb53IgkXuCTEMVvO06pMboVFtbYKheIzDs1UVBIkXfrpUiuubQB/CSTufEsNDeAmpY+3MG2vyiAfI85PEINvRBDorKsnVHgiLzZ0GH5obQYWiS4fanuYOqMO+NkkcF43UuCxeBWXmWFJCkgzmUIWoYkAwWMJgFqfyiEvlmgqJPeaPWfWjSx6qQ1cQ4ZfD0tm9ftFbjKPGmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lPUnW0z/8H5N0c7+wYXYvnL06iB06LbuGPP49Giv0I=;
 b=a/Ei/bbWxbsRyAhUkUkOaPn3q0fwM+YGGzuJ+wNL3djNQNxPKNbbadkUlXK0QYY3BylkTyvE59dOFq91WScfuE3+zQ57BSbYr5pRHJ8ToGgpTgEz5ypIIWUseE0Lb/wokGOEdXz4Vdu/iJUuapw+zEjsDYV9s6c3+uD1ocNe2FQ=
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com (2603:1096:203:5d::15)
 by HK0PR04MB3283.apcprd04.prod.outlook.com (2603:1096:203:8f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.23; Thu, 12 Nov
 2020 07:12:42 +0000
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::e52f:5fdf:e09d:fa29]) by HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::e52f:5fdf:e09d:fa29%6]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 07:12:42 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: Patrick Venture <venture@google.com>
Subject: RE: Queries in phosphor-pid-control(swampd)
Thread-Topic: Queries in phosphor-pid-control(swampd)
Thread-Index: Adazbf3YeT9VL1BqQCaDxpW9/aG0cAEzfKSAACFFaVA=
Date: Thu, 12 Nov 2020 07:12:41 +0000
Message-ID: <HK0PR04MB2964074DFE5F4C481767E5A2FDE70@HK0PR04MB2964.apcprd04.prod.outlook.com>
References: <HK0PR04MB29646B09A78169E38B903C6CFDEE0@HK0PR04MB2964.apcprd04.prod.outlook.com>
 <CAO=notzLDPRuwh-hmUgOq_v3mg6sq8Pcip-+0pu99hOQpbFtbA@mail.gmail.com>
In-Reply-To: <CAO=notzLDPRuwh-hmUgOq_v3mg6sq8Pcip-+0pu99hOQpbFtbA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-hclclassification: HCL_Cla5s_1nt3rnal
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiNTc5ZGVkNzItNmU3MC00YzNhLTkxMjYtM2RkYmRhMzZhZjhjIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzXzFudDNybmFsIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE4LjQuMTg0My4xMjMiLCJUcnVzdGVkTGFiZWxIYXNoIjoibmpjU3BNckFZU1h3WkF5dmpqNnNtejdiYzFrOWpNdFdjWFhlK25oS3RyZFpTSHl2U1VSNWNwa2p4VjR3UEJJayJ9
Authentication-Results-Original: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [157.49.215.154]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: fa6020a1-721a-455d-e958-08d886da5f27
x-ms-traffictypediagnostic: HK0PR04MB3283:|PS2PR04MB3624:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <PS2PR04MB362467D3E59930DE6230D365FDE70@PS2PR04MB3624.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: NBgo3tCL0LTOYkoUPSk8MzVWX3bv6zqCtcQpUHC5FOs0uLmNk+qgaXczZmnghVi+ATWv9PgjV+tmc2H7HyaHzbfyxHX1Frq13wahNOnD+kGay9VTPoqlMcNe+A6hDpZyZl04YfR5a7yfURPN0O0EXdQSoZTYlY/ZPJgQ3yrCJAj4crOhdzn9yUpzRxwkz9pCWpzETw9L95N2N2fSuYxhCh0eLQH9DBiCU3EnCxPrvrIrLWW26jPtnjTJKNouJsmJJiprZc3g32Lj0G8kDGhpJFja97g7RvE/wqKRidMr6dMKcmE3DzV/4NAM2OvYifejCtpCvbIq6qHqLQDlTkYBdw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HK0PR04MB2964.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(366004)(55016002)(66446008)(52536014)(86362001)(7696005)(71200400001)(76116006)(316002)(6506007)(66476007)(53546011)(66556008)(83380400001)(64756008)(66946007)(9686003)(478600001)(8676002)(2906002)(5660300002)(33656002)(54906003)(8936002)(4326008)(6916009)(26005)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: fE4XCkjxDFoi8COWMbPuDbqg5IJ32hBwYOzsI+bV2o66YMkcQkPFytPZTIQUt5jNOWwYvsUNUdCs4/Q55Yoc37Qt6Xb9fFlHVHcPtjqwhXcy5odjAFn/gYH5oQiWXiCBJfnkzBdMLHhQp5ft7x8f/CVy7oLX8uF4oW3X2Dl32AGnLd7cWgw80+1bzzujMx1IwyZRc4lmGrM48KNT7f2i2lC8IiZykMbGXNwg7ztbDt3ZUKyCY0M78AooA06nvyG7TSFNClBJAbHoXz66VByDP77d6bheheJ0sFljU9p38xsvz9kLSvpD3wpw0Tdbt+HwXNIj71z1jCnBVL8XOhu1zf1pRtd+vCwMRrLP8z6ayEJYbfpCu8mGfuIt78umJWY0p/5d60cU0DK8NqHGCW4tmDv8xq0eIqYq4elhazohsqpDyn6mQrTVHS6aKYkwTs6Zn9qC1PfqEQdNmlMiux31D60Xs17T4erUsamUt3/69vIUMmUPu9+FCZx7DXAK4+rZfY0kRU/jOIzPZdUsViWSd1UKWlxJJVelNUB0vcKzZvPBbfR6H2fQce5cd6gl0RaafjhmQF6cUmG6QBcLF8VBdn0FG/BBL7sTYRP+OZyYoj540s/leUGyAguJBoGDp5tduhxiAbIr3ouGNX6xoPk3Pg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB3283
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT027.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: bab3057a-78dc-4900-6dc7-08d886da589f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pzu8nvGO5vZr7U1+1i02g10oB830+xTK9da/WZJgjdEnM7DVz2sQxYuRJFCBOmdub4dUOPb0rIloXoi/gJ5PXjhFm9KolQpp5BCdqTnFJx6Abnc+M1yxqzc/a8JNhCgeQ31/nGXwNNLEzrBcKgOrBar2evwJ2SWfZ+sqPIBGrcy0+qZ933lKdj2B+2aeL1AnjA4IUfjTf8h0f0llOeRcMvSuVY1HIukwz2Y0L5ASGaaiSE708mNABegSJkljpRrWtumN9jtViDofdVgBJlMl9gVbcXF/Sh7SPdnzgm4/2rh4DRs8ATFmTARP8PCzqk+c5V5AZQiJD/23D+oYtZEp3WzhilHzXXBt7jt9ErKhtHn9I6qd4juYQZI/+GR7vHWCbo27eQqjBmXHfjBDXj/TNw==
X-Forefront-Antispam-Report: CIP:192.8.245.52; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-PU1-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(46966005)(47076004)(70586007)(83380400001)(70206006)(7696005)(82740400003)(36906005)(6506007)(316002)(55016002)(4326008)(2906002)(33656002)(82310400003)(53546011)(478600001)(9686003)(336012)(356005)(8676002)(6916009)(8936002)(54906003)(52536014)(5660300002)(186003)(26005)(86362001)(81166007);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 07:12:52.1373 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6020a1-721a-455d-e958-08d886da5f27
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.52];
 Helo=[APC01-PU1-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT027.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR04MB3624
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
 Patrick Williams <patrickw3@fb.com>, Josh Lehan <krellan@google.com>,
 "Velumani T-ERS, HCLTech" <velumanit@hcl.com>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Q2xhc3NpZmljYXRpb246IEludGVybmFsDQoNCkhpIFBhdHJpY2ssDQoNCiAgICAgICAgICBUaGFu
a3MgZm9yIHlvdXIgcmVzcG9uc2UuICANCg0KICAgICAgICAgIE91ciByZXF1aXJlbWVudCBpcyB3
aGVuIGFsbCBmYW4gZmFpbHMgaW4gdGhlIHN5c3RlbSwgdGhlIHNsb3RzIHNob3VsZCBiZSAxMiBW
IFBvd2VyIG9mZi4gIEkgd2lsbCBzZW5kIHRoZSBzZXBhcmF0ZSBtYWlsIGZvciB0aGlzIGluIGRl
dGFpbC4NCg0KVGhhbmtzLA0KS3VtYXIuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpG
cm9tOiBQYXRyaWNrIFZlbnR1cmUgPHZlbnR1cmVAZ29vZ2xlLmNvbT4gDQpTZW50OiBXZWRuZXNk
YXksIE5vdmVtYmVyIDExLCAyMDIwIDg6MzQgUE0NClRvOiBLdW1hciBUaGFuZ2F2ZWwgPHRoYW5n
YXZlbC5rQGhjbC5jb20+DQpDYzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBKb3NoIExlaGFu
IDxrcmVsbGFuQGdvb2dsZS5jb20+OyBWZWx1bWFuaSBULUVSUyxIQ0xUZWNoIDx2ZWx1bWFuaXRA
aGNsLmNvbT47IFZpamF5IEtoZW1rYSA8dmlqYXlraGVta2FAZmIuY29tPjsgUGF0cmljayBXaWxs
aWFtcyA8cGF0cmlja3czQGZiLmNvbT47IHNkYXNhcmlAZmIuY29tDQpTdWJqZWN0OiBSZTogUXVl
cmllcyBpbiBwaG9zcGhvci1waWQtY29udHJvbChzd2FtcGQpDQoNCltDQVVUSU9OOiBUaGlzIEVt
YWlsIGlzIGZyb20gb3V0c2lkZSB0aGUgT3JnYW5pemF0aW9uLiBVbmxlc3MgeW91IHRydXN0IHRo
ZSBzZW5kZXIsIERvbuKAmXQgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyBhcyBpdCBt
YXkgYmUgYSBQaGlzaGluZyBlbWFpbCwgd2hpY2ggY2FuIHN0ZWFsIHlvdXIgSW5mb3JtYXRpb24g
YW5kIGNvbXByb21pc2UgeW91ciBDb21wdXRlci5dDQoNCk9uIFRodSwgTm92IDUsIDIwMjAgYXQg
NDoyMiBBTSBLdW1hciBUaGFuZ2F2ZWwgPHRoYW5nYXZlbC5rQGhjbC5jb20+IHdyb3RlOg0KPg0K
PiBDbGFzc2lmaWNhdGlvbjogSW50ZXJuYWwNCj4NCj4gSGkgQWxsLA0KPg0KPg0KPg0KPiAgICAg
ICBEb2VzIHRoZSBjdXJyZW50IHBob3NwaG9yLXBpZC1jb250cm9sIGhhbmRsZWQgdGhlIGZhbiBm
YWlsdXJlcyBvciBpZiBmYW4gdmFsdWVzIGlzIDAgPyAgTG9va3MgbGlrZSwgaXQgaWdub3JlcyB0
aGUgZmFuIHZhbHVlcyBpcyAwIGNhc2UuDQo+DQo+ICAgICAgIENvdWxkIHlvdSBwbGVhc2UgY2xh
cmlmeSBtZSwgaG93IHRoZSBmYW4oc2luZ2xlL2JvdGgpIGZhaWx1cmVzIGhhbmRsZWQuIGlmIGJv
dGggZmFuIGZhaWx1cmVzLCBEbyB3ZSBuZWVkIHRvIHBvd2VyIG9mZiB0aGUgY2hhc3NpcyBvciBu
ZWVkIHRvIGRvIHBvd2VyIHNsZWQgY3ljbGUgPw0KDQpUaGUgYW5zd2VycyB0byB0aGUgZmFpbHVy
ZSBiZWhhdmlvcnMgeW91IHdpc2ggYXJlIG91dHNpZGUgdGhlIHNjb3BlIG9mIGNvbnRyb2xsaW5n
IHRoZSBmYW5zIHRoZW1zZWx2ZXMuICBBcyBJIHVuZGVyc3RhbmQgaXQsIGl0J3MgdXAgdG8geW91
IG9yIHlvdXIgdXNlIGNhc2Ugd2hhdCBoYXBwZW5zIHdoZW4gZmFpbHMgc3RhcnQgZmFpbGluZy4g
VGhlIHBpZCBjb250cm9sIGRhZW1vbiBoYXMgZGVmYXVsdCBmYWlsLXNhZmUgdmFsdWVzIHlvdSBj
YW4gc2V0LCBhcyB3ZWxsIGFzIG1pbmltdW0gUlBNIHNldC1wb2ludHMsIHNvIHRoYXQgaWYgc29t
ZSB0aGluZ3MgZmFpbCwgaXQnbGwgc3RpbGwgbW92ZSBmb3J3YXJkIG9wZXJhdGluZyBpbiBhIGJl
c3QgZWZmb3J0IHRvIGNvb2wgdGhlIHN5c3RlbS4gIEJ1dCB3aXRoIGZhbnMgZmFpbGluZywgaWYg
dGhlcmUncyBzb21ldGhpbmcgbW9yZSBvbmUgd2lzaGVzIHRvIGRvIHdpdGggaXQsIG15IHJlY29t
bWVuZGF0aW9uIHdvdWxkIGJlIHRvIHJlYWNoIG91dCB3aXRoIGEgYnJvYWRlciBlbWFpbCBzdWJq
ZWN0IGxpbmUNCi0tIHRoZXJlIG1heSBiZSBzb21ldGhpbmcgYWxyZWFkeSBpbiBvcGVuYm1jIChw
cm9iYWJseSBpcykgdGhhdCdsbCB0cmFjayBmYWlsdXJlcyBhbmQgdHJpZ2dlciBiZWhhdmlvcnMu
DQoNCkhvd2V2ZXIsIGN1cnJlbnRseSBwaWQgY29udHJvbCBkb2Vzbid0ICJtYW5hZ2UgdGhlIHN5
c3RlbS4iICBXaGljaCBpdCBzb3VuZHMgbGlrZSB5b3Ugd2FudC4gIE9yIG5vdD8gIFlvdXIgcXVl
c3Rpb24gc291bmRzIGxpa2UgeW91J3JlIG5vdCBzdXJlIHdoYXQgdGhlIHN5c3RlbSBfc2hvdWxk
XyBkbyBpbiBhIGZhbiBmYWlsdXJlIGNhc2UsIHRvIHdoaWNoIEkgY2Fubm90IHJlcGx5Lg0KDQpU
aGFua3MhDQoNCj4NCj4NCj4NCj4gVGhhbmtzLA0KPg0KPiBLdW1hci4NCj4NCj4gOjpESVNDTEFJ
TUVSOjoNCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gVGhlIGNvbnRlbnRz
IG9mIHRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudChzKSBhcmUgY29uZmlkZW50aWFsIGFu
ZCBpbnRlbmRlZCBmb3IgdGhlIG5hbWVkIHJlY2lwaWVudChzKSBvbmx5LiBFLW1haWwgdHJhbnNt
aXNzaW9uIGlzIG5vdCBndWFyYW50ZWVkIHRvIGJlIHNlY3VyZSBvciBlcnJvci1mcmVlIGFzIGlu
Zm9ybWF0aW9uIGNvdWxkIGJlIGludGVyY2VwdGVkLCBjb3JydXB0ZWQsIGxvc3QsIGRlc3Ryb3ll
ZCwgYXJyaXZlIGxhdGUgb3IgaW5jb21wbGV0ZSwgb3IgbWF5IGNvbnRhaW4gdmlydXNlcyBpbiB0
cmFuc21pc3Npb24uIFRoZSBlIG1haWwgYW5kIGl0cyBjb250ZW50cyAod2l0aCBvciB3aXRob3V0
IHJlZmVycmVkIGVycm9ycykgc2hhbGwgdGhlcmVmb3JlIG5vdCBhdHRhY2ggYW55IGxpYWJpbGl0
eSBvbiB0aGUgb3JpZ2luYXRvciBvciBIQ0wgb3IgaXRzIGFmZmlsaWF0ZXMuIFZpZXdzIG9yIG9w
aW5pb25zLCBpZiBhbnksIHByZXNlbnRlZCBpbiB0aGlzIGVtYWlsIGFyZSBzb2xlbHkgdGhvc2Ug
b2YgdGhlIGF1dGhvciBhbmQgbWF5IG5vdCBuZWNlc3NhcmlseSByZWZsZWN0IHRoZSB2aWV3cyBv
ciBvcGluaW9ucyBvZiBIQ0wgb3IgaXRzIGFmZmlsaWF0ZXMuIEFueSBmb3JtIG9mIHJlcHJvZHVj
dGlvbiwgZGlzc2VtaW5hdGlvbiwgY29weWluZywgZGlzY2xvc3VyZSwgbW9kaWZpY2F0aW9uLCBk
aXN0cmlidXRpb24gYW5kIC8gb3IgcHVibGljYXRpb24gb2YgdGhpcyBtZXNzYWdlIHdpdGhvdXQg
dGhlIHByaW9yIHdyaXR0ZW4gY29uc2VudCBvZiBhdXRob3JpemVkIHJlcHJlc2VudGF0aXZlIG9m
IEhDTCBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGVt
YWlsIGluIGVycm9yIHBsZWFzZSBkZWxldGUgaXQgYW5kIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVk
aWF0ZWx5LiBCZWZvcmUgb3BlbmluZyBhbnkgZW1haWwgYW5kL29yIGF0dGFjaG1lbnRzLCBwbGVh
c2UgY2hlY2sgdGhlbSBmb3IgdmlydXNlcyBhbmQgb3RoZXIgZGVmZWN0cy4NCj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18NCg==
