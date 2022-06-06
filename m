Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4597153DF7C
	for <lists+openbmc@lfdr.de>; Mon,  6 Jun 2022 03:46:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGbtm182Dz3bhf
	for <lists+openbmc@lfdr.de>; Mon,  6 Jun 2022 11:46:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=FMSnP2pP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:704b::706; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=FMSnP2pP;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20706.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::706])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LGbtB3j61z30Bk
	for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2022 11:45:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kdAJlgDA3NdywD001UXQoAshJL8E6f7jCKEk4Btjc5GMhByCnXhM8UJkl2kaNO7E9ibMsWaXSxqOjABr7Crjv34oX0WoLD3QEfW1aeVEbQaZfGZTjmeQ9BCk1PqazDzmvyUpKHBKRsmYewRTL3bXtrbDupbMsKWEjEDOslkOdlG8W1LVY2ddTQdY7/hmIzwCkTIrCMwUXeQOkqbN0hAUvoW7nAwZhKioUUdSBgBh8wxGe0p+9qiRWgLSlxImlEjPLxFE/OgGrJ3yHCkSt7qNB17x4XRoHykUzmS0NetdnM67WB7nXmephISEKfTl1OUApL/HmS7qBbA7n9lvwAfOsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0NGZJJ8ghOkv0tAaePSuuWT2WQ1lTzhBi8mpgP0qOM=;
 b=F4ws9AVVnO9o73tX5G3UgztBDWRjW6uPz0pUuJiMzW/iZ1ki3GeacyMjvYsyTk3s29r4908nsExd+msBKl1H1LENZnFkx94yLqZY8Jb9M1lbkw56OoLo+agGAX12yxLO/f1qid2oZoFBBsQ2rpm+UPiQtnCssohbVhx/wiFqNCCmUsxmc29wXgL3rnBsQPW7RfyfwJ6oi7peYxJTCxbuEvR7sehnsgWIgCGedDqo+MUnJA1St/tLBoRsJAFnAZKXYHbt/bezj+fhM9Q7WCoJ912cNacad3Ld7E3tZqX/ZhQQWS7wVqrsPk3yvm0+po0SEPQTrg8ER0eNuYJrpyT0Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0NGZJJ8ghOkv0tAaePSuuWT2WQ1lTzhBi8mpgP0qOM=;
 b=FMSnP2pPU81FfOPcSHyQrsWYzIKl4GvLOOUNGLolk5eMNmKr5//ruGn2SvC1y95ZpiqEHGfmr1SuZ9MMB7bnQFYpaAX3T2a78kFdiCWhvUwJCS4U++6X4jPzkrpH4ntQGpLJGw3gNMZ3gG3UEWDZ9meXKi1yude+QcLBHG9Lx5TrS+dWZtmx78CqDScb3rhzXgTSzvGIcr0g0o80muM0IGW0sd1f13zFCnXV5TUwk4EBPGCng+N//u2FfwoaUaosx8hb6icN7svIGG6zq5TlzqjOglFc58l6UbLwjdcyVs9iKzkGuMNYmEc/IRAfTOnrAx26D1QyoXVaUI6iXlbB5A==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by PS1PR06MB2854.apcprd06.prod.outlook.com (2603:1096:803:41::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.14; Mon, 6 Jun
 2022 01:45:30 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::f9a1:d199:45ac:8bd9]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::f9a1:d199:45ac:8bd9%6]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 01:45:30 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Howard Chiu <howard_chiu@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: [PATCH u-boot v2019.04-aspeed-openbmc] configs: aspeed: Add SPL
 FIT image loading support
Thread-Topic: [PATCH u-boot v2019.04-aspeed-openbmc] configs: aspeed: Add SPL
 FIT image loading support
Thread-Index: AdhZS9Re5KF3nVCRQ++HsIG7JY9BGgf+x0Xg
Date: Mon, 6 Jun 2022 01:45:29 +0000
Message-ID:  <HK0PR06MB37794BB30922645DE9A160BD91A29@HK0PR06MB3779.apcprd06.prod.outlook.com>
References:  <SG2PR06MB2315D4EDA1E2C782AE5334B8E6FB9@SG2PR06MB2315.apcprd06.prod.outlook.com>
In-Reply-To:  <SG2PR06MB2315D4EDA1E2C782AE5334B8E6FB9@SG2PR06MB2315.apcprd06.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c5e3bd9-0cad-44be-0d08-08da475e3ce5
x-ms-traffictypediagnostic: PS1PR06MB2854:EE_
x-microsoft-antispam-prvs:  <PS1PR06MB285456E480C7859A0D715CB091A29@PS1PR06MB2854.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  6uyWvGxNlmK3Rz+3tkvZghtb3D0C86jxgXHz5GcJ3mgok5ODnE2/xWjTrazKN+OkZVpSHUQ2UnJyNcvcHG7VZrqET+vh+9IUDLjtsORstmwVm8F7YzCejWu7caCaGqn4K8uWwCrOtzkC4Ip93qI8l7j/MOTeiCS7z5moiNhKeOx4LW3XZCGpUe5EnAU60hnlnhY2Bs95trLZfmktEpfgKOr4XmKBMIxxop5c3U7vTqyLYVMtALMvfx3IRUCIXpWQivRgi/mMVw2vJWXZWVLbKHCXSc/xpyGDHAOIY4QUM6mZ1w891IEIbQnM0rSV4Rf7prIZUcqzoonyOuhB5YdfhpYSw8G2xogWUeWcsIlcqdZJJGOQrbN+MB/qvB7s/tcmUFHmHurDoX6Vxqs7nfS8/vkkUXkisXWL+9OR4P0jWzzaArXgAOlLNj5znk0mQgTLKcjCd19pnFuFCd6JIbojAQV6d5GA9BWCi47mR6hUulIj4iC59lZzvEWLhmz6/gMCBPSjVzNItejeA6W3ZR4uoc5pzyOSwocrKTqA2x8GbYb8Q5Vfm+3fOU8sssAZ9CkI67PhK8uR02ToE3K3bqVwAHhWudgDzQtn2cF9j7y5on0DE96FqujTOervGSuYI5VS/fqF/O67OuSKuRyb8k2x1Ug2n60j1ITu8r29Px8hMdi+AjmGhHr9A6vrtx6eAv7EiDo/h+HdUDLfxBEsmswxzw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR06MB3779.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38070700005)(107886003)(66556008)(76116006)(66946007)(508600001)(8936002)(2906002)(110136005)(55016003)(86362001)(83380400001)(64756008)(66476007)(4326008)(316002)(8676002)(66446008)(5660300002)(122000001)(71200400001)(26005)(33656002)(38100700002)(7696005)(6506007)(52536014)(186003)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RGI2SCtQZUZaY2dTOG5EZGQ1c2VCQnFwYlF0eWxOZmlhL1FzZGxFYWkyQUxh?=
 =?utf-8?B?eGl1K3EyZ1hYSVFPVXdOM2ZFT2RnUVBlM0JDYm5qWjhrTTFvWXV0alJQemZo?=
 =?utf-8?B?Z1VsOVNmdDYzTllqaVp6cHBYcGcrLzZhTVc1d3lQTzI0b1ZOKzB5czRxSFZh?=
 =?utf-8?B?WXZVc1Z4K2hSQjUwRnZxazE0ZlIwczVvaGpjbUdESUlXMmFaOEFXQTlTVHJk?=
 =?utf-8?B?eXZKS3BOVmptd1dLZHJjT1FjbHU3TC9XTDdNMmI2dTdQMmNiT2RZUVp4citN?=
 =?utf-8?B?K01qSnhVbjZHcTRVQ2RpZnZ4NWVpNUpiMW0rNGxQMzBLRXJ2WlRIUE9yRnZs?=
 =?utf-8?B?YitwT3FCVXQra3E1bjdqdTBKN2NWNytCdGhFcERpOVd0REw2VHdSZFVBUC9R?=
 =?utf-8?B?dkU4WDVhZVlVL2owK2xwc0Rkak9vZVQvNnhmeDBObUR5R2h2VkhWNzhzTmZP?=
 =?utf-8?B?QzBadFhMbXZSNHlQK0dFbVNNVjhrTHVuVE9QellhUyt4R2F2MEFoanE5T09I?=
 =?utf-8?B?Mll6c3JSMGVLR2t0ejc1WlpROHVVRFNmMkp2K3kwYUM4OVU5a0MvZEVoM29i?=
 =?utf-8?B?ZUtMWi95K1FNUTc4Qytwam1WcUdpR1lIQklqRld2a0RHZ09BcmpIRVNDS0hu?=
 =?utf-8?B?WHBVY3FQRFp1U2ZWYkZ0OEVXYW0rOE1qUWprZEZjVmJVOVh4RnZUc3FWY3VG?=
 =?utf-8?B?SVVkUEt5SmQ0eEljU1l1ZTZBRldxR1lkZ2I3KzlkV0F5dnNhcHFtU1dmZHlP?=
 =?utf-8?B?Wk01Zm9Ld0Z2RDBFNjA5bkl2cnkzN2xlQkFzVVN3aHJnNldVUjM0UExFQzZP?=
 =?utf-8?B?bkZIOHpPVVVxK0tjcmFBeW9iMGlGQm83VUtFV1dKdHg2RGp3M09SWms2dmVp?=
 =?utf-8?B?WkxKQXV2U011SC84emNWaE1jY2IyN3hwZzZEQlZNdXh6bzgyQ3JVQnV2MkFF?=
 =?utf-8?B?amhELzJpTkhlUVVpVURKOTV4ZGVvVUNlckh4bnF2QUNCMnhoTjFrUytHN1J0?=
 =?utf-8?B?UlV1enBNd1R4SzA3MUpxQXpWTWZNSkdEL3hGRHZmZ2pmSmRMeGlzM0dXcTFy?=
 =?utf-8?B?WUZhOEhuRlYyQVFhbUhDZUlZVG9hTm9YVFVETGNvTmU3UjJlSDVIL1BOWUNH?=
 =?utf-8?B?eHNLK3daOXMxNW9kbHZtUk5lUWh3QVdsV3QrOXlsWkxYR283RUFFRmVpVEQw?=
 =?utf-8?B?UUVQc3pxelhvWHY0bHFheWJTVXpvYlg4QnRLa0dzZks2VHVDSy9sWUpldUR1?=
 =?utf-8?B?NVhCUE5FSDZSNDd0ZmhBSlRYRTMva1ZCMzA5UHRVQVoxanBFN3hlcUcxSXRr?=
 =?utf-8?B?bW81aUEwNEpPMkFxTW4ydlhhTHJPTE8zOG1DclUvRmZOU2VOeU0yUnVpclFP?=
 =?utf-8?B?NCs4T2VXRU1qWmRxNFpBRVdMZGJabE0ycS9IUDBOQW1KTTBqaVdrOXlOKzAz?=
 =?utf-8?B?MmtyKzRjQ2NwU3hJeC9xWlpHbmlQVlYyU2RLVzU0cFd4OTFwUkNmNkNMWk1S?=
 =?utf-8?B?UnFHb0R5TnFKVkY3dEI3eDVwakVMR3M4QXJVQkhYV3dJMFlxbkk3TzZRaUxh?=
 =?utf-8?B?Rm1nMVhiRlpMTkc1MUNDMm9lbGwzbUd5blZFdTJiVWVDZm9FajBrTUhvWG5h?=
 =?utf-8?B?U2lRWEh4NWxpRmgzenpXWUExNzVyTEJBS1RyMmJrbjljdjc4aWFlVm9heVMy?=
 =?utf-8?B?TEF2M2RNQVQ1OWt3OEVmUlpzYVpwS2JlelN0VU9Udllxd2FXUHdHN0hvdnBw?=
 =?utf-8?B?Z0daZk1PVFFDL2NpNzc1K3FNVzlHaTVQeDBMNWNuZnJUREtUQVdvK041RmxM?=
 =?utf-8?B?bkRwQ3pOL1ZkejV2MGtKVkVMbFUyRzA3SCttUmp5YXQrMHB1VzJOSk9XMDUz?=
 =?utf-8?B?NElhVnBMZ1hZaWJnVE0zTFozKzVVU0JuamFpZFg5Q3hxbC9IaGRrVGttSkFU?=
 =?utf-8?B?bm54WldiclQ1WTlpQTdpZlhkQ0cwVDNpdE1UNEc0djVCL0FRaDJiclpmMEkw?=
 =?utf-8?B?dHduWWF6MG9oZlFJNmp4ME1IdmlpQXJaL1hyQWpIeG0vNWxVVXhGNFZLVHlj?=
 =?utf-8?B?SGo3cHlMcm1oWCs5T0wvVktUd2dqZE1PaytVWTRxS2RDUGxqSENyRk4vRUhW?=
 =?utf-8?B?aGJDWFh6UzBsSUNYV3F4L1JUQzZKcjVxTUhrajNKN3NJQlhScU1nN3dwYURO?=
 =?utf-8?B?dFg0MFVhNzVpeGFPWDZZOVFvK0tKVzdMUnpFd1BUU0NnZFBzd3UxNEZpb2p1?=
 =?utf-8?B?Ny9ENDhjU0VYd0g3T3ZUK1N3VVFOTGlMdTFHUkdrSFpZWVQzV2ZDZTkrd0pF?=
 =?utf-8?B?dUVGMzRHMmVWTDkyWFhEVEZsOGpKN3FrN1pqb05SNkpRaGRXQW5oYkZNU095?=
 =?utf-8?Q?yuNRB81nFaQf/43Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c5e3bd9-0cad-44be-0d08-08da475e3ce5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2022 01:45:30.0019
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4nkab+y2UOfv0d3CF4Xgg3ro9hwRmvml3kYlcXQaFhyXob9fQcaJalx8JH116GPVEoc/dQU1fDfys2Pzxb28Hc8csfprQ1/aDj7sdovi6N0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PR06MB2854
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
Cc: Troy Lee <troy_lee@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

R2VudGxlIHBpbmcgb2YgdGhpcyBwYXRjaC4NCg0KUmV2aWV3ZWQtYnk6IENoaWEtV2VpIFdhbmcg
PGNoaWF3ZWlfd2FuZ0Bhc3BlZWR0ZWNoLmNvbT4NCg0KPiBGcm9tOiBIb3dhcmQgQ2hpdSA8aG93
YXJkX2NoaXVAYXNwZWVkdGVjaC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEFwcmlsIDI2LCAyMDIy
IDU6NDQgUE0NCj4gDQo+IDEuIERpc2FibGUgQVNQRUVEX0xPQURFUlMgdG8gaW5zdGVhZCB1c2Ug
Z2VuZXJpYyBGSVQgaW1hZ2UgYm9vdGZsb3cNCj4gMi4gRW5hYmxlIFNQTF9MT0FEX0ZJVCBhbmQg
RklUIGhhc2gvc2lnbmF0dXJlIHZlcmlmaWNhdGlvbg0KPiAzLiBFbmFibGUgU0hBIGZhbWlseSBz
dXBwb3J0DQo+IDQuIEVuYWJsZSBIQUNFL0FDUlkgY3J5cHRvIGVuZ2luZQ0KPiANCj4gVGVzdGVk
IHdpdGggQVNUMjYwMC1BMyBFVkINCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhvd2FyZCBDaGl1IDxo
b3dhcmRfY2hpdUBhc3BlZWR0ZWNoLmNvbT4NCj4gLS0tDQo+ICBjb25maWdzL2FzdDI2MDBfb3Bl
bmJtY19zcGxfZGVmY29uZmlnIHwgMzAgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tDQo+ICAx
IGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvY29uZmlncy9hc3QyNjAwX29wZW5ibWNfc3BsX2RlZmNvbmZpZw0KPiBiL2Nv
bmZpZ3MvYXN0MjYwMF9vcGVuYm1jX3NwbF9kZWZjb25maWcNCj4gaW5kZXggOThhYTNmMTYwZS4u
OTAyNTQwMWUwYyAxMDA2NDQNCj4gLS0tIGEvY29uZmlncy9hc3QyNjAwX29wZW5ibWNfc3BsX2Rl
ZmNvbmZpZw0KPiArKysgYi9jb25maWdzL2FzdDI2MDBfb3BlbmJtY19zcGxfZGVmY29uZmlnDQo+
IEBAIC04LDE3ICs4LDcgQEANCj4gQ09ORklHX1NQTF9MRFNDUklQVD0iYXJjaC8kKEFSQ0gpL21h
Y2gtYXNwZWVkL2FzdDI2MDAvdS1ib290LXNwbC5sZHMiDQo+ICBDT05GSUdfQVJDSF9BU1BFRUQ9
eQ0KPiAgQ09ORklHX1NZU19URVhUX0JBU0U9MHgxMDAwMA0KPiAgQ09ORklHX0FTUEVFRF9BU1Qy
NjAwPXkNCj4gLUNPTkZJR19BU1BFRURfVUJPT1RfU1BJX0JBU0U9MHgxMDAwMA0KPiAtQ09ORklH
X0FTUEVFRF9VQk9PVF9TUElfU0laRT0weGUwMDAwDQo+IC1DT05GSUdfQVNQRUVEX1VCT09UX01N
Q19CQVNFPTB4MDAwMDAwDQo+IC1DT05GSUdfQVNQRUVEX1VCT09UX01NQ19TSVpFPTB4NzAwDQo+
IC1DT05GSUdfQVNQRUVEX1VCT09UX1VBUlRfU0laRT0weGUwMDAwDQo+IC1DT05GSUdfQVNQRUVE
X1VCT09UX0RSQU1fQkFTRT0weDgxMDAwMDAwDQo+IC1DT05GSUdfQVNQRUVEX0tFUk5FTF9GSVRf
U1BJX0JBU0U9MHgyMDEwMDAwMA0KPiAtQ09ORklHX0FTUEVFRF9LRVJORUxfRklUX1NQSV9TSVpF
PTB4MTAwMDAwMA0KPiAtQ09ORklHX0FTUEVFRF9LRVJORUxfRklUX01NQ19CQVNFPTB4ODAwDQo+
IC1DT05GSUdfQVNQRUVEX0tFUk5FTF9GSVRfTU1DX1NJWkU9MHg4MDAwDQo+IC1DT05GSUdfQVNQ
RUVEX0tFUk5FTF9GSVRfRFJBTV9CQVNFPTB4ODMwMDAwMDANCj4gKyMgQ09ORklHX0FTUEVFRF9M
T0FERVJTIGlzIG5vdCBzZXQNCj4gIENPTkZJR19UQVJHRVRfRVZCX0FTVDI2MDBBMT15DQo+ICBD
T05GSUdfU1BMX0xJQkNPTU1PTl9TVVBQT1JUPXkNCj4gIENPTkZJR19TUExfTElCR0VORVJJQ19T
VVBQT1JUPXkNCj4gQEAgLTM0LDE5ICsyNCwzMCBAQCBDT05GSUdfQVJNVjdfQk9PVF9TRUNfREVG
QVVMVD15DQo+ICBDT05GSUdfQVJNVjdfUFNDSV9OUl9DUFVTPTINCj4gIENPTkZJR19OUl9EUkFN
X0JBTktTPTENCj4gIENPTkZJR19GSVQ9eQ0KPiArQ09ORklHX0ZJVF9FTkFCTEVfU0hBMzg0X1NV
UFBPUlQ9eQ0KPiArQ09ORklHX0ZJVF9FTkFCTEVfU0hBNTEyX1NVUFBPUlQ9eQ0KPiArQ09ORklH
X0ZJVF9TSUdOQVRVUkU9eQ0KPiArQ09ORklHX1NQTF9GSVRfU0lHTkFUVVJFPXkNCj4gK0NPTkZJ
R19TUExfTE9BRF9GSVQ9eQ0KPiArQ09ORklHX0lNQUdFX0ZPUk1BVF9MRUdBQ1k9eQ0KPiAgQ09O
RklHX1VTRV9CT09UQVJHUz15DQo+ICBDT05GSUdfQk9PVEFSR1M9ImNvbnNvbGU9dHR5UzQsMTE1
MjAwbjggcm9vdD0vZGV2L3JhbSBydyINCj4gIENPTkZJR19VU0VfQk9PVENPTU1BTkQ9eQ0KPiAt
Q09ORklHX0JPT1RDT01NQU5EPSJib290bSAyMDEwMDAwMCINCj4gK0NPTkZJR19CT09UQ09NTUFO
RD0icnVuIGJvb3RzcGkiDQo+ICBDT05GSUdfU1lTX0NPTlNPTEVfRU5WX09WRVJXUklURT15DQo+
ICBDT05GSUdfRElTUExBWV9CT0FSRElORk9fTEFURT15DQo+ICBDT05GSUdfQVJDSF9FQVJMWV9J
TklUX1I9eQ0KPiAgQ09ORklHX0JPQVJEX0VBUkxZX0lOSVRfRj15DQo+IC0jIENPTkZJR19TUExf
UkFXX0lNQUdFX1NVUFBPUlQgaXMgbm90IHNldA0KPiArQ09ORklHX1NQTF9CT0FSRF9JTklUPXkN
Cj4gICMgQ09ORklHX1NQTF9MRUdBQ1lfSU1BR0VfU1VQUE9SVCBpcyBub3Qgc2V0DQo+ICBDT05G
SUdfU1BMX1NZU19NQUxMT0NfU0lNUExFPXkNCj4gIENPTkZJR19TUExfU1RBQ0tfUj15DQo+ICBD
T05GSUdfU1BMX1NFUEFSQVRFX0JTUz15DQo+ICtDT05GSUdfU1BMX1NIQTFfU1VQUE9SVD15DQo+
ICtDT05GSUdfU1BMX1NIQTI1Nl9TVVBQT1JUPXkNCj4gK0NPTkZJR19TUExfU0hBMzg0X1NVUFBP
UlQ9eQ0KPiArQ09ORklHX1NQTF9TSEE1MTJfU1VQUE9SVD15DQo+ICtDT05GSUdfU1BMX0ZJVF9J
TUFHRV9USU5ZPXkNCj4gIENPTkZJR19TUExfRE1fUkVTRVQ9eQ0KPiAgQ09ORklHX1NQTF9SQU1f
U1VQUE9SVD15DQo+ICBDT05GSUdfU1BMX1JBTV9ERVZJQ0U9eQ0KPiBAQCAtOTUsNiArOTYsOCBA
QCBDT05GSUdfU1lTQ09OPXkNCj4gIENPTkZJR19TUExfT0ZfVFJBTlNMQVRFPXkNCj4gIENPTkZJ
R19DTEs9eQ0KPiAgQ09ORklHX1NQTF9DTEs9eQ0KPiArQ09ORklHX0FTUEVFRF9IQUNFPXkNCj4g
K0NPTkZJR19BU1BFRURfQUNSWT15DQo+ICBDT05GSUdfRE1fR1BJTz15DQo+ICBDT05GSUdfQVNQ
RUVEX0dQSU89eQ0KPiAgQ09ORklHX0RNX0kyQz15DQo+IEBAIC0xMzIsNCArMTM1LDUgQEAgQ09O
RklHX1dEVD15DQo+ICBDT05GSUdfVVNFX1RJTllfUFJJTlRGPXkNCj4gIENPTkZJR19UUE09eQ0K
PiAgQ09ORklHX1NQTF9UUE09eQ0KPiArQ09ORklHX1NQTF9USU5ZX01FTVNFVD15DQo+ICAjIENP
TkZJR19FRklfTE9BREVSIGlzIG5vdCBzZXQNCj4gLS0NCj4gMi4yNS4xDQoNCg==
