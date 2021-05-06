Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E328375D34
	for <lists+openbmc@lfdr.de>; Fri,  7 May 2021 00:34:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbpKf71Lrz2xv2
	for <lists+openbmc@lfdr.de>; Fri,  7 May 2021 08:34:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=pK1PLZlk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.243.119;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=thu@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=pK1PLZlk; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2119.outbound.protection.outlook.com [40.107.243.119])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbpKL0H6yz2xtw
 for <openbmc@lists.ozlabs.org>; Fri,  7 May 2021 08:34:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FFSBd41ezKoic6dXZbmcGJbSkMsGVf6De0KN1HNBvkedoySpwRmjn6zesoQVXNK22R7prSMJcYQ8MsqyHhLlgxeKU4JG9gME7+ck7BABwTE3sL01saFztV3bvlquHWqhmqur9VtOXbt/BBGWWfA1z3EKTYzOHcmE5jsN45TAgiKaacdQ840vuE9Ow5m2xy1Du1YKCZjcgVtFjOsgt2eHDDwPm1KuQOdGMRdVRCJjfeYIj+co+TxPx6gmox7mVhhTxt32kZ6s+Xv13TNbb6Z6f8xnYLFqZVEx7nzKVjRfVWQ+IQZQkyRZ65i23JPsBwuUCKylC32t6RvYR5wGelRHqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5NbCstRFcWMxfy203+6orHjKuUj5ernjYfYG1h9IpSc=;
 b=CBc2BZnEeX+pG3HVfKsdfSRyjBiO6CT4gc6HGqBry1pJ5JrB9TdfC1h2GV5F3s5SooyFeYFfBsySUoLGMCp7eaLVV7IXoYKR2F094lT/XCGVoaIs4o2RA/GR3pEDl3f6PXk892dTD3DzqPgcT2Kq8KQ9Ve3bZLPg63ut1jn+8OhvFmWMDLqHg2VtsF4OEeOPk8mbXvDM0bXASlW9bvfF8ZOmwtZHqxsqFXw4Qb+1O2vubNV7Yrz+9P6AiBaVwjGmzoRkE7Pikg79/E4kjkY17ZI/u8tYGFhqgw3Zkmyh4b2StU3nqeQfZNl+bGGtIvKqRr69yHYJVvcUfstJ60bYVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5NbCstRFcWMxfy203+6orHjKuUj5ernjYfYG1h9IpSc=;
 b=pK1PLZlkH1lvGuxy6XLVpuKhmdTfC3ia5qvvRgMNvR26kIRR1qrGct/KaotuisV8rSPQA1yO3R2khbUN74auDgxRD0BRA5LCXHsxmj+d94Gfp3ViJzgENPF2BzxbB6Obb9r5OG8X5TwqzFugbPqSeExkdX3Ygc1qwepkVWTmSzI=
Received: from DM6PR01MB5145.prod.exchangelabs.com (2603:10b6:5:56::16) by
 DM6PR01MB5034.prod.exchangelabs.com (2603:10b6:5:e::26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25; Thu, 6 May 2021 22:34:02 +0000
Received: from DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::fd97:f560:f2cf:d58d]) by DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::fd97:f560:f2cf:d58d%5]) with mapi id 15.20.4065.039; Thu, 6 May 2021
 22:34:02 +0000
From: Thu Nguyen OS <thu@os.amperecomputing.com>
To: Matthew Barth <msbarth@linux.ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Add phosphor-fan configuration for the fan which added by
 dbus-sensor
Thread-Topic: Add phosphor-fan configuration for the fan which added by
 dbus-sensor
Thread-Index: AQHXQllQCBPi6KR9P0WKkzFc+/PDQ6rWbTWAgACk+oD//5M+AIAA2woA
Date: Thu, 6 May 2021 22:34:01 +0000
Message-ID: <6F0BA8AE-40E7-47EB-BA16-B445738548D2@amperemail.onmicrosoft.com>
References: <B6120112-33DD-41A6-A0F2-7A9FBFEEB081@amperemail.onmicrosoft.com>
 <d6b2354e-f0e6-8819-4b39-1481660d1361@linux.ibm.com>
 <DAC41731-7B29-4743-87D8-40324324FF96@amperemail.onmicrosoft.com>
 <37873411-cdda-bcd5-0a2a-6cd46192f80d@linux.ibm.com>
In-Reply-To: <37873411-cdda-bcd5-0a2a-6cd46192f80d@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none
 header.from=os.amperecomputing.com;
x-originating-ip: [2402:800:6344:392d:b870:c275:a0a0:93c5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c97212e8-f6e1-4719-1411-08d910df0c77
x-ms-traffictypediagnostic: DM6PR01MB5034:
x-microsoft-antispam-prvs: <DM6PR01MB5034D5DE57F95BADE23C80EE90589@DM6PR01MB5034.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ihx+vTP3Ql1ndpHaETI8XmFYmpVwqcwHVwrW2rDQ9dwnHsWq9MJt+zd+CI3ba41a+OWTCPaIoZzA7y6vHjlWSmSv0eFXK6UN933FJc+0DQ8xRFCPjW+HGApkGbDypKVT1RsbwjLycOWOJo+KX8wnNEBjEh3w1VIatMqO0X1bze9HvxDM7L62nancZwHeuOL7zABm25GwQeG5S2RkrG9vdOazTrXWj6LWNdwfq7aO6pGXZ/awiERcon2mO6Y+00X9p3/FjWpHnr5vN/QTz7pWMVPjEdUBszn4GTnGzlJHL0wjBGks2/dp0jiYoBC8uUUqRwLU/PIlEjFXqXcjPt5LscrquQPVVtIwSeEl3/dQqLDXmMNy6du5uFS2omeP3KYrXFN07qWr1go1Q/u3Srg+6mmMbBK9zUkxlueLkbMYVSNCM5/uyI7e2SXogPeFV1BPRoTRDNUP+7jH0CVYdox77N4WHLZHKC04uYUTcDMQQa+YBdeeGZ2y64onbcH/Fy5x1rGmHdgpnR2i9EkiV/GbjUR5rUqUq1C2wRhwMPBdJC33/XeyCZMqd4yH/HSPhZAp6aeuiPGO+B6Dwp/zMupr7rES15JBZsQUxM1y63I8zlvf85TWh9s2BD2EFrmsqM4gw1LV4SAE8NvPi/I022txZl/wrWSQ3KCYpn45tnzMZwv4749/jjLI540WJUG3noI2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR01MB5145.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(136003)(39840400004)(376002)(186003)(966005)(38100700002)(6486002)(478600001)(6512007)(2906002)(86362001)(122000001)(110136005)(71200400001)(316002)(6506007)(53546011)(5660300002)(8676002)(9686003)(91956017)(66446008)(66946007)(76116006)(83380400001)(64756008)(66556008)(8936002)(33656002)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?WmRLY1Uvblp4Zll1UjR0b0RmUSsxS1NNU2UwK1R6Tmc3VmNjSnpHSnRiWW5W?=
 =?utf-8?B?WFY1Mm83YkorVDBNaWNsTFgvQmtOQk9LT3daNUJqY2sxVHZoMWpIUW5JV2s4?=
 =?utf-8?B?VDdNeXRUN0I3cDhQcWZxUEV4aXhFN2RxNEJJUEd3OE5lWTkyZ2VFWmlCT1p0?=
 =?utf-8?B?YkhFSWFDUFFFU2l6QURaTjdGQzRGWm53aEdqRGZWM3hMWmpJTFVBckJ0Q0xa?=
 =?utf-8?B?WlNnUlRtMmU2L0NKdGZZcDZqTHRkZ3J1cU5rc09icVB0SkpvTHhFenpCSEY5?=
 =?utf-8?B?bnZVWjEvTmppM0FtRW12VzVncFhESnc0dDk0Q3ZndTVuWTQ5Y0JwVWNlVWUr?=
 =?utf-8?B?QnNTZzJTeEVOWDdFVkI5N3E4TU85STl0blZYSmZ3TzdZYXJQL0pNM2VObVI5?=
 =?utf-8?B?VlpKclZEdjBBOXRCdTZwUStPM0lwbTRNMUd1UGxiTERBemRBZmxoR05NeGxN?=
 =?utf-8?B?aXFQNUFFN2VaY2NjM2FrVDNRY2VPQ3JOQnc5bjBmcGlzY1IxNGVmVUJWZjdQ?=
 =?utf-8?B?dGJRYkJ1UzFoQ096UTRXcGwyUm91MzRpMktaelFWTVdWc2o3US9tSm5kbGE5?=
 =?utf-8?B?V1NXaUxLbmtrYTVtTkh5Wmw4M2I3RFBqTUtCeXpxV0lOVXowYXU1VExiRVc0?=
 =?utf-8?B?b2Nab3I5cEpGZ2FUcFhGaGlJRUw4SlhlUWEvSURtdG5NbDVrajhOcWVnSk5P?=
 =?utf-8?B?bXZCZU1maGRBUDhhaVF4RVowaEhqTXdzcXE5cnN1T2NibFVwcDJwK21PdUhw?=
 =?utf-8?B?WU1WZlo5RXVBSmNFN3dPd0srS2RDcGtpTDloZkppZVFZMHl3aEVJOGE4WWNI?=
 =?utf-8?B?ZnExN0taN0ptZklrUkMxWnBHVVdWaTEybHlHYXFGZXlMT1BkckZYRnJLcVE0?=
 =?utf-8?B?Y0U2UGRwYlA1WG9TVWt0c2k0aWxNd0MyV1BNWDhCSUdHN2wxYzlCeGs4N044?=
 =?utf-8?B?RWJNS2sxZG4yYVMwbXAzWXdTZUlRTHJaWFQ1bGt3dlA0T2NQa3hEb0tTU0xl?=
 =?utf-8?B?a2hBWWJMK2FNNDcrdTNZUytXRWIvMThyUjVuVGh6dDcwWW5VVXZFL1pEUUhy?=
 =?utf-8?B?US9aNEh2QmduSEZJdGx2NmlLRmovWDV6c21JMXV0QnorOXdrdFNUNmcxSFU4?=
 =?utf-8?B?NUpaMDlzRHh5Vk8vV0RicXQrSzUxQ1FvSE1wbnVyRnNUdENnc0s4b1lVbEsw?=
 =?utf-8?B?QTZjQS8yZk5MZWNseHVQZisrdE9oR3BBZVRiZlh4MXNLNkU4NG56VjRXOWd6?=
 =?utf-8?B?L1lZTXBwMHR2Y2x6RENzSXg0b0ZrOXBzYlY4WEhQS3Vub0VtbmxjOHZLeHRF?=
 =?utf-8?B?NW16QXN5enNDNDByWnNpVUp5czVsczRFOTIveE1rbDdxYmUrTDhLM0JGaTJ5?=
 =?utf-8?B?d085Z1hncFpmMVFOZlhvZFJScTVVdVZkM0xrNGRSMHZMZ3JBaHJTNkt0WDhv?=
 =?utf-8?B?eDlZdE9ZTFdTTy96QmE2UjU4eFFiM1N5TVovRnh0UGYxYUU0RGpzQ2lmU0pm?=
 =?utf-8?B?RXViRGRkUVBRN1V5NGZaVSs5dEVvY1ZWNGljQXQrdEYyZkxSY3JvVktEczNO?=
 =?utf-8?B?c2FEM005dFhwd1NUWWYydHcxaHp0dEZibTdXaHNjdE11aXZrTmVjYmlHNSs3?=
 =?utf-8?B?S0dNQVFUSGRUYzJYUjN6TURrUFFOL2JhN1pOWXkwaDV4T1phbndhSzhTYVlp?=
 =?utf-8?B?YkVWcU9TcU5hZnViM2FxNnRaMnBxVTJYMGpGVGpYaHZpckRDaTVvOVM5N3dP?=
 =?utf-8?B?UU1iQ3N3b0JZT3FsR2ZIVVNNb2g3dXBPeDNKZjdMUy8zeEhvcm9OTE1JSDhN?=
 =?utf-8?B?WmNQOTk5S3FLUHRCZVZxQWN6QWV0VVpJVXpQbEhrR0Z5RDYveXkvWnFMS3BM?=
 =?utf-8?Q?7IOjxV+ktF0zj?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <970A9EAEF874B240A0289B596F0BB15A@prod.exchangelabs.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5145.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c97212e8-f6e1-4719-1411-08d910df0c77
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2021 22:34:01.7750 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WZ1KtbfNQ5Xysu5KNDpmZ+qXdn8v9V9BZtCXQb5Y8r7wZyS/TaK/4CgmK0kD9wJWeWqXmDUgCggDgXERdF+uhRrxQwmxM53QTywjephMHIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5034
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

DQoNCu+7v09uIDA2LzA1LzIwMjEsIDIzOjMwLCAiTWF0dGhldyBCYXJ0aCIgPG1zYmFydGhAbGlu
dXguaWJtLmNvbT4gd3JvdGU6DQoNCg0KICAgIE9uIDUvNi8yMSAxMDo1OSBBTSwgVGh1IE5ndXll
biBPUyB3cm90ZToNCiAgICA+DQogICAgPiBPbiAwNi8wNS8yMDIxLCAyMDowOSwgIk1hdHRoZXcg
QmFydGgiIDxtc2JhcnRoQGxpbnV4LmlibS5jb20+IHdyb3RlOg0KICAgID4NCiAgICA+DQogICAg
PiAgICAgT24gNS82LzIxIDQ6MjIgQU0sIFRodSBOZ3V5ZW4gT1Mgd3JvdGU6DQogICAgPiAgICAg
PiBIaSwNCiAgICA+ICAgICA+DQogICAgPiAgICAgPiBJ4oCZbSBzdXBwb3J0aW5nIHRoZSBmYW4g
Y29udHJvbCBhbGdvcml0aG1zIHVzaW5nIHBob3NwaG9yLWZhbi4gUGhvc3Bob3ItZmFuIG1vbml0
b3JpbmcgYW5kIGNvbnRyb2xsaW5nIHJlcXVpcmUgaW50ZXJmYWNlIHh5ei5vcGVuYm1jX3Byb2pl
Y3QuQ29udHJvbC5GYW5Qd20gaW4gdGhlIGZhbiBpbnZlbnRvcnkgb2JqZWN0Lg0KICAgID4gICAg
IFRoYXQgaXMgYSBzZW5zb3IgaW50ZXJmYWNlLCBub3QgYW4gaW50ZXJmYWNlIHRoYXQncyBhZGRl
ZCB0byBpbnZlbnRvcnkgb2JqZWN0cw0KICAgID4gICAgID4gaHR0cHM6Ly9naXRodWIuY29tL29w
ZW5ibWMvcGhvc3Bob3ItZmFuLXByZXNlbmNlL2Jsb2IvbWFzdGVyL2RvY3MvbW9uaXRvci9pbnZl
bnRvcnkubWQNCiAgICA+ICAgICBXaGF0IHlvdSBsaW5rZWQgdG8gaGVyZSByZWZlcnMgdG8gd2hl
cmUgdGhlIGZhbiBpbnZlbnRvcnkgb2JqZWN0IGlzIGxvY2F0ZWQgYW5kIG5vdGhpbmcgdG8gZG8g
d2l0aCB3aXRoIHRoZSBmYW4gc2Vuc29ycyB0aGF0IGZhbiBtb25pdG9yIGlzIHRvIGJlIG1vbml0
b3JpbmcuDQogICAgPg0KICAgID4gW1RodSBOZ3V5ZW5dIFRoZSBsaW5rIGRldGFpbCBhYm91dCB0
aGUgaW52ZW50b3J5IGNvbmZpZ3VyYXRpb24gaW4gbW9uaXRvci55YW1sIGZvciBmYW4gbW9uaXRv
ciAgYW5kIGZhbi55YW1sIGZvciBmYW4gY29udHJvbCBmZWF0dXJlLiBJdCBzaG91bGQgYmUgIiBU
aGUgcmVsYXRpdmUgcGF0aCB1bmRlciBpbnZlbnRvcnkgd2hlcmUgdGhlIGZhbidzIGludmVudG9y
eSBvYmplY3QgZXhpc3RzICIuDQoNCiAgICBUaGUgUkVBRE1FIGxpbmtzIHJlZmVyIHRvIHRoZSB1
c2Ugb2YgSlNPTiBjb25maWcgZmlsZXMgaW4gcGxhY2Ugb2YgWUFNTC4gWUFNTCBiYXNlZCBjb25m
aWdzIGZvciB0aGUgZmFuIHByZXNlbmNlIGFuZCBmYW4gbW9uaXRvciBhcHBsaWNhdGlvbnMgaGFz
IGJlZW4gZGVwcmVjYXRlZCwgc28gcGxlYXNlIHVzZSBKU09OIGJhc2VkIGNvbmZpZ3MgaW5zdGVh
ZC4gRmFuIGNvbnRyb2wgaXMgaW4gdGhlIHByb2Nlc3Mgb2YgZ2V0dGluZyBjb252ZXJ0ZWQgdG8g
SlNPTiBiYXNlZCBjb25maWdzIHNvIHRoYXQgaXQgdG9vIGNhbiBoYXZlIGl0cyBZQU1MIGJhc2Vk
IGNvbmZpZyBzdXBwb3J0IGRlcHJlY2F0ZWQuIFRvIGVuYWJsZSB0aGUgdXNlIG9mIEpTT04sIHN1
cHBseSAianNvbiIgdG8gdGhlIFBBQ0tBR0VDT05GSUcgYW5kIHRvIGNvbnRpbnVlIHVzaW5nIFlB
TUwgYmFzZWQgZmFuIGNvbnRyb2wsIGFsc28gcHJvdmlkZSAiLS1kaXNhYmxlLWpzb24tY29udHJv
bCIgdW50aWwgZmFuIGNvbnRyb2wncyBzdXBwb3J0IG9mIEpTT04gaXMgY29tcGxldGVkLiBpLmUu
KSBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1jL2Jsb2IvbWFzdGVyL21ldGEtaWJt
L3JlY2lwZXMtcGhvc3Bob3IvZmFucy9waG9zcGhvci1mYW5fJTI1LmJiYXBwZW5kI0w1OS1MNjAN
Cg0KICAgID4gTG9vayBhdCB0aGUgZXhhbXBsZSBvZiB0aGUgZmFuIGNvbnRyb2wgY29uZmlndXJh
dGlvbiAgZmlsZSBuYW1lZCBmYW4ueWFtbCBiZWxvdyB5b3UgY2FuIHNlZSB0aGUgeWFtbCBmaWxl
IGluY2x1ZGVzICJpbnZlbnRvcnkiIHNldHRpbmcuIEFuZCB4eXoub3BlbmJtY19wcm9qZWN0LkNv
bnRyb2wuRmFuUHdtIGludGVyZmFjZSBpcyByZXF1aXJlZCBpbnRlcmZhY2UgZm9yIHRoYXQgaW52
ZW50b3J5IHBhdGguDQogICAgPiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci1m
YW4tcHJlc2VuY2UvYmxvYi9tYXN0ZXIvY29udHJvbC9leGFtcGxlL2ZhbnMueWFtbA0KICAgIE5v
dyB0byBhZGRyZXNzIHdoYXQgeW91J3JlIHNlZWluZywgdGhlICJpbnZlbnRvcnkiIGVudHJ5IGZv
ciBmYW5zLnlhbWwgaXMganVzdCB1c2VkIHRvIG5hbWUgYSBmYW4gb2JqZWN0IGNyZWF0ZWQgd2l0
aGluIGZhbiBjb250cm9sIGFuZCBub3QgcmVsYXRlZCB0byBhbnl0aGluZyBhY3R1YWxseSBpbiBk
YnVzIGludmVudG9yeS4gVGhpcyB3aWxsIGJlY29tZSAibmFtZSIgaW4gdGhlIEpTT04gYmFzZWQg
KGZhbnMuanNvbikgZm9yIGZhbiBjb250cm9sLg0KICAgID4gICAgID4NCiAgICA+ICAgICA+IEJ1
dCBGYW5TZW5zb3IgZGFlbW9uIG9mIGRidXMtc2Vuc29yIG9ubHkgYWRkcyAveHl6L29wZW5ibWNf
cHJvamVjdC9zZW5zb3JzL2Zhbl90YWNoIHRvIGludmVudG9yeSBsaXN0LCBhbmQgdGhpcyBwYXRo
IGRvbuKAmXQgc3VwcG9ydCB4eXoub3BlbmJtY19wcm9qZWN0LkNvbnRyb2wuRmFuUHdtIGludGVy
ZmFjZS4NCiAgICA+ICAgICBJIGNhbnQgc3BlYWsgdG8gdGhlIHN1cHBvcnQgb2YgZGJ1cy1zZW5z
b3JzIGFuZCB0aGUgdXNlIG9mIHRoZSBGYW5Qd20gaW50ZXJmYWNlLCBidXQgcGhvc3Bob3ItZmFu
LW1vbml0b3IgY2FuIHN1cHBvcnQgZWl0aGVyIHRoZSB1c2Ugb2YgUlBNIG9yIFBXTSBmYW4gc2Vu
c29ycyBmb3IgbW9uaXRvcmluZyBhbmQgdXBkYXRpbmcgdGhlIGNvcnJlc3BvbmRpbmcgT3BlcmF0
aW9uYWxTdGF0dXMgb2YgYSBmYW4gaW4gaW52ZW50b3J5Lg0KICAgID4gICAgIGh0dHBzOi8vZ2l0
aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLWZhbi1wcmVzZW5jZS9ibG9iL21hc3Rlci9kb2NzL21v
bml0b3Ivc2Vuc29ycy5tZA0KICAgID4NCiAgICA+ICAgICBTdXBwbHlpbmcgdGhlIGAgInRhcmdl
dF9pbnRlcmZhY2UiOiAieHl6Lm9wZW5ibWNfcHJvamVjdC5Db250cm9sLkZhblB3bSIgYCBkaXJl
Y3RzIGZhbiBtb25pdG9yIHRvIG1vbml0b3IgdGhlIGZhbiBzZW5zb3IgdXNpbmcgdGhlIFRhcmdl
dCBwcm9wZXJ0eSBmcm9tIHRoYXQgaW50ZXJmYWNlLiBXaGVuIHRoZSAidGFyZ2V0X2ludGVyZmFj
ZSIgaXMgbm90IHByb3ZpZGVkIG9uIGEgZmFuIHNlbnNvciwgdGhlIGRlZmF1bHQgaXMgdG8gdXNl
IHRoZSAieHl6Lm9wZW5ibWNfcHJvamVjdC5Db250cm9sLkZhblNwZWVkIiAoUlBNKSBpbnRlcmZh
Y2UuDQogICAgPiBbVGh1IE5ndXllbl0NCiAgICA+IFRoZSBwb2ludCBoZXJlIGlzIHRoZSBwaG9z
cGhvci1mYW4tbW9uaXRvci9jb250cm9sIGV4cGVjdCB4eXoub3BlbmJtY19wcm9qZWN0LkNvbnRy
b2wuRmFuUHdtIG9yIHh5ei5vcGVuYm1jX3Byb2plY3QuQ29udHJvbC5GYW5TcGVlZCBpcyBpbmNs
dWRlZCBpbiAveHl6L29wZW5ibWNfcHJvamVjdC9zZW5zb3JzL2Zhbl90YWNoLg0KICAgID4gQnV0
IGRidXMtc2Vuc29yIGRvbid0IHN1cHBvcnQgdGhhdC4gSW4gZGJ1cyBzZW5zb3IgeHl6Lm9wZW5i
bWNfcHJvamVjdC5Db250cm9sLkZhblB3bSBpcyBvbmx5IGF2YWlsYWJsZSBpbiAveHl6L29wZW5i
bWNfcHJvamVjdC9jb250cm9sL2ZhbnB3bS4NCiAgICBPaywgdGhhdCBjbGFyaWZpZXMgdGhpbmdz
Li4uYW5kIEkgd2VsY29tZSBhIHByb3Bvc2VkIGNoYW5nZSB0byBzdXBwb3J0IHRoZSBkaWZmZXJl
bnQgZGJ1cyBvYmplY3QgcGF0aHMgaW4gd2hpY2ggdGhlIHh5ei5vcGVuYm1jX3Byb2plY3QuQ29u
dHJvbC4qIGludGVyZmFjZXMgdGhhdCB0aGUgZmFuIHNlbnNvcnMgY2FuIGJlIGJlIGF0LiBCZWZv
cmUgZGJ1cy1zZW5zb3JzIGV4aXN0ZWQgaW4gb3BlbmJtYywgdGhlIGZhbiBzZW5zb3JzIHdlcmUg
cHJvdmlkZWQgYnkgcGhvc3Bob3ItaHdtb24gb24gdGhlIGRidXMgb2JqZWN0IHBhdGggb2YgL3h5
ei9vcGVuYm1jX3Byb2plY3Qvc2Vuc29ycy9mYW5fdGFjaCByZWdhcmRsZXNzIG9mIGJlaW5nIFBX
TSBvciBSUE0gc28gdGhhdCdzIHdoeSB0aGV5IGFyZSBsb29raW5nIGF0IHRoYXQgcGF0aC4NCg0K
W1RodSBOZ3V5ZW5dDQpIb3cgYWJvdXQgYWRkIHRhcmdldF9wYXRoIG9wdGlvbiBpbiBmYW4ueWFt
bCBhbmQgbW9uaXRvci55YW1sIHRvIHNldCB0aGUgZGJ1cyBvYmplY3QgcGF0aD8NCkV4YW1wbGU6
DQp0YXJnZXRfcGF0aDogL3h5ei9vcGVuYm1jX3Byb2plY3QvY29udHJvbC9mYW5wd20uDQpUaGUg
c2V0dGluZyBvZiB0YXJnZXRfcGF0aCB3aWxsIG92ZXJyaWRlIHZhbHVlIG9mICJGQU5fU0VOU09S
X1BBVEgiIGluIGZhbi5jcHAgYW5kIHRhY2hfc2Vuc29yLmhwcC4NCg0KICAgID4gICAgID4NCiAg
ICA+ICAgICA+IERvIHlvdSBoYXZlIGFueSBzb2x1dGlvbiB0byBtYWtlIHBob3NwaG9yLWZhbiB3
b3JrIHdpdGggZGJ1cy1zZW5zb3I/DQogICAgPiAgICAgPg0KICAgID4gICAgID4gSeKAmW0gY3Vy
cmVudGx5IHVwZGF0ZSBGYW5TZW5zb3IgaW4gZGJ1cy1zZW5zb3IgdG8gYWRkIHh5ei5vcGVuYm1j
X3Byb2plY3QuQ29udHJvbC5GYW5Qd20gdG8gL3h5ei9vcGVuYm1jX3Byb2plY3Qvc2Vuc29ycy9m
YW5fdGFjaC4NCiAgICA+ICAgICBSZWZlciB0byB0aGUgZG9jIGxpbmsgSSBwcm92aWRlZCBhYm92
ZSBvbiBob3cgdG8gdXRpbGl6ZSBtb25pdG9yaW5nIGZhbnMgdGhhdCB1c2UgYSBQV00gdGFyZ2V0
IG9uIHRoYXQgaW50ZXJmYWNlLiBUaGVuIHBob3NwaG9yLWZhbi1tb25pdG9yIHdpbGwgdXBkYXRl
IHRoZSBmYW4gaW52ZW50b3J5IG9iamVjdCdzIChhcyBjb25maWd1cmVkIHdpdGggaHR0cHM6Ly9n
aXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3ItZmFuLXByZXNlbmNlL2Jsb2IvbWFzdGVyL2RvY3Mv
bW9uaXRvci9pbnZlbnRvcnkubWQpIHh5ei5vcGVuYm1jX3Byb2plY3QuU3RhdGUuRGVjb3JhdG9y
Lk9wZXJhdGlvbmFsU3RhdHVzIEZ1bmN0aW9uYWwgcHJvcGVydHkgYmFzZWQgb24gaG93IHlvdSBj
b25maWd1cmUgZmFuIG1vbml0b3IgdG8gbW9uaXRvciB0aGUgZmFuIHNlbnNvcnMuDQogICAgPiAg
ICAgPg0KICAgID4gICAgID4gUmVnYXJkcy4NCiAgICA+ICAgICA+IFRodSBOZ3V5ZW4uDQogICAg
Pg0KDQo=
