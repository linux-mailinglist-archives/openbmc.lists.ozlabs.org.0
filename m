Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E80C305344
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 07:35:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQYkK1hlpzDqlK
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 17:35:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=65436c5a3=scron.chang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=drw48kSe; 
 dkim-atps=neutral
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DQYj71FHPzDqZm
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 17:33:55 +1100 (AEDT)
IronPort-SDR: ZjnMHmEMIkHsu4gY3kZqHneiQ2kj7JDanv7W30dzjnkBemBQigTLJK2aJwZEKP7E4Lu3mYzwrt
 sEA6fHrAZY+g==
Received: from unknown (HELO mailbx12.quanta.corp) ([10.243.91.109])
 by mx02.quantatw.com with ESMTP; 27 Jan 2021 14:33:51 +0800
Received: from mailbx05.quanta.corp (10.243.91.100) by mailbx12.quanta.corp
 (10.243.91.109) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 27 Jan
 2021 14:33:51 +0800
Received: from APC01-PU1-obe.outbound.protection.outlook.com (104.47.126.54)
 by mailbx05.quanta.corp (10.243.91.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4
 via Frontend Transport; Wed, 27 Jan 2021 14:33:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BY7a6Gs+GESvF2qL3DXHoxfwy89yPHtX+w9dQEjCpliPxQRdIbyLTF9fUEfrxhimh+AxpHNKUued4+fqZYnUShbO2Gi13gDQpSMothZ4B/60hKAB3+ir2VE3dOw2ZiawB61hogFn8yoYMeTR5u9hob+DDFn2i8tLfbKby/kLEcn6y39TaaUZto8Db0Uf5wAP0O409gdYQckPLsXK8aNNHspGMVllMojCPWnoc4DnLgBPHwH5Xc5ko4XtCOxbpTSHZePGlL/AYJBM0Yq/4Tkf3pGR+V0QURzn1eNMglhcdBh6CYCQVoFNCf5IV/mA4zp0zU35Mo2s5KH1hfhBYIrrxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vKngQSyjNJtC6iBMxRuovThc7NmYyIe1mEfFzdYxBh8=;
 b=h4icNUwMvQKEzbxZoT8BeSXL3vVlDH2aVVP//5Fr4p5INa8KWrY8uQmJrhVa2moubgYZix5C9NSH49aJpKiCasUS09ERr10ik+YFVaPckVnouz2ZtF6W7fG3KR0lzBPGLC3gerhzsdgdOPvXfG3GfeeAvp8wjpnXM6Ue4A4ioDrmRh9HoByVmq0hs5GVDZVv1equj2vpliU5Kk022aGb75yZ1bVdoWsLMImj6SKMKVrQSpaNvhk89cQIKKtcseu03sTGB6FjFSrUHA0bOTUIBz4YNLnd7JmckPusTN8lreKjVUAiJXHkvYvchyMiWdFf7mezYoD/0zqB4xYUye1Z4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vKngQSyjNJtC6iBMxRuovThc7NmYyIe1mEfFzdYxBh8=;
 b=drw48kSeMl+wy2kfXTu/fgF0+Rvzjm+n1UkyYWL462ijncl4QTt8fqH5i4YOjIo47xY/dU7SsGldTAsRDh2OK1OmDFVHT5+ENx/HPKvSjg3NV+DhC4nQ1ALMHfZ8/TVuSnderWmaVO/B3JUGRPR6+dtDYT6DBf71ZK3HNEWfht0=
Received: from TYZPR04MB4416.apcprd04.prod.outlook.com (2603:1096:400:21::10)
 by TYZPR04MB4478.apcprd04.prod.outlook.com (2603:1096:400:2b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Wed, 27 Jan
 2021 06:33:50 +0000
Received: from TYZPR04MB4416.apcprd04.prod.outlook.com
 ([fe80::e48d:93b9:515d:61a8]) by TYZPR04MB4416.apcprd04.prod.outlook.com
 ([fe80::e48d:93b9:515d:61a8%4]) with mapi id 15.20.3784.019; Wed, 27 Jan 2021
 06:33:49 +0000
From: =?big5?B?U2Nyb24gQ2hhbmcgKLFppfKptSk=?= <Scron.Chang@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [entity-manager] Issue about entity-manager getting stuck
Thread-Topic: [entity-manager] Issue about entity-manager getting stuck
Thread-Index: Adb0diyKK8cE9nwESFKTsQMV9K5OLg==
Date: Wed, 27 Jan 2021 06:33:49 +0000
Message-ID: <TYZPR04MB441643EFC954C795DD1290A886BB0@TYZPR04MB4416.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=quantatw.com;
x-originating-ip: [220.135.135.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4067e8a5-3319-4524-f250-08d8c28d81fb
x-ms-traffictypediagnostic: TYZPR04MB4478:
x-microsoft-antispam-prvs: <TYZPR04MB44782CA2F6C5DB20AF4B0FD086BB0@TYZPR04MB4478.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ok+ARn8bzYRZaj57sFD/CBEGcIsVXC5EVDTOCTqqhByfs22977VoK50CEJDgvsfzBih9kC3nuECYgDsL6x7qe3wzeAXLSs0UNZkRvEYqtxoWZC1nSwBfzVHPlFcSp+wvx+WoZBhiTs++nkHDXBu301wfUWjD6ty1wk8hw4gaDzXiZdjPu7bGYcr6L9loadkUnY+sAzHn7Xk7Q20B9QGoUIkqMp5KSN/eNiHFWCCjVhnxN2UsLwUALmHX/Hoa+29cSxCiEymXI/lVHr7TGWKeQhOR1x5YoJiyVWOaT/x8YBnO7D5C46AknuSsRZZvqKzN8d8o+nhASPTpVOPZ3p9YuQkP6kxe5ZbPmlz7eXuTaVHcbxAyhRYkqJP16M6vZBbmu+zUict2FIZIEf5G+4qrVOwjCKMYmiLqmaffor3dtVEJzLWigxSW9ASw/n9H9Opj3O+FGAph+dBPyy1r9xn3M+dKQ8A7IxUX7cLhDfHEH8wQm+WqMUfkPUHVGs0PLQKbfxFEN6qzv2f6c8PZgDDoSl1/oc8zE9FZMKaHkR21DxT6Z3KeWjWJYD6cznDJTUxUKYl0tYlvt19xD9WZMf7wifmea/BwNKk20D/FY1sp+e4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR04MB4416.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39860400002)(396003)(376002)(55016002)(8676002)(52536014)(71200400001)(9686003)(478600001)(2906002)(26005)(186003)(33656002)(8936002)(7696005)(85182001)(5660300002)(64756008)(66476007)(6506007)(6916009)(66946007)(66556008)(76116006)(966005)(66446008)(316002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?dG8yQUxxSURQbE1JRUFHV0ZmY05yNGFyYzFzKysyZHY3bkNJalBqMW5VOE9namty?=
 =?big5?B?ZWVHNGNvWHo2dXJMRmhMS00rZW01T2wwTnhGbjdZUDBvdEZkQk8rT29hRlJyOEty?=
 =?big5?B?bzkveDZIYUwzZUQ3Qzl3UStLd25XMFVQQjBpbEFCSnUxS0ZCbEhMQVdudFRIZkc2?=
 =?big5?B?YVNCMmYrNkFsbHJOc1VSUDZxNFlTRGV2aG9yWWJFZ3hpRlpBdXBEaWxpV2JJR1JJ?=
 =?big5?B?Tk5rV0RGZ0RqWjNUbmJ5YnhMNEF0SmdseTJsYy9EclhCQnhyMTR5bnY2alEwVzk3?=
 =?big5?B?V0ErSGxaMDJMY3ZJNVd2RVNiMjdvd2h2QmhndVlWSlhRS3hpRmlya0xPNnV5aWR1?=
 =?big5?B?dEtGVGxCc3dYK3RBVlJEQ0NUME4wYkIzUWo5dzUrcDh0cXBpZFExaHYzZURCSjlS?=
 =?big5?B?T2NNMThBcEdzNFJnN3BXbnRaYXlHRDhYQmM4bGpJcHJXUTZScC83ZVplZ3ZjaHlZ?=
 =?big5?B?a3M4RnNLM1BoMTR4TFRFeFpFY2EvOXJYRGRuQjhHb1B4Z1B4d1JGSU81SlFxUUFU?=
 =?big5?B?ZjVVMXJzZzEvK1BNRnAzUXRyUVQwUGhUdnNDdEtWTVoza0ZvK2Yvd3pPQkRFU3lQ?=
 =?big5?B?Zy9UdkJUR1V6NDlyL3Vqa1lzdVBqZDJxdFIxa3hPK1BkMDFOVWdMNlJjdkRtV1lt?=
 =?big5?B?cVN0VDhTZW5iZHFlV044WndvankwZ04zMWdmdXF4aWZVY04wTUVUYmtlN0FHdVg0?=
 =?big5?B?N2FyMVpnWWdiTnBvNVdGTHZVYS82TkZ1Q0k2R1pWQnc2OE9jSFRlVklPcWlyWHNm?=
 =?big5?B?QmhpWEpieWZMaTZZeVNlQU5xRzFaZmZ1SkVVZFJJTVJ4TEd6WEYveGc5amk0OWVE?=
 =?big5?B?cm0wRU5lTmFvZnlzVHNjZC9oMEg0RzVSZnh0Y1FneHZlakdUMk44MXJiS2ltdEN6?=
 =?big5?B?VXZGNmNpNnFPTnRkanF6aGRiaDNDcUJxQ0IrWDEvbDRKTWJyRmZnVlZ0WmkwVE5w?=
 =?big5?B?QnA5TVRlaVB5dm1XRDB3TTl3MzBRMm00Q0RzWXlKS2c4ZlF3VTNGNmVhV0l1NVNw?=
 =?big5?B?dVVPM3ljYktYUzFNSkF3U3NlTmROOVRJSlYxNWxXTndkWEl2SGVYT1Z3RzI0azYr?=
 =?big5?B?WGtkeXJSSUo1dG52L0VDT09kbnRtVllYL2ZJWFFJeUJaUmpXZVh3RlBKWndVQXpO?=
 =?big5?B?QlRySzI2SmtYdyszRGZuSGttc0xVN25oV0UvTGFCUkRkNUdSYjBsc0ZWU3JabDRt?=
 =?big5?B?VFJZYzFhSkE3Z3RVQzRrQndWZGJSSWlZd0JxZWlKcXNiVU4wS2UxcXlqdUl3MXZS?=
 =?big5?B?SUNCYVFLSDQ4czJaSFg2cU1CdkFyZnRjQVBQWWNZNVFOS2RRQUJ2eTd5ajdad1Bv?=
 =?big5?Q?1r8PgtjBGymO/CdLzvYdHFF55QTfvjvo?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR04MB4416.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4067e8a5-3319-4524-f250-08d8c28d81fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2021 06:33:49.9177 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uk772h8GdThsJTXqEANiIfmVOP1Je0vc+xL9mfuLcX0agFiEeLK+hzWGsjKeokbIUwiYqzFRatvWA5LjMU+tyZBqOGIcWv7UmNqcg++C+18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB4478
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgYWxsLA0KDQpJIGFtIHVzaW5nIG9wZW5ibWMvZW50aXR5LW1hbmFnZXIgaW4gdGhpcyB2ZXJz
aW9uOiAiZjA5NDEyNWNkM2JkYmM4NzM3ZGM4MDM1YTZlOWFjMjUyZjZlODg0MCIgYW5kIEkgZm91
bmQgY2FsbGluZyBEYnVzIG1ha2VzIGVudGl0eS1tYW5hZ2VyIGdldCBzdHVjay4NCg0KUmVwcm9k
dWNlIHRoaXMgYnkgZm9sbG93aW5nIHN0ZXBzOg0KMS4gc3lzdGVtY3RsIHN0b3AgeHl6Lm9wZW5i
bWNfcHJvamVjdC5FbnRpdHlNYW5hZ2VyDQoyLiBvcGVuIGFub3RoZXIgdGVybWluYWwgYW5kIGRv
IHRoaXMgd2hpbGUtbG9vcDogIndoaWxlIHRydWU7IGRvIGJ1c2N0bCA7IHNsZWVwIDE7IGRvbmUi
DQozLiBzeXN0ZW1jdGwgc3RhcnQgeHl6Lm9wZW5ibWNfcHJvamVjdC5FbnRpdHlNYW5hZ2VyDQpJ
IHRoaW5rIHRoZSByb290IGNhdXNlIGlzIHRoaXMgZnVuY3Rpb246ICJuYW1lT3duZXJDaGFuZ2Vk
TWF0Y2guIiAoUGxlYXNlIHJlZmVyIHRvIHRoaXMgbGluZTogaHR0cHM6Ly9naXRodWIuY29tL29w
ZW5ibWMvZW50aXR5LW1hbmFnZXIvYmxvYi9mMDk0MTI1Y2QzYmRiYzg3MzdkYzgwMzVhNmU5YWMy
NTJmNmU4ODQwL3NyYy9FbnRpdHlNYW5hZ2VyLmNwcCNMMTg1OS4pDQoNCk1hbnVhbGx5IGNhbGxp
bmcgRGJ1cyBvciBjYWxsaW5nIERidXMgaW4gYSBzY3JpcHQgbWFrZXMgTmFtZU93bmVyQ2hhbmdl
ZCBzaWduYWwgYW5kIHRodXMgdHJpZ2dlcnMgdGhlIGZ1bmN0aW9uOiAicHJvcGVydGllc0NoYW5n
ZWRDYWxsYmFjayIgcmVwZWF0ZWRseS4gTWVhbndoaWxlLCB0aGUgYXN5bmNfd2FpdCBpbiBwcm9w
ZXJ0aWVzQ2hhbmdlZENhbGxiYWNrIGdldHMgcmV0dXJuZWQgYmVjYXVzZSBvZiB0aGUgb3BlcmF0
aW9uX2Fib3J0ZWQuDQpTbyBoZXJlIGlzIHRoZSBjb25jbHVzaW9uOg0KTWFudWFsbHkgY2FsbGlu
ZyBEYnVzIGluIGEgcGVyaW9kIHRoYXQgaXMgbGVzcyB0aGFuIDUgc2Vjb25kcyBsZWFkcyBlbnRp
dHktbWFuYWdlciBrZWVwaW5nIHRvIHRyaWdnZXIgbmV3IGFzeW5jX3dhaXQgYW5kIGFib3J0IHRo
ZSBvbGQgb25lLiBIb3dldmVyLCB0aGUgYXN5bmNfd2FpdCBuZXZlciBnZXRzIGRvbmUuDQoNCklz
IHRoaXMgYSBidWcgb2YgZW50aXR5LW1hbmFnZXIsIG9yIEkgZ2V0IHNvbWV0aGluZyB3cm9uZy4g
UGxlYXNlIGhlbHAgbWUgd2l0aCB0aGlzLg0KDQpTY3JvbiBDaGFuZw0KRS1NYWlsICBTY3Jvbi5D
aGFuZ0BxdWFudGF0dy5jb20NCg0K
