Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0975E4AB306
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 02:08:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JsSgc3VYMz30MQ
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 12:08:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=vVSiJTO2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::71c;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=vVSiJTO2; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2071c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::71c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JsSg92wL9z2xKK
 for <openbmc@lists.ozlabs.org>; Mon,  7 Feb 2022 12:07:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJUqdD62XONvKhJNmeTp0dPJgwp2Jk4E3UDw2HBIwUbc1M1Ydb0xbOyi+p8zPku6OR30pv2qHk7K18AIETBqcZArsSfbwFtijVZi90Hr8ejFcZRq7deVpKCUtsm57GWP/h65eIzOERYCoPIKwTpXDhI2w+RUKn3YqjVwyJcockw/FdJa4WAYfPfU+N8JclLnhBx5ZriRle7oCFhwPwyGmLO7COqehhI2AILqKpqfbkkxbpowv74TDuPWbH5C70xPk4ye1PkvbiQBaFV9eDpmkgqaFsnQSzMDjSJ0tfXjK/joMHiSFXp7mSDOL23UdzRSGXoq/sitLmw04YjpWuLFVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TlvHGpZOpvYzy++73M9euBkNpNBz3AobeB7pWQJ4Gik=;
 b=VOC/WTBvaFv3YJ8M95mkqBpv9cUpElB65ODJ7zfBB8xVXrtc0+uAKK6SkKUGvhpTVBGHJvIfFzYsEUlY64D3fBj2FktgtF3Qobg1LFN1irr8IAGKDajA6MysPdgXjuBHSzHvxGoqmkWP4tDIh4N/6fKK5mKj7R/qCQFk6FnfniGHDp9UU3sNeKBjTqVHCTJ3hCmUUoprRiMBdE7W/rjQ5M8EANykbw+/ugnHYBsHfQERDHOwW8BwjfSo84v22ikSD6pHHNMX9nfHCDRPJ7VK2V2B8KYoK3dReluJdLB8Mq0wey/xC0m3a6RHwQA0+0dHfMRro9zLVY170nY2zzwQ5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TlvHGpZOpvYzy++73M9euBkNpNBz3AobeB7pWQJ4Gik=;
 b=vVSiJTO2ewdDi00V3204P3WstZwnVVqeog1Smbf3iMSX2/iSya1zxO2cvMqqevpOY6pdYZNsrBZXw0oakET+9SgEZ0NKFXYFV6lRvpLj10hZivsaYG5SZETMVWCTTEdHktBlO/UMVcmzlUfE3psfpDdubh/nLIp+SEDL13CFDmwoLoEcYQCcy/XLQPkvrL3j+b6Xs4hu40ceRoQVL4DDkynACLhOWrxleFyCNXpgmw3AQ6A4YrFg1ZBqHJ1OisGw8cPYopUHoMXc96TRKQ3eXX6iQgf9J1YtLaRN2vFPIX/y90zkthI9c23qJ4yveWUX1yAoyo6WNCsPDv58pqY0Ng==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by TY2PR06MB2797.apcprd06.prod.outlook.com (2603:1096:404:3f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Mon, 7 Feb
 2022 01:07:26 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::c4c2:84ad:81d1:e3e7]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::c4c2:84ad:81d1:e3e7%4]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 01:07:25 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Subject: RE: [PATCH] image: Control FIT signature verification at runtime
Thread-Topic: [PATCH] image: Control FIT signature verification at runtime
Thread-Index: AQHYFlSIUinVBpl/0EiKzu3l/osMz6yHSlSg
Date: Mon, 7 Feb 2022 01:07:25 +0000
Message-ID: <HK0PR06MB3779465E79CE71DEDB4F5633912C9@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20220131034147.106415-1-andrew@aj.id.au>
In-Reply-To: <20220131034147.106415-1-andrew@aj.id.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c1311b5-da0f-4967-30b9-08d9e9d63454
x-ms-traffictypediagnostic: TY2PR06MB2797:EE_
x-microsoft-antispam-prvs: <TY2PR06MB2797CB201562F3AFA6BF3B60912C9@TY2PR06MB2797.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FZE5oKpyfWze2znW1cV6a7mAtdJdySX8mvhIlS7sXvaRrWDjT8r60/aOj0qw/TYAXTrF93mvO/zj66J/gS+LcECTDUaoZjQ298s3u3iq7oETI5vd/2doVopQLKVpYB6/4d9CFA7BEqdeKVirk8WMAmS+Iji/EIL+4dxJ+RpZQJUD3b7KsFwvcPsC861O0pm0LTtRp1JvTO8t2R8JTfZAxujJbJ81cHh5f//1/CDjx1KUq/BeASwwBNBXgowHfwWS52KWsUkYB6d5wFChz9A9yF6YM3/NeLA8zdrmb2VpIwKsj5ly5l6G7/Qldu3shhYHCc1cEPMKMGvhEiPmEUI5MNhu8feI3OOgPBgtjxfENAIfYPX8OvUKz3+TTMh8to5qb+7RK1rxaqxj2tPBh7wd1ZQ/+XfxrAkOHgNFh2i5K9/F6QhXDqpnMbTT97QPLJv6uLmSXBK5x85z5sUseqMotcRSz18f5Js4YzyLPqrOQmbfFtiKdLFUja+CA6U8yYafJIIaqkZvx5ILID5jeQseFy1F8b3uA+0apZFr5fCjpy2dMmwepmibPl/kBEvBhZy+kJ+tQZ8Yt+Cm6YJ+a8mib6DxGg+gqkt/R8D+bAEyUcmDTZHq55ZG4H3vLS6uUlIS9tdVLIcN/G/QHVd6Nj04Q5IbTId30xI6eFc+Lwt/x8EmftF4wtc6ZEliFXzzFYzTO2hzLafheX4SqV868ZuLW+pVTEjx2WpHD4efunGTS1kEG4basFwcMU2GxATjvHYl2UjAcNBXgXWe1kV/VeX4YkzvbRNq4B00z84HFsNA03M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(396003)(346002)(376002)(39830400003)(136003)(366004)(66556008)(66476007)(64756008)(66446008)(55016003)(8676002)(2906002)(8936002)(66946007)(86362001)(76116006)(38070700005)(4326008)(52536014)(122000001)(38100700002)(508600001)(107886003)(15650500001)(83380400001)(7696005)(9686003)(6506007)(71200400001)(966005)(110136005)(26005)(186003)(54906003)(316002)(5660300002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUZzODJvcGZMUTNRM0FQTzBrREFUWFJaUnI3NTRtSWwyL1poaUlOa0trTyti?=
 =?utf-8?B?WTRSNCtZbC90ZUJDM1I5b1BFdlJsOW9GQWNJdW8wa0tjV3J1SGdOd3RyeUI0?=
 =?utf-8?B?NURoTXFmbUhDY0JUb00wY2ZmcVkzVWdsUHlCbm9OQVNPYi9QeVRGZ0l6aXVN?=
 =?utf-8?B?cXJwR1MvekNJMHYybTJZa0xYWmd0cHRBcG5aSUg2NlZKUjJsZzREM2d4MFZW?=
 =?utf-8?B?TFhGS1l3bXJuYnVJaHJFd2E3Ryt1MWQyMnA2UThKV1hqYmdRNyswd1RCRnhl?=
 =?utf-8?B?eGl5c1VuUUNpZWxoNCsrdC93citzME9iMWx4bUNaYktqVHBodGdab2ZPNlQw?=
 =?utf-8?B?cGFhRkRZZmQxRGc5WnB2VG44Si9haEhZSU9iY0pPUUxMYmRjYktoZm0vdWZX?=
 =?utf-8?B?TmNROEtHekdXSWY3WjJPVXhxN3liMVF5eGdhMWdUenR5VzNQcmR5RkdLc09V?=
 =?utf-8?B?cVEzeldkNzhQVnYrblZ3ZitNQWovQlZqNFA1WGFUTU5wMkQ3TTIxeFlwVDRs?=
 =?utf-8?B?RjhOZTlFNldTRktZMVhIQTJsaDBHS013bG83NEFJU2lvNnJFV01HaE5DTytW?=
 =?utf-8?B?SDJMam1oRE5CNmxyY2RXcUpMSWtUeHEzMGhSaXJlcjhoMFk3YmU3WU5icDM4?=
 =?utf-8?B?NmVzRmlCUU1IbzBaWWpvM3pPWnYxeG50SmN2djhHNUFXdUswbDNvT2hSZ1ZD?=
 =?utf-8?B?K09EZGNXaWhySk5rNFR1NGRJRm0rb1MvcEpKTnVwS09IdGlvcDJpUDRuWHRL?=
 =?utf-8?B?Qjc3V1U2dEtEQkgzakVJU3FaRll0RmJtaXpYT1ZWbzA3TkgxZzgrSVNUbFpu?=
 =?utf-8?B?N1gwbzk2MjlDTllpbmQ2NlAvRkx5ZnNDNHNNdjZRY2wvTm9WVU40WEI4azJ2?=
 =?utf-8?B?dVhmVFhwcmw3VTNoZkl2RUtzb212VGg3ckluWnYvSDRwMVJBbTNnQ0JUOExy?=
 =?utf-8?B?WmQwZ1U4Nkp0UVZwWEdQM2FkL2NXVXpsNUJNUmE0UVJ6S3k5bENKQU4vZTJY?=
 =?utf-8?B?ZERKOUozSExQUHdzUFhHTGNUWUpBc2VHT0oyZzJjZm5VUE5UUlFrRFBKcHJs?=
 =?utf-8?B?dWkyRHVrQjRDanh3TGFaT0xlTml6VzFlNVRJMlFJS05udkFBMGhxMUNQSjJm?=
 =?utf-8?B?QVYyZmlnanF1d0x3Y3Z0VEdtNzB2VWQ4TFU0YzlOTHlzNzBCWUt0NFpkaXYy?=
 =?utf-8?B?NENWY0FWZ1hkVjdGb3kyM1lYdkpHbytHQ3VhSkMzL00xNGx5R2RmSm9FclB6?=
 =?utf-8?B?QnNQTVF0d2V3RWNGK1VoZnB3cmxXWHBtYWdaZkYyUjg3SFp5b2svWmwvV0Iz?=
 =?utf-8?B?VlAzb0lHcVpsMURjeWFoYzJWODlsV2E4QkRxUzlCUGlhaEs0M24vSXdDY2Qv?=
 =?utf-8?B?WDQxaTF3UHJpck5MTlc0dHBrN3JMWlhtSWZMRFZ1bml2dHVGR2plaHpwN1d4?=
 =?utf-8?B?bE5CZkcrd0pscExnQmVqMzNrTlJEanhsNGl1Um16MHNOQnFaT0V1UGpoQmZY?=
 =?utf-8?B?Y2p3alBreXZTbWcwcTJtRVVxMmFDY1RIRFNNakF2UUM3WTBlbXZZU1JDVkRU?=
 =?utf-8?B?TElvTW42YmtIV1A4Y1h0dWFwSERwOFdPR1owMFhhTFRZbGNSTSt0THdsZVRO?=
 =?utf-8?B?VUtYZFRPdTMrNjJxQTlqUFRyVEVONmF0M3ZSdWUyWG9kK1ZudjFxWGl5YUt0?=
 =?utf-8?B?clBOMmVPMEZUVkFaa0xNZGxjUW9JT2NkWGJkeGMwZm9WQkdRczY5TTkxY0Vh?=
 =?utf-8?B?ejVnZ29ieE56VktpKzh0VjFIVldJNFB3c3FyQXpwUUZWeXNGN1dlU1ZoL29m?=
 =?utf-8?B?dzlHcUorZnNRNkhlY1VTMyt2NVRiTXBFTW00ZnZzcEVkOG1pb2pjbHpKTUls?=
 =?utf-8?B?V0JEaGpZdlFzK3IyMFMxZHpaV1ZueGxzSFB4Qmtjck9VZnA1M1hsVkRqeHRL?=
 =?utf-8?B?dXZ4MEs3Y2Nxbmw1MWpJbXpudnZmVjdabFpqU1M0WGRxeXIwWjBKQ3BBdmQx?=
 =?utf-8?B?aGd1aUx0Y2xXemZUWWpzWXZVUHNLc1k2ZW9EOVY4UldPRVpvcUIyUkVmRGNM?=
 =?utf-8?B?dHcrRnE4cmtzQ3I3RzdqM1lkbENjR08zc3p2TEFZY1JLU2xMVXA0bGhpOEw1?=
 =?utf-8?B?dkxIN2ZYYWV1TDhSd0VrQ1JNdElxbktXcDdraVRhYU5ULzBYZFZEa2JUaWx3?=
 =?utf-8?B?eHVzVXZrNWdyNnMxZllOQzBzUXZDNzhsa2RHOVRpMmEybkM1VHZnVmVNRlBH?=
 =?utf-8?B?Ylo3N1h6Sm5YcTN6czg5b2lxSDh3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c1311b5-da0f-4967-30b9-08d9e9d63454
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 01:07:25.9060 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p/bi32kYWaM7tGaL+l+u/4YLqaT4yOyB2jArPIrJmJihWykSt1UKZLfrzcBI8KsAvEyuWdKl7u7dnWHMUTIoufKkwZuS/LmtBxyWxaD6SSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR06MB2797
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
Cc: Johnny Huang <johnny_huang@aspeedtech.com>,
 "sjg@chromium.org" <sjg@chromium.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQW5kcmV3LA0KDQpJIGFtIGN1cmlvdXMgYWJvdXQgdGhlIHVzYWdlIHNjZW5hcmlvLg0KSXMg
dGhlIHJ1bnRpbWUgY29udHJvbCByZXF1aXJlZCBmb3IgcHJvZHVjdGlvbiByZWxlYXNlPw0KQXMg
dGhpcyBjb250cm9sIGFjdHMgbGlrZSBhIGJhY2tkb29yIHRvIGJ5cGFzcyB0aGUgY2hhaW4tb2Yt
dHJ1c3QuDQpJZiBpdCBpcyBmb3IgZGVidWdnaW5nL2RldmVsb3BtZW50IHB1cnBvc2VzLCBzaG91
bGQgd2UgZW5jb3VyYWdlIHRoZSB1c2Ugb2YgdW5zaWduZWQgaW1hZ2VzIHVuZGVyIFJEIGVudmly
b25tZW50cz8NCkJleW9uZCB0aGlzLCBJIGhhdmUgbm8gY29uY2VybiBhcyB0aGUgcGF0Y2ggcHJv
dmlkZXMgbW9yZSBmbGV4aWJpbGl0eS4NCg0KPiBGcm9tOiBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3
QGFqLmlkLmF1Pg0KPiBTZW50OiBNb25kYXksIEphbnVhcnkgMzEsIDIwMjIgMTE6NDIgQU0NCj4g
DQo+IFNvbWUgcGxhdGZvcm0gZGVzaWducyBpbmNsdWRlIHN1cHBvcnQgZm9yIGRpc2FibGluZyBz
ZWN1cmUtYm9vdCB2aWEgYSBqdW1wZXINCj4gb24gdGhlIGJvYXJkLiBTb21ldGltZXMgdGhpcyBj
b250cm9sIGNhbiBiZSBzZXBhcmF0ZSBmcm9tIHRoZSBtZWNoYW5pc20NCj4gZW5hYmxpbmcgdGhl
IHJvb3Qtb2YtdHJ1c3QgZm9yIHRoZSBwbGF0Zm9ybS4gQWRkIHN1cHBvcnQgZm9yIHRoaXMgbGF0
dGVyIHNjZW5hcmlvDQo+IGJ5IGFsbG93aW5nIGJvYXJkcyB0byBpbXBsZW1lbnQgYm9hcmRfZml0
X2ltYWdlX3JlcXVpcmVfdmVyZmllZCgpLCB3aGljaCBpcw0KPiB0aGVuIGludm9rZWQgaW4gdGhl
IHVzdWFsIEZJVCB2ZXJpZmljYXRpb24gcGF0aHMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXcgSmVmZmVyeSA8YW5kcmV3QGFqLmlkLmF1Pg0KPiAtLS0NCj4gSGksDQo+IA0KPiBUaGlzIHBh
dGNoIGlzIGV4dHJhY3RlZCBmcm9tIGFuZCBtb3RpdmF0ZWQgYnkgYSBzZXJpZXMgYWRkaW5nIHJ1
bi10aW1lIGNvbnRyb2wNCj4gb2YgRklUIHNpZ25hdHVyZSB2ZXJpZmljYXRpb24gdG8gdS1ib290
IGluIE9wZW5CTUM6DQo+IA0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vcGVuYm1jLzIwMjIw
MTMxMDEyNTM4LjczMDIxLTEtYW5kcmV3QGFqLmlkLmF1Lw0KPiANCj4gVW5mb3J0dW5hdGVseSB0
aGUgT3BlbkJNQyB1LWJvb3QgdHJlZSBpcyBxdWl0ZSBhIHdheSBiZWhpbmQgb24gdHJhY2tpbmcN
Cj4gdXBzdHJlYW0gYW5kIGNvbnRhaW5zIGEgYnVuY2ggb2Ygb3V0LW9mLXRyZWUgd29yayBhcyB3
ZWxsLiBBcyBzdWNoIEknbSBsb29raW5nDQo+IHRvIHVwc3RyZWFtIHRoZSBjb3VwbGUgb2YgY2hh
bmdlcyB0aGF0IG1ha2Ugc2Vuc2UgYWdhaW5zdCBtYXN0ZXIuDQo+IA0KPiBQbGVhc2UgdGFrZSBh
IGxvb2shDQo+IA0KPiBBbmRyZXcNCj4gDQo+ICBib290L0tjb25maWcgICAgIHwgIDggKysrKysr
KysNCj4gIGJvb3QvaW1hZ2UtZml0LmMgfCAyMSArKysrKysrKysrKysrKysrKy0tLS0gIGluY2x1
ZGUvaW1hZ2UuaCAgfCAgOQ0KPiArKysrKysrKysNCj4gIDMgZmlsZXMgY2hhbmdlZCwgMzQgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9ib290L0tjb25m
aWcgYi9ib290L0tjb25maWcgaW5kZXggYzhkNTkwNmNkMzA0Li5lYzQxMzE1MWZkNWENCj4gMTAw
NjQ0DQo+IC0tLSBhL2Jvb3QvS2NvbmZpZw0KPiArKysgYi9ib290L0tjb25maWcNCj4gQEAgLTc4
LDYgKzc4LDE0IEBAIGNvbmZpZyBGSVRfU0lHTkFUVVJFDQo+ICAJICBmb3JtYXQgc3VwcG9ydCBp
biB0aGlzIGNhc2UsIGVuYWJsZSBpdCB1c2luZw0KPiAgCSAgQ09ORklHX0xFR0FDWV9JTUFHRV9G
T1JNQVQuDQo+IA0KPiAraWYgRklUX1NJR05BVFVSRQ0KPiArY29uZmlnIEZJVF9SVU5USU1FX1NJ
R05BVFVSRQ0KPiArCWJvb2wgIkNvbnRyb2wgdmVyaWZpY2F0aW9uIG9mIEZJVCB1SW1hZ2VzIGF0
IHJ1bnRpbWUiDQo+ICsJaGVscA0KPiArCSAgVGhpcyBvcHRpb24gYWxsb3dzIGJvYXJkIHN1cHBv
cnQgdG8gZGlzYWJsZSB2ZXJpZmljYXRpb24gb2YNCj4gKwkgIHNpZ25hdHVyZXMgYXQgcnVudGlt
ZSwgZm9yIGV4YW1wbGUgdGhyb3VnaCB0aGUgc3RhdGUgb2YgYSBHUElPLg0KPiArZW5kaWYgIyBG
SVRfU0lHTkFUVVJFDQo+ICsNCg0KVXNpbmcgImRlcGVuZHMgb24iIG1pZ2h0IGJlIHByZWZlcnJl
ZCBmb3IgS2NvbmZpZyBkZXBlbmRlbmN5Lg0KDQpSZWdhcmRzLA0KQ2hpYXdlaQ0K
