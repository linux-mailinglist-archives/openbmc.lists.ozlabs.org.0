Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACB01FA64
	for <lists+openbmc@lfdr.de>; Wed, 15 May 2019 21:23:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4544Fv67FTzDqXG
	for <lists+openbmc@lfdr.de>; Thu, 16 May 2019 05:22:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=00387f4d84=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="ognW3n7B"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="EKVc/z/8"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4544F053yRzDqWF
 for <openbmc@lists.ozlabs.org>; Thu, 16 May 2019 05:22:07 +1000 (AEST)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x4FJIkUb029537;
 Wed, 15 May 2019 12:22:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=vGfdDUN+9/X/lPP0WwfcupLiIKHKiBNWF6sG7TFLAgs=;
 b=ognW3n7BTwtZ5AzuOz4mht9ZoTExCX208nZqSXljVcqG4rsNgiLe0Vi8er7JxVXyrGFE
 DTHSSOfuTmdeu123GpXvX5dfVVS+ZFsVSILVNkL9tspZD7xtlXPNQdMp2hMVDVCNsH7q
 bsA9zTBjKRXM4vQs/7ltUNIVlsYlXunrNsE= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by m0001303.ppops.net with ESMTP id 2sg8puu3w2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 15 May 2019 12:22:02 -0700
Received: from prn-mbx06.TheFacebook.com (2620:10d:c081:6::20) by
 prn-hub06.TheFacebook.com (2620:10d:c081:35::130) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Wed, 15 May 2019 12:22:01 -0700
Received: from prn-hub01.TheFacebook.com (2620:10d:c081:35::125) by
 prn-mbx06.TheFacebook.com (2620:10d:c081:6::20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Wed, 15 May 2019 12:22:01 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Wed, 15 May 2019 12:22:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGfdDUN+9/X/lPP0WwfcupLiIKHKiBNWF6sG7TFLAgs=;
 b=EKVc/z/8Jhohah2KBE+gbCovd0IGNaj1DQ0aadq/Bsa2PuQ/xsQDkUlWRJjlZwjbycBY+suPPwZcqv1lgnVzC9qSqSPCc1foog2ryVhTgCW8dLJ8POaQZ3/i+6RCb8RRKL0SZa+03TZ0W2dipsvev+0qJKvVeAAfkqQUMHqupcg=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1335.namprd15.prod.outlook.com (10.172.179.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.27; Wed, 15 May 2019 19:21:52 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::517c:210f:bedf:9091]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::517c:210f:bedf:9091%8]) with mapi id 15.20.1878.024; Wed, 15 May 2019
 19:21:52 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Ed Tanous <ed.tanous@intel.com>, Patrick Venture <venture@google.com>
Subject: Re: pid control configuration
Thread-Topic: pid control configuration
Thread-Index: AQHVAHC+JTVF079u7EWEF1cz6ijBgKZW49mAgAEiSgCABkgqgIAGJ+UAgATbwQCAABC4AIACzgEA
Date: Wed, 15 May 2019 19:21:52 +0000
Message-ID: <235B9067-D22E-439F-9009-F3D6C2A70993@fb.com>
References: <96A52DC2-7B18-4F69-B8E8-3B489BDA84C6@fb.com>
 <1c5566ba-696e-42eb-c193-22eaca33a1db@intel.com>
 <7D337AEA-CB20-4E39-8A9A-58E21EDA0F31@fb.com>
 <1b82951d-4293-0525-a562-000899544c2e@intel.com>
 <14F05B01-0B7D-44D1-A599-5EDD8CC3A6C8@fb.com>
 <CAO=notzQc2CX9Dx4gjX6HwnuCKnjmD_3ek+tv-XAfO+LxdQ3WA@mail.gmail.com>
 <b058940e-ae1b-d238-c9b1-885252ba2464@intel.com>
In-Reply-To: <b058940e-ae1b-d238-c9b1-885252ba2464@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::5609]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 556eaa02-46d0-4f38-9a16-08d6d96a9617
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:CY4PR15MB1335; 
x-ms-traffictypediagnostic: CY4PR15MB1335:
x-microsoft-antispam-prvs: <CY4PR15MB133584A577EF12EF1D3861C7DD090@CY4PR15MB1335.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(396003)(136003)(376002)(366004)(346002)(199004)(189003)(6436002)(316002)(6486002)(91956017)(76116006)(6116002)(229853002)(73956011)(66946007)(66446008)(66556008)(66476007)(64756008)(33656002)(110136005)(7116003)(186003)(305945005)(2906002)(7736002)(36756003)(14454004)(478600001)(486006)(102836004)(5660300002)(3480700005)(76176011)(25786009)(71200400001)(446003)(46003)(6506007)(71190400001)(86362001)(6512007)(53546011)(83716004)(81166006)(81156014)(68736007)(99286004)(6246003)(8676002)(2616005)(82746002)(256004)(14444005)(4326008)(11346002)(53936002)(8936002)(476003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1335;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: s/uYUb2RMVbherxTqumlKG6SDvzLx5e+jsT7OKxC4AafpzLjsR4F7JVdoJVmN1tWNlwAZxfF0RukxpDdqRbS+3h0JgP8dELt0PA8CFiF8aJqIxrzI0uCQt9gZaYga1JAx0PEZsjX53iGz1ScDdwzMGU1Gfg7j7Uvf6WP5oUKlzwtemoSbg75NcmUZS8oMr5VYEpfDVgvkJAc0krYRZCV+aSpg9xJLMhjZRKYOy6PrElZOTYgILc58SO4o7Dc8v8E/2aaFfXUN8boxWwLYs6SwbdUN1NEqnFkHVhE5PMUMFgWuVjTNt9lSBfEJgVIrZOnMvi5wNPtKKIMawbDf5ZxbjMUSfETYLtRU01z1hnEkyZCsebZeLh4atZiqZKvU+6RSTrkbN53mp0UB5QqhBjVe4AFKiT14GOgeXTb1WQlrzw=
Content-Type: text/plain; charset="utf-8"
Content-ID: <423D04B0A2F67742B35D7A52803ADC7B@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 556eaa02-46d0-4f38-9a16-08d6d96a9617
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 19:21:52.6382 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1335
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-15_13:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
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

DQoNCu+7v09uIDUvMTMvMTksIDEwOjMyIEFNLCAiRWQgVGFub3VzIiA8ZWQudGFub3VzQGludGVs
LmNvbT4gd3JvdGU6DQoNCiAgICBPbiA1LzEzLzE5IDk6MzIgQU0sIFBhdHJpY2sgVmVudHVyZSB3
cm90ZToNCiAgICA+IE9uIEZyaSwgTWF5IDEwLCAyMDE5IGF0IDI6MjEgUE0gVmlqYXkgS2hlbWth
IDx2aWpheWtoZW1rYUBmYi5jb20+IHdyb3RlOg0KICAgID4+DQogICAgPj4NCiAgICA+Pg0KICAg
ID4+IE9uIDUvNi8xOSwgOToyMCBBTSwgIkVkIFRhbm91cyIgPGVkLnRhbm91c0BpbnRlbC5jb20+
IHdyb3RlOg0KICAgID4+DQogICAgPj4gICAgIE9uIDUvMi8xOSA0OjI0IFBNLCBWaWpheSBLaGVt
a2Egd3JvdGU6DQogICAgPj4gICAgID4gIE15IHVuZGVyc3RhbmRpbmcgaGVyZSBpcyBwaWQgZGF0
YSBhcmUgb25seSBkZWZpbmVkIGZvciB0ZW1wIHNlbnNvcnMgd2hpY2ggd2lsbCBnZW5lcmF0ZSBw
d20gdmFsdWVzIGZvciBmYW4uDQogICAgPj4gICAgID4NCiAgICA+Pg0KICAgID4+ICAgICBUaGUg
YWJvdmUgaXMgbm90IGhvdyBwaG9zcGhvciBwaWQgY29udHJvbCBvcGVyYXRlcy4gIFRoZSB0ZW1w
ZXJhdHVyZQ0KICAgID4+ICAgICBjb250cm9sbGVycyAicmVxdWVzdCIgYSBnaXZlbiBmYW4gUlBN
LCB0aGVuIHRoZSBmYW4gUElEIGNvbnRyb2xsZXINCiAgICA+PiAgICAgKHdoaWNoIGlzIHNjYW5u
ZWQgbXVjaCBtb3JlIHF1aWNrbHkgdGhhbiB0aGUgdGVtcGVyYXR1cmUgY29udHJvbGxlcnMpDQog
ICAgPj4gICAgIGF0dGVtcHRzIHRvIGRyaXZlIHRoZSBmYW4gdG8gdGhhdCBzcGVlZC4gIFRoaXMg
ZW5kcyB1cCBiZWluZyBhIHR3byBzdGFnZQ0KICAgID4+ICAgICBmZWVkYmFjayBsb29wIHRoYXQg
Y2FuIHBlcmZvcm0gYmV0dGVyIHRoYW4gYSBzaW5nbGUgUElEIGxvb3AuDQogICAgPj4NCiAgICA+
PiBFZCwgd2UgYXJlIG5vdCB1c2luZyBjYXNjYWRlIGNvbnRyb2wgaGVyZSBpbiBmYWNlYm9vay4g
V2Ugb25seSB1c2Ugb3V0ZXIgbG9vcCB3aGljaCBnaXZlcyBkYXRhIGZvciBmYW4gdG8gZHJpdmUu
DQogICAgPj4gSXMgaXQgcG9zc2libGUgdG8gc3RpbGwgcnVuIFBob3NwaG9yIHBpZCBjb250cm9s
bGVyIHdpdGggc2luZ2xlIGxvb3A/DQogICAgPiANCiAgICA+IFlvdXIgY2FzY2FkZSBQSUQgY291
bGQgYmUgYSBwYXNzLXRocm91Z2ggLS0gc28gdGhhdCBpdCByZWNlaXZlcyB0aGUNCiAgICA+IHNl
dC1wb2ludCBmcm9tIHRoZSBzZW5zb3IgUElEIGFuZCB0aGVuIGp1c3Qgc2V0cyBpdCBkaXJlY3Rs
eSB3aXRoaW4NCiAgICA+IHRoYXQgbG9vcC4uICBJdCBtYXkgcmVxdWlyZSBhIG5ldyBQSUQgY29u
dHJvbGxlciB0aGF0IGlzIGp1c3QgYQ0KICAgID4gcGFzcy10aHJvdWdoIHRvIGV4cGxpY2l0bHkg
ZXhpc3QgLS0gaSBoYXZlbid0IGRvdmUgaW50bw0KICAgID4gcGhvc3Bob3ItcGlkLWNvbnRyb2wg
aW4gYSB3aGlsZSwgYnV0IHlvdSBwcm9iYWJseSBuZWVkIHRvIHdyaXRlIGENCiAgICA+IGJhc2lj
YWxseSBlbXB0eSBQSUQgY29udHJvbGxlciBvYmplY3QgdHlwZS4NCiAgICA+IA0KICAgIA0KICAg
ICsxICBUaGF0IGlzIGFuIG9wdGlvbiBmb3IgeW91Lg0KRWQsIHBsZWFzZSBzZWUgaWYgZm9sbG93
aW5nIGRlY2xhcmF0aW9uIGluIGVudGl0eSBtYW5hZ2VyIHdvdWxkIHdvcmsgYXMgSSBhbSBub3Qg
ZGVmaW5pbmcgYW55IHBpZCB2YWx1ZXMgaGVyZS4NCiAgICAgICAgew0KICAgICAgICAgICAgIkNs
YXNzIjogImZhbiIsDQogICAgICAgICAgICAiSW5wdXRzIjogWw0KICAgICAgICAgICAgICAgICJN
Ql9GQU4wX1RBQ0giDQogICAgICAgICAgICBdLA0KICAgICAgICAgICAgIk5hbWUiOiAiTUJfRkFO
MF9UQUNIIiwNCiAgICAgICAgICAgICJPdXRwdXRzIjogWw0KICAgICAgICAgICAgICAgICJQd20g
MSINCiAgICAgICAgICAgIF0sDQogICAgICAgICAgICAiVHlwZSI6ICJQaWQiLA0KICAgICAgICAg
ICAgIlpvbmVzIjogWw0KICAgICAgICAgICAgICAgICJQaWQgMSINCiAgICAgICAgICAgIF0NCiAg
ICAgICAgfSwNCiAgICANCiAgICA+Pg0KICAgID4+IFJlZ2FyZHMNCiAgICA+PiAtVmlqYXkNCiAg
ICA+Pg0KICAgIA0KDQo=
