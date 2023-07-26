Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 119A3762B50
	for <lists+openbmc@lfdr.de>; Wed, 26 Jul 2023 08:20:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=Vfk0Eocu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9kKs6xCjz3bNm
	for <lists+openbmc@lfdr.de>; Wed, 26 Jul 2023 16:20:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=Vfk0Eocu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::71c; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2071c.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::71c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9kK709Pwz2ykT;
	Wed, 26 Jul 2023 16:20:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MDVe5dFeuOi0QYMUr5VNyhEGKKjdhLFvlNZicFyLykg7xauIuDOJCZvJ6xO7/m5p4/OnTH6f7p0e9zADJzpqAiYmBzNQaEzCSFJTzLuQEUQ9PULg4Ik/TI6cGXv8ed7M6mAZnrhRTgjvHqi1tp2grNbgPhwCb+VkfbNW+3RaKSl6Il06MyjRpzKQW6vxo1s6i2UkY7lsvGU33asSuuZlsnPBy4PnZByfGFVccD60e+p97NAYzM/IlrQdZmwBlIaL6HyjJechQsYxPllcnvoxHelNDPbzxDQ4jsSxhVkAtRnHu4ESNk65oowNU+brQkK12dVRzOPXSRZB//OYgQ94yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GsIs5BsZi+ee3Ts87uk9RnAA0BBmfu6TNA45kryVPE0=;
 b=gHPwi6taMbeic5ObVCwH5mXNouOgNGKJGO9yT6Ji/tW07GRRqDOgxILLVkgEEkDvanSYUeYzlTz9CxLJGOJhDwmVFJyd3YIExu8Gjc//NU9Mp0rBq5S490o42Z1sVKSjmUW/0U5o55shlC1DiU1jnZJcQ4UBQ9dUdf2q31XyAPjQO77DeraiEhWJCF5RAQXpiAqvQs2bCCHglmdIQwLtZCOpAFZejqBqudWrNChQHGrBO8KspDYzownK5e4nqHyQM8pyTbToymFwUYfjei3a5u8I+rD6AgeEgDFbhZLWZaH32Ountzfy5U51tkTMCEToA7W1NORBXrzemEDfZD8xkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GsIs5BsZi+ee3Ts87uk9RnAA0BBmfu6TNA45kryVPE0=;
 b=Vfk0Eocufy/EUYnvBrXn0/GV/zi/2lKQBkcXxcAv4bHWiWcLFYhLLfpVpRK5cM+WBinJCQSyHxF8siXgFFHWoh99tnQS4+++Ie3/Mcgu6sLGV4dynfxFlZL/lGag3ysEgHPfc3KWdFLgPL3frJz1s6tXwptQLJucYu2sF/BB12Y4QacCcA2lvGwznAWmJNnaKR7jKxUvqtMZVeRCJ7vjDx9QUy+nGQB3gD8lFIsZ0Ul/GXkK+13KVU/GG9E2YVIHhm6pTnZNdc8DALjGnY+86Wj8e4CxpGSX2jiV2ze3kCZhf72dMB8u6/UpHrpJdjepzdtedmxjYJAWk+SEryAOkQ==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYSPR06MB6362.apcprd06.prod.outlook.com (2603:1096:400:415::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 06:19:43 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::732f:ea1d:45a1:1e0b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::732f:ea1d:45a1:1e0b%3]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 06:19:43 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, "jk@codeconstruct.com.au"
	<jk@codeconstruct.com.au>, Brendan Higgins <brendan.higgins@linux.dev>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Joel Stanley
	<joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
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
Thread-Index: AQHZtics0zDPons9tEqiPxizT4zKAq+45uuAgAAA8zCAAA5kgIAAB7jAgBKn2rA=
Date: Wed, 26 Jul 2023 06:19:43 +0000
Message-ID:  <SEZPR06MB52697089D95E3AA9C6FCF496F200A@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230714074522.23827-1-ryan_chen@aspeedtech.com>
 <20230714074522.23827-3-ryan_chen@aspeedtech.com>
 <eda7789d-a603-d565-c9da-edfe9493a05d@linaro.org>
 <SEZPR06MB5269EB586319B3333CD96010F234A@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <674fed6f-36d6-bacb-d075-97bc355177a3@linaro.org>
 <SEZPR06MB5269568451406598F0D824F6F234A@SEZPR06MB5269.apcprd06.prod.outlook.com>
In-Reply-To:  <SEZPR06MB5269568451406598F0D824F6F234A@SEZPR06MB5269.apcprd06.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|TYSPR06MB6362:EE_
x-ms-office365-filtering-correlation-id: d4d11a01-2ac0-4449-6ec5-08db8da04d8c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Ptmg2iIS95JGQ4xFzlocB1Or9b1n0H8boVxsJJbBaGuTGDgt8tls65hkZpxcXk5dWN6Wvuk+5orD6Ac3GTprz6NGfRJQN9BEt1O2/MXiQWuYq0v4oLib9UO2WOy3JGZZgTZB/UaAUijpxm+JofXjL6lswdFZyxzK3Va4VTxtjEKx41JAKcoE88SWNH0Hew6KG7hI+r2IYI7TxLsKrwyPUVNBUHg4Ev+Ov06dRfWUtzcN/psQ9szJV9tULoBNPuCGm5wfJ+/FlwBX5XkXO+TOH8o+ZMQz6hdAymeuxpVcZJ0qtpoW9EjSJPZ5nmxfy2OKHrRXqiJ1j3kR4B7dUrkh8yWkzt9U3UHR4ejNCQMEKV5khrb0JrBHFuxYYDecwh32838au2RQ4zHp/6aFiTJ8YQCELjRzXN3Q1KwHu78TEJ+vL2rialjkm5nyhjzY32HlENReozk9j0ocApqjlAAaWcZotTzZIyqOBZQFLX0g5dVZ8T5DKGye2hKG87ed0yH7IWGPNQUmxDxtCy/rjbQrU6ajSQC/ppWMUNME2OM5QNzgf8ftJAPJMZnY2Yk1tzWhFn280h1PQwNrgbcyE3rgPb4Ms0brin7l54PnB7HalAY3SlQtqrIT5ySD4PIrC9Zh
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(136003)(39850400004)(366004)(376002)(451199021)(33656002)(6506007)(966005)(110136005)(7696005)(186003)(26005)(53546011)(478600001)(71200400001)(9686003)(2906002)(76116006)(8936002)(66446008)(66946007)(52536014)(8676002)(7416002)(5660300002)(38100700002)(122000001)(41300700001)(921005)(86362001)(38070700005)(66556008)(66476007)(316002)(64756008)(83380400001)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?OU5peFZuRkd5L1A1MXFoR0pDWWF6RUZ0ZzlxeldsaHh3RVdyZFZnbFlLUTg5?=
 =?utf-8?B?cFliUXoyMlA4L2l3QWxaV3hkaGRQeDN4Q2duZ2F1MHVNZjk1cm1NUkNjemth?=
 =?utf-8?B?bnVZVFNUblM0NGRpWnlVVUdtdzFQcER1T2N0cDc3N1NTVHNJaW41eG5Qd3pP?=
 =?utf-8?B?c2VYS08wNGtpUVJKSXNCRVNVR2pJUksrNTd2WktKWExPeWFxSXZpTFVZcHlK?=
 =?utf-8?B?Mm9nZVBvakt0QThBUEJiWHpkVlkrdE1jTnRod1dyZmVSaE42eWl4bGQ2MzBw?=
 =?utf-8?B?TFZtTGJkZXVSQVVtMjNsWkp3cXM5R0kzMHVQWThTUzRldy9wOUROL0Y5R2ps?=
 =?utf-8?B?czg4MVN1L0lRNy80VEhoUUlZK2xBY09RcU93TTJML3JFMFhkM25ub0FJcU5B?=
 =?utf-8?B?ak14TkRzNXVPamlTQlZqOVlCZXA4bjFDNkIwMDhSUU1vVlNyT2Z3NHhHN0ta?=
 =?utf-8?B?RlJCMWZ2Q3dmazFXWmdzRk1kZDFIZ1RWNnlyQXh2Q2s1d1NTek9NZFhBdFMr?=
 =?utf-8?B?eHZORmlmc3M2cTFKMTUzcmRUWkFlbWlpOHFiYmhtQk5RdE1CVDlGdVl1cjB4?=
 =?utf-8?B?SmZ6endRMHgzNnhPTlpnKzArUUl1eVl6V1J6WWZvSFk2L0R1SWF6OGdTaktv?=
 =?utf-8?B?Z3BMdEI0bFlXRHpPMk9VYm9DcnRqOXdwK29va2NKblJodGxNb25FaU5IWlVJ?=
 =?utf-8?B?eGxGK253ZURMcXQ0Mmc2Y2ZXVXVYOVdQbk9Cb1ZwOHJOR1dTNFFZdFJ6RDFL?=
 =?utf-8?B?OGF2VHBJSGxmSk1SQzNPNXdOL0dibmJSakROeUpYckZMMnk3WmNDWjdQaGZG?=
 =?utf-8?B?U1J3V1BvZC85bDdrc1VxcWdQUWpjSUJrcis4UXR5N1hxNExRZnpPS0V4enBT?=
 =?utf-8?B?V2xmNUdZWjhJYXcwOE1KV3A1eW9FT1habzBBMlhQY3NXcm04STBhVVBhMjhm?=
 =?utf-8?B?NHBnL0Z2bnRUWlNIWDN0Y2luS0g5KzRSbnI2Rmx6SFZzTzE2ZXlaWGJXSHAw?=
 =?utf-8?B?OUp3bnM5bHJ0aXJqU2k5M3MyeHdWamhRekVmTjh1NkdEczIzWXNXVWhKekVr?=
 =?utf-8?B?cXVuVGZDWFFxUTgrZjlPTDFNU3h6VUJMUlM5MkJTbmtOYVNhaTU2YlFoajk3?=
 =?utf-8?B?WHVzaFNlWTlHSjZobnZiT0tvb2tVWFVBQnlXK3FZSktyZ2lUNW1BVVNFc29u?=
 =?utf-8?B?ZHNEbjFzVFdWU1cxNGZMZ2xxL1N4dTRpUzByUGI1am0wUmUzbG5jdko1c0VM?=
 =?utf-8?B?S3RpVjZIQlcwbnlDWE02RmZ2MDNUWUk4Yk9yeVN3bC9MVlRGSE5iTWE1SEIv?=
 =?utf-8?B?N3hFMnFGUE9qdk1WVHREVFRJemMyaHBhb0FWSDVJd3VPY2VPbDFZY0hLakFt?=
 =?utf-8?B?Zkxodlg1eWtLSHYvRVRVTDRISmdhekFxc0EwMGZPRk5SbXBCNVdHWmswZXNm?=
 =?utf-8?B?MlRzUWNOUS9xYWdWWlBvYW9xcSsrTk1qRWZWaWZZLzRubzdhTUtYOGh2Qk1o?=
 =?utf-8?B?TnVlcWRjYU5tMnlxQ01pSi9GTi8xem85RXdRRHh0UHBSRW5EMVkrV3F5SFFq?=
 =?utf-8?B?aVM5bnFBTGtwZnI1RVNyK2gxMUFyTmdRblp3a3BBUnUzNVhrb3dHYU5oREY0?=
 =?utf-8?B?emU1OWVNQ2drQmRqVHlBU0UyUXRXaENZa2RjZGVHaHhFQXUzQUNzSTMzTTZt?=
 =?utf-8?B?dkhyZGlNWktxVW1wSlZXYnk3UkIyUmFTN1FRUkhOUTZveTNCUDl4aStaSmVm?=
 =?utf-8?B?eGtLYTdrSVRrdTlCejJRUSt5d2dDaE5WZ3dOZVBYYVltNUJCaDN6cVJPbE4z?=
 =?utf-8?B?clV4VTRUNnozeDlZb3lDWkVQVk9WamxTYU5ORDdPMHc0ZFRWN29YWUZ1TnpK?=
 =?utf-8?B?WkJIM2duVXJRSnVCbXlldnVCVEdTOUN5WjNrR0ZpeVNNU1psUjFGdTU1Tnpy?=
 =?utf-8?B?T0pVeFU4TWo1Tmx5aUtMZGVLTmx6YXhnYURLcVZkN2p6RS9KMkZyaUVyRWda?=
 =?utf-8?B?b1RjeDc4aGR1Nlh5Tm1xSUsreExsQW85aERMOTJ0dFFXTnF6RFhNYmEydi80?=
 =?utf-8?B?RmxPR2NQT25yN0xoY3I4N0hCMkM1bTRtM0hjV2NKR1ROT04yaTdQMDhQdUdm?=
 =?utf-8?Q?0d7xtza7q/vlIzPc403I/ewbn?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4d11a01-2ac0-4449-6ec5-08db8da04d8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 06:19:43.8111
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m/MB0p/juJe7mb4hIa3IYpeJvLMytUzs9MdBIXn6XhhgXtDLS6SbFxtTskkAL71k8kT3YALsgs04n9uI9l0cQlwlDr9VvuWailgBdK9CN/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6362
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

SGVsbG8sDQoJQWZ0ZXIgZG8gbW9yZSBzdHVkeSBhYm91dCBkZXZtX2kyY19hZGRfYWRhcHRlciwg
SSB3aWxsIHJlbW92ZSBpMmNfZGVsX2FkYXB0ZXIgaW4gZHJpdmVyIHJlbW92ZS4gVGhhbmtzIHlv
dXIgaW5wdXQuDQoNCj4gDQo+IE9uIDE0LzA3LzIwMjMgMDk6NDUsIFJ5YW4gQ2hlbiB3cm90ZToN
Cj4+IEFkZCBpMmMgbmV3IHJlZ2lzdGVyIG1vZGUgZHJpdmVyIHRvIHN1cHBvcnQgQVNUMjYwMCBp
MmMgbmV3IHJlZ2lzdGVyIA0KPj4gbW9kZS4gQVNUMjYwMCBpMmMgY29udHJvbGxlciBoYXZlIGxl
Z2FjeSBhbmQgbmV3IHJlZ2lzdGVyIG1vZGUuIFRoZSANCj4+IG5ldyByZWdpc3RlciBtb2RlIGhh
dmUgZ2xvYmFsIHJlZ2lzdGVyIHN1cHBvcnQgNCBiYXNlIGNsb2NrIGZvciBzY2wgDQo+PiBjbG9j
ayBzZWxlY3Rpb24sIGFuZCBuZXcgY2xvY2sgZGl2aWRlciBtb2RlLiBUaGUgaTJjIG5ldyByZWdp
c3RlciANCj4+IG1vZGUgaGF2ZSBzZXBhcmF0ZSByZWdpc3RlciBzZXQgdG8gY29udHJvbCBpMmMg
bWFzdGVyIGFuZCBzbGF2ZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBSeWFuIENoZW4gPHJ5YW5f
Y2hlbkBhc3BlZWR0ZWNoLmNvbT4NCj4+IC0tLQ0KPiANCj4gLi4uDQo+IA0KPj4gKwlyZXQgPSBk
ZXZtX2kyY19hZGRfYWRhcHRlcihkZXYsICZpMmNfYnVzLT5hZGFwKTsNCj4+ICsJaWYgKHJldCkN
Cj4+ICsJCXJldHVybiByZXQ7DQo+PiArDQo+PiArCXJldHVybiAwOw0KPj4gK30NCj4+ICsNCj4+
ICtzdGF0aWMgaW50IGFzdDI2MDBfaTJjX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KSB7DQo+PiArCXN0cnVjdCBhc3QyNjAwX2kyY19idXMgKmkyY19idXMgPSBwbGF0Zm9ybV9n
ZXRfZHJ2ZGF0YShwZGV2KTsNCj4+ICsNCj4+ICsJLyogRGlzYWJsZSBldmVyeXRoaW5nLiAqLw0K
Pj4gKwl3cml0ZWwoMCwgaTJjX2J1cy0+cmVnX2Jhc2UgKyBBU1QyNjAwX0kyQ0NfRlVOX0NUUkwp
Ow0KPj4gKwl3cml0ZWwoMCwgaTJjX2J1cy0+cmVnX2Jhc2UgKyBBU1QyNjAwX0kyQ01fSUVSKTsN
Cj4+ICsNCj4+ICsJaTJjX2RlbF9hZGFwdGVyKCZpMmNfYnVzLT5hZGFwKTsNCj4gDQo+PiBJIGhh
dmUgZG91YnRzIHRoYXQgeW91IHRlc3RlZCB0aGlzLiBJIHRoaW5rIHlvdSBoYXZlIGhlcmUgZG91
YmxlIGZyZWUvZGVsIG9mIHRoZSBhZGFwdGVyLg0KPiBTb3JyeSwgaSBjYW4ndCBjYXRjaCB5b3Vy
IHBvaW50IGZvciBkb3VibGUgZnJlZSB0aGUgYWRhcHRlci4NCj4gSXQgc2hvdWxkIHVzZSBpMmNf
ZGVsX2FkYXB0ZXIgaW4gZHJpdmVyIHJlbW92ZSBmdW5jdGlvbi4NCj4gQWxsIHRoZSBkcml2ZXIg
ZG9pbmcgdGhpcw0KPiBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi9tYXN0
ZXIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1uDQo+IHBjbTd4eC5jI0wyMzczDQo+IGh0dHBzOi8v
Z2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9ibG9iL21hc3Rlci9kcml2ZXJzL2kyYy9idXNzZXMv
aTJjLWENCj4gbHRlcmEuYyNMNDczDQo+IA0KPiBEbyB5b3UgbWVhbiBpdCBpcyBub3QgbmVjZXNz
YXJ5PyANCg0KPkluc3RlYWQgb2YgZ2l2aW5nIHlvdSB0aGUgZmlzaCwgSSB0aGluayBtdWNoIG1v
cmUgbGVhcm5pbmcgZXhwZXJpZW5jZSBpcyB0byB0ZWFjaCB5b3UgaG93IHRvIGZpc2guIFBsZWFz
ZSB1bmJpbmQgeW91ciBkcml2ZXIgKGVjaG8gdGhlIGRldmljZSBuYW1lIHRvIHByb3BlciB1bmJp
bmQgZmlsZSBpbiBzeXNmcykuIFRoZSBiZXN0IGlmIHlvdSBidWlsZCB5b3VyIGtlcm5lbCB3aXRo
IEtBU0FOLg0KDQpUaGFua3MsIHdpbGwgZG8gdGhpcyB0ZXN0IHdpdGggdW5iaW5kIHRvIHVuZGVy
c3RhbmQgeW91ciBwb2ludC4gDQoNCg0K
