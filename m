Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 111942B5ECA
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 13:02:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cb4Lx111HzDqQn
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 23:02:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.131.90; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org;
 dkim=temperror header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=EO/mMJxp; 
 dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=EO/mMJxp; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310090.outbound.protection.outlook.com [40.107.131.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cb4HJ57pnzDqPN
 for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2020 22:59:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IA7uIi0ZwXrvQiFtStIbz1SotSgL2nm23glGymZYS3Q=;
 b=EO/mMJxpYQYQuSgMgnqvfFNHBSuoBzUw8J+3cXL8rboo4757cnVeUej8qOi2PKL46dwTeDGoSgqRfISh9U5JCS9TX+Xd+OQgT1mGwW+CwjvQC+wbeJtsRr4U30tKSDeTRU6VQE+QtK6pljbSm2kH9wl5iRNfLcqgG948tsgNy+s=
Received: from SG2PR03CA0147.apcprd03.prod.outlook.com (2603:1096:4:c8::20) by
 HKAPR04MB4036.apcprd04.prod.outlook.com (2603:1096:203:c4::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.25; Tue, 17 Nov 2020 11:59:11 +0000
Received: from HK2APC01FT045.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:c8:cafe::ce) by SG2PR03CA0147.outlook.office365.com
 (2603:1096:4:c8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.15 via Frontend
 Transport; Tue, 17 Nov 2020 11:59:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.56)
 smtp.mailfrom=hcl.com; tanous.net; dkim=pass (signature was verified)
 header.d=HCL.COM;tanous.net; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.56 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.56; helo=APC01-PU1-obe.outbound.protection.outlook.com;
Received: from APC01-PU1-obe.outbound.protection.outlook.com (192.8.195.56) by
 HK2APC01FT045.mail.protection.outlook.com (10.152.249.139) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Tue, 17 Nov 2020 11:59:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mtE99zjMcIdU4YSLi0991EnAtW2D1lQFXEd8jUzWQoym0lzlobz6+z/eBvqKRmhpLFwIHERtJax17uUvfnTjn80hdiKI9JOPl6pNdJnyeDtYvEnFnxmV3MIhQuO381QyFjQkqKoHdzE0NSXz99U11GXAAGzh2zcQ/UdHjxq5Hxwv0TwIl9P/9bLqL/Osiiun2KvzuQt3NRX9eSijIHf64QtmlG060xtDibBrGg8DF9Q7pVGfA0RuprNzDuD9bKEOlLvtWEWrOSWBLzvY7llAtb+pmeCXjBIaQZ6mRzn2AC52uwABMKnT1BeW0VSQQfF+tlF4gn4sCPif8Ye8hH0AoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IA7uIi0ZwXrvQiFtStIbz1SotSgL2nm23glGymZYS3Q=;
 b=ZOYxvox1SNoRaaZqEORuTy7sDp73ZTegSawFybKcMd/TmyxI32inWumC5iXEZiyoJigAwoWxmeexOSPlrdL4txFVitC1Q/UWNM22VZHK9MCEaS5hF7G42LqDqKOGiMep6holyDq0aKZOmAuTITrPH5E55QdhOLj6Y43gh4/fj8BYA0tvgPuat88vvg3heKsUcxeqmbvAHfTh77ELd6cCFkVCQ06RyLaqn4GJYiX5ekD4xvRQCd8uqlRQfxYj/HG94tN4MTy6AM8MowqU87h5DBR1MXZ2RQv+MRfJTQxIQO5IQsRtVdReAkqIo8Gng51W54l33GJpuTaSm/TVhDbSrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IA7uIi0ZwXrvQiFtStIbz1SotSgL2nm23glGymZYS3Q=;
 b=EO/mMJxpYQYQuSgMgnqvfFNHBSuoBzUw8J+3cXL8rboo4757cnVeUej8qOi2PKL46dwTeDGoSgqRfISh9U5JCS9TX+Xd+OQgT1mGwW+CwjvQC+wbeJtsRr4U30tKSDeTRU6VQE+QtK6pljbSm2kH9wl5iRNfLcqgG948tsgNy+s=
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com (2603:1096:203:5d::15)
 by HK0PR04MB2692.apcprd04.prod.outlook.com (2603:1096:203:62::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 17 Nov
 2020 11:59:03 +0000
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::e52f:5fdf:e09d:fa29]) by HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::e52f:5fdf:e09d:fa29%7]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 11:59:02 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: Ed Tanous <ed@tanous.net>
Subject: RE: Fault handling(Threshold exceeds/low) in Fan and NIC sensors
Thread-Topic: Fault handling(Threshold exceeds/low) in Fan and NIC sensors
Thread-Index: Ada5zVYwkmx4kfozTTWK3HwWcCL1fAAMGkIAAIEd6OAAC8wEAAAo4qYA
Date: Tue, 17 Nov 2020 11:59:02 +0000
Message-ID: <HK0PR04MB2964D64D0DB9F45F5757DF49FDE20@HK0PR04MB2964.apcprd04.prod.outlook.com>
References: <HK0PR04MB2964AA77874471609F0B25BEFDE60@HK0PR04MB2964.apcprd04.prod.outlook.com>
 <CACWQX81k6M6acw0VL3aYA_uqpNsEUjZ3DhiAQp_mXLbGJU87=g@mail.gmail.com>
 <HK0PR04MB2964EA39F0F9AD7ED1A03535FDE30@HK0PR04MB2964.apcprd04.prod.outlook.com>
 <CACWQX82oZiC0e6DJd=M10COJOqORy-ZJyB5biXyecFw26zpaLg@mail.gmail.com>
In-Reply-To: <CACWQX82oZiC0e6DJd=M10COJOqORy-ZJyB5biXyecFw26zpaLg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-hclclassification: HCL_Cla5s_1nt3rnal
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiNmJlZTFlMTMtOTA4Ny00MTViLWI3ZjgtOTRjODBlOGI1NzFkIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzXzFudDNybmFsIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE4LjQuMTg0My4xMjMiLCJUcnVzdGVkTGFiZWxIYXNoIjoiZk1HWVdZalJWZm5nVXN3a3pwZlFPMTR5OEM4aVpzTnlnREE1aFc1akVXWVhQelBKXC9iTldPSWh4YWt2d0tlcWsifQ==
Authentication-Results-Original: tanous.net; dkim=none (message not signed)
 header.d=none;tanous.net; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [157.51.60.55]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 50894d32-10d3-4ea3-7135-08d88af0320d
x-ms-traffictypediagnostic: HK0PR04MB2692:|HKAPR04MB4036:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HKAPR04MB40361AFF3C3BE39E152D6025FDE20@HKAPR04MB4036.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: W2ogYMf1nnBeK/YuAkejwLH4RFRq5Egged1SZ52/Qu4sarsPmmn8C5wb4ipD8BXGP2bOO4wgv+sALiZUkbSRCJJX9jvzA8HUSNB4dXZu+APFn30oKSwJygRKWmCVFIvOHG+URCEcVZqhY3X/81Z6H8iVi4zhMiT6P6TV5xE5Q5r/Lck9IxXaWMQ/ecuZ4tbjbx8xPW8et+sl1ZqCFcLHBDOzxLtMTpFRFX+dWlHWbVXf2aoRooPGt5IvITbLM04i0rKyGI2ErmHY96PWq2u8W+2cp8LRmXl+LXKRVZSJu3N7jg4+nmbUxIFk2wgMLgqoa4brm/n4vShC9SpP1WgRsw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HK0PR04MB2964.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(376002)(39860400002)(346002)(52536014)(26005)(66446008)(33656002)(5660300002)(55016002)(66556008)(86362001)(66946007)(64756008)(76116006)(66476007)(71200400001)(83380400001)(6916009)(8676002)(186003)(316002)(2906002)(4326008)(478600001)(54906003)(9686003)(53546011)(7696005)(6506007)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 4zD3C4U/uPCVV+Ij0+cWrqJfrZbJ6KsD+aOnQJwfFikjQGh8pF3eODB5qm0KPnukl1rd9ZdMppq7f9xoIYgrlAc28wdyLXpGViDm/I12n4ourA15ipjAHvdtF4sawX4xLP9ns7XEUaTzUO3GVyTF42xchOS8B04BAzcpEWueAiYs7faeYGpcKCO4BMSaCy8K1H4VmQJeF6fGxqimgu6BwroNI1ir4IoX1LnaHsBl5sygMCTL3Ztvpuhq6VqOc2V9Nqzgq+4YBx+va1ugStNMszhH7WVeOAlTmtwzXVdJq5hYdtzzVKlzveDyg+fWbrI+12VI+916DAbP5uqpxcuBmqck7KlCfHEIGNpOeJgFyieyXS1WQNG0enO6zxgPsATsuz4Hf85i75LDeBhX1/oKkFmpUmJtcSlH9ZyZr8TsTKjNfFRHqxzTIy3zTzrr5mC0LLEZVnIzm3fsyCMS6ov0NNslp+UM5DuRFKfMIczQud56dzhwhsJLzZy/xd72/aQ+taWYTuy1YGf3HbtL/luNz9QwKZeqfI8crKY8WMDtvEP/CdT8axfPgScKAaVeKd9/KJoW4sgs2BKujqomvad3IyAoHZ2Z6/jEAK/5EMFjb12JztSFynsEWGjgR9FTU8FNmMrrJhdJJ4naNmoT3DMlgQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2692
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT045.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5ab00193-2f88-4fb7-9a97-08d88af02d35
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S+0/OgKc84wqHPCzUEy8LRrFAw2RX3BlZCjGUaZj9rdyieHZ9qVP3zSdtWqv+ZQyiSMWzx2EIcBLKkohQrL85i6TZ9snqizKA50d19PC9HT4kNCx6WtH9CTSRfhJ8RIzhZux+MsnvjJ4ttYJPGX/FIb+gCKiO9vXFDFIox+M7IUV4qXs8qAQ+H5kBL/VdKU8vEue62zS8qQlDHi5/5sS6hy6vw/1ewg0WAreActFVwCpUwjUTRF8Qwr7UDxym8ncMNAeWbi74S4TZaYiMeiDywM0zrASs6HC0ryiFUK2shhVu8tVrtVr9QYWzj85VbH94xcluwZZYtE2fgbTaQFBTD0CF3yIl5x4Moxhd70eszmfZVt3nlpzK/vhE99wEP2AZqcIhq/83mleQe7I+K0daA==
X-Forefront-Antispam-Report: CIP:192.8.195.56; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-PU1-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(396003)(136003)(46966005)(54906003)(81166007)(9686003)(356005)(5660300002)(478600001)(70206006)(83380400001)(8936002)(7696005)(8676002)(82740400003)(4326008)(36906005)(26005)(70586007)(186003)(53546011)(82310400003)(6916009)(6506007)(86362001)(2906002)(47076004)(55016002)(33656002)(52536014)(316002)(336012);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 11:59:09.9056 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50894d32-10d3-4ea3-7135-08d88af0320d
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.56];
 Helo=[APC01-PU1-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT045.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HKAPR04MB4036
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
Cc: Zhikui Ren <zhikui.ren@intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Patrick Venture <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, "Velumani
 T-ERS,HCLTech" <velumanit@hcl.com>, Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Q2xhc3NpZmljYXRpb246IEludGVybmFsDQoNCkhpIEVkLA0KDQogICAgICAgIFBsZWFzZSBmaW5k
IGJlbG93IG15IHJlc3BvbnNlIGlubGluZS4NCg0KVGhhbmtzLA0KS3VtYXIuDQoNCi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBFZCBUYW5vdXMgPGVkQHRhbm91cy5uZXQ+DQpTZW50
OiBNb25kYXksIE5vdmVtYmVyIDE2LCAyMDIwIDk6MjkgUE0NClRvOiBLdW1hciBUaGFuZ2F2ZWwg
PHRoYW5nYXZlbC5rQGhjbC5jb20+DQpDYzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBWZWx1
bWFuaSBULUVSUyxIQ0xUZWNoIDx2ZWx1bWFuaXRAaGNsLmNvbT47IHNkYXNhcmlAZmIuY29tOyBQ
YXRyaWNrIFdpbGxpYW1zIDxwYXRyaWNrdzNAZmIuY29tPjsgUGF0cmljayBWZW50dXJlIDx2ZW50
dXJlQGdvb2dsZS5jb20+OyBKYWUgSHl1biBZb28gPGphZS5oeXVuLnlvb0BsaW51eC5pbnRlbC5j
b20+OyBWZXJub24gTWF1ZXJ5IDx2ZXJub24ubWF1ZXJ5QGxpbnV4LmludGVsLmNvbT47IFpoaWt1
aSBSZW4gPHpoaWt1aS5yZW5AaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IEZhdWx0IGhhbmRsaW5n
KFRocmVzaG9sZCBleGNlZWRzL2xvdykgaW4gRmFuIGFuZCBOSUMgc2Vuc29ycw0KDQpbQ0FVVElP
TjogVGhpcyBFbWFpbCBpcyBmcm9tIG91dHNpZGUgdGhlIE9yZ2FuaXphdGlvbi4gVW5sZXNzIHlv
dSB0cnVzdCB0aGUgc2VuZGVyLCBEb27igJl0IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVu
dHMgYXMgaXQgbWF5IGJlIGEgUGhpc2hpbmcgZW1haWwsIHdoaWNoIGNhbiBzdGVhbCB5b3VyIElu
Zm9ybWF0aW9uIGFuZCBjb21wcm9taXNlIHlvdXIgQ29tcHV0ZXIuXQ0KDQpPbiBNb24sIE5vdiAx
NiwgMjAyMCBhdCA1OjA1IEFNIEt1bWFyIFRoYW5nYXZlbCA8dGhhbmdhdmVsLmtAaGNsLmNvbT4g
d3JvdGU6DQo+DQo+IENsYXNzaWZpY2F0aW9uOiBJbnRlcm5hbA0KPg0KPiBIaSBFZCwNCj4NCj4g
ICAgICAgICBJbiBzaG9ydCwgT3VyIHJlcXVpcmVtZW50IGlzIHRvIHRha2UgdGhlIGFjdGlvbnMg
d2hlbiB0aGUgZmFuIGZhaWxzLiBUaGF0IGFjdGlvbiBpcyBwbGF0Zm9ybSBzcGVjaWZpYy4NCj4N
Cj4gICAgICAgICBGYW4gZmFpbHVyZSA6ICBUaGlzIGlzIGJhc2VkIG9uIEZhbiBzZW5zb3JzLiBJ
ZiBmYW4gc2Vuc29yJ3MgdGFjaCB2YWx1ZXMgaXMgbGVzcyB0aGFuIDMzJSwgd2lsbCBjb25zaWRl
ciBhcyBhIGZhbiBmYWlsdXJlLiBTbyB3aWxsIHRha2UgdGhlIGFjdGlvbnMgdG8gcmVkdWNlIHRo
ZSBoZWF0IHByb2R1Y3Rpb24gaW4gdGhlIHN5c3RlbS4NCg0KZGJ1cy1zZW5zb3JzIGFuZCBwaG9z
cGhvci1waWQtY29udHJvbCBhbHJlYWR5IGhhdmUgbWVjaGFuaXNtcyBmb3IgaGFuZGxpbmcgZmFu
IGZhaWx1cmUgaW4gdGhlc2Ugd2F5cy4gIFRha2UgYSBsb29rIGF0IHRoZSBleGlzdGluZyBjb25m
aWcgZmlsZXMsIGFuZCB0aGV5J2xsIGd1aWRlIHlvdSBvbiB3aGF0IHlvdSBuZWVkIHRvIGRvIG5l
eHQuDQoNCiBLdW1hciA6ICBBcmUgeW91IHNheWluZyBhYm91dCBkYnVzLXNlbnNvcidzIGNoZWNr
VGhyZXNob2xkcyBmdW5jdGlvbiA/ICBJbiB0aGF0IGZ1bmN0aW9uLCBoaWdoL2xvdyB0aHJlc2hv
bGQgbGV2ZWxzIGFyZSBoYW5kbGVkLiAgUGxlYXNlIGNvbmZpcm0gb25jZS4NCiAgICAgICAgICAg
ICAgICAgSW4gdGhhdCBmdW5jdGlvbiwgIHBsYW5uaW5nIHRvIGFkZCB0aGUgc2VydmljZSB0byBo
YW5kbGUgdGhlIHBsYXRmb3JtIHNwZWNpZmljIGFjdGlvbnMuDQogICAgICAgICAgICAgICAgIEFs
c28sIHBsYW5uaW5nIHRvIGFkZCBhIG5ldyBmaWVsZCBpbiBlbnRpdHkgbWFuYWdlciB0byBpZGVu
dGlmeSB0aGUgcGFydGljdWxhciBzZW5zb3JzIHRvIGhhbmRsZSB0aGlzIGZhdWx0IGNvbmRpdGlv
bi4NCg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNvIHRoYXQsICBob3N0cywg
TklDIGFuZCBvdGhlciBwb3dlciBjb25zdW1pbmcgbW9kdWxlcy4NCj4NCj4gICAgICAgICBEYnVz
LXNlbnNvcidzIGFscmVhZHkgaGFuZGxlcyB0aGUgdGhyZXNob2xkIG1hc2tpbmcuIFdlIGp1c3Qg
dXNlIHRoYXQgdGhyZXNob2xkIG1hc2tpbmcgdG8gdGFrZSB0aGUgcGxhdGZvcm0gc3BlY2lmaWMg
YWN0aW9ucy4NCj4NCj4gICAgICAgICBQbGVhc2UgbGV0IHVzIGtub3cgaWYgYW55IGNsYXJpZmlj
YXRpb25zIG5lZWRlZC4NCj4NCj4gVGhhbmtzLA0KPiBLdW1hci4NCg0KUHMsIFBsZWFzZSBkb24n
dCB0b3Bwb3N0Lg0KOjpESVNDTEFJTUVSOjoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fDQpUaGUgY29udGVudHMgb2YgdGhpcyBlLW1haWwgYW5kIGFueSBhdHRhY2htZW50KHMpIGFy
ZSBjb25maWRlbnRpYWwgYW5kIGludGVuZGVkIGZvciB0aGUgbmFtZWQgcmVjaXBpZW50KHMpIG9u
bHkuIEUtbWFpbCB0cmFuc21pc3Npb24gaXMgbm90IGd1YXJhbnRlZWQgdG8gYmUgc2VjdXJlIG9y
IGVycm9yLWZyZWUgYXMgaW5mb3JtYXRpb24gY291bGQgYmUgaW50ZXJjZXB0ZWQsIGNvcnJ1cHRl
ZCwgbG9zdCwgZGVzdHJveWVkLCBhcnJpdmUgbGF0ZSBvciBpbmNvbXBsZXRlLCBvciBtYXkgY29u
dGFpbiB2aXJ1c2VzIGluIHRyYW5zbWlzc2lvbi4gVGhlIGUgbWFpbCBhbmQgaXRzIGNvbnRlbnRz
ICh3aXRoIG9yIHdpdGhvdXQgcmVmZXJyZWQgZXJyb3JzKSBzaGFsbCB0aGVyZWZvcmUgbm90IGF0
dGFjaCBhbnkgbGlhYmlsaXR5IG9uIHRoZSBvcmlnaW5hdG9yIG9yIEhDTCBvciBpdHMgYWZmaWxp
YXRlcy4gVmlld3Mgb3Igb3BpbmlvbnMsIGlmIGFueSwgcHJlc2VudGVkIGluIHRoaXMgZW1haWwg
YXJlIHNvbGVseSB0aG9zZSBvZiB0aGUgYXV0aG9yIGFuZCBtYXkgbm90IG5lY2Vzc2FyaWx5IHJl
ZmxlY3QgdGhlIHZpZXdzIG9yIG9waW5pb25zIG9mIEhDTCBvciBpdHMgYWZmaWxpYXRlcy4gQW55
IGZvcm0gb2YgcmVwcm9kdWN0aW9uLCBkaXNzZW1pbmF0aW9uLCBjb3B5aW5nLCBkaXNjbG9zdXJl
LCBtb2RpZmljYXRpb24sIGRpc3RyaWJ1dGlvbiBhbmQgLyBvciBwdWJsaWNhdGlvbiBvZiB0aGlz
IG1lc3NhZ2Ugd2l0aG91dCB0aGUgcHJpb3Igd3JpdHRlbiBjb25zZW50IG9mIGF1dGhvcml6ZWQg
cmVwcmVzZW50YXRpdmUgb2YgSENMIGlzIHN0cmljdGx5IHByb2hpYml0ZWQuIElmIHlvdSBoYXZl
IHJlY2VpdmVkIHRoaXMgZW1haWwgaW4gZXJyb3IgcGxlYXNlIGRlbGV0ZSBpdCBhbmQgbm90aWZ5
IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkuIEJlZm9yZSBvcGVuaW5nIGFueSBlbWFpbCBhbmQvb3Ig
YXR0YWNobWVudHMsIHBsZWFzZSBjaGVjayB0aGVtIGZvciB2aXJ1c2VzIGFuZCBvdGhlciBkZWZl
Y3RzLg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCg==
