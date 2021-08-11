Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 940293E9530
	for <lists+openbmc@lfdr.de>; Wed, 11 Aug 2021 18:00:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlF0V3qKWz2yNG
	for <lists+openbmc@lfdr.de>; Thu, 12 Aug 2021 02:00:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=d47Limyz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=zhikui.ren@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=d47Limyz; dkim-atps=neutral
X-Greylist: delayed 125 seconds by postgrey-1.36 at boromir;
 Thu, 12 Aug 2021 02:00:18 AEST
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlF0217Xlz2y6C
 for <openbmc@lists.ozlabs.org>; Thu, 12 Aug 2021 02:00:17 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10073"; a="215137365"
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; d="scan'208";a="215137365"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2021 08:57:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; d="scan'208";a="445998033"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 11 Aug 2021 08:57:03 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 11 Aug 2021 08:57:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 11 Aug 2021 08:57:02 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 11 Aug 2021 08:57:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NXaNHONg2TKswVFX7Rr68XSvsJwCPp55Mb+qdY7pt5tzEAoXOBpiDiKPDQRz6gUm9hFASGKEU6yQrZpaKa95dF7ok3GcPNKbSxhEJXCL7mpwIgTeAvgphLTtkTz2GZU+cN6YGT75vPcXpwozupKjyTiQATavihgvQX1UtVsR0wpimgRCe2kOow2B5Wj7wcELZQ9FylQGPnGpcxcZpvbwn+IrmJ9QT5S4sc+shSlurUj7KSiuGqv5LomWRb2mzXFljd0MVcPYJJfHbNJQVvFNYIuYkiqHipWodSSzxn0yzICTdqNCRx3eOvqdXEsee9WPar9QlVqvZw0AUehx3HwjLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTCFpwIrzGuXeU68PVNKJmX01Q3X/sqUsbKJTWLp490=;
 b=fSKeAVC8vHcY/w/IqPFuPWSSCJJnK7707u1EvXx/QaTiIhuH63I2QmoayOxlGgf5O6LiATcQXBSyhSxhY2XDFrjM1+PJ1m7yGEJvHq4YBCq65nfBWKs2uJLoG2Ey//ixlIJw5ObeAfCxGjQDOoFI7q0DxpKgKeG1PykNLcFeuKaMUD/ZW2AxMr35u9cCq8nEj1gTCj22QuW54uPJKwbbULnHrbqSj5JHV1UpwxzDkpsqot9LhdxfXVKTZ7IiKunHp3GVXFQQltwh0jIsKJBjXzYMpldGcn6xR7NlhdMFrbYSqabHg3ns9qIfGqjJ7i2/M3gr9O0rfgKJPKnSuLrY2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTCFpwIrzGuXeU68PVNKJmX01Q3X/sqUsbKJTWLp490=;
 b=d47LimyzZ6nPW/zKdu4Y2btlY8xduldkiJVfCwmfN5Ex6a/sxzNV71DTXmsCuy2vBb3UmvELRVEV4qrB7AkutUcXRpqLcHBtXZeKu9h/vp3H+/dpDuckjRSbf7xho9sN4pafyYih1zfW411fYX0oi0zFhxFflwGReEDgG+lVL4o=
Received: from DM6PR11MB4410.namprd11.prod.outlook.com (2603:10b6:5:1d9::11)
 by DM5PR11MB2027.namprd11.prod.outlook.com (2603:10b6:3:a::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.15; Wed, 11 Aug 2021 15:57:02 +0000
Received: from DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::b0bd:9d01:a28c:6367]) by DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::b0bd:9d01:a28c:6367%7]) with mapi id 15.20.4415.015; Wed, 11 Aug 2021
 15:57:01 +0000
From: "Ren, Zhikui" <zhikui.ren@intel.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Requesting maintainer privilege on smbios-mdr repo
Thread-Topic: Requesting maintainer privilege on smbios-mdr repo
Thread-Index: AQHXiWkPZL3+puWnNkanGmwsTdFmw6tk43AAgAA5kICACWI7wA==
Date: Wed, 11 Aug 2021 15:57:01 +0000
Message-ID: <DM6PR11MB44103299FE530EF7125E728194F89@DM6PR11MB4410.namprd11.prod.outlook.com>
References: <59d36746-4a19-025b-1a43-9ec2bde0307c@linux.intel.com>
 <056b270e73e030377e175b1a79f1aefb841d6780.camel@fuzziesquirrel.com>
 <d57f2680-e196-eb4b-bb80-5ba5f8a9d81c@linux.intel.com>
In-Reply-To: <d57f2680-e196-eb4b-bb80-5ba5f8a9d81c@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 130001cd-cdbc-483a-bae3-08d95ce0a88c
x-ms-traffictypediagnostic: DM5PR11MB2027:
x-microsoft-antispam-prvs: <DM5PR11MB2027E21CDE1FE34D11AF562394F89@DM5PR11MB2027.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KEb5M4P06XproWaWRIZAJmcgr9dHwTNV+g5NShmrBTlcaIbPxcTSlaH1aA464gWVvMbYUOnj5ukfbbeS2aHG0CTR91EHX8DZDB3zSM2+Gx1X0POoaKp6G62Z04zcDo+Aj5bmFeRfrVRAGSMItUYKWxShQCJvI6d9x6PS0tG5BQqCJSnDJYNmbjkT5rhMSY6hJsocxtxvOkW6uduPMAAv9dYRoXgDIx4rnJ55jgDLO0F6Ex7N+2tNbrXlwHBY1oER0cFYNwb9djWutZLIPcC4Sg9XTl7CPV8IY9iricRwEy796zoyzXLwAkHVShTabuP899AMv//JwKLVnsXdSE/gpmTQBJV3+oiR0rqEQipQX3dXSCkd31hImRMUmXHzvXX9kCZjqAnfbQ1fAnD+miLZ2AHnmhmzN9+HS6DVYxG5tS5Nh2+sUygg5u/BRU91QTV+Q3Sh2o/XCKVriGGgTnOXKzDUendm8sBGLU/NhA4I3InQ8BOz6LDDghLqKGCwuVVIjjrjaIR8Pt4ivZHj+XNfTKdUj1o9znKLP+GjRf0SdYw1uRKyIni1LulQEIi29Ga1CDMqptCdTVhpXEeiJhf3mipsmkkYen0lqat4S/YRiS2IzxiZOjdWe5yHx1ylziyYD2ytq6cNQ80KIYpIMLh8QgusltForFNnZ9yIw6QbfyavqX4o5IAfk/BAV5Ux+L6ZmkzVvsFHiZ6+NwXahslMTQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(110136005)(316002)(83380400001)(7696005)(478600001)(64756008)(66476007)(66556008)(86362001)(33656002)(66446008)(66946007)(122000001)(8936002)(71200400001)(76116006)(52536014)(5660300002)(38100700002)(186003)(2906002)(8676002)(4744005)(6506007)(9686003)(26005)(38070700005)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MTJ6MjVIcElob25GU2QyZGFyNXA4ODF5MkhnMmszMUljcXNpdnhxQWFHMTd0?=
 =?utf-8?B?QUJ0dkJXNE9xSHFrazJjc0dsMU9ndlBCbktER2xSaEt3Ujg2QkRJdm1Jbnhw?=
 =?utf-8?B?b2RCSFFJWkhPVXJLR0xIV0c0QTVlTUVwK3RKUVZpT0NwZ2ZWV2RGanVqY2p3?=
 =?utf-8?B?YmFtTnJVWDBCQjJwVlRQRG04MEtVZzdIbGJEZ2VZWnFVSncra0R5c0pUcVUw?=
 =?utf-8?B?TXhGeXNFUkdxaVNOSUlTcjFJUmdyMmw3N2ViYTRkb0pVcWVGTzFpTE9HY2xo?=
 =?utf-8?B?VHFnRzh5NnpLdGFSWkN6UHpxL2lCazNGVGZoa0gzVnBVYmhYdWlVaEtyTW5x?=
 =?utf-8?B?L1FWTzlEcTdRZmQxVk9HRFQ2a3ZkRTNIZytNTmpwSXd0eTNMUnVydGhEcXB2?=
 =?utf-8?B?NTg5OS9STllYZDRhTk1CUk5RSUMrTnBNQzd5ZWNJWUllYkMycXR0MlQrOFJu?=
 =?utf-8?B?ZFVFR3RFcHFWY2hVWm02TXROQmY3N2ZWSVRmUGVqWTRHYlJCRy9raFNMbFQ4?=
 =?utf-8?B?RHBpOVZIM0xQYnphOHZ5QStzSEVNS0tYVVBVNGNhY0c1KzFMQjNqY2lnelBw?=
 =?utf-8?B?M3RmUWtZRVJTNnpYUWZhZFIyVEZhTHhZZHZMZHFzdzhCbVphR3Y0d2FBZ0Er?=
 =?utf-8?B?Q2tTanNZdFF6cENJYUFSTXRFSEY3SWJjcXMwa0ZvSENGd2dodHpSOWl1U0pt?=
 =?utf-8?B?cmNNUFh4Q2Y1S2FzTVoyQ1NwenhSdmR6TGxrMWtsSDc1ZnhCanBGUDgvNlJR?=
 =?utf-8?B?M1FwOFpGWDVqRGVpK3BBcnk3MkZvMVVYeitTVVhMSktwS3VvZG9HZGs5V21Q?=
 =?utf-8?B?b3lRV21rWVA5OVRYY1FYUG12Z2FxdmVBYU1meERTT3lFZmJKRlhQQktib0tq?=
 =?utf-8?B?dTErS0dxZHZxVzVaSlhlM2k3QlZXbEZETlhKZWtlQzl6ejcwZTVHanp3Y051?=
 =?utf-8?B?emdkczJHUmVPNU1MNlhxV0l0cUd0a3dkTmhlVEZoOE5DVlpzUkRvaCtiaVA4?=
 =?utf-8?B?N0xid3ZjankvZC9laDZHUURrWkkvYSt2VndoUjNoTnUzUjZNL3FJWlhEZG9T?=
 =?utf-8?B?Ui9OTHhCc1NzZVRycHNzUHNZY3pTWm9mNE9zVysrZHkxYUp4Z3hTR2NONUZ6?=
 =?utf-8?B?dFVZSFJmL0F3SGNyTTBkRzN6dVpFMTdkc1IvR2VzWUt6MDExbFV1S3Zid0kv?=
 =?utf-8?B?UGZkY1VLV3lWSkdBU3ZaREdIK2QyU0VDZmZJNkRDcklKVkhEcFhxYi84c2dZ?=
 =?utf-8?B?M3BTWHU2M1Nja29XU0ZMdUZ6RUxlRUtvamo3VDBxV0V0VzlkVUtpRnB2UUxj?=
 =?utf-8?B?d3ByTVBrYndqUEtDanpWejN1NDRwbUNIZHdDK3g0QVp1REIzRTBQOTg4Y2pU?=
 =?utf-8?B?U2tEd0N3R3lHWExlbVFWMzVkM3E4Rmd6bGoxYlcyNnpqMWYzczY5RTRyK3pF?=
 =?utf-8?B?cThFVUpnejc0UE9KNDhRRFVML1BRVkw2OEVhVUs4YnAzczRhaHlCRXAwd21Y?=
 =?utf-8?B?OGhjNkRyYjlUQlZaSG9jbytzT2oxbkU1NjJaZjEzL1Y4eTM2cUVDdm81NGFM?=
 =?utf-8?B?S21aQy9rclVaSG95bXUyUW9kNm5BYjRiZjIwU1MyRWZ0TkJ3Q0pVK0ZlK0FE?=
 =?utf-8?B?Y3NiKzViNlc2ZEppejZ1TXJ5V1JHSUp6MkI5WU5ZQnVWc1RUZ3pvSzczTmhh?=
 =?utf-8?B?MzdOYm12b2JveXZLdEc2Z1JkNnJUcVRORlRjS2NJS1NvaWhSSVlPejJveDVi?=
 =?utf-8?Q?eiECx2JBLDTMI4XoZk=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 130001cd-cdbc-483a-bae3-08d95ce0a88c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2021 15:57:01.9011 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FJWCK0qU2fvdimtKaykqmonub2ULKm0ylBi2VmoQViZuwKMtieTeEQ7/xHJmd1/lOFFSO6WTxEfIEulxzhQWyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB2027
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
ZiBPZiBCaWxscywgSmFzb24gTQ0KPlNlbnQ6IFRodXJzZGF5LCBBdWd1c3QgNSwgMjAyMSA5OjM2
IEFNDQo+VG86IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KPlN1YmplY3Q6IFJlOiBSZXF1ZXN0
aW5nIG1haW50YWluZXIgcHJpdmlsZWdlIG9uIHNtYmlvcy1tZHIgcmVwbw0KPg0KPg0KPg0KPk9u
IDgvNS8yMDIxIDc6MDkgQU0sIEJyYWQgQmlzaG9wIHdyb3RlOg0KPj4gT24gV2VkLCAyMDIxLTA4
LTA0IGF0IDEzOjQyIC0wNjAwLCBCaWxscywgSmFzb24gTSB3cm90ZToNCj4+Pg0KPj4+IERvIHlv
dSBoYXZlIHBlcm1pc3Npb25zIHRvIGFkZCBtZSB0byB0aGUgbGlzdCwgc28gSSBjYW4gdXBkYXRl
IGl0DQo+Pj4gd2l0aCB0aGUgbmV3IG1haW50YWluZXJzIGZyb20gSW50ZWw/DQo+Pg0KPj4gRG9u
ZSEgIEkgaG9wZSB0aGUgZXhpc3RpbmcgbWFpbnRhaW5lcnMgYXJlIG9rIHdpdGggaXQuLi4NCj5U
aGFua3MhDQo+DQo+SSBwbGFuIHRvIHVwZGF0ZSB0aGUgbGlzdCB0byBtYXRjaCB0aGUgTUFJTlRB
SU5FUlMgZmlsZSBpbiB0aGUgc21iaW9zLW1kcg0KPnJlcG8sIHNvIGV2ZXJ5dGhpbmcgc2hvdWxk
IGJlIGluIGxpbmUgd2l0aCB3aGF0IGlzIGFscmVhZHkgYXBwcm92ZWQgaW4gY29kZQ0KPnJldmll
dyAoaW5jbHVkaW5nIHJlbW92aW5nIG15c2VsZiBvbmNlIGV2ZXJ5dGhpbmcgaXMgd29ya2luZyA6
KSkuDQo+DQpbUmVuLCBaaGlrdWldIEJyYWQsIGNhbiB5b3UgcGxlYXNlIGFkZCBtZSB0byB0aGUg
T3BlbkJNQyBvcmdhbml6YXRpb24gZmlyc3Qgc28gdGhhdCBJIGNhbiBiZSBhZGRlZCBhcyBzbWJp
b3MtbWRyIG1haW50YWluZXI/DQpUaGFua3MhIA0KPj4NCj4+IC1icmFkDQo+Pg0K
