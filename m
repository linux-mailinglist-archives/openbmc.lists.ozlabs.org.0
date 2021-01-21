Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6B62FDE68
	for <lists+openbmc@lfdr.de>; Thu, 21 Jan 2021 02:04:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLkgJ0fCbzDqRB
	for <lists+openbmc@lfdr.de>; Thu, 21 Jan 2021 12:04:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inventec.com (client-ip=40.107.129.114;
 helo=kor01-sl2-obe.outbound.protection.outlook.com;
 envelope-from=mohammed.habeeb@inventec.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=InventecCorp.onmicrosoft.com
 header.i=@InventecCorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-InventecCorp-onmicrosoft-com header.b=j3kb8Mnm; 
 dkim-atps=neutral
Received: from KOR01-SL2-obe.outbound.protection.outlook.com
 (mail-eopbgr1290114.outbound.protection.outlook.com [40.107.129.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLkfG6LdFzDqHJ
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2021 12:03:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E65s8eHuZYeS/GyLTJpD0OmGGaw/ID13ku62zdXapMGC2tjrV0XxyIg4+1gRjq2JVC1FolPtAthOhEj9/1amIgTHuVfxt5F+2FbiAvzXfSuCSPDpx5aL0hHvkpTaR20cXuZJvNOlUWpmCJ2FqXaYMwT+XdOpoNnpMPv4zGouylXyZ+7KSMwI5KPLRlXbeU5ohlZfVizgZ65PIRzyXMPONdFvFQnGz0B1v4QzAxPqYW7hF2Vj4D6r1zg5XdBfwaCsC1rEXMz/x20Xyhfx3o8coXsHhQgYigI5BdfF19W8Te7+cC9/G+AcOR/aCdeATwYwvuMuGerhhHoNPm/Qdw+jcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lST+ORGuvYPiz6VxY0aDUeXkLRLZ0n7EJWPK57hH38w=;
 b=AumgIMR0VGgUio2ih1g9EYpgIY3vGVlIK340zIS7joL6brvBWBMfcBwQjOOrl9nVAyR/fyFfVs8PMC/FEUVwK3LWMB1IIWL8pcSkofrZ6dxED4tZypYeZ7bt0KYoTrNwI51yEAh7JZUZ0XHA0wErR1geMQrMvrsRHcEpA/TgrqUgldvQZFJSzPdwFbFD5oLwa3+TmdPXM+MbSzO1ZXY8PnDcuQU1IAFvMFVq/Njrs1Joetx7EiDsKbdFcpg5eK1qiyXbELdo5UaWtJea6YGnxi6GqDCKfT+cYVgrLKXp/WW8jO6aCdHYaiBCkocFGLiRtGkSeJ2JvK7gNhqRkSoLHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inventec.com; dmarc=pass action=none header.from=inventec.com;
 dkim=pass header.d=inventec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=InventecCorp.onmicrosoft.com; s=selector2-InventecCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lST+ORGuvYPiz6VxY0aDUeXkLRLZ0n7EJWPK57hH38w=;
 b=j3kb8MnmtWzRs+UTwXr6XdOT3sC/5tVGBvbQuvqIK4AwpYoniBZAqQOm/9sUuMdugDOTH3L4UapM3iteC494HqVeHyjQ+X4mwspuWvf5hD4Rt0dqZfWqj7y68EcPRekgL8xShumyWHiP3g7o1Ja1KJXjMR9ixu29PPNlGjOoMKc=
Received: from PS2PR02MB3541.apcprd02.prod.outlook.com (2603:1096:300:48::10)
 by PS2PR02MB4103.apcprd02.prod.outlook.com (2603:1096:300:60::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 21 Jan
 2021 01:03:10 +0000
Received: from PS2PR02MB3541.apcprd02.prod.outlook.com
 ([fe80::4cc2:cac1:a003:53f4]) by PS2PR02MB3541.apcprd02.prod.outlook.com
 ([fe80::4cc2:cac1:a003:53f4%6]) with mapi id 15.20.3784.013; Thu, 21 Jan 2021
 01:03:09 +0000
From: Mohammed.Habeeb ISV <mohammed.habeeb@inventec.com>
To: Dylan Hung <dylan_hung@aspeedtech.com>, Joel Stanley <joel@jms.id.au>
Subject: RE: Regarding eth0 (ftgmac100): transmit queue 0 timed out
Thread-Topic: Regarding eth0 (ftgmac100): transmit queue 0 timed out
Thread-Index: AdbpEdaHpYSz7LXNTyeSXhPDaKGwTgBv41sAAMAsVJAAULPfwAAe+Hvw
Date: Thu, 21 Jan 2021 01:03:09 +0000
Message-ID: <PS2PR02MB3541FA1B87791A935B085C8E90A10@PS2PR02MB3541.apcprd02.prod.outlook.com>
References: <PS2PR02MB3541276EFDDDD18BDAA34A2D90AA0@PS2PR02MB3541.apcprd02.prod.outlook.com>
 <CACPK8XdeUy82d10a9OTu_SPp_Mmr4413SHAEEe4t-D2Mzu9gZg@mail.gmail.com>
 <PS2PR02MB354148796874D72BBE0CB97890A40@PS2PR02MB3541.apcprd02.prod.outlook.com>
 <HK0PR06MB2834478B80181FF27D619EF99CA20@HK0PR06MB2834.apcprd06.prod.outlook.com>
In-Reply-To: <HK0PR06MB2834478B80181FF27D619EF99CA20@HK0PR06MB2834.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aspeedtech.com; dkim=none (message not signed)
 header.d=none;aspeedtech.com; dmarc=none action=none
 header.from=inventec.com;
x-originating-ip: [2601:647:5b80:8dd0:300b:d2f0:198c:2a56]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bc16d251-da56-4bb9-f8a6-08d8bda851da
x-ms-traffictypediagnostic: PS2PR02MB4103:
x-microsoft-antispam-prvs: <PS2PR02MB41030C33D4D02DADB3771B1490A10@PS2PR02MB4103.apcprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WYpL2EfWSUy6pq3WHZDbsqzzMB7WjArOh6q7sel5cTa57sb4gIXxp6wP/WAAgE4K+ovifQFLv+cb/8tm7p+S/ovH/0DTYSlUA2qkT8oeriszptHpF2oxpF6PBhXLQRHOHNB+5a7bHEHbjurd3KNXw/I3QsFNhGpldoBXUqpTlvfUn0HF9x4bBc3ClXnIK1vf9zHtRBy9s8mO37/Cf9RyvMGObrZtzy+CQvGzBm1C7ZiFtKLLPyU3c5M4bsMIpCb+htHpKPUT533ek7PUFaD9nOGIvf4BiFhCfON+HQuOrxm6OmgPmg6xNY34Mb8pZSN8rI4979RKVpdSFsSOr/U+Yz2GyW4bYmLGAhPLcxT0eJB8xvoctWnQoYNP/efMkVSBnxjWWaustmZ7pnLMtLM9umpKQOshb292685BnL1yT0DsI6wl6wh2U/jBpLOLIEOfvdJ6/bA7C22aQdpPIYJNuw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PS2PR02MB3541.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(71200400001)(8676002)(7696005)(9686003)(110136005)(966005)(478600001)(316002)(66946007)(66476007)(8936002)(6506007)(4326008)(55016002)(86362001)(53546011)(83380400001)(33656002)(52536014)(5660300002)(66446008)(76116006)(64756008)(2906002)(186003)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?WUY4dS9tcktBTTZBN1BlWFBoV3NWaFFxMjJRWVJpUWg5OFZhVXpKSnpVcllz?=
 =?utf-8?B?WXVhbE1JbVdRRTNITXhOekQzRWxHNzQzS0haUEJzM1FvZ09GNkNIbFhrRGFG?=
 =?utf-8?B?OWhDVFdKVG1US2UyV201OUI4eXhIRXgzaEk0SUo3MENEUkUzS1dUdFB4TVJn?=
 =?utf-8?B?dGRzeDYxUVBvc05wVmxzTTFlQUNucEJzYW9aYi9nWFJVSElUbE5Nb3hHYmtS?=
 =?utf-8?B?MFpNSlFLaC9FaDN6bCtkWjNKcThhOTA4cUNTRHNqWUExOCtpWUxFMmUxd014?=
 =?utf-8?B?cnQ2eThTYzVLMTJJeWRYZmk5bGJJYnBTUWxxTGlPSlJCSlZlYUJNcHVpeUQ5?=
 =?utf-8?B?MzljSnYwemNDYUdSd1VOeHoyaFcwOGxxQXl4bG9ZZ2UzSzZJc2orYjFOYUpZ?=
 =?utf-8?B?Q2dXVThxWVhZZFp0QTQzOVRqNk1QcDVkMk5PaFgyNkcrZ3hwdkJYdUtKcjYr?=
 =?utf-8?B?bEFCeFFZR3kzMndQeXEvdE9CcTZrUm1PQWhORnRsVjl6N0pMQmNUbnl0bmtK?=
 =?utf-8?B?alp6Q0s2Y0tMQUl3aUNjVFFaejExTCtHeWdPNU1VMGhVZmk4dGlXTEFZUGNn?=
 =?utf-8?B?MU1JdTNFbXY1UElaMDN0SHZjN2ZIT0c3ZW42SFhjc25jWlBjK2gvOHlCZTdJ?=
 =?utf-8?B?U2E3d3VqSmN2dkJEUEY0ckRyeWFFdkJhb1ZaZUF4RGV4ZFY3dTEyNnZ4TUpM?=
 =?utf-8?B?SmMvZWpmZnRZRXhCUVFNQnNMNkdST05iVFFNM0xKUEhqajk1MFFHUm9ERWJv?=
 =?utf-8?B?L2ZkSEljallXWVZraHZwZ3dpZ1JPeWM0K01PK3F4aDNOcWhsdHJQTlpQV2Y0?=
 =?utf-8?B?TFhuQVlaQWZmV1RGU1FXbExPV2poVnVRbVNOR2tlN2J0ejBaMVozdFUvQVpN?=
 =?utf-8?B?T1J1YXFOQlNISkh5MkZKQWNFR3RrY21ST0o2andzQ1k4V1hJcWJ6Z24rT1NN?=
 =?utf-8?B?azlzdWZtTStxM1h0eDNVYW9NOSt4dDdldmNIa2tDc0lSUmF3U2xNdnlQSHNq?=
 =?utf-8?B?MWxTZ0V3RFpRdVhiQXhENzJibVZQK214U0JBQ2ozMy9OVEtZV3liaC9ORnpm?=
 =?utf-8?B?ZU5kR2ZOcDV4ejJPNEhSSmJSekk0SFBMQkovcXVkekEycXR2cVlwaTBiQktI?=
 =?utf-8?B?Q21OdGxQaG5vVXRyWld1bjhiU0N0WWNQTjlMb1NrWXRvUnpGNmVYZ3VMbXBw?=
 =?utf-8?B?aDRybVJsaXBLT0xzT3V5RUlrQ2t0UGtsMTdtQWwyczJCQ0NiNXBNSkNVZjRs?=
 =?utf-8?B?Zk9DQ2owU3dsRFJzRkFTd2Q5TVlGajNZVlMzNVVlMG9jMW9YRll6UGtRVDFa?=
 =?utf-8?B?dmk5NFlWVjRsOGhMZ3NFdHUzMlNzcFRoMlo2eVNjdHk3Wlc4RmV0NnB4UDBL?=
 =?utf-8?Q?+BDXnaDQE0eTdHOkzSTJRlsdUMMxG92Y=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: inventec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS2PR02MB3541.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc16d251-da56-4bb9-f8a6-08d8bda851da
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2021 01:03:09.6306 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2ae41f0c-acca-40f1-9c63-49475ff38512
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wxWwBwc1l1iNcod4JtbRwTBV/rDfWw7FNlWhNiNYhGQSgu42N3U9LmV3RwPXIJYvzhm+Zwhrv7iOmv83U8cMkrBXcPN+A686BNoePwXvFtY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR02MB4103
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

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBEeWxhbiBIdW5nIDxkeWxhbl9o
dW5nQGFzcGVlZHRlY2guY29tPiANClNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSAyMCwgMjAyMSAy
OjE5IEFNDQpUbzogTW9oYW1tZWQuSGFiZWViIElTViA8bW9oYW1tZWQuaGFiZWViQGludmVudGVj
LmNvbT47IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+DQpDYzogb3BlbmJtY0BsaXN0cy5v
emxhYnMub3JnDQpTdWJqZWN0OiBSRTogUmVnYXJkaW5nIGV0aDAgKGZ0Z21hYzEwMCk6IHRyYW5z
bWl0IHF1ZXVlIDAgdGltZWQgb3V0DQoNCkhpIE1vaGFtbWVkLA0KDQpCZWZvcmUgdGhpcyBiYWNr
dHJhY2Ugc2hvd2VkIHVwLCBpcyB0aGVyZSBhbnl0aGluZyB5b3UndmUgZG9uZT8gRS5nLiBnZXR0
aW5nIElQIHZpYSBESENQLCBvciBwaW5nIHNvbWUgYWRkcmVzc2VzPw0KDQpIQj4gTm8gcGluZ3Mu
IERIQ1Agd2FzIGVuYWJsZWQgYnkgZGVmYXVsdCAuIEkgdHJpZWQgZGlzYWJsaW5nIERIQ1AgdG8g
Y2hlY2sgaWYgaXQgaXMgdGhlIHJlYXNvbiBmb3IgYmFja3RyYWNlLiBCdXQgc2FtZSByZXN1bHQg
aW4gYm90aCBjYXNlcy4NCi0tDQpEeWxhbg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IG9wZW5ibWMNCj4gW21haWx0bzpvcGVuYm1jLWJvdW5jZXMrZHlsYW5faHVuZz1h
c3BlZWR0ZWNoLmNvbUBsaXN0cy5vemxhYnMub3JnXSBPbiANCj4gQmVoYWxmIE9mIE1vaGFtbWVk
LkhhYmVlYiBJU1YNCj4gU2VudDogMjAyMeW5tDHmnIgxOeaXpSA0OjA5IEFNDQo+IFRvOiBKb2Vs
IFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1Pg0KPiBDYzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3Jn
DQo+IFN1YmplY3Q6IFJFOiBSZWdhcmRpbmcgZXRoMCAoZnRnbWFjMTAwKTogdHJhbnNtaXQgcXVl
dWUgMCB0aW1lZCBvdXQNCj4gDQo+IA0KPiANCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gRnJvbTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4NCj4gU2VudDogVGh1cnNkYXks
IEphbnVhcnkgMTQsIDIwMjEgNDowMCBQTQ0KPiBUbzogTW9oYW1tZWQuSGFiZWViIElTViA8bW9o
YW1tZWQuaGFiZWViQGludmVudGVjLmNvbT4NCj4gQ2M6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9y
Zw0KPiBTdWJqZWN0OiBSZTogUmVnYXJkaW5nIGV0aDAgKGZ0Z21hYzEwMCk6IHRyYW5zbWl0IHF1
ZXVlIDAgdGltZWQgb3V0DQo+IA0KPiBPbiBUaHUsIDE0IEphbiAyMDIxIGF0IDIzOjQ4LCBNb2hh
bW1lZC5IYWJlZWIgSVNWIA0KPiA8bW9oYW1tZWQuaGFiZWViQGludmVudGVjLmNvbT4gd3JvdGU6
DQo+ID4NCj4gPiBIaSBBbGwsDQo+ID4NCj4gPg0KPiA+DQo+ID4gV2Ugc2VlIGJlbG93IGJhY2t0
cmFjZSBvbiBvdXIgcnVuQm1jIGJvYXJkLiBBbmQgbmV0d29ya2luZyBkb2VzIG5vdA0KPiB3b3Jr
IG9uIGV0aDAuDQo+ID4NCj4gPiBObyBESENQIGFuZCBzdGF0aWMgSVAgYWRkcmVzcyBjYW4gd29y
ay4gUGluZ3MgYW5kIEFSUCBmYWlscywgbm8gDQo+ID4gcGFja2V0cw0KPiByZWNlaXZlZCBzZWVu
IHJ1bm5pbmcgdGNwZHVtcC4NCj4gPg0KPiA+IFVzaW5nIDIuNyB2ZXJzaW9uIG9mIG9wZW5CbWMu
IFBsZWFzZSBsZXQgbWUga25vdyBpZiB0aGVyZSBpcyBhIGtub3duIA0KPiA+IGZpeCBvcg0KPiBw
YXRjaCBmb3IgdGhpcy4NCj4gPg0KPiA+DQo+ID4NCj4gPiB0cmFuc2Zvcm1lcnM6fiMgWyAgMTU4
LjA4MjI1MV0gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tDQo+ID4NCj4gPiBb
ICAxNTguMDg3NDQyXSBXQVJOSU5HOiBDUFU6IDEgUElEOiAwIGF0IG5ldC9zY2hlZC9zY2hfZ2Vu
ZXJpYy5jOjQ0Nw0KPiA+IGRldl93YXRjaGRvZysweDJkNC8weDJmOA0KPiA+DQo+ID4gWyAgMTU4
LjA5NjY4MV0gTkVUREVWIFdBVENIRE9HOiBldGgwIChmdGdtYWMxMDApOiB0cmFuc21pdCBxdWV1
ZSAwIA0KPiA+IHRpbWVkIG91dA0KPiA+DQo+ID4gWyAgMTU4LjEwNDI3OV0gQ1BVOiAxIFBJRDog
MCBDb21tOiBzd2FwcGVyLzEgTm90IHRhaW50ZWQgDQo+ID4gNS40LjgtNjcxZjYyMi1kaXJ0eS1m
NTg0NWZkICMxDQo+IA0KPiBUaGlzIGlzIGEgc3ltcHRvbSBvZiBuZXR3b3JraW5nIG5vdCB3b3Jr
aW5nOyB0aGVyZSdzIG1hbnkgcG9zc2libGUgDQo+IHJvb3QgY2F1c2VzLg0KPiANCj4gSXMgdGhp
cyBhbiBhc3QyNTAwPw0KPiAtSXQgaXMgYW4gYXN0MjYwMC4NCj4gDQo+IEZyb20geW91ciBsb2cs
IGl0IGFwcGVhcnMgeW91J3JlIHVzaW5nIGEgNS40IGtlcm5lbDoNCj4gDQo+IFsgIDE1OC4xMDQy
NzldIENQVTogMSBQSUQ6IDAgQ29tbTogc3dhcHBlci8xIE5vdCB0YWludGVkIA0KPiA1LjQuOC02
NzFmNjIyLWRpcnR5LWY1ODQ1ZmQgIzENCj4gDQo+IFRoaXMgaXMgbm90IG1haW50YWluZWQgYnkg
YW55b25lLCBhbmQgaXMgcHJvYmFibHkgbWlzc2luZyBwYXRjaGVzLiBJdCANCj4gd291bGQgYmUg
YmVzdCBpZiB5b3UgbW92ZWQgdG8gdGhlIGxhdGVzdCBvcGVuYm1jIGtlcm5lbCB0cmVlLCBidXQg
aWYgDQo+IHlvdSBjYW4ndCBkbyB0aGF0IHRoZW4gbG9vayBhdCB0aGUgaGlzdG9yeSBvZiB0aGUg
ZXRoZXJuZXQgZHJpdmVyIGluDQo+IGRldi01LjggYW5kIHNlZSB3aGljaCBwYXRjaGVzIHlvdSdy
ZSBtaXNzaW5nOg0KPiANCj4gJCBnaXQgbG9nIC0tbm8tbWVyZ2VzIC0tb25lbGluZSB2NS40Li4u
ZGV2LTUuOA0KPiBkcml2ZXJzL25ldC9ldGhlcm5ldC9mYXJhZGF5L2Z0Z21hYzEwMC4qDQo+IDlm
NTVkNzgyNWI5NiBuZXQ6IGZ0Z21hYzEwMDogRW5zdXJlIHR4IGRlc2NyaXB0b3IgdXBkYXRlcyBh
cmUgdmlzaWJsZQ0KPiA4ZGUwMTQxYzI1MjQgbmV0OiBmdGdtYWMxMDA6IEZpeCBBc3BlZWQgYXN0
MjYwMCBUWCBoYW5nIGlzc3VlIA0KPiBlNmI0NWVlNzkwZWMgbmV0L2ZhcmFkYXk6IGZpeCBncmFt
bWFyIGluIGZ1bmN0aW9uDQo+IGZ0Z21hYzEwMF9zZXR1cF9jbGsoKSBpbiBmdGdtYWMxMDAuYw0K
PiA4NmVlYjk3ZGU3MTAgZnRnbWFjMTAwOiBSZW1vdmUgcmVkdW5kYW50IGp1ZGdlbWVudA0KPiBk
NTYwYjczM2VkNTMgbmV0L2ZhcmFkYXk6IERlbGV0ZSBkcml2ZXIgdmVyc2lvbiBmcm9tIHRoZSBk
cml2ZXJzDQo+IGYxMjk0NjE3ZDJmMyBuZXQ6IGNvbnZlcnQgc3VpdGFibGUgbmV0d29yayBkcml2
ZXJzIHRvIHVzZSBwaHlfZG9faW9jdGwNCj4gMDI5MGJkMjkxY2MwIG5ldGRldjogcGFzcyB0aGUg
c3R1Y2sgcXVldWUgdG8gdGhlIHRpbWVvdXQgaGFuZGxlcg0KPiAwYzY1YjJiOTBkMTMgbmV0OiBv
Zl9nZXRfcGh5X21vZGU6IENoYW5nZSBBUEkgdG8gc29sdmUgaW50L3VuaXQgDQo+IHdhcm5pbmdz
IDliY2U0YjI3ZjNlYyBuZXQ6IGZ0Z21hYzEwMDogVW5nYXRlIFJDTEsgZm9yIFJNSUkgb24gQVNQ
RUVEIA0KPiBNQUNzDQo+IDBhYzYyNGY0N2RkMyBkb2NzOiBmaXggc29tZSBicm9rZW4gcmVmZXJl
bmNlcw0KPiANCj4gVGhlIHRvcCB0d28gcGF0Y2hlcyAibmV0OiBmdGdtYWMxMDA6IEVuc3VyZSB0
eCBkZXNjcmlwdG9yIHVwZGF0ZXMgYXJlIHZpc2libGUiDQo+IGFuZCAibmV0OiBmdGdtYWMxMDA6
IEZpeCBBc3BlZWQgYXN0MjYwMCBUWCBoYW5nIGlzc3VlIiBhcmUNCj4gYXN0MjYwMCBzcGVjaWZp
Yy4NCj4gDQo+IC1BcHBsaWVkIGFsbCB0aGVzZSBwYXRjaGVzIHRvIHN5bmMgZHJpdmVycy9uZXQv
ZXRoZXJuZXQvZmFyYWRheS8qIHdpdGggDQo+IGxhdGVzdCBkZXYtNS44LCBzdGlsbCBJIHNlZSB0
aGUgYmFja3RyYWNlLg0KPiA+DQo+ID4NCj4gPg0KPiA+IEZldyBpc3N1ZXMgd2VyZSByZXBvcnRl
ZCBidXQgbm8gcmVzb2x1dGlvbi4NCj4gPg0KPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1j
L29wZW5ibWMvaXNzdWVzLzMxOTINCj4gPg0KPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1j
L29wZW5ibWMvaXNzdWVzLzIyMjgNCj4gDQo+IFRoZXNlIHR3byBpc3N1ZXMgd2VyZSBzcGVjaWZp
YyB0byB0aGUgYnJvYWRjb20gbmV0d29yayBkZXZpY2UgdXNlZCBvbiANCj4gdGhhdCBwbGF0Zm9y
bS4gSSBkb3VidCB0aGV5IHJlbGF0ZSB0byB5b3VyIGlzc3VlLg0KPiANCj4gPg0KPiA+DQo+ID4N
Cj4gPiBUcmllZCBiZWxvdyBwYXRjaCAsIHNlZW1zIGRvZXMgbm90IHdvcmsuDQo+ID4NCj4gPiBo
dHRwOi8vbGttbC5pdS5lZHUvaHlwZXJtYWlsL2xpbnV4L2tlcm5lbC8yMDEwLjEvMDU5NTcuaHRt
bA0KPiA+DQo+ID4NCj4gPg0KPiA+IEZZSSAuLldlIHRyaWVkIG9wZW5CbWMgMi45IHZlcnNpb24u
IEl0IGNhbiB3b3JrIGZpbmUuDQo+ID4NCj4gPg0KPiA+DQo+ID4gQXR0YWNoZWQgaXMgdGhlIGNv
bXBsZXRlIGJhY2t0cmFjZS4NCj4gPg0KPiA+DQo+ID4NCj4gPiBUaGFua3MNCj4gPg0KPiA+DQo=
