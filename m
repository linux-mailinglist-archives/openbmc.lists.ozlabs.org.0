Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC88F3A3FDB
	for <lists+openbmc@lfdr.de>; Fri, 11 Jun 2021 12:10:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1c6q1QDgz3bw0
	for <lists+openbmc@lfdr.de>; Fri, 11 Jun 2021 20:10:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=z69N3vqK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=40.107.130.98;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=davidwang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=z69N3vqK; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300098.outbound.protection.outlook.com [40.107.130.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1c6V1hDbz2yXS
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jun 2021 20:10:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=io3TiHF9XOunVNPubS3mZAqZ0xdeBKdk2rrEESmAHtdz4/4M32cxhhrXTbtGm9oub0QYQfNZFgBZJXaLcf5vW11m9iE54ijIStZhRAUX438XsTxo7GF/dYC9IoxvfpjyReOs9ux8dnLGeeWo+IQMIU66Q7wGaVqoOFcC5tTp2vQjGox+AS01rsMQAMam5ggp75EAesrFlAXWYYbBr4cWfP8eBXI+Dt0y+JLDykbcJNTPvcMR4ZDFp2FcomGH6R3pcagdmxWE6mOcnylKgBtZBrae2oMqj7PLGf0FGMA/Cp6tNq7dSm3TaetUZLN4fTqSk+RdOYnK1tZK8w8OWKgT+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iYliYh5i7Yv/r6juCu5yXuNLwurPpoRx93GPRuvICyQ=;
 b=Rh34rXjMcHy8ZsIYJ7uQzCLImKHfpwg/sHmY/YHssLfj+yb/p/3TSoiHgx/x9zDd0CuxIx5/ryBise4e9dHUQq7MoSXMStnC+HAePug74d2N7d1yn6Q1/yDrTJtczxnMlZWyRIRbTvYSAwItQ7Dqfo1hQK1ZyWLPPs700fRezIN1QF97bICwQdBhTveXVdQGhjOouXYGAKulcGqUX0pA3hIipUieZsWufuXxSA7zmIHXrC8Qk6kfP/DsfR/Gt4Q7PYKfRYkXMAhMZvlUK0/OWfqQQ8E2RO0+i7pW0uIxiYK23RGDyFiOA7C/g/++FCs8QlP6eICYhuOTLg5lB3/HNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iYliYh5i7Yv/r6juCu5yXuNLwurPpoRx93GPRuvICyQ=;
 b=z69N3vqKzvIME8CnlF0TjOUMWZpcbtcVQRQglBnfxPuY3gc4fxHG7LPAFDRhw91K71Rp2TN7112t7Yqw8tCu1t4r/oWsC0HNDaW7P29N1EUZagbPruFBmQpMjFbg69rZIaB17PrujfgF7vKXGeZm41vcqS1WbidhEnqPVaaEI+k=
Received: from HK0PR04MB2737.apcprd04.prod.outlook.com (2603:1096:203:5b::20)
 by HKAPR04MB3988.apcprd04.prod.outlook.com (2603:1096:203:c6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 11 Jun
 2021 10:10:17 +0000
Received: from HK0PR04MB2737.apcprd04.prod.outlook.com
 ([fe80::b01d:7a8b:441d:95a]) by HK0PR04MB2737.apcprd04.prod.outlook.com
 ([fe80::b01d:7a8b:441d:95a%7]) with mapi id 15.20.4219.024; Fri, 11 Jun 2021
 10:10:17 +0000
From: =?utf-8?B?RGF2aWQgV2FuZyAo546L5oyv5a6HKQ==?= <DavidWang@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: SYSTEMD_OVERRIDE do not install into image
Thread-Topic: SYSTEMD_OVERRIDE do not install into image
Thread-Index: AddehjIGyPGnl/XER5W/SdvBjrs6IAAIq/nQ
Date: Fri, 11 Jun 2021 10:10:17 +0000
Message-ID: <HK0PR04MB27373E988FB708414A9541ACC9349@HK0PR04MB2737.apcprd04.prod.outlook.com>
References: <HK0PR04MB273730C0DEBB24EE4A435477C9349@HK0PR04MB2737.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB273730C0DEBB24EE4A435477C9349@HK0PR04MB2737.apcprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=quantatw.com;
x-originating-ip: [220.135.135.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 945a5602-d03c-4a42-8ea3-08d92cc11d23
x-ms-traffictypediagnostic: HKAPR04MB3988:
x-microsoft-antispam-prvs: <HKAPR04MB3988754D97E3D19A9C5E43EEC9349@HKAPR04MB3988.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4UKVp6QzANw+RYD0u/cihZPKCGNyu2dhm+KbdywF5BPsfZTJ2DH1Sfxu6kzKR7nqvHQbGaZ/FqvzAjrbvKPIqeNYJ4aiIIYmm1sgcVFgjdD1DIAh8PFKZspQ79L+lAXmXmP9CPRbtW0QAAGcsMNQej0AvvUzavA89LhkQRK5YyTZ2blr3L25sub6LdgwzIkrrb2HjwvXVFwau9G6/cdPQfequuYmwOeHflEvB98NEEb9QFctP50qzloftBHGQiCm/xQZkUsFMfwi/WnqfoK7K8uR3PvnkgVnaIMptYdchIFjQPG6HGUYKf1neij1c/iQ9iWInlJDxv17tAUzP02BtFEEoAJgLQg0r6c8MpS/3R3E9zyGbAsEGntncCpkeBZXTb/NcjnGTwicxK4etdE9SbkOErsXyC4kTcZ4EouKZX9GSWut5EQXdvWHVIO5ZGcwo9uGSK+1nXU5xHETyKnAq0IV+H3Aqrt/vvqUQ5beHKUIZk1pp4kWNo0/4ilLeM9sKRf7fGc2TQ93FnQA2Bx4UkLLESBiahB+/rFoqaVQxpm2eOazRIEpH8mYE381O03WeelU6BO9vcDeh2NyqlZcYrWfygTYrdKGDTX2aiAxfPM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB2737.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(2940100002)(6506007)(85182001)(186003)(5660300002)(52536014)(55016002)(38100700002)(53546011)(26005)(7696005)(76116006)(8676002)(8936002)(9686003)(71200400001)(66476007)(66556008)(33656002)(478600001)(2906002)(66946007)(316002)(83380400001)(66446008)(64756008)(6916009)(122000001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?aUFXMXdGd3FWSExHU1Z5T0xZeVlXRFIvUENNOVVKeXlRZmtxMFRyd0VscU5a?=
 =?utf-8?B?aHk2MHdVU2JYMmJFdnp4QWQ4QkR4ZkQrTWNkTGVucGIrS1dXeHhPYTJ2ZVZm?=
 =?utf-8?B?dzA3eXVPeEFrVHptVEUwYWhiYXpqazFTRGxDSXhtR0pCMVgyclg2ZlIvK28x?=
 =?utf-8?B?bUJrdko5a2Y1RDVzU3lETk5mVWhiZk5sanJKQUozK1ZmdVltNW5XbjZxWUdW?=
 =?utf-8?B?Vk0vbUxuSjJvNzM2ckF0T29nS1ZjZWlqZTBEcFFPSG40ekJiYXQ4ZXVLUTVs?=
 =?utf-8?B?ZTdNUEwzZVZGcTJSQ2VkL2dESXpWN2pFTjFxYnpScDQrV1JYMXovd1VNbFFu?=
 =?utf-8?B?S1NmMzFYQ05ubTEybGthV3JqT1NOVU05MjFCcU9RcW9hQmczNUtsMUpxa3cz?=
 =?utf-8?B?OUMvbVQ3Y284QXJ6bGlYRkJyRDk5M3pUSVpCa1d4b2JTNEpGNVNqZTVyR1FN?=
 =?utf-8?B?MUtZSEo4czFkZjFEcmZpVGlORDQ0aWI5WTZSa0lUUjF3czRSeEJkTVJaVUdn?=
 =?utf-8?B?M0lWQy9HcUZSb1M2em1Na0F1aVRuNVpxdlFlbHhWaGtBSk80Ukp1ZUpWUXdo?=
 =?utf-8?B?cUxiaDVjcitlbzdJbGFDdjVwWk1IVm05ODRqUHpaKytoWFlSQy83N1VrTlJn?=
 =?utf-8?B?cWFRSHN1dmZxdDBYR1NBR1IxT2daM2pZL3JOemxmcjRtbG82OHVpSVZwVmhS?=
 =?utf-8?B?N0xoQzdycGIwdDZpQms3dWtibkVIQ3c4WTVkRnlWQ3pGanlJUjdnSW9pTEcr?=
 =?utf-8?B?TzBJZjhGcEgxOEpwL0l5RFJYdHZnZENmUWpKOEIxekRvY2M0R3ZDWUVENmI0?=
 =?utf-8?B?VVIxZjQxMktNTThMajV6Qkh0QjVRY3pRdkZ1T1p2ZXRWbnpQVU9XWnJPTkhH?=
 =?utf-8?B?Z25qTGRqaWhBc3hJUUR3dVN5SGdQbUtLaXNUT1N1ZHFGbHpUZzE0QkpVK3FS?=
 =?utf-8?B?QUJwSmJuaFg0VnBxNXJJSk5BVUthMWJlUEp5VnZmU09DVjFiVm4zcTB6UlhE?=
 =?utf-8?B?Q25udEs3VTdTM1pjeVBOY3QyVjgwcGZwUE5VZHRHMDVUREdHczRId0pvNGJh?=
 =?utf-8?B?WXNRNFlaZDIyRmVBVFVzZGtWQk9yUy92bFNYVU94eVpPZ3NLN0VzK2x0WWRJ?=
 =?utf-8?B?VnpHQlFLeUw5TDJKOHcrQmp2V2hwZ3RtV1BHdEJ5a1J6TEhIeDN1K251TmE1?=
 =?utf-8?B?akg2Z3dMQmx5cW9ZQWgzbGhyMEJ3NytYbkFrQzJQSkh6aTlPK1RCcVZsc2Rl?=
 =?utf-8?B?dXJqMlg3b2YzRFJpd2UrUk1jMWUra1lwVWh1dXZOUFpxVzd1bDJpdTF5K3RW?=
 =?utf-8?B?NUgrcDZ2aG01eGVxL3BIRDcvK3hvM1A4clRpTG9xL291eUZNWFNCdjBWRjdK?=
 =?utf-8?B?YjdBVU5PYk41ekFYcHhoL3ZSRTcxVCtTdGRWQXE4Z0lPL2U5amE1UTlqVjRX?=
 =?utf-8?B?dEx3UXVjc0txNDVaZ1dnSXFtT3lPZ3VjRWU0NlFuaFlteHlFVmcvVlhjZjV5?=
 =?utf-8?B?L2h2alZyNDFhWFhUWS9tQkRLL200bURlRXMrNjIwK0JqRXEzbCtCQlpXV2Vl?=
 =?utf-8?B?Q2lGRGNGNXd2WENEaWVrMS9EUDhCTmJOdDhHRityNlpPeTJxV0o0OUI0Y3NZ?=
 =?utf-8?B?bW5lUXhrTUJTWEhYLzdudzY5dXZYZ1loczZjRm1PTGgrQlBoWHBaUXhVWlFu?=
 =?utf-8?B?Rmp2MlltUlptWEZJdTFhL09randJS09YTlkrYVhaTUVZSS9tb2VSdzRWZWZq?=
 =?utf-8?Q?aqKM8kjCCknYPSopNVoTwC10kUZODcp7mEc7eLS?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB2737.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 945a5602-d03c-4a42-8ea3-08d92cc11d23
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2021 10:10:17.7026 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TGlPefd6N/7BsceRzTIAmKGv+RTIoe4TPrvFj9bQUEQNgS53gAKvfaJ6DWeOs3BxlM1AZcM147WklENwH2pXLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HKAPR04MB3988
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

Rm91bmQgdGhlIHJvb3QgY2F1c2UuDQp4eXoub3BlbmJtY19wcm9qZWN0LkxFRC5Hcm91cE1hbmFn
ZXIuc2VydmljZSBpcyBpbnN0YWxsZWQgYnkgWW9jdG8sIGJ1dCB4eXoub3BlbmJtY19wcm9qZWN0
Lk5ldHdvcmsuc2VydmljZSBpcyBpbnN0YWxsZWQgYnkgbWVzb24sIHNvIGl0IGNhbid0IGJlIG1v
ZGlmaWVkIHdpdGggU1lTVEVNRF9PVkVSUklERS4NCkl0IHBhY2tzIHRoZSBjb25mIGZpbGUgYmVj
YXVzZSBJIGRpZG4ndCBjbGVhbiB1cCB0aGUgcGFja2FnZSBiZWZvcmUgcmVidWlsZGluZy4NCkFs
dGVybmF0aXZlIG1ldGhvZDoNCkZJTEVTXyR7UE59ICs9ICIgXA0KCSR7c3lzdGVtZF9zeXN0ZW1f
dW5pdGRpcn0veHl6Lm9wZW5ibWNfcHJvamVjdC5OZXR3b3JrLnNlcnZpY2UuZC9zZXJ2aWNlLW92
ZXJyaWRlLmNvbmYiDQpkb19pbnN0YWxsX2FwcGVuZCgpIHsNCiAgICBpbnN0YWxsIC1kICR7RH0k
e3N5c3RlbWRfc3lzdGVtX3VuaXRkaXJ9L3h5ei5vcGVuYm1jX3Byb2plY3QuTmV0d29yay5zZXJ2
aWNlLmQNCiAgICBpbnN0YWxsIC1tIDA2NDQgJHtXT1JLRElSfS9zZXJ2aWNlLW92ZXJyaWRlLmNv
bmYgXA0KCQkke0R9JHtzeXN0ZW1kX3N5c3RlbV91bml0ZGlyfS94eXoub3BlbmJtY19wcm9qZWN0
Lk5ldHdvcmsuc2VydmljZS5kLw0KfQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
IEZyb206IERhdmlkIFdhbmcgKOeOi+aMr+WuhykNCj4gU2VudDogRnJpZGF5LCBKdW5lIDExLCAy
MDIxIDE6NTYgUE0NCj4gVG86IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KPiBTdWJqZWN0OiBT
WVNURU1EX09WRVJSSURFIGRvIG5vdCBpbnN0YWxsIGludG8gaW1hZ2UNCj4gDQo+IEhpIGFsbCwN
Cj4gDQo+IEkgaGF2ZSB3cml0dGVuIFNZU1RFTURfT1ZFUlJJREUgaW50byB0aGUgYmJhcHBlbmQg
ZmlsZSwgYW5kIGJpdGJha2UgZG9lcw0KPiBwYWNrYWdlIGEgY29uZiBmaWxlLCBCdXQgdGhlIGNv
bmYgZmlsZSBpcyBub3QgaW5zdGFsbGVkIGluIG9ibWMtcGhvc3Bob3ItaW1hZ2UuDQo+IEFtIEkg
bWlzc2luZyBhbnkgc3RlcHM/IEkgdXNlZCB0aGUgc2FtZSBtZXRob2QgdG8gb3ZlcndyaXRlDQo+
IExFRC5Hcm91cE1hbmFnZXIuc2VydmljZSBhbmQgaXQgc3VjY2VlZGVkIFdoYXQgbWFrZXMgdGhl
c2UgZGlmZmVyZW50Pw0KPiBQbGVhc2UgbGVhdmUgYW55IGNvbW1lbnRzLCB0aGFuayB5b3UuDQo+
IA0KPiBTWVNURU1EX09WRVJSSURFXyR7UE59ICs9ICINCj4gc2VydmljZS1vdmVycmlkZS5jb25m
Onh5ei5vcGVuYm1jX3Byb2plY3QuTmV0d29yay5zZXJ2aWNlLmQvc2VydmljZS1vdmVycmlkDQo+
IGUuY29uZiINCj4gDQo+IGFybXY3YS1vcGVuYm1jLWxpbnV4LWdudWVhYmkvcGhvc3Bob3ItbmV0
d29yay8xLjArZ2l0QVVUT0lOQytmYzNhZmY5MQ0KPiA2NS1yMS9wYWNrYWdlL2xpYiQgdHJlZSDi
lJTilIDilIAgc3lzdGVtZA0KPiAgICAg4pSc4pSA4pSAIHN5c3RlbQ0KPiAgICAg4pSCwqDCoCDi
lJzilIDilIAgeHl6Lm9wZW5ibWNfcHJvamVjdC5OZXR3b3JrLnNlcnZpY2UNCj4gICAgIOKUgsKg
wqAg4pSU4pSA4pSAIHh5ei5vcGVuYm1jX3Byb2plY3QuTmV0d29yay5zZXJ2aWNlLmQNCj4gICAg
IOKUgsKgwqAgICAgIOKUlOKUgOKUgCBzZXJ2aWNlLW92ZXJyaWRlLmNvbmYNCj4gDQo+IG9ibWMt
cGhvc3Bob3ItaW1hZ2UvMS4wLXIwL3Jvb3Rmcy9saWIvc3lzdGVtZC9zeXN0ZW0kIGxzIHh5eipz
ZXJ2aWNlLmQgLWRsDQo+IGRyd3hyLXhyLXggMiB1c2VyIHVzZXIgNDA5NiAgMTEgMTM6MzMNCj4g
eHl6Lm9wZW5ibWNfcHJvamVjdC5MRUQuR3JvdXBNYW5hZ2VyLnNlcnZpY2UuZA0KPiANCj4gDQo+
IEJlc3QgUmVnYXJkcywNCj4gRGF2aWQNCj4gDQoNCg==
