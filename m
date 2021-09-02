Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C043FE96B
	for <lists+openbmc@lfdr.de>; Thu,  2 Sep 2021 08:45:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0Wdj24jTz2yPM
	for <lists+openbmc@lfdr.de>; Thu,  2 Sep 2021 16:45:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=esI5G+1S;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.109;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=esI5G+1S; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320109.outbound.protection.outlook.com [40.107.132.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0Wcx6R4wz2xfP;
 Thu,  2 Sep 2021 16:44:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qo6hZS74A7OnlXpdeA/lk4XiqSRyeYdVawjnGD/D6HrLOD0uvSeAtQ1HBhOkD0FHjYP6Ew18uYSw+VDLHt4AlhPfFuwnTfsX+Cqzhw+I9XlRCz5Z8XM82T16GqW9MegAgsYufHClzMAQSuf35/nE527Br9RmWaQ8rfwceoDAcgnVvkQWFkHaK73L273reCgbvsq9nBlmxl6QMlTFfyw/XZ8R3icKNFXJinaGNaUQmDyP31gUh/leMdbN5MZNudNuwTZCAiyWrv8HfRvLUBkyh33GCIyULKHvX/knIO/ADpKhmAxUXKak/guIjvOe/utr7Eb1FaR4X4L3MVHjpRqmmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=8fhsXvgCkJNamwHt2CkycuuH3CtDtfRsLdFx6lvvqjw=;
 b=NWzTaQlBtNHNRWGT2qSzLSfdhQqcf1X3ONkXg2zP0TawvvLfRadiwQCUfD9V7ea8ByqaUqAJzGJ33pd9xOmWoXuro+JvbG478YbD1K7FalX6vQTacxUMl4Y+5J3Lnlx+wMd1+wuxqBbyBXe3IFUFxOqf8vKZhYQ6vCPyBMGnmz9fyQyarYF7+Az72dVTxZqkc+I4j7PbgT3ecJvQSmXYHJn2lc6C1MzyLkvdWAMMrSOq3IH46CHv2hDzZDU0bKhusa1gPU5m+j2fAU+jgkP78ak2KF8P7S6TVx+O1olLLW5HxeUzDqOo6CMF5FWp6QpyQOUdISI96WeWhVADyT1Agw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fhsXvgCkJNamwHt2CkycuuH3CtDtfRsLdFx6lvvqjw=;
 b=esI5G+1S+ydagSYFFet4MAU3o2vn6C1z4kjbLFB1vEejSwOyDZCcRUObCXS416rBnu1nI72M9YvUcRm927DPv8hj21Rb6uiI21t5TG+rrJTGLgW+mV29nVleEC7acchUZUy9a3Cpwwe58OBrifQiaxE39jvgKgQ7mlLFbk6BbOWs5LBOqztp+HGy881YSyBECCUZ09v5Yk/EcYfSzliUx/x3tgwzrAcqjipbda6TkPWxdpwGCGLgAoPyhhYAnK0cHIAQaqx07qHvkrapB3KKIX/HACYZRHXJo7cmKKfRMvJx2kqd/9oIPeTghBbY9D/XUNZYoxYnG9rXS6k4iKMA6w==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK2PR0601MB2001.apcprd06.prod.outlook.com (2603:1096:202:8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Thu, 2 Sep
 2021 06:44:28 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::4c26:6668:f551:3a62]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::4c26:6668:f551:3a62%3]) with mapi id 15.20.4457.026; Thu, 2 Sep 2021
 06:44:28 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au"
 <andrew@aj.id.au>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 3/4] soc: aspeed: Add eSPI driver
Thread-Topic: [PATCH v4 3/4] soc: aspeed: Add eSPI driver
Thread-Index: AQHXnuHnLi9FHqbUxUOpf9SHGgAkS6uQF7yAgAAhRlA=
Date: Thu, 2 Sep 2021 06:44:28 +0000
Message-ID: <HK0PR06MB37792273A075533C2570002391CE9@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210901033015.910-1-chiawei_wang@aspeedtech.com>
 <20210901033015.910-4-chiawei_wang@aspeedtech.com>
 <20c13b9bb023091758cac3a07fb4037b7d796578.camel@codeconstruct.com.au>
In-Reply-To: <20c13b9bb023091758cac3a07fb4037b7d796578.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeconstruct.com.au; dkim=none (message not signed)
 header.d=none;codeconstruct.com.au; dmarc=none action=none
 header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c56487f7-468e-42d4-b54f-08d96ddd1cb6
x-ms-traffictypediagnostic: HK2PR0601MB2001:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR0601MB200104F18D20AA502912242E91CE9@HK2PR0601MB2001.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y/1lzGNahcAn067kBjXz7QRRYewBzIjN62Rtnji3rTwpxuiBmeKEU2CkdOmO7kQteu7QMleckZRTRjZ7X8VK9aMe89j4nXqnfXa4a7cHndIx0/W1y6Ir1ACVPHiCTgUXrZUkkOavlY5UItqlEBWQt4DYBQTuZ/ST1v1mMtd4asmycYCc1pfPwGaJG9GuDxcppVgftilYpuTV8IrxU9AWKSQR4H4pY6eel4bqQj56IawaFKraP3MBPJXx3Z4LS3pUxp86gMhyoRU0oV/tHoHZ47dLoenO7gl/z+kENWKRg3wZlcAxe+lCdZoETxlbvMh+eI7n1vH0ZNa2hLKD4xXS57A7jYNu4rcxGMfXYLt/dXBqFHsHrMRa3Jsq0dbv8ayNu2t3eoDvaZ3Owdt+32f19XSnOmsWkwITpxThyH+b2Twwg79zGepHNouFCscrdM2dOhX93pV49MG8UtJSxA5+JTly9mdBZ1RWsLS7jPzqlFzwOSWfbsyB9elcpKRMBUCBTmAoAER7jVuZBcmSMBMTaILJDCXxbCkePGjS+qxcFUhxcegk8tn9IsJ8o88l40g1ggkhE6mK8Tk5mhDuAQvBSLjAdU5dcHtFm87oRx5foszO3VOIDqgcdMEPWdFpWhChQvCjZzGLg8UM7zX+3dKJltdBqxNYmN2aAH7CkwXRB12X4SmbCiVtiO/bTX+24Lw4ixPvYvd85tfX2jzcACXNiw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39850400004)(136003)(346002)(376002)(396003)(186003)(33656002)(86362001)(38070700005)(122000001)(9686003)(7696005)(38100700002)(83380400001)(110136005)(8936002)(54906003)(107886003)(66446008)(4326008)(66556008)(66476007)(64756008)(26005)(55016002)(478600001)(316002)(71200400001)(8676002)(52536014)(66946007)(2906002)(5660300002)(76116006)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NWpzKzBJOGdmWWhUdWl6NWU4ZHFEVHlCOEFBQUFQaW0vbFl0QUJrcmdXUWlF?=
 =?utf-8?B?d0lkcWluak5ZOEFOSmpsZDdQQlpuWDg4eWozRis5dTUwR0NhTDlsYUpUZGVK?=
 =?utf-8?B?V2pnZWNDM21waUY0MHJieHM2djhXNzJyRHJzOC9pOURmT0FJQ2F2cmFhZXRn?=
 =?utf-8?B?Rkd0SktZbjlCTFBTcmIyNGh2YnJQUVRacDNScDFNbDZIUmwrSzI3OHFWdU5B?=
 =?utf-8?B?Y2dKMUhXOVZDeW83bm91cTFERDBnRWxPOC92KzRiSFYvUU1lQ0RBSWZnZFV3?=
 =?utf-8?B?M1ovZkY4RjVZMWlaSlp0c2J2MGxlL3BRbHBSSTBLZnhhZzM1QkcrcW9mdjh2?=
 =?utf-8?B?aVN4L3VjejVjbTJRbEdlVFc5d05EYjU4bWh1ekprRXpKL25BazQvS2h3ckN6?=
 =?utf-8?B?SGxvYUY0b1lia3ZoaVlMSnFpRVFoSDJ0Tlk5ZWx5a1lTbi9xYjJkd3FSb1or?=
 =?utf-8?B?YjdkVDdhRklwZStVRjFjc1A1Yk0yRkVZZXFsd21Nc0pFaDRnVzN3UG8vS29a?=
 =?utf-8?B?dW1zQjV3blM1MGV4YXBnd21GVFlwNG8zd2Yyc0l0cnR5dEZJeC9XZjhBUkQ1?=
 =?utf-8?B?QkxmMjJLNWRWV3FkcUhkK0NoYmZua2w4d2QzbmNRVC9UWDBQTHlia2htMkxp?=
 =?utf-8?B?V2RFdzVneEV2K2RyWlQ2MkRNeE9uajlmWGdLK2lpN1FPdEMrSTc2dWdESG5U?=
 =?utf-8?B?Tmd4SHAvUjZsUEZiK0VBRitBaUtTRm1lSkpPOEtXMW5uaUlxUlkrbitUb1ow?=
 =?utf-8?B?M1hKa3Nrc2FMWVJKcit0dUZrMGcwQkhqNm5pSmRwenJ4ZS9kUzdoeHlzUWQw?=
 =?utf-8?B?eFZkNXlWZmlzWStPYXhIblQwU2szdnhVdHlkL1l1ZEViL0YrTGpObC8rK0FL?=
 =?utf-8?B?MjhXWkNsMzN2bFlWcHlKeHM5a1duZ05ydURVbEtMYnpVTisxYXMxNjcyV3dE?=
 =?utf-8?B?MklCZHRrOFRpaGpIZGJPMUM3WFpCUjdDbWNkSEZTY0c0eEppUzdIcjNabE9m?=
 =?utf-8?B?aFZrdmhSVFRSUkk2bXFuTTQzUWVlQzVMWUNNTlVuclBCZXdvTUFEdEZKVmo2?=
 =?utf-8?B?N3ZuTTdlbkJMN2NLa01rUVBiN1NGSUNVdUtBVkJjem1zTllNQm5IR29IUHJy?=
 =?utf-8?B?aGZmWUxDb0dSdEk1NjI1T0hRSkdldG9nY2pqZ0hpa3NWSVJOZDk3TG1yTFZj?=
 =?utf-8?B?cStXZjl2cnpQSmNQQjNLKzFWbXZXUUd0TE82TzFhR2dqUEdSV09kRmNEaXNo?=
 =?utf-8?B?Zno4QUdFU2dZRVQveXpYV3A3UHdQQ285aUV4NWgvZStIcXMwWktWa0hzbytC?=
 =?utf-8?B?eFNXQmtNcnZkSUh3YTlNUkdNN05LM2ZDbmxsdUZQK0Jvb2kyK09YVitQY0lh?=
 =?utf-8?B?YjdBUjMrMVJBVUVXcGpBSkE5VlZjQTEycWxlcFgrUzFhMHZWSVY2NHgzNTNN?=
 =?utf-8?B?YzVmbkZ5T0NLTzh0dk5zK0JFYU5vVHRDRVVmdm1jbTJqVytoTmFDbjl3Kzhz?=
 =?utf-8?B?Z0drYzcvWFVrcFpOQml6czlTN1lwa3NmcFFEdndiU2NpYTNPY0tyKzhmUGJa?=
 =?utf-8?B?RS9TMU5yZDE2SktQRHhuNjE5bWt2VjlpZVBMQWNDOVhja0xVMzRsem1RR0FT?=
 =?utf-8?B?RzY5b25YVFNyZmxDQlRtR3h2dXo5VmpwcHpncjhsS1F6Uk9mQjB3MjRZMUVT?=
 =?utf-8?B?OHFnTnExenlEVW1WcDVaY2poQVhGdjhHY2VHY2lITlNCYkprSzRVVnlvRGNY?=
 =?utf-8?Q?jOVv7r9K3B38G5XSnPJw627Ac2jgb0Hki9Rdv5R?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c56487f7-468e-42d4-b54f-08d96ddd1cb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2021 06:44:28.5082 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aFn+VQQB+wwcZSYrcikhtu0mVDckk6EnHWKvdu1R0yn0FSWWwtauOentiPZn63E0hq/cU8j3OW1e8XZi+EfgF7OPidMxqnwQbl8m9CuzbNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0601MB2001
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
Cc: Morris Mao <morris_mao@aspeedtech.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgSmVyZW15LA0KDQo+IEZyb206IEplcmVteSBLZXJyIDxqa0Bjb2RlY29uc3RydWN0LmNvbS5h
dT4NCj4gU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciAyLCAyMDIxIDExOjMwIEFNDQo+IA0KPiBI
aSBDaGlhd2VpLA0KPiANCj4gPiBUaGUgQXNwZWVkIGVTUEkgY29udHJvbGxlciBpcyBzbGF2ZSBk
ZXZpY2UgdG8gY29tbXVuaWNhdGUgd2l0aCB0aGUNCj4gPiBtYXN0ZXIgdGhyb3VnaCB0aGUgRW5o
YW5jZWQgU2VyaWFsIFBlcmlwaGVyYWwgSW50ZXJmYWNlIChlU1BJKS4NCj4gPiBBbGwgb2YgdGhl
IGZvdXIgZVNQSSBjaGFubmVscywgbmFtZWx5IHBlcmlwaGVyYWwsIHZpcnR1YWwgd2lyZSwNCj4g
PiBvdXQtb2YtYmFuZCwgYW5kIGZsYXNoIGFyZSBzdXBwb3J0ZWQuDQo+IA0KPiBJJ20gc3RpbGwg
bm90IGNvbmZpbmNlZCB0aGlzIHJhdyBwYWNrZXQgdXNlci1BQkkgaXMgdGhlIHJpZ2h0IGFwcHJv
YWNoIGZvciB0aGlzLg0KPiBUaGUgZm91ciBjaGFubmVscyB0aGF0IHlvdSdyZSBleHBvc2luZyB3
b3VsZCBiZSBtdWNoIG1vcmUgdXNlZnVsIHRvIHVzZQ0KPiBleGlzdGluZyBrZXJuZWwgc3Vic3lz
dGVtcy4NCg0KVGhlIGVTUEkgb24gQk1DIHNpZGUgaXMgYSBzbGF2ZSBkZXZpY2UuIE1vc3Qgb2Yg
dGltZSBpdCBsaXN0ZW4gdG8gdGhlIEhvc3QgcmVxdWVzdHMgYW5kIHRoZW4gcmVhY3QuDQpUaGlz
IG1ha2VzIGl0IG5vdCBxdWl0ZSBmaXQgdG8gaW50ZXJmYWNlcyB0aGF0IGFjdCBhcyBhIG1hc3Rl
ciByb2xlLg0KDQo+IA0KPiBTcGVjaWZpY2FsbHk6DQo+IA0KPiAxKSBUaGUgVlcgY2hhbm5lbCBp
cyBlc3NlbnRpYWxseSBhIEdQSU8gaW50ZXJmYWNlLCBhbmQgd2UgaGF2ZSBhIGtlcm5lbA0KPiAg
ICBzdWJzeXN0ZW0gdG8gZXhwb3NlIEdQSU9zLiBXZSBtaWdodCB3YW50IHRvIGFkZCBhZGRpdGlv
bmFsIHN1cHBvcnQNCj4gICAgZm9yIGluLWtlcm5lbCBzeXN0ZW0gZXZlbnQgaGFuZGxlcnMsIGJ1
dCB0aGF0J3MgYSBtaW5vciBhZGRpdGlvbiB0aGF0DQo+ICAgIGNhbiBiZSBkb25lIHNlcGFyYXRl
bHkgaWYgd2UgZG9uJ3Qgd2FudCB0aGF0IGhhbmRsZWQgYnkgYSBncGlvDQo+ICAgIGNvbnN1bWVy
IGluIHVzZXJzcGFjZS4NCg0KZVNQSSBWVyBjaGFubmVsIGNhbiBiZSB1c2VkIHRvIGZvcndhcmQg
YSBieXRlIHZhbHVlIHRvL2Zyb20gR1BJTy4NCkhvd2V2ZXIsIHRoZSB0YXJnZXRlZCBHUElPIGdy
b3VwIGFuZCBpdHMgZGlyZWN0aW9uIGFyZSBkZXRlcm1pbmVkIGJ5IHRoZSBIb3N0Lg0KVGhpcyBp
cyBkaWZmZXJlbnQgZnJvbSB1c3VhbCBHUElPIGRldmljZXMgYXMgaXQgc3VwcG9ydHMgdmVyeSBs
aW1pdGVkIG9wZXJhdGlvbnMuDQoNCj4gDQo+IDIpIFRoZSBvdXQtb2YtYmFuZCAoT09CKSBjaGFu
bmVsIHByb3ZpZGVzIGEgd2F5IHRvIGlzc3VlIFNNQnVzDQo+ICAgIHRyYW5zYWN0aW9ucywgc28g
Y291bGQgd2VsbCBwcm92aWRlIGFuIGkyYyBjb250cm9sbGVyIGludGVyZmFjZS4NCj4gICAgQWRk
aXRpb25hbGx5LCB0aGUgZVNQSSBzcGVjcyBpbXBseSB0aGF0IHRoaXMgaXMgaW50ZW5kZWQgdG8g
c3VwcG9ydA0KPiAgICBNQ1RQIC0gaW4gd2hpY2ggY2FzZSwgeW91J2xsICpuZWVkKiBhIGtlcm5l
bCBpMmMgY29udHJvbGxlciBkZXZpY2UgdG8NCj4gICAgYmUgYWJsZSB0byB1c2UgdGhlIG5ldyBr
ZXJuZWwgTUNUUCBzdGFjay4NCg0KQ291bGQgeW91IHNoYXJlIHVzIG1vcmUgaW5mb3JtYXRpb24g
YWJvdXQgdGhlIGkyYyBuZWVkIG9mIGtlcm5lbCBNQ1RQIGtlcm5lbCBzdGFjaz8NClRvIG91ciB1
bmRlcnN0YW5kaW5nLCB0aGUgTUNUUCBpcyBhIGJ1cyBhZ25vc3RpYyBwcm90b2NvbC4NCkEgZ2Vu
ZXJpYyByYXcgcGFja2V0IGludGVyZmFjZSBtYWtlcyBpdCBtb3JlIGZsZXhpYmxlIHRvIGFkYXB0
IHRvIGRpZmZlcmVudCBpbnRlcmZhY2VzLg0KDQo+IA0KPiAzKSBUaGUgZmxhc2ggY2hhbm5lbCBl
eHBvc2VzIHJlYWQvd3JpdGUvZXJhc2Ugb3BlcmF0aW9ucywgd2hpY2ggd291bGQgYmUNCj4gICAg
bXVjaCBtb3JlIHVzZWZ1bCBhcyBhbiBhY3R1YWwgZmxhc2gtdHlwZSBkZXZpY2UsIHBlcmhhcHMg
dXNpbmcgdGhlDQo+ICAgIGV4aXN0aW5nIG10ZCBpbnRlcmZhY2U/IE9yIGlzIHRoZXJlIGFkZGl0
aW9uYWwgZnVuY3Rpb25hbGl0eQ0KPiAgICBleHBlY3RlZCBmb3IgdGhpcz8NCg0KVGhlIGZsYXNo
IGNoYW5uZWwgd29ya3MgaW4gZWl0aGVyIHRoZSBNYXN0ZXIgQXR0YWNoZWQgRmxhc2ggU2hhcmlu
ZyAoTUFGUykgb3IgU2xhdmUgQXR0YWNoZWQgRmxhc2ggU2hhcmluZyAoU0FGUykgbW9kZS4NCg0K
Rm9yIE1BRlMsIEJNQyBpc3N1ZXMgZVNQSSBmbGFzaCBSL1cvRSBwYWNrZXRzIHRvIHRoZSBIb3N0
Lg0KSW4gdGhpcyBjYXNlLCBpdCBtYXkgZml0IGludG8gdGhlIE1URCBpbnRlcmZhY2UuDQoNCkZv
ciBTQUZTIChtb3N0bHkgdXNlZCksIEJNQyBuZWVkcyB0byBsaXN0ZW4sIHBhcnNlIGFuZCBmaWx0
ZXIgZVNQSSBmbGFzaCBSL1cvRSBwYWNrZXRzIGZyb20gdGhlIEhvc3QuDQpBbmQgdGhlbiBzZW5k
IHJlcGxpZXMgaW4gdGhlIGVTUEkgc3VjY2Vzcy91bnN1Y2Nlc3MgY29tcGxldGlvbiBwYWNrZXQg
Zm9ybWF0Lg0KVGhpcyBiZWhhdmVzIGRpZmZlcmVudGx5IGZyb20gTVRELg0KDQpUbyBzdXBwb3J0
IGJvdGggdGhlIHR3byBzY2VuYXJpbywgdGhlIE1URCBpbnRlcmZhY2UgbWlnaHQgbm90IGJlIHN1
aXRhYmxlLg0KDQo+IA0KPiA0KSBUaGUgcGVyaXBoZXJhbCBjaGFubmVsIGlzIHRoZSBvbmx5IG9u
ZSB0aGF0IHdvdWxkIHNlZW0gdG8gcmVxdWlyZQ0KPiAgICBhcmJpdHJhcnkgY3ljbGUgYWNjZXNz
LCBidXQgd2UnbGwgc3RpbGwgbmVlZCBhIHByb3BlciB1YXBpIGRlZmluaXRpb24NCj4gICAgdG8g
c3VwcG9ydCB0aGF0LiBBdCB0aGUgbWluaW11bSwgeW91ciBpb2N0bCBkZWZpbml0aW9ucyBzaG91
bGQgZ28NCj4gICAgdW5kZXIgaW5jbHVkZS91YXBpLyAtIHlvdSBzaG91bGRuJ3QgbmVlZCB0byBk
dXBsaWNhdGUgdGhlIGhlYWRlciBpbnRvDQo+ICAgIGVhY2ggdXNlcnNwYWNlIHJlcG8sIGFzIHlv
dSd2ZSBkb25lIGZvciB0aGUgdGVzdCBleGFtcGxlcy4NCg0KSW4gdGhlIGZpcnN0IHN1Ym1pc3Np
b24sIEkgd2FzIHRvbGQgdGhhdCB0aGUgaW5jbHVkZS91YXBpIHBhdGNoIGlzIG5vdCBnb2luZyB0
byBiZSBhY2NlcHRlZC4NClRoZXJlYnksIEkgcmVmZXIgdG8gb3RoZXIgZXhpc3RpbmcgZHJpdmVy
IGltcGxlbWVudGF0aW9uIHdoaWNoIHBsYWNlcyBJT0NUTCBjb2RlcyBpbiB0aGVpciBvd24gZHJp
dmVyIGZpbGVzLg0KDQoNCkluIHN1bW1hcnksIGNvbnNpZGVyaW5nIHRoZSB2YXJpb3VzIGFwcGxp
Y2F0aW9ucyB0aGF0IG1pZ2h0IGJlIGNvbnN0cnVjdGVkIHVwb24gZVNQSSB0cmFuc2FjdGlvbiwN
CndlIHRob3VnaHQgdGhhdCB0aGUgcmF3IHBhY2tldCBwYXJhZGlnbSBtaWdodCBiZSB0aGUgZmly
c3Qgc3RlcCB0byBzdGFydCB3aXRoLg0KDQpSZWdhcmRzLA0KQ2hpYXdlaQ0K
