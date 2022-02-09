Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E1B4AE674
	for <lists+openbmc@lfdr.de>; Wed,  9 Feb 2022 03:29:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtkNk3vw6z302S
	for <lists+openbmc@lfdr.de>; Wed,  9 Feb 2022 13:29:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=xQQ83+jp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:febc::714;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=xQQ83+jp; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on0714.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::714])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtkNC64KHz2x9V
 for <openbmc@lists.ozlabs.org>; Wed,  9 Feb 2022 13:29:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obUL5VsLRBeNBpoAx8HNKhednetU2rZXcAN8sugu04QO0+aUHKy7akWudI7qKJ4EUQvXOpEkIgbzTfJg6gpuYHpi0QzTvIs37JG8IFKQXvZPMXcp36RxuuOzoKB/iJFEMm/MxMmybgXSleKzk9auQsVMNPRV3KFlGbNSN3ueQw2Tt4qiQ5Q41JCF+aF9Z5oMI+rke6F2i9jkNaYnhuy+/ahTo2ZQNMbLN92SH+pCg2rO7lwCNDBbKMmeVVB39tpGzHi7jHHsr1MpkaWzkpFA4ctc1Z0QkIKnCxbmgRzNW7Gmiapl3kw/glln/EdiPAliYC96xKFGahxE6M+ygsHOKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Nqb9p6/2AXk5gIt+Lw0Ii9Gday64exR/tgPE9swLlM=;
 b=b1lTNydB8VwVfC3szl8xq055Jcmn9LDCHOL+VqCaK54n0FWRfhjNncHcx02F2ZESlnH9JZ118OLD7bvaAZtmjpl46RaVeFBzaq3pXYFGAaIqYYN0p1BMNR7UJw3QqC2Kp7abBADdW6oZBdtq4eCJgtfEOyHZzDee5GsG2uPeYkzyO+GX9pt6lHVdjpMkhJZm27UQP+aLGtVLV6ziNyvQ4o9JD19Mg8mWCWk30dHMD7rPfXk7ZnCgzURA0kUW/I7wE7LIl/02BxdGid7wzqh9K0Xhd0RUoN48bktf1tRHdaRucgNGXvJjp4BHRvwWol3qLHCazjxnwSJHjHls8gi6Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Nqb9p6/2AXk5gIt+Lw0Ii9Gday64exR/tgPE9swLlM=;
 b=xQQ83+jpr7UAVJXoIWpo3OtEyLBmEq/T/1o/5yjlhSbJqx6YBT7MAyYvbLWLle2lNgZ68UOwfN4RjJPzjzfRrMGkQHT6Sww9RPWZ1wDHXlCVLzqUWcVbuyNqfQBZC6gLCNe2ZOp9ZNdamyYbRe4SIElIKdHObcr8VoZOxsI2hCakbtMHsP66RJHhRwx7S3hgCCRQZR/gnRI7POfFIHDv5cx7vY1+ExId8gJFlTrx9LtyL/gXVpMN9NHuGP2xR6mHoDrtyfwcEcI5p6w55bAae27kBhd6DaXhhFF2nlQmYndH/sfUHqbVGNB88GMnlClvoVg4RsggavEa6uZ8A/lXHA==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by PS2PR06MB2453.apcprd06.prod.outlook.com (2603:1096:300:4b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 9 Feb
 2022 02:28:51 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::c4c2:84ad:81d1:e3e7]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::c4c2:84ad:81d1:e3e7%4]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 02:28:51 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Jamin Lin <jamin_lin@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, Dylan
 Hung <dylan_hung@aspeedtech.com>, Ryan Chen <ryan_chen@aspeedtech.com>
Subject: RE: Openbmc u-boot trees (was Re: u-boot:rsa adds rsa3072 algorithm)
Thread-Topic: Openbmc u-boot trees (was Re: u-boot:rsa adds rsa3072 algorithm)
Thread-Index: AQHYG+hw8XtdMh+KHEiz91QkCChn7ayHqWgAgALWXJA=
Date: Wed, 9 Feb 2022 02:28:51 +0000
Message-ID: <HK0PR06MB3779776EED65721E481F8676912E9@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <TYZPR06MB4015DC4BD5CA2FFAB595C69AFC2C9@TYZPR06MB4015.apcprd06.prod.outlook.com>
 <CACPK8XfwLCxNVLfVa=FYw0TVXPE_Kj8+p7=6Svw_O10x22Jf1g@mail.gmail.com>
 <TYZPR06MB4015B2ADBBB832D151F4B433FC2C9@TYZPR06MB4015.apcprd06.prod.outlook.com>
In-Reply-To: <TYZPR06MB4015B2ADBBB832D151F4B433FC2C9@TYZPR06MB4015.apcprd06.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 390d6400-fdb5-47bd-cf55-08d9eb73e947
x-ms-traffictypediagnostic: PS2PR06MB2453:EE_
x-microsoft-antispam-prvs: <PS2PR06MB2453635F2B085422527A5228912E9@PS2PR06MB2453.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3y3hjLbVYxLzi7Z5GPpliiCqvKADZe4oMKEsIICqsM6pYLXmNb7EqagIxBRF0aG5x6bJTZzxM3RPBQdlyakB9V5Yj162FmiaePMbvZffN4E3EKDZ79InwrgCy7Bn09z6mUm+5FYlwt5bfud5K+slOvQzHXbgV3qhn8PuqjGAtPr2C5vntXiND7PI6+8x+c4T5U5U/8EvtvgqLv5ftyM84nbdxgSdmL3qE7MOuIQA+afaJKy2Rg/KGjuEDVvB8wmqpZi/XHXjKsIUqgDp6jC31nIK/kORSvu5u78urio7dWoJ4Wgla1N772AveZ8APfvZ9cRQiyOxGVkX4MdJtk6XTDCtPXLPCxjhf+oxQQXBIXquGUab9EBqjkwYezwRBIKfJ48SHcoxO4e/itQsKqJ/rHzXMUpM5BL/q5qVSQshWfL7o4Vo/LvSQsWYZIQT2ayi9SUHSYdCmvZnPXXmugHAuY0W/LD3uWQbGougiEw+09TCs5UzqQKivUeHmb3vE2IVaRX70gKZdTSIHvblNY9ZRER7W2Cgqj9m68ZgJC1OihipybHe3rHf8pRo7cP69ojwtVaTbQ7OTwkLl5pe9TkTh6WNddDSYjpYM/1EywiNw5/IistAwgM8YbUCwJUChty6aiF5b+Cg2EpNAKQ+1WvSCyQtcchSufZ2NenWDyUlXetdPgf4j9hJAtc6r3mVQ04S6wK8MOY5nDJJtLtPb7ClAUtyHIQNu+l1bZYSCqRt9uR8OLxA5ainBkJKNdsegB6sOPVyBVHY/OWZgmGJv7v/ybwJJkATOyvQIcb78oNi6vQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6636002)(71200400001)(5660300002)(2906002)(38070700005)(110136005)(52536014)(316002)(122000001)(54906003)(33656002)(4326008)(66446008)(66556008)(66476007)(76116006)(66946007)(7696005)(64756008)(8936002)(53546011)(6506007)(8676002)(9686003)(55016003)(38100700002)(86362001)(508600001)(83380400001)(966005)(26005)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVpXdXhSYzJ3VVFMMUJjUDhBeWpOZmhOc1cwb1hYVUwxNFJKY2h6MUlFM1NY?=
 =?utf-8?B?U0Uvbk5ydVFRc1V6NFBhMVF5aHM1VXNoNkY3OXh2TjNweDV0RlNnWWR4WXJm?=
 =?utf-8?B?OHJxaXJWcUhYRDFYa2M5SkIvVFpvSyt1RXptNmdxY092bm0yTmxXNnFubVpC?=
 =?utf-8?B?blgwUkRxeVFuNGpXTjFDR1U4ay9xcE16djJ3VEhnRUkvYkJONHFpN1lQbkw1?=
 =?utf-8?B?aHFYQk5HZko4am94V0xtblhGL3JnbWZsemFmVmJLME10bzdxTEtNTUdGYXly?=
 =?utf-8?B?bDBmVEJWMTFlY3NZWmFxSEMwMFBsYUxVV1V0N09BNTdDcUhDTk9yTktLbzNW?=
 =?utf-8?B?MW5aQVBKU3lmTWQ1ZEtYQmhnTGdyNGJDSzdKZG5EbzlCZlovd21naWdqa1hS?=
 =?utf-8?B?Y3QvQ0FRemJnNWZVNDBML3g3UWdJOW1rd3cxRWw0RmFQanVSNk9JUlpYSC9W?=
 =?utf-8?B?WU81c1hvQUk3djNSL3oyNEZZU3RVU2tjc0lvaWZQaVkrWGlzeEltQytER3l0?=
 =?utf-8?B?NG5LT2U0TDBHSVMrbkVsMVBQSytMaElic1AxT3NFKzZVNjBONkVWdm5IWW9k?=
 =?utf-8?B?UUg2aDNTY09ndWJkaU5vYVZZR1p6ekZGTURMQi8ydGgrU1B5cGgzeHh6a2Y3?=
 =?utf-8?B?a0E1dnZrdnRiRDFTaVBMK1hFN29zQVdGTFNXbW4wT0o0Zm5Lb3VGZGlWSkxy?=
 =?utf-8?B?VDFTVklZUzJKbmJQdDRoOUZMV3ZXcWRuK0pSTndXOEU1QVlmVnhBcytGTGkx?=
 =?utf-8?B?cVdkQ0Z0TkFzL3N5V0MybnZYdHA1WXhIZitKeFpnN1RnWENJM0FPM3c3TjBr?=
 =?utf-8?B?eTByZVNLSEV4dGpoenc5aW9pUEpXVnoyTDlMRExPenFSMkMwaFpGMEdTTWVq?=
 =?utf-8?B?b3BkWTEwOUJTTDVYL0wwME1aSkdOdno5N2tEak8yMWpiVUVTMjA4QzB2MWQ5?=
 =?utf-8?B?aFFnN3NDOHcrK3BxRjRXNkdhcEtlV1p2ekxnNi9GdEJqdmVnMzMzSkFGMHQx?=
 =?utf-8?B?RFBWWUxLNDI2S1ZHWkpOR1lQV0EvUzlpUERRUkwrbVFTUkRURGcvQm9FSFpJ?=
 =?utf-8?B?aFA4enl4R01YM2g3MU1VYmlOVDArWHBJSHpTZm5VUjhYcTZUQ0hRSnI1NWFQ?=
 =?utf-8?B?WTBvMHVleHdiQzFROGhwb0FrMldBREhlL3lXZGxDbWk0SEUrSlYzcGxnWDBk?=
 =?utf-8?B?TUF2ajF3OU1CSkR2eTF6TDFqRzNxQVFJV0pJcVZLSkRraktySG9ka2xCMGcx?=
 =?utf-8?B?M0VHYVc2OFczSzJqTlR2am5xa255cU4vd3dUN1BDQXd2Sk0waWZmQTlwTk9m?=
 =?utf-8?B?WGJOWlhpcWhQYU1aMks5Y1ZnN0FwYU1raHJvTkU1UFZyNjNCYk5XSTN4bm5M?=
 =?utf-8?B?c3VNbXVNclQxakVpZS9TTVVyS2x0dkhRTERhbE5mTm1pWTFHK1hkamVWL0pU?=
 =?utf-8?B?SXpFZ1dHTU1kbmVuUjJVcExQUlhFdFZFa2x5T2RMODdRSFZ0SnYzQ242NVRw?=
 =?utf-8?B?QkE1UHhuNmlvWnVyZXY5REZVbTBUVWRKbC9DK1Q3L1ppQndtVkRvcUl6SVJU?=
 =?utf-8?B?ck5EN0oxa0t0Y2pGQlBpa3dRV3hxL0FkaEtvZGRGZjdyYlRjMjR2QUE1Q3gz?=
 =?utf-8?B?RE90S3FsRFpkeE1JZWNMeTNUa0NBcTFoa0NIOFE2NEI1STJDQnl4cTYvRldn?=
 =?utf-8?B?ZUVpa0hhMm5CSTZXcFcyL2ppeE9mTGVhNFZQM2JvOWIxZVN6aGtSV1VMaXF2?=
 =?utf-8?B?MDQxVStnN0FJRSszUmdBQ2lyWkNSN1JOMFcxNWFaZU1VcVZha0tFUEYrRWYv?=
 =?utf-8?B?YnNmVldGb1FlNFFPUnZ3dWlhcTNRTTRkU2R0K0I2bkkxWUtHMEFISnYwSFN0?=
 =?utf-8?B?Z1BwSHdRMVY4Wk81VE8wbXVOMW5JOHUzY0R2eHRrYVlOMTY4aHhBOEk4UGJM?=
 =?utf-8?B?S2hkZkJWSC80MytONWNVdGJ3eHNwakk3YXI0OXRUbjlHQzB4NTFFL2FoV0ov?=
 =?utf-8?B?ODFvUWhqMjEyYXpRNjVCazdVTk1kZEM4a05Ka0J0bUNOT1FyVUlvdkx3d0hh?=
 =?utf-8?B?aXkzYk9QbUlHeHpySGZrT2hSUEdjalNYVkxIakhxaHZqS3RRS3Z3MnB6MzNi?=
 =?utf-8?B?Z0tYNWJIeTdueHBxZTZMT1MyN3hBaEp0L3F1Y0phWnZUUzJJRmZWcUVRb25I?=
 =?utf-8?B?b3Q5Y05NaWliczNJU0M1NFk1a0pKRklod2hPOUp3MEpPeWhhank2WHkrZ0px?=
 =?utf-8?B?UW5jVUU3YUJYaUQ4KzVLRlQ0NXBRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 390d6400-fdb5-47bd-cf55-08d9eb73e947
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2022 02:28:51.6418 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AwHepx9B76wMAO/yYhdohfMNHCM7fAoIbga0VV/S6evAgtXjQLt+u+auW4jU0fsqoRDKXuVl4tGFgKsLV0Ofsqs1Xc/WVkPMkzxxMvT0m00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR06MB2453
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Troy Lee <troy_lee@aspeedtech.com>, Steven Lee <steven_lee@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiBGcm9tOiBKYW1pbiBMaW4gPGphbWluX2xpbkBhc3BlZWR0ZWNoLmNvbT4NCj4gU2VudDogTW9u
ZGF5LCBGZWJydWFyeSA3LCAyMDIyIDM6MDIgUE0NCj4gDQo+ICsgUnlhbiwgQ2hpYVdlaSBhbmQg
RHlsYW4NCj4gDQo+ICoqKioqKioqKioqKiogRW1haWwgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAq
KioqKioqKioqKioqKioqKioqKg0KPiBESVNDTEFJTUVSOg0KPiBUaGlzIG1lc3NhZ2UgKGFuZCBh
bnkgYXR0YWNobWVudHMpIG1heSBjb250YWluIGxlZ2FsbHkgcHJpdmlsZWdlZCBhbmQvb3INCj4g
b3RoZXIgY29uZmlkZW50aWFsIGluZm9ybWF0aW9uLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCBpdCBp
biBlcnJvciwgcGxlYXNlIG5vdGlmeQ0KPiB0aGUgc2VuZGVyIGJ5IHJlcGx5IGUtbWFpbCBhbmQg
aW1tZWRpYXRlbHkgZGVsZXRlIHRoZSBlLW1haWwgYW5kIGFueQ0KPiBhdHRhY2htZW50cyB3aXRo
b3V0IGNvcHlpbmcgb3IgZGlzY2xvc2luZyB0aGUgY29udGVudHMuIFRoYW5rIHlvdS4NCj4gDQo+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEpvZWwgU3RhbmxleSA8am9lbEBq
bXMuaWQuYXU+DQo+IFNlbnQ6IE1vbmRheSwgRmVicnVhcnkgNywgMjAyMiAyOjAzIFBNDQo+IFRv
OiBKYW1pbiBMaW4gPGphbWluX2xpbkBhc3BlZWR0ZWNoLmNvbT4NCj4gQ2M6IG9wZW5ibWNAbGlz
dHMub3psYWJzLm9yZzsgVHJveSBMZWUgPHRyb3lfbGVlQGFzcGVlZHRlY2guY29tPjsgU3RldmVu
DQo+IExlZSA8c3RldmVuX2xlZUBhc3BlZWR0ZWNoLmNvbT47IEFuZHJldyBKZWZmZXJ5IDxhbmRy
ZXdAYWouaWQuYXU+DQo+IFN1YmplY3Q6IE9wZW5ibWMgdS1ib290IHRyZWVzICh3YXMgUmU6IHUt
Ym9vdDpyc2EgYWRkcyByc2EzMDcyIGFsZ29yaXRobSkNCj4gDQo+IEhpIEphbWluLA0KPiANCj4g
T24gTW9uLCA3IEZlYiAyMDIyIGF0IDAyOjI2LCBKYW1pbiBMaW4gPGphbWluX2xpbkBhc3BlZWR0
ZWNoLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIaSBKb2VsIGFuZCBPcGVuQk1DIHRlYW0sDQo+ID4N
Cj4gPg0KPiA+DQo+ID4gVGhpcyBwYXRjaCB3YXMgYXBwbGllZCB0byB1LWJvb3QvbWFzdGVyLA0K
PiA+IGh0dHA6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L3Vib290L3BhdGNoLzIwMjIw
MTE5MDgyMzIzLjQ1NjctMi0NCj4gPiBqYW1pbl9saW5AYXNwZWVkdGVjaC5jb20vDQo+ID4NCj4g
PiBDb21taXQgICAyYTRiMGQ1ODkwZGViMGM5NzNmOGRiN2JiMDNhZGFkOTZhZmYxMDUwDQo+ID4N
Cj4gPg0KPiBodHRwczovL2dpdGh1Yi5jb20vdS1ib290L3UtYm9vdC9jb21taXQvMmE0YjBkNTg5
MGRlYjBjOTczZjhkYjdiYjAzYWQNCj4gYQ0KPiA+IGQ5NmFmZjEwNTANCj4gPg0KPiA+IENvdWxk
IHlvdSBwbGVhc2UgaGVscCB0byBiYWNrcG9ydCB0aGUgcGF0Y2ggdG8gdGhlIG9wZW5ibWMvdS1i
b290IHRyZWU/DQo+IA0KPiBTdXJlLCBJIGNhbiBkbyB0aGF0Lg0KPiANCj4gSSdkIGxpa2UgdG8g
c3RhcnQgYSBkaXNjdXNzaW9uIGFib3V0IHRoZSB1LWJvb3QgdHJlZXMgYW5kIGhvdyB3ZSBtYWlu
dGFpbiB0aGVtLg0KPiBDdXJyZW50bHkgd2UgaGF2ZToNCj4gDQo+ICAtIHVwc3RyZWFtOyBwYXJ0
aWFsIDI2MDAgc3VwcG9ydA0KPiAgLSBhc3BlZWQtbWFzdGVyLXYyMDE5LjA0LCBTREsgdHJlZSBt
YWludGFpbmVkIGJ5IEFTUEVFRA0KPiAgLSB2MjAxOS4wNC1hc3BlZWQtb3BlbmJtYywgb3BlbmJt
YyBtYWludGFpbmVkIGJ5IEpvZWwuIEJhc2VkIG9uIFNESyB0cmVlDQo+IA0KPiBJbiB0aGUgcGFz
dCBJIHdhcyBwdXR0aW5nIGNvZGUgaW4gdGhlIG9wZW5ibWMgdHJlZSBzbyB3ZSBjb3VsZCB1c2Ug
aXQgZm9yDQo+IGJyaW5ndXAsIGFuZCB0cnlpbmcgdG8gc2VuZCBwdWxsIHJlcXVlc3RzIHRvIHRo
ZSBTREsgdHJlZS4NCj4gDQo+IE5vdyB5b3UncmUgc2VuZGluZyBwYXRjaGVzIHVwc3RyZWFtIChl
eGNlbGxlbnQhKSBhbmQgc2VuZGluZyBtZSByZXF1ZXN0cyB0bw0KPiBtZXJnZSBpbnRvIHRoZSBv
cGVuYm1jIHRyZWUuDQo+IA0KPiBJIHdvdWxkIGxpa2UgdG8gc2VlIGZld2VyIHRyZWVzLg0KPiAN
Cj4gSW4gdGhlIHNob3J0IHRlcm0sIG9uZSBvcHRpb24gaXMgd2UgcHV0IGFsbCBvZiB0aGUgb3Bl
bmJtYyBwYXRjaGVzIGluIHRoZSBTREssDQo+IGFuZCBjb250aW51ZSB1c2luZyB0aGF0IGZvciBv
cGVuYm1jLiBXb3VsZCB0aGlzIHdvcmsgZm9yIGFzcGVlZD8NCg0KWWVzLg0KQXJlIHdlIGdvaW5n
IHRvIGRvIHRoaXMgdGhyb3VnaCBQUnMgYXMgdXN1YWw/DQoNCj4gDQo+IEluIHRoZSBtZWRpdW0g
dGVybSwgd2Ugc2hvdWxkIHN0YXJ0IHVzaW5nIHVwc3RyZWFtIHJlbGVhc2VzLiBUaGVyZSBtYXkg
c3RpbGwNCj4gYmUgc29tZSBkb3duc3RyZWFtIGNvZGUgKGFzIHdlIGhhdmUgZm9yIExpbnV4IGlu
IG91ciBkZXYgYnJhbmNoZXMpLCBidXQgdGhpcw0KPiB3aWxsIGdvIHRvIHplcm8gb3ZlciB0aW1l
Lg0KDQpBZ3JlZS4NCldlIGFyZSBhbHNvIHdvcmtpbmcgb24gdXBzdHJlYW1pbmcgZnVuZGFtZW50
YWwgZHJpdmVycyB0byBVLUJvb3QgbWFpbmxpbmUuDQpPbmNlIGl0IGlzIHN1ZmZpY2llbnQgZm9y
IG1vc3QgZnJlcXVlbnRseSB1c2VkIGJvb3RpbmcgcGF0aHMsIEFzcGVlZCB3aWxsIHN0YXJ0IHVz
aW5nIGl0Lg0KDQpSZWdhcmRzLA0KQ2hpYXdlaQ0K
