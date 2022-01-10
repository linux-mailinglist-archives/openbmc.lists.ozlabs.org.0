Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 599EC488E96
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 03:08:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXHLc22PQz2yQH
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 13:08:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=Q01BgzoY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.130.127;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=billy_tsai@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=Q01BgzoY; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300127.outbound.protection.outlook.com [40.107.130.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXHL12Kdxz2xBZ
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jan 2022 13:08:23 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mv3gLoxRBb3jTtwnfgynr8QZaet5SDKDXJOHxawa9tENoirg2YKUjfwA1dHgpJOMMO6PPagWOC8/oi95WJkUaIymBp4thELr0sxFPnfvynRLxqWuOuGXIHZciAhTl5s0+fPz4P2ITJy1pOmGP7fSQOBGnJd+BSNI8hmF93MfuAn+F4KGx4PnZbhjW5aTygiXphI/b8Krw9m+qvNzUHp3p23VM75JYrIlHRkcuHK9MJ1h7mwIUCW4gFzXvlxXUFElmj7bA5dqBbpbu3TTRJafggyE023jju2MuLX+79XexQYDkTRGvJTpWzYEKukGvICYYN9B5m5qWDDixN9SWMQ3gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ut+gn1VzFugrIGge+86gJao/Yq9z58ej63YNqQG/n3s=;
 b=e/dBBPchpn1qiP++T9nWmjcn6v+5nYMpJX7i5phuswYEPLL0ikPv5BaANRnn3+SM8t2v6rPxjypv/zB2UN+qdrWGiafUwtI6oIWRXilcV+yR4cZdegUEXnrLB32erxu4chmw4QWy+RAP+pj8OEHDIf4FUoHM03itj1VRyQQ8frHTH8TytEH6EtRWLKseErGIa2CQvI3QaJY3/KVA2Dj/x3GWIWfvZ4ovBLGQ74r0aspt3Pf4+BAYV+cJ1Rn1txaiPdLd5NNekKAKBbuk3wZlD/TinT47QnbghkSWw3LAfT58Tbu8Oqf2ms05ERmjirt/gOmrPX4rff8+M3Ar0q/i4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ut+gn1VzFugrIGge+86gJao/Yq9z58ej63YNqQG/n3s=;
 b=Q01BgzoYUUUglMJ7SxZZfrHHG8l06v+SX7F1IwpaXsG9dK9/o0y6agfuV66KhWJ/l8c2OI70U618c77l6IJ+xW/E0oPut2k/gurnmMhSyf09DRgaRZ5F3B7yv3Za2y4MqwidMMiHJtC/AGhxf63uNgn9SmHrvWbnLTxAOgONJD4RyI5hdINmhug/W98EYye3YxNbUCl+9AgKgH/nnQ4WN+uEkA86S8ZTsCcgzfMmH942xrsN6hnZm1e+X6Tpvbt2N9bX9hkfWLuLURyo0+6WP9wISpIse3ZZGr+18OwbTrHa1D2yOJ4iCEFHzHqAqUiKjyxhVfNguwsCL8r5lFlbjg==
Received: from HK0PR06MB3362.apcprd06.prod.outlook.com (2603:1096:203:8b::10)
 by HK0PR06MB2865.apcprd06.prod.outlook.com (2603:1096:203:30::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 02:08:04 +0000
Received: from HK0PR06MB3362.apcprd06.prod.outlook.com
 ([fe80::3861:f314:ac28:825d]) by HK0PR06MB3362.apcprd06.prod.outlook.com
 ([fe80::3861:f314:ac28:825d%3]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 02:08:03 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: =?utf-8?B?UG90aW4gTGFpICjos7Tmn4/lu7cp?= <Potin.Lai@quantatw.com>, Joel
 Stanley <joel@jms.id.au>, =?utf-8?B?SG93YXJkIENoaXUgKOmCseWGoOedvyk=?=
 <Howard.Chiu@quantatw.com>
Subject: Re: [PATCH linux dev-4.7] Porting tach driver for ast26xx from Aspeed
 linux
Thread-Topic: [PATCH linux dev-4.7] Porting tach driver for ast26xx from
 Aspeed linux
Thread-Index: AQHX5yRTG4aKUrRiCkmZjjhUIiH5qawek70AgAAINwCAAADtgIAAjY2AgDhTkACABMegAA==
Date: Mon, 10 Jan 2022 02:08:03 +0000
Message-ID: <923E6F99-ADF2-4A78-99C8-EC9AADC1313A@aspeedtech.com>
References: <20211202022623.182903-1-howard.chiu@quantatw.com>
 <CACPK8XcWt18nm0+BYomnWkRCRBqhYJ04y4c_P1nTczLpjyVXcA@mail.gmail.com>
 <HKAPR04MB400364D203AA1D050B753B2196699@HKAPR04MB4003.apcprd04.prod.outlook.com>
 <CACPK8XeCHTDCCd=087BSYw3mq=Hjx=vgCrM17r4ZFtVCazhfHw@mail.gmail.com>
 <70AF2EA6-A267-41BA-B90D-7730A918AC34@aspeedtech.com>
 <HK0PR04MB3282DE4F2336ED23E613FC128E4D9@HK0PR04MB3282.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB3282DE4F2336ED23E613FC128E4D9@HK0PR04MB3282.apcprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b8c870d-bccc-4472-3ca4-08d9d3de0931
x-ms-traffictypediagnostic: HK0PR06MB2865:EE_
x-microsoft-antispam-prvs: <HK0PR06MB2865B9A72360E8553EB9A05A8B509@HK0PR06MB2865.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 69/QjnzHjO3rBx5RhJZ5AEugUxYxyZ7I+JuJusnpGr3AMUkJ6yFrj6mSYC6JiMiyBq93LuaAdP8xZm4eoy+xvO2l0z5uRx1+8ndQLR89et3b7UrC9iTTB9JQOeZdkv8R4zsK8xRPfv01xlOk2zhGvzRz9xPESg+mFgEIn9WQupUCJoX3ydxgk0yz2KIUzmZV8/S/7jk8Kg8kBp4nRYmMMC2/Ll3jCMPFZO1KLPpdl91BYk776hdJHAfaHGgwfIhlvx3Bs5y7F5wnFhxdUtV/svk1q9elcNxSQHHODoYRzktDU3ZYUWNjDeq5SrirJtyB50GVI9A1oHKxpjaiZy1GGTspUm57DH9nv8BnpqRN5YinRJJdvZp3ELxlfK2v/ZBbDET0ugPcjTT2bxF7Wsrbfa+e3yLVEQ84gfthipmGjvysIqzx3S/WZnB5v4ORkQARPeILxOYOH0iAoFkYo1Q3wWq8ZK21xOpJAf80Q4ivS2NNXgygSTE4NrhHU4YdJdVhfljFuj1gqlPp9uATrvfw9ELlo9iTHuncRo3s67NMmAWXu5qDgJycBh3njx5cZE+P4eFrjiV53cC+hRjZ+hQ6pU+BYYYCN/TntggkFsqM71fJu9SOnc8FFtEwEJNc76FDbXjS3OpxoHuDM8fK4dVzJorzlelw7KE5nE3EK/G70ZcQauyWMW7hX064jCT50Aa0NeimOgOWq44TPagoItJVSanNVg40977tCpejeWAp28UzIAn35cFVEt9+KzZ2rkA8rkPwRdCLeJTyBU3VO+JlJl9X5oprbv7JqLgwm0NaLy8wsxD+yKGioL9H4V5MybBd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3362.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39830400003)(346002)(136003)(396003)(366004)(376002)(86362001)(66556008)(186003)(5660300002)(26005)(316002)(66446008)(508600001)(6512007)(36756003)(4326008)(66476007)(6486002)(66946007)(38100700002)(38070700005)(76116006)(966005)(64756008)(2616005)(33656002)(83380400001)(53546011)(6506007)(8676002)(8936002)(71200400001)(54906003)(2906002)(122000001)(110136005)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OU96V2NzanJDcGFyM0wraURaMHJNcFUzRjNzSThKV21WUHNzN0JNT2tBNDBS?=
 =?utf-8?B?Unh2UFJmSDAyY0pvM1BzcDI2MTNLcFNSMk03TzRoQ3ZuUXFWZ1JrNzNDTWRJ?=
 =?utf-8?B?azQwV3NJenE3RTFZbkVadlU1WlhXeXZ6Vm1LZ3kxSUJOTVhtQmtYWDVsMVFo?=
 =?utf-8?B?RlZocVkrTVpJN2x6cEg5R1pYTHo3ZnM2S2lQcnFWWmg0MzN0UmVlaWlSUGlK?=
 =?utf-8?B?UVRWSlVZRG9BamtuaFp5VTUwK2xzUnlLRzY5ZnovWThrUWNYZzRXcjFienV4?=
 =?utf-8?B?b0RkL2FDSGZxMEpxTlpEdFdpWFVtL1ZCVW5LSFN1RHJEZlJpd2FkRXkrUTR3?=
 =?utf-8?B?U2xWbldtektkeU5zWm45MU1kQkgzUHhIVTZwRnl3MkVWeVE5NVNpRXFaVTV5?=
 =?utf-8?B?MGV2T1FidG1zbTV3YUtVZDFtNlVHc000cDczcWhXcFBkL2dNZCtMc2ZzaUlO?=
 =?utf-8?B?UldUZFpKbFBQY1htdXlUSDRkcUZPNnBxTlRZKzVBc09DakJQOWZmWmh3bU1r?=
 =?utf-8?B?M1Y5UTdVUURoaXJSMDUwNmhBWUFrTUlNaFFqeDhFNkx4bC80K0p2UDZqNk1K?=
 =?utf-8?B?M0xJVm5NK3plQ1hPbzhGVXIxakhIOU9sL201SEcrWHFCTnB6R0dSRXljWnFp?=
 =?utf-8?B?aXNuTXdqS0huZTVodHlvUGpTRDZqcjJXQTRXUXEwSEcxcjR1VzdaaXBYUERJ?=
 =?utf-8?B?Q3M1MDRPb3I1OUhpS3FGU0UrMjQvYUhiZWV5TWF6TnRGd2YzbUxyaEZoNXk3?=
 =?utf-8?B?dFFKcDRCRUxlMkJmUllJN3pxcklvdjNMdUlFMzdqdFFFVjZDSUtLMDdmSkg4?=
 =?utf-8?B?cUduN0NqRTFmZmIySjNrR2pBRUdVYURwQjc0VndFUnBFeHFITVNxLzEwbXJq?=
 =?utf-8?B?SGI3YXpwSERjTU9mYUk3S2VrRGpQbUdUamNYR3ZNTWdLMW9QQnpKMFF2akMv?=
 =?utf-8?B?akhXcXNGeCtCb1RWdXVFbWRobVoybnoyVHV3U1p1aC9xTnViaVBiWWZQZHl0?=
 =?utf-8?B?ZEVZa0RaY3NjV3M4c0ttS1VXcCtPUkx2VHd6dExjRFhkVFQ4aHNBU2VDa0tW?=
 =?utf-8?B?VU5QUDVaWlMrOXJUaDJpendYZUhrNEJnRTdYNzJTa0FSYzdSOUtJNS9qYk1y?=
 =?utf-8?B?VU5uOUQyUXZPVHg3dURVdE1JdU5pOXA0TDVnZ2taYm9RVFJyYmRuMXd5Q2Rz?=
 =?utf-8?B?M3Y4ZkpXQmFRcEJjRklDNEM4aU52eXlBOE5PV0lEZjZGR2NjSEZCR0ZkKzI5?=
 =?utf-8?B?UlBrYUdkY2FWL0c1ZzNTZlhidW9mZndSZzNGcUVTN25vWHNIR0pnSUZZQndi?=
 =?utf-8?B?eWFyQkxwWEZCeXZmY01xL0RVcmFndlozSENzYnFMTko2N05MK3Yyc2xRazlz?=
 =?utf-8?B?N3FrTHN6akdEbExtaVNVNnZIajg5bnUvMk9hZmlWWGVHMWFpaGo4TXRUWWV4?=
 =?utf-8?B?YnIyN1p6cVJuaHVzUGxlTjJyYm1DcXRya2FjalUyTzR5V2xaOVUrdmZKMys1?=
 =?utf-8?B?UzdETHRxLy94RVlGNC9OZEdiQVZpdHZQQXh3cU1sRExSajdYQmZlZWVrNURu?=
 =?utf-8?B?VGM3ZUovK3lFeVFlZDRLQmhHUDhDL1d2SzlaNFFmaDY3NFhFWnZaVTI1REww?=
 =?utf-8?B?bGpxNjdYaFQ1eTRrR0hac0wyN1ZFOVhDZ1pDdHRESlZHbUIzeHJiUjhYM2NP?=
 =?utf-8?B?VHlGZll0TlNwR2pYT3YzOVRZQmRUTFlrZ2lrTGUvbUgzZkYweXZNc1RabXRD?=
 =?utf-8?B?dzNYQnNucmZJZ1FkWExSNjVhL0VTb2FXc3h5SklWMWdIUEJnb3MrNW10bWVt?=
 =?utf-8?B?enQ4UWI3dzhzKzhaZHhNbHRmeVJQeEVQZlhmMzc3UlR1cEFvZVF1dHE2QSsy?=
 =?utf-8?B?UHROTFMxcnZVR0hrcjlheWJ2eEJUa2w0MlBsZkJUbmtxOERGc2tSVy8xWEhE?=
 =?utf-8?B?c1Zzc1hWYTNTcnJQUFBVR1NlSlB5VVIyR25EVmVDeDV2bkh0TVU5Q3c0WjF0?=
 =?utf-8?B?WW5iSVNvcjBOOGx6QnVraVVwQlNKS1BQRGhPWE9iWU95cXg0NkkzV3B0UEEy?=
 =?utf-8?B?SytOelFDMElYUlZMM3lrcytOMGpRbTk5R2xJYTlZbm1saUNVQU9FZzB6ck13?=
 =?utf-8?B?dDE3dWNLaHQ3aHdjWFBEZ2xzNThTWE82S1B3TE9meFdTekRCOEtQK01pbWdO?=
 =?utf-8?B?ZytieWxHR28xVllrUGFPbnIzSUwrQmJoVzVuQ0xLSUFoYU5YclBCVmlaUjFV?=
 =?utf-8?Q?8EQGj7hjDx9yTOefkCyMR7PgBCW2TL54QpDvqyEe50=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <75C527D9F831F348BAA0FF8C5D25B660@apcprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3362.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b8c870d-bccc-4472-3ca4-08d9d3de0931
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 02:08:03.8026 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wZwpJQVvubf5OddAvRcaxaV0rtj3koBNoaBLzXs83QyYYyTc305mhrZbSuEfDv+Fc3Rr1fhR5blwJWNNRDQb5Kue72sEM/99JY9Fy2XZtpE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2865
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
Cc: Howard Chiu <howard10703049@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgUG90aW4sDQoNCkkgYW0gd2FpdGluZyBmb3IgSm9lbCBhbmQgUm9iJ3MgY29tbWVudC4NCmh0
dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eC1wd20vY292ZXIvMjAyMTEx
MzAwNTU5MzMuMzI3MDgtMS1iaWxseV90c2FpQGFzcGVlZHRlY2guY29tLw0KDQpDYW4geW91IHVz
ZSB0aGUgZHJpdmVyIG9uIG91ciBnaXRodWIgZmlyc3Q/DQpodHRwczovL2dpdGh1Yi5jb20vQXNw
ZWVkVGVjaC1CTUMvbGludXgNCg0KDQpUaGFua3MNCg0KQmVzdCBSZWdhcmRzLA0KQmlsbHkgVHNh
aQ0KDQrvu79PbiAyMDIyLzEvNywgNTowOCBQTSwgIlBvdGluIExhaSAo6LO05p+P5bu3KSIgPFBv
dGluLkxhaUBxdWFudGF0dy5jb20+IHdyb3RlOg0KDQogICAgSGkgQmlsbHksDQoNCiAgICBKdXN0
IHdvbmRlcmluZyB0aGF0IGFyZSB0aGVyZSBhbnkgcGxhbiBvciBkYXRlIGZvciBhc3QyNnh4IFB3
bS9UYWNoIGRyaXZlcnMuDQogICAgQXMgSG93YXJkIG1lbnRpb25lZCBlYXJsaWVyLCBPdXIgcGxh
dGZvcm0gd2lsbCBuZWVkcyB0aGUgZHJpdmVycyByZWFkeS4NCg0KICAgIEJlc3QgcmVnYXJkcywN
CiAgICBQb3Rpbg0KDQogICAgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCiAgICBGcm9tOiBC
aWxseSBUc2FpIDxiaWxseV90c2FpQGFzcGVlZHRlY2guY29tPiANCiAgICBTZW50OiBUaHVyc2Rh
eSwgRGVjZW1iZXIgMiwgMjAyMSAxMjo1OSBQTQ0KICAgIFRvOiBKb2VsIFN0YW5sZXkgPGpvZWxA
am1zLmlkLmF1PjsgSG93YXJkIENoaXUgKOmCseWGoOedvykgPEhvd2FyZC5DaGl1QHF1YW50YXR3
LmNvbT4NCiAgICBDYzogSG93YXJkIENoaXUgPGhvd2FyZDEwNzAzMDQ5QGdtYWlsLmNvbT47IE9w
ZW5CTUMgTWFpbGxpc3QgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz47IFBvdGluIExhaSAo6LO0
5p+P5bu3KSA8UG90aW4uTGFpQHF1YW50YXR3LmNvbT4NCiAgICBTdWJqZWN0OiBSZTogW1BBVENI
IGxpbnV4IGRldi00LjddIFBvcnRpbmcgdGFjaCBkcml2ZXIgZm9yIGFzdDI2eHggZnJvbSBBc3Bl
ZWQgbGludXgNCg0KICAgIEhpIEpvZWwsDQoNCiAgICBPbiAyMDIxLzEyLzIsIDEyOjMyIFBNLCAi
Sm9lbCBTdGFubGV5IiA8am9lbEBqbXMuaWQuYXU+IHdyb3RlOg0KDQogICAgICAgIE9uIFRodSwg
MiBEZWMgMjAyMSBhdCAwNDoyOSwgSG93YXJkIENoaXUgKOmCseWGoOedvykgPEhvd2FyZC5DaGl1
QHF1YW50YXR3LmNvbT4gd3JvdGU6DQogICAgICAgID4gICA+DQogICAgICAgID4gICA+IEhpIEpv
ZWwNCiAgICAgICAgPiAgID4NCiAgICAgICAgPiAgID4gWWVzLCB0aGlzIHBhdGNoIGlzIHYxNCBJ
IGp1c3QgZG93bmxvYWRlZCBmcm9tIHBhdGNod29yayBhbmQgdGVzdGVkIGl0IHdpdGggRmFjZWJv
b2sgQmxldGNobGV5IHBsYXRmb3JtLg0KICAgICAgICA+ICAgPiBJIGFtIG5vdCBzdXJlIGlmIHRo
ZXJlIHdvdWxkIGJlIGZ1cnRoZXIgcmV2aXNpb24gb2YgdGhpcyBkcml2ZXIsIGJ1dCBteSBwbGF0
Zm9ybSBuZWVkcyBhc3QyNnh4IFBXTS9UYWNoIGRyaXZlci4NCiAgICAgICAgPiAgID4gSSB3aWxs
IHN5bmMgdGhpcyBkcml2ZXIgd2l0aCBCaWxseSdzIHdvcmsuDQoNCiAgICAgICAgPiAgID5UaGFu
a3MgZm9yIHRoZSBleHBsYW5hdGlvbi4gSW4gdGhlIGZ1dHVyZSwgaXQgd291bGQgcGF5IHRvIHJl
ZmVyZW5jZQ0KICAgICAgICA+ICAgPnRoZSB3b3JrIHlvdSd2ZSBiYXNlZCB5b3VyIHBhdGNoIG9u
LCBhbmQga2VlcCB0aGUgb3duZXJzaGlwDQogICAgICAgID4gICA+aW5mb3JtYXRpb24gaW4gdGhl
IHBhdGNoLg0KDQogICAgICAgID4gICBCaWxseSwgYXJlIHlvdSBoYXBweSB3aXRoIHVzIHB1dHRp
bmcgdjE0IGludG8gdGhlIG9wZW5ibWMgdHJlZT8NCg0KICAgIFN1cmUuIERvIEkgbmVlZCB0byBz
ZW5kIGFub3RoZXIgcGF0Y2ggZm9yIHRoZSBvcGVuYm1jIG9yIHlvdSB3aWxsIGFwcGx5IHRoZSB2
MTQgaW50byB0aGUgb3BlbmJtYyB0cmVlPw0KDQogICAgQmVzdCBSZWdhcmRzLA0KICAgIEJpbGx5
IFRzYWkNCg0KDQoNCg==
