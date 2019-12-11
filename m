Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6CD11BCAC
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2019 20:14:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Y66s5W0dzDqv6
	for <lists+openbmc@lfdr.de>; Thu, 12 Dec 2019 06:14:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=40.107.70.121;
 helo=nam04-sn1-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700121.outbound.protection.outlook.com [40.107.70.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Y65n4SCrzDqsR
 for <openbmc@lists.ozlabs.org>; Thu, 12 Dec 2019 06:13:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l8d9aKNPiEgrAlaRnjvqVNyZcXDuR7nlskC8sBWUMvCZfuDIMIB0bRku16hoTZ3X/OvSnVV9q6tVke5Q7eCLQNxR88iMOEUPFKHuaQlkXGu1/OgJUmA+O+PONj6ZEjL5O6VMfFMCGmetgaMhgtQ9WxQgjNuuagMlQVDEyPCXnOAMlw44rUZqUORQQfYOJGUaVEHQDNA6h92fX7xEiTQpiVBHdFnYrR9dzeHnb9RCIC/bOWe3SKRrGZ0we0BeCaR4+mn1xbKtdEKJIqCbM71rUbz2fUnMiaVRibMcj/WMmk5EFOZ4kT6MOzpX62zSue20PL5xb9kRgJ8cj4y++Ilvtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kz/y2RIFo/8AndWXHDbB9mlZKolcNScvpxH4srI1HPY=;
 b=YgCn6/I9gpIyd+vzKMX8r8nSAqbykLdya2qutJtEW27+tKxl4tu0sADqw3k63SQwXcrLerLGgdhHcxHXANDjnKG3YFJ9v4KSe4H6HrDgTam1chmO7mBkIed+kro1L60z024XThffG73Qy1WtJU00XHBXHPFsE8PLOgbf3UpW7qhxkwpLHiWLbP6QcE+0M473ux9jaDte16rDIjFK0GmHaLg9in8xcARqk5ZfKXSzf8wmVBoTqDp1NPOkCeW3h2mSuIzENtA3s9cFZEO8w7Yv+IT9L84J43xzWpXKemeZWuQ0GVshwcKIB2Ad6drotRJJTZiXfR8pERaw70OOh/zKHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kz/y2RIFo/8AndWXHDbB9mlZKolcNScvpxH4srI1HPY=;
 b=OHYRL4o2XdotIy09mmzhkawOT/6AmIA6rx678Ft4Tzbx/SpGfV4SulMZCMIRJ6RNQhWSgWwdYfJ9mQ6Og1RTOeeu+mBCZn9qjfpKcHlmB0PyqFQENeT8HBO7OSMV77YZRoNqbMfVTjsvKsVPUX4vsv2GsRSJ4O/QQ4glOSOQxx8=
Received: from DM6PR21MB1388.namprd21.prod.outlook.com (20.180.21.213) by
 DM6PR21MB1402.namprd21.prod.outlook.com (20.180.21.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.0; Wed, 11 Dec 2019 19:13:03 +0000
Received: from DM6PR21MB1388.namprd21.prod.outlook.com
 ([fe80::a4df:ed8e:9432:60d]) by DM6PR21MB1388.namprd21.prod.outlook.com
 ([fe80::a4df:ed8e:9432:60d%3]) with mapi id 15.20.2538.016; Wed, 11 Dec 2019
 19:13:03 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: [EXTERNAL] Fwd: Redfish Dump Service Proposal
Thread-Topic: [EXTERNAL] Fwd: Redfish Dump Service Proposal
Thread-Index: AQHVsBoPd69fpezV3EisJj37EvumTqe1TYXQ
Date: Wed, 11 Dec 2019 19:13:03 +0000
Message-ID: <DM6PR21MB1388A8A92991C334843FC2F6C85A0@DM6PR21MB1388.namprd21.prod.outlook.com>
References: <c31757a8-c71d-43b3-f207-426e94548065@linux.vnet.ibm.com>
 <1790482b-27ad-7042-83ef-f9819966b4a4@linux.vnet.ibm.com>
In-Reply-To: <1790482b-27ad-7042-83ef-f9819966b4a4@linux.vnet.ibm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-12-11T19:13:02.2181032Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=a28ea00a-4d7c-495d-b162-45e4637f481b;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [2001:4898:80e8:0:c9c:727f:681c:4f6c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2287965b-ade3-4a6a-5ab4-08d77e6e2553
x-ms-traffictypediagnostic: DM6PR21MB1402:
x-microsoft-antispam-prvs: <DM6PR21MB140286AB460FFBB5B97AC82DC85A0@DM6PR21MB1402.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 024847EE92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(396003)(376002)(346002)(366004)(136003)(53754006)(189003)(199004)(86362001)(478600001)(7696005)(71200400001)(66946007)(8990500004)(66476007)(66556008)(66446008)(55016002)(64756008)(76116006)(9686003)(316002)(110136005)(52536014)(966005)(81166006)(10290500003)(6506007)(186003)(5660300002)(81156014)(8936002)(16799955002)(33656002)(2906002)(53546011)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR21MB1402;
 H:DM6PR21MB1388.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k7OXuQbfBruBzUsuWHllxMQnji5JLbiSU1dC1K9lVkjTOf+Yj9r3eMcmA9cWNKI2ZyrXDo9qkgR2SJ+hzVTiCbYmtGIWb88Lfv29wGroKO45nY8qePcU3m9WpRwaBs8aT0VJSJjJtvmgT0LeX7nJDlfc7FEFBVbF48EM1MTCIWT2VMMe0eYTx4X4zJkcnGBB2WFZ50Q5uuhKEd3+XCWxbep2FG2apPkKV/7Xg461mLxtlSL3e4HgIMBBTCrPeq6JO9UPsN0cPbYycpDxKuTshgLziH0YbxHxHl42V2T8hVa1Yv6o+9X2MCN/5RUsrlxyQoUL9HM6JSlXFKqNsiL62H/7Ve3nt+N6dyvAwLCHXudiolB4mfH3c1soiFvJZg/B4acGkv1QrkGbJ6lJwzVfgMXZvNmzw0av1LDBMZWTbgl2OoiZ9b4+OlXbmOOfHL71Hn9tqiBRvNdsow+1KK+VF6XEeTXZbJdBmufdJ7bAYzysEpF+9PR/nvuFGHs0lbs2aajH3bQf8xwSbwShzgxBYf/RXWcYekhxa73DP7oDGjY=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2287965b-ade3-4a6a-5ab4-08d77e6e2553
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2019 19:13:03.2592 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q3Ss6LWzyayGoplBxwFFWU4gERtn4zux4X+A6pTFWakewOshxWIyQjIoRn56gpQdypbkLbPaG6PGtMgEKKSsNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR21MB1402
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

Q2FuIHlvdSBzZW5kIGV4dGVybmFsIGxpbmsgZm9yIGZvbGtzIHdobyBhcmUgbm90IG1lbWJlciBv
ZiBETVRGIGZvcnVtLiANCg0KTmVlcmFqDQoNCkZyb206IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNl
cytuZWxhZGs9bWljcm9zb2Z0LmNvbUBsaXN0cy5vemxhYnMub3JnPiBPbiBCZWhhbGYgT2YgUmF0
YW4gR3VwdGENClNlbnQ6IFdlZG5lc2RheSwgRGVjZW1iZXIgMTEsIDIwMTkgMzo1NiBBTQ0KVG86
IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KU3ViamVjdDogW0VYVEVSTkFMXSBGd2Q6IFJlZGZp
c2ggRHVtcCBTZXJ2aWNlIFByb3Bvc2FsDQoNCkhpIEFsbCwNCg0KTGFzdCBlbWFpbCBJIHNlbnQg
b24gdGhlIHByb3Bvc2FsIGZvciBSZWRmaXNoIER1bXAgc2VydmljZSBkaWQgbm90IGdldCBkZWxp
dmVyZWQgZHVlIHRvIHRoZSBhdHRhY2htZW50IHNpemUgcmVzdHJpY3Rpb24uIA0KDQpJIGhhdmUg
dXBsb2FkIHRoZSBzYW1lIG9udG8gRE1URi4gUGxlYXNlIHRha2UgYSBsb29rIGludG8gaXQgYW5k
IHByb3ZpZGUgeW91ciBjb21tZW50cyBoZXJlIG9yIG9uIHRoZSBkbXRmIGZvcnVtLg0KDQpMaW5r
OiBodHRwczovL25hbTA2LnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0
cHMlM0ElMkYlMkZtZW1iZXJzLmRtdGYub3JnJTJGYXBwcyUyRm9yZyUyRndvcmtncm91cCUyRnJl
ZGZpc2glMkZkb3dubG9hZC5waHAlMkY5MTg3NyZkYXRhPTAyJTdDMDElN0NuZWxhZGslNDBtaWNy
b3NvZnQuY29tJTdDZGU3NzRiNGYxNWRkNDc1ZTRjZGIwOGQ3N2UzMTMxMjQlN0M3MmY5ODhiZjg2
ZjE0MWFmOTFhYjJkN2NkMDExZGI0NyU3QzElN0MwJTdDNjM3MTE2NjIyMDU2MDQyNTA3JnNkYXRh
PUFlWHhxbU5YNUUzVWFYQXBTUGglMkI5WHVYQ0VMT0hYdTdnSU5INjYlMkZxJTJCNjQlM0QmcmVz
ZXJ2ZWQ9MA0KDQpSYXRhbg0KDQotLS0tLS0tLSBGb3J3YXJkZWQgTWVzc2FnZSAtLS0tLS0tLSAN
ClN1YmplY3Q6IA0KUmVkZmlzaCBEdW1wIFNlcnZpY2UgUHJvcG9zYWwNCkRhdGU6IA0KVHVlLCAx
MCBEZWMgMjAxOSAxNjo1MToxMiArMDUzMA0KRnJvbTogDQpSYXRhbiBHdXB0YSBtYWlsdG86cmF0
YWd1cHRAbGludXgudm5ldC5pYm0uY29tDQpUbzogDQptYWlsdG86b3BlbmJtY0BsaXN0cy5vemxh
YnMub3JnIG1haWx0bzpvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNCg0KDQpIaSBBbGwsDQoNClBs
ZWFzZSBmaW5kIHRoZSByZWRmaXNoIGR1bXAgc2VydmljZSBwcm9wb3NhbCBmb3IgdGhlIERNVEYg
YXR0YWNoZWQuDQoNCktpbmRseSByZXZpZXcgYW5kIHByb3ZpZGUgeW91ciBpbnB1dHMuDQoNClJh
dGFuDQoNCg0KDQo=
