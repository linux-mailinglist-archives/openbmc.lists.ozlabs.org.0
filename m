Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C73B74C40D8
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 10:01:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4kKf0f0nz3bb4
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 20:01:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=jnkdBGUd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:feab::72e;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=spencer.ku@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=jnkdBGUd; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2072e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::72e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4kK80TzTz3bSh
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 20:01:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=exkuIGBebdF5B+g9YiOiy8ohmMeoLbRt+ckPqFN3oL/NEC7rnwCNwgCFEIQTkEbgt9znBrtLZZLYceqQCS4Vtoo0GEm49+d7FkWlBnLAuj/yXl25dXd1cwRO4zn/2DtR4WeUvFHocYmfhBNd8yJFDbNI+xjiSRX0YsbevGwu94DbPzA3QIqiOY+gKqx4aYzvVryrYQ3mPxLs8EBASjwjH6IMNw+IvlVgHvMTHpVfI8gOWvFUSjxj473cTWnQe0s0kfOGg405uqkt6JfWCOduRRqIWSxYZlQrsKm+FBWs1FcT1AbmTRENfN3tHFJKDuSZVFXNXrjqGldbLdvkRKvqkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IW+pykGELLJTTW795ueAQFVWyqWce6eHNlfOcKqHNdI=;
 b=lbTR3ZTCuFes5DLLtdPS3yaX1B/cTXTrSd+wwHoy0YKkA0Q6b+J9QXpOzWhHqYwMcCbsT9UsipGYc64TWp9WubrDG3eFlSrd7iN1R3GoG0/hc8Rd1iqmGXAWb4uOiIJ+J2qXkQN1DShoRBgd/yMnnI5AXCQhZY/8ucQhhBkJ/iTNCZ8/7Zx+lz9bWd0A1qsDwBzVabrzhmsLmv3oQ42gGh2Ek0E9uQHi4JO34MPz64urwBldYOk2thrPDZPJwY0IqXiIQD3zC4KNuJdDBOyNbYKOVc1Ipn5zgnJUpzjE4924sTuAyKkEtjsISKunrYYK5/EGn+7/sFO4yRSLHLuxpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IW+pykGELLJTTW795ueAQFVWyqWce6eHNlfOcKqHNdI=;
 b=jnkdBGUdwLwVyDQxq75PY0Rjs4tUgFCXSlhc0HTEwQfnjY/HbIHtn+OTdjKbP+P7Cnqc1RU+DgS8zzJ3E7O17RYAqeHIYgMYVGkirhb0vqGCCdrvjbxk/C24XZ/DpuCTHTwQMm8q4NgZmPlFuCxlvEE7GFx8Ecsk778gBuiNs2Y=
Received: from SL2PR04MB3308.apcprd04.prod.outlook.com (2603:1096:100:3e::22)
 by PS2PR04MB2615.apcprd04.prod.outlook.com (2603:1096:300:4f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Fri, 25 Feb
 2022 09:00:54 +0000
Received: from SL2PR04MB3308.apcprd04.prod.outlook.com
 ([fe80::d10e:da9c:17d:cde5]) by SL2PR04MB3308.apcprd04.prod.outlook.com
 ([fe80::d10e:da9c:17d:cde5%5]) with mapi id 15.20.5017.025; Fri, 25 Feb 2022
 09:00:54 +0000
From: =?utf-8?B?U3BlbmNlciBLdSAo5Y+k5LiW55GcKQ==?= <Spencer.Ku@quantatw.com>
To: Heyi Guo <guoheyi@linux.alibaba.com>, openbmc <openbmc@lists.ozlabs.org>
Subject: RE: [hostlogger] Trailing LF is dropped from host logger to rsyslog
Thread-Topic: [hostlogger] Trailing LF is dropped from host logger to rsyslog
Thread-Index: AQHYKh7Ed49628W75Uy8tL6MXED+gKyj8Zcg
Date: Fri, 25 Feb 2022 09:00:53 +0000
Message-ID: <SL2PR04MB3308DB57B4AEC42489CB20F8E43E9@SL2PR04MB3308.apcprd04.prod.outlook.com>
References: <5737da4c-f9ed-9499-121d-8bcbcc1723a1@linux.alibaba.com>
In-Reply-To: <5737da4c-f9ed-9499-121d-8bcbcc1723a1@linux.alibaba.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bca03b8e-eda7-478d-392a-08d9f83d5464
x-ms-traffictypediagnostic: PS2PR04MB2615:EE_
x-microsoft-antispam-prvs: <PS2PR04MB261581EBB3DFEBEF557366A4E43E9@PS2PR04MB2615.apcprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xY/EgxZNQ0A619J1NghlAxC8jxZJRLHOlxdby5WlGe11vdfEj8BHwgJ6+KLsPl3IwsGEoykwo+WB5nUz87ZNiyKLnoJDwNurkHBrvQQp/LVjkqNgQdY61So+htksR2L8jndAP8qOKfyxYrYaAodJo5VbUToaSuiIZPlvOp+LsSMAOvGhD/lOHw6LMWu6wfPtNuxiPzFUiXmnbj7fi6dnQ6JgxBHVXLTLw2G93UW5HhNf1Q4vtOwWwSvxiCY3HQQaOpSJl/vzDnK6W6GOfQrVMvTOfNNQ2fjOoxH2QNNpxgUEbXV6Og9OzZeUaplRZTqWpP9fbBfw4/ZEDwMke/yGROT9tbFe/vAmLSgEbMu/4Xz1N3StGYEVQbJSdaxCu4rQXJ25JGd0iLYCWyoe2Q1ZhJbx0ozYKm9TodIznN2uEqMuSr8vvztz4rokqorEOH+4X6uJxad9OPNxHALm9o42iT7pXFwslVNayzfCHMslUp1J40ouOe9ZIMQdInVb2vWa5CLL0KV21WwK6Js8upFy4SfZiLoY4MZH34xQ8ZnS/hxpLZC9IGN+gmdHsUwEsZKOfYRWwS8YrW+s46vlAQzU5J2RzmdPQD71LILHKWdlvZnyIAWAvt+L6Yx8cDDg1sDgZVm4K5LYniszukZc50kH6jT9RB1MYaIHqzL1WGkreIpIfqgDknXzY6VgSfd0J9P1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR04MB3308.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(53546011)(2906002)(38070700005)(66476007)(508600001)(66556008)(66946007)(5660300002)(66446008)(64756008)(4326008)(85182001)(52536014)(6506007)(9686003)(8676002)(76116006)(33656002)(110136005)(54906003)(316002)(26005)(71200400001)(122000001)(186003)(38100700002)(7696005)(83380400001)(86362001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tm0xRGVTdC9yUFZMNlkrL2NtMWFUSzZRWW5JdTNldWpNSmVoQVBnaGxoSzE2?=
 =?utf-8?B?MVozSVpKYWYwbE9GclhpYkd3dGZqZ2dQZklnMWpwRTFCdkdnRkZ5NTFMWUFo?=
 =?utf-8?B?ekhxUWpTeDY4NFdwSzZJRVVOVFcwbFdPenJ6dkZhTFl3ZFBGNjhQWGVDUEtF?=
 =?utf-8?B?S0dJRUZrOWtNanZYZFZiU0EzOFNNdlFGR0JZbWVjbHRQcGUrRzJmRHp4VEV5?=
 =?utf-8?B?WEhKZVdXc0t1MXRwcTlBWmYxem5RVHFiNkNjYzRwZU40alM3TXBla3kzVU9V?=
 =?utf-8?B?TyszbncvTmVaWnJwdnJVYUtWSUhadE5EY056YUt6U2NGSjZCelZIQy9NcnZK?=
 =?utf-8?B?M3MzUFdpUi9vM2VHOEJmRHV3dERBVzduM1ZHN1B2aWJ0d0VDd2ZIUzdab0xR?=
 =?utf-8?B?SktneW81Z2xWZm9JejR4WkhwdnYyQVBlRWUwQkNHQ05na0d3djFpMFdOcEZO?=
 =?utf-8?B?QkJkWW9MdnNIcUE2QkxmL3poaThmditUTVR2cDVpa2hmRkhKWDVmM3ljR25G?=
 =?utf-8?B?dXNNWG9uTXk4UHFCaTZ1MUc4c29nRjlrQmVjQTVSRTVOdnlpMFBsNUVPVDJK?=
 =?utf-8?B?TmlPYnFOZEZPam9OMy9pY3V2NnZkM2psMmhwb2c5NHRGbjhjMDN0OVlTVHVt?=
 =?utf-8?B?ZVNnemJ5dTJsclN5ZHdCeHJtNTQ0QUtab2xHMlJpREkxSmlWa3dWWUhjU2FZ?=
 =?utf-8?B?NVAybSszdGYzRVY3SmJ4MGhDMmhRVXBtT2VJbEpLSE9iSmFMVDNHNjl4aklI?=
 =?utf-8?B?dXR5Sjg5ckthdWNHaDBRNWU5L1ZIWTY4SU0yNkJjM1NkcEU1TjU1dHIrR1Ry?=
 =?utf-8?B?ZENGWHNpQTUvcFVWMS95ZDlPbm5hZU8wNm13WnJmdG5DMGtwQmxRS3V6enJI?=
 =?utf-8?B?ZGphcytRYmJma3pTdEhmMDQ1ZU1wZ0lJY1VLZmJoUUM1R2U4MS9haFhzUnZ1?=
 =?utf-8?B?U0JOLzdPVVppcEVrVk1BQmtDS3pRRHBQbmpHVHRTMitaQndVQTBiRVBFL3hI?=
 =?utf-8?B?QzJjSmhIU2ozWkRqQmh4NnhMMXdNRm1NaFUrRzhyaVFuWkIwUWpESG55R1pa?=
 =?utf-8?B?amJFejFDa2RXTTlQNkt2Q0tTdkdYdE1vWFM3blVVRWx4NXU0V2NhNkFhdTF6?=
 =?utf-8?B?TW5NR1Q4M1RXTHpYYWtQcmdGWHBqSzh2TlhkVCtSOHdxcUM5MklLejhzK3BN?=
 =?utf-8?B?b3Z4akZCYkJwV21yaXRjcVlHdmxPM0JYalNnc24wS0gwcnpPZ0dCakZyUXQ3?=
 =?utf-8?B?MjFlQ1J6Q2g0VndvZng4RVFmSW90czRnc2ZJdmhBY2tQZ2U3TTAyMHNQYk9D?=
 =?utf-8?B?cmw1NTk4cjVrOUJCUk5sRmRVclpXdElWOXFDakM4S3hZMUlLejhTd0UrWngw?=
 =?utf-8?B?eVNNUzBlQ084eFJzRkZnRjdyWkQvQ0dFd3hFd0VOZFlnM1dKb3dKazZkVTBD?=
 =?utf-8?B?eXJHSnNSay9SSUh6RitsRS9XYm5HY25DUm9aS1RPaEpIbE1JRUl4OWZ1TkRp?=
 =?utf-8?B?OXNkK1V6ek1kbGc4ZmsxUTQyTTg5MERsNDZOQWt6V3ZSVC9vbm9jVTcxemFY?=
 =?utf-8?B?MkN4N2J3NG5mUm9QS0lZNlpnN0E4U1VDL3JITFUyLzVuejRFVFJiZlp4bFJH?=
 =?utf-8?B?aHhLTGZQbklJOWRSNDV4Ty9Uak9QOGxCdTYyakxEUm0xWDJJeXA0WXZBeWpM?=
 =?utf-8?B?UC9zN3A5TUp5aTh3UTNLRUV5cXVVQXNEOTZKL25pYkRUK0lqcytnOUwxa3ps?=
 =?utf-8?B?ZGJOOVVtc1NrMFYzZ0daR1ZkQlJTRFNxUUQxSVBSSU80RlRmck9TSlhKZUtp?=
 =?utf-8?B?eGZleWYvc0ovbGg1cjh2eTFzQ1NacFo1S3lQQzJQdEcrdUE1c2RLNWpnMUc2?=
 =?utf-8?B?K2xDN1p6OXVPZm1lZGk3T01BSGxPejIvMGVUUEVlVGxwSHJ4bGUrQXd1dXpl?=
 =?utf-8?B?UDd3cjBwa1ZnSWNsVldWZjZsMVc2NWFiL0dlME9XT2RTYkpCenFTZDF0NWYy?=
 =?utf-8?B?V2YvakUwRTl0Q2huZTZVb25VTnM4MC9mZDVXNE1hK1A5TVZIK0tJRUk0Zi9L?=
 =?utf-8?B?QUdDRUUxMGNLV2kvTzNGc09qenRRZlBlSW1HU0tMb1J5V2FsTnE5MnA2clly?=
 =?utf-8?B?bnNacU9LbVRMY3IvSFlORjNsbWMxa0x2Y2s3OHl0SHpGY0JJc1NBcTlka0xj?=
 =?utf-8?B?cEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2PR04MB3308.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bca03b8e-eda7-478d-392a-08d9f83d5464
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2022 09:00:53.9683 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UxgLNDoS7CCq+BhqONBrY960gG6TapfGeveejNbI4r0Lw0tFa7YBK8F28i3YRs3at79VTwRqu3154F01/8H8kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR04MB2615
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
Cc: Alexander Amelkin <a.amelkin@yadro.com>,
 Artem Senichev <a.senichev@yadro.com>,
 Alexander Filippov <a.filippov@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgSGV5aSwNClBob3NwaG9yLWhvc3Rsb29nZXIgaW4gc3RyZWFtIG1vZGUgZm9yd2FyZHMgdGhl
IGJ5dGUgc3RyZWFtIGludG8gcnN5c2xvZyB2aWEgdGhlIGltdXhzb2NrIG1vZHVsZS4gVGhlIGxv
ZyBpcyBwZXJzaXN0ZWQgdmlhIHRoZSBvbWZpbGUgbW9kdWxlIGFzIHNvb24gYXMgY29sbGVjdGVk
Lg0KU28gd2UgbmVlZCB0byB1c2UgaW11eHNvY2sgbW9kdWxlIHRvIHRyYW5zZmVyIHRoZSBkYXRh
LiBUaGUgYmVsb3cgc2FtcGxlIGlzIG15IHJzeXNsb2cgc2V0dGluZ3M6DQoNCm1vZHVsZShsb2Fk
PSJpbXV4c29jayIgU3lzU29jay5Vc2U9Im9mZiIpDQoNCnRlbXBsYXRlKG5hbWU9IkNvbnNvbGVU
ZW1wbGF0ZSIgdHlwZT0ic3RyaW5nIiBzdHJpbmc9IiVyYXdtc2clIikNCg0KcnVsZXNldChuYW1l
PSJDb25zb2xlUnVsZXNldCIpIHsNCiAgYWN0aW9uKHR5cGU9Im9tZmlsZSIgZmlsZT0iL3Zhci9s
b2cvY29uc29sZS9sb2ciIHRlbXBsYXRlPSJDb25zb2xlVGVtcGxhdGUiKQ0KfQ0KDQojIEN1c3Rv
bSBzb2NrZXQgZm9yIHNlcmlhbCBjb25zb2xlIGxvZ3MuDQppbnB1dCh0eXBlPSJpbXV4c29jayIN
CiAgU29ja2V0PSIvcnVuL3JzeXNsb2cvY29uc29sZV9pbnB1dCINCiAgQ3JlYXRlUGF0aD0ib24i
DQogIFVzZVNwZWNpYWxQYXJzZXI9Im9mZiINCiAgUGFyc2VIb3N0bmFtZT0ib2ZmIg0KICBydWxl
c2V0PSJDb25zb2xlUnVsZXNldCIpDQoNCiRFc2NhcGVDb250cm9sQ2hhcmFjdGVyc09uUmVjZWl2
ZSBvZmYNCg0KQW5kIHdlIGFsc28gbmVlZCB0byBzZXQgdGhlIHNvY2tldCBwYXRoIHRvIGhvc3Rs
b2dnZXIgY29uZmlnKFNUUkVBTV9EU1QpLiBJbiB0aGlzIHNhbXBsZSwgdGhlIHBhdGggaXMgL3J1
bi9yc3lzbG9nL2NvbnNvbGVfaW5wdXQNCkhvcGUgdGhpcyBpbmZvcm1hdGlvbiBpcyBoZWxwZnVs
IHRvIHlvdS4NCg0KU2luY2VyZWx5LA0KU3BlbmNlciBLdQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+IEZyb206IG9wZW5ibWMNCj4gPG9wZW5ibWMtYm91bmNlcytzcGVuY2VyLmt1
PXF1YW50YXR3LmNvbUBsaXN0cy5vemxhYnMub3JnPiBPbiBCZWhhbGYgT2YNCj4gSGV5aSBHdW8N
Cj4gU2VudDogRnJpZGF5LCBGZWJydWFyeSAyNSwgMjAyMiA0OjA3IFBNDQo+IFRvOiBvcGVuYm1j
IDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQo+IENjOiBBbGV4YW5kZXIgQW1lbGtpbiA8YS5h
bWVsa2luQHlhZHJvLmNvbT47IEFydGVtIFNlbmljaGV2DQo+IDxhLnNlbmljaGV2QHlhZHJvLmNv
bT47IEFsZXhhbmRlciBGaWxpcHBvdiA8YS5maWxpcHBvdkB5YWRyby5jb20+DQo+IFN1YmplY3Q6
IFtob3N0bG9nZ2VyXSBUcmFpbGluZyBMRiBpcyBkcm9wcGVkIGZyb20gaG9zdCBsb2dnZXIgdG8g
cnN5c2xvZw0KPiANCj4gSGkgYWxsLA0KPiANCj4gV2UgYXJlIHVzaW5nIGhvc3Rsb2dnZXIgaW4g
c3RyZWFtIG1vZGUgYW5kIGZvcndhcmRpbmcgdGhlIHNlcmlhbCBwb3J0IGRhdGEgdG8NCj4gcnN5
c2xvZy4gcnN5c2xvZyB0ZW1wbGF0ZSBpcyBhcyBiZWxvdzoNCj4gDQo+ICRFc2NhcGVDb250cm9s
Q2hhcmFjdGVyc09uUmVjZWl2ZSBvZmYNCj4gDQo+IHRlbXBsYXRlKG5hbWU9Imhvc3Rsb2ciIHR5
cGU9InN0cmluZyINCj4gIMKgwqDCoCBzdHJpbmc9IiVyYXdtc2clIg0KPiApDQo+IA0KPiBIb3dl
dmVyIGl0IHNlZW1zIHRoZSB0cmFpbGluZyBMRiAiXG4iIG9mIGVhY2ggc29ja2V0IHRyYW5zZmVy
IHdpbGwgYmUgZHJvcHBlZA0KPiB3aGVuIHNhdmluZyB0aGUgbWVzc2FnZXMgdG8gZmlsZSwgY2F1
c2luZyBtdWx0aXBsZSBsaW5lcyBqb2luZWQgdG9nZXRoZXIgYW5kDQo+IGhhcmQgdG8gcmVhZC4N
Cj4gDQo+IElzIHRoZXJlIGFueXRoaW5nIHdyb25nIGluIG91ciBjb25maWd1cmF0aW9uPw0KPiAN
Cj4gVGhhbmtzLA0KPiANCj4gSGV5aQ0KDQo=
