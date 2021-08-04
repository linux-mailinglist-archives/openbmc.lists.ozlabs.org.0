Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBEA3DF9F1
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 05:18:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfcQ22mgtz3bhb
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 13:18:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=HIrJ+qGn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.131.95;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=troy_lee@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=HIrJ+qGn; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310095.outbound.protection.outlook.com [40.107.131.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfcPg1xRBz30CZ
 for <openbmc@lists.ozlabs.org>; Wed,  4 Aug 2021 13:17:57 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ef6vOZrDqKa+mQFSIHwEj8VICPqgjS/xXNdLDzoZjOk92xnOd+TYiCW9SL7A+jAuoAmQ6kC4yS7p3ki3qLw3HeklItSYXjgmO/FTKHSPQqen75503RJwp472PnKDA1zY8DA3jD90UvtxvVdDhn0yPDO6+ZSNA2N7NwTS7m9zD6c9NHE7ZuU2jVulJylq+tUY+Hux3eUU0XVsSGlpzhZxEDRufO/zUm6YsosyaRmr3q+bmm3SHytxiOFk8xlhtiL35N0ORmsS3schCi1XvnzaZijZFm0eduiAntGnl6oIl41E40PcLuF6xZgdg73hvNB70WgI+fqShbpGQoQU9LqHRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nbE31b7rUkCPxc4gG+ZRcwIkOEWgjdWxG3/kSuHa/rE=;
 b=LBU9oLKazTvl0EkmYeFwX1zFYMDe1pXMaIyH/CLtof9fGX+QSr6Avs7j/fSUTK41PWpoWQo8vsx5UvkTS06Lj0ZHoqeDUER+nFz4aLL6Pg/Os70rR517+cWatSAjCwdrzbZqBAH+Mo4vR/0MgTJmolRSZwBt8YKo6Hsc04rjpfB3ZTCsimzjZCp4necOD926kSFacV7Z69h1RpLs6XDiCQ9ulU90YPx8e38GXlyTkwvC195ONQTw3pb1D307YX1dcJ+sgGGaEZ1uuApaOmfpM9eRiyFtBIkQlHuc6qZ9Yz6wHWCTFQj/UG+q9eG69ypXvUsarYck+69QkNyBFZHwAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nbE31b7rUkCPxc4gG+ZRcwIkOEWgjdWxG3/kSuHa/rE=;
 b=HIrJ+qGn60749AIfpCqlCWyB0Pcaf6R9Qb8RpB9XndHsEW4fCgKIrm7L8nm9u1xNmfJaFJZ/WzdC2Kfg+QRz1rSOVN1ysgqDO+zq6LmuTAo6Yu5Fk/jq2UGw2kXKLn5oqyd8ElhTDVHqlwGK/JCr0A0ThjyDvBbbt3qNuRgloxLrFdIUQbRrOtJE92p9DniCZ7Lw+Zo6o8jgYVsFMdaijzUk0ReT99ueN42+If7JrSnvycHq3y+V9xCeFtiibcC+5UQ38TQrboe+xpy4tVAgklETCxgi2EP+06aQdHETuhF95QWYNSa5h9AMYwFr86qpir808r4tMaknyZvHMsMwZQ==
Received: from HK0PR06MB2145.apcprd06.prod.outlook.com (2603:1096:203:4b::20)
 by HK0PR06MB3812.apcprd06.prod.outlook.com (2603:1096:203:ad::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 4 Aug
 2021 03:17:40 +0000
Received: from HK0PR06MB2145.apcprd06.prod.outlook.com
 ([fe80::70d5:73da:ac03:9781]) by HK0PR06MB2145.apcprd06.prod.outlook.com
 ([fe80::70d5:73da:ac03:9781%5]) with mapi id 15.20.4394.016; Wed, 4 Aug 2021
 03:17:40 +0000
From: Troy Lee <troy_lee@aspeedtech.com>
To: i.kononenko <i.kononenko@yadro.com>, Konstantin Klubnichkin
 <kitsok@yandex-team.ru>
Subject: RE: Installing Windows Server 2019 from a remotely mounted ISO
Thread-Topic: Installing Windows Server 2019 from a remotely mounted ISO
Thread-Index: AQHXiGtK3vPDJyYWhEy2Lm3M4BUfvKthzOaAgAAYtYCAAAUxAIAAqZJQgAAGuACAABE0kA==
Date: Wed, 4 Aug 2021 03:17:39 +0000
Message-ID: <HK0PR06MB2145B61C2FC95F66C75BD5148AF19@HK0PR06MB2145.apcprd06.prod.outlook.com>
References: <60926e52-9d00-2b20-e8ac-7fd515ddac78@yadro.com>
 <CAH2KKeaBMhU3XDADDE0ieqRRhNBiF57-9rUi+Go-SSJCGG-GBA@mail.gmail.com>
 <3c0b0dc3-a31d-dcfb-608b-53436074397b@linux.intel.com>
 <34751627996896@mail.yandex-team.ru>
 <df77021c-a86b-1a03-9960-acdf6c324600@yadro.com>
 <6631628004052@mail.yandex-team.ru>
 <4354431a-0db6-fb9f-bc21-5ef34eba8852@yadro.com>
 <HK0PR06MB214515C746802AB15880B80F8AF19@HK0PR06MB2145.apcprd06.prod.outlook.com>
 <835cf3cc-c91a-3194-0f87-52ae197c3949@yadro.com>
In-Reply-To: <835cf3cc-c91a-3194-0f87-52ae197c3949@yadro.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: yadro.com; dkim=none (message not signed)
 header.d=none;yadro.com; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06f037bf-cb19-4554-b67d-08d956f66aa3
x-ms-traffictypediagnostic: HK0PR06MB3812:
x-microsoft-antispam-prvs: <HK0PR06MB38128E8F7915F7C99797A6038AF19@HK0PR06MB3812.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pHqqgtd3UrO99pV1cmkkl+gUDbaLd04mp3w5qkqR9xU6ktJseVe0CpVR7PUvHInQZ9cvY6pA+sg/B+tilo6Pw0qm9M4P3nDl1rt0bUS7LN8K10/Ay+PM8zLCvzWeTZsGA43V7ko2uHSsKGVVzBEKHbPrCLkjG1WcxQJdx9ZCiPLbBALVwv50DautxhpNC/Pbk9GvK9lIlBkWJaXn2yW3638LTqnEe9IqPObegMFPXu5RPkywHqmC6eY3Va5V4Uym4HFmKO4BqDN8tgX60J65tJ7w3hBD/iqam3gzOIkBSoGjmt7XLEbB6wX1lF+UyIYChIFp+/dsLE8SADKtokhO5IZuoMpuHi+f+ihRco3pJk3FsHCfnQiSNp37uIKim1vjwQbiqBX/IYBjRxwqYNLSGu4uCD7wVtGovLagycgrKtA9h4D7FPVbEOqpfUmzOG9pEtpxzU0xqlWqB0rr+Ce16qy5v1pz4iPMHTREHtX4Yu44WoRdMXo3LTdzDydlHPp3fxJsRImEVftI76rCcoeN9h7WM0VS3Xb74xlMnDp0UHbJbyG4nhPA719BlZ8g+dHFO6qhCF9N0ge/xL+8TLLkQsap+KohCV6CNixF0rUCdLDQsk+Kdb5P7FceuDQ0S89rRLmKCuiELkMeeMHJ0OyPXes7hRUMssRJXAoCiqHMPx7PEhNBMerZyVKMKNmKqRU4wcRmEH2cNervALobH1bb0qo5a3Ew91mb5uh8iLTYTTZd7dHUOYMnet3iPijWfi+vcfcccMMjuqS3YjURzi82tJoDhFK/Hf2UgBM6mg+p2hM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB2145.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(346002)(396003)(376002)(136003)(366004)(83380400001)(316002)(86362001)(966005)(55016002)(33656002)(52536014)(9686003)(478600001)(186003)(8936002)(2906002)(26005)(110136005)(38100700002)(8676002)(5660300002)(6506007)(71200400001)(53546011)(4326008)(76116006)(7696005)(66556008)(64756008)(66446008)(66476007)(38070700005)(122000001)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUJyME1oc1dpM1J2V1Z6QWJlVkxHREN1OURqL21oSzh4WU9rZEw4dmc3WVd5?=
 =?utf-8?B?U0NVNDhEUFJLeUg5aFIwL0IvYzNSS0p3UXVTWDJIYTlOTWlLV3UySE9VNVhv?=
 =?utf-8?B?dkdwbU9GVERnZEhrQmNzRis3WnZ3Nys4TThVZXZXOUIxYTdWNzVoTHBHWUJD?=
 =?utf-8?B?YmdyR2RtN2JOcmJtZWo5bGg1REs2RkRrT2lwTldoZUs3c2M1anVTRHc5MUZ2?=
 =?utf-8?B?b0p2eUpqelNlWlRFSzBnNUV2N0taNDFEby9xcnNSNFdBaDlTbFVVY0RvNjVz?=
 =?utf-8?B?VmE2bjYyMEhlRWlRMEVLaFhSMFc5cnJNOE5hTDVGVmFSbDMzYUcvdlBRdHVw?=
 =?utf-8?B?aHl1MDdxamM1TyszOXNJQjdvQTlPTWhYOWNyajJ0cHVLamJXRlZyNEIxN0FC?=
 =?utf-8?B?QngwcVdpekYyRHJVWmZIUDJ1ejRIbXhxVElnMERObmtjd3Z4ZU9OM3dRZWRq?=
 =?utf-8?B?aVJmZnU5QysyODNSZTl6bnR0V292OGpIVmZPdGhEY21BSVRIRTZZSnhDdjAy?=
 =?utf-8?B?M0lCVUlaUXpCVnJ1dkxVV2RVTEZFdFpicys1ZGU3Zzd0c0NCOVI0dnh3b2M2?=
 =?utf-8?B?bytZSFRMOFBPZ2FncUR5YVdtdEpuRkRBWHAxMUFMdkVodkdNU1lEQnpEM1Jn?=
 =?utf-8?B?Ymt1bVpucldFRmZSMW8yM0c1VEVoVkJQNFNZUmtFYUxGZFM4MzJ0a3BLSmw2?=
 =?utf-8?B?NXpSYm10eUpuMjh1Y0F3bjVvUHNWclAxbVVZbzN3UkJxUW52K0o2cmZKbUdp?=
 =?utf-8?B?RGRtY0Q2YzJhNWo3dkNaTUhIS0VlWjU4MnF3d0MremUvMHY4TklpS3ZUU285?=
 =?utf-8?B?VkQyemZlZEFYcy8zclJvUHFsam8zNTVEYUtzeXRnamVZemQxdzY3STNiUzlN?=
 =?utf-8?B?a0ExSlNyS2ZuRkQ4bEIxOENpd01tSGZqY0NSclk5NjlWd2dYZyt4K0hZWFFm?=
 =?utf-8?B?cVN6NFFSRGViVzI5emFRVEVnUWJTeXFtT0hpRjc4UWJnbXJoVEJEYTA2bVhp?=
 =?utf-8?B?b2N0RitBTkEyQXBqUkpaT2RHaDg0eFkrRDNLQTRsSEJ0aExISEpZdC9lZjJV?=
 =?utf-8?B?VTBxWmd1Z3V6UEJoMFFOME9CM09JNlUzOTRkeFBycHpNcjExNkJia2FkR3pK?=
 =?utf-8?B?ZlZVaHJYY0NYY0pteHE0b2Myck9UYkFIU1FaYjFNWkYrTDRkV09IQlY2TGZ3?=
 =?utf-8?B?b3V5SStQcXJIaEdzNWRPRlZDNkk5VjU2MllRcDNsc01oZ1J0RXZIY3YweE0w?=
 =?utf-8?B?L3BQMUJyRG93b05uT3VXZURJR3VkazNqODBNRkhoNE9sTnBVaDVsNnFmMnoz?=
 =?utf-8?B?cWtySllBeTZ2ZEd3c284SE9FN1JuSlhuWDVqQmdTc2RrUGZMbG9WeExtU3Ev?=
 =?utf-8?B?b3VHYkNSOU9PTTZHZEtTNnN6bHhCVUFFd3hNak8yUlVUd2hSZ0FhTEZuTm5n?=
 =?utf-8?B?Q0xGQytXd1dlYmxndVpzcDFNRVFjVW5hbzJwWVlFcUZJREJHMi8rY2tlOWRi?=
 =?utf-8?B?TndxaEx2SjFsQXd4NzdqdVBQbzlPUUNTN25LYnQ3RVpIL0FKSmdjaGpKWGN6?=
 =?utf-8?B?SGRJYWNENEU3REhOZ3ZvY0I2UmszWHZDYnZVbUU3Tm8rSW9mODhWOGRmTlV4?=
 =?utf-8?B?RzNyc1JYdmd6bkplVnNIQkcwVTN5OUdnSmdsQU9leklSZmU4SWR0YlBTVnlK?=
 =?utf-8?B?VmpuMGNhWDBXVXBMdlBGS003WWxmeXV5TmpCeW1RenJQa0cxNjFDV1U0Wnp5?=
 =?utf-8?Q?gHMFAQjkRbDAWoqcdKsAB0O2a4xhTal0Xl1fSb6?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB2145.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f037bf-cb19-4554-b67d-08d956f66aa3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2021 03:17:39.9454 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zSiEesn3idIgrk8SYgq52lQnyLkso/tue5KLuMK+WuKV+HVmd5SNHuVEfAjqzzDITQ+w3vhZMFXwBg8WF4v6MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB3812
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgSWdvciwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpLmtvbm9u
ZW5rbyA8aS5rb25vbmVua29AeWFkcm8uY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEF1Z3VzdCA0
LCAyMDIxIDEwOjExIEFNDQo+IFRvOiBUcm95IExlZSA8dHJveV9sZWVAYXNwZWVkdGVjaC5jb20+
OyBLb25zdGFudGluIEtsdWJuaWNoa2luDQo+IDxraXRzb2tAeWFuZGV4LXRlYW0ucnU+DQo+IENj
OiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNCj4gU3ViamVjdDogUmU6IEluc3RhbGxpbmcgV2lu
ZG93cyBTZXJ2ZXIgMjAxOSBmcm9tIGEgcmVtb3RlbHkgbW91bnRlZCBJU08NCj4gDQo+IEhlbGxv
IFRyb3ksDQo+IA0KPiBPbiAwNC4wOC4yMDIxIDA0OjUwLCBUcm95IExlZSB3cm90ZToNCj4gPiBI
aSBJZ29yLA0KPiA+DQo+ID4gQ3VycmVudGx5LCB0aGUgcmVtb3RlIHZpcnR1YWwgbWVkaWEgZW11
bGF0ZSB0aGUgZ2FkZ2V0IGRyaXZlciBhcyB1c2INCj4gdGh1bWIgZHJpdmUgaW5zdGVhZCBvZiBj
ZC1yb20uDQo+ID4gUGxlYXNlIGhhdmUgYSBsb29rIG9uIG15IHBhdGNoOg0KPiA+IGh0dHBzOi8v
Z2Vycml0Lm9wZW5ibWMtcHJvamVjdC54eXovYy9vcGVuYm1jL29wZW5ibWMvKy80Mjk4Ng0KPiBQ
bGVhc2Ugbm90ZSwgdGhlIHBob3NwaG9yLW1pc2M6dXNiLWN0cmwgaGF2ZSBhIHdheSB0byBzcGVj
aWZ5IG1vZGUNCj4gdXNifHVzYi1yb3xoZGR8ZHZkIHdoaWNoIGlzIHVzZWZ1bCB0byBwaWNrIGJl
dHdlZW4gYm90aCB1c2Igb3IgY2Qtcm9tDQo+IGRldmljZXMuIFBsZWFzZSwgcmVmZXIgdG8gdGhl
IGNoYW5nZXMgWzFdLg0KPiANClRoaXMgbG9va3MgdmVyeSB1c2VmdWwsIGdvb2QgaW5mb3JtYXRp
b24gdG8ga25vdy4gDQpEbyBmcm9udGVuZCAod2ViLXZ1ZS9waG9zcGhvci13ZWJ1aSkgYW5kIGJh
Y2tlbmQgKGJtY3dlYikgc3VwcG9ydCBpdCBhbHJlYWR5Pw0KDQo+IFRoZSBpbXBsZW1lbnRhdGlv
biBvZiB1c2ItZ2FkZ2V0Om1hc3Mtc3RvcmFnZSBoYXMgYSBtYW55IGxpbWl0YXRpb25zDQo+IGFi
b3V0IGNkLXJvbToNCj4gICogSW1hZ2Ugc2l6ZSBzaG91bGQgbm90IGJlIHNpZ25pZmljYW50IHRo
ZW4gMi4xR2IsDQo+ICAqIFN1cHBvcnRzIG9ubHkgQ0QtUk9NIHByb2ZpbGUNCj4gVGhhdCBkb2Vz
IGZvbGxvd2luZyB0byBmYWlsdXJlIG9mIGluc3RhbGxpbmcgV2luZG93cy1saWtlIE9TLCBiZWNh
dXNlIHdpdGhvdXQNCj4gYSBudW1iZXIgb2YgRFZELVJPTSBwcm9maWxlJ3MgZmVhdHVyZXMgYW5k
IGNvcnJlY3QgU0NTSS1jb21tYW5kDQo+IGhhbmRsaW5nKFRPQy9BVElQL1BNQSkgYSBXaW5kb3dz
IE9TIGNhbid0IGxvYWQgYXBwcm9wcmlhdGUNCj4gVURGLWRyaXZlcihpc28tMTMzNDYpIGFuZCB3
aWxsIHN0dWNrcy4NCj4gDQo+IFN1bW1hcnkgdGhlIG1lbnRpb25lZCBpbiB0aGUgY3VycmVudCBz
dWJqZWN0IHBhdGNoc2V0IHNob3VsZCBzb2x2ZSB0aGUNCj4gZGVzY3JpYmVkIGlzc3VlLg0KPiAN
CkknbGwgZ2l2ZSBpdCBhIHRyeSwgdGhpcyBtaWdodCBhbHNvIHNvbHZlIG91ciB2aXJ0dWFsIG1l
ZGlhIHN0cmVzcyBpc3N1ZXMuDQoNCj4gPg0KPiA+IFRoYW5rcywNCj4gPiBUcm95IExlZQ0KPiAN
Cj4gTGlua3M6DQo+ICogaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei9jL29wZW5i
bWMvcGhvc3Bob3ItbWlzYy8rLzM2NDk5DQo+IA0KPiANCj4gLS0NCj4gQmVzdCByZWdhcmRzLA0K
PiANCj4gSWdvciBLb25vbmVua28NCg0KVGhhbmtzLA0KVHJveSBMZWUNCg==
