Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADED2FCDCB
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 11:19:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLM303KpvzDqvj
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 21:19:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.112;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=dylan_hung@aspeedtech.com; receiver=<UNKNOWN>)
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320112.outbound.protection.outlook.com [40.107.132.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLM255xsFzDqsN
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2021 21:19:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bDaH1MtyXKHT23TBuxzuJerZJHFNNcWedpEKFaakTK9+o26srmLB2sf0cEI5AGrIU/qgBCBGeabl5bN4FJ9YrhnVrJOiKdm6f5zKu+5J0XdOyqBfk1EsFRzPfGoyDmkkbnXjdYP9nzRyy2awAyE4Y0lPIffKjKi5uiTjQAC4Up2p1Sex3nlF0KqBhSiayLG/2uBv1h1PtndVlA+u2uvWWxJ6eS0W3SobUA1zWZhCM8dlGtuIBtosVkA7bDu64utYEckw6gnr7Yt+tzYWEvlH+3cNgnoBXcHtUNFHnGN3pAiRR1zPPEg9zuuuMoLi6ROVTfO8swLReRkJRfcA3VpO1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6t7Fz0cHG/2+9S/A/X0BH8LcaZogJ/bJmMB5FGLxUEY=;
 b=dL43syfYGuPBPAF+EyV82k5ocA4oBxKJG5L8qADot4JvTesW2zARnFxapFqd+bJgfhe4hWemjYKZxesH7MiYe1YzSWLLiV57rUWPCOmPSDAC+1IRb2NLjOeKEkuXk0edKm18oxPo/hJvkVG8O69F1DG9mv21Lw/YL+rRUKOlJIcpxej7/1DAmU647cF14M1ZhfGrF2l1TWuzYb2HcmaxLD2unaTSWXi7uJwDtKGp/ShMJ3MGCv/CMRoZgMOlYAU0KumjbtIDsoleK9hU0dKl954XGzvn0ll/espZWIIpCxsL/UlpA7XtcKet3Lee98vSCtVKjufoyETqKlJ/oR0+Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from HK0PR06MB2834.apcprd06.prod.outlook.com (2603:1096:203:5c::20)
 by HK0PR06MB2836.apcprd06.prod.outlook.com (2603:1096:203:5d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Wed, 20 Jan
 2021 10:18:51 +0000
Received: from HK0PR06MB2834.apcprd06.prod.outlook.com
 ([fe80::9899:8ffc:f4ba:d27a]) by HK0PR06MB2834.apcprd06.prod.outlook.com
 ([fe80::9899:8ffc:f4ba:d27a%6]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 10:18:51 +0000
From: Dylan Hung <dylan_hung@aspeedtech.com>
To: Mohammed.Habeeb ISV <mohammed.habeeb@inventec.com>, Joel Stanley
 <joel@jms.id.au>
Subject: RE: Regarding eth0 (ftgmac100): transmit queue 0 timed out
Thread-Topic: Regarding eth0 (ftgmac100): transmit queue 0 timed out
Thread-Index: AdbpEdaHpYSz7LXNTyeSXhPDaKGwTgBv41sAAMAsVJAAULPfwA==
Date: Wed, 20 Jan 2021 10:18:51 +0000
Message-ID: <HK0PR06MB2834478B80181FF27D619EF99CA20@HK0PR06MB2834.apcprd06.prod.outlook.com>
References: <PS2PR02MB3541276EFDDDD18BDAA34A2D90AA0@PS2PR02MB3541.apcprd02.prod.outlook.com>
 <CACPK8XdeUy82d10a9OTu_SPp_Mmr4413SHAEEe4t-D2Mzu9gZg@mail.gmail.com>
 <PS2PR02MB354148796874D72BBE0CB97890A40@PS2PR02MB3541.apcprd02.prod.outlook.com>
In-Reply-To: <PS2PR02MB354148796874D72BBE0CB97890A40@PS2PR02MB3541.apcprd02.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: inventec.com; dkim=none (message not signed)
 header.d=none;inventec.com; dmarc=none action=none
 header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7653833e-a7bf-4697-cfb5-08d8bd2cc895
x-ms-traffictypediagnostic: HK0PR06MB2836:
x-microsoft-antispam-prvs: <HK0PR06MB2836E137129A594DBD5D81139CA20@HK0PR06MB2836.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: koRQ6gcopL+G7h6HFiBD/GMHTuwtn+0SCZ5BHbLNOA87RdlG1yIJOmZASNx4Xc5gEarkCXhziP55ixbVKnx5JrQZW8DJX/IoqQKNcMmfo+F4pU3T5kOt4rQk/xwUXOaknEYd3RJ5vIMN8lsH+fCBJaZ0zYvjPY7Kt7HEkUMCGaj87TN80hxQl6EMeze7gVIAAhszEJO9tijeVX/JCjSPjCxUm+crny0MYBIPYpn5z3/rbHwjbfg25Vdb03Wu/rFVGwwvh1dbo5+SPR7Uz3yuPT2MMNIP6kx41PcV8VGLzy7cjKp7gZXhgC0z/Mjt1l/CttIHhl4T8MqP23lcgqsPO0oC71/n34lmiDmxpdbX9IRFWJgx29qlXDsGsHBednmw9cPJnnSyV5BD/l6maW5bgGncVzDC4kz/vNahqqVGJV4dboywfGY3D7UMqpyazlAGtX4a+OdQe8jKfFu1mhJ22Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB2834.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(136003)(346002)(39850400004)(396003)(8676002)(52536014)(66476007)(186003)(7696005)(2906002)(966005)(478600001)(110136005)(8936002)(316002)(55236004)(5660300002)(66446008)(26005)(71200400001)(53546011)(6506007)(66556008)(9686003)(64756008)(33656002)(55016002)(4326008)(76116006)(83380400001)(86362001)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZnA0SnBOLzBGc3dFRkh0RnB1RkhNSmFIWndSTlZFeG5BZEpYTXIvVDhiMUhB?=
 =?utf-8?B?amZpUHJZL0pIWmtJYjEybzFacVlmL2RUc24vb1Y0OEU1ZDZJTGJtcHhIZ3c5?=
 =?utf-8?B?RlFJMFBmdFBtRWQxZnVsQkRLQXFUNVl4RjYyNlVuNitUejZ5VGo1ak1PT05U?=
 =?utf-8?B?dXZFT0hGOHlKQkNMWkViUkZrblBqUHFMQVl0OTZqemFvMjdsdmgrUUlVNm0w?=
 =?utf-8?B?RVhBUG9ZRlR5ZUE0WWpUWlhVcVZZQUw5bWxsejlvUmdtWEtTVDR6dmYvQjhx?=
 =?utf-8?B?RjRQcW9ScXZWNUs5QUE5RDcvVFhlQyswbFIvWkt3YWFMZFFDR1pCbmIvT0Fx?=
 =?utf-8?B?bytudWFINGp5aXI5UnM0MFFHMDVxNjBpdThnRGZYRFpyVUN4UUpjRW9kcTlU?=
 =?utf-8?B?OGRWa3QrMkgvSUhLdUF1d2JYc3Fza29MOHlIMnNueWlhUHZjWXpnN0dPMEtT?=
 =?utf-8?B?S3ZDTTRlTzhlUTVjZElWcUpDOTRQdFV5VEUxb2xzYnhJbmZpMzdURXF0MmEr?=
 =?utf-8?B?OXc3V2JCc1VIaXdYaWwvcU5xWDhPZFZob1hZM1VEa2xscmlXYjJycGVTT2J2?=
 =?utf-8?B?R0FmSjl6T3orSGdMVmloREk3U20xc1ZDL3JzRUFINjJzV1JacExzeFhaMXNZ?=
 =?utf-8?B?eW0ySGtuUmhnRzdCRUYvQXE0UUViMU00d2RUTVBJVjJyaHA0RXdZK1U3bEM3?=
 =?utf-8?B?V2RPM0JTb3dkUDcyRE04TzlUSlhBWnJkaXRYWjBSMkI5bXpHTmNNUUEvNVBG?=
 =?utf-8?B?QXRpb2pWeE1ma1ErSFE0Q2kxV0JuSDBYY3d0Nk5jNzdEVlVDaDFxTjhSeWJJ?=
 =?utf-8?B?OGtvV3NYZjdZdG53SE44cmhJYUxHRmozQ21qUWtEdmYyRTlQdzhyWGp0MHY4?=
 =?utf-8?B?ckNYcDhDR3RncVdkSm9lN0QzSFAvR00xREg0VWk5MkNjTldrWGdZeWdsUUUv?=
 =?utf-8?B?Zml2WlJ5ekJDOHAxd1dvU0ZhaE1IMXVMcGw3WDcwWkZueS95d0o3RGpuUCta?=
 =?utf-8?B?ODVrWjQzY25xTkY2NFdzZXVIU3QxYTVZZGZ2d2ZQK0ZXVlB1Um1TYnBWR216?=
 =?utf-8?B?T05MOTFRSUdoSCtnenFJbTY2WkE5R3NwUmJqOFZHTXBZSTI4WE1uc3FaRFV4?=
 =?utf-8?B?RGZnNmVNd1lUck11eVhqQkRackVHOHJiUXVmNjNFWEVaTzFYMUNxS0t6VFJl?=
 =?utf-8?B?UlZnY3EyMDVoVEdqZXI4eTc5cVp2QWxvd0g1MFBUYTFuOFpxRjVnTlhDQzhL?=
 =?utf-8?B?eGorVVg1c0NLZFRSaEE1UXl2RG9Xayt1d3lpSEFZYWtnSWxRNHU0MXE2QWtY?=
 =?utf-8?Q?DCbLCXBNKqhlY=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB2834.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7653833e-a7bf-4697-cfb5-08d8bd2cc895
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2021 10:18:51.3277 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hayjMhRJgiiwBVYwV5YL7mUFF6o6sQonovLqIlqSU4qldnZAI0OdE6zUvaKfl3vKiq1t/On1JBJIVWBauKNGj35yOijNw1EFR9JhvmK74SE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2836
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

SGkgTW9oYW1tZWQsDQoNCkJlZm9yZSB0aGlzIGJhY2t0cmFjZSBzaG93ZWQgdXAsIGlzIHRoZXJl
IGFueXRoaW5nIHlvdSd2ZSBkb25lPyBFLmcuIGdldHRpbmcgSVAgdmlhIERIQ1AsIG9yIHBpbmcg
c29tZSBhZGRyZXNzZXM/DQoNCi0tDQpEeWxhbg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+IEZyb206IG9wZW5ibWMNCj4gW21haWx0bzpvcGVuYm1jLWJvdW5jZXMrZHlsYW5faHVu
Zz1hc3BlZWR0ZWNoLmNvbUBsaXN0cy5vemxhYnMub3JnXSBPbg0KPiBCZWhhbGYgT2YgTW9oYW1t
ZWQuSGFiZWViIElTVg0KPiBTZW50OiAyMDIx5bm0MeaciDE55pelIDQ6MDkgQU0NCj4gVG86IEpv
ZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+DQo+IENjOiBvcGVuYm1jQGxpc3RzLm96bGFicy5v
cmcNCj4gU3ViamVjdDogUkU6IFJlZ2FyZGluZyBldGgwIChmdGdtYWMxMDApOiB0cmFuc21pdCBx
dWV1ZSAwIHRpbWVkIG91dA0KPiANCj4gDQo+IA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiBGcm9tOiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1Pg0KPiBTZW50OiBUaHVyc2Rh
eSwgSmFudWFyeSAxNCwgMjAyMSA0OjAwIFBNDQo+IFRvOiBNb2hhbW1lZC5IYWJlZWIgSVNWIDxt
b2hhbW1lZC5oYWJlZWJAaW52ZW50ZWMuY29tPg0KPiBDYzogb3BlbmJtY0BsaXN0cy5vemxhYnMu
b3JnDQo+IFN1YmplY3Q6IFJlOiBSZWdhcmRpbmcgZXRoMCAoZnRnbWFjMTAwKTogdHJhbnNtaXQg
cXVldWUgMCB0aW1lZCBvdXQNCj4gDQo+IE9uIFRodSwgMTQgSmFuIDIwMjEgYXQgMjM6NDgsIE1v
aGFtbWVkLkhhYmVlYiBJU1YNCj4gPG1vaGFtbWVkLmhhYmVlYkBpbnZlbnRlYy5jb20+IHdyb3Rl
Og0KPiA+DQo+ID4gSGkgQWxsLA0KPiA+DQo+ID4NCj4gPg0KPiA+IFdlIHNlZSBiZWxvdyBiYWNr
dHJhY2Ugb24gb3VyIHJ1bkJtYyBib2FyZC4gQW5kIG5ldHdvcmtpbmcgZG9lcyBub3QNCj4gd29y
ayBvbiBldGgwLg0KPiA+DQo+ID4gTm8gREhDUCBhbmQgc3RhdGljIElQIGFkZHJlc3MgY2FuIHdv
cmsuIFBpbmdzIGFuZCBBUlAgZmFpbHMsIG5vIHBhY2tldHMNCj4gcmVjZWl2ZWQgc2VlbiBydW5u
aW5nIHRjcGR1bXAuDQo+ID4NCj4gPiBVc2luZyAyLjcgdmVyc2lvbiBvZiBvcGVuQm1jLiBQbGVh
c2UgbGV0IG1lIGtub3cgaWYgdGhlcmUgaXMgYSBrbm93biBmaXggb3INCj4gcGF0Y2ggZm9yIHRo
aXMuDQo+ID4NCj4gPg0KPiA+DQo+ID4gdHJhbnNmb3JtZXJzOn4jIFsgIDE1OC4wODIyNTFdIC0t
LS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQ0KPiA+DQo+ID4gWyAgMTU4LjA4NzQ0
Ml0gV0FSTklORzogQ1BVOiAxIFBJRDogMCBhdCBuZXQvc2NoZWQvc2NoX2dlbmVyaWMuYzo0NDcN
Cj4gPiBkZXZfd2F0Y2hkb2crMHgyZDQvMHgyZjgNCj4gPg0KPiA+IFsgIDE1OC4wOTY2ODFdIE5F
VERFViBXQVRDSERPRzogZXRoMCAoZnRnbWFjMTAwKTogdHJhbnNtaXQgcXVldWUgMA0KPiA+IHRp
bWVkIG91dA0KPiA+DQo+ID4gWyAgMTU4LjEwNDI3OV0gQ1BVOiAxIFBJRDogMCBDb21tOiBzd2Fw
cGVyLzEgTm90IHRhaW50ZWQNCj4gPiA1LjQuOC02NzFmNjIyLWRpcnR5LWY1ODQ1ZmQgIzENCj4g
DQo+IFRoaXMgaXMgYSBzeW1wdG9tIG9mIG5ldHdvcmtpbmcgbm90IHdvcmtpbmc7IHRoZXJlJ3Mg
bWFueSBwb3NzaWJsZSByb290DQo+IGNhdXNlcy4NCj4gDQo+IElzIHRoaXMgYW4gYXN0MjUwMD8N
Cj4gLUl0IGlzIGFuIGFzdDI2MDAuDQo+IA0KPiBGcm9tIHlvdXIgbG9nLCBpdCBhcHBlYXJzIHlv
dSdyZSB1c2luZyBhIDUuNCBrZXJuZWw6DQo+IA0KPiBbICAxNTguMTA0Mjc5XSBDUFU6IDEgUElE
OiAwIENvbW06IHN3YXBwZXIvMSBOb3QgdGFpbnRlZA0KPiA1LjQuOC02NzFmNjIyLWRpcnR5LWY1
ODQ1ZmQgIzENCj4gDQo+IFRoaXMgaXMgbm90IG1haW50YWluZWQgYnkgYW55b25lLCBhbmQgaXMg
cHJvYmFibHkgbWlzc2luZyBwYXRjaGVzLiBJdCB3b3VsZCBiZQ0KPiBiZXN0IGlmIHlvdSBtb3Zl
ZCB0byB0aGUgbGF0ZXN0IG9wZW5ibWMga2VybmVsIHRyZWUsIGJ1dCBpZiB5b3UgY2FuJ3QgZG8g
dGhhdA0KPiB0aGVuIGxvb2sgYXQgdGhlIGhpc3Rvcnkgb2YgdGhlIGV0aGVybmV0IGRyaXZlciBp
bg0KPiBkZXYtNS44IGFuZCBzZWUgd2hpY2ggcGF0Y2hlcyB5b3UncmUgbWlzc2luZzoNCj4gDQo+
ICQgZ2l0IGxvZyAtLW5vLW1lcmdlcyAtLW9uZWxpbmUgdjUuNC4uLmRldi01LjgNCj4gZHJpdmVy
cy9uZXQvZXRoZXJuZXQvZmFyYWRheS9mdGdtYWMxMDAuKg0KPiA5ZjU1ZDc4MjViOTYgbmV0OiBm
dGdtYWMxMDA6IEVuc3VyZSB0eCBkZXNjcmlwdG9yIHVwZGF0ZXMgYXJlIHZpc2libGUNCj4gOGRl
MDE0MWMyNTI0IG5ldDogZnRnbWFjMTAwOiBGaXggQXNwZWVkIGFzdDI2MDAgVFggaGFuZyBpc3N1
ZQ0KPiBlNmI0NWVlNzkwZWMgbmV0L2ZhcmFkYXk6IGZpeCBncmFtbWFyIGluIGZ1bmN0aW9uDQo+
IGZ0Z21hYzEwMF9zZXR1cF9jbGsoKSBpbiBmdGdtYWMxMDAuYw0KPiA4NmVlYjk3ZGU3MTAgZnRn
bWFjMTAwOiBSZW1vdmUgcmVkdW5kYW50IGp1ZGdlbWVudA0KPiBkNTYwYjczM2VkNTMgbmV0L2Zh
cmFkYXk6IERlbGV0ZSBkcml2ZXIgdmVyc2lvbiBmcm9tIHRoZSBkcml2ZXJzDQo+IGYxMjk0NjE3
ZDJmMyBuZXQ6IGNvbnZlcnQgc3VpdGFibGUgbmV0d29yayBkcml2ZXJzIHRvIHVzZSBwaHlfZG9f
aW9jdGwNCj4gMDI5MGJkMjkxY2MwIG5ldGRldjogcGFzcyB0aGUgc3R1Y2sgcXVldWUgdG8gdGhl
IHRpbWVvdXQgaGFuZGxlcg0KPiAwYzY1YjJiOTBkMTMgbmV0OiBvZl9nZXRfcGh5X21vZGU6IENo
YW5nZSBBUEkgdG8gc29sdmUgaW50L3VuaXQgd2FybmluZ3MNCj4gOWJjZTRiMjdmM2VjIG5ldDog
ZnRnbWFjMTAwOiBVbmdhdGUgUkNMSyBmb3IgUk1JSSBvbiBBU1BFRUQgTUFDcw0KPiAwYWM2MjRm
NDdkZDMgZG9jczogZml4IHNvbWUgYnJva2VuIHJlZmVyZW5jZXMNCj4gDQo+IFRoZSB0b3AgdHdv
IHBhdGNoZXMgIm5ldDogZnRnbWFjMTAwOiBFbnN1cmUgdHggZGVzY3JpcHRvciB1cGRhdGVzIGFy
ZSB2aXNpYmxlIg0KPiBhbmQgIm5ldDogZnRnbWFjMTAwOiBGaXggQXNwZWVkIGFzdDI2MDAgVFgg
aGFuZyBpc3N1ZSIgYXJlDQo+IGFzdDI2MDAgc3BlY2lmaWMuDQo+IA0KPiAtQXBwbGllZCBhbGwg
dGhlc2UgcGF0Y2hlcyB0byBzeW5jIGRyaXZlcnMvbmV0L2V0aGVybmV0L2ZhcmFkYXkvKiB3aXRo
IGxhdGVzdA0KPiBkZXYtNS44LCBzdGlsbCBJIHNlZSB0aGUgYmFja3RyYWNlLg0KPiA+DQo+ID4N
Cj4gPg0KPiA+IEZldyBpc3N1ZXMgd2VyZSByZXBvcnRlZCBidXQgbm8gcmVzb2x1dGlvbi4NCj4g
Pg0KPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL29wZW5ibWMvaXNzdWVzLzMxOTINCj4g
Pg0KPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL29wZW5ibWMvaXNzdWVzLzIyMjgNCj4g
DQo+IFRoZXNlIHR3byBpc3N1ZXMgd2VyZSBzcGVjaWZpYyB0byB0aGUgYnJvYWRjb20gbmV0d29y
ayBkZXZpY2UgdXNlZCBvbiB0aGF0DQo+IHBsYXRmb3JtLiBJIGRvdWJ0IHRoZXkgcmVsYXRlIHRv
IHlvdXIgaXNzdWUuDQo+IA0KPiA+DQo+ID4NCj4gPg0KPiA+IFRyaWVkIGJlbG93IHBhdGNoICwg
c2VlbXMgZG9lcyBub3Qgd29yay4NCj4gPg0KPiA+IGh0dHA6Ly9sa21sLml1LmVkdS9oeXBlcm1h
aWwvbGludXgva2VybmVsLzIwMTAuMS8wNTk1Ny5odG1sDQo+ID4NCj4gPg0KPiA+DQo+ID4gRllJ
IC4uV2UgdHJpZWQgb3BlbkJtYyAyLjkgdmVyc2lvbi4gSXQgY2FuIHdvcmsgZmluZS4NCj4gPg0K
PiA+DQo+ID4NCj4gPiBBdHRhY2hlZCBpcyB0aGUgY29tcGxldGUgYmFja3RyYWNlLg0KPiA+DQo+
ID4NCj4gPg0KPiA+IFRoYW5rcw0KPiA+DQo+ID4NCg==
