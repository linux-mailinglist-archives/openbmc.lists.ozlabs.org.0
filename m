Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DED100EF
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 22:35:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44ttZQ5xpnzDqMS
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 06:35:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=0023ab73f8=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="EUDZh/Zd"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="G3TzRKTp"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ttW14p8WzDqHS
 for <openbmc@lists.ozlabs.org>; Wed,  1 May 2019 06:32:27 +1000 (AEST)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3UKK4ox020923; Tue, 30 Apr 2019 13:32:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=ymEZvxtBH+epkLc5L2yI1ubhlw+wTdzVAVqg/UVZb1I=;
 b=EUDZh/Zd5+WSuUbtgI1H3+Xi+UvoOsdUc/UmJytGwRyMh0c6bu8BeTQGcsVoQVPjpuGJ
 jFU9GsAZgqwlTjLW1aH73CgkdabkVFhiUCXsxhIrJfLLzUdSZ7pHKULc8TQoemt7ySXh
 H+INd6swze3BNSZOdRvKnWfFAiuClPAuTc0= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2s6rt2h1rm-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 30 Apr 2019 13:32:20 -0700
Received: from prn-hub06.TheFacebook.com (2620:10d:c081:35::130) by
 prn-hub05.TheFacebook.com (2620:10d:c081:35::129) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 30 Apr 2019 13:32:18 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Tue, 30 Apr 2019 13:32:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymEZvxtBH+epkLc5L2yI1ubhlw+wTdzVAVqg/UVZb1I=;
 b=G3TzRKTpeyRfBHByM+c0Wh/H3J0BqP13lj0J4NFO6wB7A8HzJOQGiw5MHwk6m4B4F6NG/ryfD4lam/WP08ESDx5YOwu+fD98Afk9ti6r9odyZX6PL8JMt5Szb+oPnRrRESSPyy6r0a9FmzURzLc7QOph72wKBquDXkR/zhL0E8s=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1496.namprd15.prod.outlook.com (10.172.156.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.14; Tue, 30 Apr 2019 20:32:16 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::1039:c5b1:f43e:14e9]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::1039:c5b1:f43e:14e9%3]) with mapi id 15.20.1835.010; Tue, 30 Apr 2019
 20:32:16 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Patrick Venture <venture@google.com>
Subject: Re: Phosphor pid control
Thread-Topic: Phosphor pid control
Thread-Index: AQHU/4KY0BYzgrKEY0CYtw90dRuDdKZVBrOA//+Nf4CAAHrEgP//kDKAgAAUEwA=
Date: Tue, 30 Apr 2019 20:32:16 +0000
Message-ID: <59D3A2C1-2E74-4055-B33A-6FF746E62FD2@fb.com>
References: <303477D5-BB35-4FC8-98FB-9C59A188064C@fb.com>
 <CAO=notzKTpC-6zAGODatyDJL5p1Y3+mW5-LbxRh7qtg1hNmufQ@mail.gmail.com>
 <AF2ED931-7FB2-4AFE-AFCE-D0AEC3646A44@fb.com>
 <CAO=notyhSG=E6kwv63ODRQQz7SD3rindmtAYxa=OuFvSv=mELg@mail.gmail.com>
 <71BFF33B-20DA-428A-979F-A896011142AE@fb.com>
In-Reply-To: <71BFF33B-20DA-428A-979F-A896011142AE@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::c9a8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d967095f-1302-4aee-2af1-08d6cdaaefb7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:CY4PR15MB1496; 
x-ms-traffictypediagnostic: CY4PR15MB1496:
x-microsoft-antispam-prvs: <CY4PR15MB149685133CE01BFA819FFC4EDD3A0@CY4PR15MB1496.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(396003)(346002)(376002)(39860400002)(199004)(189003)(71200400001)(102836004)(73956011)(81166006)(7736002)(53546011)(33656002)(316002)(186003)(6506007)(99286004)(76176011)(54906003)(305945005)(2616005)(14454004)(53936002)(7116003)(486006)(446003)(11346002)(46003)(64756008)(476003)(2906002)(97736004)(5660300002)(6246003)(66446008)(256004)(66556008)(6512007)(66476007)(91956017)(82746002)(25786009)(8676002)(76116006)(93886005)(6916009)(8936002)(71190400001)(81156014)(36756003)(83716004)(14444005)(66946007)(6486002)(68736007)(86362001)(6436002)(4326008)(6116002)(229853002)(478600001)(3480700005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1496;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JgwO+EDC3DroeipWEL0GYZYnh7CK7eR/EAnkDvgeGVKLg4NtSNFKu+IpbvKSmGn7XHbzfiT9UHohFJzb4n7jgzxt+h12RQIi+B4v3yvFVwu5wNiO6Vy/T2/PUfoM+e5qTcRGRcScodDZaNR1KSiBArmZWzO1SV4InS++IyE9uZXv7Y0v4lqPjLMyiF1osbsgyTAGXLJHaE0UICbkOZNbeOZPZPw++BujL4gnHZWWkVw9afYyMz2Q/Gp+AoN1XmPnZxT0Ty9NQu4alLmCXHE9/SGoac3/9/wYi4WblXHLe/DYdMUGsX0ryGYwjMkWCz0qS8dlgOxfFAIxlj7TPd5m/dnT5/LyQ7nIIuLqQKxgUVDimOGV5vcKfaSvtljOb/SXFLBc62hDFHJainkfgkEl7LptlfEcMiQ1tjufbtQ/VlU=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A8A8F12ADAA79A459DAA250030D34774@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d967095f-1302-4aee-2af1-08d6cdaaefb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 20:32:16.8506 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1496
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-30_11:, , signatures=0
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SSBmaXhlZCB0aGlzIGNvbmZpZyBmaWxlIGlzc3VlLCBub3cgSSBhbSBzZWVpbmcgYmVsb3cgaXNz
dWUuIEkgd2lsbCBjb250aW51ZSB0byBkZWJ1ZyBidXQgaWYgYW55b25lIHNhdyBzaW1pbGFyIGlz
c3VlIGFuZCBoYXZlIGFueSBzdWdnZXN0aW9ucywgcGxlYXNlIGFkdmlzZS4NCnJvb3RAdGlvZ2Fw
YXNzOn4jIC4vc3dhbXBkIA0KU2Vuc29yOiBDb3JlXzBfQ1BVMSB0ZW1wIC94eXovb3BlbmJtY19w
cm9qZWN0L3NlbnNvcnMvdGVtcGVyYXR1cmUvQ29yZV8wX0NQVTEgDQp0ZW1wIHJlYWRQYXRoOiAv
eHl6L29wZW5ibWNfcHJvamVjdC9zZW5zb3JzL3RlbXBlcmF0dXJlL0NvcmVfMF9DUFUxDQpTZW5z
b3I6IE1CX0ZBTjBfVEFDSCBmYW4gL3h5ei9vcGVuYm1jX3Byb2plY3Qvc2Vuc29ycy9mYW5fdGFj
aC9NQl9GQU4wX1RBQ0ggL3h5ei9vcGVuYm1jX3Byb2plY3QvY29udHJvbC9mYW5wd20vUHdtXzEN
ClNlbnNvcjogTUJfRkFOMV9UQUNIIGZhbiAveHl6L29wZW5ibWNfcHJvamVjdC9zZW5zb3JzL2Zh
bl90YWNoL01CX0ZBTjFfVEFDSCAveHl6L29wZW5ibWNfcHJvamVjdC9jb250cm9sL2ZhbnB3bS9Q
d21fMg0KU2Vuc29yOiBNQl9JTkxFVF9URU1QIHRlbXAgL3h5ei9vcGVuYm1jX3Byb2plY3Qvc2Vu
c29ycy90ZW1wZXJhdHVyZS9NQl9JTkxFVF9URU1QIA0KdGVtcCByZWFkUGF0aDogL3h5ei9vcGVu
Ym1jX3Byb2plY3Qvc2Vuc29ycy90ZW1wZXJhdHVyZS9NQl9JTkxFVF9URU1QDQpTZW5zb3I6IE1F
WlpfU0VOU09SX1JFTU9URV9URU1QIHRlbXAgL3h5ei9vcGVuYm1jX3Byb2plY3Qvc2Vuc29ycy90
ZW1wZXJhdHVyZS9NRVpaX1NFTlNPUl9SRU1PVEVfVEVNUCANCnRlbXAgcmVhZFBhdGg6IC94eXov
b3BlbmJtY19wcm9qZWN0L3NlbnNvcnMvdGVtcGVyYXR1cmUvTUVaWl9TRU5TT1JfUkVNT1RFX1RF
TVANClpvbmUgSWQ6IDANClBJRCBuYW1lOiBDb3JlIDAgQ1BVMQ0KaW5wdXRzOiBDb3JlXzBfQ1BV
MSwgDQpQSUQgbmFtZTogTUJfRkFOMF9UQUNIDQppbnB1dHM6IE1CX0ZBTjBfVEFDSCwgDQpQSUQg
bmFtZTogTUJfRkFOMV9UQUNIDQppbnB1dHM6IE1CX0ZBTjFfVEFDSCwgDQpCYWlsaW5nIGR1cmlu
ZyBsb2FkLCBtaXNzaW5nIFpvbmUgQ29uZmlndXJhdGlvbg0KdGVybWluYXRlIGNhbGxlZCBhZnRl
ciB0aHJvd2luZyBhbiBpbnN0YW5jZSBvZiAnc3RkOjpydW50aW1lX2Vycm9yJw0KICB3aGF0KCk6
ICBCYWlsaW5nIGR1cmluZyBsb2FkLCBtaXNzaW5nIFpvbmUgQ29uZmlndXJhdGlvbg0KQWJvcnRl
ZA0Kcm9vdEB0aW9nYXBhc3M6fiMNCg0KUmVnYXJkcw0KLVZpamF5DQoNCu+7v09uIDQvMzAvMTks
IDEyOjIxIFBNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgVmlqYXkgS2hlbWthIiA8b3BlbmJtYy1i
b3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMub3JnIG9uIGJlaGFsZiBvZiB2
aWpheWtoZW1rYUBmYi5jb20+IHdyb3RlOg0KDQogICAgDQogICAgDQogICAgT24gNC8zMC8xOSwg
MTI6MDEgUE0sICJQYXRyaWNrIFZlbnR1cmUiIDx2ZW50dXJlQGdvb2dsZS5jb20+IHdyb3RlOg0K
ICAgIA0KICAgICAgICBPbiBUdWUsIEFwciAzMCwgMjAxOSBhdCAxMTo0MSBBTSBWaWpheSBLaGVt
a2EgPHZpamF5a2hlbWthQGZiLmNvbT4gd3JvdGU6DQogICAgICAgID4NCiAgICAgICAgPiBJIGNo
ZWNrZWQgaW4gY29kZSBhbmQgbG9va3MgbGlrZSAvdXNyL3NoYXJlL3N3YW1wZC9jb25maWcuanNv
biBmaWxlIGlzIG1pc3NpbmcuIFdoZXJlIGRvIHdlIGdldCB0aGlzIGZpbGUgZnJvbSBvciB3aGVy
ZSBpcyBleGFtcGxlIGNvbmZpZy5qc29uIGZpbGU/DQogICAgICAgIA0KICAgICAgICBJZiB5b3Un
cmUgdXNpbmcgdGhlIGVudGl0eS1tYW5hZ2VyIHRvIGNvbmZpZ3VyZSBpdCwgeW91IHdvbnQnIG5l
ZWQNCiAgICAgICAgdGhhdCBmaWxlLCBidXQgeW91IHdpbGwgbmVlZCB0byB0ZWxsIHN3YW1wZCB0
aGF0IGl0J3MgaW4gdGhhdCBtb2RlDQogICAgICAgIGR1cmluZyBjb25maWd1cmF0aW9uLg0KICAg
ICAgICANCiAgICAgICAgWW91IGNhbiBhZGQgdGhpcyB0byB5b3VyIHN3YW1wZF8lLmJiYXBwZW5k
Og0KICAgICAgICANCiAgICAgICAgRVhUUkFfT0VDT05GX2FwcGVuZCA9ICIgLS1lbmFibGUtY29u
ZmlndXJlLWRidXMiDQogICAgWWVzIGl0IGlzIGVuYWJsZWQgaW4gcmVjaXBlcy1waG9zcGhvci9m
YW5zL3Bob3NwaG9yLXBpZC1jb250cm9sXyUuYmJhcHBlbmQgZmlsZS4NCiAgICAgICAgDQogICAg
ICAgID4NCiAgICAgICAgPiBPbiA0LzMwLzE5LCAxMTozMSBBTSwgIlBhdHJpY2sgVmVudHVyZSIg
PHZlbnR1cmVAZ29vZ2xlLmNvbT4gd3JvdGU6DQogICAgICAgID4NCiAgICAgICAgPiAgICAgK0ph
bWVzIEZlaXN0IHRvIHByb3ZpZGUgYXNzaXN0YW5jZS4NCiAgICAgICAgPg0KICAgICAgICA+ICAg
ICBPbiBUdWUsIEFwciAzMCwgMjAxOSBhdCAxMTozMCBBTSBWaWpheSBLaGVta2EgPHZpamF5a2hl
bWthQGZiLmNvbT4gd3JvdGU6DQogICAgICAgID4gICAgID4NCiAgICAgICAgPiAgICAgPiBJIGhh
dmUgZW5hYmxlZCBwaG9zcGhvci1waWQtY29udHJvbCBpbiBteSBpbWFnZSBhbmQgSSBzZWUgZm9s
bG93aW5nIGxvZw0KICAgICAgICA+ICAgICA+DQogICAgICAgID4gICAgID4NCiAgICAgICAgPiAg
ICAgPg0KICAgICAgICA+ICAgICA+IEFwciAxMiAyMzoyMjo0MyB0aW9nYXBhc3Mgc3lzdGVtZFsx
XTogU3RhcnRlZCBQaG9zcGhvci1QaWQtQ29udHJvbCBNYXJnaW4tYmFzZWQgRmFuIENvbnRyb2wg
RGFlbW9uLg0KICAgICAgICA+ICAgICA+DQogICAgICAgID4gICAgID4gQXByIDEyIDIzOjIyOjQ2
IHRpb2dhcGFzcyBzd2FtcGRbMTA3Ml06IHRlcm1pbmF0ZSBjYWxsZWQgYWZ0ZXIgdGhyb3dpbmcg
YW4gaW5zdGFuY2Ugb2YgJ3N0ZDo6cnVudGltZV9lcnJvcicNCiAgICAgICAgPiAgICAgPg0KICAg
ICAgICA+ICAgICA+IEFwciAxMiAyMzoyMjo0NiB0aW9nYXBhc3Mgc3dhbXBkWzEwNzJdOiAgIHdo
YXQoKTogIE9iamVjdE1hcHBlciBDYWxsIEZhaWx1cmUNCiAgICAgICAgPiAgICAgPg0KICAgICAg
ICA+ICAgICA+IEFwciAxMiAyMzoyMzowNCB0aW9nYXBhc3Mgc3lzdGVtZFsxXTogW1swOzE7Mzlt
W1swOzE7MzFtW1swOzE7MzltcGhvc3Bob3ItcGlkLWNvbnRyb2wuc2VydmljZTogTWFpbiBwcm9j
ZXNzIGV4aXRlZCwgY29kZT1raWxsZWQsIHN0YXR1cz02L0FCUlRbWzBtDQogICAgICAgID4gICAg
ID4NCiAgICAgICAgPiAgICAgPiBBcHIgMTIgMjM6MjM6MDQgdGlvZ2FwYXNzIHN5c3RlbWRbMV06
IFtbMDsxOzM5bVtbMDsxOzMxbVtbMDsxOzM5bXBob3NwaG9yLXBpZC1jb250cm9sLnNlcnZpY2U6
IEZhaWxlZCB3aXRoIHJlc3VsdCAnc2lnbmFsJy5bWzBtDQogICAgICAgID4gICAgID4NCiAgICAg
ICAgPiAgICAgPiBBcHIgMTIgMjM6MjM6MTMgdGlvZ2FwYXNzIHN5c3RlbWRbMV06IHBob3NwaG9y
LXBpZC1jb250cm9sLnNlcnZpY2U6IFNlcnZpY2UgUmVzdGFydFNlYz01cyBleHBpcmVkLCBzY2hl
ZHVsaW5nIHJlc3RhcnQuDQogICAgICAgID4gICAgID4NCiAgICAgICAgPiAgICAgPiBBcHIgMTIg
MjM6MjM6MTMgdGlvZ2FwYXNzIHN5c3RlbWRbMV06IHBob3NwaG9yLXBpZC1jb250cm9sLnNlcnZp
Y2U6IFNjaGVkdWxlZCByZXN0YXJ0IGpvYiwgcmVzdGFydCBjb3VudGVyIGlzIGF0IDEuDQogICAg
ICAgID4gICAgID4NCiAgICAgICAgPiAgICAgPiBBcHIgMTIgMjM6MjM6MTYgdGlvZ2FwYXNzIHN5
c3RlbWRbMV06IFN0b3BwZWQgUGhvc3Bob3ItUGlkLUNvbnRyb2wgTWFyZ2luLWJhc2VkIEZhbiBD
b250cm9sIERhZW1vbi4NCiAgICAgICAgPiAgICAgPg0KICAgICAgICA+ICAgICA+IEFwciAxMiAy
MzoyMzoxNiB0aW9nYXBhc3Mgc3lzdGVtZFsxXTogU3RhcnRlZCBQaG9zcGhvci1QaWQtQ29udHJv
bCBNYXJnaW4tYmFzZWQgRmFuIENvbnRyb2wgRGFlbW9uLg0KICAgICAgICA+ICAgICA+DQogICAg
ICAgID4gICAgID4gQXByIDEyIDIzOjIzOjE3IHRpb2dhcGFzcyBzd2FtcGRbMTE0NV06IE5vIGZh
biB6b25lcywgYXBwbGljYXRpb24gcGF1c2luZyB1bnRpbCByZWJvb3QNCiAgICAgICAgPiAgICAg
Pg0KICAgICAgICA+ICAgICA+IEFwciAxMiAyMzoyMzoyNyB0aW9nYXBhc3Mgc3dhbXBkWzExNDVd
OiBOZXcgY29uZmlndXJhdGlvbiBkZXRlY3RlZCwgcmVzdGFydGluZw0KICAgICAgICA+ICAgICA+
DQogICAgICAgID4gICAgID4gQXByIDEyIDIzOjIzOjI3IHRpb2dhcGFzcyBzd2FtcGRbMTE0NV06
IC4NCiAgICAgICAgPiAgICAgPg0KICAgICAgICA+ICAgICA+IEFwciAxMiAyMzoyMzoyNyB0aW9n
YXBhc3Mgc3lzdGVtZFsxXTogcGhvc3Bob3ItcGlkLWNvbnRyb2wuc2VydmljZTogU3VjY2VlZGVk
Lg0KICAgICAgICA+ICAgICA+DQogICAgICAgID4gICAgID4gQXByIDEyIDIzOjIzOjMyIHRpb2dh
cGFzcyBzeXN0ZW1kWzFdOiBwaG9zcGhvci1waWQtY29udHJvbC5zZXJ2aWNlOiBTZXJ2aWNlIFJl
c3RhcnRTZWM9NXMgZXhwaXJlZCwgc2NoZWR1bGluZyByZXN0YXJ0Lg0KICAgICAgICA+ICAgICA+
DQogICAgICAgID4gICAgID4gQXByIDEyIDIzOjIzOjMyIHRpb2dhcGFzcyBzeXN0ZW1kWzFdOiBw
aG9zcGhvci1waWQtY29udHJvbC5zZXJ2aWNlOiBTY2hlZHVsZWQgcmVzdGFydCBqb2IsIHJlc3Rh
cnQgY291bnRlciBpcyBhdCAyLg0KICAgICAgICA+ICAgICA+DQogICAgICAgID4gICAgID4gQXBy
IDEyIDIzOjIzOjMzIHRpb2dhcGFzcyBzeXN0ZW1kWzFdOiBTdG9wcGVkIFBob3NwaG9yLVBpZC1D
b250cm9sIE1hcmdpbi1iYXNlZCBGYW4gQ29udHJvbCBEYWVtb24uDQogICAgICAgID4gICAgID4N
CiAgICAgICAgPiAgICAgPiBBcHIgMTIgMjM6MjM6MzMgdGlvZ2FwYXNzIHN5c3RlbWRbMV06IFN0
YXJ0ZWQgUGhvc3Bob3ItUGlkLUNvbnRyb2wgTWFyZ2luLWJhc2VkIEZhbiBDb250cm9sIERhZW1v
bi4NCiAgICAgICAgPiAgICAgPg0KICAgICAgICA+ICAgICA+IEFwciAxMiAyMzoyMzozNCB0aW9n
YXBhc3Mgc3dhbXBkWzExODNdOiBObyBmYW4gem9uZXMsIGFwcGxpY2F0aW9uIHBhdXNpbmcgdW50
aWwgcmVib290DQogICAgICAgID4gICAgID4NCiAgICAgICAgPiAgICAgPg0KICAgICAgICA+ICAg
ICA+DQogICAgICAgID4gICAgID4NCiAgICAgICAgPiAgICAgPg0KICAgICAgICA+ICAgICA+IEkg
aGF2ZSBjb25maWd1cmF0aW9uIGRlZmluZWQgdGhyb3VnaCBlbnRpdHkgbWFuYWdlci4gV2hhdCBp
cyB0aGUgYmVzdCB3YXkgdG8gZGVidWcgdGhpcyBhbmQgbW9kaWZ5IGNvbmZpZ3VyYXRpb25zLg0K
ICAgICAgICA+ICAgICA+DQogICAgICAgID4gICAgID4NCiAgICAgICAgPiAgICAgPg0KICAgICAg
ICA+ICAgICA+IFJlZ2FyZHMNCiAgICAgICAgPiAgICAgPg0KICAgICAgICA+ICAgICA+IC1WaWph
eQ0KICAgICAgICA+DQogICAgICAgID4NCiAgICAgICAgDQogICAgDQogICAgDQoNCg==
