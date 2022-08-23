Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE7759DAC3
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 12:52:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBmJR3NN3z302S
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 20:52:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=cNgFXXqL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=40.107.215.90; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=cNgFXXqL;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2090.outbound.protection.outlook.com [40.107.215.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBmHn3zd8z2xHZ;
	Tue, 23 Aug 2022 20:51:32 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mdIhdSeMGNrot9ti0YIWwzbf6JGqKL+U3YMLDzCzUXtuuYvX/ZrtEx0dhCvUCRaXVwx6Xb4yblS5uk2x+yXUypJFXox2ZKB18+houzBntf/lod0w3PlzVUp621z1DZcWlh8ofn/pl7WUeUOccynZqYUQTb1x1eie0TlTW8uELi66JUl2FkyRwArlQ3yUBXAatPLyvvB30S8G8lk6dMNoe7yAV3knHBg4iMY/m/LLhD6N30A4aLAhbGCgDMKa6FLiWAefmhD8OT0xnO28g0CSUdzzK+y/TvDydka5v8VEDyjTpcAbhrThYe2R2yHEMqSlK143Gh+AWcXaJF1hSVAS5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0tBTscm7B2P/a/HXRXfxDrTcbxpY682HMc59Gmf6xo=;
 b=cdvakdyjM6pkkCUwxDLGfM5fnFpkLuAzVLH23VpmVPh4LcwSzJhUzs8RVrkSXI0iZUkrRVn49/oFk5Xi3szLeuPMoUmbLsIMTM/JrOjyAE99z05Th1F0QbVnNL8TP37NNmbgyXPjn4O5IuazSWfPwrDjFRW4DkOIMcK7tjZOdg0r/CkihcM1ZSMnuZ4oqa9vPIZtrYWI3cYy24avzKZCmUB4rwU/YL26HWArUf2TFNQMgOISeHzndyLTfyVBKc5pZz3o6rk1AKDZ/KGEUhq6/QnzN4LzcM66/omw57/khD/LSlVBbyzqVvpvD9KQaGyFUc0/AS+xFhr/GTATkHuEbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+0tBTscm7B2P/a/HXRXfxDrTcbxpY682HMc59Gmf6xo=;
 b=cNgFXXqLUszrXkvm0VSWFRE8itcK4qzL1jTY8OuRIwg0Epdn4dBYGMelyaNraanf4WO5MdieTDCqxHaj+VuOmfe7R3ZP24aOco/p1iEpXuC8eij1qdpD6nKYqtGpwEZbTw/PmuQofd0rlBKbOfRpLGgsv/utkW7jN4cRC/eYnmdXWvJ+S3l2vmDRC/yKdP5gfJK+woXfrJUcqo+s30XKZvIWtKBRQ2ZA+sdHSUAbkbXVS6Ev2LTfVqmi+c4r6lM1K6YSYCvZSY+Oz9m2+vTXoldDgFJQRPOvzchSH6ogu5EZUtPR7gjRr3THpA99MknSNEwbCIaGDYk5AcV3ExZoGQ==
Received: from HK0PR06MB3362.apcprd06.prod.outlook.com (2603:1096:203:8b::10)
 by KL1PR0601MB3815.apcprd06.prod.outlook.com (2603:1096:820:12::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Tue, 23 Aug
 2022 10:51:09 +0000
Received: from HK0PR06MB3362.apcprd06.prod.outlook.com
 ([fe80::1e4:b2f:63aa:f13a]) by HK0PR06MB3362.apcprd06.prod.outlook.com
 ([fe80::1e4:b2f:63aa:f13a%5]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 10:51:09 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>, Linus Walleij
	<linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: aspeed: Force to disable the function's signal
Thread-Topic: [PATCH] pinctrl: aspeed: Force to disable the function's signal
Thread-Index: AQHYsuvzkjoYSzUxXU2X67Lbv+RM5a21YrCAgAVbXgA=
Date: Tue, 23 Aug 2022 10:51:09 +0000
Message-ID: <E0E8F46E-145A-4180-8AAA-788150F0C44A@aspeedtech.com>
References: <20220818101839.28860-1-billy_tsai@aspeedtech.com>
 <6845561a-cb33-4939-a760-2a5722134851@www.fastmail.com>
In-Reply-To: <6845561a-cb33-4939-a760-2a5722134851@www.fastmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.64.22081401
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 854f57d5-b0ed-49bd-1894-08da84f56339
x-ms-traffictypediagnostic: KL1PR0601MB3815:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  t0x67X2n/ySOkcuiOsrxT52iZOCAFmjtAk/WLYKmI31LS/HXpQXTrkZLnUHF/laZez1qENSJ9QPotnbXq9WYMeSHjskD3swlAPt54NJLTFAoqJxfcxQZfmIJLF9ReipukSs3tB7XpyqHWQCdN90tH2gTG5XCMB1RpOoBerlQ/szjly3cB2foEfW8z2yL7zCxt+5vSh91jvAX9H1gh7UYYbOTogwfaG6OYIaMYw3JiVsWm1UP3/tsB4XeaLjE8gGnUsgIcA/LPvxJft0HH2It5nfM61BxOwcrCBN/D6TL1c8wZjVfEp0mfV2v79BLZ4dBwWvdvAF3Xs9aBPy3egx76koWlJ4zEt6HV58ro1MmI1WDgCQtgKhVvjmnPGm8htlGE1nwYbL1GULBtuFOs0gDRaj5ZQjC9RWxgKoLhepieFbbqhqXw1Dt0BNeZkueZgBRaKwtLYKL3Ryzuc0g2VaQ4WcOnB0jfvntzV/OsKowD6VAZAA0tuBR250ZnDP8+4cfdmZuSfVH4jhtSFrQfZejSb8zskFbn/TtVEVP/7D9pyKcQAOuLJVxP2o6jnwY0LZ2FulWuq1+teqhY7VzSTG/q55P/9LS1SNtoz/liuf5IrSbNe7WbQq53nkoQeMgO5/aZRruxgEsnijIJmnFZyk0Hb0wpG2bWoMZxSzDm9LFkLDq0RRbzjBM7BDDNRLTf7KbcGPDqa30fN49pDPK4AbRIAFPZ0/p4g7U2+mOYUE1Gw1R/zSKLoFOFv1pU1Fv/WFpt36w62H9EoyBqerTu4+rwuNRebiEo4YzUtUXf23JUFw=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR06MB3362.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(346002)(366004)(136003)(39850400004)(91956017)(38070700005)(33656002)(64756008)(8676002)(66446008)(478600001)(66556008)(66476007)(76116006)(66946007)(2906002)(41300700001)(53546011)(6486002)(6512007)(2616005)(26005)(86362001)(186003)(5660300002)(8936002)(110136005)(316002)(6506007)(36756003)(122000001)(38100700002)(71200400001)(83380400001)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?QnNDdFRZSXhKdEV1MzVITE9nckhwdlJhNm9uMFpPcUYzZzEvV2s2MytCTGgz?=
 =?utf-8?B?MHFYdG9RWHpNeFUvVXlSQVV6VDhsTVBGR3lreVZTK25yMHBOR091SXJ0OXFz?=
 =?utf-8?B?OUFpT3pRNG56MzhyN1RhRFMwbUM1b2R0U1R0Wkh4YjBTUndxeENzQkZsQVBM?=
 =?utf-8?B?NngzZVJTWTM0ditXNGVCeFNZbFdSdURlUTAweXBqM1RYWjE1UFJ0QkxIMWJn?=
 =?utf-8?B?aWQ3TitwSjF2eGhydDBnWXp0Z3lLODBHUktzcmRQaThBZVY5Z2pBUEVwTU8x?=
 =?utf-8?B?WVhRWUdTT3ErT2I1VEQ0UHRIMlJUa3RRZllSSHdPVFhFV0RwK2ZqekNEb1FJ?=
 =?utf-8?B?TWpEc1JTNEs2RnZjUzJXUkdnOTRGd2dWS1dTYXovK3NLMXpHQTZhMk9VS1Nl?=
 =?utf-8?B?NVdKdGJKZWNnbGVnRTIyMGlJaFRmaEY1Mnk1RjNIZmtVVmFPSHZwb2NUaWRj?=
 =?utf-8?B?U25oaXVzTEd4WHlmVXc3K2ZaejI5VTM0QjBoeVpsYnpjcTE2MWdYeTl2TG9I?=
 =?utf-8?B?bjNCNDRTZElnNUl2emVyRm4wMENrVHllUmtoNHl1RjhsanN1Zlh6cmRSOE95?=
 =?utf-8?B?Ulh3aEZaMlBkb2F4dzg0OTduQXVJdGVXZDFuUU9DdXZxbjVrNU9Rd0JpUVBN?=
 =?utf-8?B?Nzd2OW9hTDdNVXh5aGJMTG4zR2o1ZWQwTlFhcVl4YlVmVC9JKzVubUI2NTFZ?=
 =?utf-8?B?UzNVUFMrYzk4Z1ZhUU13UHdwRVJtZHZ4bDhOejlmTWVmQ1NBUU1YU2liODRI?=
 =?utf-8?B?SmhZV3dGRmlhckN6NUVuU2NBMXZnMVdUTGloK21xcTBkVzRQaVNhZjExcTNs?=
 =?utf-8?B?cGxXeXZnV3dXUndYNU8rbmlCVHMwc2dicGdMVUJSOFFUWVU4QlJHclRxNzNp?=
 =?utf-8?B?WHVaSWJIR2VaL1NIM1pjUDBRWCtRMHRXNDA3NWlQN1cyMmhQRUdZbXlkQ2w0?=
 =?utf-8?B?cmp4ZmpaYXVqT1FzMUZxb2s0VHQzVWpYQmZzNkRYY1ZKclhybWJFVzJkbDN3?=
 =?utf-8?B?ZXNtYld3L01lNjR0WFJzeU1MdFFaV3k4ZGY5VzJDRzFpTjEzTW12NjBaVW4v?=
 =?utf-8?B?TXlHZEdzZzYzeU9yRk9LQ0x5TldMT2dETE1vSGN1MTFCaFFVYXdaRE9tREE1?=
 =?utf-8?B?cm01NEh6QWhudng1TmF4ckdyc1hWdVVsK3Q0dUNONklTbEptcFliajNDV2pI?=
 =?utf-8?B?YVl5eXFVbzBtcHl4YUZOT3lUcmNHRjQzM0RkMVBRZWNrQzM0QVZLKy95Zkwr?=
 =?utf-8?B?K0dteWNsWk9KM2p2OStKdmhVeitYZXhIRGpWVlV0aENueUVXNW0ybnBTaEhF?=
 =?utf-8?B?MksxVENOQVU1eWdpY3VZNnhCbmNiTW5zalJXak9yeHJtcXRJRGNQY0NaaldV?=
 =?utf-8?B?d1R6TzRKSS9udXB6WmZ6VnFYQkt3RzJiUlBjSmd0Q2M3QzZUazBvdEdUZWlK?=
 =?utf-8?B?UzVDYVdxQ2lrbTVjelpTb0RqbjlEQTBvamQzWDlmRDZJd3lnWjVGOXd2T1Bl?=
 =?utf-8?B?MVhsNlFleURSYUtxbUJHQkxkZmIraExOc3pkNzVhMTNDcEgzSnpuVkV0Z2c1?=
 =?utf-8?B?NGNHV3B1NGxwZDN5aVI5Wk85ckNjb1dRN1FhMlVQTTdwVDlDMUdiMEJ0NmxI?=
 =?utf-8?B?QUdNYWtlYjAzU0pkWVZkaWV5K3dRdGhIOHZSdktJT3FPWWordDRPeC91N3hT?=
 =?utf-8?B?eG1zZ2lNcWRHMWJHcUp3d21kc3FFbTBwNDVSRGtjZ0dHVDlMRHhWUFJlYk0w?=
 =?utf-8?B?MjV3akRtZkVmakZEMHhsVFRtMXIwaFIzU3VhR0w5M3pTTXl5RUF1N0JzU1dP?=
 =?utf-8?B?b0M5WXF0TFRxUE1hVWJ6TW0vNmRmZ0NrTWthZ1hWQUN0SG53bldRRWJmMkFt?=
 =?utf-8?B?S3dESTZNM0lacURobjZDSUo1dkNjblhvVWt5cGw5cTlkbk1BZEVWZ1pIU2sz?=
 =?utf-8?B?N2g5UEZocjMxMitLeno1clJ1U0hpSVc4NmkyRVkxU0l4Y0gyZ1dyRThRS1Zt?=
 =?utf-8?B?MGM0dkJpVXBmNnBETXR1YXdHSlhJcUNpSGovbWovZkM0a3dQTGFvaGJVb2l2?=
 =?utf-8?B?d1pBaUdhdVl1cDQ5R2lHc3VVL1c0ZEdnWFJ5ckZoWVA5TE9ISStsV0pnRXBI?=
 =?utf-8?B?WmRlU3JjWHAyU1JnTzJoLzIyMWVtdk5lelZIS2hlbnE3Wk1taDVyRmNBb0Q4?=
 =?utf-8?B?dlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F4BC43796E8D59499B37BF659A3E9526@apcprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3362.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 854f57d5-b0ed-49bd-1894-08da84f56339
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2022 10:51:09.2417
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uXEIvCNc4lG7bY7HTUsJ0CX/bw6pRhTpJyOsM8/QheGrS0xLpHi3HDqLhop39Q9UGuoe9nfMwCNJrOqZbhstxK+0rLriOx4tqfvxeGJwM4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3815
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

DQpIaSBBbmRyZXcsDQoNCk9uIDIwMjIvOC8xOSwgODo0MCBBTSwgIkFuZHJldyBKZWZmZXJ5IiA8
YW5kcmV3QGFqLmlkLmF1PiB3cm90ZToNCg0KICAgID4gSGkgQmlsbHksDQoNCiAgICBPbiBUaHUs
IDE4IEF1ZyAyMDIyLCBhdCAxOTo0OCwgQmlsbHkgVHNhaSB3cm90ZToNCiAgICA+ID4gV2hlbiB0
aGUgZHJpdmVyIHdhbnQgdG8gZGlzYWJsZSB0aGUgc2lnbmFsIG9mIHRoZSBmdW5jdGlvbiwgaXQg
ZG9lc24ndA0KICAgID4gPiBuZWVkIHRvIHF1ZXJ5IHRoZSBzdGF0ZSBvZiB0aGUgbXV4IGZ1bmN0
aW9uJ3Mgc2lnbmFsIG9uIGEgcGluLiBUaGUNCiAgICA+ID4gY29uZGl0aW9uIGJlbG93IHdpbGwg
bWlzcyB0aGUgZGlzYWJsZSBvZiB0aGUgc2lnbmFsOg0KICAgID4gPiBCYWxsIHwgRGVmYXVsdCB8
IFAwIFNpZ25hbCB8IFAwIEV4cHJlc3Npb24gICAgICAgICAgICAgICB8IE90aGVyDQogICAgPiA+
IC0tLS0tKy0tLS0tLS0tLSstLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LSstLS0tLS0tLS0tDQogICAgPiA+ICBFMjEgICBHUElPRzAgICAgU0QyQ0xLICAgICAgU0NVNEI0
WzE2XT0xICYgU0NVNDUwWzFdPTEgICAgR1BJT0cwDQogICAgPiA+IC0tLS0tKy0tLS0tLS0tLSst
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tDQogICAg
PiA+ICBCMjIgICBHUElPRzEgICAgU0QyQ01EICAgICAgU0NVNEI0WzE3XT0xICYgU0NVNDUwWzFd
PTEgICAgR1BJT0cxDQogICAgPiA+IC0tLS0tKy0tLS0tLS0tLSstLS0tLS0tLS0tLSstLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tDQogICAgPiA+IEFzc3VtZSB0aGUgcmVn
aXN0ZXIgc3RhdHVzIGxpa2UgYmVsb3c6DQogICAgPiA+IFNDVTRCNFsxNl0gPT0gMSAmIFNDVTRC
NFsxN10gPT0gMSAmIFNDVTQ1MFsxXT09MQ0KICAgID4gPiBBZnRlciB0aGUgZHJpdmVyIHNldCB0
aGUgQmFsbCBFMjEgdG8gdGhlIEdQSU9HMDoNCiAgICA+ID4gU0NVNEI0WzE2XSA9PSAwICYgU0NV
NEI0WzE3XSA9PSAxICYgU0NVNDUwWzFdPT0wDQogICAgPiA+IFdoZW4gdGhlIGRyaXZlciB3YW50
IHRvIHNldCB0aGUgQmFsbCBCMjIgdG8gdGhlIEdQSU9HMSwgdGhlIGNvbmRpdGlvbiBvZg0KICAg
ID4gPiB0aGUgU0QyQ01EIHdpbGwgYmUgZmFsc2UgY2F1c2luZyBTQ1U0QjRbMTddIG5vdCB0byBi
ZSBjbGVhcmVkLg0KICAgID4gPg0KICAgID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWxseSBUc2FpIDxi
aWxseV90c2FpQGFzcGVlZHRlY2guY29tPg0KICAgID4gPiAtLS0NCiAgICA+ID4gIGRyaXZlcnMv
cGluY3RybC9hc3BlZWQvcGluY3RybC1hc3BlZWQuYyB8IDExICstLS0tLS0tLS0tDQogICAgPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEwIGRlbGV0aW9ucygtKQ0KICAgID4g
Pg0KICAgID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL2FzcGVlZC9waW5jdHJsLWFz
cGVlZC5jIA0KICAgID4gPiBiL2RyaXZlcnMvcGluY3RybC9hc3BlZWQvcGluY3RybC1hc3BlZWQu
Yw0KICAgID4gPiBpbmRleCA4M2Q0N2ZmMWNlYTguLmEzMDkxMmE5MmYwNSAxMDA2NDQNCiAgICA+
ID4gLS0tIGEvZHJpdmVycy9waW5jdHJsL2FzcGVlZC9waW5jdHJsLWFzcGVlZC5jDQogICAgPiA+
ICsrKyBiL2RyaXZlcnMvcGluY3RybC9hc3BlZWQvcGluY3RybC1hc3BlZWQuYw0KICAgID4gPiBA
QCAtOTIsMTkgKzkyLDEwIEBAIHN0YXRpYyBpbnQgYXNwZWVkX3NpZ19leHByX2VuYWJsZShzdHJ1
Y3QgDQogICAgPiA+IGFzcGVlZF9waW5tdXhfZGF0YSAqY3R4LA0KICAgID4gPiAgc3RhdGljIGlu
dCBhc3BlZWRfc2lnX2V4cHJfZGlzYWJsZShzdHJ1Y3QgYXNwZWVkX3Bpbm11eF9kYXRhICpjdHgs
DQogICAgPiA+ICAJCQkJICAgY29uc3Qgc3RydWN0IGFzcGVlZF9zaWdfZXhwciAqZXhwcikNCiAg
ICA+ID4gIHsNCiAgICA+ID4gLQlpbnQgcmV0Ow0KICAgID4gPiAtDQogICAgPiA+ICAJcHJfZGVi
dWcoIkRpc2FibGluZyBzaWduYWwgJXMgZm9yICVzXG4iLCBleHByLT5zaWduYWwsDQogICAgPiA+
ICAJCSBleHByLT5mdW5jdGlvbik7DQogICAgPiA+IA0KICAgID4gPiAtCXJldCA9IGFzcGVlZF9z
aWdfZXhwcl9ldmFsKGN0eCwgZXhwciwgdHJ1ZSk7DQogICAgPiA+IC0JaWYgKHJldCA8IDApDQog
ICAgPiA+IC0JCXJldHVybiByZXQ7DQogICAgPiA+IC0NCiAgICA+ID4gLQlpZiAocmV0KQ0KICAg
ID4gPiAtCQlyZXR1cm4gYXNwZWVkX3NpZ19leHByX3NldChjdHgsIGV4cHIsIGZhbHNlKTsNCiAg
ICA+ID4gLQ0KICAgID4gPiAtCXJldHVybiAwOw0KICAgID4gPiArCXJldHVybiBhc3BlZWRfc2ln
X2V4cHJfc2V0KGN0eCwgZXhwciwgZmFsc2UpOw0KDQogICAgPiBPa2F5LCBtYXliZSBJIHdhcyBz
aG9ydC1jaXJjdWl0aW5nIHRoaW5ncyBpbiBhIHdheSB0aGF0IHdhc24ndCBxdWl0ZSANCiAgICA+
IHJpZ2h0LiBIb3dldmVyLCBJJ20gYSBsaXR0bGUgbmVydm91cyB0aGF0IHdlJ2xsIGVuZCB1cCB3
aGFja2luZyBzdGF0ZSANCiAgICA+IHRoYXQgd2UgY2FuJ3QgcmVzdG9yZSBhbmQgZ2l2ZSBvdXJz
ZWx2ZXMgbXV4LXJlcXVlc3Qgb3JkZXJpbmcgcHJvYmxlbXMuIA0KICAgID4gVGhlIEFzcGVlZCBw
aW4gY29udHJvbGxlcnMgYXJlIHN1Y2ggYSBjb21wbGV4IHNlYSBvZiBzdGF0ZS4gSG9wZWZ1bGx5
IA0KICAgID4gd2UgZ2V0IGF3YXkgd2l0aG91dCBuZWVkaW5nIHRvIGZpeCB0aGUgdGhlb3J5IGJl
aGluZCB0aGUgZHJpdmVyJ3MgDQogICAgPiBpbXBsZW1lbnRhdGlvbi4NCg0KICAgID4gVGhpcyBj
b2RlIGlzIGNvbW1vbiB0byB0aGUgMjQwMCwgMjUwMCBhbmQgMjYwMCwgaGF2ZSB5b3UgdGVzdGVk
IHRoZSANCiAgICA+IHBhdGNoIG9uIHBsYXRmb3JtcyBmb3IgZWFjaCB0byBnZXQgY292ZXJhZ2Ug
Zm9yIHRoZSB2YXJpb3VzIHBpbiBzdGF0ZSANCiAgICA+IGV4cHJlc3Npb25zIHdlIGhhdmU/DQoN
CkkgdGhpbmsgdGhhdCB3ZSBqdXN0IG5lZWQgdG8gbWFrZSBzdXJlIHRoYXQgdGhlIGxvZ2ljIG9m
IHRoZSBkcml2ZXIgaXMgdGhlIHNhbWUgYXMgdGhlIEFzcGVlZA0KRGF0YXNoZWV0IHRhYmxlIDUu
MSA9PiBSZXZlcnQgYWxsIHNldHRpbmdzIG9mIHRoZSBoaWdoZXIgcHJpb3JpdHkgZnVuY3Rpb24g
YW5kIGFwcGx5IHRoZQ0KdGhlIHNldHRpbmcgb2YgdGhlIGN1cnJlbnQgZnVuY3Rpb24sIHRoZW4g
dGhlIHBpbm11eCB3aWxsIGJlbG9uZyB0byB0aGF0IGZ1bmN0aW9uLg0KSSBoYXZlIGNvbmZpcm1l
ZCB0aGUgZGVzaWduIGxvZ2ljIHdpdGggb3VyIGRlc2lnbmVyIGFuZCBpdCBjYW4gYWRhcHQgdG8g
MjQwMCBhbmQgMjUwMC4NClRoaXMgY29uY2VwdCBhbHNvIGNvdmVycyB0aGUgb3JpZ2luYWwgZHJp
dmVyIGxvZ2ljIHdoaWNoIGludmFsaWRhdGVzIHRoZSBjb25kaXRpb24gb2YgdGhlIGhpZ2hlcg0K
cHJpb3JpdHkgZnVuY3Rpb24uDQoNCiAgICA+IEkgYWxzbyB3b25kZXIgaWYgd2UgY2FuIHdyaXRl
IGt1bml0IHRlc3RzIHRvIGJ1aWxkIHNvbWUgY29uZmlkZW5jZSB3aXRoIA0KICAgID4gdGhlIGV4
cGVjdGVkIFNDVSBiaXQgc3RhdGUgcGF0dGVybnMgZm9yIGEgZ2l2ZW4gc2V0IG9mIGRlc2lyZWQg
bXV4IA0KICAgID4gc3RhdGVzLiBJcyB0aGlzIHNvbWV0aGluZyB5b3UndmUgbG9va2VkIGF0IChp
dCB3b3VsZCBiZSBoYW5keSBpZiBrdW5pdCANCiAgICA+IGNhbiBpbnRlcmNlcHQgcmVnbWFwIGFj
Y2Vzc2VzKT8NCg0KSSBkaWRuJ3QgbG9vayBhdCBpdC4NCg0KQmlsbHkNCg0KICAgID4gQW5kcmV3
DQoNCg0K
