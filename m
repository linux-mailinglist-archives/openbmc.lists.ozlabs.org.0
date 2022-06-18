Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC89551230
	for <lists+openbmc@lfdr.de>; Mon, 20 Jun 2022 10:10:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRMl40dZQz3bt6
	for <lists+openbmc@lfdr.de>; Mon, 20 Jun 2022 18:10:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=TWG0GJ07;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::602; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=TWG0GJ07;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on0602.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::602])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LQNWj4MCgz3blW;
	Sun, 19 Jun 2022 03:41:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WIDhFByYOdQYMMHy3r+kr4lGgnXSVZNA/xQjfAa1KFokw74rt4JmxtJKe/hquYQqhk8ZqbIuz3elQlCMJgasCrwt5pfaJal8jIekBowxLy4HuTUv+yHCuahHBfO9MOYwZwy4WR3+Fw/vuzHeTgggZw349D42I9fq//li+n3wCA3AOlLvTk0mNLsqHh3IUZf5sCmCeHo6KLpIiSqEp432Rf/W7nllev/HdsLdPnqRtk/kmU6CQYOmfjKHQZhcRMe5EY+B4125Qm6xUXZS6LN+FGQ+b61b1KbFAPu7jj+hPOf5NfbG8PhT9R3VO2zdIH8w4ioqnSZcYUo7/SVIy033CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vss6WYj0T9HZWtlzmC/I/FWSHmBTEyR0wC1cbNHL3o8=;
 b=IkSV7Xhhe9mIm978E7V+dBtnljtl5uYUvFg660LJmiSg1XAvuOlFcE500qC6TDewoexcTFoThSfMe9ZD+fsJwh9xxcMdqxyPRbnmUjl2BKS+jyaSFVy79lzumE+S/sgMKRVUlACKe6Jth3+VS9CtUGvU/i+8pZRcJLr6dxvvH6nFhTdaOBzvf6kBVqRrtHAkip0lgBgjnP3Exy4cdHxpV5ltn4QmaGwezWGsX8LlqjApEn1eE8dWHZi5LYLZ9gHsqMCwEjFUT2zG4tJuoC8mYVZ3VcWp7C8DONidJIwBcOJA8kOC4mp0IP9HLfTjczyXH7H1+AOeap4pcG/CGjHHUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vss6WYj0T9HZWtlzmC/I/FWSHmBTEyR0wC1cbNHL3o8=;
 b=TWG0GJ07dovlpFjobDpu/dciQtNdxvPF0XRwG5pnTsYWbaCsobMd0DM6K8m5ruRcpI3l84RlBwCTTwgLuwzehjPTLa0RIk0RDPbLSjiUHha+yB6/SBV3b3KtD4zbTOmgqieSVVsMn8uQzYUTK6BFGCA48L1v3obw+NDpKX1MCQ4Iw43oqVZI7INBfjFqCvjmrYPojDbLwVgTRgvcqnigK88hZq+tOAvOTJgCzqz6Ph5vLDk7pnnyVPhMR4ocUAWQbfjPWBjxueo4ULBJ4vof4djplGgjTWSJ+Qgh8CIR8i8fnrRoz8LzaWzZSM/eXv4ceivds8Oiot/qiak6ZA4GFg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2344.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Sat, 18 Jun
 2022 17:41:29 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5353.019; Sat, 18 Jun 2022
 17:41:29 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: David Gow <davidgow@google.com>, Brendan Higgins
	<brendanhiggins@google.com>, Luis Chamberlain <mcgrof@kernel.org>, Jeremy
 Kerr <jk@codeconstruct.com.au>, Daniel Latypov <dlatypov@google.com>, Shuah
 Khan <skhan@linuxfoundation.org>, Andrew Jeffery <andrew@aj.id.au>, Mika
 Westerberg <mika.westerberg@linux.intel.com>, Andra Paraschiv
	<andraprs@amazon.com>, Longpeng <longpeng2@huawei.com>
Subject: Re: [PATCH 0/5] Rework KUnit test execution in modules
Thread-Topic: [PATCH 0/5] Rework KUnit test execution in modules
Thread-Index: AQHYgvJ1N2fjOlbNtEStQadITUuqb61Vb1uA
Date: Sat, 18 Jun 2022 17:41:28 +0000
Message-ID: <87335c4a-7050-79e3-ec5c-4684a180193a@csgroup.eu>
References: <20220618090310.1174932-1-davidgow@google.com>
In-Reply-To: <20220618090310.1174932-1-davidgow@google.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7170523-0bdf-4196-a1ba-08da5151c680
x-ms-traffictypediagnostic: PR0P264MB2344:EE_
x-microsoft-antispam-prvs:  <PR0P264MB2344275915FD26CD24D5EB41EDAE9@PR0P264MB2344.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  QGtXzF1SndR/L0HBs7K1bDR7xWd02wZn9f8Zvyo8JRz+nXwwUe6m6Z595gMmcTRtgdxdKe1dXFIJbzns+TKROeELAH8S1uPZ8CJsFVsiP1zHsK9/cXl6Byu5IFpSGBNTv9Z0jpwush6o4WL+2sDScpgAUSnPowIg3WZHfdUQi4IgGw2HiCmRcBO+XT1L0gOi1V1dpJHd+VzYV2usADMs7lfWZxEZr4jAo2r6v+1aN0vZJnvrWSDM/Ab9Bjh22KasoJWvoA4psq+2UW7Bh1tWpA80US2jlXn9aOxFreZE/Znzek8CcjH4EYMxzMc2fsouaGMZ2w7tj0dwHCEdUW80kjFfw0AC0iRbWZKOeMr7IMTexzxnYQJ2x1bKLnSe1boatxmvsxu4oTZqJP08SyslKdIPRQw72wn/g7ByrIgxFbkw+BCunq0A8p41KAetgjJM55Bf/E8EAt735kZXhpr5qgYVO5ZTSMAvKHJrnjRPC02icLhW5ZpPXJ7FHZhk8B6yr6E9/z0rakDRgU697wdHZa1E/MVTBpTkNv/4hByKGoSMiVeiU2S5kGnXDmXCeN/a5MIHFDjHrmcjUsdnc17+P0dDSI9DM41+dXjtHg5kbOQPtNMxURw/YUoSHCR1tsPAnUA7fe+DkV0lSWWVynJIo5CwgOAOF18mQyxlVqpiA0llJcjWSmoPFs8txMN6Q5Hg5g6GChUgZ+MthHOzgk1o5MaRvRHYABzwMBMZkGLQWcBLGb107jnHrsHLsQ4HdySdVhwgZqsqDbOjLxErcFv53QytKrnRr7VVAh9y5sy7JkY=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(6512007)(26005)(6486002)(36756003)(86362001)(38100700002)(316002)(31686004)(6506007)(2906002)(498600001)(76116006)(66946007)(64756008)(66446008)(4326008)(8676002)(31696002)(5660300002)(7416002)(44832011)(8936002)(966005)(66476007)(71200400001)(122000001)(91956017)(66556008)(54906003)(921005)(66574015)(2616005)(186003)(110136005)(83380400001)(38070700005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Nzg4dEt5bFB6bmliSjVWRGxHRW5vQ2twOHBJZEpvVWNKSEdiSHcvT3pDckZl?=
 =?utf-8?B?eWxsVGFwOW05Vll4SWlRUDZWZmlPdkNlWHRzQkorRzg4NTdkRm5lcjJ3bmhZ?=
 =?utf-8?B?Umc0ZWxnd0t5QmdxYVUxUTdFTzdmK0lMRFlQWVRCRFphNUM1ZVZaNFI5dTNz?=
 =?utf-8?B?VGpsY2tub1FpcUhnbGFQNndwTDhwSUJCcmp5TWJLMjM2ajJmcjZIdUZCeDZR?=
 =?utf-8?B?MzBSaHBmakc4d1VMMGZyMzNITjhoRWdyWWpaS3pqWnk3Ly9POVJEYUdaeWJp?=
 =?utf-8?B?K2NuZWplYzduR0VyUVpUc2pGTnF6MXQ5TDI4TlhNVysyS0YxTk9kRnF5a2pZ?=
 =?utf-8?B?b0phdGF3YVg4cjRtNllmNCtNa3RFb05URWROYnJYTUZsNEorbFhuRy9KSFNV?=
 =?utf-8?B?c1dEc1FBaEtwSGpjRDkrT25rNmxQSHlqcWZWZHR4WVdQcE5VWkpTZjBrL25R?=
 =?utf-8?B?aE04bi9TNmx0WFFvRjN6eFpXSVEzVkRvS2FMVW5XYXBqY3FQRDNMd0tleGRx?=
 =?utf-8?B?OVQrSC8vcmY0L1h5UUpaR2F5RmRUOU1Qc2QxMkp4WWFJcE9MV0pWazkvcjhz?=
 =?utf-8?B?S0FlWDdZQS9Od2xqNW83dTNrc3pLMkdDdXJFbGJheEhQN1JXUUloNSs5R3ZI?=
 =?utf-8?B?NXBNNDF1c2h0WEhjNkllQXBoU0c1R0h4K2pKOVN0Ym9yT0hnczNDSnhoQ05L?=
 =?utf-8?B?SlZWbzRHZVROczF0RWxnTWN0aVM4Ky9rekJRZ3Y1V3REY3Y1akx5ZHBDQUZY?=
 =?utf-8?B?WnQwVVdlYThmNGJVQlVZbU5FQkwybnphN0tPVndRVkZWMThSNFNkdVl6NVdO?=
 =?utf-8?B?Y05iQkhHcVJ5SWxMMkdvallaUExVNklJNlp2RzdBQ3hoS1JmczBVTWFFKy9O?=
 =?utf-8?B?T01tYkVkZWZET1ZhWHlLaTRzS0VnSW54a21ncUF2Q1lzWkJQUitZRmI0ams5?=
 =?utf-8?B?V3VwTk1ISExiVkdGdElkUWdYbXlMVXh1eUh6OE5teUFMSjl3SDE2bTNaQjAr?=
 =?utf-8?B?QUN3c2NJa0tsNjgxK3N0aWx4bmFRaG1lb3ZDSlpLMHdpRUc4SThVbzdhdVRz?=
 =?utf-8?B?NGtsNDVTaUVTbC9OS1F3cTN2MGZoSHZyekl4c2RkelZCVFlLcWtPZFZqQlJM?=
 =?utf-8?B?ajRuWktQb1VGZWM0QlVXTW9veTl1WXZOT3BNZGZqRjJWL1Fwa0RoNDQzSW5V?=
 =?utf-8?B?aVdyYUVKUDFhSnNrQXZwR0JVS1p6Y1NwUTRNck9SckMrNGdzZjZJRGtQY2w3?=
 =?utf-8?B?VVlmQnpEZ1N3emt0UlY0NUlEeVVSZFhxQmlFbzNBUDVLU3Axa3h1T0hxamxt?=
 =?utf-8?B?VVhBcENxQWxnbmNBcWtqdFpRa0gvaGowTHRpTzg2dk1Oc041TC9nNFlQRGlF?=
 =?utf-8?B?TXQyMGhibStJdnBMTmNPYml1TFl1SGtaMEltbVBhTkdtQ0tYWGd5ZGVzNGQ2?=
 =?utf-8?B?Ymo1ZkNjZDJiSGdWSUpyVTJHTWcvRU1uWXh5T3pPb1BvS1BHN1ViT0ZTSzRH?=
 =?utf-8?B?WHdYUWdmMWhRbjBWWTVheXpwRk9yL2M1YkQ3L010RWo3NUZrZzV5M2tTRFNv?=
 =?utf-8?B?NGZnMEJwVDh4NTlBcVM0RERDcmpLS2RvL01SQXpGUEkrYU5KeXJ5V0JsTCtn?=
 =?utf-8?B?RUlXT05TOEpVL09tdkd1Q1duQUptSUwyMWdyQTJGbzBZREZtaTlFQzc0UVg1?=
 =?utf-8?B?UGo4RjNoRStqVVJGaUVvMi90RkN4TjZITnlENnY2aG9mTEJSWllQWVA4VHZt?=
 =?utf-8?B?bmErcm5XQ01uSnhnMjNTSmIyT0hDbEtielljM3ZYdmNkeDRoQjZWSmRQQUVV?=
 =?utf-8?B?M3hIcTIyTzVld1gwcDRkcm44WVJZN1pSUG1zUWVvV2U2S0xRNk1HYjIxdUlQ?=
 =?utf-8?B?T1JheGtzc2lNVDZxMHN6NG1tRlZqM0tYcGNlWjJ5SkhLRE1tNHgzaWQ2cVlJ?=
 =?utf-8?B?aXo1YXprUTMyZGhldVh3L2lpNXBKQWR6cCt5RjZmMXFUSFh1OVlzV3B5eGpk?=
 =?utf-8?B?ZFQwNWxjSFhGaEdwdXVEbG5lNVB4czhMd0tXTTE3OG9BTVhhbjRkbGRjRWlL?=
 =?utf-8?B?dGhEdWZEQlhXYzNqVzJJS092TWlPREpJM09QUllPcGZRYnZZQkZyUEZadDVu?=
 =?utf-8?B?Wm5QcEpmb0p3ajRzaUJ2aHN1ZDZzamFnVTd1blpmdjJ3b3FKc2x3U2YwdVFx?=
 =?utf-8?B?WXhPcS9pbGpRaU0raWs4R1d1WFZTUEh6L3ZNT05mTFJ4aDB6aEVqYnJBYXdF?=
 =?utf-8?B?WjlERVdrTFA4cWV0Q3BpN0lHVGdmWkUwWlFwYnJEZ3ZSVU85L2RvUHNiam5H?=
 =?utf-8?B?SHpSVlc4Mm5wMG4xNjRGd0lCZFBjOUJJeTQ5MktoK1F4RUNMRWxBT2Q0UnpE?=
 =?utf-8?Q?H+i/CGGFl802U1T6covhNpUoLqedPUxlTO0FO?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <96BB21E45C09994BA2638B9AE2F898BF@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b7170523-0bdf-4196-a1ba-08da5151c680
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2022 17:41:29.0241
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y4INozTJq+22pJaucHvkm3o2/Gu22eAZ+t4rH3HXqnZ0Jz1dszODRt86F94VenlKffPRNkm6J8JVcUZHCtfePnVLalamhBmxicvrD76KUK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2344
X-Mailman-Approved-At: Mon, 20 Jun 2022 18:05:43 +1000
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, =?utf-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, Matt Johnston <matt@codeconstruct.com.au>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>, "kunit-dev@googlegroups.com" <kunit-dev@googlegroups.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE4LzA2LzIwMjIgw6AgMTE6MDMsIERhdmlkIEdvdyBhIMOpY3JpdMKgOg0KPiBbVm91
cyBuZSByZWNldmV6IHBhcyBzb3V2ZW50IGRlIGNvdXJyaWVycyBkZSBkYXZpZGdvd0Bnb29nbGUu
Y29tLiBEw6ljb3V2cmV6IHBvdXJxdW9pIGNlY2kgZXN0IGltcG9ydGFudCDDoCBodHRwczovL2Fr
YS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPiANCj4gVGhpcyBwYXRjaCBz
ZXJpZXMgbWFrZXMgdHdvIGNoYW5nZXMgdG8gaG93IEtVbml0IHRlc3Qgc3VpdGVzIGFyZSBzdG9y
ZWQNCj4gYW5kIGV4ZWN1dGVkOg0KPiAtIFRoZSAua3VuaXRfdGVzdF9zdWl0ZXMgc2VjdGlvbiBp
cyBub3cgdXNlZCBmb3IgdGVzdHMgaW4gbW9kdWxlcyAoaW4NCj4gICAgbGlldSBvZiBhIG1vZHVs
ZV9pbml0IGZ1bmNpdG9uKSwgYXMgd2VsbCBhcyBmb3IgYnVpbHQtaW4gdGVzdHMuIFRoZQ0KPiAg
ICBtb2R1bGUgbG9hZGVyIHdpbGwgbm93IHRyaWdnZXIgdGVzdCBleGVjdXRpb24uIFRoaXMgZnJl
ZXMgdXAgdGhlDQo+ICAgIG1vZHVsZV9pbml0IGZ1bmN0aW9uIGZvciBvdGhlciB1c2VzLg0KPiAt
IEluc3RlYWQgb2Ygc3RvcmluZyBhbiBhcnJheSBvZiBhcnJheXMgb2Ygc3VpdGVzLCBoYXZlIHRo
ZQ0KPiAgICBrdW5pdF90ZXN0X3N1aXRlKCkgYW5kIGt1bml0X3Rlc3Rfc3VpdGVzKCkgbWFjcm9z
IGFwcGVuZCB0byBvbmUgZ2xvYmFsDQo+ICAgIChvciBwZXItbW9kdWxlKSBsaXN0IG9mIHRlc3Qg
c3VpdGVzLiBUaGlzIHJlbW92ZXMgYSBuZWVkbGVzcyBsYXllciBvZg0KPiAgICBpbmRpcmVjdGlv
bi4NCj4gDQo+IFRoZSB1cHNob3Qgb2YgdGhpcyBpcyB0aGF0IGl0IHNob3VsZCBub3cgYmUgcG9z
c2libGUgdG8gdXNlIHRoZQ0KPiBrdW5pdF90ZXN0X3N1aXRlKCkgYW5kIGt1bml0X3Rlc3Rfc3Vp
dGVzKCkgbWFjcm9zIHRvIHJlZ2lzdGVyIHRlc3QNCj4gc3VpdGVzIGV2ZW4gZnJvbSB3aXRoaW4g
bW9kdWxlcyB3aGljaCBvdGhlcndpc2UgaGFkIG1vZHVsZV9pbml0DQo+IGZ1bmN0aW9ucy4gVGhp
cyB3YXMgcHJvdmluZyB0byBiZSBxdWl0ZSBhIGNvbW1vbiBpc3N1ZSwgcmVzdWx0aW5nIGluDQo+
IHNldmVyYWwgbW9kdWxlcyBjYWxsaW5nIGludG8gS1VuaXQncyBwcml2YXRlIHN1aXRlIGV4ZWN1
dGlvbiBmdW5jdGlvbnMNCj4gdG8gcnVuIHRoZWlyIHRlc3RzIChvZnRlbiBpbnRyb2R1Y2luZyBp
bmNvbXBhdGliaWxpdGllcyB3aXRoIHRoZSBLVW5pdA0KPiB0b29saW5nKS4NCj4gDQo+IFRoaXMg
c2VyaWVzIGFsc28gZml4ZXMgdGhlIHRodW5kZXJib2x0LCBuaXRyb19lbmNsYXZlcywgYW5kDQo+
IHNkaGNpLW9mLWFzcGVlZCB0ZXN0cyB0byB1c2Uga3VuaXRfdGVzdF9zdWl0ZSgpIG5vdyB0aGF0
IGl0IHdvcmtzLg0KPiANCj4gSHVnZSB0aGFua3MgdG8gSmVyZW15IEtlcnIsIHdobyBkZXNpZ25l
ZCBhbmQgaW1wbGVtZW50ZWQgdGhlIG1vZHVsZQ0KPiBsb2FkZXIgY2hhbmdlcywgYW5kIHRvIERh
bmllbCBMYXR5cG92IGZvciBwdXNoaW5nIHRoZSBzaW1wbGlmaWNhdGlvbiBvZg0KPiB0aGUgbmVz
dGVkIGFycmF5cyBpbiAua3VuaXRfdGVzdF9zdWl0ZXMuDQo+IA0KPiBJJ3ZlIHRlc3RlZCB0aGlz
IHNlcmllcyBib3RoIHdpdGggYnVpbHRpbiB0ZXN0cywgYW5kIHdpdGggbW9kdWxlcyBvbg0KPiB4
ODZfNjQsIGJ1dCB0aGVyZSdzIGFsd2F5cyB0aGUgcG9zc2liaWxpdHkgdGhhdCB0aGVyZSdzIHNv
bWV0aGluZyBzdWJ0bGUNCj4gYW5kIG5hc3R5IG9uIGFub3RoZXIgYXJjaGl0ZWN0dXJlLCBzbyBw
bGVhc2UgdGVzdCENCg0KQnVpbGQgZmFpbHVyZSBvbiBwb3dlcnBjIGFyY2hpdGVjdHVyZSB3aXRo
IHBwYzY0X2RlZmNvbmZpZyArIA0KQ09ORklHX0tVTklUX1RFU1Q9bQ0KDQogICBDQyBbTV0gIGxp
Yi9rdW5pdC90ZXN0Lm8NCmxpYi9rdW5pdC90ZXN0LmM6IEluIGZ1bmN0aW9uICdrdW5pdF9tb2R1
bGVfaW5pdCc6DQpsaWIva3VuaXQvdGVzdC5jOjYxNjozNzogZXJyb3I6ICdzdHJ1Y3QgbW9kdWxl
JyBoYXMgbm8gbWVtYmVyIG5hbWVkIA0KJ2t1bml0X3N1aXRlcycNCiAgIDYxNiB8ICAgICAgICAg
X19rdW5pdF90ZXN0X3N1aXRlc19pbml0KG1vZC0+a3VuaXRfc3VpdGVzLCANCm1vZC0+bnVtX2t1
bml0X3N1aXRlcyk7DQogICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBefg0KbGliL2t1bml0L3Rlc3QuYzo2MTY6NTY6IGVycm9yOiAnc3RydWN0IG1vZHVsZScgaGFz
IG5vIG1lbWJlciBuYW1lZCANCidudW1fa3VuaXRfc3VpdGVzJw0KICAgNjE2IHwgICAgICAgICBf
X2t1bml0X3Rlc3Rfc3VpdGVzX2luaXQobW9kLT5rdW5pdF9zdWl0ZXMsIA0KbW9kLT5udW1fa3Vu
aXRfc3VpdGVzKTsNCiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBefg0KbGliL2t1bml0L3Rlc3QuYzogSW4gZnVuY3Rpb24gJ2t1
bml0X21vZHVsZV9leGl0JzoNCmxpYi9rdW5pdC90ZXN0LmM6NjIxOjM3OiBlcnJvcjogJ3N0cnVj
dCBtb2R1bGUnIGhhcyBubyBtZW1iZXIgbmFtZWQgDQona3VuaXRfc3VpdGVzJw0KICAgNjIxIHwg
ICAgICAgICBfX2t1bml0X3Rlc3Rfc3VpdGVzX2V4aXQobW9kLT5rdW5pdF9zdWl0ZXMsIA0KbW9k
LT5udW1fa3VuaXRfc3VpdGVzKTsNCiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIF5+DQpsaWIva3VuaXQvdGVzdC5jOjYyMTo1NjogZXJyb3I6ICdzdHJ1Y3QgbW9k
dWxlJyBoYXMgbm8gbWVtYmVyIG5hbWVkIA0KJ251bV9rdW5pdF9zdWl0ZXMnDQogICA2MjEgfCAg
ICAgICAgIF9fa3VuaXRfdGVzdF9zdWl0ZXNfZXhpdChtb2QtPmt1bml0X3N1aXRlcywgDQptb2Qt
Pm51bV9rdW5pdF9zdWl0ZXMpOw0KICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+DQoNCg0KQ2hyaXN0b3BoZQ==
