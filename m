Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDCA4C091C
	for <lists+openbmc@lfdr.de>; Wed, 23 Feb 2022 03:39:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3Kwx3dsGz3bVt
	for <lists+openbmc@lfdr.de>; Wed, 23 Feb 2022 13:38:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=PVeAskte;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:febc::726;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=PVeAskte; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on0726.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::726])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3KwL1dVTz2xF0
 for <openbmc@lists.ozlabs.org>; Wed, 23 Feb 2022 13:38:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oO5uos49WDlH1SX9yZVQQiPvD8+kh2YqdwG7juObX1CEhEB49foTJMLVnKjSgSoGCEDmogTv6XNrWoRt4/HlVdMIFjt1jNy+NkHuqq/scQPykog69/GD3sOSjm5UNW620M9o/O3OpG49Rw7bi7yFa8M525tpApsNtZaTFi2mGi895st0hpIelsYQX53UqZI+5bv9OZVPl4HfhaJsFd2ii2Z92stBDzKA4hRRVsx2Y0mbu0swd60BY6oBQ83jhJTD5wCH/Umlb/Hwrf9RjXweMH2TmlM1I60sRny15q1IOFcKbTVccfSujD2uYU2C8k9DEVVS6uIVLI23NnwddUeGVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/JcRZib2ym83OSk6aJ0exFAkG5ak3AQhVjGP/GNjzU=;
 b=mgLuL966LnPUx4EndAtDBlIEO/DDSO00/XvJAoDGa50nDPvtYTNjovHsr0O43dvNIXuoIXLL0M+Y+PYpcfGbySyKEbsVsFvLXb/CYBtIYKtU7RflpFOPYN6TLoCvj4QfATlqU+F4rUq3LfUeMMpe8Om4SvYHSQCitZDJLB+5N5EXCyGxMBzSd9LDd3a0qUHOxH1y9K+6ddpVhIAqMVbVS1xICaTXMPBGHMSP+8DbqLG27y6EoHcy3E9rahP7fnqdxezTRmSWigQuxGCQJr/8mKFwFK/Vt7T/pGuzSNO5kPQM30d0DD911OPo+3V8IDdrdQhM73ZDMdJVwS/nyiJVqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/JcRZib2ym83OSk6aJ0exFAkG5ak3AQhVjGP/GNjzU=;
 b=PVeAskteA5RXPgJYwu8HsX+FTyj4vYdGRZIl1pAy5eSTJfyRWUCZIO+R5QXJJn8b5BWgOzjOOVIBn3u2YKMODhbvhVeCVNv2kuWQ1C1BExRczpgFWQHsnK99CSNMK93ytBWkgyBq6bJ9h9n3JTwiGrBi4HwAm/o/XfyVZoSEIaFOMDwviAUdS4QRQoT4AFy/0rU0hwo9bKCJjQ62SWKQ6iF3wv7l/+dHCwa6p8CJIbh2ewj9OB777BWSAIvJ3zyaXpD7JTb1ppNuI4huGQEU/ahJqwn02clnrM8Jf2jxqJZ5Ot/cVD1guveMscqf0LEm20L2FF1sqFsEzRooeT96xA==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK0PR06MB3233.apcprd06.prod.outlook.com (2603:1096:203:84::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.18; Wed, 23 Feb
 2022 02:38:04 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::fd70:88e4:1545:131b]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::fd70:88e4:1545:131b%3]) with mapi id 15.20.4995.027; Wed, 23 Feb 2022
 02:38:04 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Lei Yu <yulei.sh@bytedance.com>, openbmc <openbmc@lists.ozlabs.org>
Subject: RE: New u-boot-aspeed-sdk runs slow and cause wdt2 timeout on ast2500
Thread-Topic: New u-boot-aspeed-sdk runs slow and cause wdt2 timeout on ast2500
Thread-Index: AQHYKFtBETGaWHK4ik2mqU2WIGmbl6yga1Ow
Date: Wed, 23 Feb 2022 02:38:04 +0000
Message-ID: <HK0PR06MB3779076AB5B2189822951A4C913C9@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <CAGm54UE7-QxGBniV3J2jnBiW4ygvRcHxKd=G88PsOiNZP+hBTA@mail.gmail.com>
In-Reply-To: <CAGm54UE7-QxGBniV3J2jnBiW4ygvRcHxKd=G88PsOiNZP+hBTA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1cbbb90f-b749-4447-7f02-08d9f675848f
x-ms-traffictypediagnostic: HK0PR06MB3233:EE_
x-microsoft-antispam-prvs: <HK0PR06MB32330B9D028521ACF6BCA2F3913C9@HK0PR06MB3233.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4rAWk1i8m7+zP51YJTAimcj+Byc6xzhnY85mzZk/VL7CaOeifC++zKxj5BDZIVb90e/3gWrE/fpR0PMlKGZPuKqQ9vPOnq+kZr4uh/3GilsRXdlP/fgYJ3I0DT8fncmDgevq2fXiKvGR5HhaRsZNXv769RuLz9uHx1G0PKdfBlXOvty6n4H7XnzE/76Hhsjy6/x0zvrtKyXHYL3va7g7d10sSXlEgWrcC5N7iNQWTKnZN2Bo3qX2NQ/iezOJHtgSQqvLyuKuqq7i+LNh2Vs95TjBZy7QXC7rrG3C0x5Eewno5p3g9T3xQR/3ql+oDELPofpbjFpMHTpXimXf93W9UMzo5OS+bqND9hTWWzr3spfHg5cQpozGWULpVVPkf8ENjhJQG0YFwFiZcK9dd6sZAVLrmszEDTzZOuW8P5HH62NLRZkSWe9u9+1a1UAPKZ4ohRce+ckSl0jzcy864IeBjTDIXsdRtlzUkMhXXcAWJV3Gs369qYyXw0S140dhxpuf1PH2LEY52+kcgFHwBHmCMFeXY/xiqJcDISSiek3Rg6sdjNj6Qp+aAvgo+xk5x+CMbF89e+SfpxPbKQmTeL7/gIewIl0Q9Hv/1iTujCO2M1eKgfLoRScOhfXzOu4E0jX+hBbLpSEORxnEJ3UsrPVDmDru8irAx0v08FwJzDejseut5BXtZBgRAc3uQDFPYMTpijrF3pdkrwoe5hXV25G/Gw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(346002)(396003)(136003)(366004)(39840400004)(376002)(66476007)(6506007)(71200400001)(52536014)(2906002)(4326008)(9686003)(66556008)(66446008)(107886003)(122000001)(26005)(186003)(8676002)(508600001)(86362001)(38100700002)(64756008)(7696005)(66946007)(5660300002)(8936002)(33656002)(38070700005)(316002)(54906003)(110136005)(55016003)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cjZZMkhSTER3cGlONFNKQjFid3J1YUJabmFmRUptMVhYWXFhUUhDQ3V6UjY3?=
 =?utf-8?B?THVpNHVvSVhMdytZVWQ5WFY3OU4rV0J0NlJyWUVoSllsOXhJY2FIdERvVVJl?=
 =?utf-8?B?Uk41dVJMdzNWeGtmeTZRL1RFY0NSd2pmclJLdmFJTkc4V0owK21aZDJBOWZp?=
 =?utf-8?B?UkwwMm1uMCs5WXR4ZS9mWjNqQm5pRThNRFc3N0xCSElsVEpxNXZiT1A0SlJn?=
 =?utf-8?B?TS9KTWFUVVlkQk1HV0lhdmZTa0JBK05CWER1L0ZVaEhPZ1VpZkF0aXk4MHZ3?=
 =?utf-8?B?SDgxTURFMGZDcEl3cmdKdDlCREw4VmZkWHZVZWRYUnVlMFBGTFk2c21aMjFY?=
 =?utf-8?B?bS9KM2R2bytvQlhUNWRoblhHWXByNHYzTCtoaXlyZ0hjT1hlZVZuNGhaYTNk?=
 =?utf-8?B?aTBJSjRpT0RtVzRDZzNGUHJSbXZ3RzRrSjFQOGlEOHJUaC9VZXdSeHFEbUpS?=
 =?utf-8?B?QXhRcmt5OWlGN2xlNko1RG01YzJ6OFdBNFZnUEtVL0dGSWJZRUYydnBvZ1g2?=
 =?utf-8?B?UCswamZNM1EwQjh1eDhaNTY3ZS9BSm8rN2YyQTQ0UzB3Q0VCQXMveEFWTXU4?=
 =?utf-8?B?bDhpUmZib3AyREZ1SUwxbHQzeHNIZzlFb08rN0NteGVwN2pDOHBiREVFTk02?=
 =?utf-8?B?Nk4yS09BNzgxN3BqanNGdjYvR1VBSDVuaXMrR0NVeWl1UHZWN1NDcyt1dEZY?=
 =?utf-8?B?K0dCdm1qc1Z1NTVBMGJZWkhDcDV1d2pzV1NuSnlvZWlzKzVJZ3lrOTNPNFJB?=
 =?utf-8?B?bXl2aG54OFJ5ZGJBUFNqR2IxQW1wbjdpSDA4S2E1UUI0TUxGY09NUkl5S3N3?=
 =?utf-8?B?MkRyVEs4dU9OT2pKeGl1V2FGL3Q5U21NT3Jzd3JERDdyZTlGSjBaZitpKzJH?=
 =?utf-8?B?OUNldEZ5SUx1TElaTjU3azZxOE9BUDNacnRxMy9ScnMrVWFaT0JyWlBZSHA3?=
 =?utf-8?B?VzdGblh5Uy9vNFh0SEt2SDNzM0dpTmlhM1JIUTJtWkJKeFQzL2kzNWRGelNF?=
 =?utf-8?B?VEdpd3c3S1pFQUVmL0tEaXJjZDBhYWxxNDA0d0xmNUhCRHlkT3FhME5pcVh0?=
 =?utf-8?B?clhSN0xWYUVDZllhMFFsbDFPSDdyVXpCS1FpZnBvcWg2OCtZTFk3cURPZzFu?=
 =?utf-8?B?SDFnUlA0Vm1uK2R3bTNGUFhQMkFlOURNTjRGK2l2bzVkeWVlK0txb0JhdHBw?=
 =?utf-8?B?V1p1M1RTNDhDb0E0cExKMFJmN3RhVVQ5bFhZQUJqSDRXZE5jekdheEdRVS81?=
 =?utf-8?B?OUNYWW9XVCtUbHM3cUtaNFZuNnFXSU9YalAvYlJEYlJVZUpWV2RWTkdJN2dn?=
 =?utf-8?B?MmJkQ2VSbWNVeXB6T0FxcUhsRHJhZDFuNVE4S1N3bXhFZG4vZUZmZm9uY2Ri?=
 =?utf-8?B?RllDQ1d0R3lyM2ZOWllXRUREelF1bTlyeWZXUlZFQUdBaUI4cXh1YlhWUjVS?=
 =?utf-8?B?ZzhXTjVoVWVaOFBGN01OLzdydVA4c2NRemFGMys2QWtINENycVlMWXhhUFJ4?=
 =?utf-8?B?MU1xb245Vk8wcHJLZStGdUlpRjhYUE1GZmY1NVluSEVhblJ2T3lhWklzU0RE?=
 =?utf-8?B?YUE0RnpaK05obWlzV00yM2xTV3pqMDFpUE05Wm9HcnRoNklvTGNsL09kZ0lN?=
 =?utf-8?B?Z0lmbFUyZDdFNGpvYXgxWWxEV0ozMWZEUGh1Zlp6UDhtMUpYWUV1VkJ6Znkr?=
 =?utf-8?B?azVEK0xOeXU0N1k0YWx3SXBVWVllcHRFSjRwVTdKQjBTU1lzRkFWT0ZtNHRE?=
 =?utf-8?B?dUNQcDRHRmNRbmxrQnVDWENqRGlvNkg2UWNIZ3dkeVc3eFZkajBqQWw2MVkw?=
 =?utf-8?B?cEdpUVJmRVhlTkhqTEVYRWFUaUQ0YVBnU2lSRUNwYzV0YjBxbU9zZDZoa0cx?=
 =?utf-8?B?cVMyT3VxTUJGbTZabXRjc0lUUHU1LzFBZ3Z5Wm9xSXBGSVVVMVl4bzh4VEUw?=
 =?utf-8?B?bTVKdEVKMGJPRXRIZDBQYjJBZjN0ekZFSTZuZ241WGtQdk9kRHRTV0g5aUdP?=
 =?utf-8?B?VnhYRDkzSEtrUnRad0FGcHp3WTBSTzU1Z3lSM3pOSGlkNkdBeWlmMXh3SnZm?=
 =?utf-8?B?blhUU0c0ZzJYc28wT1hydUZiUTc5c2NVbXRrZEh6YWo4VDlEeDd3bEFoZS8z?=
 =?utf-8?B?NEFiTmdMUGwyVUFSQW9MOWEyVFVURXptYzRndUlSUk1SL0VWOC9YemN1MldG?=
 =?utf-8?B?dFRyWWlOQVAzNTB3cXRVOUp3c3ZkZUxXdGRRcDFQN2FtNTBUdGhWNTZuelMr?=
 =?utf-8?B?dHdDbDNCOUJYT0hCSjBta3pZcUd3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cbbb90f-b749-4447-7f02-08d9f675848f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2022 02:38:04.3520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FJWRcZaOVQXBHt7lBx4K3ISyZowHKl5jR2t/kPb9YaF1jrSIsMV7dc2noiGUkqfTXp9WOQzVj4IARWvYh2aQreE6Op/nQMlHc4/pdsFSXwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB3233
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
Cc: Troy Lee <troy_lee@aspeedtech.com>, Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiBMZWkgWXUNCj4gU2VudDogV2VkbmVzZGF5LCBGZWJydWFyeSAyMywgMjAyMiAxMDoxNSBBTQ0K
PiANCj4gT24gdGhlIGxhdGVzdCBtYXN0ZXIgd2l0aCB1LWJvb3QtYXNwZWVkIHYwMC4wNC4wOSBT
REssIGFuIGlzc3VlIG9jY3VycyBvbg0KPiBnMjIwYSB0aGF0IGl0IHJ1bnMgc2xvd2VyIHRoYW4g
YmVmb3JlIGFuZCBnZXRzIHdkdDIgdGltZW91dC4NCj4gV2UgcmV2ZXJ0ZWQgdGhlIHUtYm9vdCB0
byBhIHZlcnNpb24gYmVmb3JlIHYwMC4wNC4wOSBTREsgKGIwZmU4ZmQ5ZCkgYW5kIHRoZQ0KPiBp
c3N1ZSBpcyBnb25lLg0KPiANCj4gQmVsb3cgYXJlIHNvbWUgZGV0YWlsczoNCj4gKiBCZWZvcmUg
djAwLjA0LjA5OiB1LWJvb3Qgd29ya3MgT0ssIGFuZCBpdCB0YWtlcyBhYm91dCA5fjEwIHNlY29u
ZHMgdG8gbG9hZA0KPiBhbmQgc3RhcnQgdGhlIGtlcm5lbCBpbmNsdWRpbmcgdGhlIDIgc2Vjb25k
cyB0aW1lb3V0IGZvciBhdXRvYm9vdCwgdGhlIGtlcm5lbA0KPiBzdGFydHMgT0sgYW5kIGl0IGtp
Y2tzIHRoZSB3YXRjaGRvZyBhcyBsb25nIGFzIHRoZSBkcml2ZXIgaXMgbG9hZGVkLg0KPiAqIFdp
dGggdjAwLjA0LjA5OiB1LWJvb3QgcnVucyBzbG93ZXIgdGhhbiBiZWZvcmUsIGFuZCBpdCB0YWtl
cyBhYm91dA0KPiAqKjE2IHNlY29uZHMqKiB0byBsb2FkIGFuZCBzdGFydCB0aGUga2VybmVsIChp
bmNsdWRpbmcgMnMgdGltZW91dCBmb3INCj4gYXV0b2Jvb3QpLCB0aGVuIHRoZSBrZXJuZWwgZG9l
cyBub3QgaGF2ZSBlbm91Z2ggdGltZSB0byBydW4gYW5kIGxvYWRzIHRoZQ0KPiB3YXRjaGRvZyBk
cml2ZXIsIGFuZCB0aGUgd2R0MiB0aW1lcyBvdXQgb24gYWJvdXQgMjJzLg0KDQpDb3VsZCB5b3Ug
c2hhcmUgdXMgdGhlIGJvb3QgbG9nIHdpdGggdGltZXN0YW1wcz8NCkl0IHdvdWxkIGJlIG5pY2Ug
dG8ga25vdyB0aGUgdGltZSBlbGFwc2VkIGF0IGVhY2ggc3RhZ2UuDQoNClJlZ2FyZHMsDQpDaGlh
d2VpDQoNCj4gDQo+IEJlIG5vdGVkIHRoYXQgdGhlIGlzc3VlIGlzIG9ic2VydmVkIG9uIGcyMjBh
IHRoYXQgaXMgYmFzZWQgb24gQVNUMjUwMCwgYW5kDQo+IGNvdWxkIG5vdCBiZSByZXByb2R1Y2Vk
IGluIFFFTVUuIEkgdGhpbmsgaXQgY291bGQgYmUgcmVwcm9kdWNlZCBvbiBvdGhlcg0KPiBzeXN0
ZW1zIHdpdGggQVNUMjUwMC4NCg0K
