Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2783658D8
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 14:25:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPjZ71Gk5z2y69
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 22:25:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=l3GoA7dz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=40.107.132.113;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=charles.hsu@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=l3GoA7dz; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320113.outbound.protection.outlook.com [40.107.132.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPjYs6zJgz2xfk
 for <openbmc@lists.ozlabs.org>; Tue, 20 Apr 2021 22:25:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MO3uFUZI4SIk1Mm1SkG3Bk1dMHDDYW/DTjrg+GlOFpac05fTzfr43hsCH1a3AIgKpZJS2hqP52+GGYtlsTWc905hORh0OcfBmBKqHPnMVayWvyjDr0s4bnse/RNCJcBPuK92ix8aCVw/FEt32kR7a8HWnFpwafC93ZQrOThlcCgb6FKmP4qVIWHCo1gcA+fuO/9kVZQ3HhduFSNtLZ8uw/k9uzV/7gxWfyd9+7DUutsg+kqeCkQ3z+82C//ENwAO1c4vbI3hKPLVbQAzVSA8gYUtL9W0nwk4W4q/1arA0ekdy659v+42XHvI1Vs5pAAZSV2R/JcSAR7+wdUZ7RtGRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DC2f4uZiXl5/WucMHXGRnXNPvbL3DIylhDBmPZDyLes=;
 b=BTaQHi7pRIoG8spmhTTEpvXs3J2YEqjKnb7fHBuTkdY76/BDAXEvgKSyOU893Bk5bSpe+N2S6rhXb/CsT/agGV83Zv9Pb8fVdYtri9tHP6fPlwVyBMPLDDoZWOdGkVXgMgpj4QvI5M5SVfavWSQNtE/EU+nYeKkMDjL62rcyJi/kQ+AkzZQbmxaj/OlU7RzDAYsttE6CCuU0qBLxIdgmL4yY3UnOYkhgekNcVlQM1UHuDsXFtuuo+pHt52HQwuWIya+nuKit8w8j2RyLangnr1NPFOIpH3KVTScLQHk48oCbeQQwxI6tWtumZ+MCJvRzY4Et0w31a+aybZ+DZUdlSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DC2f4uZiXl5/WucMHXGRnXNPvbL3DIylhDBmPZDyLes=;
 b=l3GoA7dzcuVihTqBhPBzNrhhxy8I/pKy7pGBLF5YZpqRXf7k7cumR78CALkRI4YVE0GrqpwvN0ulQZnc/X+Jhb3Psbr3Lx/YajZjFipbT4TX0LTLS4XrXXgJoZvGQBazwuP4XwVDpHVUHoERavTaRLoOqz/5csDil53BqHt9aGw=
Received: from SG2PR04MB2298.apcprd04.prod.outlook.com (2603:1096:4:a::22) by
 SG2PR04MB2635.apcprd04.prod.outlook.com (2603:1096:4:60::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.19; Tue, 20 Apr 2021 12:24:52 +0000
Received: from SG2PR04MB2298.apcprd04.prod.outlook.com
 ([fe80::d4f8:e25d:d792:602f]) by SG2PR04MB2298.apcprd04.prod.outlook.com
 ([fe80::d4f8:e25d:d792:602f%4]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 12:24:52 +0000
From: =?big5?B?Q2hhcmxlcyBIc3UgKK59pcPBwyk=?= <Charles.Hsu@quantatw.com>
To: =?big5?B?Q2hhcmxlcyBIc3UgKK59pcPBwyk=?= <Charles.Hsu@quantatw.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: x86-power-control: make the timeout configurable
Thread-Topic: x86-power-control: make the timeout configurable
Thread-Index: Adc12v7qwlgcqvejT7KSoZ5DrG8NQAABO/7w
Date: Tue, 20 Apr 2021 12:24:52 +0000
Message-ID: <SG2PR04MB22980CBD819B3CC6ACF5D7F38A489@SG2PR04MB2298.apcprd04.prod.outlook.com>
References: <SG2PR04MB2298402C7E2E3DB9E522CDB58A489@SG2PR04MB2298.apcprd04.prod.outlook.com>
In-Reply-To: <SG2PR04MB2298402C7E2E3DB9E522CDB58A489@SG2PR04MB2298.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: quantatw.com; dkim=none (message not signed)
 header.d=none;quantatw.com; dmarc=none action=none header.from=quantatw.com;
x-originating-ip: [61.218.113.162]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80c7ccef-b448-4299-666c-08d903f74c50
x-ms-traffictypediagnostic: SG2PR04MB2635:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SG2PR04MB2635035778655EB2FB60C7E88A489@SG2PR04MB2635.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Oy9DAfBT38D9holrddO5MqladWmDNkUFyev85uSDRo0jUKu/ABpQzK2NnBpd1RXBK+JkBWFvQJsYUnC6aVFlwC8ha1h4V6JOq+9PK+gfRBxWt0qQY3hsiV0GsYPYo9m6MmPbSqI88MxXdrgMBbTI1eY6xXb/ZP8ftW/uTacPupKso9KPJdX0nY8YdvYvvXaRc9WM1k6HA60lq+n89ZH4rmNClEUHhXUT5w/noMVNK8jeHYYyl3v+AvVm0HFaO73/TZj4Uudj4wmCzNHJaG1lvYYH6TZulnL3pRCbE6eHpmk42fAzdFO4q3yEMAERGzi9tz4fNYWPdQmf21PILeXjVAmqFqYk+67b8r4KeMp2La/SI/7krgjVUlpcfNv1Q8yBE2vm/KIly2IoaSDxpLWvqJp3FnXD5GNvuvGm3uIgZw4cKMsqg9fm8nfVdxPILsflWyugvz9IVs+EerMm5tnZS69+zQzs0He2M6yBRSmRC0SgLjWF+pT2K2AXf7kQohHOYDqpulW8CoH9BWsRp2Q9Fi585xhLq7wNKQyL36depQwbsiI/1GDcWq2UNhdrYGqrK+Yk7u64sIJsU4GJbaNxuqq/FsZcJszTP66fFBHYzHsV5rndwX51QOWDt/tV+Y1shu06rQzBUbmGQOiknVM0RD65EYLf2q+FeTNke0319J5BPj1ukQ2dQHYexOP3HtHO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR04MB2298.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(71200400001)(110136005)(86362001)(76116006)(4744005)(6506007)(66446008)(55016002)(66476007)(316002)(7696005)(85182001)(53546011)(66946007)(33656002)(66556008)(64756008)(5660300002)(52536014)(38100700002)(4326008)(8676002)(8936002)(54906003)(966005)(9686003)(122000001)(26005)(186003)(2906002)(478600001)(2940100002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?bVpxZWRiYlYvMWc5UitnYndaVVB1cXhEcUlzUDBWQjBmaEx3djdWOHVWQkJuUjB1?=
 =?big5?B?VEU3SkFPdEQxdVY0RHN5L2tXZ2xMMUxPamFtRTQ4RFdmYVc2azBKb29MZTVETFNR?=
 =?big5?B?UHpmZmtoL0R4TFp1SGUzTGxSd1JWSmNtS1poeXdSSm5Nc2wxN0lOWnFlL0htZzJO?=
 =?big5?B?d2VKTUxLRDF1aVVyYnY0MGVEY3JnZUhhUENHNXp1MTVRY244dHFDQUdiSldKemt0?=
 =?big5?B?U0dKakh6b2s5dTNmazBiaFpNYkh1U2ZIQVQ3Mlp5TGdlTzFqYUMzZTRuWnJXcUc0?=
 =?big5?B?eGxRSHQzVjg1ekZNNnhhaHZ6UGtCRjdDNUdKMVlha2tlY2dhS1R3MjRiOURnUEFm?=
 =?big5?B?WDdqZWpaNy9LcmRvNVAzRGZHV2w4WGNtak1ucGJVNnh5d0tBeER0SDdtQ0k3S25u?=
 =?big5?B?cEd3TmV6MkNEU3VHRjY3UmtuRUlwaHlGcVFOS0c4UGkrbWQrNTd2NjZOV3RIZXg1?=
 =?big5?B?ajdlMkVjVnZTQXhiVGZDVVpyUmp0QzFNV2c0Zmk3bTRvRHhBZWVTczI2VlIrNnlU?=
 =?big5?B?Y0pPZ3JDVncwY1JvUDB1RU1xTDlUbHlsNDk3OENxN2tWQ3B2aFRwNjFjejM5SFk2?=
 =?big5?B?eGYydWFYdGwwMGtCditrMUtCcTJJVmpLbzZBNWQ3RjZQcithQ2l4S0tUcjN4blhC?=
 =?big5?B?amVweGtBancxSkYrVmI2UTVkb2lyVkxaQ2tjODV4cytuNXNEcloxSVZha0lMWlpa?=
 =?big5?B?UjZnY3dWUFNmVGVTMlp2S1NUb01mVUs4dzE5bFZDNkdzWTcreE80UHpBVUxVeUhm?=
 =?big5?B?TlhkSEpOaFR6S25YTStKUGJhbU16ZzBlWllxcU9kR3MxZzRhQlc4bHN2Y3J6REt1?=
 =?big5?B?TVRYZ002WW9mT2ZNZk5kZWZTbUhKSW05N3VuTno3d3gvSFM0bEJiYzJUWmZIVXZU?=
 =?big5?B?STZLKzV5OXc4UHZQUkhMcTUvOXd4T0xkOG9rckZSZ1pNSDNvUTdtQjFmYmFtcUt0?=
 =?big5?B?VGxwbHhhQUpGLzhGcTdPdVY2cGEyY0lSM09ncVJ0Mnhyb2pPaVZuMDU3VmpJSVBa?=
 =?big5?B?WmhGSFNhbmlmL0VFWXhDMGNIcVhkbi9ZQjJ0WUhNUVhxOVFkZEt5ZVU0VzBLTk1u?=
 =?big5?B?Skp4TlV0VFRiVmpjZjRlSEtDcWEzSUZGOG52MDVTNkZabHRuYVR0OFQ4WTl4UFRP?=
 =?big5?B?U2I5SlhYS2ZONGdQNE14VnY4Tlc3WDRzWituUWErWXZ6SEQ2ckxIMzdrSXFydlBG?=
 =?big5?B?N3poMzlpM3lKS01EUjNWeFordW5XbWFFc0dOTFRxRzBpVGtvQVo1THFTZDIvR2Iv?=
 =?big5?B?SGordXpzVStrQUFlMGYzUVo5Nkorc1pjTjlPM05aMEVDUlZqT09BcnBIV0ZGRTFt?=
 =?big5?B?SGZVbld6czk5VkF5dExVQWRyRGZUMWYwd0xYNStOQ2l4L1ZkbUdoSFlxblFPandr?=
 =?big5?B?dEF4NkJzY2dpcmhZWVRJYnlXUzhjSlFXWmJzK1kzbS9uV1JpK0Z0U0VtSVUraVkz?=
 =?big5?B?SktJM2NpYlVkclhwbXJISXo0Z1Z1bjZ3NHVhRTBhZEVJZnBKTTdPVmI1QUllNnpz?=
 =?big5?B?VWNCOVdvbUd2SnZ2eUxQQjcrNXBPMUpJYnBhV1ZDMHdTZ05lMExlSEJOM0J4b3NP?=
 =?big5?B?bTZWSGZDeWRheENBQ3p4TE54b0RZTVA1R1Vqb2JHakxiclBtTTBuTE5Ha0grYmhr?=
 =?big5?Q?YK2o0wwQ0n6H3D0ZatpM5FkmFYICS1NHLC09FOvTizxVQISP?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR04MB2298.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80c7ccef-b448-4299-666c-08d903f74c50
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2021 12:24:52.1069 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3j0nz7fmMJvooUeSAf3jV7kw315sXY+xeHM2DAbS4i+0mzXVwZ9eCqGqUgbeZIUWeolwiuJMlalkW5vBs8iO6m6Deubii16SqigAXUDVKZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2635
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
Cc: "jason.m.bills@intel.com" <jason.m.bills@intel.com>,
 "kuiying.wang@intel.com" <kuiying.wang@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmJtYw0KPiA8b3Bl
bmJtYy1ib3VuY2VzK2NoYXJsZXMuaHN1PXF1YW50YXR3LmNvbUBsaXN0cy5vemxhYnMub3JnPiBP
biBCZWhhbGYgT2YNCj4gQ2hhcmxlcyBIc3UgKK59pcPBwykNCj4gU2VudDogVHVlc2RheSwgQXBy
aWwgMjAsIDIwMjEgODoxOSBQTQ0KPiBUbzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQo+IENj
OiBqYXNvbi5tLmJpbGxzQGludGVsLmNvbTsga3VpeWluZy53YW5nQGludGVsLmNvbQ0KPiBTdWJq
ZWN0OiB4ODYtcG93ZXItY29udHJvbDogbWFrZSB0aGUgdGltZW91dCBjb25maWd1cmFibGUNCj4g
DQo+IEhpICwNCj4gCUluIG15IGNhc2UsIHRoZXNlIHRpbWVycyB3aWxsIGJlIGRlc2lnbmVkIGFj
Y29yZGluZyB0byBkaWZmZXJlbnQgaGFyZHdhcmUuDQo+IEkgd2FudCB0byBtYWtlIHRoZXNlIHRp
bWVycyBjb25maWd1cmFibGUgYW5kIHB1dCB0aGVtIGludG8NCj4gcG93ZXItY29uZmlnLWhvc3Qw
Lmpzb24uDQo+IElmIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9uIG9yIHRoaXMgbW9kaWZpY2F0aW9u
IGlzIG5vdCBuZWVkZWQsIHBsZWFzZSB0ZWxsIG1lLg0KPiANCg0KWDg2LXBvd2VyLWNvbnRyb2wg
Y29tbWl0IDkyY2FhNGM2Mzk5MDNlZjA3NmUyZjA5ZTk4NTI5MTc4MWVkZDkyN2QgbGluazoNCmh0
dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3g4Ni1wb3dlci1jb250cm9sL2Jsb2IvOTJjYWE0YzYz
OTkwM2VmMDc2ZTJmMDllOTg1MjkxNzgxZWRkOTI3ZC9wb3dlci1jb250cm9sLXg4Ni9zcmMvcG93
ZXJfY29udHJvbC5jcHAjTDcyLUw4MA0KDQo+IFRoYW5rcy4NCj4gQmVzdCByZWdhcmRzLA0KPiBD
aGFybGVzDQoNCg==
