Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D08C7534BB
	for <lists+openbmc@lfdr.de>; Fri, 14 Jul 2023 10:09:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=h5+SjfqM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2PKB1v2yz3dHr
	for <lists+openbmc@lfdr.de>; Fri, 14 Jul 2023 18:09:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=h5+SjfqM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::708; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20708.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::708])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2PJV0XPjz3c47;
	Fri, 14 Jul 2023 18:09:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DG88hEw2cvaVxWmi64TDXSN5ZUeqiKqb3XlC2zRM4LzFIXrhRjlypwcHTMr1FpYhtcmHf/wcMdYO5zKs7rJ0ynShCABxbKQn+e3hzZguo4Dcioigo8tXz7/0m2Ko1opd8hWgoubagDhixk00PNyqb3yOyK99R5U3/l1nDG1eI+iBhUJHM5r3HeZwj36C+zQ3hjCz6gFm/gZPPRMOl9lCqBV0wJfsMUftAc2RfbBayFhXGWk7qcCl8af38WZVE6qfIrACrN7a3ZefrfLfFRgJ8Eux571ciAUKKZ6TmxtbTEDfOQ298WV4zGftzIGxyEOt5OvvpnDJsYHRrBV4swq8eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iazv4uSTJpczaFkuRP/KgvfP6p/1pkkHor3ME4xCI0M=;
 b=EfBwgm2erXRtR+AcdO3d708fHub41DrraXr7+/iNfqkolGnQN9PaFn2upvWWMeecrnOWI/AbgdfGsfFURhh3k0aFoQkL6swzIviqwT8aQ8cV8EoiwEYNGrOvSB9eZstetNOn050m8wsVoNnl9sH0BLOR/zRFmMGupPvmb7rBnikXPpmPNFoLZoaaVrplwu1iWQ5wTZpnziDyaFWiTvQLa55pMWR2SSvdINGm0v33Heyqwq3ENBN+2pE6MehP32GPff7tBZV5sW52iy9J7PDvoJAkT4pdhEYiWx9PtBoaye8E1yibFFjp7KS9I+0W1HHUzzv114YjQP28ZabI4J1sSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iazv4uSTJpczaFkuRP/KgvfP6p/1pkkHor3ME4xCI0M=;
 b=h5+SjfqMywrYb83nwf4LTuiD0yXhb/FGJtgSS+HQSgsQBvxqzEi9PHZCAN5DE4SFUI8vaYkRDK9EgK3NUAVpCFA+J0ZCswmbWbVe1GsmiqLnrlTKxNZaxa7X6Pktx2ve4eZzHy+kbAe6IQ/awYw6g1YS37abpDz8wc3Ed20pgzdLVJohkhwkOV7gw1pX8I7m4xgWO0ppYfJYAQTea93+S+kMn4KFbffI3bzH3CUDEVZVaW8Z2RtaWV4cxJJcggh9iCiGot2YYNS+Chagj2LX8aG0RqU8B01wsoc4O8Nbvpg+EaX7QcV4WEm/rbhysV0NXjHjZ0QnYx0Z/E6lcUDIdQ==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEZPR06MB6058.apcprd06.prod.outlook.com (2603:1096:101:e3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 08:08:49 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Fri, 14 Jul 2023
 08:08:48 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"jk@codeconstruct.com.au" <jk@codeconstruct.com.au>, Brendan Higgins
	<brendan.higgins@linux.dev>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa@kernel.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Jean
 Delvare <jdelvare@suse.de>, William Zhang <william.zhang@broadcom.com>,
	Tyrone Ting <kfting@nuvoton.com>, Tharun Kumar P
	<tharunkumar.pasumarthi@microchip.com>, Conor Dooley
	<conor.dooley@microchip.com>, Phil Edworthy <phil.edworthy@renesas.com>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "=linux-kernel@vger.kernel.org"
	<=linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: RE: [PATCH v12 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
Thread-Topic: [PATCH v12 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
Thread-Index: AQHZtics0zDPons9tEqiPxizT4zKAq+45uuAgAAA8zA=
Date: Fri, 14 Jul 2023 08:08:48 +0000
Message-ID:  <SEZPR06MB5269EB586319B3333CD96010F234A@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230714074522.23827-1-ryan_chen@aspeedtech.com>
 <20230714074522.23827-3-ryan_chen@aspeedtech.com>
 <eda7789d-a603-d565-c9da-edfe9493a05d@linaro.org>
In-Reply-To: <eda7789d-a603-d565-c9da-edfe9493a05d@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|SEZPR06MB6058:EE_
x-ms-office365-filtering-correlation-id: 2b50e09e-d020-43d2-d91d-08db84418dbe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  6+FUmdvH1BuKdFX7Ze6CjxOW1XjgDBZ8gr5oEJyWdY31UiPutkUga4UYsuxg1Oy5Q0OX0PMebIqWLJczRBZ4mh3Pu7dAtWFd/1esofqsZsxQT3LgDJgbN+IYzOzEKqAnOtWwXM+cRxmPt2JF8R0XNVZbYDbXxhnUaVgiIMkBJQO0n1NEdAMxHdNXq3H4gtjA1iKrvVkP0s1Pm9RP6cVT+Y5MfRzPvP9NNSc1W9I/fRDzS3bqGrXY8O4dPILC7nm2zikMv7f3DVO0/4VCO1qwHMaWQo2cr/nEq6yp6p9IyiN6lwazw2VQz5KIL6MlLYP8AhHMySTuNU+/cb0u0an9sVYMAjCIr4i2g89QQHeWbmHBIwINb43vFf+E0pstNs8dNVHJ5dzyMXKBLdMH2PMU3Vi1CWY6WNfF18zV3zqWQQXUZnfntPwJdu47pGJtpqE086jdT5a8q2UVvEx0/nh100J6rubrB/teUVu+d1BMTQdatckSBbQ633kpBln0FPUg7EQEIwyfCsfgK89CfBeUn/4QtOMTOrvbnjewfEImYI/veJx3XmJbmfqCnLBkxgF4A6k+e4yH6orflJgGM6m8EKL2vUwq/zm85NC2FMiu6hAkxEI6Aaowidz7Sua1TsNE
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(396003)(136003)(376002)(39850400004)(451199021)(52536014)(7416002)(76116006)(64756008)(66556008)(66946007)(66476007)(66446008)(41300700001)(316002)(2906002)(478600001)(5660300002)(8676002)(8936002)(110136005)(71200400001)(7696005)(9686003)(966005)(26005)(55016003)(53546011)(186003)(83380400001)(6506007)(33656002)(921005)(38100700002)(122000001)(86362001)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bnhNRDNrTmx1SkNrdUpNanhkUlNRUWtlMzFPRVRBWlZlZ3h5RHpQM3p1UkZL?=
 =?utf-8?B?ZVd4YUlJeGlpcjFVRWxQQTNkVFRSaXhDZ24wYTQ4a08wdXNwUHZpR3NkRDBM?=
 =?utf-8?B?blFUVmlOcVUvSVVhM0VMK1RKRTNqVTZUd2pTNXkxV2h5U0hXbWhnait1cVZt?=
 =?utf-8?B?UjhUNXl3OE1LTGxJWGVFZEZZWHgzb2FKa2lPL3ZZbElmK202SE1IOUNsZ01B?=
 =?utf-8?B?c2taQ09BY1pUWjhrYnZlRjV5TERmS2VqSE9nR0NLSHM4NE8rdWNkT2F6VVJX?=
 =?utf-8?B?NFVJMlVPOWpGNVRBNVhRT2tyRklpYjdobDVSVVVGbnNubkpGaklmdS9ZMmQ0?=
 =?utf-8?B?SFE4UEp1SHJ6ZWR2VVlGOXlQS1V5cno5QW8vcU5OTXFJcElrNnZLSk5GNnV4?=
 =?utf-8?B?UXUyOVpCQis4MmlVMFU4YkdEc3BKN3JobmZvbFpXWHp2cHZJbzJnVTBHTnEw?=
 =?utf-8?B?TzB2VFhSU3ZobElWSUprUnlrN09uTHlSdktpZC9EZC9xNXN3cnB3alNJb3ZV?=
 =?utf-8?B?WGNKeExLNDdMalhWVW5sVUhDejNQTlFmVGRodTA0cjlGcWRld0hlTlN1N2tB?=
 =?utf-8?B?ZWt2UDlXS1ZocGZmby9xcno1bm5zcVBhQm8wUktxRkZvUUJVLzVURGtyRFpo?=
 =?utf-8?B?NTF2dHhpcXg1UzdMMS9mRUE2N1dXWC9VVkMvVTBRTnoyWVdsRm11RGJCdGlM?=
 =?utf-8?B?T2Y5Z1pEbHdRNExUQXE5WG5VcXRxd1VUcTJzK2xURGkxQmdKdWt3L1pXM3ZZ?=
 =?utf-8?B?emRXYlYycXVyc1JyOXVBbjVKQ2dkY0RXR0M4VG40TVIrS2d1NDNxeFU1aitR?=
 =?utf-8?B?cFVMMVFDTHM3Q254bDNHbXk4aXZmVEVHcXBsdEp1R0Q1UmxhZmdHL0htZmlR?=
 =?utf-8?B?ZDZ0NHFSMXRweWcyRnBDSHNsbDlnL1RvZFhjeDhnMFJnS3NvbHpHQ1VpSlBN?=
 =?utf-8?B?enBBUzVKYVhFNDZDdWdRV0IrYUFXOW1Sa1JESE1iOTlFTjh2aUhDUzdPZEcv?=
 =?utf-8?B?TlVrR2RQQmhZMVc5WGNJUUR0c0ErbE1XUHhVZURZbGs3Y2hrRCt3aUxhVGxH?=
 =?utf-8?B?WWVXVzFQSmpLdVEyQXAwc210dzcrN0REYXlMV1BIU1FaQzdWSndmQkJ1Y1NP?=
 =?utf-8?B?SkVFRUF4NW1IZDZGdkxkV3IxUkRtK1FCWnBwYmIxLzdZcS90VU90U0lIWFBV?=
 =?utf-8?B?Um1Mb0JvWGtudGV2RWdRbHhhdVBnTXpzQXR5OVNlRGN3MmFERWZabXJhVXJl?=
 =?utf-8?B?UE1UZ1l5endMUW1Lamp4bTNKUmViVFVadXBDb1FrOFlRc0o2c001allucjV1?=
 =?utf-8?B?aDNNZW95aS9MNTF2SkR3RE9TcGVhODZBK0FtWmNBUzJOaXlrMEl5WkdjNWpm?=
 =?utf-8?B?bHAwZTAzMXNIdXBwZ3RpUU1OVnJrS0xoZEV2Z0taMFQ3OE9GMmludXM3aUNq?=
 =?utf-8?B?Mi9DUC9iLzB6blV5d0ZTNklwQ3dnWld0UjQyZEpsc0RoZ3JvUmNBVEl1aEhX?=
 =?utf-8?B?V2t2UkJuRDV4VCt1cGxOVktlTUxKUVNQeXlaRDB0MHJrMHlRUTlGcytTb3RH?=
 =?utf-8?B?TWRqU3c4NHlrK281YXkxUG1qQlk4NFFEYjJKWGRtT2swQ1d5alZhVkdVNUVI?=
 =?utf-8?B?SnZUL1pPSXNYMVIxSjdiWVhkeitPU0M3eUhqWXVEYzhlVndWcGp1bkVMRGxV?=
 =?utf-8?B?RXZvQW9CRkpCQ3JGbXlObVFRa1U3S2VsOUoxVEtkT25Rb3R0TjZkU3FsWFpP?=
 =?utf-8?B?cS9OeDU1aWduWUpqSXZIdFBPc01jV3ByUlFOdmhzZVIxMlFHQ0tJd0ZWK2pB?=
 =?utf-8?B?TGJBSzBEMWVMWlB1eXlCcW9JcjBGak1GbDJXaVNHclQ4NW45eTN2YUFSdG1Z?=
 =?utf-8?B?MlNGRVVuNU1PRENJZlM3TW00eS9wYW9GQnhzYWF3ZTQxbTFkNXFZcnVja2VX?=
 =?utf-8?B?Q0UzS3dXd2dmVDNSVllZaEg1L3kzdzdqdUlEWmRIaEhrUG9lRDlNeDcwd1Mv?=
 =?utf-8?B?QUxIVms2RDFQRkxHVW15dDBpWERXbmI2Vnk1bC9ZMU1Wd25waGluTVNqaFZR?=
 =?utf-8?B?cFZRT3owTVlFRHhPWmptN204eENXWUpLM2RWeDNMWHlsQW00TXlwR3l2VEc1?=
 =?utf-8?Q?X8S950hb8hE8YUqbhzLTiByjI?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b50e09e-d020-43d2-d91d-08db84418dbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2023 08:08:48.8468
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Omp5GARQYL2nuCdMsJBcvdKb8ymTYJuiA7iQFtXyM/MM8+yxrqyMSEAFoHXtj2x/giYLHK1C5AWgQeHd8dkqMGUREDoclkxRzek53T6nTuw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6058
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

SGVsbG8sDQoNCk9uIDE0LzA3LzIwMjMgMDk6NDUsIFJ5YW4gQ2hlbiB3cm90ZToNCj4gQWRkIGky
YyBuZXcgcmVnaXN0ZXIgbW9kZSBkcml2ZXIgdG8gc3VwcG9ydCBBU1QyNjAwIGkyYyBuZXcgcmVn
aXN0ZXIgDQo+IG1vZGUuIEFTVDI2MDAgaTJjIGNvbnRyb2xsZXIgaGF2ZSBsZWdhY3kgYW5kIG5l
dyByZWdpc3RlciBtb2RlLiBUaGUgDQo+IG5ldyByZWdpc3RlciBtb2RlIGhhdmUgZ2xvYmFsIHJl
Z2lzdGVyIHN1cHBvcnQgNCBiYXNlIGNsb2NrIGZvciBzY2wgDQo+IGNsb2NrIHNlbGVjdGlvbiwg
YW5kIG5ldyBjbG9jayBkaXZpZGVyIG1vZGUuIFRoZSBpMmMgbmV3IHJlZ2lzdGVyIG1vZGUgDQo+
IGhhdmUgc2VwYXJhdGUgcmVnaXN0ZXIgc2V0IHRvIGNvbnRyb2wgaTJjIG1hc3RlciBhbmQgc2xh
dmUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSeWFuIENoZW4gPHJ5YW5fY2hlbkBhc3BlZWR0ZWNo
LmNvbT4NCj4gLS0tDQoNCi4uLg0KDQo+ICsJcmV0ID0gZGV2bV9pMmNfYWRkX2FkYXB0ZXIoZGV2
LCAmaTJjX2J1cy0+YWRhcCk7DQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0dXJuIHJldDsNCj4gKw0K
PiArCXJldHVybiAwOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW50IGFzdDI2MDBfaTJjX3JlbW92
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KSB7DQo+ICsJc3RydWN0IGFzdDI2MDBfaTJj
X2J1cyAqaTJjX2J1cyA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOw0KPiArDQo+ICsJLyog
RGlzYWJsZSBldmVyeXRoaW5nLiAqLw0KPiArCXdyaXRlbCgwLCBpMmNfYnVzLT5yZWdfYmFzZSAr
IEFTVDI2MDBfSTJDQ19GVU5fQ1RSTCk7DQo+ICsJd3JpdGVsKDAsIGkyY19idXMtPnJlZ19iYXNl
ICsgQVNUMjYwMF9JMkNNX0lFUik7DQo+ICsNCj4gKwlpMmNfZGVsX2FkYXB0ZXIoJmkyY19idXMt
PmFkYXApOw0KDQo+IEkgaGF2ZSBkb3VidHMgdGhhdCB5b3UgdGVzdGVkIHRoaXMuIEkgdGhpbmsg
eW91IGhhdmUgaGVyZSBkb3VibGUgZnJlZS9kZWwgb2YgdGhlIGFkYXB0ZXIuDQpTb3JyeSwgaSBj
YW4ndCBjYXRjaCB5b3VyIHBvaW50IGZvciBkb3VibGUgZnJlZSB0aGUgYWRhcHRlci4NCkl0IHNo
b3VsZCB1c2UgaTJjX2RlbF9hZGFwdGVyIGluIGRyaXZlciByZW1vdmUgZnVuY3Rpb24uDQpBbGwg
dGhlIGRyaXZlciBkb2luZyB0aGlzIA0KaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4
L2Jsb2IvbWFzdGVyL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbnBjbTd4eC5jI0wyMzczDQpodHRw
czovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi9tYXN0ZXIvZHJpdmVycy9pMmMvYnVz
c2VzL2kyYy1hbHRlcmEuYyNMNDczDQoNCkRvIHlvdSBtZWFuIGl0IGlzIG5vdCBuZWNlc3Nhcnk/
IA0KDQo+ICsJZGV2bV9mcmVlX2lycSgmcGRldi0+ZGV2LCBpMmNfYnVzLT5pcnEsIGkyY19idXMp
Ow0KPiArDQoNCg0KQmVzdCByZWdhcmRzLA0KS3J6eXN6dG9mDQoNCg==
