Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD6831E4DC
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 05:04:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dh1Ln6MzQz30Lp
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 15:04:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=InventecCorp.onmicrosoft.com header.i=@InventecCorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-InventecCorp-onmicrosoft-com header.b=MR8ZrLvl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inventec.com (client-ip=40.107.131.102;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=udupa.ashwini@inventec.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=InventecCorp.onmicrosoft.com
 header.i=@InventecCorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-InventecCorp-onmicrosoft-com header.b=MR8ZrLvl; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310102.outbound.protection.outlook.com [40.107.131.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dh1LW3yjBz30KH
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 15:04:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8XMcReLsf8zCUPgmfIHpeskJjkQn+y2I8LBdikh8+E1kYNvvoMcVY3UUgupqM1BPear+eynq/2qS/IPoSGKWhhWL2+n5SYNZmSSYzMmjgTzSn+RNdFhpsvxezxrnbs33XTgWsmzhoNDw9BrgDFVmUhUFYW+kvXF4+Z0a22MQdbfRhNm/26qgGLLdaL8DenE3Evk+VW6FPctV8qHmEKNUBnc0xxNWzVAD/C3ZtyArPpOfuV6usCmzIQa8ozIfgALSFf9SJWlGQbSClj9xmvk7enW+QvVD63clzRSLI+1LqRrJW8V7Cldu+Lu5+u43W2k3bc4B4wjp7iqQ0uHAmNjzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJfbK9loXKDZ3pinSui+HVlnaqbpgagF4qH6jXd9oIE=;
 b=i2faoXR6+gIrQIl6FCoQEkDyQzeOtaGRwRUJh0fHRoSqiKM85MP3T/0lrezEZA3SXPRvGtUTZmQDitlk/XakS9QP/bqT969D/KwoR1ODRcURC4zejhx4AJedb+YVcxjhdCbpbqTf1Yf9M4UymS7a4cAmy4GxORVd2ufrb0Yz4YQS+eoI7jskuWocwbIbQiuIjE7BWfTOL7Ee/C/w8Nn4o/K3n3zDeZDJ+CbIa3odNKwTkcbp38ta+cCx1BoSTFtr0HPoGTafvj2cxx3XouVLHSYERhiGABsEE1g6ZE1ZVidLx2Cs2YuaJDepuPsqonDx/kOd0FHzE7ktQPUx6Wo/5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inventec.com; dmarc=pass action=none header.from=inventec.com;
 dkim=pass header.d=inventec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=InventecCorp.onmicrosoft.com; s=selector2-InventecCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJfbK9loXKDZ3pinSui+HVlnaqbpgagF4qH6jXd9oIE=;
 b=MR8ZrLvle9+ZzOX4i0JykBz54NSxVjKUKnlvDBXBsVACmdxI1SUZPGTHv7Aly2ARz8F2QbRbb1klZ8NEM5oDsOARlATnpaxI+2DNLeWSkYFIJpFNuo52KvqEusZ4IMNien4TG84G1n1xvY3HG612E817iZgO/ppsbr8TRnsPmkk=
Received: from SG2PR02MB2796.apcprd02.prod.outlook.com (2603:1096:4:59::20) by
 SG2PR02MB2397.apcprd02.prod.outlook.com (2603:1096:3:27::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27; Thu, 18 Feb 2021 04:04:13 +0000
Received: from SG2PR02MB2796.apcprd02.prod.outlook.com
 ([fe80::740c:c7c0:872f:1ccc]) by SG2PR02MB2796.apcprd02.prod.outlook.com
 ([fe80::740c:c7c0:872f:1ccc%7]) with mapi id 15.20.3846.039; Thu, 18 Feb 2021
 04:04:13 +0000
From: Udupa.Ashwini ISV <udupa.ashwini@inventec.com>
To: Ed Tanous <ed@tanous.net>
Subject: RE: Redfish v1/Systems/system/EthernetInterfaces
Thread-Topic: Redfish v1/Systems/system/EthernetInterfaces
Thread-Index: AdcA6cGzNFkuOxBET+q6tGgjuo9o4ABSXQ1wAABT3oAAzSYpUAAAbvSAAAC2Q9AAAK55gAAAl2HAAABlMgAADZ7vQA==
Date: Thu, 18 Feb 2021 04:04:13 +0000
Message-ID: <SG2PR02MB2796FF03FB70A2CBE2A79D5185859@SG2PR02MB2796.apcprd02.prod.outlook.com>
References: <SG2PR02MB2796B5FB2DB9AAAE2594BA1E858B9@SG2PR02MB2796.apcprd02.prod.outlook.com>
 <SG2PR02MB27961D3A938C94341747757C858A9@SG2PR02MB2796.apcprd02.prod.outlook.com>
 <CACWQX807_KpeTHnMqPMt8E+h_ggMpKy0_Jr82HPV+oRushXdXw@mail.gmail.com>
 <SG2PR02MB2796736A2D3DCEB0AC9AEC9985869@SG2PR02MB2796.apcprd02.prod.outlook.com>
 <CACWQX80r9dYEGbwftH32Sc6fRmDLHeYg24tdO+8hME9V_bDDCg@mail.gmail.com>
 <SG2PR02MB2796D7A6B15C18F348369F0A85869@SG2PR02MB2796.apcprd02.prod.outlook.com>
 <CACWQX81Wg-+tcj+QbUCN8K=Ox7EeCmPL_b2VSYr3ziM-d2va4g@mail.gmail.com>
 <SG2PR02MB2796CC3A1DDD20838992AF5185869@SG2PR02MB2796.apcprd02.prod.outlook.com>
 <CACWQX80UBr2vGm3-ixo_G2W1SjYhmJTuX+SmpP947e5y922H_w@mail.gmail.com>
In-Reply-To: <CACWQX80UBr2vGm3-ixo_G2W1SjYhmJTuX+SmpP947e5y922H_w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: tanous.net; dkim=none (message not signed)
 header.d=none;tanous.net; dmarc=none action=none header.from=inventec.com;
x-originating-ip: [24.6.83.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e4649e2e-2424-4f71-2456-08d8d3c240a1
x-ms-traffictypediagnostic: SG2PR02MB2397:
x-microsoft-antispam-prvs: <SG2PR02MB23978AFAB1BB5D38AC2DE2F985859@SG2PR02MB2397.apcprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gg16xrT9wOAb5opkvFxWK6dQQjugo+l7TvPOdZ2GFFerxhkGb4T+3Z9sqFc2n0eOLJybAWTfCqs5jSaPegu98sMW/xFqGxU9arYWsbT/cmdkID6T7UWq6E/LtiG0W56nJ+univAMjFAor/vUCuGfpI57DVRtoRp0RC4S/5HTIn0XYn7qj1KDiMSkZja1EC+9MF+wxK8fk/lW/ERCG8ANodskFxBWBwF6S8POMSvUcvYWEhcYexd7SIgQO58lDiYPlWF7OQB3sBuXs0kGgUseULSMSLS9NIU1XxLMHbEDHGMVeHvN0ahJOF3KgVQmrwR4DJeb6/YhhrbeIuC7fHlobWNvhHAxdo1w8PJHKGKeA3UGrtv3dZBFz/MY811n7xbqtU187B80NMXQJJ22LawSkNrVHCv6S4cK5cVKnuibulvcGIh7+Ra3ytU3mZOMcNx3+NwcXhiytt0a01Iz6wxJqsdi6CwW2Y8GFZoUzwQAZ9/g5ZXR1gTogy0bFMddSInWsCuTQz0hrsAUDCSekH0z7lGZckuau8b68jc1Rqp6AG1+FRcmlHWbJTNAwoKRhyIMxQngCNImlCzElx4D5U8yDJ1GJpAOjgJG7+4qM3uchZU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR02MB2796.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(376002)(39860400002)(346002)(4326008)(8936002)(8676002)(66476007)(9686003)(5660300002)(52536014)(186003)(64756008)(55016002)(66446008)(316002)(76116006)(26005)(66946007)(71200400001)(33656002)(2906002)(966005)(478600001)(19627235002)(86362001)(6506007)(83380400001)(7696005)(66556008)(53546011)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Y3FlTkdmSkVWcjJtMVM4UVFlRGFCR0UwdzdDVGJyTkNoNWxhQ3R5YzZMekE1?=
 =?utf-8?B?U2lONmlzYkNUMmNGdHl4d1JlOG90OU9ueUpkdFJvOHg1RlpYUXVqOWEwMFlr?=
 =?utf-8?B?Y0dkOXpSNFcrejQycjFqZ3IwbE00TGhHK2hoZnpIUkhwVVMrVWxzU256Q3o2?=
 =?utf-8?B?RW5XbStQVXFCRTB4VXo5aUk1YkZpb3lzL0hRNnVkWVkxekRadCs0SmQzSjNl?=
 =?utf-8?B?akpxbGJzdEgwbG1JVGNMTGZPOTkzS3NUVzNrcGVva1E4dWpBK3RoRksvbVRa?=
 =?utf-8?B?dVJtRW9ydk5zZVZpK29DejFUd3IwbnVKbFAyVXZYRTh1dFJ6QnVpR1A5SnND?=
 =?utf-8?B?QjJ3L0IvWXVkZmVsZW84dml5ZUg4TTIzOWFpR04vMlJTYms4djE3V1RtMTFk?=
 =?utf-8?B?Nm5RV0VRWFVwS1IxdnhGcnM0Qngyckc0bVFJZ1BUZ1d4Tmd4TE9lM05nT1NL?=
 =?utf-8?B?U2pRcklSTTZMMTFoQVNzbmFlS09GcldubzRPZStCN0VDbTladndjNmhuRmpY?=
 =?utf-8?B?aXZwUVM2MlY3TW9ER1JveHRZemhzRnExV3ZLRnNpaytuWHJLZEdTeXR6WW1M?=
 =?utf-8?B?WE1nV2YzWWplYy9XTzVtSFYvdlJDbENHY21KQkZWd3FmdVI0YmJmbFZrN0Mw?=
 =?utf-8?B?M2U5T3oxZUhiMEg0OS95eVpWWWxWRTRncUtrWG0yT1RRc2RGMTlSR0RNVkVq?=
 =?utf-8?B?N0d6YWIzS3JvN3BJcHpZZGpYUm1FOHZlSVp5WGxYVklIU25UME1wN2lobitI?=
 =?utf-8?B?THdBQ1NFUnBySzRxY0J6UnVkNlBmQ1kvbmhCaUoxZ0E3RW9sTHUzanozM3U4?=
 =?utf-8?B?YUVrQVFoZHJ0djI5elZHZDVEQnZTMm5iWWM4R29MTVpzN05PZmdtNk5nbFVq?=
 =?utf-8?B?Z1lsSWg2aGV2SUtreXJRS2JJbnhqN0dZN1N5VkRRVGFjbEwxMVZaSE9rZ1ZV?=
 =?utf-8?B?UnNzNXRaRXBqMzhVVEE2WWVvK1d5UldOUkg5WEpCSWJDZElWdVBGU1ByNnpJ?=
 =?utf-8?B?UTgySFRGVmNySDdTZzA2elZRMTcweUZ6T2lFY2xSY1ZlM2tIS2lVNndHQnMw?=
 =?utf-8?B?SzJEYUJTdk5lZmxCdW9MTnYzWUhuMTA1Y1ZRU29ZQ2U1dFpZMkU1TWg3L0di?=
 =?utf-8?B?N2huUVJiODRTcGxqVEU4SmZ1SVIrZVc4Q3FJSTRNQTVaVjdXdFVKQ1lvNUNH?=
 =?utf-8?B?alNYSzJiaXlDcFl5VGtVRTFmbC9qSU56ZHhNcVkvQ05VdUE3MVhjL1NETThG?=
 =?utf-8?B?Q1ZiQ0NvWWRYZ2ZoekhxWHhiL2JxcU52QzBPY1BsTHRBa0YwSmgwK3l6K3dV?=
 =?utf-8?B?QUFqMkRsdDh2QzBkWkdBWEtDSmVMVG4vdGJQaHlJTGlhNHNQMUNHeDA4cHNx?=
 =?utf-8?B?c0VIc2xoZk9jem0rWlRvcitaQVFjaVFXbTRSYVYvZHZzRlkrUTVXRUZmSTdN?=
 =?utf-8?B?Qk1YUWllOTBMV3kxa3gvaC9VNmg2YkRlMTRCRk51UGhwU2JSVmZZNDQycXQ4?=
 =?utf-8?B?dnFPaWpRallGQ1hIR3NzOUh5VExYL2JqQkd2Q1ZsbWZSVFFHMGJYRXV2TGRV?=
 =?utf-8?B?UjFZR1piZVRwdmd6RWFiS0p2VFFHRis3MVpsWDZtTmJaZ1ptd3hWcGhvN0h5?=
 =?utf-8?B?TGdGclo2SVdieTZJNUNQM0RzQk4zZTFhQi9pbHo1eU96MzBQMzQ1MTFUTVp5?=
 =?utf-8?B?RG5maDhyRmFhaDZKK1pyeG15YnFjTHJhSlYwNVBVMHN3T3czaG5Nb0VUbW9V?=
 =?utf-8?Q?N6nttPvB4Z1s7slCyY=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: inventec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR02MB2796.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4649e2e-2424-4f71-2456-08d8d3c240a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2021 04:04:13.2005 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2ae41f0c-acca-40f1-9c63-49475ff38512
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A9GtjqelqhHRNCLXB/DbObTkbHGuZOXoMNffdOiJBHWQ9jOIUrNASYnRQTFVH/7MuZP1TXCL9uzdmDUImUuK6YRcgL0PRZAxWQB3p+R5qNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR02MB2397
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

DQpPbiBXZWQsIEZlYiAxNywgMjAyMSBhdCAxOjIzIFBNIFVkdXBhLkFzaHdpbmkgSVNWIDx1ZHVw
YS5hc2h3aW5pQGludmVudGVjLmNvbT4gd3JvdGU6DQo+DQo+IE9uIFdlZCwgRmViIDE3LCAyMDIx
IGF0IDEyOjEzIFBNIFVkdXBhLkFzaHdpbmkgSVNWIDx1ZHVwYS5hc2h3aW5pQGludmVudGVjLmNv
bT4gd3JvdGU6DQo+ID4gPg0KPiA+ID4gSGkgRWQsDQo+ID4gPg0KPiA+ID4NCj4gPiA+DQo+ID4g
PiBJdHMgSW52ZW50ZWMgcGxhdGZvcm0uDQo+ID4gPg0KPiA+ID4gaHR0cHM6Ly9naXRodWIuY29t
L29wZW5ibWMvb3BlbmJtYy90cmVlL21hc3Rlci9tZXRhLWludmVudGVjDQo+ID4gPg0KPiA+ID4g
SSBqdXN0IHdhbnRlZCB0byBrbm93IGhvdyB0byBpbXBsZW1lbnQgL3JlZGZpc2gvdjEvU3lzdGVt
cy9zeXN0ZW0vRXRoZXJuZXRJbnRlcmZhY2VzLg0KPiA+DQo+ID4gRXhjZWxsZW50LCB0aGF0IGhl
bHBzLiAgSSBvcmlnaW5hbGx5IG1pc3JlYWQsIGFuZCB0aG91Z2h0IHRoZSBpbnRlcmZhY2Ugd2Fz
IG1pc3Npbmcgb24gdGhlIHBsYXRmb3JtLCBub3QgdGhhdCB5b3Ugd2VyZSB0cnlpbmcgdG8gYWRk
IGl0IHRvIHJlZGZpc2guDQo+ID4NCj4gPiA+DQo+ID4gPg0KPiA+ID4NCj4gPiA+IFJlZ2FyZHMs
DQo+ID4gPg0KPiA+ID4gQXNod2luaQ0KPiA+DQo+ID4gUGxlYXNlIGRvbid0IHRvcCBwb3N0Lg0K
PiA+DQo+ID4gPg0KPiA+ID4NCj4gPiA+DQo+ID4gPiBGcm9tOiBFZCBUYW5vdXMgPGVkQHRhbm91
cy5uZXQ+DQo+ID4gPiBTZW50OiBTYXR1cmRheSwgRmVicnVhcnkgMTMsIDIwMjEgMTA6MTggQU0N
Cj4gPiA+IFRvOiBVZHVwYS5Bc2h3aW5pIElTViA8dWR1cGEuYXNod2luaUBpbnZlbnRlYy5jb20+
DQo+ID4gPiBDYzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQo+ID4gPiBTdWJqZWN0OiBSZTog
UmVkZmlzaCB2MS9TeXN0ZW1zL3N5c3RlbS9FdGhlcm5ldEludGVyZmFjZXMNCj4gPiA+DQo+ID4g
Pg0KPiA+ID4NCj4gPiA+DQo+ID4gPg0KPiA+ID4NCj4gPiA+DQo+ID4gPiBPbiBTYXQsIEZlYiAx
MywgMjAyMSBhdCAxMDoxMSBBTSBVZHVwYS5Bc2h3aW5pIElTViA8dWR1cGEuYXNod2luaUBpbnZl
bnRlYy5jb20+IHdyb3RlOg0KPiA+ID4NCj4gPiA+DQo+ID4gPg0KPiA+ID4gSGksDQo+ID4gPg0K
PiA+ID4NCj4gPiA+DQo+ID4gPiBJIGFtIG5ldyB0byBPcGVuQm1jIGFuZCBSZWRmaXNoLg0KPiA+
ID4NCj4gPiA+IEkgc2F3IGluIGJtY3dlYi9SZWRmaXNoLm1kLCB0aGF0IGJlbG93IFJlZGZpc2gg
aXMgdGFyZ2V0ZWQgZm9yIE9wZW5CbWM6DQo+ID4NCj4gPiBUaGlzIGRvYyBpcyByZWFsbHkgb2xk
LCBhbmQgd2FzIG9yaWdpbmFsbHkgd3JpdHRlbiBhcyBhbiBpbml0aWFsIHN0YWIgYXQgd2hhdCBp
bnRlcmZhY2VzIHdlIHNob3VsZCB3cml0ZS4gIFVuZm9ydHVuYXRlbHksIHdoZW4gaXQgZ290IGNv
bnZlcnRlZCBpbnRvIGEgImhlcmUncyB0aGUgaW50ZXJmYWNlcyB3ZSBzdXBwb3J0IHRvZGF5IiBk
b2MsIHRoYXQgcGF0aCBkaWRuJ3QgZ2V0IHNjcnViYmVkLiAgV2UgZG9uJ3QgaGF2ZSBhbiBpbXBs
ZW1lbnRhdGlvbiBvZiBpdCB0b2RheS4gIEkgY2FuIGdldCBhIHJldmlldyBvcGVuIHRvIHVwZGF0
ZSB0aGUgZG9jLg0KDQoNCkNhbiB5b3UgcGxlYXNlIG9wZW4gYSByZXZpZXcgdG8gdXBkYXRlIHRo
ZSBkb2M/IEl0IHJlYWxseSBoZWxwcyB0byBrbm93IHdoYXQgaXMgY3VycmVudGx5IGltcGxlbWVu
dGVkIGluIE9wZW5CbWMgYW5kIHdoYXQgaXMgbm90Lg0KDQo+ID4gPg0KPiA+ID4gL3JlZGZpc2gv
djEvU3lzdGVtcy9zeXN0ZW0vRXRoZXJuZXRJbnRlcmZhY2VzDQo+ID4gPg0KPiA+ID4NCj4gPiA+
DQo+ID4gPiBCdXQsIGluIHJlZGZpc2gtY29yZS9saWIvc3lzdGVtcy5ocHAsIEkgZG9u4oCZdCBz
ZWUgRXRoZXJuZXRJbnRlcmZhY2VzIGFuZCBJIGRvbuKAmXQgc2VlIGl0IG9uIG15IHNlcnZlciBS
ZWRmaXNoIHRvby4NCj4gPg0KPiA+IFRvZGF5LCB3ZSBkb24ndCBoYXZlIHRoaXMgaW1wbGVtZW50
ZWQgYmVjYXVzZSB3ZSBkb24ndCByZWFsbHkgaGF2ZSBhIHBhdGggdG8gZ2V0IHRoYXQgaW5mb3Jt
YXRpb24gZnJvbSB0aGUgaG9zdC4gIERvaW5nIHRoYXQgd291bGQgcmVxdWlyZSBlaXRoZXIgYW4g
aW4tYmFuZCBhcHBsaWNhdGlvbiBydW5uaW5nIG9uIHRoZSBtYWluIHByb2Nlc3NvciB0byBzZW5k
IG5ldyBpcCBhZGRyZXNzZXMgdG8gdGhlIGJtYywgb3IgYW4gTkNTSSwgTUNUUCwgb3IgUExETSBj
b25uZWN0aW9uIGRpcmVjdGx5IHRvIHRoZSBOSUMgdGhhdCBzdXBwb3J0ZWQgZ2V0dGluZyB0aGF0
IGxldmVsIG9mIGluZm9ybWF0aW9uLg0KPiA+IEJvdGggb2Ygd2hpY2ggbGlrZWx5IHJlcXVpcmUg
YSBuZXcgZGFlbW9uIHRvIGV4cG9zZSB0aG9zZSBBUElzIHRvIGRlYnVnLg0KPg0KPiBUaGFua3Mg
RWQuDQo+IFNvLCBvbmx5IHRob3NlIGltcGxlbWVudGVkIGluICJibWN3ZWIvcmVkZmlzaC1jb3Jl
L2xpYi8iICBhcmUgY3VycmVudGx5IGltcGxlbWVudGVkIGluIE9wZW5CTUMgUmVkZmlzaCByaWdo
dD8NCg0KQ29ycmVjdC4NCg0KPiBJIGRvbuKAmXQgc2VlIGJlbG93IGltcGxlbWVudGVkIHRvbzoN
Cj4gU3lzdGVtcy9zeXN0ZW0vQm9vdE9wdGlvbnMNCg0KSSB0aG91Z2h0IHRoZXJlIHdlcmUgcGF0
Y2hlcyBpbiByZXZpZXcgdG8gYWRkIHRoaXMsIHlvdSBtaWdodCB0cnkgY2hlY2tpbmcgZ2Vycml0
Lg0KDQo+IFBsZWFzZSBjb25maXJtLg0KPg0KPiBCdXQsIGFyZSB0aGVzZSBpbXBsZW1lbnRlZD8N
Cj4gMS4gU3lzdGVtcy9zeXN0ZW0vTmV0d29ya0ludGVyZmFjZXMNCk5vLg0KDQo+IDIuIFN5c3Rl
bXMvc3lzdGVtL1BDSWVGdW5jdGlvbnMNClllcywgYnV0IHRoZSBvbmx5IHRoaW5nIHRoYXQgcHVi
bGlzaGVzIGRhdGEgb2YgdGhhdCB0eXBlIHRoYXQgSSBrbm93IG9mIGlzIHBlY2ktcGNpZS4gIElm
IHRoYXQgZG9lc24ndCB3b3JrIGZvciB5b3UsIHlvdSdsbCBsaWtlbHkgbmVlZCB0byBpbXBsZW1l
bnQgdGhlIGFwcHJvcHJpYXRlIGRidXMgaW50ZXJmYWNlcyBmb3IgeW91ciBzeXN0ZW0uDQoNCj4g
SWYgc28sIHdoYXQgY2hhbmdlcyBhcmUgbmVlZGVkIHRvIG1ha2UgdGhlc2Ugd29ya2luZz8NCj4N
Cj4NCj4gPiBXZSBkbyBoYXZlIC9yZWRmaXNoL3YxL1N5c3RlbXMvaHlwZXJ2aXNvci9FdGhlcm5l
dEludGVyZmFjZXMgdG9kYXkuDQo+ID4gV2UnZCBpZGVhbGx5IHdhbnQgdG8gZm9sbG93IHZlcnkg
Y2xvc2VseSB0byB3aGF0IHRoYXQgZG9lcywgZXhwb3NlIGEgbmV3IHBhdGggb24gREJ1cyB0aGF0
IGltcGxlbWVudHMgdGhlIHh5ei5vcGVuYm1jX3Byb2plY3QuTmV0d29yay5FdGhlcm5ldEludGVy
ZmFjZSBpbnRlcmZhY2UsIGFuZCBncmFiIHRoZSBkYXRhIGZyb20gaXQuDQo+ID4NCj4gPiA+DQo+
ID4gPg0KPiA+ID4NCj4gPiA+IFdoYXQgdXBzdHJlYW0gc3lzdGVtIGFyZSB5b3UgdHJ5aW5nIHRo
aXMgb24/ICBJZiB5b3VyIHBsYXRmb3JtIGlzbuKAmXQgdXBzdHJlYW0sIGNhbiB5b3UgcG9pbnQg
YXQgdGhlIGNvZGUgcmV2aWV3IHdoZXJlIHlvdeKAmXJlIGFkZGluZyBpdD8NCj4gPiA+DQo+ID4g
Pg0KPiA+ID4NCj4gPiA+IElmIHlvdSBkb27igJl0IGhhdmUgZWl0aGVyLCB0YWtlIG5vdGUgdGhh
dCBpdOKAmXMgcmVhbGx5IGRpZmZpY3VsdCB0byBoZWxwIGRlYnVnIG9yIG1ha2Ugc3VnZ2VzdGlv
bnMgZm9yIHBsYXRmb3JtcyB0aGF0IHdlIGNhbuKAmXQgc2VlIHRoZSBjb2RlIGZvci4NCj4gPiA+
DQo+ID4gPg0KPiA+ID4NCj4gPiA+IEl0cyBvbmx5IHByZXNlbnQgaW4gTWFuYWdlcnMvYm1jL0V0
aGVybmV0SW50ZXJmYWNlcy4NCj4gPiA+DQo+ID4gPg0KPiA+ID4NCj4gPiA+IEhvdyBkbyBJIGFk
ZCBTeXN0ZW1zL3N5c3RlbS9FdGhlcm5ldEludGVyZmFjZXMgUmVkZmlzaCBzdXBwb3J0PyBXaGF0
IGNoYW5nZXMgZG8gSSBuZWVkIHRvIG1ha2U/DQo+ID4gPg0KPiA+ID4NCj4gPiA+DQo+ID4gPiBS
ZWdhcmRzLA0KPiA+ID4NCj4gPiA+IEFzaHdpbmkNCj4gPiA+DQo+ID4gPg0KPiA+ID4NCj4gPiA+
IC0tDQo+ID4gPg0KPiA+ID4gLUVkDQo=
