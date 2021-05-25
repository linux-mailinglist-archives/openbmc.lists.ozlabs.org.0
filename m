Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E74D338FF2E
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 12:31:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fq9Nb6Gvvz303n
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 20:31:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=lEPmEvx6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:febe::71c;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=lEPmEvx6; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-pu1apc01on071c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febe::71c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fq9NB3N5vz2yWp;
 Tue, 25 May 2021 20:31:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WSaeDWq5XUMfZA8At/Si0KfW879YZBgr6GcmXeRaZhuosLX6yTwLqSrizZOqel9ZeUOGh1YEMoNER+vnxImrUKwebn1HWBjpfqnRUFLR0fafrmuuA8JcDGcoVnwiN9zD4nss4R2KAKTXC04JRetlF+Sjr3K2KhbWoNnH7srzzd8V0KJMqho3qYRmhuHklj6jNY/E5KRkJkeHzw8sBSLJMFeYJu76aKVUmzeXyIIhHlV99ImEItNNEIKRAbWZXajghkikv3rhVmDW+s+kR44q1H+J8bOrPBcHJeJtd9Matzj9HWjf2jnAFma0U5VMsd0NIz5SOy9DjsZgxt5Ou9IWcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dWEYMnPYGUfGY5ffRJjX82W0tKteMgWfpgd+qBenImc=;
 b=iAMjNS7KkrgfoGJXiDmAUtUof4WCT4AduuXqNUq62LltufdqXJ9W2P0RbEFyaVw61oPqs8YETCukQ8DOy/siCiajVD71nKeq2P589SCtRjaVM7kYHPLE62C+3KJRtef2bHnPcufLfaqhfWWaY2gAGuMQGMcV1VRoRvYcKnnyWi6B1BzfqzCUr2Nf/V7uFspO/+907OGP1SLNTbiEZE/7UFjL2i6xy6b00X63PglvTPxtogVqSU9zu+Q3z2jhOcTZyBSIX9fZMuVT3wTXfrAvyDxZpr8K1+o7N0b/f9J0vGsHC2y8ChTcFcf6o+n0wFUQODbo8SEVf4Ryp8ql8Jrg2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dWEYMnPYGUfGY5ffRJjX82W0tKteMgWfpgd+qBenImc=;
 b=lEPmEvx6v9fCtNKUaazVRKjMRtzavi9mZo/5WL0YUYF1MGedetTD4WNFjgeypHNvgdtg3LWDP436WOk5j/GgwTU+yjeC82P/EVr9EpY63mozwQ9aPj1orN6Yz+bE3iNLrdrU/AlhysmciNsIateA8aMWFoQroMO1ZwZ3okwlTPXJLsPAQAty7ruhRI3RW4gtJCjq1bJs5sqTP1CgjMhCmmsP1G76vNb5CruEvF9AQns/z4AHt/S4ds1ecNYYptgpL8JDNwSAbD2XrVrdwTrBsiDcK1Q3UqlsBr36+lPUQMnsB2dzBIi8Bw00M3J4yv4GV2bXalYjt3/sqDQV8BbqFQ==
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com (2603:1096:203:82::18)
 by HK0PR06MB2243.apcprd06.prod.outlook.com (2603:1096:203:48::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.25; Tue, 25 May
 2021 10:30:37 +0000
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::ec25:881b:f113:93dc]) by HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::ec25:881b:f113:93dc%6]) with mapi id 15.20.4150.027; Tue, 25 May 2021
 10:30:37 +0000
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
Thread-Index: AQHXTIQCISnhT+/XbEiDVKSu2FVXwqryb5QAgAAEGYCAAAKuUIAABVEAgAGMPFA=
Date: Tue, 25 May 2021 10:30:36 +0000
Message-ID: <HK0PR06MB33805BB4A4D35192A0D95E59F2259@HK0PR06MB3380.apcprd06.prod.outlook.com>
References: <20210519074934.20712-1-quan@os.amperecomputing.com>
 <20210519074934.20712-6-quan@os.amperecomputing.com>
 <HK0PR06MB3380FD2B7649CFB48BEA2D4FF2269@HK0PR06MB3380.apcprd06.prod.outlook.com>
 <1648966e-3e45-9661-c5dc-5ac2f40e2581@os.amperecomputing.com>
 <HK0PR06MB338093E5E0D0DBA9EA7C1168F2269@HK0PR06MB3380.apcprd06.prod.outlook.com>
 <917237ce-98f8-df5f-32b6-b4145ac47ac9@os.amperecomputing.com>
In-Reply-To: <917237ce-98f8-df5f-32b6-b4145ac47ac9@os.amperecomputing.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none; os.amperecomputing.com;
 dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c80d7bed-0466-47ac-d914-08d91f6822e2
x-ms-traffictypediagnostic: HK0PR06MB2243:
x-microsoft-antispam-prvs: <HK0PR06MB2243B28246DD8C2E052A4D52F2259@HK0PR06MB2243.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6u+Ldig+r7rULITaGH9CqpuuVKb3QM6dc6u6uYddaG5e+GJ9j9dH/PsJv95h8juFFoU/BBHhY9zTNHypQTpG/P2Qu1DHEhSVEDxdSftHB5b6cewiLGfrFoWQKXYdnsvsGrTLxOyLNvdE3bNvSoh1yPo11+OzLJzGL4uEXXU4ft56e9ohbk1PrJCp2tZ24Jn5MOdM1XjNc9EjOP05RkJUMSZtj1p2p+q9lFLmocDb9pZF8UkfbCu5ujE6clEAHQf32CxhL5pG+JFRilvj5zM8wtJTg/HOgsEJA4mVH6IVtqf44KAieB+Vn6EIU2uIt5GqrPastHylpHpKwo12ZFMwDjoNCj4LwZNdkosgOAhXaHyAvBrstS3/2SPHgPNN6QVbpH4TVHlVGvbVZDtEHP6PYCA3Ah6HmGevfWtYGrvdrKAop34sleVc5GPWROKSIish4dZvDzCF/8WGVB24pSw0h7dhl26Ne2E0VCHqVJHZ9o+Y9Gp4cZ2owvsgQ0/IMglDXnlAJoLHFJqygA3ODYP7r5OHCQDHBgORxq66iYtf5yjoNbSi8s31kykqXrP/PbLsTZt/MRrEFPDqqR1SL2SoZ66QLooSzfzZMgjpW/Qbgy5DJXm5dcX8xd+PC11VotpN5NzKpMP2Dsg0iAG4JayyJg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3380.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(366004)(39850400004)(376002)(396003)(52536014)(4326008)(921005)(54906003)(66476007)(66446008)(66946007)(55016002)(316002)(76116006)(2906002)(66556008)(110136005)(38100700002)(64756008)(122000001)(86362001)(33656002)(55236004)(7696005)(478600001)(186003)(26005)(83380400001)(7416002)(8676002)(9686003)(71200400001)(8936002)(53546011)(5660300002)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?UFAycnMxc0tiVDRoRklkdG5kS0gvOThCQWJxekxvUm9vUGJOOGprZGZJaU9w?=
 =?utf-8?B?NTN4WkFNRTZYWExXa1dYaXh2KzhOYzF4bXlzb1M4a0tUb3YzbUsxM1h2eDBz?=
 =?utf-8?B?YnBKclpxMTBoQnZMMFVuQ0JrTy9rV0RqY1VLTmJRYmwwZzNaaGozMGNxNTBM?=
 =?utf-8?B?UVdNSndrVVd2VWJwd2d3Q2RNQ1hmMFpseDNoM1BmM3R6aEVhdTNQTEN2S0Y5?=
 =?utf-8?B?VEtjZ1ZkS0VYUVpJN1BiYVlhN3JTQVYwQmJ0aTQyQmtrSkt5OTNHajBFdHRE?=
 =?utf-8?B?V2NmSWFWQTVOenJVWVBUa1dnTndTdklmVFFsV0RydHhMSHQ0VHNpeUZwV3VB?=
 =?utf-8?B?TzBHWXJPWVkzK1lDOWk2bzdwYVJDdDVJMWZKdmRVK2tkcWNadVhrTzQxRTM0?=
 =?utf-8?B?dXFQbTRMRitidHlQSk5EZTBzOWwzcDFRL21POFRpMVFOVDgwUVBCRVFWelBq?=
 =?utf-8?B?aWlLR0pKbExJU0RSMXNyb0pDTW9mZjlscGxmSmtQNWJLamRJYm04cGsyT0xz?=
 =?utf-8?B?OUZHQm0vUi9LWEIwc0lPRE83dXc2TXE4V3d2cUhJN3dmditpYS9yNS9VL1ha?=
 =?utf-8?B?QmNrcUNtMjFQSERybU9NYjYzYmRZbWs4UVZPSXZNamVlVU9PT2d6b2MwU2JB?=
 =?utf-8?B?aUVhRzhYQTIrMjZnd3BEc21GRURYeEhhVWxmSVZOcFZTdEs3aVc4VXFJNWJY?=
 =?utf-8?B?MXlxbUg0SVRiK0NSWE0rUVdSOWVCeWtYUWpCbDlldkQwSDZFK0I1MDkvalNn?=
 =?utf-8?B?RENJQnp4N0ZYQmJxU1gvcTNjV3dBMUd5MHJielRVbmplUDRCVlM1cmVTVVh1?=
 =?utf-8?B?MkQ4cW9uUFNTVFdrcC84aEZtSmJxb1VrK1VxZHBoQXloM1I5dzNIWU5LcFhN?=
 =?utf-8?B?dmQ2ZmdKU2ZEcmVSUHFzUEdzYUhxRUlNd0Yrcmt5RXo0SmNZNTVPV2hIZkU3?=
 =?utf-8?B?VU1pNTBmdnE1UGtzVUJPNDFhV0hOS0t1Q2llNWVBOUNzTTBjK3hUcER1akxz?=
 =?utf-8?B?bUp2dCtKelFmdktjVmFwMGJxWWo5elRVS0x1OHNSRHZ0RU1kZGR6bkFBL1ha?=
 =?utf-8?B?ZTVzWUFCWFdMQzQxSk5jTkhnZ2JLN2NnNVMzSnVZb2RiYkhzQWM2c0JvOW0y?=
 =?utf-8?B?MFROOC9QakJ0cjJrV2V0N0tUV3dwNW5pcklieUVOKzhGcmlkRmptbUt2ZlRU?=
 =?utf-8?B?Sko0U0NVcE1OUGQxUkpYanFjVjB3UW01dG0xeUtkN1dqaGJOeW9TMVk4V3U2?=
 =?utf-8?B?NEQzZ1N6cFJHYm53YlBWVU9xTVBseEwyTURnT1NVM3EyTUUwaFFGMXlsUE9u?=
 =?utf-8?B?NllmMHNiOTRaUnVNQjFzYzFrQzB1WS80ZzRHT0Z5dStoVllwb3M3YnB1VXlt?=
 =?utf-8?B?Si82RVZvVkJhNEkwTWd4d2NRcVFYUlJKT2JrWDlLWlFnRmFMeXBrdHRGczBN?=
 =?utf-8?B?c3NVdW90Vnk5TlJZZFpSQ0VVTy9vdmdSdHhnYmppeXoyNWdzQU4yTkpVRlZk?=
 =?utf-8?B?Y21JWkVtbXFRT3Z3WVRVTXFVMjhNOUpEdStEZW9FOG00dWxQTllYSzRpRzVx?=
 =?utf-8?B?K2RaM1dZenZPdDRSL0p3K2NVZFNJR05oeDBYYXhTanRmUzI0MXRGRjU4dE8v?=
 =?utf-8?B?UXlWV25zMFdmZi9Eek0yM1o1OUZaUVZVNy9haXpLdG8wcldFMjlsNW4vcmdL?=
 =?utf-8?B?a3kxOVNoa0dXSDN3OUh4T3dsVDhCTTZpaFhuMk5ySllqeXRnTVFJdVZXYTFx?=
 =?utf-8?Q?mKpJ3anw2HUuc24GQRG0X0gv5c37yHmFVn2r8eJ?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3380.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c80d7bed-0466-47ac-d914-08d91f6822e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2021 10:30:36.8929 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K1q4HRiaLWjb0zkTPta/TvNedcYOExkKZTIfQgyTioC5F++fCzGjU75AfA8+9VqITcYM+dzn+P+litzppads6dUIQEnIJWZWANLUujY1zqM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2243
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
cy5hbXBlcmVjb21wdXRpbmcuY29tPg0KPiBTZW50OiBNb25kYXksIE1heSAyNCwgMjAyMSA2OjQ5
IFBNDQo+IFRvOiBSeWFuIENoZW4gPHJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT47IENvcmV5IE1p
bnlhcmQNCj4gPG1pbnlhcmRAYWNtLm9yZz47IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5v
cmc+OyBKb2VsIFN0YW5sZXkNCj4gPGpvZWxAam1zLmlkLmF1PjsgQW5kcmV3IEplZmZlcnkgPGFu
ZHJld0Bhai5pZC5hdT47IEJyZW5kYW4gSGlnZ2lucw0KPiA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xl
LmNvbT47IEJlbmphbWluIEhlcnJlbnNjaG1pZHQNCj4gPGJlbmhAa2VybmVsLmNyYXNoaW5nLm9y
Zz47IFdvbGZyYW0gU2FuZyA8d3NhQGtlcm5lbC5vcmc+OyBQaGlsaXBwIFphYmVsDQo+IDxwLnph
YmVsQHBlbmd1dHJvbml4LmRlPjsgb3BlbmlwbWktZGV2ZWxvcGVyQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldDsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXgtYXNwZWVkQGxpc3RzLm96bGFicy5vcmc7IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmcNCj4g
Q2M6IE9wZW4gU291cmNlIFN1Ym1pc3Npb24gPHBhdGNoZXNAYW1wZXJlY29tcHV0aW5nLmNvbT47
IFRoYW5nIFEgLg0KPiBOZ3V5ZW4gPHRoYW5nQG9zLmFtcGVyZWNvbXB1dGluZy5jb20+OyBQaG9u
ZyBWbw0KPiA8cGhvbmdAb3MuYW1wZXJlY29tcHV0aW5nLmNvbT47IG9wZW5ibWNAbGlzdHMub3ps
YWJzLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDUvN10gaTJjOiBhc3BlZWQ6IEFkZCBh
c3BlZWRfc2V0X3NsYXZlX2J1c3koKQ0KPiANCj4gT24gMjQvMDUvMjAyMSAxNzozNiwgUnlhbiBD
aGVuIHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBR
dWFuIE5ndXllbiA8cXVhbkBvcy5hbXBlcmVjb21wdXRpbmcuY29tPg0KPiA+PiBTZW50OiBNb25k
YXksIE1heSAyNCwgMjAyMSA2OjIwIFBNDQo+ID4+IFRvOiBSeWFuIENoZW4gPHJ5YW5fY2hlbkBh
c3BlZWR0ZWNoLmNvbT47IENvcmV5IE1pbnlhcmQNCj4gPj4gPG1pbnlhcmRAYWNtLm9yZz47IFJv
YiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBKb2VsIFN0YW5sZXkNCj4gPj4gPGpvZWxA
am1zLmlkLmF1PjsgQW5kcmV3IEplZmZlcnkgPGFuZHJld0Bhai5pZC5hdT47IEJyZW5kYW4gSGln
Z2lucw0KPiA+PiA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT47IEJlbmphbWluIEhlcnJlbnNj
aG1pZHQNCj4gPj4gPGJlbmhAa2VybmVsLmNyYXNoaW5nLm9yZz47IFdvbGZyYW0gU2FuZyA8d3Nh
QGtlcm5lbC5vcmc+OyBQaGlsaXBwDQo+ID4+IFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRl
PjsNCj4gPj4gb3BlbmlwbWktZGV2ZWxvcGVyQGxpc3RzLnNvdXJjZWZvcmdlLm5ldDsNCj4gPj4g
ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZzsNCj4gPj4gbGludXgtYXNwZWVkQGxpc3RzLm96bGFicy5vcmc7IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc7DQo+ID4+IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmcNCj4gPj4g
Q2M6IE9wZW4gU291cmNlIFN1Ym1pc3Npb24gPHBhdGNoZXNAYW1wZXJlY29tcHV0aW5nLmNvbT47
IFRoYW5nIFEgLg0KPiA+PiBOZ3V5ZW4gPHRoYW5nQG9zLmFtcGVyZWNvbXB1dGluZy5jb20+OyBQ
aG9uZyBWbw0KPiA+PiA8cGhvbmdAb3MuYW1wZXJlY29tcHV0aW5nLmNvbT47IG9wZW5ibWNAbGlz
dHMub3psYWJzLm9yZw0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDUvN10gaTJjOiBhc3Bl
ZWQ6IEFkZCBhc3BlZWRfc2V0X3NsYXZlX2J1c3koKQ0KPiA+Pg0KPiA+PiBPbiAyNC8wNS8yMDIx
IDE3OjA2LCBSeWFuIENoZW4gd3JvdGU6DQo+ID4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gPj4+PiBGcm9tOiBvcGVuYm1jDQo+ID4+Pj4gPG9wZW5ibWMtYm91bmNlcytyeWFuX2No
ZW49YXNwZWVkdGVjaC5jb21AbGlzdHMub3psYWJzLm9yZz4gT24NCj4gPj4gQmVoYWxmDQo+ID4+
Pj4gT2YgUXVhbiBOZ3V5ZW4NCj4gPj4+PiBTZW50OiBXZWRuZXNkYXksIE1heSAxOSwgMjAyMSAz
OjUwIFBNDQo+ID4+Pj4gVG86IENvcmV5IE1pbnlhcmQgPG1pbnlhcmRAYWNtLm9yZz47IFJvYiBI
ZXJyaW5nDQo+ID4+Pj4gPHJvYmgrZHRAa2VybmVsLm9yZz47IEpvZWwgU3RhbmxleSA8am9lbEBq
bXMuaWQuYXU+OyBBbmRyZXcgSmVmZmVyeQ0KPiA+Pj4+IDxhbmRyZXdAYWouaWQuYXU+OyBCcmVu
ZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+Ow0KPiA+Pj4+IEJlbmphbWlu
IEhlcnJlbnNjaG1pZHQgPGJlbmhAa2VybmVsLmNyYXNoaW5nLm9yZz47IFdvbGZyYW0gU2FuZw0K
PiA+Pj4+IDx3c2FAa2VybmVsLm9yZz47IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9u
aXguZGU+Ow0KPiA+Pj4+IG9wZW5pcG1pLWRldmVsb3BlckBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ7
DQo+ID4+Pj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZzsNCj4gPj4+PiBsaW51eC1hc3BlZWRAbGlzdHMub3psYWJzLm9yZzsg
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gPj4+PiBsaW51eC1pMmNAdmdlci5rZXJu
ZWwub3JnDQo+ID4+Pj4gQ2M6IE9wZW4gU291cmNlIFN1Ym1pc3Npb24gPHBhdGNoZXNAYW1wZXJl
Y29tcHV0aW5nLmNvbT47IFRoYW5nDQo+IFEgLg0KPiA+Pj4+IE5ndXllbiA8dGhhbmdAb3MuYW1w
ZXJlY29tcHV0aW5nLmNvbT47IFBob25nIFZvDQo+ID4+Pj4gPHBob25nQG9zLmFtcGVyZWNvbXB1
dGluZy5jb20+OyBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNCj4gPj4+PiBTdWJqZWN0OiBbUEFU
Q0ggdjMgNS83XSBpMmM6IGFzcGVlZDogQWRkIGFzcGVlZF9zZXRfc2xhdmVfYnVzeSgpDQo+ID4+
Pj4NCj4gPj4+PiBTbGF2ZSBpMmMgZGV2aWNlIG9uIEFTVDI1MDAgcmVjZWl2ZWQgYSBsb3Qgb2Yg
c2xhdmUgaXJxIHdoaWxlIGl0IGlzDQo+ID4+Pj4gYnVzeSBwcm9jZXNzaW5nIHRoZSByZXNwb25z
ZS4gVG8gaGFuZGxlIHRoaXMgY2FzZSwgYWRkcyBhbmQgZXhwb3J0cw0KPiA+Pj4+IGFzcGVlZF9z
ZXRfc2xhdmVfYnVzeSgpIGZvciBjb250cm9sbGVyIHRvIHRlbXBvcmFyeSBzdG9wIHNsYXZlIGly
cQ0KPiA+Pj4+IHdoaWxlIHNsYXZlIGlzIGhhbmRsaW5nIHRoZSByZXNwb25zZSwgYW5kIHJlLWVu
YWJsZSB0aGVtIGFnYWluIHdoZW4NCj4gPj4+PiB0aGUNCj4gPj4gcmVzcG9uc2UgaXMgcmVhZHku
DQo+ID4+Pj4NCj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBRdWFuIE5ndXllbiA8cXVhbkBvcy5hbXBl
cmVjb21wdXRpbmcuY29tPg0KPiA+Pj4+IC0tLQ0KPiA+Pj4+IHYzOg0KPiA+Pj4+ICAgICArIEZp
cnN0IGludHJvZHVjZSBpbiB2MyBbUXVhbl0NCj4gPj4+Pg0KPiA+Pj4+ICAgIGRyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtYXNwZWVkLmMgfCAyMCArKysrKysrKysrKysrKysrKysrKw0KPiA+Pj4+ICAg
IDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspDQo+ID4+Pj4NCj4gPj4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hc3BlZWQuYw0KPiA+Pj4+IGIvZHJpdmVycy9p
MmMvYnVzc2VzL2kyYy1hc3BlZWQuYyBpbmRleCBiMmU5YzhmMGRkZjcuLjk5MjZkMDQ4MzFhMg0K
PiA+Pj4+IDEwMDY0NA0KPiA+Pj4+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXNwZWVk
LmMNCj4gPj4+PiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWFzcGVlZC5jDQo+ID4+Pj4g
QEAgLTk0NCw2ICs5NDQsMjYgQEAgc3RhdGljIGludCBhc3BlZWRfaTJjX2luaXQoc3RydWN0DQo+
ID4+Pj4gYXNwZWVkX2kyY19idXMgKmJ1cywNCj4gPj4+PiAgICAJcmV0dXJuIDA7DQo+ID4+Pj4g
ICAgfQ0KPiA+Pj4+DQo+ID4+Pj4gKyNpZiBJU19FTkFCTEVEKENPTkZJR19JMkNfU0xBVkUpDQo+
ID4+Pj4gK3ZvaWQgYXNwZWVkX3NldF9zbGF2ZV9idXN5KHN0cnVjdCBpMmNfYWRhcHRlciAqYWRh
cCwgYm9vbCBidXN5KSB7DQo+ID4+Pj4gKwlzdHJ1Y3QgYXNwZWVkX2kyY19idXMgKmJ1cyA9IGky
Y19nZXRfYWRhcGRhdGEoYWRhcCk7DQo+ID4+Pj4gKwl1bnNpZ25lZCBsb25nIGN1cnJlbnRfbWFz
aywgZmxhZ3M7DQo+ID4+Pj4gKw0KPiA+Pj4+ICsJc3Bpbl9sb2NrX2lycXNhdmUoJmJ1cy0+bG9j
aywgZmxhZ3MpOw0KPiA+Pj4+ICsNCj4gPj4+PiArCWN1cnJlbnRfbWFzayA9IHJlYWRsKGJ1cy0+
YmFzZSArIEFTUEVFRF9JMkNfSU5UUl9DVFJMX1JFRyk7DQo+ID4+PiBIZWxsbw0KPiA+Pj4gCVdo
ZXJlIHRoZSBidXMtPmJhc2UgdG8gYmUgcmVtYXA/DQo+ID4+Pg0KPiA+Pg0KPiA+PiBIaSBSeWFu
LA0KPiA+Pg0KPiA+PiBJbiAiW1BBVENIIHYzIDYvN10gaXBtaTogc3NpZl9ibWM6IEFkZCBBc3Bl
ZWQgU1NJRiBCTUMgZHJpdmVyIiwgdGhlDQo+ID4+IC0+cHJpdiBpcyByZXRyaWV2ZWQgYnkgY2Fs
bGluZyBpMmNfZ2V0X2FkYXBkYXRhKGNsaWVudC0+YWRhcHRlcikuIEFuZA0KPiA+PiAtPmluDQo+
ID4+IGFzcGVlZF9zZXRfc3NpZl9ibWNfc3RhdHVzKCksIGNhbGwgdGhlIGV4cG9ydGVkDQo+ID4+
IGFzcGVlZF9zZXRfc2xhdmVfYnVzeSgpIHVzaW5nIC0+cHJpdiBwb2ludGVyIGFzIGNvZGUgYmVs
b3cuDQo+ID4+DQo+ID4gWWVzLCBJIHNlZSB0aGUgcHJvYmUgZnVuY3Rpb24gIiBzc2lmX2JtYy0+
cHJpdiA9DQo+IGkyY19nZXRfYWRhcGRhdGEoY2xpZW50LT5hZGFwdGVyKTsiIHRvIGdldCBwcml2
Lg0KPiA+IEJ1dCBteSBxdWVzdGlvbiBJIGRvbuKAmXQgc2VlIHRoZSBidXMtPmJhc2UgYWRkcmVz
cyBiZSBhc3NpZ25lZC4NCj4gPg0KPiBIaSBSeWFuLA0KPiANCj4gSW4gZHJpdmVycy9pMmMvYnVz
c2VzL2kyYy1hc3BlZWQuYzoNCj4gc3RydWN0IGFzcGVlZF9pMmNfYnVzIHsNCj4gICAgICAgICAg
c3RydWN0IGkyY19hZGFwdGVyICAgICAgICAgICAgICBhZGFwOw0KPiAgICAgICAgICBzdHJ1Y3Qg
ZGV2aWNlICAgICAgICAgICAgICAgICAgICpkZXY7DQo+ICAgICAgICAgIHZvaWQgX19pb21lbSAg
ICAgICAgICAgICAgICAgICAgKmJhc2U7DQo+ICAgICAgICAgIHN0cnVjdCByZXNldF9jb250cm9s
ICAgICAgICAgICAgKnJzdDsNCj4gICAgICAgICAgLyogU3luY2hyb25pemVzIEkvTyBtZW0gYWNj
ZXNzIHRvIGJhc2UuICovDQo+ICAgICAgICAgIHNwaW5sb2NrX3QgICAgICAgICAgICAgICAgICAg
ICAgbG9jazsNCj4gDQo+IFNvIHdoZW4gInN0cnVjdCBhc3BlZWRfaTJjX2J1cyAqYnVzID0gaTJj
X2dldF9hZGFwZGF0YShhZGFwKTsiLCB0aGUNCj4gYnVzLT5iYXNlIHNob3VsZCBwb2ludCB0byB0
aGUgYmFzZSBvZiB0aGUgYXNwZWVkX2kyY19idXMsIHdoaWNoIGlzDQo+IGFscmVhZHkgaW5pdGlh
bGl6ZWQgYnkgdGhlIGFzcGVlZCBpMmMgYnVzIGRyaXZlci4NCj4gDQo+IERvIEkgbWlzcyBzb21l
dGhpbmc/DQpIZWxsbyBRdWFuLA0KCUFmdGVyIHN0dWR5LiBJIHRoaW5rIHRoZSBzc2lmX2JtY19h
c3BlZWQuYyBhc3N1bWUgdGhlIHByaXYgZGF0YSBpcyB0aGUgc2FtZSBzdHJ1Y3QuDQoJVGhhdCBp
cyB0cmljay4NCglEbyB3ZSBoYXZlIGEgYmV0dGVyIGZvciBzbGF2ZSBlbmFibGUvZGlzYWJsZSBj
YWxsIGJhY2sgdG8gaW1wbGVtZW50IHRoaXM/DQoJSWYgYWRkIGNhbGwgYmFjayBpbiBzdHJ1Y3Qg
aTJjX2FsZ29yaXRobTsgaXMgaXQgd29ya2FibGU/DQo+IA0KPiA+PiArZXh0ZXJuIHZvaWQgYXNw
ZWVkX3NldF9zbGF2ZV9idXN5KHN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcCwgYm9vbCBidXN5KTsN
Cj4gPj4gK3N0YXRpYyB2b2lkIGFzcGVlZF9zZXRfc3NpZl9ibWNfc3RhdHVzKHN0cnVjdCBzc2lm
X2JtY19jdHggKnNzaWZfYm1jLA0KPiA+PiB1bnNpZ25lZCBpbnQgc3RhdHVzKQ0KPiA+PiArew0K
PiA+PiArCWlmIChzdGF0dXMgJiBTU0lGX0JNQ19CVVNZKQ0KPiA+PiArCQlhc3BlZWRfc2V0X3Ns
YXZlX2J1c3koKHN0cnVjdCBpMmNfYWRhcHRlciAqKXNzaWZfYm1jLT5wcml2LCB0cnVlKTsNCj4g
Pj4gKwllbHNlIGlmIChzdGF0dXMgJiBTU0lGX0JNQ19SRUFEWSkNCj4gPj4gKwkJYXNwZWVkX3Nl
dF9zbGF2ZV9idXN5KChzdHJ1Y3QgaTJjX2FkYXB0ZXIgKilzc2lmX2JtYy0+cHJpdiwgZmFsc2Up
OyB9DQo+ID4+ICsNCj4gPj4gK3N0YXRpYyBpbnQgc3NpZl9ibWNfcHJvYmUoc3RydWN0IGkyY19j
bGllbnQgKmNsaWVudCwgY29uc3Qgc3RydWN0DQo+ID4+IGkyY19kZXZpY2VfaWQgKmlkKQ0KPiA+
PiArew0KPiA+PiArCXN0cnVjdCBzc2lmX2JtY19jdHggKnNzaWZfYm1jOw0KPiA+PiArDQo+ID4+
ICsJc3NpZl9ibWMgPSBzc2lmX2JtY19hbGxvYyhjbGllbnQsIDApOw0KPiA+PiArCWlmIChJU19F
UlIoc3NpZl9ibWMpKQ0KPiA+PiArCQlyZXR1cm4gUFRSX0VSUihzc2lmX2JtYyk7DQo+ID4+ICsN
Cj4gPj4gKwlzc2lmX2JtYy0+cHJpdiA9IGkyY19nZXRfYWRhcGRhdGEoY2xpZW50LT5hZGFwdGVy
KTsNCj4gPj4gKwlzc2lmX2JtYy0+c2V0X3NzaWZfYm1jX3N0YXR1cyA9IGFzcGVlZF9zZXRfc3Np
Zl9ibWNfc3RhdHVzOw0KPiA+PiArDQo+ID4+ICsJcmV0dXJuIDA7DQo+ID4+ICt9DQo+ID4+DQo+
ID4+IC0gUXVhbg0KPiA+Pg0KPiA+Pg0KPiA+DQoNCg==
