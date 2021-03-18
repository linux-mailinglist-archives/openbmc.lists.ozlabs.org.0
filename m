Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A206340EDA
	for <lists+openbmc@lfdr.de>; Thu, 18 Mar 2021 21:10:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1dSV3N0hz3bvm
	for <lists+openbmc@lfdr.de>; Fri, 19 Mar 2021 07:10:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=wak0X8YF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=zhikui.ren@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=wak0X8YF; dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1dSC33Rgz30RT
 for <openbmc@lists.ozlabs.org>; Fri, 19 Mar 2021 07:10:35 +1100 (AEDT)
IronPort-SDR: JC7XDyBNaxaML67n6xylmLe+mAnocjBSzcKuNPC7g5YE7rEDr1hXtSuDsDin18ajKRj4BnBKOf
 +Fw00/BhZZDg==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="169056414"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="169056414"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 13:10:33 -0700
IronPort-SDR: wS6Z62wsZ4y3reg0SQvcYjBNsgtfv3F2zw2apSJLgMDvaxDEq+NRyA5bq2XV4kHHtkrRCUJQH5
 S7xoYtHL0NLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="379887856"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 18 Mar 2021 13:10:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 18 Mar 2021 13:10:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Thu, 18 Mar 2021 13:10:32 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Thu, 18 Mar 2021 13:10:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xz3SIuTxg5Qp+2fWMGgluYbJNlBuR4MMaYB8aJc/Y+3EeIOhiHONuccPJwWWh5Vas1ryenT0IgkVnhIuwzqY/2rcNk+uUCMP7Y/CWV3Qx/NLlixgPCDk7Lh7dV+Kc5E2ZBjfA/vGehNRMj7hmr9zy22h8H8TFswmE2oc3Sz8kWB0acxQnJDDn2eoslwa+xShf817XUShTUiyS05KlRr3OzhmG8YySjGeNN5PIbbxc82FYM3+T9067oCa1OVAjuJNY7S+0obcW01IznmztdGlQoXCwnpiuse0BK2hgowH4nXLgYv8qDXgxTv8Im70JA2BW6zYQviDY65J1JoslawH6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nR3HNZtytoIUpI4iKMVWYp9f4MaiMjEpbCWQENlYf2I=;
 b=XPHZ7DTpnr74Ai8PMqMdN1Blz2bjQkXbnBZx3eR/aFXB5ipz7tKhGWs0DJ8NZIq2TynmIUKScyntazTKICBjNIgDocZdVCYUtMwNcV7O9nnsZUVvuh6J/IiRsGtMTdnS+e7Z2cVErcjuyALDiG6b51ep8A6BNEgR+KhZgC+ptfqyd4DSKtTOiEsKanXVVXON2jgxB3yTXi8NXqfo0XlgLHx6q5af4XV37rnUVrPCOWIEn4QGvXWGDLoOUffkKFGCu0xHpI1feE6wNW07GOCdTjXu7Ne3GWFsOsHzEU+CXeEg8jIxvhkqUZ4gc2gdg0OR/mttRMaMJNTNzgMhukIEsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nR3HNZtytoIUpI4iKMVWYp9f4MaiMjEpbCWQENlYf2I=;
 b=wak0X8YFPmxNjDQhbXIcgAUS2eWWOrdTylm7lfVKeNRjfrFgiYzvrdR1isBV04sZVfC7XCUXwZBlRcRzblaUpxBIbvRq17yclcWJRFrQuDXmHeu1GziWiqms2sBKgDbTTBNT9SgpNeibbPDb9b0MHye4uupg3w7NlMn+zq8hKUg=
Received: from DM6PR11MB4410.namprd11.prod.outlook.com (2603:10b6:5:1d9::11)
 by DM5PR1101MB2137.namprd11.prod.outlook.com (2603:10b6:4:50::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 20:10:31 +0000
Received: from DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::d040:bf81:df34:7648]) by DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::d040:bf81:df34:7648%3]) with mapi id 15.20.3933.032; Thu, 18 Mar 2021
 20:10:31 +0000
From: "Ren, Zhikui" <zhikui.ren@intel.com>
To: "Ren, Zhikui" <zhikui.ren@intel.com>, Thang Nguyen
 <thang@os.amperecomputing.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: RE: Where to collect information for Redfish System's Processors,
 Storage, Memory data
Thread-Topic: Where to collect information for Redfish System's Processors,
 Storage, Memory data
Thread-Index: AQHXGk5bmpyzcDwpB02ckXa9+uLk8qqIkRgwgADOWACAAM/TUIAAAX0Q
Date: Thu, 18 Mar 2021 20:10:31 +0000
Message-ID: <DM6PR11MB4410DB8621A9D65B900FEC1B94699@DM6PR11MB4410.namprd11.prod.outlook.com>
References: <925a9eba-db8f-fba0-7d17-db32860c44ba@os.amperecomputing.com>
 <DM6PR11MB4410AB2F408E39757C2D38B1946A9@DM6PR11MB4410.namprd11.prod.outlook.com>
 <f5275c09-4eb8-fc19-520a-5c3d23a94235@os.amperecomputing.com>
 <DM6PR11MB44106F3A52B2949ACA9950C594699@DM6PR11MB4410.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB44106F3A52B2949ACA9950C594699@DM6PR11MB4410.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.11.44.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3954d381-a22e-47d1-a6af-08d8ea49e1c5
x-ms-traffictypediagnostic: DM5PR1101MB2137:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1101MB21373469B30887C1A6D498F994699@DM5PR1101MB2137.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uwoupothzpNDrQI0bBG5HFJMypi4Pr2Fc5hTkvJzuPHDgpA2rf7kG3WapaNRvsyfijgF5Ce+q0OMaf9iFYjd81NiWdQ64qt80hsvBIEeY0ykhxGrf5/xrqSXOHVtSbfuIRHGWQZQBjOfOhwU73sN2Pq82pSonBU4SYUMCfldKYod5axD+eBEtzZpUUrHpIq0ttXQd6HlyW872ErDyK++aDFfO5dP0GnrFxUrAvR6dnUthAFQ54T1HR9+rSCngMaMqHgeFDng2cFizoHE1PHfxrAqaCCYKVb5wfOIb0fWG5mXhe7oixP7g12Wffdonvm6RlZ8v8f1AYIb7k3RopI2O/1l0d7i3prZuGCMceSdWq42S5LNBhFz67h7uhlz2uxGPHJ/fiWQrXy+pVTpiK0Ub+jhZmprOeUXx4u79AqlHjmoUT+cQxpj71ABJX8B5LJb4Q1JkzwdII3BoDOpPM+DlkXgXDfZlKs3z+gjStUYL9S39R4VlwIZIcKlJiPrI0kkZhwkEX0X3+R2VwtjMubzKjWhelSYeNbs9KmkRkjJaEgY1Us3fjIE3Bunjx5HaKxpnAFr9iXQLSfeE8qsLS0Qg8x56o4zE9qdvngATKHnkQeXrCLGsF7CtS7aam+iZd03HBoTzzJ4F0n56PcxHWNk4dZ4DOPF1KeKvXoYppYvYBA4Ls3SuKX8iL42Ck8xsPRR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(136003)(366004)(396003)(39860400002)(7696005)(33656002)(2940100002)(66446008)(2906002)(64756008)(8936002)(53546011)(8676002)(19627235002)(86362001)(55016002)(5660300002)(83380400001)(186003)(38100700001)(110136005)(478600001)(316002)(9686003)(71200400001)(26005)(66476007)(52536014)(76116006)(6506007)(966005)(66946007)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?VEhGOTNsVmhCVENhMUpkbTZ0dm9DMS90S3hINVJtQ0FaZVhhSHFkK3E2RXFk?=
 =?utf-8?B?RlNKTHlHQWRFQWwrQ3F3Ri9kUzZmaDhsellwMXZ0bEhhdS9GNUZ2dFpIQW9m?=
 =?utf-8?B?TDN0T2lLdHdrcTA0RW4za1FDdXpLbndkVVJEMWZjeExKLzV2UEdWYVhHc3VP?=
 =?utf-8?B?UWpDcWx0OVZkWXdHM203cGk4SkQvalRqNUFDQUtDMUI0YTNFTzBULzRFOUhi?=
 =?utf-8?B?cjQzdFNrRTRCLzNmK2IzRU5jckdpZ1BSRG5lVlNEaFpMUVVTQm9aTFNhTFVQ?=
 =?utf-8?B?YXNZT0prbTFzZVJXYW04OGpvSWlWRm02Nm5TZ29pdnU3ZTk3ZmVHc1U1VnNB?=
 =?utf-8?B?N0IyV3hvczJ0aEc2aWRUUXNCNXRIWEZ5MG1hSVVkTGlPRENISSt6a1dOR0JH?=
 =?utf-8?B?ZElTWExRNngzOVg1WTNjT1pOK3Q5M3hTTzJKblRkYy9lTmplb25nVXVLWll4?=
 =?utf-8?B?eEpYK3MwaDUvRHhGZW5wQi9BeFBCc1FWQlBBaDhJM3NCbTUzWkZONnIrVW5n?=
 =?utf-8?B?L1laQUpoNFExSVg0SGhkN0xaUzUyVHo1TDg2N2phY1BpMmhHaUdCR3RlNm1z?=
 =?utf-8?B?R3hEMG9HYnJZL2hvM1RyaHdaRmwwYXVwYU9YMmxVRjVKY0lXMkZmcmpsVVJv?=
 =?utf-8?B?SzN5YWYwaE5rdHFEbmVXNjUzRWxvRHJPSmNMdUdaeTcxVTVqekxpM0lJM3ox?=
 =?utf-8?B?M2ZBakg0NHl6Z1FydUlNNzY2dFFVcTUwSnFiNkE3QS9UVkxic3hldTdxU2Rj?=
 =?utf-8?B?WHpPNDdlNVBGVVpyeml4QWJ2Ukt3Mm9RMndiMGtWdEJIb3NCUWVTSERLSGJE?=
 =?utf-8?B?eFphNE9FSGcyaDd5QzQ0UnlKaXRZMmE3R0N2bUFSM0c1QVVvaTBQbnl6TGtp?=
 =?utf-8?B?WVZYOHg0S1NiMFowUm5EcjUyNEdsNDA2QmFsQjNWK0E1WUZpM2oxbTY5Mnl4?=
 =?utf-8?B?OE9sWWt4ZFlwTzNYTHNGTkIrQWVLdkZoeVlrMDlUbWp4SU9UbzUrdnVOaWYy?=
 =?utf-8?B?RENhSUxpUjVjT0phb3BFcUYzbEl2ZVBuODNyTXJhMTUxYklUb3RUSk9CaXdT?=
 =?utf-8?B?WTJtdGJvc0FQdVNZZGVUMjRMeEg5MGlzZE5BcjJPcnRHQ0ZEajA4TERiay93?=
 =?utf-8?B?NkQ1UHhlUDhTN2tHV2FjWERJNndPakI3di9ialllZ3BmNldNRStudGE4blhs?=
 =?utf-8?B?bTNGazZCWkVjNkNteEpmMDgveC8rVzdJNG9Wd0g4SkVCSVAxYW9YV3czSWxW?=
 =?utf-8?B?YWJhbG5MM2w3bnptRE1YenAyQW5VdzNLbTlKRXVkVlZaUTZsQmxNbU0zdEdN?=
 =?utf-8?B?NmJjSXg4c0N2dlJLUjk2Z2xXWXJTZHBEamF5MTBUWjN6VjlOa3FRcmVWTVBr?=
 =?utf-8?B?ZWJuZGtWZ3R0R2JJVXpGUFhoYXgvb1Z1dlFFY3lqZXVEOGNzOXVkM2MyMHpK?=
 =?utf-8?B?enBieGRZZ0d1Z3VUZW9sVjg5VjQ2VEVNZjBqV2Q3Nmh2aXQ1eDFPekRJM2N3?=
 =?utf-8?B?emMwcHIvYWlTR2ZvWnFGZHJuTU9YeldTbWtKWnBZR2hKOGFJbThoRWdFVCtv?=
 =?utf-8?B?ZGJSNFRRcFJBODA5SXJweVY0cW8yQkpYMjNTRnB5NVZaZEl5dzVJNGZNbkE5?=
 =?utf-8?B?SW5VK1VZZVpQR24zdzFyWFRGV1F0TTlTVElaL0tNOXVMcUZyTFdvVU82OE1t?=
 =?utf-8?B?cjlpN0NCTUVDZEptdzNPczU4bURlVG0xWHd2cDlCU2gvVmJEWlhTUDROUjZB?=
 =?utf-8?Q?032rBak3nmfYqO3uOE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3954d381-a22e-47d1-a6af-08d8ea49e1c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2021 20:10:31.3574 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UaASVrC22evhdUWaoyoFeJcODdWuNegm8j3Ztq8szOq6QcwRimTP/lvBQv48Zq/+EaTTgz0I0ytLYtwXuLu91g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2137
X-OriginatorOrg: intel.com
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

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IG9wZW5ibWMgPG9wZW5ibWMt
Ym91bmNlcyt6aGlrdWkucmVuPWludGVsLmNvbUBsaXN0cy5vemxhYnMub3JnPg0KPk9uIEJlaGFs
ZiBPZiBSZW4sIFpoaWt1aQ0KPlNlbnQ6IFRodXJzZGF5LCBNYXJjaCAxOCwgMjAyMSAxOjA5IFBN
DQo+VG86IFRoYW5nIE5ndXllbiA8dGhhbmdAb3MuYW1wZXJlY29tcHV0aW5nLmNvbT47IE9wZW5C
TUMgTWFpbGxpc3QNCj48b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KPlN1YmplY3Q6IFJFOiBX
aGVyZSB0byBjb2xsZWN0IGluZm9ybWF0aW9uIGZvciBSZWRmaXNoIFN5c3RlbSdzIFByb2Nlc3Nv
cnMsDQo+U3RvcmFnZSwgTWVtb3J5IGRhdGENCj4NCj4NCj4NCj4+LS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4+RnJvbTogVGhhbmcgTmd1eWVuIDx0aGFuZ0Bvcy5hbXBlcmVjb21wdXRpbmcu
Y29tPg0KPj5TZW50OiBUaHVyc2RheSwgTWFyY2ggMTgsIDIwMjEgMTI6NDEgQU0NCj4+VG86IFJl
biwgWmhpa3VpIDx6aGlrdWkucmVuQGludGVsLmNvbT47IE9wZW5CTUMgTWFpbGxpc3QNCj4+PG9w
ZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NCj4+U3ViamVjdDogUmU6IFdoZXJlIHRvIGNvbGxlY3Qg
aW5mb3JtYXRpb24gZm9yIFJlZGZpc2ggU3lzdGVtJ3MNCj4+UHJvY2Vzc29ycywgU3RvcmFnZSwg
TWVtb3J5IGRhdGENCj4+DQo+Pg0KPj5PbiAxOC8wMy8yMDIxIDAyOjI2LCBSZW4sIFpoaWt1aSB3
cm90ZToNCj4+Pg0KPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4+PiBGcm9tOiBv
cGVuYm1jIDxvcGVuYm1jLQ0KPj5ib3VuY2VzK3poaWt1aS5yZW49aW50ZWwuY29tQGxpc3RzLm96
bGFicy5vcmc+DQo+Pj4+IE9uIEJlaGFsZiBPZiBUaGFuZyBOZ3V5ZW4NCj4+Pj4gU2VudDogVHVl
c2RheSwgTWFyY2ggMTYsIDIwMjEgMzoyMiBBTQ0KPj4+PiBUbzogT3BlbkJNQyBNYWlsbGlzdCA8
b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KPj4+PiBTdWJqZWN0OiBXaGVyZSB0byBjb2xsZWN0
IGluZm9ybWF0aW9uIGZvciBSZWRmaXNoIFN5c3RlbSdzDQo+Pj4+IFByb2Nlc3NvcnMsIFN0b3Jh
Z2UsIE1lbW9yeSBkYXRhDQo+Pj4+DQo+Pj4+IEhpLA0KPj4+Pg0KPj4+PiBJIGFtIGxvb2tpbmcg
Zm9yIGhvdyB0byBzdXBwb3J0IFJlZGZpc2ggU3lzdGVtIHNjaGVtYSB3aGljaA0KPj4+PiBpbmZv
cm1hdGlvbg0KPj4+ID5mcm9tIEhvc3Q6DQo+Pj4+IC0gUHJvY2Vzc29yczogcmVkZmlzaC92MS9T
eXN0ZW1zL3N5c3RlbS9Qcm9jZXNzb3JzDQo+Pj4+DQo+Pj4+IC0gU3RvcmFnZTogcmVkZmlzaC92
MS9TeXN0ZW1zL3N5c3RlbS9TdG9yYWdlDQo+Pj4+DQo+Pj4+IC0gTWVtb3J5OiByZWRmaXNoL3Yx
L1N5c3RlbXMvc3lzdGVtL01lbW9yeQ0KPj4+Pg0KPj4+PiBJIGxvb2tlZCBpbnRvIHRoZSBibWN3
ZWIgcmVwb3NpdG9yeSBhdCByZWRmaXNoLWNvcmUvbGliL21lbW9yeS5ocHANCj4+Pj4gYW5kIHJl
ZGZpc2gtY29yZS9saWIvcGNpZS5ocHAgYnV0IGp1c3Qgc2VlIGRvR2V0KCkgZnVuY3Rpb24gdG8g
cmVhZA0KPj4+PiBkYXRhIGZyb20gZGJ1cyB0byByZXBvcnQgdmlhIFJlZGZpc2guIFRoZXJlIGlz
IG5vIGRvUG9zdCgpIGZ1bmN0aW9uDQo+Pj4+IHRvIHBvc3QgY29kZXMgdG8gUmVkZmlzaC4NCj4+
Pj4NCj4+Pj4gTXkgcXVlc3Rpb25zIGFyZToNCj4+Pj4NCj4+Pj4gMS4gSG93IGNhbiBIb3N0IEJJ
T1MgY29sbGVjdCBpbmZvcm1hdGlvbiBhbmQgc2VuZCB0byBCTUMgc28gdGhhdCBCTUMNCj4+Pj4g
Y2FuIHJlcG9ydCB2aWEgUmVkZmlzaD8gdmlhIGluLWJhbmQgUmVkZmlzaD8NCj4+Pj4NCj4+Pj4g
Mi4gSWYgdGhlIGluZm9ybWF0aW9uIGlzIG5vdCBmcm9tIEJJT1MsIGhvdyBjYW4gQk1DIGNvbGxl
Y3QgaW5mb3JtYXRpb24/DQo+Pj4+IFdoYXQgcmVjaXBlcy9yZXBvc2l0b3JpZXMgYXJlIHVzZWQg
dG8gY29sbGVjdCBpbmZvcm1hdGlvbj8NCj4+Pj4NCj4+PiBbUmVuLCBaaGlrdWldIGh0dHBzOi8v
Z2l0aHViLmNvbS9vcGVuYm1jL3NtYmlvcy1tZHIgaXMgdGhlIHNlcnZpY2UNCj4+PiB0aGF0IHBv
cHVsYXRlcyBkYnVzIG9iamVjdHMNCj4+DQo+PltUaGFuZ10gVGhhbmtzIGZvciB5b3VyIGluZm9y
bWF0aW9uLiBCdXQgSSBkb24ndCBzZWUgYW55IG1ldGEtKiB1c2UNCj4+c21iaW9zLSBtZHIuIEhv
dyBjYW4gT3BlbkJNQyBnZXQgU01CSU9TIGluZm9ybWF0aW9uPw0KPj4NCj4+RG8gd2UgbmVlZCB0
byBpbXBsZW1lbnQgSVBNSSBPRU0gb3Igc29tZXRoaW5nIGxpa2UgdGhhdCB0byBzZW5kIGRhdGEg
dG8NCj4+Qk1DPw0KPj4NCj5bUmVuLCBaaGlrdWldIEkgc2F3IGFub3RoZXIgcHJvcG9zYWwgZm9y
IGFkZGluZyBQT1NUIGFuZCBQQVRDSCBpbiByZWRmaXNoIGluIGENCj5kaWZmZXJlbnQgdGhyZWFk
Lg0KPkZvciBjb21wbGV0ZW5lc3Mgb2YgaW5mb3JtYXRpb24sIGhlcmUgaXMgdGhlIGV4aXN0aW5n
IElQTUkgaGFuZGxlciBpbiBpbnRlbC0NCj5pcG1pLW9lbToNCj5odHRwczovL2dpdGh1Yi5jb20v
b3BlbmJtYy9pbnRlbC1pcG1pLQ0KPm9lbS9ibG9iL21hc3Rlci9zcmMvc21iaW9zaGFuZGxlci5j
cHANCltSZW4sIFpoaWt1aV0gQW5kIGZvciBNRFJWMiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJt
Yy9pbnRlbC1pcG1pLW9lbS9ibG9iL21hc3Rlci9zcmMvc21iaW9zbWRydjJoYW5kbGVyLmNwcA0K
Pg0KPj5BbmQgVUVGSSAoRURLMikgY29sbGVjdHMgU01CSU9TIGRhdGEgYW5kIHNlbmQgdG8gQk1D
IG92ZXIgSVBNST8NCj4+DQo+Pj4+IFRoYW5rcywNCj4+Pj4NCj4+Pj4gVGhhbmcgUS4gTmd1eWVu
IC0NCg==
