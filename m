Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D0B6874F3
	for <lists+openbmc@lfdr.de>; Thu,  2 Feb 2023 06:16:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6n7s5xhpz3cdZ
	for <lists+openbmc@lfdr.de>; Thu,  2 Feb 2023 16:16:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=vFMshj+D;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::72c; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=vFMshj+D;
	dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2072c.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::72c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6n721M1wz3cNY;
	Thu,  2 Feb 2023 16:15:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hoYlsIEzK+VgnmbwG8OG8AmrLekoks4mOKUFByrQooHT3Ak4wCVV6RqMUdCnxvRz0XsN/t5H8Ezb5RkJT0BcLDIW6XRA87gknKl/mYgo9T7fvsh3AZqc0xcDZkVLT+5mkTz8HDZE+v1bBZDMP7gBiu2QdAPUPfpKsG9AM1fjVmUgTCPIOdTZnFMgBEZXk0ygMWOmF6tWIuwOyokzXeryKvP9fZdIoZiTCn7ChWZP+5XBIcpphhr65FZl1a29Xzk/A9B3bGQNsJ0awScEoI07C0P7Bg3I90NcDY+3QcVr6iAIAebmgPy1PvTHZKdDx3DfdZgU9Aea+VuwLWe3JVShpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3b7dhh1H/pO6FsOTdXwnSF0x7I0+ijE9+z7TYwR8uQY=;
 b=dTGmu4TEnQ2PGNS7L17klL6TI4/NndzhsFDU5agDi+oD+a0UieB2nWPd9LLeE8Gse0PpY+PXXI1/9l/9ufSeHokFFlvEZ+mgMCoYHWErHcc4EK0cv6Tzpr0fe2I6fe4v0CrExkGKsekrRYIFmp2HTECipYIvjOgo5+VNodQGkNtpwNWZsle7y/SuIp1ma8zIV73xIpTsgbK8FYgJ49ISLte5nPaCiW+Dp47zzNBRo1JHwlVN5CtzCRcCED+pkkfilKrmLStKng/FWS5AYonV+/8IJBUf1sJOoPQ/9+3w9IaciWJq5h5aTmj8BYUWl8gXZReaVW6U6wL3MiVjeEXDEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3b7dhh1H/pO6FsOTdXwnSF0x7I0+ijE9+z7TYwR8uQY=;
 b=vFMshj+Dnwx+wlFCjMkis9nX/TxJzx8LaGDcyU8gJbUYGUkmMQVy9kGJMIcvj0ECrWDLyAtmW/qjPtVE59s/7y4XT8kZzLqWXTdyvKNR/nNeLXsmFA3q/SRcLPTg40XqDFbsL1fM5/SHQWcUOCECH1+uj3KyWg5KMz1dc8HddKNzC7+RpQWF8FHS0/vLu4vOCTUSaloh2l1CvFUURUqjIS0JptfrrT8zv85QR9LQwsqZXazUA0s3U9Ns0hp//5j8AsU34hFvu6Dcs828uTGtrlpIgofWJAInMXoZrOI+mPpwHpqpYY4zoAAkSf6/uhfuGhkM4m8Hv8xBZZ6hq0VFhA==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PSAPR06MB4262.apcprd06.prod.outlook.com (2603:1096:301:84::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.7; Thu, 2 Feb
 2023 05:15:16 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6064.022; Thu, 2 Feb 2023
 05:15:16 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Philipp Zabel
	<p.zabel@pengutronix.de>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 1/3] dt-bindings: i2c-ast2600: Add support for AST2600
 I2C global controller
Thread-Topic: [PATCH v4 1/3] dt-bindings: i2c-ast2600: Add support for AST2600
 I2C global controller
Thread-Index: AQHZNii2rnNDWFAQPEWeUWL84Heona67EG0AgAANEfA=
Date: Thu, 2 Feb 2023 05:15:16 +0000
Message-ID:  <SEZPR06MB5269699F950320DB7A78D7FEF2D69@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230201103359.1742140-1-ryan_chen@aspeedtech.com>
	 <20230201103359.1742140-2-ryan_chen@aspeedtech.com>
 <c227fa62c1040c7c280f1a6559dcf4cf8fb40428.camel@codeconstruct.com.au>
In-Reply-To:  <c227fa62c1040c7c280f1a6559dcf4cf8fb40428.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|PSAPR06MB4262:EE_
x-ms-office365-filtering-correlation-id: ec65b14a-1fc2-4dfd-3aaf-08db04dc78ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  dAxA8klIhHn6ONwrWUPO/u2Vq75rmFkVvKg8keLzJSEmy65ZrnFgrZbl2+cHAWO1riH8AsrTsIl/rf26Civ46VtwNvmgg55CvWvhzfusG2l3tB/ooAEeMixwf+p9kJTtUJygN6stA97NZDZ0Qym6cEogsZUVDbv9B1oDgOd9Vh7xyljQGSNzdqpD9J66d4goYAMaES5oMtUfoTVduNQcgCgHArFaF3UnqmVp8a2eeUadNfv2uCqbdL71U80nVH7FMRv4RSVOXZGSUqNadwNUt7IdYpved79v4TTcJKnN9b+0z3P6j0/FtlZcdy10k5HAIRzWJFhYN88fDvWIYFCkkdz9i3P/7ubqqKgl7RM7gETsOgKvsMVbtly/ODldu5gJycLF+MYdcOe/cR2ZY4PV2UR7GlTQcRn4+OkakJ6bfQsmltNf4DeCc2yRoqJJIKbVwL6Lp8e7chDQoGrh4mVitUVCMvBxcszLsnCIhTHDVgGs/6WDk0maQns5hHsVsPMxNkLPknK1p1OYuvjpVJZQ9BtR2x6n+XRhG7EqxEsalWSEQHJXtvVQkhU/uGDZRvHk0v0V/1YsZ77TQhYTsSoAa+lRwBmLtbAxrPOuBp8733MNphAoRa7T7d7XSS6vxY7Ug9tRauFYx8UuhM7idQGlw352GFmu2nx8wPpjkEYtcUjUbKD9xvCxkddbkmP3BUZoyDf9z6GRpQV3xRCR3wU2dOmQap2dDHkXHd2ZcEcWfY4=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39840400004)(396003)(346002)(366004)(136003)(376002)(451199018)(33656002)(7696005)(71200400001)(921005)(8676002)(316002)(110136005)(6506007)(478600001)(7416002)(4744005)(5660300002)(52536014)(2906002)(66556008)(64756008)(66446008)(66476007)(76116006)(66946007)(41300700001)(8936002)(38070700005)(55016003)(38100700002)(86362001)(122000001)(186003)(9686003)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dnBxM2NVUTFDdzJxUE8rZkFKdVNDTmR4a0tHdVNVeTlCV1U2VVQ5R0I0SWZB?=
 =?utf-8?B?QUtOOG00RTFMVFZ3OW1kYkFyM2NDcC85MEdsVHNPZGplc0ZmaUNGR2NmbVJp?=
 =?utf-8?B?VnNsbklMV0lMYmxrTmwyVWl5Ym1wVHZrNXNaM2Y4TFZGMVl2UTFmVXg2NStx?=
 =?utf-8?B?QjFxTkdsNjJ3SXQzUVYyamVoRTRUR0NNRmVlR1c5TEVGVFRnZ1hJN25RTXlM?=
 =?utf-8?B?YklrOWZYQ1dBMnlCakZOOUlzVnZXR0k5azhYTDMxdUhFMzBlWEs2bkZ1VlNY?=
 =?utf-8?B?Z0JXdWwrR2dHRTBrdE1YNGhRcDI1NW9FRHJWUWVuRGpzdTFGT25VUUIwK3E2?=
 =?utf-8?B?blpvVUJRQUVZSFJISmIyUnRmbUVRTzF2OUEvOW0rY2Jzb3dkT3hENHlyeFNM?=
 =?utf-8?B?QUx6cDFHTG9JT1JkaDE5bXZ6QWxDQkxDd004anBETU1xMkZSQnIxRnZFZlh4?=
 =?utf-8?B?ZXB3Zm54YTQ2UFJreEFCSUtTMExSTGl2UkpjU0FzS1lueEV3K2hhUENxWVNR?=
 =?utf-8?B?c2J4OU5wTmVUNTZzNHVhanVVZnpBcG1uVDNqZVNDT1BwWFlaZHl3cFlKVGJw?=
 =?utf-8?B?eWkya1ROdGEwRW4wc1orVlFOY3N0dWNHSkJvY3lHeEt2LzFRcGZtVWZuSXNh?=
 =?utf-8?B?SnAvc29PQWIyU3N3RU9kK3JKWTdlUSs4UVAwK1MrSlJ1ejZQNnU4UlM5ZGsw?=
 =?utf-8?B?ZUh3Q1pEaXM4SVBYWkdENTNCQUt5eEhNV2t1R0J0cXZpdFdUNEdnODhUWFhN?=
 =?utf-8?B?M1NpNGlLVlozeXI1WWtURjc2UldYaUtJWW05SlR4eTIxaUZpRjJRWVkzbnFi?=
 =?utf-8?B?Wm02ZUJnc3N0RHBCTHQ1ODhiVVpUeE5HNkF4ZGFod1Fobmk1czUwdTU4S2ZR?=
 =?utf-8?B?RDkrd2pJWXFSakZ4aFpsc05JOEFjVEsySSszbFRDZ045OGcrWnNYOTBrbXIx?=
 =?utf-8?B?Q1k5d0J6YkcrRkVHNFNhanBhcFc2RkFkL3U5Q1ZCT01sYVF6UWEvZGc1NGlp?=
 =?utf-8?B?L01SWktuS00ra04rREM1ZmNLb3J3UWdTVjNPRlp5OW1OdWE1Njd2dXZ4anRM?=
 =?utf-8?B?OUJyNEowc2JGaDc2Yy9RZ3crZ0E3WHRaNmtIL0tkTnVUZlBYdWgvMmRNWW12?=
 =?utf-8?B?WnlDV1ZNTEY0KzJuRml5dERhQTlLM0pVaWlPS0JGbDlsZUVNeUZPMmh3N01y?=
 =?utf-8?B?cHNLZGI4dytGZUZTcG9reXIyTHgxcWduY1JIc3JHM1F5V3p3SGwzaFMybmMr?=
 =?utf-8?B?anN1YU4xZ1BSOGpZV2U0UDJud2JBeUhQTS9jZ3dVSGpjbGtTdWVSTWpqOVM4?=
 =?utf-8?B?TWRIeUxjRlVqT3RtUjZVVGl1VUNpaE9zblVpdkZSRVN4N216NEN6c1hQd09Z?=
 =?utf-8?B?N2xUalpHTW5FdjczdENaVU5NZTRtbjZhTlhMQjJmN0lkM2JzQVo0clFFR3Q0?=
 =?utf-8?B?aXgzdXc2c0JvYWhUd2c0aVpKSWhZcWl3MTN6aUZHaFNDZHc3M2ZTTUYxc1pF?=
 =?utf-8?B?alk3dmkzUWtsdy9XZXgyWGltd2RNWmc2bVRJbWtiZTNXSnFiQjB3eTdORk9z?=
 =?utf-8?B?dWZieWJFbklWaTdUQlFTMm1DL1YvOHZGOXBWRTUyN2NWRXRCcE5mSFpkblBp?=
 =?utf-8?B?dzhjcXZxUENnQTcvcnNTRitJRVdkbUxaZmtSbjBvUjF5MGVKY2poRUVNNXgv?=
 =?utf-8?B?clNNWmk1c0F4UnVkamRIaFpScytvcGg1TURnYi9DanU5ZW5pVWZzOFE5MEFL?=
 =?utf-8?B?SGN5KzQvQTNGaTdOamkwUVJWSVA2TGNOb09uc09pNmFFVGFtR0NpNHU3R0du?=
 =?utf-8?B?WTdCMzBJNEZta0o2aFdRZmlZWndkaTRMRGNwVXJraVFHSlorak5wcWJTUk02?=
 =?utf-8?B?Z3l1MHJCZjVRTFk0NEdLVStPdmdKbHlrKyswM2xkQ1p6N1JJdTBFYS9lVlRZ?=
 =?utf-8?B?N2h4bVNNdzRMOWIzL3d6RENBS2d3T1ZzeW1MMVFiYWxkRURsS1dlVGdWMHE5?=
 =?utf-8?B?ZGNlUk9uekYwR200ZklHTFZMa09CTmlqNTdRVGd3NTRZaDdrTmhod1BsckdI?=
 =?utf-8?B?enkzQWdyR2d3bWJYZEI5QnorYlczbjJ5Zk5DS0s1RThoT2NaUXNLVTNyaG4y?=
 =?utf-8?Q?sFyPtpUTQnP3Y8WkI2NJA0NQJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec65b14a-1fc2-4dfd-3aaf-08db04dc78ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2023 05:15:16.7330
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sBY/F5uCOKZHmGv/Cf8KKb6ZzjfMSdqlaE6GuerA7se1fz6PprDcjbt/upNbCzPCu+sfXHPS6L4ODA3pMWcCQfJRJWjpLNRkQIWoSC6omJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4262
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

SGVsbG8gSmVyZW15DQo+IA0KPiA+IEFTVDI2MDAgSTJDIGdsb2JhbCByZWdpc3RlciBjb250cm9s
bGVyLCBhZGQgYmluZGluZ3MgZG9jdW1lbnQgdG8NCj4gPiBzdXBwb3J0IGRyaXZlciBvZiBpMmMg
Z2xvYmFsIHJlZ2lzdGVyIHNldC4NCj4gDQo+IFsuLi5dDQo+IA0KPiA+ICthbGxPZjoNCj4gPiAr
wqAgLSAkcmVmOiAvc2NoZW1hcy9pMmMvaTJjLWNvbnRyb2xsZXIueWFtbCMNCj4gDQo+IEFyZSB5
b3Ugc3VyZSBhYm91dCB0aGlzPyBUaGlzIHBhcnRpY3VsYXIgYmluZGluZyBkb2Vzbid0IGRlc2Ny
aWJlIHRoZSBpMmMNCj4gY29udHJvbGxlci4NCkR1ZSB0byB0aGlzIGlzIGkyYyBkcml2ZXIgZ2xv
YmFsIHJlZ2lzdGVyIHNldHRpbmcuIEkgdGhpbmsgSSB3aWxsIHJlbW92ZSB0aGlzIHJlZjoNCkJ1
dCBpbnN0ZWFkIGFkZCBkZXNjcmlwdGlvbiBmb3IgdW5kZXJzdGFuZGluZy4gSXMgaXQgb2s/DQoN
Cj4gDQo+ID4gKw0KPiA+ICtwcm9wZXJ0aWVzOg0KPiA+ICvCoCBjb21wYXRpYmxlOg0KPiA+ICvC
oMKgwqAgZW51bToNCj4gPiArwqDCoMKgwqDCoCAtIGFzcGVlZCxhc3QyNjAwLWkyYy1nbG9iYWwN
Cj4gPiArDQo+ID4gK8KgIHJlZzoNCj4gPiArwqDCoMKgIG1pbkl0ZW1zOiAxDQo+ID4gK8KgwqDC
oCBpdGVtczoNCj4gPiArwqDCoMKgwqDCoCAtIGRlc2NyaXB0aW9uOiBhZGRyZXNzIG9mZnNldCBh
bmQgcmFuZ2Ugb2YgYnVzDQo+ID4gK8KgwqDCoMKgwqAgLSBkZXNjcmlwdGlvbjogYWRkcmVzcyBv
ZmZzZXQgYW5kIHJhbmdlIG9mIGJ1cyBidWZmZXINCj4gDQo+IFNlZW1zIHRvIGJlIGEgZHVwbGlj
YXRlIGhlcmUuDQo+IA0KVGhlIHNhbWUsIHdpbGwgcmVtb3ZlIGl0ZW1zLCBrZWVwIG1pbkl0ZW1z
OjEuIA0KDQpUaGFua3MNClJ5YW4NCj4gDQo+IA0KPiBKZXJlbXkNCg==
