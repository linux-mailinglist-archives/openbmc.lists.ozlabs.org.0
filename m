Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF27D5E7083
	for <lists+openbmc@lfdr.de>; Fri, 23 Sep 2022 02:09:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYXZ84dgwz3c3W
	for <lists+openbmc@lfdr.de>; Fri, 23 Sep 2022 10:09:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=a8rHwmMW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=40.107.117.111; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=a8rHwmMW;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2111.outbound.protection.outlook.com [40.107.117.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYXYT0R5lz2ywY;
	Fri, 23 Sep 2022 10:08:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HzyCqzKY+4w076pfwC/2euMyr9pYKivL4Fa3ilW6yNCYSb+T6TvO62N1+5L6urMoLABnNBFF3RnsxyIiwqvXYvG9dPszVsHDSRDTJkjo++VNUfITRwhbpcEcr2ZAnV2WIpXWe3MkIFp534VpcCgsDPkwIx33tU9g5y+meU90A5JK+UzauLIMjfP4PjIEdqwxU+KgA8KvVrRCdISA/tN9Tmk+DZaTuo87q2vU11x4wLPjbyIdtR2X/JZNg4BRhyI7WAPWJV5NyegPxqTB6lzvBQs8SXeg+tv1VBUnSHChS4rTtG3ohWnJrJfLwYsOmygfuMUqYi8JZJK+fwB2fxhgUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZK4Ko/DoywjxvVj+lSkA5JJETN0urQdyGXUdxOdPBA=;
 b=C7pADFxRhpMsspw4rua3M6lAJUDqdHM7mgemhilPdKFByOFrDiSK6tKCmHdujNmsbJMCiQuzqSuOuT74EnfSbq6w18cN4zrxhf70re4cx+13Ja6lTliyGLhMTwpLDsVcmDIZ4hYICL+BGpzKiE00VyZceZacToXlr/E7fyYJZIwc+opERl5X1fXt4ZP00f9cJD0lOFExqAzVdWqEM0EfhwoyLejiZDz8KO7dtsTm0xp3OzTkdDmH853MtH0yN5I8ahn5uGo0r/XP9iANXYhJ71btp/dtxBwkPYl5tc0P8axx3R+rcsw1qpuUikENDi4k+w5BxU0HqhHHmRaLGs1BHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZK4Ko/DoywjxvVj+lSkA5JJETN0urQdyGXUdxOdPBA=;
 b=a8rHwmMWurNe0ZpRspvKaUorQVpJU3FTlmvUlzhhwPPxswamRlpHMdg0fs26DP6qnG5roY7Q/YiRzngJwdXS4EIySub2j5u3W8W9uh+a4IpvA63rvm9eSrPTsy8kdx6rBE0wVFpOkcOn7+3s4hqGZq/8s1qkKPlZy41f8Guz9MD8pygPl7N5PvlAU3uolGJ7ELVs7NNLKC9NfPc9Ru5zHs52iaFx1GrDc0fnmayzGW3nl4Grtsv1ZNlEJQyUcp9sMBqs7HlYR0yCKBaqYxhyl8XQcV6salRtVKfX4TE8tg9ZB7zm8oXDltft5V0ooF0dxOzsojsDKwUSj3teN+/6gg==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by SI2PR06MB5161.apcprd06.prod.outlook.com (2603:1096:4:1ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14; Fri, 23 Sep
 2022 00:08:07 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::b70:5d66:bdf1:ff47]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::b70:5d66:bdf1:ff47%7]) with mapi id 15.20.5654.019; Fri, 23 Sep 2022
 00:08:07 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: "minyard@acm.org" <minyard@acm.org>
Subject: RE: [PATCH] ipmi: kcs: aspeed: Update port address comments
Thread-Topic: [PATCH] ipmi: kcs: aspeed: Update port address comments
Thread-Index: AQHYzJVUtbRY+/SRCUqfvaXOF1k3N63r0TSAgABVS9A=
Date: Fri, 23 Sep 2022 00:08:07 +0000
Message-ID:  <HK0PR06MB37794D51E9DB4A864249F96691519@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20220920020333.601-1-chiawei_wang@aspeedtech.com>
 <YyywI8265vECnEHv@minyard.net>
In-Reply-To: <YyywI8265vECnEHv@minyard.net>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: HK0PR06MB3779:EE_|SI2PR06MB5161:EE_
x-ms-office365-filtering-correlation-id: 487dca59-d019-4bc9-ebb8-08da9cf7b153
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  kg5jgopkZj84crKGQhvPXwNwo9iKTpdHd5RGvt08w+Tid5i76ay0XUmeArxfYCA52hlaALsVxPIBEf6Y+PPjMs5/45++LoAV+0nsgTX7L1Pxrm+1RBykc3vcodBvbhv4AcxkTyPvzvgcbyDDibZ8bEB7XJpg3rUYEZGlLgfj26d1GJuu3BYJS9EFdh0bdEIVVOZGUXSe+Y8pw/AmLjS82gES8g2yc/GbRc+L+okEk2HNvnpD0AEQJEj+R88RlZuQ04aXY8JTWkSgj1Q2Z4mmT0MFvv6girDlv/uEs3qg6In0Rd2TjGShPOvqeMM72IFQhgUB1tqA4JMVX9ltATkL0au8FnGc3kgV05I6Ptv6pqPgd7gjpAtBi0ftSydmJe3flO57HuXPDJbyu0ich7U+SUXSKoVkEJO482bR6YkeZcsdwHw/JALjcGRVGkeU9zr4RqiN0DHkM3skyczZBzd/qspRkzg07xfPUYTp/pguNYBYhpw8neKmZL8Q9WLQRqhH4SqOgPz+qe8EW9kUOmaItU+bcv97Pp3l1FMerwFxgoRG4mEE9qsWKi3Lk49ESWiwcEDT+6GfXlpmRTzbyN9APK8vGBxGbAMnB7yEVU4KWvVY8QS8uQJbPYYkuwC/h7RPNx9ztN+c4HgpKe9VOVhqJDF2F3ly6pZSG1TbhTkLpYYwV90uDGf3QzgED62xH5bBxUvphclQ1xQ6c9r2BSdIm/O8M89bpOAPKixJAFI3MebOL31ae+DJ6+VVUrPL5DtXptyQ9KeJ7CApM+HunNbYeg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR06MB3779.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(396003)(376002)(39840400004)(346002)(366004)(451199015)(55016003)(26005)(71200400001)(8936002)(5660300002)(9686003)(6506007)(7696005)(6916009)(54906003)(186003)(8676002)(38070700005)(76116006)(2906002)(86362001)(52536014)(66556008)(64756008)(66946007)(66446008)(66476007)(41300700001)(316002)(15650500001)(83380400001)(122000001)(38100700002)(33656002)(478600001)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SlhIWml4RXdHZHNDc09wODBralFsRjBIc2FQeisyNzhxVnFSOTNKaHdibEFI?=
 =?utf-8?B?SXNGdXppUnBwb1lvWGVMK1JYVGttUUM5b0dMZm10ZGZTbHg1SlR1STlmVnVV?=
 =?utf-8?B?UTdhdGdMdGNSN1hrMTEyeVRzR0xkVWQ1cjdZS21YZEZNSVJaano0b1h4Unls?=
 =?utf-8?B?cFdMUCtJSzRuQzUrN2syZjNZVjJ3OC9XaXlsUDRkbkRscHduNEMwdllnSDZF?=
 =?utf-8?B?OXBuVTZteFFuTFdGeUUvR2R1Z2M1SGZIQys0c2J3QmQyVVVjVFlOS3JSRnM0?=
 =?utf-8?B?M1krWjdWanIxZ0lvTmlGYVdRd3pNNmc1SHAwNWJhVUVHV01NeDAvUmhJclFP?=
 =?utf-8?B?L1J1WVhtSXRoTGtNS3JMcHA4Qm8zYzBHZk40YmpkUUNkTzROQjZEZkpQVy9X?=
 =?utf-8?B?SHFoQmN3b3g1dkVrVVFoMmY4Y29rTWRHV2tOT0JtRmZRMWxJRWJuam02VzRr?=
 =?utf-8?B?cHNGYmM4SVAvY2NlQXNqZlVyNGlYamVCUW1zUUJpL1h2bjdXNlovWnpIRU5o?=
 =?utf-8?B?bTV5VmFjcGhaZXNZSUtBb09DbDh0TmgvNkgweGEyZ0Zsb1M3R2g3VmZHSTNH?=
 =?utf-8?B?MDBpYW5YZXFXUkdPNSs4azdUZjkwRlJzdHZ5OUxHODlpOFFCZGdGam4wQndo?=
 =?utf-8?B?emVzWDN2TitGZWkzTUxiNy9hRktLV0Q4bkRGdmFhb2VzRm9leHNpZFZ4akpR?=
 =?utf-8?B?WC9yNnlGMlhpdzV0ZW9KdlBZQ0FhWENZK1h1MzVNMk95ZzE0Y2FkOUhNMWNS?=
 =?utf-8?B?Z3ArOWVqdEhUZlJ3ZWVQTmJpUEQzdHhxUnRZcDVCamhVekhidDB1dXpSRGpp?=
 =?utf-8?B?VFNwMXVST3lhRGJwbHdmV3dqVU1raGZFR3I5SnoybkFOWllIQW9SZUFPU1Ji?=
 =?utf-8?B?U2ZmREF1N1B0K0V6QzV6bFRMQWJmSklkM0hWaTV5c1Z2S2hHeG9jTVdGNTlm?=
 =?utf-8?B?M1A2ZDIzenhKQlVaN2hhSmUwSitSQngxcE1taHZ0cldYcUVENGRPM1oydUhj?=
 =?utf-8?B?TGNYRFJFOE9BSWd5SFhPblhjQm43K1djeFB0Uy9QQmJwWldTSkNqNjArZXVh?=
 =?utf-8?B?QSsrNnA2ekV6eC93TEtYRDIvSi9IUU1IRk1IVTNTTG5KZlJXNWJPeC9vL0lH?=
 =?utf-8?B?VFo5QWlBR3lwN0ZYUWNGWnNUOExtSE9kQmk1bklvcGNJNnY5YjRqbEFISnJa?=
 =?utf-8?B?MXBGdHVtNjVncENQM0tIMUlWZnk0UmZQdGdmUlNkYlJ1UTAxQnV1d0RUZU9s?=
 =?utf-8?B?TzJmdkw0ZWxJQURIU2l5MWRtTXZYWWUxdWJXNmZkcGhIdUtIM0hDSE84czBK?=
 =?utf-8?B?alVxaHkrSlowbDNZSVNoc2dBQWx6Z2doTE5oL3JqNUFmS2dtd0xHZjNxeU83?=
 =?utf-8?B?Z2dBQk4zdVFpaSszdHZIQXIvOTVIMElleXBscUFhQWFvd1phSEE1bFlNSUc0?=
 =?utf-8?B?Tzg5M0FYdmQ1Mjg2SlhERFVDUkFBQ3lKTlpGN3JzMmJkNzFjZXlnR2cwZ1E1?=
 =?utf-8?B?aVpxZ0NoWmJQaFFMWk8zMVJaMllkeE1aK1ZVNDl1ekZCbGxlSUNtWVBhZ09k?=
 =?utf-8?B?dlM5Zk1mVUJSRC80Mm1MT2Q1UFBrMnkyY0E5V3BhbXpmWU1OUUNNWnVQY3Bq?=
 =?utf-8?B?U2xDaE82STB5K2xJNnlWTU9YbzdvWVhaK2FIN0xOYnRsOHdrS1Y1bkNxQ1lp?=
 =?utf-8?B?R0pURE5DV0JYcHZ5SlRZYU02WG0rRnVZQnkwM0dBdGE3cWt0UEZCdk9jVktH?=
 =?utf-8?B?OTFvRWdLUEhMZnVxSERwb2lXS1lRMVMyNi81WnhJNzRHamozY3R5S1BGVENv?=
 =?utf-8?B?NWF0c21CZ2pLdFpKdUJVRGRSR2lTR2N0YXY1RFFhZWJyT1Z6Z2lJZW1lZUhi?=
 =?utf-8?B?Si8xNGI3dncrYjVsODZzUG9ZU0k1aUNRS0VkUWliSGdYM1VJREEyQXFHN0FL?=
 =?utf-8?B?SzdWd2RGbnJReWo2MW80NHA2UTB5TUxHMGtnRWp6UXY3VTFUTjRIZWhtZ2hn?=
 =?utf-8?B?cW91ZkdPK3RLd1duK1g1M2pSdkFaWEYrZ1k5L3Z6Q1ZoWEV5MThOenMxYm84?=
 =?utf-8?B?SWQ0ODBjV0JhRGZIdjVPSmcrb0p6UXpoV0xSOTkxNitCZHk2WVJ4bEgzYktN?=
 =?utf-8?B?S291ekI3eG5JSFhYenhvZi9WTUFTMlgyUGY1Q2xpZi9XMDVmV2k2akNzZmFN?=
 =?utf-8?B?anc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 487dca59-d019-4bc9-ebb8-08da9cf7b153
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2022 00:08:07.1643
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 98Jh43N6qjm3Mx7m8BRu8AvzEArEdT6H5LYUEl3ixPneWU6MmYJCQiXxrA4+XRSd29JhQ9AV8I5/ozDasJS1Xv+GpJspB88HDAY3AUm1PJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5161
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "andrew@aj.id.au" <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "openipmi-developer@lists.sourceforge.net" <openipmi-developer@lists.sourceforge.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQ29yZXksDQoNCj4gRnJvbTogQ29yZXkgTWlueWFyZCA8dGNtaW55YXJkQGdtYWlsLmNvbT4g
T24gQmVoYWxmIE9mIENvcmV5IE1pbnlhcmQNCj4gU2VudDogRnJpZGF5LCBTZXB0ZW1iZXIgMjMs
IDIwMjIgMjo1OCBBTQ0KPiANCj4gT24gVHVlLCBTZXAgMjAsIDIwMjIgYXQgMTA6MDM6MzNBTSAr
MDgwMCwgQ2hpYS1XZWkgV2FuZyB3cm90ZToNCj4gPiBSZW1vdmUgQVNUX3Vzckd1aWRlX0tDUy5w
ZGYgYXMgaXQgaXMgbm8gbG9uZ2VyIG1haW50YWluZWQuDQo+IA0KPiBFdmVuIGlmIGl0J3Mgbm8g
bG9uZ2VyIG1haW50YWluZWQsIGlzIGl0IHVzZWZ1bD8gIEl0IHNlZW1zIGJldHRlciB0byBsZWF2
ZSBpbg0KPiB1c2VmdWwgZG9jdW1lbnRhdGlvbiB1bmxlc3MgaXQgaGFzIGJlZW4gcmVwbGFjZWQg
d2l0aCBzb21ldGhpbmcgZWxzZS4NCg0KVGhpcyBkb2N1bWVudCBoYXMgbm8gcGVybWVhbnQgcHVi
bGljIGxpbmsgdG8gYWNjZXNzLg0KQXNwZWVkIGhhcyBkcm9wcGVkIHRoaXMgZmlsZSBidXQgd2Ug
a2VlcCByZWNlaXZpbmcgY3VzdG9tZXIgcmVxdWVzdCBhc2tpbmcgZm9yIHRoaXMgZG9jdW1lbnQu
DQpUaGUgbW9zdCBpbXBvcnRhbnQgcGFydCByZWdhcmRpbmcgS0NTIHBvcnQgcnVsZSBpcyBzdGls
bCBrZXB0IGluIHRoZSB1cGRhdGVkIGNvbW1lbnQuDQoNClJlZ2FyZHMsDQpDaGlhd2VpDQoNCj4g
DQo+IA0KPiA+DQo+ID4gQWRkIG1vcmUgZGVzY3JpcHRpb25zIGFzIHRoZSBkcml2ZXIgbm93IHN1
cHBvcnRzIHRoZSBJL08gYWRkcmVzcw0KPiA+IGNvbmZpZ3VyYXRpb25zIGZvciBib3RoIHRoZSBL
Q1MgRGF0YSBhbmQgQ21kL1N0YXR1cyBpbnRlcmZhY2UNCj4gPiByZWdpc3RlcnMuDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBDaGlhLVdlaSBXYW5nIDxjaGlhd2VpX3dhbmdAYXNwZWVkdGVjaC5j
b20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvY2hhci9pcG1pL2tjc19ibWNfYXNwZWVkLmMgfCAy
OSArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTgg
aW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9jaGFyL2lwbWkva2NzX2JtY19hc3BlZWQuYw0KPiA+IGIvZHJpdmVycy9jaGFyL2lwbWkv
a2NzX2JtY19hc3BlZWQuYw0KPiA+IGluZGV4IGNkYzg4Y2RlMWU5YS4uMTljMzJiZjUwZTBlIDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvY2hhci9pcG1pL2tjc19ibWNfYXNwZWVkLmMNCj4gPiAr
KysgYi9kcml2ZXJzL2NoYXIvaXBtaS9rY3NfYm1jX2FzcGVlZC5jDQo+ID4gQEAgLTIwNywxNyAr
MjA3LDI0IEBAIHN0YXRpYyB2b2lkIGFzcGVlZF9rY3NfdXBkYXRlYihzdHJ1Y3QNCj4gPiBrY3Nf
Ym1jX2RldmljZSAqa2NzX2JtYywgdTMyIHJlZywgdTggbWFzaywgIH0NCj4gPg0KPiA+ICAvKg0K
PiA+IC0gKiBBU1RfdXNyR3VpZGVfS0NTLnBkZg0KPiA+IC0gKiAyLiBCYWNrZ3JvdW5kOg0KPiA+
IC0gKiAgIHdlIG5vdGUgRCBmb3IgRGF0YSwgYW5kIEMgZm9yIENtZC9TdGF0dXMsIGRlZmF1bHQg
cnVsZXMgYXJlDQo+ID4gLSAqICAgICBBLiBLQ1MxIC8gS0NTMiAoIEQgLyBDOlggLyBYKzQgKQ0K
PiA+IC0gKiAgICAgICAgRCAvIEMgOiBDQTBoIC8gQ0E0aA0KPiA+IC0gKiAgICAgICAgRCAvIEMg
OiBDQThoIC8gQ0FDaA0KPiA+IC0gKiAgICAgQi4gS0NTMyAoIEQgLyBDOlhYMmggLyBYWDNoICkN
Cj4gPiAtICogICAgICAgIEQgLyBDIDogQ0EyaCAvIENBM2gNCj4gPiAtICogICAgICAgIEQgLyBD
IDogQ0IyaCAvIENCM2gNCj4gPiAtICogICAgIEMuIEtDUzQNCj4gPiAtICogICAgICAgIEQgLyBD
IDogQ0E0aCAvIENBNWgNCj4gPiArICogV2Ugbm90ZSBEIGZvciBEYXRhLCBhbmQgQyBmb3IgQ21k
L1N0YXR1cywgZGVmYXVsdCBydWxlcyBhcmUNCj4gPiArICoNCj4gPiArICogMS4gT25seSB0aGUg
RCBhZGRyZXNzIGlzIGdpdmVuOg0KPiA+ICsgKiAgIEEuIEtDUzEvS0NTMiAoRC9DOiBYL1grNCkN
Cj4gPiArICogICAgICBEL0M6IENBMGgvQ0E0aA0KPiA+ICsgKiAgICAgIEQvQzogQ0E4aC9DQUNo
DQo+ID4gKyAqICAgQi4gS0NTMyAoRC9DOiBYWDIvWFgzaCkNCj4gPiArICogICAgICBEL0M6IENB
MmgvQ0EzaA0KPiA+ICsgKiAgIEMuIEtDUzQgKEQvQzogWC9YKzEpDQo+ID4gKyAqICAgICAgRC9D
OiBDQTRoL0NBNWgNCj4gPiArICoNCj4gPiArICogMi4gQm90aCB0aGUgRC9DIGFkZHJlc3NlcyBh
cmUgZ2l2ZW46DQo+ID4gKyAqICAgQS4gS0NTMS9LQ1MyL0tDUzQgKEQvQzogWC9ZKQ0KPiA+ICsg
KiAgICAgIEQvQzogQ0EwaC9DQTFoDQo+ID4gKyAqICAgICAgRC9DOiBDQThoL0NBOWgNCj4gPiAr
ICogICAgICBEL0M6IENBNGgvQ0E1aA0KPiA+ICsgKiAgIEIuIEtDUzMgKEQvQzogWFgyL1hYM2gp
DQo+ID4gKyAqICAgICAgRC9DOiBDQTJoL0NBM2gNCj4gPiAgICovDQo+ID4gIHN0YXRpYyBpbnQg
YXNwZWVkX2tjc19zZXRfYWRkcmVzcyhzdHJ1Y3Qga2NzX2JtY19kZXZpY2UgKmtjc19ibWMsIHUz
Mg0KPiA+IGFkZHJzWzJdLCBpbnQgbnJfYWRkcnMpICB7DQo+ID4gLS0NCj4gPiAyLjI1LjENCj4g
Pg0K
