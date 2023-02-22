Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D697A69ED2D
	for <lists+openbmc@lfdr.de>; Wed, 22 Feb 2023 04:00:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PM19k3Xpcz3byZ
	for <lists+openbmc@lfdr.de>; Wed, 22 Feb 2023 14:00:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=OyBFXdAs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::72c; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=OyBFXdAs;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2072c.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::72c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PM18y67Kgz2x9T;
	Wed, 22 Feb 2023 13:59:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VtrNo1QpCmnVVuZLmktBZ0uqGHmON693EDz6j6BWnpasjWyH8qE/76v6keM+VHIoXWfLC1OEfdPSnxjjN16GF372IvDKjt7NS5OFd4y6GO04bUff9zHyQ/+H2NNLh23DMmoUZEbbzhNImDx9PL4OZLOcho6FTHbD8bQoDg1BS1asqz4sWm8poi9bLqBb7XORYHuzI6TWKfm63jYYklV4PhcWPErgZMd41Y8mWAIj5Azp7yHIkeIWKUctaoJ+yDlQsClrsSKZQ4W5FZfz/S7IwpWdI3NJ0n7Ym5u9yxaZ4P3S4UWKmN1OYaDoT8wGI94i33+iNiur1ykIqLGryN6Eeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4TWG24QAS1TELxRFwXaThxcwhNMjVSOF62WRy4bBps=;
 b=ATxwTvD+/sZtWkRiaMFbKSP6NfYvbknapozdSI02Qhc2eUuojE85XPGntE5J8NX17nKmJ8YuF8Uk91joMmbR7TfVQ054qDvEtt45+DHyhXsG+SSRbdi3UAg+n9XwZ98EuFj4pUa/RS5iF2j9LUDNk1JzrjhDHUTPfiTLX0a5AZcYG10gqMRLGK1Jlzez1+W5K4jkxyFV1N+FdONhp6XoEd2WAYm9Ri8QSjxDYSav9dB6nkqaGQsSFygk5Nulc/F8XPQa48ZaAGx3J/A+UBFmi0H09mekfyxLxDHBNp6c6SWTk9S3TS5BN/odNnxw/G9gL6CUX/sShg2/ZI8aKOG4jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4TWG24QAS1TELxRFwXaThxcwhNMjVSOF62WRy4bBps=;
 b=OyBFXdAsSX8ZP+Fao2LiQ+5urW9k249owWpJOqtvN+LRaV/GIZCzqkig4szsCmBNX+/b2TeG8kWvjRsS0RZOHG5HY/hTnCilnx82vugCnGa9XVnQjFF1lxwfk+gUw8hPtcsn4qCnjkRbTuUxY4YK8AZiYWao77Vdc8cTrAIcyxf6SK2XrErETwSY3ef9toNqqaMTvNay1ojC8JVSqhff2TRq41pTkGosjh9aG9Vic+9g/ylnnPjf69TJz0fM5ZCchFngVsH6PQbtXy66M9HivgjJZ1AWaduv69Bb6l6giXgyUoloyj2uTaQJ1BeGntqCvrG+AHrogWJx6gaULg9oSg==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB4078.apcprd06.prod.outlook.com (2603:1096:400:4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.14; Wed, 22 Feb
 2023 02:59:26 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6111.010; Wed, 22 Feb 2023
 02:59:26 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@aj.id.au>, Philipp Zabel <p.zabel@pengutronix.de>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 1/2] dt-bindings: i2c: Add support for ASPEED i2Cv2
Thread-Topic: [PATCH v5 1/2] dt-bindings: i2c: Add support for ASPEED i2Cv2
Thread-Index:  AQHZRPMR/TOuXj0GdEGWPZ2JFslGsK7Xgo8AgAEkZWCAAIA2gIAABk2QgAARNgCAAQdUEA==
Date: Wed, 22 Feb 2023 02:59:26 +0000
Message-ID:  <SEZPR06MB52698CCA6AE59DDC6C15CBE4F2AA9@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230220061745.1973981-1-ryan_chen@aspeedtech.com>
 <20230220061745.1973981-2-ryan_chen@aspeedtech.com>
 <676c7777-635c-cc1f-b919-d33e84a45442@linaro.org>
 <TYZPR06MB527427ADCCD29DFD77FB0EE3F2A59@TYZPR06MB5274.apcprd06.prod.outlook.com>
 <80d873d4-d813-6c25-8f47-f5ff9af718ec@linaro.org>
 <SEZPR06MB5269502D7CBCD5698B65FF9FF2A59@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <c0ac0ab3-87fc-e74a-b4e2-3cf1b3a8a5e2@linaro.org>
In-Reply-To: <c0ac0ab3-87fc-e74a-b4e2-3cf1b3a8a5e2@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|TYZPR06MB4078:EE_
x-ms-office365-filtering-correlation-id: 1dadd538-4c9b-466d-b6e2-08db1480cf02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  kGyoScTqXUsqOi1+MJ3Q7vFgPb11dpwS442NeJvWIXDjOM9pdO2Tkns1wRQoK4jY3ygPZR//xH8QJtjD/tYUHswf8w4CbNfrfe7OG5Y3zU+IXuJkSBM93MB7XDRaHfW3xNzoemhLtqaeEwlqiD7AswyJpk7lqHHln41gJrKsbZISRO6CMoEd93fmzFloJgTgfdxCnyrt7G/VJyHgRV3M6bhWEMrQCa1mza0M31o3sdUax+gi0rpnKB6Im2l8DVn5a+2WA8PkdTaGTAhngLujR9AgmpIF8tO+Lo5eeIKbfdXphi8jyh1RYGJjehvhOdBN/Tvoz4o5nH4njqMygZaAYUku3XCs+6Uy+pA1Du9UDQ5SrdT8ODMnoUfN8pPrJMVvfutW+jd5v7rCg2X6klU6GLxxnlq46hscP/k5L2/uHlZshDd233HxcJ3PQNF7fgrkyW7tumDkKA4mny1yyGhr55+fXAHwoOnoFpR9WyVj/FkPZsM59LFhOE8yLk169TezbUr17vcNjhBEneO7v4ExHlgIyRp7cMJDvlONfLn15LaZLMJQNW2tXRlnAsfE3tVq8D2+81qDKTBnJ215rInhUrEi1W0WTiQt68ksyqwzs+2fA8/FvO8aq9yUqloprAwYTidgWRrcFLYs6ir1b4sp47fFSxTLLeEC2v1HtQ8LKWhfXHAeuILZJ1ypZbGlaq5dg8bKTeHjUyvViwwoJLARarqDjW3ZVZW0O4ZS3gEH8gA=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(136003)(39840400004)(366004)(396003)(376002)(451199018)(8936002)(7416002)(5660300002)(38070700005)(41300700001)(53546011)(52536014)(55016003)(83380400001)(38100700002)(2906002)(122000001)(9686003)(71200400001)(316002)(86362001)(110136005)(7696005)(33656002)(478600001)(921005)(76116006)(64756008)(186003)(66446008)(6506007)(66476007)(26005)(8676002)(66556008)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?N0ZPdjR1SmUxTDhhOHY2a1RPcC9HbGRyNWxwcUU2ZG9qWjNZdlYzeXRVZEVO?=
 =?utf-8?B?N216SlVVbGMvODViSGtieGttUFhCVzRlcFFwdFMyVDMyOXdTWWhzam52MXY1?=
 =?utf-8?B?d1c3TlIrc09VU3JSNDNEbGZUZEFCT3R0UFgwTVZ5dVFyZjFEWDBoYWFhK1dq?=
 =?utf-8?B?bHMwOUlkR1Y5TklGUnVWT2FrWko3TEpFYk9nZmt0S1FXZFQydnp0QVA4c2Fj?=
 =?utf-8?B?LzhPR29obnZJUk82RW5lMGlRSWt3b1d6aXowV1NsbTRLeFJFTlZhejdBUjNs?=
 =?utf-8?B?U3lrSW9aQkk1dVJXWVY0cEo2b3drZEdKbzRLdzNPOU95ejdieU4rYnh0RVZY?=
 =?utf-8?B?WVpDZlM0YlpjckUvQlVkUjk1SDIva1FpejFzenppU3pNaTJreHh2VzdnVHNP?=
 =?utf-8?B?SVZwTjZ2ZGYxT0l6M0NKMnREd09VMStBTW5zZlF6QVg0V3VwcTFSVUlkYkdO?=
 =?utf-8?B?V3F1cXF3WmcvVTVOZU9UbzVyeW42MUFZanBCa3NHazlEMXlNSkdYNWtRZExW?=
 =?utf-8?B?YkYvckFXVGJac3VKOEYwRXlVZGJRdFVnWVAxb1BoSC9LQlY0VHIxaWJKUVhY?=
 =?utf-8?B?NHdGSzdHVGkvdGlFSlNXRUwwNTE0R0oyRlFPcGk4WHMzaktHZlB5aWhmZ1Yx?=
 =?utf-8?B?aWpnaU1ENE1lZmsrTXU0NkRoOVI4S3h1TUUxYkxDYy8wUUxnVk1mS2gyUjc5?=
 =?utf-8?B?ZlRjd2VDTjV2MGNoYjYzVy9neHgvcWRsTTBnemhQdW5ad2VPaUs0cS9haEFU?=
 =?utf-8?B?YXJ3cEswYk10d3NjYUxrRUhSeDU4anhkSlJjb2hobWdQODRHcEp3UU9XeWlw?=
 =?utf-8?B?dEpERWRhb3VwTzY1NDN5Yis3dk1nY3dMbkNyajJPc05JV2hnTVY3VUkyTWda?=
 =?utf-8?B?Zm5YMis1MnhMaUVaVEFvRHZOeTlUVjBKaTBJeUlwdmZIckVFRThlR1NvYVRM?=
 =?utf-8?B?aG1kb3pXZ0RHbVlZVWovUVh3Ukl6ZlBTcVgvQmhYTFFIL1lyOGlpZkpjS1hp?=
 =?utf-8?B?dldiNVFKZG1aaGZMQ2hpNFFzRDg1bGFCd2dhUG50OGhwYnAzY3A5ZFZFeFRn?=
 =?utf-8?B?a3Y4UXVrTDg4c3Q1N1FBaXA0ZVpINEY5cWtha2orMk11a2RQc0FVZnFiV3RI?=
 =?utf-8?B?SGFtVmE2dWV0cWc2MkplYXJtZjk3MVZqUUxsQStHQ04ya2xHb0Fqci9VdEtm?=
 =?utf-8?B?enViYXQxRkhKNHFMRUI1N3dzc2VWRU5YdjBQa3hWWVdOUG44QWxrOTcrMzQ1?=
 =?utf-8?B?WTZVaU5hcnQ0WmdmSEdJNUxvNVhVT3R6ZnI1dFF4b2NpK002MzR6WUxOZ1Bo?=
 =?utf-8?B?ckFrUFpDWGtjWjMxNjhGQTN2SkU2VHRvRzQ2MDZqa1dQVDJ2S05lU2dhOEdV?=
 =?utf-8?B?djNLZGtPeVdnb1RHc3RQZXZwLzBqb043MmkvZWllaGJSMS9ZMXZEeVFEdGxM?=
 =?utf-8?B?WDNCbitQNDRyUGhROEkrdlhaYnBGbnkrM0IzSkgyeUljdm5ocDJMTGdjY3JK?=
 =?utf-8?B?OTVJTCthcVQ2SXk5SVVUQytPaTZnaC9RMlI1QjEwdXFjS0xleWVWcnJyTWdV?=
 =?utf-8?B?QjU5QldwQ29GVmxJdmVwN0Z3UWd5Ym92Y2t2WHhleVVudFEyL2ZESVlOYVZ5?=
 =?utf-8?B?clFaS1BHWnV0bmF6TGxSa2xiNG53bmM5M3grc3ArcVoya0NMYXRKVnpFYndM?=
 =?utf-8?B?L2psL1V0QVRHcTBIYndRSjB6cHV5SGtEdC9lRy9rNHgxVWNoandZa1ZuNDlv?=
 =?utf-8?B?bWlZMUlnRzl3dStDdGllVmJkUklPMjIwTlZ4UStGS2Q2RG12b0J3Y3lGRXRW?=
 =?utf-8?B?Y0dzUU1FTzFtQk5ZL2NxQS9USi82NTJuMzRlNkVGSzNCRnZvODlvNVIyejEv?=
 =?utf-8?B?WlRmMHVzVHFQcm5ydEtQRmgzKzRuaU1qbmUrS1I5K3FuTW1PcEhKdWdKNlZ3?=
 =?utf-8?B?aXJJTzc0a1U1dEZhTWVHa3RvZDlWbk1TN3VnelhKSXRCU2FEdU9sQVFNSmFD?=
 =?utf-8?B?ek00bmhCTFg2bzFhN0JuK25vd3FMc1NaeFVOb0hmVm0vcjRsQ1RWeXowK1lF?=
 =?utf-8?B?ckhKMFdXRzJEdEZyYmF4elJ5bE1wd25XclJCdk5jMzB1WUlWNXdMZFRNU3VE?=
 =?utf-8?Q?hnXME8uq+IIIbK8dore15mRYu?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dadd538-4c9b-466d-b6e2-08db1480cf02
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2023 02:59:26.4331
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1TxWADG+A2sqh3JPaXm3d3GHSqdGAHY1NcLFH7rt/NI4WE7OR0LrRMojlxwYmtPokqBfoJiTC/GmAPg3LYpNqNFtpsupiVK83JBPmlPsUSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB4078
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

SGVsbG8gS3J6eXN6dG9mLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4g
U2VudDogVHVlc2RheSwgRmVicnVhcnkgMjEsIDIwMjMgNzowNSBQTQ0KPiBUbzogUnlhbiBDaGVu
IDxyeWFuX2NoZW5AYXNwZWVkdGVjaC5jb20+OyBSb2IgSGVycmluZw0KPiA8cm9iaCtkdEBrZXJu
ZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3NraQ0KPiA8a3J6eXN6dG9mLmtvemxvd3NraStkdEBs
aW5hcm8ub3JnPjsgSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT47IEFuZHJldw0KPiBKZWZm
ZXJ5IDxhbmRyZXdAYWouaWQuYXU+OyBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4
LmRlPjsNCj4gb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmc7DQo+IGxpbnV4LWFzcGVlZEBsaXN0cy5vemxhYnMub3JnOyBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMS8yXSBkdC1i
aW5kaW5nczogaTJjOiBBZGQgc3VwcG9ydCBmb3IgQVNQRUVEIGkyQ3YyDQo+IA0KPiBPbiAyMS8w
Mi8yMDIzIDExOjQyLCBSeWFuIENoZW4gd3JvdGU6DQo+ID4+Pj4+ICsgICAgdHlwZTogYm9vbGVh
bg0KPiA+Pj4+PiArICAgIGRlc2NyaXB0aW9uOiBFbmFibGUgaTJjIGJ1cyB0aW1lb3V0IGZvciBt
YXN0ZXIvc2xhdmUgKDM1bXMpDQo+ID4+Pj4NCj4gPj4+PiBXaHkgdGhpcyBpcyBwcm9wZXJ0eSBm
b3IgRFQ/IEl0J3MgZm9yIHN1cmUgbm90IGJvb2wsIGJ1dCBwcm9wZXINCj4gPj4+PiB0eXBlIGNv
bWluZyBmcm9tIHVuaXRzLg0KPiA+Pj4gVGhpcyBpcyBpMmMgY29udHJvbGxlciBmZWF0dXJlIGZv
ciBlbmFibGUgc2xhdmUgbW9kZSBpbmFjdGl2ZQ0KPiA+Pj4gdGltZW91dCBhbmQgYWxzbyBtYXN0
ZXIgbW9kZSBzZGEvc2NsIGF1dG8gcmVsZWFzZSB0aW1lb3V0Lg0KPiA+Pj4gU28gSSB3aWxsIG1v
ZGlmeSB0bw0KPiA+Pj4gICBhc3BlZWQsdGltZW91dDoNCj4gPj4+IAl0eXBlOiBib29sZWFuDQo+
ID4+PiAgICAgZGVzY3JpcHRpb246IEkyQyBidXMgdGltZW91dCBlbmFibGUgZm9yIG1hc3Rlci9z
bGF2ZSBtb2RlDQo+ID4+DQo+ID4+IFRoaXMgZG9lcyBub3QgYW5zd2VyIG15IGNvbmNlcm5zLiBX
aHkgdGhpcyBpcyBib2FyZCBzcGVjaWZpYz8NCj4gPiBTb3JyeSwgY2Fu4oCZdCBjYXRjaCB5b3Vy
IHBvaW50Lg0KPiA+IEl0IGlzIG5vdCBib2FyZCBzcGVjaWZpYy4gSXQgaXMgY29udHJvbGxlciBm
ZWF0dXJlLg0KPiA+IEFTUEVFRCBTT0MgY2hpcCBpcyBzZXJ2ZXIgcHJvZHVjdCwgbWFzdGVyIGNv
bm5lY3QgbWF5IGhhdmUgZmluZ2VycHJpbnQNCj4gPiBjb25uZWN0IHRvIGFub3RoZXIgYm9hcmQu
IEFuZCBhbHNvIHN1cHBvcnQgaG90cGx1Zy4NCj4gPiBGb3IgZXhhbXBsZSBJMkMgY29udHJvbGxl
ciBhcyBzbGF2ZSBtb2RlLCBhbmQgc3VkZGVubHkgZGlzY29ubmVjdGVkLg0KPiA+IFNsYXZlIHN0
YXRlIG1hY2hpbmUgd2lsbCBrZWVwIHdhaXRpbmcgZm9yIG1hc3RlciBjbG9jayBpbiBmb3Igcngv
dHggdHJhbnNmZXIuDQo+ID4gU28gaXQgbmVlZCB0aW1lb3V0IHNldHRpbmcgdG8gZW5hYmxlIHRp
bWVvdXQgdW5sb2NrIGNvbnRyb2xsZXIgc3RhdGUuDQo+ID4gQW5kIGluIGFub3RoZXIgc2lkZS4g
QXMgbWFzdGVyIG1vZGUsIHNsYXZlIGlzIGNsb2NrIHN0cmV0Y2hpbmcuDQo+ID4gVGhlIG1hc3Rl
ciB3aWxsIGJlIGtlZXAgd2FpdGluZywgdW50aWwgc2xhdmUgcmVsZWFzZSBjbGwgc3RyZXRjaGlu
Zy4NCj4gDQo+IE9LLCB0aGFua3MgZm9yIGRlc2NyaWJpbmcgdGhlIGZlYXR1cmUuIEkgc3RpbGwg
ZG8gbm90IHNlZSBob3cgdGhpcyBpcyBEVCByZWxhdGVkLg0KDQpMZXQgbWUgZHJhdyBtb3JlIGFi
b3V0IHRoZSBib2FyZC1zcGVjaWZpYy4gDQpUaGUgZm9sbG93aW5nIGlzIGFuIGV4YW1wbGUgYWJv
dXQgaTJjIGxheW91dCBpbiBib2FyZC4NCkJvYXJkIEEJCQkJCQkJCQkJCQkJCUJvYXJkIEINCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCQkJ
CQkJCS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tDQp8ICAgIGkyYyBidXMjMShtYXN0ZXIvc2xhdmUpICA8LS0tLS0tLS0tLS0tLS0tLS0tLS0+
IGZpbmdlcnByaW50LihjYW4gYmUgdW5wbHVnKSAgICA8LS0tLS0tLS0tLS0tLS0tLS0tLS0+IGky
YyBidXMjeCAobWFzdGVyL3NsYXZlKSB8DQp8ICAgIGkyYyBidXMjMihtYXN0ZXIpIC0+IHRtcCBp
MmMgZGV2aWNlICAgICB8CQkJICAgICAJCXwJCQkJCQkJCQl8DQp8ICAgIGkyYyBidXMjMyhtYXN0
ZXIpIC0+IGFkYyBpMmMgZGV2aWNlICAgICAgfAkJCQkJfAkJCQkJCQkJCXwNCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCQkJCQkJCS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpJbiB0
aGlzIGNhc2UgaTJjIGJ1cyMxIG5lZWQgZW5hYmxlIHRpbWVvdXQsIGF2b2lkIHN1ZGRlbmx5IHVu
cGx1ZyB0aGUgY29ubmVjdG9yLiBUaGF0IHNsYXZlIHdpbGwga2VlcCBzdGF0ZSB0byBkcml2ZSBj
bG9jayBzdHJldGNoaW5nLg0KU28gaXQgaXMgc3BlY2lmaWMgZW5hYmxlIGluIGkyYyBidXMjMS4g
T3RoZXJzIGlzIG5vdCBuZWVkZWQgZW5hYmxlIHRpbWVvdXQuIA0KRG9lcyB0aGlzIGRyYXcgaXMg
bW9yZSBjbGVhciBpbiBzY2VuYXJpbz8NCg0KPiA+DQo+ID4gU28gaW4gdGhvc2UgcmVhc29uIGFk
ZCB0aGlzIHRpbWVvdXQgZGVzaWduIGluIGNvbnRyb2xsZXIuDQo+IA0KPiBZb3UgbmVlZCB0byBq
dXN0aWZ5IHdoeSBEVCBpcyBjb3JyZWN0IHBsYWNlIGZvciB0aGlzIHByb3BlcnR5LiBEVCBpcyBu
b3QgZm9yDQo+IGNvbmZpZ3VyaW5nIE9TLCBidXQgdG8gZGVzY3JpYmUgaGFyZHdhcmUuIEkgZ2F2
ZSB5b3Ugb25lIHBvc3NpYmlsaXR5DQo+IC0gd2h5IGRpZmZlcmVudCBib2FyZHMgd291bGQgbGlr
ZSB0byBzZXQgdGhpcyBwcm9wZXJ0eS4gWW91IHNhaWQgaXQgaXMgbm90IGJvYXJkDQo+IHNwZWNp
ZmljLCB0aHVzIGFsbCBib2FyZHMgd2lsbCBoYXZlIGl0IChvciBub25lIG9mIHRoZW0pLg0KPiBX
aXRob3V0IGFueSBvdGhlciByZWFzb24sIHRoaXMgaXMgbm90IGEgRFQgcHJvcGVydHkuIERyb3Au
DQo+IA0KPiA+Pg0KPiA+Pj4NCj4gPj4+Pj4gKw0KPiA+Pj4+PiArICBieXRlLW1vZGU6DQo+ID4+
Pj4+ICsgICAgdHlwZTogYm9vbGVhbg0KPiA+Pj4+PiArICAgIGRlc2NyaXB0aW9uOiBGb3JjZSBp
MmMgZHJpdmVyIHVzZSBieXRlIG1vZGUgdHJhbnNtaXQNCj4gPj4+Pg0KPiA+Pj4+IERyb3AsIG5v
dCBhIERUIHByb3BlcnR5Lg0KPiA+Pj4+DQo+ID4+Pj4+ICsNCj4gPj4+Pj4gKyAgYnVmZi1tb2Rl
Og0KPiA+Pj4+PiArICAgIHR5cGU6IGJvb2xlYW4NCj4gPj4+Pj4gKyAgICBkZXNjcmlwdGlvbjog
Rm9yY2UgaTJjIGRyaXZlciB1c2UgYnVmZmVyIG1vZGUgdHJhbnNtaXQNCj4gPj4+Pg0KPiA+Pj4+
IERyb3AsIG5vdCBhIERUIHByb3BlcnR5Lg0KPiA+Pj4+DQo+ID4+PiBUaGUgY29udHJvbGxlciBz
dXBwb3J0IDMgZGlmZmVyZW50IGZvciB0cmFuc2Zlci4NCj4gPj4+IEJ5dGUgbW9kZTogaXQgbWVh
bnMgc3RlcCBieSBzdGVwIHRvIGlzc3VlIHRyYW5zZmVyLg0KPiA+Pj4gRXhhbXBsZSBpMmMgcmVh
ZCwgZWFjaCBzdGVwIHdpbGwgaXNzdWUgaW50ZXJydXB0IHRoZW4gZW5hYmxlIG5leHQgc3RlcC4N
Cj4gPj4+IFNyIChzdGFydCByZWFkKSB8IEQgfCBEIHwgRCB8IFANCj4gPj4+IEJ1ZmZlciBtb2Rl
OiBpdCBtZWFucywgdGhlIGRhdGEgY2FuIHByZXBhcmUgaW50byBidWZmZXIgcmVnaXN0ZXIsDQo+
ID4+PiB0aGVuIFRyaWdnZXIgdHJhbnNmZXIuIFNvIFNyIEQgRCBEIFAsIG9ubHkgaGF2ZSBvbmx5
IDEgaW50ZXJydXB0IGhhbmRsaW5nLg0KPiA+Pj4gVGhlIERNQSBtb2RlIG1vc3QgbGlrZSB3aXRo
IGJ1ZmZlciBtb2RlLCBUaGUgZGlmZmVyIGlzIGRhdGEgcHJlcGFyZQ0KPiA+Pj4gaW4gRFJBTSwg
dGhhbiB0cmlnZ2VyIHRyYW5zZmVyLg0KPiA+Pj4NCj4gPj4+IFNvLCBzaG91bGQgSSBtb2RpZnkg
dG8NCj4gPj4+ICAgYXNwZWVkLGJ5dGU6DQo+ID4+PiAJdHlwZTogYm9vbGVhbg0KPiA+Pj4gICAg
IGRlc2NyaXB0aW9uOiBFbmFibGUgaTJjIGNvbnRyb2xsZXIgdHJhbnNmZXIgd2l0aCBieXRlIG1v
ZGUNCj4gPj4+DQo+ID4+PiAgIGFzcGVlZCxidWZmOg0KPiA+Pj4gCXR5cGU6IGJvb2xlYW4NCj4g
Pj4+ICAgICBkZXNjcmlwdGlvbjogRW5hYmxlIGkyYyBjb250cm9sbGVyIHRyYW5zZmVyIHdpdGgg
YnVmZiBtb2RlDQo+ID4+DQo+ID4+IDEuIE5vLCB0aGVzZSBhcmUgbm90IGJvb2xzIGJ1dCBlbnVt
IGluIHN1Y2ggY2FzZS4NCj4gPg0KPiA+IFRoYW5rcywgd2lsbCBtb2RpZnkgZm9sbG93aW5nLg0K
PiA+IGFzcGVlZCx4ZmVyX21vZGU6DQo+ID4gICAgIGVudW06IFswLCAxLCAyXQ0KPiA+ICAgICBk
ZXNjcmlwdGlvbjoNCj4gPiAgICAgICAwOiBieXRlIG1vZGUsIDE6IGJ1ZmZfbW9kZSwgMjogZG1h
X21vZGUNCj4gDQo+IEp1c3Qga2VlcCBpdCB0ZXh0IC0gYnl0ZSwgYnVmZmVyZWQsIGRtYQ0KPiAN
Cj4gPg0KPiA+PiAyLiBBbmQgd2h5IGV4YWN0bHkgdGhpcyBpcyBib2FyZC1zcGVjaWZpYz8NCj4g
Pg0KPiA+IE5vLCBpdCBub3QgZGVwZW5kcyBvbiBib2FyZCBkZXNpZ24uIEl0IGlzIG9ubHkgZm9y
IHJlZ2lzdGVyIGNvbnRyb2wgZm9yDQo+IGNvbnRyb2xsZXIgdHJhbnNmZXIgYmVoYXZlLg0KPiA+
IFRoZSBjb250cm9sbGVyIHN1cHBvcnQgMyBkaWZmZXJlbnQgdHJpZ2dlciBtb2RlIGZvciB0cmFu
c2Zlci4NCj4gPiBBc3NpZ24gYnVzIzEgfiAzIDogZG1hIHRyYW5mZXIgYW5kIGFzc2lnbiBidXMj
NCB+IDYgOiBidWZmZXIgbW9kZQ0KPiA+IHRyYW5zZmVyLCBUaGF0IGNhbiByZWR1Y2UgdGhlIGRy
YW0gdXNhZ2UuDQo+IA0KPiBUaGVuIGFueXdheSBpdCBkb2VzIG5vdCBsb29rIGxpa2UgcHJvcGVy
dHkgZm9yIERldmljZXRyZWUuIERUIGRlc2NyaWJlcw0KPiBoYXJkd2FyZSwgbm90IE9TIGJlaGF2
aW9yLg0KDQpUaGUgc2FtZSBkcmF3LCBpbiB0aGlzIGNhc2UsIGkyYyBidXMjMSB0aGF0IGlzIG11
bHRpLW1hc3RlciB0cmFuc2ZlciBhcmNoaXRlY3R1cmUuIA0KQm90aCB3aWxsIGluYWN0aXZlIHdp
dGggdHJ1bmsgZGF0YS4gVGhhdCBjYW5lIGVuYWJsZSBpMmMjMSB1c2UgRE1BIHRyYW5zZmVyIHRv
IHJlZHVjZSBDUFUgdXRpbGl6ZWQuDQpPdGhlcnMgKGJ1cyMyLzMpIGNhbiBrZWVwIGJ5dGUvYnVm
ZiBtb2RlLiANCg0KQm9hcmQgQQkJCQkJCQkJCQkJCQkJQm9hcmQgQg0KLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0JCQkJCQkJLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCnwgICAgaTJj
IGJ1cyMxKG1hc3Rlci9zbGF2ZSkgIDwtLS0tLS0tLS0tLS0tLS0tLS0tLT4gZmluZ2VycHJpbnQu
KGNhbiBiZSB1bnBsdWcpICAgIDwtLS0tLS0tLS0tLS0tLS0tLS0tLT4gaTJjIGJ1cyN4IChtYXN0
ZXIvc2xhdmUpIHwNCnwgICAgaTJjIGJ1cyMyKG1hc3RlcikgLT4gdG1wIGkyYyBkZXZpY2UgICAg
IHwJCQkgICAgIAkJfAkJCQkJCQkJCXwNCnwgICAgaTJjIGJ1cyMzKG1hc3RlcikgLT4gYWRjIGky
YyBkZXZpY2UgICAgICB8CQkJCQl8CQkJCQkJCQkJfA0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0JCQkJCQkJLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCkJlc3QgcmVnYXJkcywNClJ5
YW4NCg0K
