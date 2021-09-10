Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 973BA406617
	for <lists+openbmc@lfdr.de>; Fri, 10 Sep 2021 05:24:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5Lnx31Pgz2yPJ
	for <lists+openbmc@lfdr.de>; Fri, 10 Sep 2021 13:24:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=znbwGTym;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.103;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=znbwGTym; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320103.outbound.protection.outlook.com [40.107.132.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5LnL2nlVz2yJN;
 Fri, 10 Sep 2021 13:23:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ARqJO6e0aC4J0rwIYjcq2NL8/wAtHwb0CDQ0IHgrxU17008fUkDEXXAefuN/MvIkI4AmNH1rg+ZxEpJdPE5u5sj6d+LLxq9/Rtp/c880/Npdg/HYUfDgayFVrgWq0bQ2N1le/E+38q9nhlC/UWHB5TqOqZ3O2sCgUDEDlgyBxCxttZdFimesaCx444znhmRGWFPuPpf1yqAu3Dj8giXs0Jay0iKYduEsKJrAT1rR+/bKGvdwzUelm8xfAEsJiX0PMTZsKtQ/HX4mcjS9WNRI79gPFYjdIjIZX4BWbpTVkVZlezujDXpqCZDqQ63Ufiat8NBtsZhMudJVTPHWzNkpcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=duthfyX4n6WTV2PAe2UnOysVMY/AWFS8z90CjP9bdTM=;
 b=WY7cSusip0QjNTygEnhCh8uXtdY8ndRfjZ/akmy1sBMI7xxAOgDBIL/ysWJW+dmrOjBUddJyBye8OeYRpOFpMRtziFAtjhFTIFNdQS2T7KB75TpNIpxnkrIukKsQEJ74EB+76YV6AviyV+R5R1Gynyp3nTjCh8juANjcWJPIly4qNormTNB5JHhjZJW1bANi94nLJrA1xiheWHQ0S7m0nyYJcD2oLVxqxT6TEdhQb/YHCZfmAWXCvkgyghoLyToyxva9nMQisZHM/K0CVPmi8W8Idt64F+iwuzoCI1XdMlxpvcIXnjCvi/N+ZbHgSf+6Gp9raTOmh+qo1G+cGjeV/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duthfyX4n6WTV2PAe2UnOysVMY/AWFS8z90CjP9bdTM=;
 b=znbwGTymt9ajgvGRm3HVRLpTJexxpwJtnhQUfFcz8MW/bvhvRJwBpghHQ7whzeD0dzTHdoMn3IKJzu98lCU7aos2rzpOX8wixftlbrlf7gXxIQRjHXuYoaVCY313rTlK6lj2x4HJ7faQ1B1+WBZFrzHhtEZ23rrRwi7vcIRGBZh7+aKWV98z8i1QvzIxTuWyui4KLzui2mJWRiZ6FSSeE8LmVSgqu6DTAY6ROHWdy1GqQiOVHZsFpQdAf4O4iGL19AB8SPhGvclyaKP3LWhinIxXwqcUt1K4PRHbEGKRaNZFovwxUcn1SjIXE1xoUFRRcMUBgCP1+Zs9idR2cz3/fg==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK2PR06MB3250.apcprd06.prod.outlook.com (2603:1096:202:31::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Fri, 10 Sep
 2021 03:23:26 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::4c26:6668:f551:3a62]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::4c26:6668:f551:3a62%3]) with mapi id 15.20.4457.026; Fri, 10 Sep 2021
 03:23:26 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au"
 <andrew@aj.id.au>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 3/4] soc: aspeed: Add eSPI driver
Thread-Topic: [PATCH v4 3/4] soc: aspeed: Add eSPI driver
Thread-Index: AQHXnuHnLi9FHqbUxUOpf9SHGgAkS6uQF7yAgAAhRlCAABrbgIAF1b0AgAAz3gCAA0V20IABWhCAgAGaNcA=
Date: Fri, 10 Sep 2021 03:23:26 +0000
Message-ID: <HK0PR06MB37793C268FEB0E33A5547D0791D69@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210901033015.910-1-chiawei_wang@aspeedtech.com>
 <20210901033015.910-4-chiawei_wang@aspeedtech.com>
 <20c13b9bb023091758cac3a07fb4037b7d796578.camel@codeconstruct.com.au>
 <HK0PR06MB37792273A075533C2570002391CE9@HK0PR06MB3779.apcprd06.prod.outlook.com>
 <513cb05f8d83d08a5c1e491dc0a9b6784195e7dd.camel@codeconstruct.com.au>
 <HK0PR06MB37799C48533B084CF864E49D91D29@HK0PR06MB3779.apcprd06.prod.outlook.com>
 <6593206c0bc90186f255c6ea86339576576f70dc.camel@codeconstruct.com.au>
 <HK0PR06MB377924CFCBFE9BD40E1C4A5D91D49@HK0PR06MB3779.apcprd06.prod.outlook.com>
 <9fa4ae962c185e0e4f07f0299356969c17ae5ea5.camel@codeconstruct.com.au>
In-Reply-To: <9fa4ae962c185e0e4f07f0299356969c17ae5ea5.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeconstruct.com.au; dkim=none (message not signed)
 header.d=none;codeconstruct.com.au; dmarc=none action=none
 header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 524c79ba-ed4a-48fa-98b8-08d9740a5a79
x-ms-traffictypediagnostic: HK2PR06MB3250:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR06MB32501FF0964A01E6B9740E1591D69@HK2PR06MB3250.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 82fgsjaoy9mPZ25ibacUdv3/lIdExg95Nc3sCPPKXL2WAupLlyQCoAD/yRyPi/+secS5dh6NemZ/bCo+0RDZRanvSOdwmmBp0DknTQtWmTzbiBj28rDN4aiNW8Nf5pOVWYN51UxdE27fMiHc07Tf3eZrurs3FdqCZHjZlDDTmhvrNLFf2qIlqA/CITd3/50NNlAnslQO5fTgvnDCq7Rv9yGmjd/a3yqg2FR/tt4aKbcz8ld9uJv7UfVkUltCvpIMpncGDh1+l8mG7j9E2qeRsN3hbTfnZTMnybkJfiW9VrNBJ+DFHik7sSHFl9g9HqJ5CMkF0IsiUCp80cQ8oksGt3IFsVsi4fubWbWRovStL0v/LQZ4h/hbPgynLxZkAJWsMeK+xX/3tj6+KM1X2uNkzOxzyo6OpuF+o8fvOmuxyrMp1sdOb0VdUzXwuACLj7I7338c4Z5Hw/I7cq2x5GBIJv1t+Vvlr7WMeBRKls+tmKyCRR1T2MwKT+z9IOotfA8GmRhS/8ke20I1X17dpSS3GvKjahr3XAgssUkn2E0rk9EswKRmpZuUqzzZwuUlL6fQeTK+Vumq6PIJgFa8elEWTthcpWEauKStlZq8u7t65PXVEfMWBupiJyyYhjxuFH0xh8uFr1ymkCrn47fkaq2KpOOz/om+pcwY9xvsAKYy9e4HMFAX4AqtBbwp4ug90+IhjUlbu3jPLQ8PJLUzOvuqTQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(346002)(376002)(136003)(396003)(366004)(71200400001)(478600001)(86362001)(33656002)(83380400001)(316002)(54906003)(2906002)(38100700002)(122000001)(38070700005)(26005)(66446008)(52536014)(4326008)(5660300002)(55016002)(66476007)(66946007)(7696005)(66556008)(64756008)(76116006)(107886003)(8936002)(6506007)(110136005)(186003)(8676002)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TlNxck1vaHZXRGgxYys4SkwvTW9ZcjVUd0graWdEV2Mvblpqa0RtQytVN3VP?=
 =?utf-8?B?MzNRcCtsZ0VzZlRsdk9JSFAzVWN0YzdaakVuL2hhM0RUdWNYcUZQeHAvdG5G?=
 =?utf-8?B?NWZIUWNLWUZEWVUySUZ1NklLanRQaitjWDljYVNKbWYwZExuanRyMmxmVWNO?=
 =?utf-8?B?YTJISitJV3BySGZkZk1ORG9yS0FrclBGcEhEZFF0UjVWSjU5N3BBa0habXFB?=
 =?utf-8?B?cWNlb2hrNDlZL1lKdlNpTHg0eVloOFFnS3MycmlhYTBMaW8wR1JmZGVBS2pZ?=
 =?utf-8?B?SlJsM1hNR0dpdERRbXRMdHVnNS9aYjhjcFYwK0xIOVpQL2lZSDltK3Job1kw?=
 =?utf-8?B?bHh1SHovWjZ4S2xzY25TRmwwTmcvSTJXUFUzMUFaVkNlTFVaUm9hdFZHcjVn?=
 =?utf-8?B?NFkrM3d2WDgxNFU2bVZJY0VPWTdaZkt6ZXFVT2NhYklPeXFhdGV2WlU4aFhy?=
 =?utf-8?B?OHpjOC9kajB3L2pYTytMSFpJc1FkbzFnT3FiTFBTT2J4N0pTNkJyWTErMDhB?=
 =?utf-8?B?R3oxRGRBYVNzUmJRRHpxb1doM0ROa0NYNDVzSC93Sjl6bFVqdGxjMHJhZXN1?=
 =?utf-8?B?b3R5Smw5UVM1WVZtdkdyU3pFbThzQmZmeWpEOFJwNEZzbitjcURvTjNSUVQ3?=
 =?utf-8?B?RHozRlBSV3Z3ejZyWmtGMUp1OWRMUThtMlBsdjBDZTVFaVpnYlN4dFBsWmdL?=
 =?utf-8?B?Yk1GWDI3VllwNGZrbWp2ditQb1ROS1lJM2VxQU11RjZjcWpzb3dYT1FIUFlp?=
 =?utf-8?B?ckZQMTRVekJQY25jRlZSUll3KzJhT09rdVBRYmtqdk9oMjNmYVNNeDBiRElR?=
 =?utf-8?B?R2JRc2RFZER4SVl2YTBMMFM3Sm5lQlZ3K2swck9oSC9nYlFhQm5MOVRFSkw5?=
 =?utf-8?B?VFQrc2RIVDlyS0Zyb21iMGNLL1VzRzdkLzhOMEhpVzBlVlBnS2Y0YmhGQnhJ?=
 =?utf-8?B?T2JXUUxpOU5ZMGdhU0dSVXFFQXpmejFwd1BEL1hsRHpQSkJld3pWK2hUOG1a?=
 =?utf-8?B?Wk5qN0ZwNlZQcHpTNnVzRko1ZU9iWE9qbWY1RG9YRHJUVmlHM0NBTXZsakFi?=
 =?utf-8?B?bUxwOElubk5NcVIxZERDdElWYzdVYkI1THJWemg1YVVJQmxHa24xSjZsRGMz?=
 =?utf-8?B?TGh4dFdJSkxuQkpzVDhzcFozUzlYV0wvREtwejhPRlJab2NGRjZLTktndFQr?=
 =?utf-8?B?RDNYclVxeTdVUUpGanRXM20yd0lhY01mNkpYbTVpbGk4WFpYTDFGQVZIU0dD?=
 =?utf-8?B?SUZvSUNPOHZrWEpJcm9VTVF1VnVYQnVGaHpET2NwUDJvLy9wSUtwQ0ZMNFJj?=
 =?utf-8?B?Mys4aUpZY0RMWGlKQzJzYlltckpKb2ViN0Q3c1JWNVQzNzVZdDhZZWpNN3ZT?=
 =?utf-8?B?d1dKTHRWajdvR1RWWlRnMEo5ekxNcm5VOStab29RbGYwTDhSeFUvcTRHMXNr?=
 =?utf-8?B?MzQ0emV4T3lSckdvUEtKSUN5WjJzM2w3M0RyejZ4SElzZ2RzaERvOVBOMXU4?=
 =?utf-8?B?Q1NYWUFvaGVHazM1dXI5QmR1c3dtc1Mwa0VIa1lWNkU5bTdPSFQ1bkNFY091?=
 =?utf-8?B?SEFvWDNFY2h5Ny9WSFJTbFkyc0lQOHdGN2EyaFZJV0EyOFk0V3lwcjNYS2dy?=
 =?utf-8?B?d1cwYm80V0krYWVibFJRcEkrU0k5NzhNMzgxVjdjWVRJR2xtaWtJZHFHZnY4?=
 =?utf-8?B?dUl0NlBOOTgwTmJKZjNoZWN6TFFROGcyOEFTR1YzaFpEWGZPZkpzazZDNHY3?=
 =?utf-8?Q?GP+Jl+lVpqPzbAa6TkbLTGq/su9ZqR8n9ScSvJC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 524c79ba-ed4a-48fa-98b8-08d9740a5a79
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 03:23:26.4280 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sCTQBI9032WGLsa9++jaLV5D6/WfanDTRxfkZaELUiKWOb+up6ls4EvrHpONRa/egICr+Qgv07wIUHrbCZYhunPwkW0E1UlOibMFryfOcYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3250
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
Cc: Morris Mao <morris_mao@aspeedtech.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgSmVyZW15LA0KDQo+IEZyb206IEplcmVteSBLZXJyIDxqa0Bjb2RlY29uc3RydWN0LmNvbS5h
dT4NCj4gU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciA5LCAyMDIxIDk6NTMgQU0NCj4gIA0KPiA+
IFllcywgdGhlcmUgaXMgc2VjdXJpdHkgY29uY2VybiB1c2luZyBIVyBtb2RlLg0KPiA+IE91ciBk
ZXNpZ25lciBpcyBjb25zaWRlcmluZyB0byByZW1vdmUgdGhlIEhXIG1vZGUgc3VwcG9ydCBpbiB0
aGUgbmV4dA0KPiA+IGdlbmVyYXRpb24gb2YgQXNwZWVkIFNvQ3MuDQo+ID4gU28gZmFyIHdlIGhh
dmVuJ3QgZW5jb3VudGVyZWQgYSBzY2VuYXJpbyBkZW1hbmRpbmcgSFcgbW9kZS4NCj4gDQo+IEdy
ZWF0IHRvIGhlYXIgOikgY2FuIHdlIHVuY29uZGl0aW9uYWxseSBzZXQgRVNQSTAwMFs5XSBpbiB0
aGUgZHJpdmVyIHRoZW4/DQoNClllcyBmb3IgdGhlIHY1IHJldmlzaW9uLiBBcyBIVyBtb2RlIGlz
IGdvaW5nIHRvIGJlIGVsaW1pbmF0ZWQgaW4gdGhlIGZ1dHVyZS4NCkEgYnJpZWYgZXhwbGFuYXRp
b24gd2lsbCBhbHNvIGJlIGFkZGVkLg0KDQo+IA0KPiA+ID4gV2l0aCB0aGFuIGluIG1pbmQsIGlm
IHdlJ3JlIGRpc2FibGluZyBoYXJkd2FyZSBtb2RlIC0gd2hhdCBkb2VzIHRoZQ0KPiA+ID4gZGly
ZWN0aW9uIGNvbnRyb2wgc2V0dGluZyBlZmZlY3Qgd2hlbiB3ZSdyZSBpbiBzb2Z0d2FyZSBtb2Rl
DQo+ID4gPiAoRVNQSUNUUkxbOV0gPT0gMSk/IERvZXMgaXQgZXZlbiBtYXR0ZXI/DQo+ID4NCj4g
PiBZZXMsIHRoZSBkaXJlY3Rpb24gbWF0dGVycyBldmVuIGluIFNXIG1vZGUuDQo+ID4gV2hlbiB0
aGUgZGlyZWN0aW9uIGlzICdtYXN0ZXItdG8tc2xhdmUnIGFuZCB0aGUgR1BJTyB2YWx1ZSBpcyB1
cGRhdGVkDQo+ID4gYnkgdGhlIEhvc3QgdGhyb3VnaCBQVVRfVlcsIGEgVlcgaW50ZXJydXB0IGlz
IHRyaWdnZXIgdG8gbm90aWZ5IEJNQy4NCj4gPiBGb3IgdGhlICdzbGF2ZS10by1tYXN0ZXInIEdQ
SU8sIGEgYWxlcnQgaXMgZ2VuZXJhdGVkIHRvIG5vdGlmeSB0aGUNCj4gPiBIb3N0IHRvIGlzc3Vl
IEdFVF9WVyBmb3IgdGhlIEdQSU8gdmFsdWUgdXBkYXRlZCBieSB0aGUgQk1DIGJ5IEVTUEkwOUMu
DQo+IA0KPiBPSywgYnV0IHRoZSBkYXRhc2hlZXQgbWVudGlvbnMgdGhhdCBFU1BJQ0ZHODA0IGlz
IG9ubHkgYXBwbGljYWJsZSB3aGVuDQo+IEVTUEkwMDBbOV0gPSAwLCBvciBpcyB0aGF0IG5vdCB0
aGUgY2FzZT8NCg0KWWVzLCBFU1BJQ0ZHODA0IGlzIGFwcGxpY2FibGUgb25seSBvbiBIVyBtb2Rl
IChFU1BJMDAwWzldPTApLg0KV2hlbiB0aGUgSFcgbW9kZSBpcyBzZWxlY3RlZCwgdGhlIGVTUEkg
c2xhdmUgZm9yd2FyZHMgR1BJTyB1cGRhdGUgaW4gUFVUX1ZXIHBhY2tldCBzZW50IGJ5IHRoZSBI
b3N0IHRvIHRoZSBwaHlzaWNhbCBHUElPIGJhc2VkIG9uIHRoZSBFU1BJQ0ZHODA0IG1hcHBpbmcu
DQpUaGlzIGlzIHB1cmVseSBkb25lIGJ5IEhXLiBObyBpbnRlcnJ1cHRzIHdpbGwgYmUgZ2VuZXJh
dGVkIHRvIG5vdGlmeSBTVy4NCg0KPiANCj4gQnV0IGJhc2VkIG9uIHdoYXQgeW91J3ZlIHNhaWQ6
IHllcywgaXQgc291bmRzIGxpa2UgdGhlIGdlbmVyaWMgZ3Bpb2RldiBwYXJ0cw0KPiB3b24ndCBi
ZSB1c2VmdWwgZm9yIHRoaXMuDQo+IA0KPiA+ID4gU2VwYXJhdGUgZnJvbSB0aGlzOiBJJ20gYWxz
byBwcm9wb3NpbmcgdGhhdCB3ZSByZXByZXNlbnQgdGhlIHN5c3RlbQ0KPiA+ID4gZXZlbnQgVldz
IGFzIGdwaW9kZXZzIGFzIHdlbGwuDQo+ID4gPg0KPiA+ID4gPiBBIHJhdyBwYWNrZXQsIHByaW1p
dGl2ZSBpbnRlcmZhY2Ugc2hvdWxkIGhhdmUgYmV0dGVyIGZsZXhpYmlsaXR5DQo+ID4gPiA+IHRv
IG1hbmFnZSBNQ1RQIHBhY2tldHMgb3ZlciB0aGUgT09CIGNoYW5uZWwuDQo+ID4gPg0KPiA+ID4g
T0ssIGxldCBtZSBwaHJhc2UgdGhpcyBkaWZmZXJlbnRseTogY2FuIHRoZSBPT0IgY2hhbm5lbCBi
ZSB1c2VkIGZvcg0KPiA+ID4gYW55dGhpbmcgb3RoZXIgdGhhbiBTTUJ1cyBtZXNzYWdpbmc/IElz
IGl0IHVzZWZ1bCB0byBwcm92aWRlIGFuDQo+ID4gPiBpbnRlcmZhY2UgdGhhdCBpc24ndCBhIHN0
YW5kYXJkIFNNQnVzL2kyYyBkZXZpY2U/DQo+ID4NCj4gPiBZZXMsIHRoZSBQQ0ggc3BlYy4gYWxz
byBkZWZpbmVzIHR3byBhZGRpdGlvbmFsIHBhY2tldCBmb3JtYXQgZm9yIGFuDQo+ID4gZVNQSSBz
bGF2ZSB0byByZXRyaWV2ZSBQQ0ggVGVtcGVyYXR1cmUgRGF0YSBhbmQgUlRDIHRpbWUuDQo+ID4g
SXQgc2hvdWxkIGJlIHRyaXZpYWwgdG8gcHJlcGFyZSBhIGJ5dGUgYnVmZmVyIGluIHRoYXQgZm9y
bWF0IGFuZCBzZW5kDQo+ID4gaXQgdGhyb3VnaCB0aGUgcmF3IHBhY2tldCBpbnRlcmZhY2UuDQo+
IA0KPiBPSywgdW5kZXJzdG9vZC4NCj4gDQo+ID4gPiBJZiB5b3UgbmVlZCBjdXN0b20gdWFwaSBk
ZWZpbml0aW9ucyBmb3IgdGhpcyBkcml2ZXIsIHRoYXQgbWlnaHQgYmUNCj4gPiA+IG9rYXksIGJ1
dCBpdCdzIGdvaW5nIHRvIGJlIG1vcmUgd29yayBmb3IgeW91ICh0byBkZWZpbmUgYW4gaW50ZXJm
YWNlDQo+ID4gPiB0aGF0IGNhbiBiZSBzdXBwb3J0ZWQgbG9uZy10ZXJtKSwgcmF0aGVyIHRoYW4g
dXNpbmcgc3RhbmRhcmQNCj4gPiA+IGluZnJhc3RydWN0dXJlIHRoYXQgYWxyZWFkeSBleGlzdHMu
DQo+ID4NCj4gPiBUaHVzIEkgc3VnZ2VzdGVkIHRoYXQgd2UgY2FuIHJlZmVyIHRvIHRoZSBJUE1J
IEtDUyBCTUMgZHJpdmVyLCB3aGljaA0KPiA+IHN1cHBvcnRzIHRoZSBzZWxlY3Rpb24gb2YgZGlm
ZmVyZW50IHVzZXIgaW50ZXJmYWNlcywgUkFXIG9yIElQTUkuDQo+IA0KPiBZZXAsIGJ1dCB0aGUg
S0NTICJyYXciIHJlZ2lzdGVyIHNldCBpcyBzdGFuZGFyZGlzZWQgYXMgcGFydCBvZiB0aGUgSVBN
SSBzcGVjIHRvbywNCj4gd2hpY2ggaGVscHMgdG8gZGVmaW5lIGEgc3RhYmxlIHVzZXIgQVBJLiBX
ZSBkb24ndCBoYXZlIHRoYXQgaW4gdGhpcyBjYXNlLg0KPiANCj4gT3ZlcmFsbCB0aG91Z2gsIGlm
IHlvdSB3YW50IHRvIHN0YXJ0IHdpdGggdGhlICJsb3ctbGV2ZWwiIEFQSSwgdGhlbiBpbnRyb2R1
Y2UNCj4gImVuaGFuY2VkIiBmdW5jdGlvbmFsaXR5IC0gbGlrZSBhbiBhY3R1YWwgU01CdXMgZHJp
dmVyIC0gYWxvbmdzaWRlIHRoYXQsIHRoZW4NCj4gdGhhdCBzb3VuZHMgbGlrZSBhbiBPSyBhcHBy
b2FjaC4NCj4gDQo+ID4gSWYgSU9DVEwgaXMgY29uc2lkZXJlZCB0byBiZSBub3QgdXNlciBmcmll
bmRseSBvciBtYWdpYyBjb2RlDQo+ID4gcG9sbHV0aW5nLCBmaWxlLWJhc2VkIHJlYWQvd3JpdGUg
b24gdGhlIG1pc2NkZXZpY2Ugbm9kZSBpcyBhbHNvIGFuDQo+ID4gb3B0aW9uLg0KPiANCj4gSXQn
cyBub3QgcmVhbGx5IG15IGRlY2lzaW9uIHRvIG1ha2UsIGJ1dCBhIHJlYWQvd3JpdGUgZXZlbnQg
aW50ZXJmYWNlIHdvdWxkDQo+IHNlZW0gdG8gYmUgbW9yZSBjb25zaXN0ZW50IHRvIG1lLiBJcyB0
aGVyZSBhbiBvYnZpb3VzIGV2ZW50IGZvcm1hdCB0aGF0IHdvdWxkDQo+IGJlIGNvbW1vbiBhY3Jv
c3MgYWxsIGNoYW5uZWxzLCBwZXJoYXBzPyBXZSdkIHByb2JhYmx5IGFsc28gbmVlZCBhIHBvbGwg
dG9vIC0NCj4gdG8gbWFrZSB1c2Ugb2YgaW5jb21pbmcgZXZlbnRzLCBsaWtlIG1hc3Rlci10by1z
bGF2ZSBWVyBjaGFuZ2VzLCBwZXJoYXBzPw0KDQpBIGZpbGUtYmFzZWQgcmVhZC93cml0ZS9wb2xs
IGludGVyZmFjZSBpcyBPSyB0byBtZSBhcyB3ZWxsLiBUaGUgbWFpbiBjb25jZXJuIGlzIGFib3V0
IHRoZSBwZXJpcGhlcmFsIGFuZCB0aGUgVlcgY2hhbm5lbHMuDQpGb3IgdGhlIHBlcmlwaGVyYWwg
Y2hhbm5lbCwgaXQgdGFrZXMgdHdvIG1pc2NkZXZpY2UgdG8gZXhwb3J0IFRYL1JYIGludGVyZmFj
ZXMgZm9yIHBvc3RlZCBhbmQgbm9uLXBvc3RlZCBwYWNrZXRzLCByZXNwZWN0aXZlbHkuDQpBbmQg
Zm9yIHRoZSBWVyBjaGFubmVsLCB0aGUgc2V0dGluZ3MgR1BJTyBkaXJlY3Rpb24gaXMgUk8gYW5k
IHRoYXQgb2YgR1BJTyB2YWx1ZSBpcyBSVy4gQW5kIHRoZXNlIHR3byBzaG91bGQgYmUgZXhwb3J0
ZWQgaW5kaXZpZHVhbGx5Lg0K
