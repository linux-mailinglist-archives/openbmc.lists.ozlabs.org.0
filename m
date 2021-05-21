Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD92E38BF1F
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 08:11:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmbpR5HPXz3c8y
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 16:11:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=EpbT8vkf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.127;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320127.outbound.protection.outlook.com [40.107.132.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmbnS2lrRz309K
 for <openbmc@lists.ozlabs.org>; Fri, 21 May 2021 16:10:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSzLZQMkMyxjVDCITbpTGOsTY9FtmZGD4HxniSr9CxgtDCfbw3Gdn69cfkWBn4AwOySvuOoFfgEBACvGScZqwd3gT0KKFF9DmCRbhyANCVn9jx2lKMXMwaP8pjjQ2PYQfATe65ELu2sa3eGk3Z2ZSw3JuW2Ye7AQvUvzwW6sd/E4ozai3XhfQD8AN4Z9vLdKC0WL8NGKhYsk5DRtLEhY2b0zX3kkB+CSSHr3D9G9Q7B78L99iC0+BzyBGOZCABsOEsXZgguh4oiX1YllmuLLhfR7kk0YZgDQR2EsKmra7DC5goTZjhv6VxRVsrcqTASL6SCcDsUXfXPWSPsLEv6+4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRuujb/Kcaw3U4s+RdPsJ2BRaTZ1ywwEWLskCPsRxeo=;
 b=nWU1cogWm9pYvxgV0XPR64cfAOfbEYgtX85N+oVwLTpL7AXoAtDZ7mu10fZYfyYpjd3FNu0bwvh8NygFsUyCQgjGO61DcbTpzV38AXO2dRDntXbFdvr561TIGCevRc0pTplY3AmjgVaSSGM/hcU7wnH2S3yYt8FZbTV7rrKIRl0tI+b/x/NBH/fTuHQdQUAX91GSadgrnnXRZpveh7qsCCBEk80yaZm+wAiq/R+W9EScH3lzWk5DH5XjaRpDxmw5za0N/rjkfIv8UuoNmE9VLEuRVlLZ4I9/i5NR4R2WyYRT0a8RHJ97XWkKyPiVECDhTVfihb9Ie78CfFtVM2+QmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRuujb/Kcaw3U4s+RdPsJ2BRaTZ1ywwEWLskCPsRxeo=;
 b=EpbT8vkf/XEugK+sE+DIABwM3mR8gAhM4ez92WZ/O0WlGNzxKymkdfbAnRZcj/dfIDgsiq3KkX82GOrAICn46CFkRzdELeHR5RczObw67ahJUrQXW177jbkwJGiQMgF7+ICDP+g1oTxrORb7Uws6MxptDI3q91wAN4rLKCTgLs12mEctJ4l5zj1F3TiPIXSfzCm1PoDxmbLzKs14nMqgma7QscKBMaAdGPRElSk/RMuQBED0Zof04OrqK7foZR+Br1BGhh7LGax6ZpmDwSTyV+EmDnf/9/j64lxmNKwb0bK4Zi/Mz99B8eZ/luBYFgUN+hskUw7u4vEV/WTwCVn9aw==
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com (2603:1096:203:82::18)
 by HK0PR06MB3201.apcprd06.prod.outlook.com (2603:1096:203:84::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Fri, 21 May
 2021 06:09:57 +0000
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::2984:f1bd:e1f9:5ed6]) by HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::2984:f1bd:e1f9:5ed6%7]) with mapi id 15.20.4129.035; Fri, 21 May 2021
 06:09:57 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Quan Nguyen <quan@os.amperecomputing.com>, Corey Minyard
 <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Brendan Higgins
 <brendanhiggins@google.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Wolfram Sang <wsa@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org"
 <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v3 5/7] i2c: aspeed: Add aspeed_set_slave_busy()
Thread-Topic: [PATCH v3 5/7] i2c: aspeed: Add aspeed_set_slave_busy()
Thread-Index: AQHXTIQCISnhT+/XbEiDVKSu2FVXwqrsNmDAgAA0VYCAAQwBAA==
Date: Fri, 21 May 2021 06:09:57 +0000
Message-ID: <HK0PR06MB3380CCA6A264A6D0E6E462FDF2299@HK0PR06MB3380.apcprd06.prod.outlook.com>
References: <20210519074934.20712-1-quan@os.amperecomputing.com>
 <20210519074934.20712-6-quan@os.amperecomputing.com>
 <HK0PR06MB3380BFA9FD9EF8F51F9DCC23F22A9@HK0PR06MB3380.apcprd06.prod.outlook.com>
 <3eba7d01-2507-17c6-2b27-7f1a7e286413@os.amperecomputing.com>
In-Reply-To: <3eba7d01-2507-17c6-2b27-7f1a7e286413@os.amperecomputing.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none; os.amperecomputing.com;
 dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a6e5946-a605-4f2c-1c9e-08d91c1f0f40
x-ms-traffictypediagnostic: HK0PR06MB3201:
x-microsoft-antispam-prvs: <HK0PR06MB32015B5BC1065ADB48F55468F2299@HK0PR06MB3201.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9qZJpqDX6d7VIQ5S+9K3xvLuhi6ixxicjswKxf92cOGLq2jnvK/qw/y1ylcIlGNzRlJ7uCsyL/Sj7LeP2KDNEwOCKCUg1DdJURMKSetkTZEzU1Go6y0+bLi0+z3DGxD+MSbeIqfQK2B8SaFo9fzyALManjKxeEOknmZ1pUDNT14/7SZ1d5sop+GUQLNH5R607PRwnFs4SBOAEEMdHNkNdQLoaB/L+vOj/wI8YolXFEdlXRfo7wSFnBq0qaxv5/bqeZoMnQHCJzI8hnuckW8T9dChdkaOn0kT/H/6Q3qOPz6KC5im4isNgfIXVPCWVCZUEd1xj8Ppr25Vo8T/rMxMNMffXbePqdL+ODOxMx8U1qsuJNDQDY0EuEtanWvt3nUxHZ08bWpB2UP9OYA73JdwNF1ardLVdd0pMgly8pGYLvAkerzVpyesJmZw3kTEpvSdrtrhlCiZL8wgih8aU+7d0S7t5cqOrE0yh1M+iQiWj7mC2HbBJVlPc11xZjjo1hor2XZKF8NUrd4c5rZuHa3OhMkjyTBaA7bgw9S5Gxbx2UgS4cR4/fca5tds1auMD6ZGi1atpWe/zQlg5lAxZ7g99PBfF8WydiAybPvrCNl0W56H0N6L92+1letSOEAME9LbXUW3+AXAnUk7xO3XqPjPcQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3380.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(396003)(39830400003)(346002)(71200400001)(52536014)(26005)(83380400001)(9686003)(64756008)(921005)(66946007)(7696005)(66476007)(66556008)(66446008)(2906002)(55016002)(6506007)(53546011)(55236004)(33656002)(86362001)(4326008)(54906003)(110136005)(8936002)(122000001)(38100700002)(186003)(76116006)(5660300002)(7416002)(508600001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?QkhxMU8yYWYyVUZYcW0zL3orVjNJZkRFU0tWdGtwZk9mTU5sUUZyekhSaGE3?=
 =?utf-8?B?K3diMTdqU1BIdzFGdHA5aDU5RUhmN1E0ZVo4RlpXb0E5cWYrblRNdDRnUTVj?=
 =?utf-8?B?RldmUG9uT3JmWWFxdVpUbVBHWm1Od0pkTjFuTDV0YWl0OWxHWmU4MG4zZTVC?=
 =?utf-8?B?TEtMbDVtRmZFSmkzZGIwOEpHQ05wTlBmNm1SaGpvck9CbUJWc081ajdLbVRm?=
 =?utf-8?B?RGZMaWkvVG5INkRiRUU3blVDdjJxM1pIdVpLU0t1NUdZenRIWGkvb2E5ZU80?=
 =?utf-8?B?cmxXV0FhalZnVWlsSld5OTZjV0R3M2RSZ2pGOStSMjdscGdORlZGNVcrNENu?=
 =?utf-8?B?Wk1EbWNPdUNPT0NIYy9lTCtXZmJ0MDFXTk93Q0h2TnRZVWZRRXpqRmpRaGJX?=
 =?utf-8?B?RHd4dzBRQitGUS9rdm5aRWlsTzEwcTY3akxvdHp5Sjl0T21PaGxYbFI1bUpk?=
 =?utf-8?B?R3EraHpWMHVUcElUOEQvdkYzL3AyQWRRUVQrRHpvLzgyNGxtMW5uR2Q4cTlU?=
 =?utf-8?B?bVo4bmQvQmlpNzJNbUM2VmIrc0VHNkV1eUxSYStKTG9iejhrMmdmRHlkdTl6?=
 =?utf-8?B?RTROUCt4YzlibldqcE9wNURkSUtEemliNVl1dGZqcnoxUnBEc2JLSGpwM09q?=
 =?utf-8?B?dWJSLys4QUllN3JGUXU5YS92OGJMOGhKNlppM2J1bXYwN1FQUnJUUm5McnU5?=
 =?utf-8?B?Rnh0MW43bjAxQnhaRGFxM2QxaVRkUDhrTG9WU0luZHlWcGJ0a2Y2UnBCUTVT?=
 =?utf-8?B?M0pZUnpPTG9lZ3pyT0FzQWxKUy80RTVlT21ZcUVTM3U5eHI0eGRBbzVKb0tr?=
 =?utf-8?B?ZTg3U1BJZnZ6d2ZWUFozeW1WVnMxWFgvVUdKNmJNTG1JOTJSVkozSHE0M053?=
 =?utf-8?B?bk9kbVQxZStKZ2J5cU5JcjJOUlE1YWljTVp2RVJXQ1l0bElnNEN0WStJVXdv?=
 =?utf-8?B?aEJtUW4zQTFYMTkvSWhtZEZyc1lCSlJ3YjdQRWg1VzFidis0cnlRYnVLQVBw?=
 =?utf-8?B?VVNjV29aZDVieDdheHRqbUNES3JzbCtVZkhKTEFiKzF2R0RVVFVTeU9wTjlP?=
 =?utf-8?B?a3hOMVBuOE9DcXZNTHo5Wi8xVDdGenFLVmxkSFB6SDkxK0l4VkpvL3VUSFd2?=
 =?utf-8?B?VGxJQzQxTTRXaTduRGtWSHdnalY3N0Jlcms2U0VibkgwbUx1S29MYVJpdDNG?=
 =?utf-8?B?SDEybk1YdEY3b3VoV3BJeXk4ZXZEUUtxeEN5bGJxRkJDOVpaSWJsWFYvYm5a?=
 =?utf-8?B?TElEN1hYUGtXZFZ0S0FYMFFlR1YrMzlrSWFJR2xKUUt5cjJyRnZJa3JzY1k4?=
 =?utf-8?B?Tjk2N09QV3ZUampvWStsSS9DT3RFZVlEcy9Yc1hSbnFtWno3d2pxSzdKS3lZ?=
 =?utf-8?B?OTQ2dWYrakRRVmVQd01VSU5XS0FsdWQyTkNqaUdPVTZUOHNCSTZiaXZRdDF6?=
 =?utf-8?B?cGthYURiWXNrZEROdHp4aE1pck1Ib3Y3UEQxOWRhL29wWXhRcVQ4VysyK1Iv?=
 =?utf-8?B?S1lLT0c3WjRJanJ2TDVYVzVEeVRJRDA1VXY3SUljb3JBVnpIeHVBdXRsbTJU?=
 =?utf-8?B?RjVaMWdpaEpKU1hBbjR3NkhOVURpNWhxeXY1Q3NDbWtPUnhvNWNhQWJCMlNR?=
 =?utf-8?B?YWt1a2NnK2Njb3Nya0IzZERXTXhkNDQ2a3BTaEExdjNrSndZNXRNN01PazZs?=
 =?utf-8?B?MDZFejMyejhEbnhYeVRRSllGUi9pdVZrQnQydDJwMytXSmRwSXU4SnEzdGxl?=
 =?utf-8?Q?qtmD+CgJDtPzMisX4jS87Isx6NxllUaX+cZtKmh?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3380.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a6e5946-a605-4f2c-1c9e-08d91c1f0f40
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 06:09:57.4090 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0oW+9FEJ4e81gCbLx6yMj6wUezvyqQ7VanjKvIJRbio1ek4Ty1fHZomuobu7qanT7CVStcMt6o8kahUTSnCkHlyu22WKo+mor/5oJ31Dwjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB3201
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
Cc: Open Source Submission <patches@amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBRdWFuIE5ndXllbiA8cXVhbkBv
cy5hbXBlcmVjb21wdXRpbmcuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgTWF5IDIwLCAyMDIxIDEw
OjEwIFBNDQo+IFRvOiBSeWFuIENoZW4gPHJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT47IENvcmV5
IE1pbnlhcmQNCj4gPG1pbnlhcmRAYWNtLm9yZz47IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5l
bC5vcmc+OyBKb2VsIFN0YW5sZXkNCj4gPGpvZWxAam1zLmlkLmF1PjsgQW5kcmV3IEplZmZlcnkg
PGFuZHJld0Bhai5pZC5hdT47IEJyZW5kYW4gSGlnZ2lucw0KPiA8YnJlbmRhbmhpZ2dpbnNAZ29v
Z2xlLmNvbT47IEJlbmphbWluIEhlcnJlbnNjaG1pZHQNCj4gPGJlbmhAa2VybmVsLmNyYXNoaW5n
Lm9yZz47IFdvbGZyYW0gU2FuZyA8d3NhQGtlcm5lbC5vcmc+OyBQaGlsaXBwIFphYmVsDQo+IDxw
LnphYmVsQHBlbmd1dHJvbml4LmRlPjsgb3BlbmlwbWktZGV2ZWxvcGVyQGxpc3RzLnNvdXJjZWZv
cmdlLm5ldDsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXgtYXNwZWVkQGxpc3RzLm96bGFicy5vcmc7IGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmcN
Cj4gQ2M6IE9wZW4gU291cmNlIFN1Ym1pc3Npb24gPHBhdGNoZXNAYW1wZXJlY29tcHV0aW5nLmNv
bT47IFRoYW5nIFEgLg0KPiBOZ3V5ZW4gPHRoYW5nQG9zLmFtcGVyZWNvbXB1dGluZy5jb20+OyBQ
aG9uZyBWbw0KPiA8cGhvbmdAb3MuYW1wZXJlY29tcHV0aW5nLmNvbT47IG9wZW5ibWNAbGlzdHMu
b3psYWJzLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDUvN10gaTJjOiBhc3BlZWQ6IEFk
ZCBhc3BlZWRfc2V0X3NsYXZlX2J1c3koKQ0KPiANCj4gT24gMjAvMDUvMjAyMSAxODowNiwgUnlh
biBDaGVuIHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9t
OiBvcGVuYm1jDQo+ID4+IDxvcGVuYm1jLWJvdW5jZXMrcnlhbl9jaGVuPWFzcGVlZHRlY2guY29t
QGxpc3RzLm96bGFicy5vcmc+IE9uDQo+IEJlaGFsZg0KPiA+PiBPZiBRdWFuIE5ndXllbg0KPiA+
PiBTZW50OiBXZWRuZXNkYXksIE1heSAxOSwgMjAyMSAzOjUwIFBNDQo+ID4+IFRvOiBDb3JleSBN
aW55YXJkIDxtaW55YXJkQGFjbS5vcmc+OyBSb2IgSGVycmluZw0KPiA+PiA8cm9iaCtkdEBrZXJu
ZWwub3JnPjsgSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT47IEFuZHJldyBKZWZmZXJ5DQo+
ID4+IDxhbmRyZXdAYWouaWQuYXU+OyBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdv
b2dsZS5jb20+Ow0KPiA+PiBCZW5qYW1pbiBIZXJyZW5zY2htaWR0IDxiZW5oQGtlcm5lbC5jcmFz
aGluZy5vcmc+OyBXb2xmcmFtIFNhbmcNCj4gPj4gPHdzYUBrZXJuZWwub3JnPjsgUGhpbGlwcCBa
YWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT47DQo+ID4+IG9wZW5pcG1pLWRldmVsb3BlckBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQ7DQo+ID4+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBs
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+ID4+IGxpbnV4LWFzcGVlZEBs
aXN0cy5vemxhYnMub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiA+PiBsaW51
eC1pMmNAdmdlci5rZXJuZWwub3JnDQo+ID4+IENjOiBPcGVuIFNvdXJjZSBTdWJtaXNzaW9uIDxw
YXRjaGVzQGFtcGVyZWNvbXB1dGluZy5jb20+OyBUaGFuZyBRIC4NCj4gPj4gTmd1eWVuIDx0aGFu
Z0Bvcy5hbXBlcmVjb21wdXRpbmcuY29tPjsgUGhvbmcgVm8NCj4gPj4gPHBob25nQG9zLmFtcGVy
ZWNvbXB1dGluZy5jb20+OyBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNCj4gPj4gU3ViamVjdDog
W1BBVENIIHYzIDUvN10gaTJjOiBhc3BlZWQ6IEFkZCBhc3BlZWRfc2V0X3NsYXZlX2J1c3koKQ0K
PiA+Pg0KPiA+PiBTbGF2ZSBpMmMgZGV2aWNlIG9uIEFTVDI1MDAgcmVjZWl2ZWQgYSBsb3Qgb2Yg
c2xhdmUgaXJxIHdoaWxlIGl0IGlzDQo+ID4+IGJ1c3kgcHJvY2Vzc2luZyB0aGUgcmVzcG9uc2Uu
IFRvIGhhbmRsZSB0aGlzIGNhc2UsIGFkZHMgYW5kIGV4cG9ydHMNCj4gPj4gYXNwZWVkX3NldF9z
bGF2ZV9idXN5KCkgZm9yIGNvbnRyb2xsZXIgdG8gdGVtcG9yYXJ5IHN0b3Agc2xhdmUgaXJxDQo+
ID4+IHdoaWxlIHNsYXZlIGlzIGhhbmRsaW5nIHRoZSByZXNwb25zZSwgYW5kIHJlLWVuYWJsZSB0
aGVtIGFnYWluIHdoZW4gdGhlDQo+IHJlc3BvbnNlIGlzIHJlYWR5Lg0KPiA+Pg0KPiA+PiBTaWdu
ZWQtb2ZmLWJ5OiBRdWFuIE5ndXllbiA8cXVhbkBvcy5hbXBlcmVjb21wdXRpbmcuY29tPg0KPiA+
PiAtLS0NCj4gPj4gdjM6DQo+ID4+ICAgICsgRmlyc3QgaW50cm9kdWNlIGluIHYzIFtRdWFuXQ0K
PiA+Pg0KPiA+PiAgIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXNwZWVkLmMgfCAyMCArKysrKysr
KysrKysrKysrKysrKw0KPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspDQo+
ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWFzcGVlZC5jDQo+
ID4+IGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hc3BlZWQuYyBpbmRleCBiMmU5YzhmMGRkZjcu
Ljk5MjZkMDQ4MzFhMg0KPiA+PiAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVycy9pMmMvYnVzc2Vz
L2kyYy1hc3BlZWQuYw0KPiA+PiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWFzcGVlZC5j
DQo+ID4+IEBAIC05NDQsNiArOTQ0LDI2IEBAIHN0YXRpYyBpbnQgYXNwZWVkX2kyY19pbml0KHN0
cnVjdCBhc3BlZWRfaTJjX2J1cw0KPiA+PiAqYnVzLA0KPiA+PiAgIAlyZXR1cm4gMDsNCj4gPj4g
ICB9DQo+ID4+DQo+ID4+ICsjaWYgSVNfRU5BQkxFRChDT05GSUdfSTJDX1NMQVZFKQ0KPiA+PiAr
dm9pZCBhc3BlZWRfc2V0X3NsYXZlX2J1c3koc3RydWN0IGkyY19hZGFwdGVyICphZGFwLCBib29s
IGJ1c3kpIHsNCj4gPj4gKwlzdHJ1Y3QgYXNwZWVkX2kyY19idXMgKmJ1cyA9IGkyY19nZXRfYWRh
cGRhdGEoYWRhcCk7DQo+ID4+ICsJdW5zaWduZWQgbG9uZyBjdXJyZW50X21hc2ssIGZsYWdzOw0K
PiA+PiArDQo+ID4+ICsJc3Bpbl9sb2NrX2lycXNhdmUoJmJ1cy0+bG9jaywgZmxhZ3MpOw0KPiA+
PiArDQo+ID4+ICsJY3VycmVudF9tYXNrID0gcmVhZGwoYnVzLT5iYXNlICsgQVNQRUVEX0kyQ19J
TlRSX0NUUkxfUkVHKTsNCj4gPj4gKwlpZiAoYnVzeSkNCj4gPj4gKwkJY3VycmVudF9tYXNrICY9
IH4oQVNQRUVEX0kyQ0RfSU5UUl9SWF9ET05FIHwNCj4gPj4gQVNQRUVEX0kyQ0RfSU5UUl9TTEFW
RV9NQVRDSCk7DQo+ID4+ICsJZWxzZQ0KPiA+PiArCQljdXJyZW50X21hc2sgfD0gQVNQRUVEX0ky
Q0RfSU5UUl9SWF9ET05FIHwNCj4gPj4gQVNQRUVEX0kyQ0RfSU5UUl9TTEFWRV9NQVRDSDsNCj4g
Pj4gKwl3cml0ZWwoY3VycmVudF9tYXNrLCBidXMtPmJhc2UgKyBBU1BFRURfSTJDX0lOVFJfQ1RS
TF9SRUcpOw0KPiA+PiArDQo+ID4+ICsJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmYnVzLT5sb2Nr
LCBmbGFncyk7IH0NCj4gPj4gK0VYUE9SVF9TWU1CT0xfR1BMKGFzcGVlZF9zZXRfc2xhdmVfYnVz
eSk7DQo+ID4+ICsjZW5kaWYNCj4gPj4gKw0KPiA+PiAgIHN0YXRpYyBpbnQgYXNwZWVkX2kyY19y
ZXNldChzdHJ1Y3QgYXNwZWVkX2kyY19idXMgKmJ1cykgIHsNCj4gPj4gICAJc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldiA9IHRvX3BsYXRmb3JtX2RldmljZShidXMtPmRldik7DQo+ID4+IC0t
DQo+ID4+IDIuMjguMA0KPiA+DQo+ID4gSGVsbG8sDQo+ID4gCVRoZSBiZXR0ZXIgaWRlYSBpcyB1
c2UgZGlzYWJsZSBpMmMgc2xhdmUgbW9kZS4NCj4gPiAJRHVlIHRvIGlmIGkyYyBjb250cm9sbGVy
IHJ1bm5pbmcgaW4gc2xhdmUgd2lsbCBnZXQgc2xhdmUgbWF0Y2gsIGFuZCBsYXRjaCB0aGUNCj4g
U0NMLg0KPiA+IAlVbnRpbCBjcHUgY2xlYXIgaW50ZXJydXB0IHN0YXR1cy4NCj4gPiBSeWFuDQo+
ID4NCj4gVGhhbmtzIFJ5YW4sDQo+IA0KPiBEbyB5b3UgbWVhbiB0byBlbmFibGUvZGlzYWJsZSBz
bGF2ZSBmdW5jdGlvbiBhcyBwZXIgZXhhbXBsZSBjb2RlIGJlbG93ID8NClllcy4gaXQgaXMuDQo+
IA0KPiAgICAgICAgICAvKiBUdXJuIG9uIHNsYXZlIG1vZGUuICovDQo+ICAgICAgICAgIGZ1bmNf
Y3RybF9yZWdfdmFsID0gcmVhZGwoYnVzLT5iYXNlICsNCj4gQVNQRUVEX0kyQ19GVU5fQ1RSTF9S
RUcpOw0KPiAgICAgICAgICBmdW5jX2N0cmxfcmVnX3ZhbCB8PSBBU1BFRURfSTJDRF9TTEFWRV9F
TjsNCj4gICAgICAgICAgd3JpdGVsKGZ1bmNfY3RybF9yZWdfdmFsLCBidXMtPmJhc2UgKw0KPiBB
U1BFRURfSTJDX0ZVTl9DVFJMX1JFRyk7DQo+IA0KPiBXaWxsIHRyeSB0aGlzIGlkZWEuDQo+IC0g
UXVhbg0K
