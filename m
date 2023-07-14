Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12051753669
	for <lists+openbmc@lfdr.de>; Fri, 14 Jul 2023 11:27:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=JX7JmL7l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2R324yhRz3c5s
	for <lists+openbmc@lfdr.de>; Fri, 14 Jul 2023 19:27:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=JX7JmL7l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::731; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20731.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::731])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2R2G6jPHz3bqw;
	Fri, 14 Jul 2023 19:26:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dp0JBMFDTwBD/AqiGmOxDeMGyDVjJeTp3Bcet0WCm6CsipmHGd63n175f/vVYBVWC2S1n/pP1lO5mEJyP1iCTNcwMpr+lC9Eg3rEWK7ib7qDWmx4TxHUl2D4dAyPbaTkWzWxztZaXcKSDQQLggoqD+V3rZrmwdRrC6jQtyUFSedRli4ChEFb+WQMv6OvIXui40nOGXJqiwFQAsbNd8fNt447QwAUMqvc1MlgR+qt0mVkdkEsMMnuVWAMfYjd+qGGW0LrIISrf0VSdB1KyHgPkOjoXLVt4dUzpDJPqcteLtiUzwEQ6YgWOPVP5k4S5iBPaKYUMHuYAIpyg9kxhH4SMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSGh02aTUdcKqbyeu4ILMV6UvQSrnLTPguNRKtTQ4AM=;
 b=BLwXXJPosZsMMu2Lz/JTNELJ9C0ll5lHkIX3Y/a37TZcuURVYFwxsIKql9MTpu9bUyDwkaFYYRsQyebbGZw/0UN8ZsR8perVKCQLplAIMo3WIRD5SDMh3KSnqKVBp6WPvsQ3JLqTl/VonjtvMf1B5aNF9C6gTjLCkOW28LMgQEcsH9GCmlJSmIWS86hMEUw0NyiPR1mUb2kkxk0f9zDbh2Ndc2qr4mKQorHE9nH4VsJwlueOQ82IwrqlB/dlSM6lrImOdw9m5mEUTyNSvxDASK/NlmSq0/uF4NBXJ/lEbsTZ36VBjZjorNAJpOP+L5c4/57gzfqOzV4YdfElJ+lYEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSGh02aTUdcKqbyeu4ILMV6UvQSrnLTPguNRKtTQ4AM=;
 b=JX7JmL7lwer9dSeU1/9DS6Hr7ze/2K6O/Qv5jPBYPEyzj0sSqJT/1HoH2ih0GvvC0pETsHISdGLvBarcQ9XKfiuUD99bdvzpoDd7Vu+l3qrdk8SSu77YU/4HgaziAGJ9Ol+GYENjJk7IfYll/fBKw1AQ7Ej0xobuLYeBfhHDx4Iha0mkWGAj4bRH6/1C6l92OkVfSS0P/GHn6Svm2s6hV36cWAI83ZIcPlkOGV7SGxeYS/EYJlHiio8Dwjud1ipG558LjwaUyAoomMUL095ZDQtFJPfxd4PlQlU54QqXqs5b3YyaKvmq2iwN49BHgBipy/4zXTixPuv3CMgsEpCMvA==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB6567.apcprd06.prod.outlook.com (2603:1096:400:465::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 09:26:36 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Fri, 14 Jul 2023
 09:26:36 +0000
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
Thread-Index: AQHZtics0zDPons9tEqiPxizT4zKAq+45uuAgAAA8zCAAA5kgIAAB7jA
Date: Fri, 14 Jul 2023 09:26:36 +0000
Message-ID:  <SEZPR06MB5269568451406598F0D824F6F234A@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230714074522.23827-1-ryan_chen@aspeedtech.com>
 <20230714074522.23827-3-ryan_chen@aspeedtech.com>
 <eda7789d-a603-d565-c9da-edfe9493a05d@linaro.org>
 <SEZPR06MB5269EB586319B3333CD96010F234A@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <674fed6f-36d6-bacb-d075-97bc355177a3@linaro.org>
In-Reply-To: <674fed6f-36d6-bacb-d075-97bc355177a3@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|TYZPR06MB6567:EE_
x-ms-office365-filtering-correlation-id: 394b6adc-b829-4c06-b36c-08db844c6bb9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  o9Kf/QfNlJvWdo2aU/q7WiqURN6WudWdS5BEvtcg6mMmYv+shr0dmplydosmovV8Jf5TrbH6kSS6wi6PXt6D+o+L5jdzs/BAg1fH6aJdQBw7l64o1o4tbBMFHZf4hmgo6CfyqADEK/ImV6d0ntot0RjWqLO5o75KNixsTR+8mAAQNuQ3HGrRYDowvdJMlpvcDvMmUaxOLVT3Hn6JvpxHIdiKkLPwamJXiyyNNXXvPrknkMuqAA2sgYWJKHX/zA1vpxhYLRFItuq1EB5bQLxQ8F5j9AO+hqd2I9u0HWe9LXVauKBu4m1UYMJgalqcwJS5e1Yzd1QnzrU72HrX44T3k90MFq75871DEZQf6KnQSXIaECf+LyNYmJBkcSmRzPKUJyba9x8Wa9Amd4tF7wPHYMM9tON6YJjKeabiJspdkaQpWj5gTked3kceF/vrhFGSjxdMVwkVzZJHBZBr5e8uXRJCPTxS5w8I/Afi7k/s2ojrn00uQp1rueYHhflm21alYJNy72Fum2strx+zQddSbZU2Y9BXZOMf7sxYrLK+CX6s8XA1aY/FZyg+RxUtK8PBm9jnyg93bOvDfCdunJIKB/iDdpIjz5F63qwIqb9Fyaxhf98E7Gzqifm8kGjaa1Lt
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(396003)(376002)(346002)(39840400004)(451199021)(110136005)(41300700001)(55016003)(64756008)(7416002)(66476007)(66446008)(76116006)(66946007)(66556008)(478600001)(5660300002)(52536014)(8936002)(2906002)(8676002)(316002)(71200400001)(7696005)(966005)(86362001)(921005)(26005)(9686003)(6506007)(53546011)(186003)(83380400001)(33656002)(38070700005)(38100700002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?M052RDVrd0dndVFjY0N1ckI5NlQ0L1RQUlRNZEtGdklmUGZPVlFpR3JkTkNr?=
 =?utf-8?B?MlRTVUZVRHlYZUZTU1Y1Vk8vQWdwT3BybDJBZWxaTXdNamVOWnZRcHNDSlpN?=
 =?utf-8?B?c3d1RUlUNFlxTGJObTQwUHVWSk9VbHRIOGN6KzJoVGtROXcyVmdkdnIzRm1s?=
 =?utf-8?B?UzNHNkk1VTd1b2NKaHpYNmVCZFpabmhvM1hnamlGVlFnVk9PSUJ0WFNFNFJQ?=
 =?utf-8?B?aW5PZXo0eThSTVRKbFJYdUVNNVUzNHM2TEdrZEZjSFcwSnVKbmdJTkt2UWNv?=
 =?utf-8?B?bVpsVWZKYmltZG9qKzZ2SlJOWUpvZjloRW9pTGtjMTJvazdvRFJxbTFRWDdP?=
 =?utf-8?B?NFlEM1NNeWlSMHBoVW91NjR0TFo5ajd5QVlUWXZDME1jZXF0alVxVTVjTk9n?=
 =?utf-8?B?UGNIc2tKMkFGUEdNVUROU2cvNnppZUl4dHZ0MXdqcHdMRlNJSHZrbVBKRHJm?=
 =?utf-8?B?OHRObTNrWEs0M1Vqb2dkeTk3eWZ5YzkrOXFGQkxlZTZkQXY5ZHBXdzhOVEo3?=
 =?utf-8?B?SjcvV3Z3MTZtNExXV2d6QkU5Ny9MWitTZ1B6ZEFmZFlCT21qSDJGM1BmNVpi?=
 =?utf-8?B?c014dVFMU1ZPQUpkaWFFMm5CbUZSRWNNYW00QVBuYkVQVXVQY1JLUXFsY01K?=
 =?utf-8?B?M1JSOURBVnd6ejJUclFESDZQMFFpb1BCYThjMk1HWXkyZXZhaHRlaGJhUVpy?=
 =?utf-8?B?MmYyeGtWTm9sTmxNTmhLRWEzOVIzdFJxbHVNVThPbVpzMmlsTURMamtLT2cr?=
 =?utf-8?B?M0duSDA0M1dYaUdHNE8wSVZyZko0THJ1UHd2bngvUC8vcXc2ZWplcUZXMkxX?=
 =?utf-8?B?WGJQVXR1eDF1eS82SmlKbmJpTUhrY0NzY2NnWXFoNTVEQmU0dmZ2VHE5aUNZ?=
 =?utf-8?B?b1A4a0lqRmUxVVY0dkZsRC85SlJCKzEwaTg2cm9ZWVJudkZSVTc3VkNhU1d2?=
 =?utf-8?B?Zkt1L1pWUTQ3a00zanIwMElzUUxnZExZVHBrRlVYemtjM0VzU09LdFlSSDcr?=
 =?utf-8?B?VFNDMkl0WElsdHBwdjNpTnAydG1LNTVpUnJpR3ptejVPY3JXMU9iV1c0N1g4?=
 =?utf-8?B?SlZBc2RwalJEYXJoVEp0NnZ6SGF4dWNmeDZhVXY0MGdrMTFkWEpsQ054RFYx?=
 =?utf-8?B?Ri9GeWNFUHQ2YTJJbjlqUlBRb3p5VTR1aC9xWkFMYnRma3JpdW1yVEE3R1FP?=
 =?utf-8?B?QzRWajgyVG1XSTdrK0pPVEVTTk9pRFdYdkw3dFlXQ0ZiaGNheFFURmNxd3ZP?=
 =?utf-8?B?SlBqNThYWW1aakp1bHMybHN3QVJyODgxdTRaVzB6VFo3ZFIxM3prZGtkdXA1?=
 =?utf-8?B?SkFoNkZZVnlONDFuSWJDZGhqSHczRHQ2WjcxTTgvT3JtS1Nnd3o2cDBjWVFG?=
 =?utf-8?B?elk0SGNYb09IOFlWbGdlVyswVlVmYkZOY0ozNWZhaW1PZnFCUHoyRHVhdlBa?=
 =?utf-8?B?ZHFzdzBYWlREejkrZU1UYWVmTmkrSk5qYXlNNyt0UXhmSWhFQjhiSXYzTUhI?=
 =?utf-8?B?WVMyK3JxazFHR3dxdnE5RGZydy9LQkpyZHdpeU5PWmxJcUIzZjYxNE1XRS9v?=
 =?utf-8?B?U2pzN0FHeTN1SDVEd0M1NXBRTHI1VisvTURhNlRQbkNXaWttZm1NUmdPdmJU?=
 =?utf-8?B?Qy8yVHVTOVF3cXd5L0VNNDdqQ1AwVmhZTUU4MEJscXl0U1IrVFdSaXRaRWN3?=
 =?utf-8?B?SmI5NkZJQXJPWG44cXB1V0RyRXVuakxNc3c1eTlEd09ET05EZjhhZHNuaTZh?=
 =?utf-8?B?WFdwU3FROGlWVTZYZ3llNTRIajgwY3AvcnQzZy9aWmRJTUo1aDVmY2hXM0R5?=
 =?utf-8?B?bitnbFNjbDJIRmdjRnhTZW1FK1FsenptMXQxNVdETGdhMjh6eDdMb2xacFEw?=
 =?utf-8?B?ajd0d0V2RW9sRU0xUk42dmkwVXFxaERORWtSTkg2VUNqNnNFdVVVSkFham9U?=
 =?utf-8?B?MDdNUURHZU1EeGtFS0JneHdqL1JiZ1N1L0YxVUljdGR6S2JYb25qbFFlTlNT?=
 =?utf-8?B?eWdHenFMQnFKakRWRnpwK1U4dmp4ZTc3TTVvTTl3NTltY0tSN3hJN3prSEVH?=
 =?utf-8?B?ZDFpZWpBYU80VW9qNktwMk45amdkeXFPcm1oVHBWOGVmT1duU1JSeE1OUGY5?=
 =?utf-8?Q?AJQPzg6Me5jttJqU4QUDqwylL?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 394b6adc-b829-4c06-b36c-08db844c6bb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2023 09:26:36.2622
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fK8dZF95SKhUpWn5KygCfrna7fEZOa4X0Y4JYTC78jDC6BUeZkyGQ/gnUmpbHfLMbuV05RWRdQ+Og+CZT6SOpvNc9h65qXnc2mSB3+T8rnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6567
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

SGVsbG8sDQo+IA0KPiBPbiAxNC8wNy8yMDIzIDA5OjQ1LCBSeWFuIENoZW4gd3JvdGU6DQo+PiBB
ZGQgaTJjIG5ldyByZWdpc3RlciBtb2RlIGRyaXZlciB0byBzdXBwb3J0IEFTVDI2MDAgaTJjIG5l
dyByZWdpc3RlciANCj4+IG1vZGUuIEFTVDI2MDAgaTJjIGNvbnRyb2xsZXIgaGF2ZSBsZWdhY3kg
YW5kIG5ldyByZWdpc3RlciBtb2RlLiBUaGUgDQo+PiBuZXcgcmVnaXN0ZXIgbW9kZSBoYXZlIGds
b2JhbCByZWdpc3RlciBzdXBwb3J0IDQgYmFzZSBjbG9jayBmb3Igc2NsIA0KPj4gY2xvY2sgc2Vs
ZWN0aW9uLCBhbmQgbmV3IGNsb2NrIGRpdmlkZXIgbW9kZS4gVGhlIGkyYyBuZXcgcmVnaXN0ZXIg
DQo+PiBtb2RlIGhhdmUgc2VwYXJhdGUgcmVnaXN0ZXIgc2V0IHRvIGNvbnRyb2wgaTJjIG1hc3Rl
ciBhbmQgc2xhdmUuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogUnlhbiBDaGVuIDxyeWFuX2NoZW5A
YXNwZWVkdGVjaC5jb20+DQo+PiAtLS0NCj4gDQo+IC4uLg0KPiANCj4+ICsJcmV0ID0gZGV2bV9p
MmNfYWRkX2FkYXB0ZXIoZGV2LCAmaTJjX2J1cy0+YWRhcCk7DQo+PiArCWlmIChyZXQpDQo+PiAr
CQlyZXR1cm4gcmV0Ow0KPj4gKw0KPj4gKwlyZXR1cm4gMDsNCj4+ICt9DQo+PiArDQo+PiArc3Rh
dGljIGludCBhc3QyNjAwX2kyY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikg
ew0KPj4gKwlzdHJ1Y3QgYXN0MjYwMF9pMmNfYnVzICppMmNfYnVzID0gcGxhdGZvcm1fZ2V0X2Ry
dmRhdGEocGRldik7DQo+PiArDQo+PiArCS8qIERpc2FibGUgZXZlcnl0aGluZy4gKi8NCj4+ICsJ
d3JpdGVsKDAsIGkyY19idXMtPnJlZ19iYXNlICsgQVNUMjYwMF9JMkNDX0ZVTl9DVFJMKTsNCj4+
ICsJd3JpdGVsKDAsIGkyY19idXMtPnJlZ19iYXNlICsgQVNUMjYwMF9JMkNNX0lFUik7DQo+PiAr
DQo+PiArCWkyY19kZWxfYWRhcHRlcigmaTJjX2J1cy0+YWRhcCk7DQo+IA0KPj4gSSBoYXZlIGRv
dWJ0cyB0aGF0IHlvdSB0ZXN0ZWQgdGhpcy4gSSB0aGluayB5b3UgaGF2ZSBoZXJlIGRvdWJsZSBm
cmVlL2RlbCBvZiB0aGUgYWRhcHRlci4NCj4gU29ycnksIGkgY2FuJ3QgY2F0Y2ggeW91ciBwb2lu
dCBmb3IgZG91YmxlIGZyZWUgdGhlIGFkYXB0ZXIuDQo+IEl0IHNob3VsZCB1c2UgaTJjX2RlbF9h
ZGFwdGVyIGluIGRyaXZlciByZW1vdmUgZnVuY3Rpb24uDQo+IEFsbCB0aGUgZHJpdmVyIGRvaW5n
IHRoaXMNCj4gaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvbWFzdGVyL2Ry
aXZlcnMvaTJjL2J1c3Nlcy9pMmMtbg0KPiBwY203eHguYyNMMjM3Mw0KPiBodHRwczovL2dpdGh1
Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi9tYXN0ZXIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1h
DQo+IGx0ZXJhLmMjTDQ3Mw0KPiANCj4gRG8geW91IG1lYW4gaXQgaXMgbm90IG5lY2Vzc2FyeT8g
DQoNCj5JbnN0ZWFkIG9mIGdpdmluZyB5b3UgdGhlIGZpc2gsIEkgdGhpbmsgbXVjaCBtb3JlIGxl
YXJuaW5nIGV4cGVyaWVuY2UgaXMgdG8gdGVhY2ggeW91IGhvdyB0byBmaXNoLiBQbGVhc2UgdW5i
aW5kIHlvdXIgZHJpdmVyIChlY2hvIHRoZSBkZXZpY2UgbmFtZSB0byBwcm9wZXIgdW5iaW5kIGZp
bGUgaW4gc3lzZnMpLiBUaGUgYmVzdCBpZiB5b3UgYnVpbGQgeW91ciBrZXJuZWwgd2l0aCBLQVNB
Ti4NCg0KVGhhbmtzLCB3aWxsIGRvIHRoaXMgdGVzdCB3aXRoIHVuYmluZCB0byB1bmRlcnN0YW5k
IHlvdXIgcG9pbnQuIA0KDQoNCg==
