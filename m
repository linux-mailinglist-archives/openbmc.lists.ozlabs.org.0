Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F88348B6B
	for <lists+openbmc@lfdr.de>; Thu, 25 Mar 2021 09:23:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5dQh5khVz30F0
	for <lists+openbmc@lfdr.de>; Thu, 25 Mar 2021 19:23:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=1mfZlFJN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=711c1191f=duke.du@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=1mfZlFJN; 
 dkim-atps=neutral
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 4F5dQP6nqQz2ywx
 for <openbmc@lists.ozlabs.org>; Thu, 25 Mar 2021 19:22:52 +1100 (AEDT)
IronPort-SDR: I6MdDwdrEiMpZiwkYln52ngoU5JTd3EEH/uF+PWP9WyKhfFpaH5FbfEJTnyiL4XnMD4sZtdV7+
 nAiHfhsTqRbg==
Received: from unknown (HELO mailbx06.quanta.corp) ([10.243.91.101])
 by mx02.quantatw.com with ESMTP; 25 Mar 2021 16:22:50 +0800
Received: from mailbx09.quanta.corp (10.243.91.106) by mailbx06.quanta.corp
 (10.243.91.101) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 25 Mar
 2021 16:22:32 +0800
Received: from APC01-HK2-obe.outbound.protection.outlook.com (10.243.91.252)
 by mailbx09.quanta.corp (10.243.91.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Thu, 25 Mar 2021 16:22:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJBoMwrU+6/zWjAK4ST4+Te869+qY+0xhnyWZqzd2tvFDN67vpBXh45kJAn+52b8omVV4m335ujVLN45scOed/6u05r7yurA1KOfojG63TBME803A0xYwVSRGdtcYVj/3uPeaSitnNVDrk3bVAVx6atXmgJx75I/FJTQSbNAUwbu7I+NaGNKi8SC3NHx6h4JHGM3MnDfBDMCrS5peeHIQ182vjxLmyGAWYeXZVKYRIPX7w5esADeovFgHGlJLh4a3Rtys5tU+JMW1u2MCoxHP0tKApNnO7yRqpEWXWkpLm/zGtLPdlvxroqnDLlfzkt66OcRWNw3CSuna7yNBuUdDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GceW7riXrvY9GLezfop8OfKVK0d0wjM0U4ZfFRPqjyY=;
 b=ciSjwjq27Bc9jIdr0h8Q6TMjtqEKwwhi/jrLP2UGTyo79x/PZh7gmcvOJHsexR4NZNRhemlkUxjU5cRdeoV/iRHq/axI/PgKEUwUhjofpCvlSh9Jx84BVq9hwpBHtBp+GVrjX6WsnPaESbBxbSuIy6GsNEajqOHKgWJdWz2LB/d7SHzdVXN9D3gOw41FrkR7H//+XxhN9b3iOkjll3dfVpAvayedZrGhP0VR3XHPehN/zPQoAZtt/JeMjTXfBDeCLUHjW3vXYqIJ6gJuA3GcvzQ6OOMXxUhnPSGppCHD7VEBfdopb1ulvPxGeFqq0bTEQkSH50gDCvQ2nWZ7Q1UTiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GceW7riXrvY9GLezfop8OfKVK0d0wjM0U4ZfFRPqjyY=;
 b=1mfZlFJNGeiqC46l5m8q0YGIUdEA1a0+sfV3ZpOofW61l8X6m/svn71U/fEBhq1SNgS6SfnshynFalUI5H9RhTnTn6VmBKy4+x5j+sDr+yWIzRf3O7KMsVr0REXZGUWjHrBlSWmR91nI5ThqYvFDxiHhLZwfWk5uxqq59LUjSeQ=
Received: from TY2PR04MB3712.apcprd04.prod.outlook.com (2603:1096:404:100::15)
 by TYZPR04MB4560.apcprd04.prod.outlook.com (2603:1096:400:f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Thu, 25 Mar
 2021 08:22:33 +0000
Received: from TY2PR04MB3712.apcprd04.prod.outlook.com
 ([fe80::8cfe:610a:b81c:221c]) by TY2PR04MB3712.apcprd04.prod.outlook.com
 ([fe80::8cfe:610a:b81c:221c%7]) with mapi id 15.20.3977.026; Thu, 25 Mar 2021
 08:22:33 +0000
From: =?utf-8?B?RHVrZSBEdSAo5p2c56Wl5ZiJKQ==?= <Duke.Du@quantatw.com>
To: Matt Spinler <mspinler@linux.ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: Question of phosphor-sel-logger
Thread-Topic: Question of phosphor-sel-logger
Thread-Index: AdcgoHwyqfZQU98ITCqUNZr+o4bhCAAD+gcAACe5HLA=
Date: Thu, 25 Mar 2021 08:22:33 +0000
Message-ID: <TY2PR04MB37121D9EE4CD05A70D5F6C5B88629@TY2PR04MB3712.apcprd04.prod.outlook.com>
References: <TY2PR04MB3712DCE11C578706F5F6401F88639@TY2PR04MB3712.apcprd04.prod.outlook.com>
 <707efde2-b301-fc23-be4c-92d1d96d8432@linux.ibm.com>
In-Reply-To: <707efde2-b301-fc23-be4c-92d1d96d8432@linux.ibm.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.ibm.com; dkim=none (message not signed)
 header.d=none; linux.ibm.com; dmarc=none action=none header.from=quantatw.com; 
x-originating-ip: [60.251.243.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 700584ec-efa7-4a14-f651-08d8ef6723f5
x-ms-traffictypediagnostic: TYZPR04MB4560:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYZPR04MB4560FAA27FA2C6E9E3AB622988629@TYZPR04MB4560.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0WSaCG3mF/ICo1yTo/Px3wucVKuftCkZi4NyXTDXOSMwClqms+/5P3j1fljE6fs+moCXGfCmBIoAq8f0miWuIZbwr2o+O84IKHV80kFpV6wbrgTZP6xS88i/p8m6Qbqv/xYa8Kk7qpXj6y/SccCXThxMOicP7eDiTFV6UhJdynfuuFme9UcEa8ZrEQhDmB7d374IRBE+p9z7lEjUqxVF4AcJ+JrvlWTBdbrU3XTb1qXHOUr9GGYYmKVBSxxgo32+Xm1xt+ONGxcF/8O3AROAOvuGlCTlzSkjjMVt2c+bi6+iHdHwnHX96O2Xm2BRLZ39VkI4FkbmruHjURAJZ0+4ce3AzF3d74lN9CFGQruRCDXOzVZ0/ImsCRhoteUEhZhVhDzI9UcqTJPRmyS+cpJW6MgCqQr9c7rWaf7lTJ4N0q/GMT/SVET8h02Nec+FFpKzoO1EneQRRTkphQ5UGqZOk1Niu/RmgDM/vdyXP9EhvMnPjMyXZ1dTtn528sn+oceVd4xzNBrCx2GxfzhhcwLA5J59KaFLCJdVLsWHX58H0xUEfzfF+pXTUIBesQAYvpv0gr/toag35chqEQUR3Ht65LSKEYc1YDlbSmoBDUPiwHomi20FA5Us4WJ/c+J9kHx/dzVK2xE8k4LInHB5Wg+71yKP/56J29Q0FTFGUrWwF5gTafwMt0jARgvSrLZu6EiaqH96x+5eyeYnzfzstsxasvQuyeZE+FdJyrCVzf/3MLUt+FWHwhfhjS2pdS3+0LYD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR04MB3712.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(26005)(966005)(53546011)(83380400001)(5660300002)(7696005)(8936002)(4326008)(6506007)(9686003)(186003)(86362001)(55016002)(478600001)(33656002)(66946007)(66476007)(64756008)(66446008)(66556008)(45080400002)(76116006)(107886003)(52536014)(110136005)(316002)(85182001)(2906002)(8676002)(38100700001)(54906003)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?OE1nSElXc2t0VHZRV1NTbTVHc1VaS2Z0N0tPQlhYTDVyOWNib3ZIOGxVSVhv?=
 =?utf-8?B?MmZJTzJIUDRlU0owU0w2YnYrNWJOd21aNVcyWXpxU1hxRVN6SnJNbURSUW5Y?=
 =?utf-8?B?c0FZZHVTYStocjVUcVIrTmR4QzVjQkdtUW5qRFhrYVlrQTVrN25Scmt1SGl5?=
 =?utf-8?B?YmJYNjVUUDBwZUhaWkVtYnlhKzcwajcreVJQNTE3ZVFUYm42emNMaVNYelpV?=
 =?utf-8?B?ZW03bGo3MVNkeU43b1lNcTV4RVViemtBb3F1WEpWR3Y1aC96SU1vUjhIYlI3?=
 =?utf-8?B?OUtsaEp3LzZHS3M1Nms3NS84dm9pbTRYTTZObTZBSGJVSWdRNHA2KyttdUho?=
 =?utf-8?B?SGFkc3FtOURmVTdWYjEwUlMydEgxSXJtTTFlSURGdmNLcnpUejM0YWs1a3JW?=
 =?utf-8?B?NmhOUjRXUDJWUEhETnlaZDVjSnBxb28wbWtSN1h6NXREM3p0UGJrZExncFRW?=
 =?utf-8?B?S0VFSHRkNHNORHVpTEhhNlhCTkdJZ2dXTkVWajBSWldLMWJDS2tIUzZJU002?=
 =?utf-8?B?cEIwUUwwNnBMZXVnU096VEtDQTM2RkkvV1plZVVmVmxtcmpROXg5TUdYNlhE?=
 =?utf-8?B?QWh5dDBHSlVCRHpBQk1UZWZlSENCN0IwNGZtRTRTL0p6N2FRalZ6WWw0em1l?=
 =?utf-8?B?NjM2RU4wVVFQekJwT2lrU1JmejNiOTdGRkVvMFZlQzE2bThNSEd0T2tYb0NG?=
 =?utf-8?B?dytaL0tQQ1FrSXQ2Z2lVc2p6eUU3d2pWeE90Z3ZURnRmZk9mTU9hQ3pZU3Rt?=
 =?utf-8?B?cjYwcUhveGpJYkU0V2IzSHJkQThTZ0lTSmpZQWN1MnVXaXdvUXNrWERyMmxj?=
 =?utf-8?B?Wk9GYkltQ01KeitlTmp2cUk1bUxqN2FPSmpJL0RsU0QwVmJCVmNZUVFQN21Q?=
 =?utf-8?B?bkRCRFpndTAvRWMwdjJhT0x3aWtqZmRGbDVvbmIzV0hMZzI4TmpFWVR5dXBO?=
 =?utf-8?B?THdiU2x3dXVnaDZpNnh4OXRGbCtxaHpWWkp4azFPeFExZ1ZQbG52V0x1ZUZD?=
 =?utf-8?B?eHlGVWp1cTU3Tjk3TGs2cnA2aHVSdG5MNmdaN3A3bHJ6d09oYmxQU0JpVStV?=
 =?utf-8?B?NTVyUzU5b3pUUEdMcGc0MUNmc1R2NElNVnpqTzh3ZWRLVGFLMjdLbWQ0U2l1?=
 =?utf-8?B?c1NpaWxvdnVVdVRXQkNiZGJ4SUtac0tOKzg1TittTzUwWG1FMDBNUEthVDZM?=
 =?utf-8?B?RW5pSGg5QVcwOHVySHVWL1NZcHlncjFueng5dlBMTVp3aDhpb3BCbHdkV1ZQ?=
 =?utf-8?B?NDRjTjE2TjhMSVJyNHhqcFRZNGFCZjAyZkxkOXFibDdJb0lZdGhId2tMeWJ4?=
 =?utf-8?B?V2Z3YnJkVzJkaTJGc3hOQkVKYUFKWFczOXlPdGUyc25LQnEvNDZEbFA2dUQw?=
 =?utf-8?B?WW04MThVbTB5bFdOTGRvSTNyQ2Y4SHk3OFcyRGh5R2RZNzl3WDJSdVZ6a0ZZ?=
 =?utf-8?B?bTdJbkZpTmwzNXBtWEw1dXh2c2J4MVBIc04wdDlZNk04eExKbEJtdnNUanFD?=
 =?utf-8?B?OFduT0ppSEg0RjhKY2dyckF1Z1dzZ1habzhkNGxYdkNCaWtRVmoyRE45SXps?=
 =?utf-8?B?K1hoZCtFc1YxRmpqYzlJMXRJeFljR2dsWVo0SjZCS094U0dxM3FXQm5Yd1BH?=
 =?utf-8?B?bzl3UkJHZTRPWlFTTERHdXlXTDlIVkZ6V292Tlk3amc3bjhHVElZTm5qaWJm?=
 =?utf-8?B?U0xNMjNITTJ5dERETzRDZVY4amVYK1l6T1JFWGVqcldVRWJabEhZenRMSDdG?=
 =?utf-8?Q?JKKejC8p8C8UUr6VWmqNyS1ncb6RQ3SQxjoAjoh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR04MB3712.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 700584ec-efa7-4a14-f651-08d8ef6723f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2021 08:22:33.5317 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f5O6kmb1E9dvFmWtjDPbzQ4uCnhnUBv3BomBVdVFzijZrn8hYZUMDBDczOWB8MRMsApSviwT0om00vQEmVsDdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB4560
X-OriginatorOrg: quantatw.com
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
Cc: "vernon.mauery@linux.intel.com" <vernon.mauery@linux.intel.com>,
 "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>,
 =?utf-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>,
 =?utf-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXR0IFNwaW5sZXIgPG1zcGlu
bGVyQGxpbnV4LmlibS5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgTWFyY2ggMjQsIDIwMjEgOToy
MCBQTQ0KPiBUbzogRHVrZSBEdSAo5p2c56Wl5ZiJKSA8RHVrZS5EdUBxdWFudGF0dy5jb20+OyBv
cGVuYm1jQGxpc3RzLm96bGFicy5vcmcNCj4gQ2M6IHZlcm5vbi5tYXVlcnlAbGludXguaW50ZWwu
Y29tOyBqYXNvbi5tLmJpbGxzQGxpbnV4LmludGVsLmNvbTsgRnJhbiBIc3UNCj4gKOW+kOiqjOis
mSkgPEZyYW4uSHN1QHF1YW50YXR3LmNvbT47IEdlb3JnZSBIdW5nICjmtKrlv6DmlawpDQo+IDxH
ZW9yZ2UuSHVuZ0BxdWFudGF0dy5jb20+DQo+IFN1YmplY3Q6IFJlOiBRdWVzdGlvbiBvZiBwaG9z
cGhvci1zZWwtbG9nZ2VyDQo+IA0KPiANCj4gDQo+IE9uIDMvMjQvMjAyMSA2OjI4IEFNLCBEdWtl
IER1ICjmnZznpaXlmIkpIHdyb3RlOg0KPiA+IEhpIGFsbCwNCj4gPg0KPiA+ICAgICAgIEkgdXNl
ZCBwYWNrYWdlIHBob3NwaG9yLWh3bW9uIGFuZCBwaG9zcG9yLXNlbC1sb2dnZXIgdG8NCj4gbW9u
aXRvciBzZW5zb3IgYW5kIGNyZWF0ZSBsb2cgd2hlbiBzZW5zb3IgcmVhZGluZw0KPiA+ICAgICBj
cm9zcyB0aGUgdGhyZXNob2xkLiBJIGZvdW5kIGFmdGVyIHRoZSBjb21taXQNCj4gMjViMjZlMTYy
YmQxMDliNTFhYTA5YjE2ZjI2ZjlhYTNkOWQ5NDBmYSBvZiBwaG9zcGhvci1zZWwtbG9nZ2VyDQo+
ID4gICAgIHdvdWxkIGNhdGNoIHRoZSBzaWduYWwgIlRocmVzaG9sZEFzc2VydGVkIiB0byBjcmVh
dGUgc2Vuc29yIHRocmVob2xkDQo+IGxvZyBpbiB0aGUgam91cm5hbCwgYnV0IHRoZSBwaG9zcGhv
ci1od21vbg0KPiA+ICAgICB3b3VsZCBub3Qgc2VuZCB0aGUgc2lnbmFsICJUaHJlc2hvbGRBc3Nl
cnRlZCIgd2hlbiBzZW5zb3IgcmVhZGluZw0KPiBpcyBhYm5vcm1hbCBzbyB0aGF0IHBob3NwaG9y
LXNlbC1sb2dnZXINCj4gPiAgICAgd291bGQgbm90IGNyZWF0ZSB0aGUgc2Vuc29yIHRocmVob2xk
IGxvZywgYW0gSSByaWdodCA/DQo+ID4NCj4gPiAgICAgSWYgSSdtIHJpZ2h0LCBjYW4geW91IGdp
dmUgbWUgc29tZSBzdWdnZXN0aW9uIHRvIGZpeCB0aGlzIHNpZGUgZWZmZWN0LCBvcg0KPiB3aGF0
IHNldHRpbmcgSSBoYXZlIGxvc3QgaW4gdGhlDQo+ID4gICAgIHBob3NwaG9yLWh3bW9uIG9yIHBo
b3NwaG9yLXNlbC1sb2dnZXIgPw0KPiANCj4gSGksDQo+IFRoYXQgc2lnbmFsIGlzbid0IGRlZmlu
ZWQgaW4gcGhvc3Bob3ItZGJ1cy1pbnRlcmZhY2VzLCBzbyBwaG9zcGhvci1od21vbg0KPiBjYW5u
b3QgdXNlIGl0LsKgIFdoZW4gSSB0cmllZCB0byBhZGQgaXQsIGl0IHdhcyByZWplY3RlZCBhcy1p
cyB3aXRoIGENCj4gcmVjb21tZW5kYXRpb24gdG8gYnJlYWsgaXQgdXAgaW50byBzZXBhcmF0ZSBz
aWduYWxzIGZvciBlYWNoIGFsYXJtIHByb3BlcnR5DQo+IG9uIGVhY2ggaW50ZXJmYWNlLsKgIEF0
IHRoYXQgcG9pbnQgSSBnYXZlIHVwIGFuZCBoYWQgdGhlIGNvZGUgSSB3YXMgd29ya2luZw0KPiBv
biBhdCB0aGUgdGltZSBqdXN0IGxvb2sgYXQgcHJvcGVydGllc0NoYW5nZWQgc2lnbmFscyBpbnN0
ZWFkLg0KPiANCj4gSWYgeW91IHdvdWxkIGxpa2UgdG8gdGFrZSB0aGF0IHVwIGl0IHdvdWxkIGVu
dGFpbDoNCj4gKiBVcGRhdGUNCj4gaHR0cHM6Ly9hcGMwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5v
dXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2Vycml0Lg0KPiBvcGVuYm1jLXByb2plY3Qu
eHl6JTJGYyUyRm9wZW5ibWMlMkZwaG9zcGhvci1kYnVzLWludGVyZmFjZXMlMkYlMkINCj4gJTJG
Mzk4OTkmYW1wO2RhdGE9MDQlN0MwMSU3Q0R1a2UuRHUlNDBxdWFudGF0dy5jb20lN0NjNWJmNGQz
ZDENCj4gNmYwNDZjYzZlZmEwOGQ4ZWVjNzhmZDclN0MxNzliMDMyNzA3ZmM0OTczYWM3MzhkZTcz
MTM1NjFiMiU3QzElNw0KPiBDMCU3QzYzNzUyMTg4ODc4Mzg1Mzg5MyU3Q1Vua25vd24lN0NUV0Zw
Ykdac2IzZDhleUpXSWpvaU1DNHcNCj4gTGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJ
azFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMjAwMCZhbXANCj4gO3NkYXRhPVhvWTRuS2EzR28lMkY5
anQyY295ek9jblhOcmNNYXc2WFV0cW5tSzU3azBkcyUzRCZhbXA7cmVzDQo+IGVydmVkPTANCj4g
YXMgcmVxdWVzdGVkDQo+ICogVXBkYXRlIHBob3NwaG9yLWh3bW9uIHRvIGVtaXQgdGhlIG5ldyBz
aWduYWxzDQo+ICogVXBkYXRlIHBob3NwaG9yLXNlbC1sb2dnZXIgdG8gYWxzbyBsaXN0ZW4gZm9y
IHRoZXNlIG5ldyBzaWduYWxzIGluIGFkZGl0aW9uDQo+IHRvIHRoZcKgIGN1cnJlbnQgb25lLCBv
ciBjaGFuZ2UgdGhlIGRidXMtc2Vuc29ycyBjb2RlIHRvIG9ubHkgZW1pdCB0aGUgbmV3DQo+IHNp
Z25hbHMuDQo+IA0KPiANCg0KSGkgTWF0dCwNCg0KICAgVGhhbmtzIGZvciB5b3VyIHJlcGx5LCBJ
IHdhbnQgdG8gYWRkIGEgZXZlbnQgbW9uaXRvciB0byBsaXN0ZW4gInNpZ25hbCBQcm9wZXJ0eUNo
YW5nZWQiIGZvciANCiAgICJwaG9zcGhvci1waG9zcGhvci1od21vbiIgb25seSwgbGlrZSB3YXRj
aGRvZyBldmVudCBtb25pdG9yIA0KICAgKGh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJvamVjdC54
eXovYy9vcGVuYm1jL3Bob3NwaG9yLXNlbC1sb2dnZXIvKy8zNzc3NCksIA0KICAgSSB0aGluayB0
aGlzIGlzIGEgc2ltcGxlIHdheSB0byBmaXggdGhpcyBzaWRlIGVmZmVjdCwgd2hhdCBkbyB5b3Ug
dGhpbmsgYWJvdXQgbXkgdGhvdWdodCA/DQogICANCiAgIFBsZWFzZSBmZWVsIGZyZWUgdG8gZ2l2
ZSBtZSBzb21lIHN1Z2dlc3Rpb24sIHRoYW5rcyB2ZXJ5IG11Y2ggIQ0KDQpUaGFua3MNCkR1a2Ug
DQoNCj4gPiAgICAgcGhvc3Bob3Itc2VsLWxvZ2dlciBjb21taXQNCj4gMjViMjZlMTYyYmQxMDli
NTFhYTA5YjE2ZjI2ZjlhYTNkOWQ5NDBmYSBsaW5rIDoNCj4gPg0KPiA+IGh0dHBzOi8vYXBjMDEu
c2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmdpdGgN
Cj4gPg0KPiB1Yi5jb20lMkZvcGVuYm1jJTJGcGhvc3Bob3Itc2VsLWxvZ2dlciUyRmNvbW1pdCUy
RjI1YjI2ZTE2MmJkMTANCj4gOWI1MWFhMA0KPiA+DQo+IDliMTZmMjZmOWFhM2Q5ZDk0MGZhJmFt
cDtkYXRhPTA0JTdDMDElN0NEdWtlLkR1JTQwcXVhbnRhdHcuY29tJQ0KPiA3Q2M1YmY0DQo+ID4N
Cj4gZDNkMTZmMDQ2Y2M2ZWZhMDhkOGVlYzc4ZmQ3JTdDMTc5YjAzMjcwN2ZjNDk3M2FjNzM4ZGU3
MzEzNTYxYjIlN0MNCj4gMSU3QzANCj4gPg0KPiAlN0M2Mzc1MjE4ODg3ODM4NTM4OTMlN0NVbmtu
b3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBDQo+IHdNREFpTENKUQ0KPiA+DQo+IElq
b2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzIwMDAmYW1wO3NkYXRh
PXJIeEtxSWsNCj4gVmc3DQo+ID4geVFYbXF2alhhbDdJNmVWQnp3M2lmbDI2Z3NaRjhvNHhvJTNE
JmFtcDtyZXNlcnZlZD0wDQo+ID4NCj4gPiAgICAgVGhhbmtzIHZlcnkgbXVjaCAhDQo+ID4gICAg
IER1a2UNCg0K
