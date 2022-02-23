Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0424C0B2C
	for <lists+openbmc@lfdr.de>; Wed, 23 Feb 2022 05:38:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3NZj3T80z3bTy
	for <lists+openbmc@lfdr.de>; Wed, 23 Feb 2022 15:38:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=zDS8C/Mh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:febc::723;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=zDS8C/Mh; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on0723.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::723])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3NZB4JjQz2xC6
 for <openbmc@lists.ozlabs.org>; Wed, 23 Feb 2022 15:37:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ri9S3J2Isz2T2kb/j68BuLVC0Ip5eYadoaaI6hSWyBLI7DSUKCgpN3vXLUl3ww5mj0ucwn2lA/KjU/T3EqkIdsNPqkEta3wgJSG13hMgc7I2/EED28r41AWwaht27jC/ipsJt6vD6GkAePegXgL9e0RU50HsAZ7gZ97EmLpXqBHOro7xPIiR6ceDazLpE/DMmMBTcnJw8TdRjzK7wDtxYTyJolw268jNvScyA70QgEnIJ9UMVtqvOBjy7DZZPisZNx//qNtS50PwtWrFtU1lqEEfSzK9roZsGR+cXclOs9nqGZ9R59bNExo7+cWi8tbe7M7V3SJJwyM9YAyE2cBE9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxkU085flFy0VODnFtvkFOLw8WvBc0VR/evobUb4DR4=;
 b=nLUy77YazS7joDB5hAJ/Q7evcqDyORvnEln3aigoD5CalcjtZ9SkKgbfaO3//eiQ2qYDHFvYGqXKA6k8oA+usX1HybyH80ekvSPPrNzQQc0U5XedEprDTLMy1CsRoH3ZSbEL41HZ9V5pGdCx1VW/viM4qBCzUszqzph8TzWROpi1zKdvL9yHcgGc8JtK0WbXzNtln6eS0CrkrFNMIjHeD2USbxArilY8jK9sduC5z+IxElk2jhEW0+zdI+izJWLuRvcT4EqO5X4ESPk3BunXedJI4r2/4yrW0KL8Ly+rNQu5MP9rcqd5dPzuM01N9W3YdzwTQXKp3DwX1Nj/KkbCgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxkU085flFy0VODnFtvkFOLw8WvBc0VR/evobUb4DR4=;
 b=zDS8C/MhU89GtCq1hdIM9SFvGMD/21yFEQW5h4OcJ1AWaxBkyAa5oBGPePKZIbdewYlCqzOkTAWN4QNhoVQdvykyurF0HlvRgfL9AH2QFqkqkgV1v7hisozfijqsjxJpIRRGc022FzkCv4PKf8RTfdwxctA0d5dBhVGtIkgtO6ZkTpn/aMK1eTnFOFivEYYrhf7UC8jZ+m1ZFeyZBZTwgO4vLvOK0y8AxGutlrz3G+cfYm3wncL24Bi2F3pPyEWnT8dWcdl7zZ17ny8rrPV+wcZjFkw+jXf1tVwTM/LS/vLQKbzOZBB94SljT87hL3fpML5FqOgZGVPCn3hHo8dSMw==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by TY2PR06MB2845.apcprd06.prod.outlook.com (2603:1096:404:34::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Wed, 23 Feb
 2022 04:36:12 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::fd70:88e4:1545:131b]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::fd70:88e4:1545:131b%3]) with mapi id 15.20.4995.027; Wed, 23 Feb 2022
 04:36:12 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Lei Yu <yulei.sh@bytedance.com>
Subject: RE: New u-boot-aspeed-sdk runs slow and cause wdt2 timeout on ast2500
Thread-Topic: New u-boot-aspeed-sdk runs slow and cause wdt2 timeout on ast2500
Thread-Index: AQHYKFtBETGaWHK4ik2mqU2WIGmbl6yga1OwgAAHTQCAABGNYA==
Date: Wed, 23 Feb 2022 04:36:12 +0000
Message-ID: <HK0PR06MB37792404CAB772185CB386B0913C9@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <CAGm54UE7-QxGBniV3J2jnBiW4ygvRcHxKd=G88PsOiNZP+hBTA@mail.gmail.com>
 <HK0PR06MB3779076AB5B2189822951A4C913C9@HK0PR06MB3779.apcprd06.prod.outlook.com>
 <CAGm54UGNdAtX=zSuZdZwQ6k2FjPj-Cxd3AwVxyNLLhifEntHbw@mail.gmail.com>
In-Reply-To: <CAGm54UGNdAtX=zSuZdZwQ6k2FjPj-Cxd3AwVxyNLLhifEntHbw@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 335e111c-e78c-4475-7f99-08d9f6860539
x-ms-traffictypediagnostic: TY2PR06MB2845:EE_
x-microsoft-antispam-prvs: <TY2PR06MB2845149D7DA3AA943590DB32913C9@TY2PR06MB2845.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lly4qpUkN2jtmKmZqpwt5FveFQKkJGg07TaQiLzwT5bArce2FiqPYJw6fedZyQd4IKyNTrBg9idslG0Xf80eR2VC2FBR5gvmUnOWUJ0CkL+dHeGybJHnz4EDSMmQZY3sYOS47S3qKf8eG3P6Fn18rb51GPgRYzeyCHOuhlKrP0/aW/6ka+owECEtq0cRiQL626liPmFd+CcayxuZOyDIpcf9cH04KH9oSEwVQuB578h3uWN9/SbdUWCwOX5myem4leTOJMhDigC2uUdYcT5JicIjrFriPmVPsB489SB4sPY0icx5DjTx9jEezkDiOmPP0f5c+u3FkY0qujVv2OYTke3mtxpHHS94fcbMnY2sldX7e8dVjqtLm8tEtIw+/aIcPFZLcFioIPCKHSRKHfN0InHoH0fzz4/RiDg5Er+UYKGzR7zCs1SLazABANVIZwBS+fj9jLuDrjPnlc2gHg7ptlj7sWvkzSSh1jkcMMoY0onHYtQY44v6c4+KLyp8UI88ZEyBlfRZJBl6iEQSHqmQOn6dTzhDZPV+CsllKyF3CrhsO/11/HfCLstF/TjwuB3jBIy3VoMxSuT1n2BkJVp+le3mA48dffJT/i41E1NUHd1OSRve/Zv4blkNQvUyUkX4tHwpe2Y6JlRgLln22BD5xf7vwd+DrN6g0UnOfrWdYf1aA/uV4ZOYbWpjXdI6yWSYYJ/77/uv9z+hwR5AzY7A4dq4X5MqJsR/lpS0JEd7MWB4to5W8sc+2t+PgCtfPNNhUdXWCEjQwaP5AYQ4YNecBeMjmmcUYW6Ge0Lg5zfZwrrEq3IBjMTu2LMyM62CPcjZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(346002)(39840400004)(136003)(396003)(366004)(376002)(54906003)(66476007)(64756008)(66946007)(8936002)(6916009)(26005)(86362001)(186003)(52536014)(4326008)(5660300002)(66556008)(76116006)(66446008)(8676002)(122000001)(316002)(6506007)(7696005)(9686003)(38070700005)(966005)(71200400001)(33656002)(2906002)(38100700002)(508600001)(53546011)(55016003)(107886003)(10126625002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dzRYVkxjaDMzL0kvdUtTS3QwZC92ai84Wnd2Q1N3a2RxelJubDQ4RytEeG1D?=
 =?utf-8?B?UDY5ZUZhYlo0VGczRDl4bUVJakxEYXRsU011UkY1eFhXdVlwaXdxOGRLd3h2?=
 =?utf-8?B?SE01a1o4Q3ZPZWxaUzdESWhneUQrU1YzTEI2VWNVZTJyWUYxVnREeFZwU0Jq?=
 =?utf-8?B?VXNUZUhBZkJnWnQ5NUlHdHczUyt3Y0FCTFdoVXhQUzZxMlR3c01kZ2x2N2tv?=
 =?utf-8?B?Rks5dzQ1NlpFYnVQemg4ZWYxbDBycElmby9KSVFSd0ZaZ1U2NXpVZTdHdm8z?=
 =?utf-8?B?elNwUDJkTEN6ZTB5WTZwZ3RuMEx6OVNxZ3JaVDVHWDhDbVdITmJNbXIrUmJP?=
 =?utf-8?B?elV0Z01kNmJ5RnR2SXVFV0U0OThoeFJhTEx4Y3g0MEJJYnNxb3BHdDhBb2M0?=
 =?utf-8?B?NzFVUTZ5Mkt1MVZhd2F0dk9BOHU4MkdMMk1zYU1taEJ3NDVoTFRqS3d5NUNP?=
 =?utf-8?B?VUdVcGZUM1VSS3hUWU52R0NjRCtnY2pERVpacFI3MXF0RW8vVjh6YmpYTUJU?=
 =?utf-8?B?eU1pWnVUMUxyUWxoL1RuMnlyTDBROE5iS1JwakJ2VXZFcjdOYjRVa0wraU12?=
 =?utf-8?B?ekZlcy9VeGw2S0d4YjNRWERtL2ZRWHJ4SnEyK0Ztd1ZBUXorSGw0MjhYMkNL?=
 =?utf-8?B?SjBkbmZJZU0wZ2toOVlHQ2VYZXQyNk9qNmkxTFJ5by81Vmk3cytnTGJzc0Qx?=
 =?utf-8?B?WGEvam1sbWg2QXhUeTBzSlhYMDF4WXlUR2VNRWlJcWY0bHhHQWtWaGIwZEdJ?=
 =?utf-8?B?dm9hd1A1TUlqakgwYzByNkpiSUN5bGozN0RyNFpNY0hkZzA5SHVWZHNJdnU3?=
 =?utf-8?B?WVRWb2M1anJ2aU1ZOWN6MlZLWUFSRGh1T3dCa2RzeEI2eEIzM2hPa1E0bFVs?=
 =?utf-8?B?MTRvMlZETi9zMXRWd3RScFVCYStKNVZwMmJBNVVwM3VzRFRvR0xCZTcrUFhn?=
 =?utf-8?B?alVVRkY5N1VhU2FmUmtpd0hYVnE1K1AwS292RjhhM0dYbGJvOXZDVlRSVjNu?=
 =?utf-8?B?c3BqZUdCK3RsUUl6bmZZZ0gwTHMyOFIvNHgzb2svVmpZeEN4amlpTmZFclI2?=
 =?utf-8?B?RXB6c0xWQTdlcWU0S3F4eEFVeXZzcDFKRVpIQXhLUGxWL3VFZXdrVFY5NnJG?=
 =?utf-8?B?QlEyVnBqUGdWSVFMOHZjNVdjdk1Rc3U3T0FWeE1EbEJiMEk2OCszVE5RMmlL?=
 =?utf-8?B?d2wrNkFhdXNzTTJLTk43MGtwa00wcHFoMjNBbUlyQW5Pd2J6ZXJyVkUxWEx2?=
 =?utf-8?B?VlhIZVhKMzNwU1RoOG91WlE1SHBob0FGTGk4SXhCWUcwQkRhYXNQdkkrM1Jp?=
 =?utf-8?B?dDVpZnBZdUhoT2NMaVh3SlhvRXZxVjhkdGMwcmEwV3VWMW5iMTRiZWtQSlZz?=
 =?utf-8?B?U3VRR0k2L01ZV01FLzR6WHdyeXpINnpRMzRVQTljZFlRYytlNmdzaEs5b1hN?=
 =?utf-8?B?WnFsKy9BVUFCd0pSNXN2NXFjbGdyQzJmRWxsNEVEOGxiSW9SeGovM1IrdFht?=
 =?utf-8?B?UzFwYWZLODVoWmxDT1ZwRzF4citJYjNEVFB2MWlnTm1GK1k5OTRucFQrYlow?=
 =?utf-8?B?L05tU1N0VDVsMUhSb0dPbTg3MERPclRmL1htS2Z1UVVmVlk3SjM3a2R3Qk5T?=
 =?utf-8?B?MXIzZHNTbitlU1p6V1drNUhSbmxpUG5idzBjVXd5ZzUvQjNza1RUY0hwLzVV?=
 =?utf-8?B?azV1YzUrSXNCRWJWdVB1dVlsaDdRbnpUUEhyTEliUDZ6eXVLVDdnWElLR3lp?=
 =?utf-8?B?ZTI4TTNET2R5ZjliS21iVzIzNzBHQlZURzFrTFY1dUwzdEFtUTUvSVk3cTJW?=
 =?utf-8?B?VVh1RityVnhlU3FKNkllYUhPeVRmUVBWdUZ1Sk5hNTBLRkZveDBYdC9sbHln?=
 =?utf-8?B?M045bFNLYURsUThkZ0dOZU9WcGZOOGJiV3A4TzdsYUF1Q0llbXB3dHIrUjdP?=
 =?utf-8?B?NCtGK1BVRjhTbXJBQVJVbjhOOWpTZ0lLTXRGR1QxWlkwUGJBV01PbHJBOStS?=
 =?utf-8?B?S1Brdll5L1pPTFJiOGZkWGZraWs5WWFSWVhCWFoyWStSMzlSZGl5aEk3cUs5?=
 =?utf-8?B?MHFyY083cys0bklseThleENmeW5WYXduVllQdTVQcGU2a2ZidVloZ05zZ2Zw?=
 =?utf-8?B?WUxWTnVoMlRmR0xjMVlLU0huUXEwcFZmWW02bzErZTFJdmJSTkpPN0MvTGpS?=
 =?utf-8?B?M1hOQ24vemZvSHRycVdRdG9iYTFQc3lkaWMwWFRCQ2RKR2pLbTFLR3dYNXRl?=
 =?utf-8?B?dGNFSXI3Zm5nd0VYazJVcnQ5RTdBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 335e111c-e78c-4475-7f99-08d9f6860539
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2022 04:36:12.1934 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BO3xdqAk4mnaWCgWXclpFGrDv7lhN8eaSLBwXZU4cDIJ2ASVGhOZvtaCF/y/z3azsiBt7jizM9SyhPasL/xzJSyJcoXY/4yFwOQFR/TSKQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR06MB2845
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Troy Lee <troy_lee@aspeedtech.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiBGcm9tOiBMZWkgWXUgPHl1bGVpLnNoQGJ5dGVkYW5jZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgRmVicnVhcnkgMjMsIDIwMjIgMTE6MDIgQU0NCj4gDQo+IE9uIFdlZCwgRmViIDIzLCAyMDIy
IGF0IDEwOjM4IEFNIENoaWFXZWkgV2FuZw0KPiA8Y2hpYXdlaV93YW5nQGFzcGVlZHRlY2guY29t
PiB3cm90ZToNCj4gPg0KPiA+ID4gTGVpIFl1DQo+ID4gPiBTZW50OiBXZWRuZXNkYXksIEZlYnJ1
YXJ5IDIzLCAyMDIyIDEwOjE1IEFNDQo+ID4gPg0KPiA+ID4gT24gdGhlIGxhdGVzdCBtYXN0ZXIg
d2l0aCB1LWJvb3QtYXNwZWVkIHYwMC4wNC4wOSBTREssIGFuIGlzc3VlDQo+ID4gPiBvY2N1cnMg
b24gZzIyMGEgdGhhdCBpdCBydW5zIHNsb3dlciB0aGFuIGJlZm9yZSBhbmQgZ2V0cyB3ZHQyIHRp
bWVvdXQuDQo+ID4gPiBXZSByZXZlcnRlZCB0aGUgdS1ib290IHRvIGEgdmVyc2lvbiBiZWZvcmUg
djAwLjA0LjA5IFNESyAoYjBmZThmZDlkKQ0KPiA+ID4gYW5kIHRoZSBpc3N1ZSBpcyBnb25lLg0K
PiA+ID4NCj4gPiA+IEJlbG93IGFyZSBzb21lIGRldGFpbHM6DQo+ID4gPiAqIEJlZm9yZSB2MDAu
MDQuMDk6IHUtYm9vdCB3b3JrcyBPSywgYW5kIGl0IHRha2VzIGFib3V0IDl+MTAgc2Vjb25kcw0K
PiA+ID4gdG8gbG9hZCBhbmQgc3RhcnQgdGhlIGtlcm5lbCBpbmNsdWRpbmcgdGhlIDIgc2Vjb25k
cyB0aW1lb3V0IGZvcg0KPiA+ID4gYXV0b2Jvb3QsIHRoZSBrZXJuZWwgc3RhcnRzIE9LIGFuZCBp
dCBraWNrcyB0aGUgd2F0Y2hkb2cgYXMgbG9uZyBhcyB0aGUNCj4gZHJpdmVyIGlzIGxvYWRlZC4N
Cj4gPiA+ICogV2l0aCB2MDAuMDQuMDk6IHUtYm9vdCBydW5zIHNsb3dlciB0aGFuIGJlZm9yZSwg
YW5kIGl0IHRha2VzIGFib3V0DQo+ID4gPiAqKjE2IHNlY29uZHMqKiB0byBsb2FkIGFuZCBzdGFy
dCB0aGUga2VybmVsIChpbmNsdWRpbmcgMnMgdGltZW91dA0KPiA+ID4gZm9yIGF1dG9ib290KSwg
dGhlbiB0aGUga2VybmVsIGRvZXMgbm90IGhhdmUgZW5vdWdoIHRpbWUgdG8gcnVuIGFuZA0KPiA+
ID4gbG9hZHMgdGhlIHdhdGNoZG9nIGRyaXZlciwgYW5kIHRoZSB3ZHQyIHRpbWVzIG91dCBvbiBh
Ym91dCAyMnMuDQo+ID4NCj4gPiBDb3VsZCB5b3Ugc2hhcmUgdXMgdGhlIGJvb3QgbG9nIHdpdGgg
dGltZXN0YW1wcz8NCj4gPiBJdCB3b3VsZCBiZSBuaWNlIHRvIGtub3cgdGhlIHRpbWUgZWxhcHNl
ZCBhdCBlYWNoIHN0YWdlLg0KPiANCj4gUGFzdGVkIHRvIGh0dHBzOi8vcGFzdGViaW4uY29tL2Vt
c2VxVzZjDQo+IEl0IGNvbnRhaW5zIHR3byBsb2dzLCB0aGUgZmlyc3Qgb25lIGlzIGdvb2QsIGFu
ZCB0aGUgc2Vjb25kIGhhcyB0aGUgaXNzdWUuDQoNClRoYW5rcyBmb3IgdGhlIGluZm9ybWF0aW9u
IHByb3ZpZGVkLg0KSXQgYXBwZWFycyB0aGF0IHRoZSBIYXNoIG9wZXJhdGlvbiBhbmQgRFJBTSBp
bml0aWFsaXphdGlvbiB0YWtlcyBtb3JlIHRpbWUgaW4gbmV3ZXIgVS1Cb290Lg0KQ291bGQgeW91
IGhlbHAgdG8gcHJvdmlkZSB0aGUgY29tbWl0IGhhc2ggb2YgdGhlIHR3byBVLUJvb3QgdXNlZCBp
biB0aGUgZXhwZXJpbWVudD8NCldlIHdpbGwgdHJ5IHRvIGlkZW50aXR5IHRoZSByb290IGNhdXNl
IGFtb25nIHRoZSBwYXRjaCBkaWZmcy4NCg0KVGhhbmtzLA0KQ2hpYXdlaQ0K
