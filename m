Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F386E23340B
	for <lists+openbmc@lfdr.de>; Thu, 30 Jul 2020 16:13:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHXSl2yzczDr8r
	for <lists+openbmc@lfdr.de>; Fri, 31 Jul 2020 00:13:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=203.18.50.4; helo=nat-hk.nvidia.com;
 envelope-from=vasantp@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHXRF4F1CzDr3j
 for <openbmc@lists.ozlabs.org>; Fri, 31 Jul 2020 00:12:07 +1000 (AEST)
Received: from hkpgpgate101.nvidia.com (Not Verified[10.18.92.100]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f22d52d0000>; Thu, 30 Jul 2020 22:11:57 +0800
Received: from HKMAIL102.nvidia.com ([10.18.16.11])
 by hkpgpgate101.nvidia.com (PGP Universal service);
 Thu, 30 Jul 2020 07:11:57 -0700
X-PGP-Universal: processed;
 by hkpgpgate101.nvidia.com on Thu, 30 Jul 2020 07:11:57 -0700
Received: from HKMAIL101.nvidia.com (10.18.16.10) by HKMAIL102.nvidia.com
 (10.18.16.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Jul
 2020 14:11:57 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (104.47.44.58) by
 HKMAIL101.nvidia.com (10.18.16.10) with Microsoft SMTP Server (TLS)
 id
 15.0.1473.3 via Frontend Transport; Thu, 30 Jul 2020 14:11:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kk/LDLywMXyrFQVXuEVZCe3KhXskvYKE4io8CdVIfiSGQIqzqNjsLXFBvuT3f2LYAfsmyQwCVCZf2gfzDnn56wplpnTtbajfuoS8T+i8qbNYTC4ew/QUVTCo+A14ZRf/ziSo0njkLluRqzGeWt0heu7ie+DIWOfgK+YAc7DZY8Tdi9Wl/fzWpYPZRSVUWKG72c/iADovR2mfnyO09KFznk+cNoezOKU55n0NOAbORBHAHlKfGyXRSfei25e5SrvGbjQqAc+AaOgOosxFihpFy7XtMshhVBQDGicUKw7SHHlA6VSDiJhACaaIte17XvtzRnlu3bzJzTtk+NO98eR8bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T278ZhkgcW6CmGpEI3z0HOfLfo48tkFdYi7DWzCa7gk=;
 b=ht7cMof/rjrFL0mdtCR8ScQOa6FrzLWxcslWoNXYJKLsxWsOfdVaAgeFdeiF1FuEqeIOd4JdsFq+n0b/Lc4N8c2S6b/B8M/UzdjOdTRQpoaP9XlN8hUpw02tIsDhgVPpjCcWdRPJ7VWG1Qr1cAs6UFcJAPGZKNoUUlzAyvG8Ye2+7QpK5RYMiPxDbHjJOqfc8Ns9SFcQFwIO9PVXI1B4w3Nel0GkriLbPWp16iJKhZknL7yz+/Dqt8so0wN0jYo3qHM/kLuyTdVo+2TTkydRPjlgJpjwtXpwRCoevb1Np/KYg5Ufh+AFIIG+StCeqRC4Fm+LrHV/aqj4GOoFQ91Y/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BN8PR12MB3282.namprd12.prod.outlook.com (2603:10b6:408:9e::27)
 by BN7PR12MB2593.namprd12.prod.outlook.com (2603:10b6:408:25::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 30 Jul
 2020 14:11:54 +0000
Received: from BN8PR12MB3282.namprd12.prod.outlook.com
 ([fe80::84fe:6445:1fd5:c099]) by BN8PR12MB3282.namprd12.prod.outlook.com
 ([fe80::84fe:6445:1fd5:c099%5]) with mapi id 15.20.3239.018; Thu, 30 Jul 2020
 14:11:54 +0000
From: Vasant Patil <vasantp@nvidia.com>
To: Ed Tanous <ed@tanous.net>
Subject: RE: OpenBMC : FRU Inventory management
Thread-Topic: OpenBMC : FRU Inventory management
Thread-Index: AQHWZizoIjaYHXtiJkymNgdA8fkjfKkgJcQQ
Date: Thu, 30 Jul 2020 14:11:54 +0000
Message-ID: <BN8PR12MB3282084F0B5902233EED0DCFC7710@BN8PR12MB3282.namprd12.prod.outlook.com>
References: <BN8PR12MB32822ADFBBC19F6B2FB08F52C7710@BN8PR12MB3282.namprd12.prod.outlook.com>
 <CACWQX82K5mx94PtBQDp1nA-arnxkUxn65kAgNOcb4_3NMyO=Qw@mail.gmail.com>
In-Reply-To: <CACWQX82K5mx94PtBQDp1nA-arnxkUxn65kAgNOcb4_3NMyO=Qw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: tanous.net; dkim=none (message not signed)
 header.d=none;tanous.net; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [24.112.224.16]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5be1e241-8190-4478-47c1-08d83492834b
x-ms-traffictypediagnostic: BN7PR12MB2593:
x-microsoft-antispam-prvs: <BN7PR12MB2593F43B50CA38E5B22055A1C7710@BN7PR12MB2593.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eHR+nq+19gTa4YchvcMabw+aleQR62owWyhfGEA3n8j73eWE6vt38/m218w6HL0zhjGirhOVNCij7qN/ZmFT5RT10FW40ovxqkXXt08tls0ql+o4dxvO2p4EqGij+yVl/Rroq5qkAra7d2Rb8aXbVH6X3a3Q5/qpJsT2GEz/+mZonAiw/TlJITzq9Fa229ydvbVWqqEtW1rGSxxY3Bqar3H0I3/QiL+9E+wNhJ3kjsiPHFX/qb8zd6RU3pc0U2AHjrvuzU9HhaSp5YnSKZB+Lt01vjMw5CZVTdy6BtM4iRHnHcKsTXOEMRYSawh4p9b/WKW9dTAsilcwesuFxQ7LTirYcvPfEV/OZIjl4ToRmTgagFIpt7dwMFWlarNRzrc22bI9Pl8M4esrJT3q3iQ7LQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3282.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(71200400001)(86362001)(6916009)(26005)(9686003)(8676002)(8936002)(186003)(478600001)(2906002)(4326008)(64756008)(53546011)(33656002)(6506007)(66556008)(5660300002)(52536014)(76116006)(66446008)(316002)(55016002)(66946007)(7696005)(83380400001)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: eNZSYZ+ghJ20HUiIIZWHmI31cXA04q1KeaUww/wZG+ykfSAKbwPyD6WDmznYsKiy1pBcclL9xcCTT9piUn6yG3MPgTAfgR++5caNKc49h8Agd3FuxO69oqQulzRErH00WqgPxzhaP32i3BcYYW6x+tvnzctaetgXTttZbHvZKZXw5yRYig0GhhRVHATGzX4LTnRVn7AczB0tQJG7uN2CuLoPHFnc8bF4N1iEGQb+pz6AZol3DQRjrJbUfthj17VabOOUXMhtp8oMtCb5627yWKWni3oKW6X8SGpf5fyF7qDw2bw0D6uAEH1UNz05JfN6PvySbGl5VlhUT3guqKzp55l4QGH9R+L/YiLk8rhl/gNaEk/TUoC6EQAAfM6fhMCut6T5CJsWgOeNDBYw5OOcPwpaDTrCwMTDD+EuEvcOvWPCvzEae5LQdQuTk0RgR2V76D36xa1MIZWcCpXizSClzy5FK1v/xoYyYsRJy1BSsFg=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3282.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be1e241-8190-4478-47c1-08d83492834b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2020 14:11:54.3824 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rVN8Wt63WWh4CyebhT8FjSqn23/ZwQAIY1JhyBGr3GzJJOIoBZAQZE71upS8E6NqtGh0EevI6z13lYDYAu+SPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2593
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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

VGhhbmtzIEVkISBSZXBseSBpbmxpbmUuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpG
cm9tOiBFZCBUYW5vdXMgPGVkQHRhbm91cy5uZXQ+IA0KU2VudDogVGh1cnNkYXksIEp1bHkgMzAs
IDIwMjAgMTI6NTAgQU0NClRvOiBWYXNhbnQgUGF0aWwgPHZhc2FudHBAbnZpZGlhLmNvbT4NCkNj
OiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNClN1YmplY3Q6IFJlOiBPcGVuQk1DIDogRlJVIElu
dmVudG9yeSBtYW5hZ2VtZW50DQoNCkV4dGVybmFsIGVtYWlsOiBVc2UgY2F1dGlvbiBvcGVuaW5n
IGxpbmtzIG9yIGF0dGFjaG1lbnRzDQoNCg0KT24gV2VkLCBKdWwgMjksIDIwMjAgYXQgODoxNCBQ
TSBWYXNhbnQgUGF0aWwgPHZhc2FudHBAbnZpZGlhLmNvbT4gd3JvdGU6DQo+DQo+DQo+IFdlIGFy
ZSBlbmFibGluZyBPcGVuQk1DIG9uIHg4NiBzeXN0ZW0uIFdlIHdvdWxkIGxpa2UgdG8ga25vdyB0
aGUgcmVjb21tZW5kYXRpb24gb24gRlJVIGludmVudG9yeSBtYW5hZ2VtZW50IGFuZCBjb3JyZXNw
b25kaW5nIHBvaW50ZXJzLg0KPg0KPiBUaGVyZSBzZWVtcyB0byBiZSBtdWx0aXBsZSBvcHRpb25z
IGF2YWlsYWJsZQ0KPg0KPiBkZXNjcmliZWQgaW4gIOKAnEFkZGluZyBuZXcgc3lzdGVtIHRvIE9w
ZW5CTUPigJ0gd2l0aCAgWWFtbCBmaWxlcyANCj4gKG1ldGEtcm9tdWx1cy9yZWNpcGVzLXBob3Nw
aG9yL2lwbWkpDQo+IEVudGl0eSBtYW5hZ2VyICB3aXRoIEpTT04gc2NoZW1hDQo+DQo+IFdlIGFy
ZSBsb29raW5nIHRvIGVuYWJsZSBiZWxvdyBpbnZlbnRvcnkgKEJvdGggRlJVIGFuZCBub24tRlJV
KToNCj4NCj4gQ1BVDQo+IERJTU0NCj4gTS4yDQo+IFUuMg0KPiBNb3RoZXJib2FyZCBGUlUgRUVQ
Uk9NDQo+IENoYXNzaXMgRlJVIEVFUFJPTQ0KPiBBZGQtb24gUENJIGNhcmRzDQo+IEZBTnMNCj4g
UFNVDQo+IEV0Yy4NCj4NCj4NCg0KSSdtIGNodWNrbGluZyB0byBteXNlbGYgYSBsaXR0bGUgYml0
IGhlcmU7ICBXaGVuIHdlIG9yaWdpbmFsbHkgZGVzaWduZWQgZW50aXR5IG1hbmFnZXIsICJHUFUg
dGhhdCBjb21lcyBpbiBhIGdyZWVuIGJveCIgd2FzIGRlZmluaXRlbHkgb25lIG9mIHRoZSBmaXJz
dCBleGFtcGxlIGVudGl0eSBjb25maWcgZmlsZXMgdGhhdCB3ZSB3cm90ZSB1cCB0byBtYWtlIHN1
cmUgdGhlIGNvbmZpZ3Mgd2VyZSBleHByZXNzaXZlIGVub3VnaC4gIEluIHNob3J0LCB3ZWxjb21l
ISAgR2xhZCB0byBoYXZlIHlvdSBoZXJlLg0KDQpUaGFua3MuIFllcywgSW5kaXZpZHVhbCBHUFUg
YW5kIEdQVSBCYXNlYm9hcmQgKGUuZy4gSEdYIEExMDAgKSAgYXJlIEZSVSBhcyB3ZWxsLiBTb3Jy
eSBJIHNob3VsZCBoYXZlIGxpc3RlZCB0aGVtLg0KDQpJZiB0aGUgYWJvdmUgaXMgeW91ciByZXF1
aXJlbWVudHMgbGlzdCwgcHJlc3VtYWJseSB5b3UgbmVlZCBydW50aW1lIGNvbmZpZ3VyYWJpbGl0
eSBmb3IgdGhlIHRoaW5ncyBwbHVnZ2VkIGludG8gdGhlIHNsb3RzIGFuZCBwb3J0cy4NCkdpdmVu
IHRoYXQgY29uc3RyYWludCwgZW50aXR5IG1hbmFnZXIgKCsgZGJ1cy1zZW5zb3JzIGFuZA0KcGhv
c3Bob3ItcGlkLWNvbnRyb2wpIGlzIHByb2JhYmx5IHRoZSB3YXkgdG8gZ28sIGFuZCBpcyB0aGUg
d2F5IG1vc3QgbmV3ZXIgcGxhdGZvcm1zIHNlZW0gdG8gYmUgdHJlbmRpbmcuICBCYXNlZCBvbiB5
b3VyIHJlcXVpcmVtZW50cywgSSdtIGdvaW5nIHRvIGd1ZXNzIHlvdSdyZSBidWlsZGluZyBhIHBs
YXRmb3JtIHRoYXQgbG9va3MgYSBsb3QgbGlrZSBhIFdvbGYgUGFzcy4gIEknZCBwcm9iYWJseSBz
dGFydCB3aXRoIHRob3NlIGNvbmZpZyBmaWxlcywgYXMgaXQgaGFzIGFsbCBvZiB0aGUgZmVhdHVy
ZXMgeW91IGxpc3QgYWJvdmUsIGFzIHdlbGwgYXMgYmFja3BsYW5lcywgd2hpY2ggeW91IGRpZG4n
dCBleHBsaWNpdGx5IGxpc3QsIGFuZCBzaG91bGQgZ2l2ZSB5b3UgYSBnb29kIHN0YXJ0aW5nIHBv
aW50IHRvIGJlZ2luIHlvdXIgZGV2ZWxvcG1lbnQuDQoNClllcy4gVGhhbmtzIGZvciB3b2xmIHBh
c3MgcG9pbnRlciAoaHR0cHM6Ly9naXRodWIuY29tL0ludGVsLUJNQy9vcGVuYm1jL3RyZWUvaW50
ZWwvbWV0YS1vcGVuYm1jLW1vZHMvbWV0YS1hc3QyNTAwL3JlY2lwZXMtcGhvc3Bob3IvY29uZmln
dXJhdGlvbi9lbnRpdHktbWFuYWdlcikuIEFmdGVyIGxvb2tpbmcgYXQgdGhlIHNhbWUsIGl0IGlz
IGNsb3NlIHRvIHRoZSBzYW1lIHBsdXMgR1BVLiB3ZSBkbyBoYXZlIHRoZSBiYWNrcGxhbmUgRlJV
IEVFUFJPTSAoIHdlIGNhbGxlZCBpdCBhcyBNaWRwbGFuZSDwn5iKKS4gDQo=
