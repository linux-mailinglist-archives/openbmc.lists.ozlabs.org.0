Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D208DE0AF6
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 19:47:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yLYN2L4LzDqMp
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 04:47:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=51984423fe=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="GKmoUTzL"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="VoOeSm3y"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yLXg2R0nzDqK5
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 04:46:26 +1100 (AEDT)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id x9MHi0DY019778;
 Tue, 22 Oct 2019 10:46:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=vn4W9f8YaEglwb3TrZz7nT/Ij/Hw2tqK2y8Vx4oq2d0=;
 b=GKmoUTzLirAlfZMpwJzPAsVR3G/jvXC7MbKuIt7ynnrNJaUNolz7VpN8EDLx9NoPU++P
 +ZdLqjPSHgpeI2W1jCAzcu3IKfJaVdJOeXUulFx/0A0G7J7zpGnCSU3RMORl9VcLx3j6
 +O8sBhPY+i+zjwOvxxeRVM907vih7VnHJDM= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0089730.ppops.net with ESMTP id 2vsvnbaxvn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 22 Oct 2019 10:46:21 -0700
Received: from ash-exopmbx101.TheFacebook.com (2620:10d:c0a8:82::b) by
 ash-exhub103.TheFacebook.com (2620:10d:c0a8:82::c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 22 Oct 2019 10:46:21 -0700
Received: from ash-exhub204.TheFacebook.com (2620:10d:c0a8:83::4) by
 ash-exopmbx101.TheFacebook.com (2620:10d:c0a8:82::b) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 22 Oct 2019 10:46:21 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.100) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 22 Oct 2019 10:46:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bBZSVMK0ST8+etnXx5AUvURtauNjQ5fLfcFzmL8xFjYehyDbFerCKjCUvnmV7VrG+uvLEbjBS5wy1I+htrNKPXFWi6KpSEVqvgy49I9KfKcC8hODIwcTHArlevM5bPMeOHlHWbFRU48RIaMEP725DfFH9G+Bh1GlUjdthw15oVBY4zp64HXrJmJu7y96hsiCrBGwB+RF5UiREhsuP7vrcC+IP6Yblx8PUiBC06N20t7QLmPUkY6GDVNh79mr4ORoEkBGByJolsxr2z6hB7SWi/Q5ukQTcY7Xz7Nom8QJOkM++R8Agn6QoRLDXDJSYNsILCsqBChZLupwbyoQInAaDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vn4W9f8YaEglwb3TrZz7nT/Ij/Hw2tqK2y8Vx4oq2d0=;
 b=oLbNzpAac6lGevuFDUgYrYklom941UDL+1Zg/QF2BtBRMHiYIU12x0GeroBsWOOPLQQPzVbNdL/5bltdQByj8iF9R77VPkFmrdBu6iOjfp0qiEvh+Z3CXNgowOA33QbYYZgPlNGXdpKNEG69QurMDmeyje4M2bZcNYU4sRCEgal1yuydexxTDM4Hw/N6P75hgBG7w8IBj0+3jwyi9FOz24fDsQnDZCnRZNWx7O8HS8SUj9THCWP5owNZ6bOgTUjAopG6sI8Ha0IflAxmtOxg6BoaJCmGJjuMNQkh0iV0qAjpq1wQVFnGxh9DcKI346qagWNjNfRPiP07tcEIDiYeGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vn4W9f8YaEglwb3TrZz7nT/Ij/Hw2tqK2y8Vx4oq2d0=;
 b=VoOeSm3ybpfEaLC8sRbYQHJB6BDBVOSi5vjRb5M6774H2aGy6QwYKZBzwcuFHQXdzTcl0E+AQ3guuC2wnn2npvXD9L5QoNsdce5BAEn7gdJ0NajgBdLaA7AO6jd/Oz4JKlh9T+Wqbfm9Xq7Kb8HBRVaXqPKdWxhtlg1TGceCzyk=
Received: from BY5PR15MB3636.namprd15.prod.outlook.com (52.133.252.91) by
 BY5PR15MB3651.namprd15.prod.outlook.com (52.133.252.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Tue, 22 Oct 2019 17:46:19 +0000
Received: from BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::7887:4f9c:70df:285c]) by BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::7887:4f9c:70df:285c%4]) with mapi id 15.20.2347.029; Tue, 22 Oct 2019
 17:46:19 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: x86-power-control
Thread-Topic: x86-power-control
Thread-Index: AQHVhIgk7/7PtKOKbUeMJf/8spu+0qde/1mA///3sgCAAIQ8gP//kgqAgAGlawD//9+wgAClgtMA//+vbgCAAYFlgP//k3gA
Date: Tue, 22 Oct 2019 17:46:19 +0000
Message-ID: <4230479D-77FD-4073-B478-2D0B34C2927A@fb.com>
References: <EA590716-271A-4F5C-9B36-80260B7F35B6@fb.com>
 <66afaaab-baee-fc02-371b-2ef4a9f0d1ee@linux.intel.com>
 <37843B68-8D1C-48EB-B4B6-64CBC8F62F77@fb.com>
 <79190494-f452-286b-e304-7a901a3db26c@linux.intel.com>
 <8F55F038-A6E7-46A4-8C27-93C738AFEBDC@fb.com>
 <5d43146c-b8b9-164e-ed54-33df4bae6dce@linux.intel.com>
 <F590F665-9327-4C8D-8C23-C317DA71D7F0@fb.com>
 <54c375be-e45e-fc2a-dd31-6c9d61158169@linux.intel.com>
 <6DA89556-AD25-4BEE-AF40-9D7A129B7CB9@fb.com>
 <548712d2-820b-7c20-f05e-fbd80ab38c62@linux.intel.com>
In-Reply-To: <548712d2-820b-7c20-f05e-fbd80ab38c62@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::677]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35b40424-a394-4abe-b6d1-08d75717bf10
x-ms-traffictypediagnostic: BY5PR15MB3651:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BY5PR15MB36512BEA89CAA83D092F6E05DD680@BY5PR15MB3651.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(39860400002)(136003)(366004)(346002)(189003)(199004)(66946007)(305945005)(7736002)(6436002)(110136005)(6486002)(229853002)(6246003)(316002)(102836004)(76176011)(2501003)(36756003)(6506007)(966005)(53546011)(14454004)(11346002)(71190400001)(186003)(8676002)(14444005)(256004)(446003)(71200400001)(76116006)(8936002)(25786009)(486006)(81166006)(81156014)(2616005)(478600001)(91956017)(476003)(86362001)(5660300002)(46003)(99286004)(6512007)(6306002)(64756008)(6116002)(66556008)(2906002)(66476007)(33656002)(66446008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR15MB3651;
 H:BY5PR15MB3636.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zl1e1JZ4Up/+MseKiEwEoZIW6SZEA2EI+RhaAGWkj2v3/hj18+AKQ3Pck/Rtj5c7OSQ6cmwfOEkoq+HfzRMNPFNI59T9o774ebxh9u2N1bvJ4QQUik6r31G+SnWAcjACkHawLGbh1otmazhptoattOsWCoQvt/nP3KqXb3int46MBMw4vyWI9KRwW1yl/Vh38dq+H7AmdCS7ka8WeM681BW+uroQ/AO2QuWKXRG1PtMIrNAfuys2TvgvFzzm/gVIiYrXWl+voHjIsbwJ3UhLSiu84Xdb480svdoJNMqzsVVlzqhvg65bhi1WA6L+uRGPAd/8RZ3lYIvRzjaa4fpkzb8pOnV+E70MB1EX9DFFWCCoV0oypbt6W2E9fREC5mfGXe3E50EiLl/xnJk9RvBTTOMtX9ZNwkgcdfitBQCZ010C8+Ccvm316AgB+W39yzvzojZN9L2shHsd5PpClUkpa76vHOM4bYc+ZHW6MRcrT24=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE21CAC3B7ECEE4B8288878547CEA9EE@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b40424-a394-4abe-b6d1-08d75717bf10
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 17:46:19.5503 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CNrMGtlxXs6fkYROs/iywUuE6KB61/HE2jaF88dm2IchC5RVMNevMBk3iSk04APuKulxiQwkrDIBVx7R9t+ZqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3651
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-22_03:2019-10-22,2019-10-22 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910220147
X-FB-Internal: deliver
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

DQoNCu+7v09uIDEwLzIyLzE5LCAxMDoxNiBBTSwgIm9wZW5ibWMgb24gYmVoYWxmIG9mIEJpbGxz
LCBKYXNvbiBNIiA8b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxh
YnMub3JnIG9uIGJlaGFsZiBvZiBqYXNvbi5tLmJpbGxzQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6
DQoNCiAgICANCiAgICANCiAgICBPbiAxMC8yMS8yMDE5IDY6MTUgUE0sIFZpamF5IEtoZW1rYSB3
cm90ZToNCiAgICA+IA0KICAgID4gDQogICAgPiBPbiAxMC8yMS8xOSwgNDowNCBQTSwgIkJpbGxz
LCBKYXNvbiBNIiA8amFzb24ubS5iaWxsc0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOg0KICAgID4g
DQogICAgPiAgICAgIA0KICAgID4gICAgICANCiAgICA+ICAgICAgT24gMTAvMTgvMjAxOSA0OjA0
IFBNLCBWaWpheSBLaGVta2Egd3JvdGU6DQogICAgPiAgICAgID4NCiAgICA+ICAgICAgPg0KICAg
ID4gICAgICA+IE9uIDEwLzE4LzE5LCAxMTowMiBBTSwgIm9wZW5ibWMgb24gYmVoYWxmIG9mIEJp
bGxzLCBKYXNvbiBNIiA8b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5v
emxhYnMub3JnIG9uIGJlaGFsZiBvZiBqYXNvbi5tLmJpbGxzQGxpbnV4LmludGVsLmNvbT4gd3Jv
dGU6DQogICAgPiAgICAgID4NCiAgICA+ICAgICAgPg0KICAgID4gICAgICA+DQogICAgPiAgICAg
ID4gICAgICBPbiAxMC8xNy8yMDE5IDQ6NTIgUE0sIFZpamF5IEtoZW1rYSB3cm90ZToNCiAgICA+
ICAgICAgPiAgICAgID4NCiAgICA+ICAgICAgPiAgICAgID4NCiAgICA+ICAgICAgPiAgICAgID4g
T24gMTAvMTcvMTksIDQ6MjcgUE0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBCaWxscywgSmFzb24g
TSIgPG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJzLm9yZyBv
biBiZWhhbGYgb2YgamFzb24ubS5iaWxsc0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOg0KICAgID4g
ICAgICA+ICAgICAgPg0KICAgID4gICAgICA+ICAgICAgPg0KICAgID4gICAgICA+ICAgICAgPg0K
ICAgID4gICAgICA+ICAgICAgPiAgICAgIE9uIDEwLzE3LzIwMTkgMzozMiBQTSwgVmlqYXkgS2hl
bWthIHdyb3RlOg0KICAgID4gICAgICA+ICAgICAgPiAgICAgID4NCiAgICA+ICAgICAgPiAgICAg
ID4gICAgICA+IE9uIDEwLzE3LzE5LCA5OjAzIEFNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgQmls
bHMsIEphc29uIE0iIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96
bGFicy5vcmcgb24gYmVoYWxmIG9mIGphc29uLm0uYmlsbHNAbGludXguaW50ZWwuY29tPiB3cm90
ZToNCiAgICA+ICAgICAgPiAgICAgID4gICAgICA+DQogICAgPiAgICAgID4gICAgICA+ICAgICAg
PiAgICAgIEhpIFZpamF5DQogICAgPiAgICAgID4gICAgICA+ICAgICAgPg0KICAgID4gICAgICA+
ICAgICAgPiAgICAgID4gICAgICBPbiAxMC8xNi8yMDE5IDY6MTMgUE0sIFZpamF5IEtoZW1rYSB3
cm90ZToNCiAgICA+ICAgICAgPiAgICAgID4gICAgICA+ICAgICAgPiBPbmUgbW9yZSBxdWVzdGlv
biBvbiBjb2RlLCBJIHNlZSBmb2xsb3dpbmcgY29kZSByZXF1aXJlcyBwb3dlckJ1dHRvbk1hc2sN
CiAgICA+ICAgICAgPiAgICAgID4gICAgICA+ICAgICAgPiB0byBiZSBzZXQgYmVmb3JlIGFxdWly
aW5nIEdQSU8gbGluZS4gUGxlYXNlIGxldCBtZSBrbm93IHdobyBzZXRzIHRoaXMNCiAgICA+ICAg
ICAgPiAgICAgID4gICAgICA+ICAgICAgPiBwb3dlckJ1dHRvbk1hc2sgdG8gdHJ1ZS4gSSBrbm93
IHRoaXMgaXMgcmVsYXRlZCB0byBHUElPIHBhc3N0aHJvdWdoIGJ1dA0KICAgID4gICAgICA+ICAg
ICAgPiAgICAgID4gICAgICA+IHN0aWxsIGNvdWxkbuKAmXQgdW5kZXJzdGFuZCB3aGVyZSBpbiBj
b2RlIGl0IGdldHMgc2V0IHVudGlsIHNvbWVvbmUgY2FsbA0KICAgID4gICAgICA+ICAgICAgPiAg
ICAgID4gICAgICA+IHNldC1wcm9wZXJ0eSBvZiBkYnVzLg0KICAgID4gICAgICA+ICAgICAgPiAg
ICAgID4NCiAgICA+ICAgICAgPiAgICAgID4gICAgICA+ICAgICAgcG93ZXJCdXR0b25NYXNrIGlz
IGEgZ3Bpb2Q6OmxpbmUgb2JqZWN0IHRoYXQgcmV0dXJucyB0cnVlIGlmIGl0DQogICAgPiAgICAg
ID4gICAgICA+ICAgICAgPiAgICAgIHJlZmVyZW5jZXMgYSBHUElPIGxpbmUgYW5kIGZhbHNlIG90
aGVyd2lzZS4NCiAgICA+ICAgICAgPiAgICAgID4gICAgICA+DQogICAgPiAgICAgID4gICAgICA+
ICAgICAgPiBJIHVuZGVyc3Rvb2QgY29kZSBidXQgbXkgcG9pbnQgaGVyZSBpcyB0aGVyZSB3aWxs
IG5vdCBiZSBhbnkNCiAgICA+ICAgICAgPiAgICAgID4gICAgICA+IGdwaW9kOjpsaW5lIG9iamVj
dCBpZiBwb3dlckJ1dHRvbk1hc2sgaXMgZGVmaW5lZCBhcyBmYWxzZS4gQW5kDQogICAgPiAgICAg
ID4gICAgICA+ICAgICAgPiBpbml0aWFsbHkgaXQgaXMgZGVmaW5lZCBhcyBmYWxzZSBtZWFucyB0
ZWhyZSB3aWxsIG5vdCBiZSBhbnkgbGluZQ0KICAgID4gICAgICA+ICAgICAgPiAgICAgID4gb2Jq
ZWN0IGNyZWF0ZWQgdW50aWwgc29tZW9uZSBzZXRzIGl0IHRvIHRydWUuIEFuZCBJIGRvbid0IHNl
ZSBpdA0KICAgID4gICAgICA+ICAgICAgPiAgICAgID4gYW55IHdheSB0byBzZXQgaXQgdHJ1ZSBv
dGhlciB0aGFuIHNldC1wcm9wZXJ0eSB0aHJvdWdoIGRidXMuDQogICAgPiAgICAgID4gICAgICA+
DQogICAgPiAgICAgID4gICAgICA+ICAgICAgVGhhdCdzIGNvcnJlY3QuICBNYXNraW5nIHRoZSBw
b3dlciBidXR0b24gaXMgc29tZXRoaW5nIHRoYXQgaXMgZG9uZSBieQ0KICAgID4gICAgICA+ICAg
ICAgPiAgICAgIHNvbWUgY29tcG9uZW50IG91dHNpZGUgb2YgcG93ZXItY29udHJvbC4NCiAgICA+
ICAgICAgPiAgICAgID4NCiAgICA+ICAgICAgPiAgICAgID4gICAgICBGb3IgZXhhbXBsZSwgd2Ug
Y3VycmVudGx5IHVzZSBpdCB3aXRoIHRoZSBTZXQgRnJvbnQgUGFuZWwgQnV0dG9uIEVuYWJsZXMN
CiAgICA+ICAgICAgPiAgICAgID4gICAgICBJUE1JIGNvbW1hbmQgdG8gZW5hYmxlL2Rpc2FibGUg
dGhlIHBvd2VyIGJ1dHRvbi4gIFNvLCBpdCBpcyBvbmx5IG1hc2tlZA0KICAgID4gICAgICA+ICAg
ICAgPiAgICAgIHdoZW4gcmVxdWVzdGVkLg0KICAgID4gICAgICA+ICAgICAgPiBTbyB0byB1c2Ug
eC04Ni1wb3dlci1jb250cm9sLCBlaXRoZXIgd2UgbmVlZCB0byBoYXZlIElQTUkgY29tbWFuZCB0
byBlbmFibGUNCiAgICA+ICAgICAgPiAgICAgID4gdGhpcyBvciBzb21lIG90aGVyIGRhZW1vbiBo
YXMgdG8gc2V0IHRoaXMgcHJvcGVydHkuIENhbiB3ZSBoYXZlIHRoaXMgZmVhdHVyZQ0KICAgID4g
ICAgICA+ICAgICAgPiBvcHRpb25hbC4gSSBndWVzcyB0aGlzIGlzIGEgcHJ0IG9nIEdQSU8gcGFz
c3Rocm91Z2guDQogICAgPiAgICAgID4NCiAgICA+ICAgICAgPiAgICAgIFllcywgdGhpcyBpcyBw
YXJ0IG9mIEdQSU8gcGFzc3Rocm91Z2guICBXaGVuIHRoZSBHUElPIGlzIHJlcXVlc3RlZCwNCiAg
ICA+ICAgICAgPiAgICAgIHBhc3N0aHJvdWdoIGlzIGRpc2FibGVkIGluIHRoZSBwaW5jdHJsIGRy
aXZlci4gIFNvLCB0byBtYXNrIHRoZSBwb3dlcg0KICAgID4gICAgICA+ICAgICAgYnV0dG9uIChk
aXNhYmxlIHBhc3N0aHJvdWdoKSwgcG93ZXItY29udHJvbCByZXF1ZXN0cyBhbmQgaG9sZHMgdGhl
DQogICAgPiAgICAgID4gICAgICAiUE9XRVJfT1VUIiBHUElPIGxpbmUuDQogICAgPiAgICAgID4N
CiAgICA+ICAgICAgPiAgICAgIEl0IHNob3VsZCBiZWhhdmUgbm9ybWFsbHkgd2l0aG91dCB0aGlz
IHByb3BlcnR5IGV2ZXIgZ2V0dGluZyBzZXQuDQogICAgPiAgICAgID4NCiAgICA+ICAgICAgPiAg
ICAgID4NCiAgICA+ICAgICAgPiAgICAgID4gICAgICBUaGUgYWN0dWFsICJQT1dFUl9PVVQiIGxp
bmUgZm9yIHBvd2VyLWNvbnRyb2wgaXMgbm90IHBlcm1hbmVudGx5DQogICAgPiAgICAgID4gICAg
ICA+ICAgICAgY3JlYXRlZCwgYnV0IGlzIGFzc2VydGVkIHVzaW5nIHRlbXBvcmFyeSBjYWxscyBs
aWtlIHRoaXMgb25lOg0KICAgID4gICAgICA+ICAgICAgPiAgICAgIHNldEdQSU9PdXRwdXRGb3JN
cygiUE9XRVJfT1VUIiwgMCwgcG93ZXJQdWxzZVRpbWVNcyk7DQogICAgPiAgICAgID4gICAgICA+
DQogICAgPiAgICAgID4gICAgICA+IFRoaXMgZnVuY3Rpb24gd2lsbCBub3QgcnVuIHBvd2VyIG9u
L29mZiBzZXF1ZW5jZSB1bnRpbCBidXR0b24gbWFzayBpcyBzZXQuIEl0DQogICAgPiAgICAgID4g
ICAgICA+IFdpbGwgb25seSBzZXQgR1BJTyB2YWx1ZSB3aGljaCBpcyBub3QgZW5vdWdoIGZvciBw
b3dlcmluZyBvbi9vZmYuDQogICAgPiAgICAgID4NCiAgICA+ICAgICAgPiAgICAgIFNvbWV0aGlu
ZyBlbHNlIGlzIGdvaW5nIG9uLCBoZXJlLiAgVGhlIHBvd2VyQnV0dG9uTWFzayBpcyBhIHNlcGFy
YXRlDQogICAgPiAgICAgID4gICAgICBmZWF0dXJlIGZyb20gZHJpdmluZyB0aGUgIlBPV0VSX09V
VCIgcGluLiAgSWYgcG93ZXJCdXR0b25NYXNrIGlzIG5vdA0KICAgID4gICAgICA+ICAgICAgc2V0
LCB0aGVuIHRoZSBwb3dlciBvbi9vZmYgc2hvdWxkIGZ1bmN0aW9uIG5vcm1hbGx5LiAgVGhlcmUg
aXMgYSBzcGVjaWFsDQogICAgPiAgICAgID4gICAgICBjYXNlIGluIHRoZSBzZXRHUElPT3V0cHV0
Rm9yTXMoKSBjb2RlIHRvIGhhbmRsZSB3aGVuICJQT1dFUl9PVVQiIGlzDQogICAgPiAgICAgID4g
ICAgICBkcml2ZW4gd2hpbGUgcG93ZXJCdXR0b25NYXNrIGlzIHRydWU6DQogICAgPiAgICAgID4N
CiAgICA+ICAgICAgPiAgICAgICAgICAgLy8gSWYgdGhlIHJlcXVlc3RlZCBHUElPIGlzIG1hc2tl
ZCwgdXNlIHRoZSBtYXNrIGxpbmUgdG8gc2V0IHRoZSBvdXRwdXQNCiAgICA+ICAgICAgPiAgICAg
ICAgICAgaWYgKHBvd2VyQnV0dG9uTWFzayAmJiBuYW1lID09ICJQT1dFUl9PVVQiKQ0KICAgID4g
ICAgICA+ICAgICAgICAgICB7DQogICAgPiAgICAgID4gICAgICAgICAgICAgICByZXR1cm4gc2V0
TWFza2VkR1BJT091dHB1dEZvck1zKHBvd2VyQnV0dG9uTWFzaywgbmFtZSwgdmFsdWUsDQogICAg
PiAgICAgID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGR1
cmF0aW9uTXMpOw0KICAgID4gICAgICA+ICAgICAgICAgICB9DQogICAgPiAgICAgID4gICAgICAg
ICAgIC4uLg0KICAgID4gICAgICA+ICAgICAgICAgICAvLyBObyBtYXNrIHNldCwgc28gcmVxdWVz
dCBhbmQgc2V0IHRoZSBHUElPIG5vcm1hbGx5DQogICAgPiAgICAgID4NCiAgICA+ICAgICAgPiAg
ICAgIFNvLCAiUE9XRVJfT1VUIiBzaG91bGQgd29yayBlaXRoZXIgd2F5LCBidXQgdGhlIGRlZmF1
bHQgYmVoYXZpb3IgaXMgdG8NCiAgICA+ICAgICAgPiAgICAgIGZ1bmN0aW9uIHdpdGhvdXQgcG93
ZXJCdXR0b25NYXNrIHNldC4gIEFyZSB5b3Ugc2VlaW5nIGZhaWx1cmVzIG9uIHlvdXINCiAgICA+
ICAgICAgPiAgICAgIHBsYXRmb3JtIHdoZW4gcG93ZXJCdXR0b25NYXNrIGlzIGZhbHNlPw0KICAg
ID4gICAgICA+DQogICAgPiAgICAgID4gTm8sIEl0IGlzIG5vdCB3b3JraW5nIGJlY2F1c2UgaXQg
c2ltcGxweSBzZXRzIHBvd2VyX291dCB0byAnMCcuIEJ1dCB0byBwb3dlciBvbg0KICAgID4gICAg
ICA+IGl0IHNob3VsZCBnb3QgZG93biBhcyAwIGFuZCBjb21lIGJhY2sgdG8gMSBhZnRlciBhIGRl
bGF5LiBXaGljaCBoYXBwZW5zIG9ubHkNCiAgICA+ICAgICAgPiBpbiBjYXNlIG9mIHBvd2VyQnV0
dG9uTWFzayBzZXQgdG8gdHJ1ZS4gSSBndWVzcyB3ZSBtYXkgbmVlZCB0byBmaXggdGhpcy4NCiAg
ICA+ICAgICAgDQogICAgPiAgICAgIEFoaCwgb2theS4gIEkgdGhpbmsgSSBzZWUgdGhlIGlzc3Vl
IG5vdy4NCiAgICA+ICAgICAgDQogICAgPiAgICAgIFRoZSBpc3N1ZSBpcyB0aGF0IGJlY2F1c2Ug
cmVsZWFzaW5nIHRoZSBHUElPIG9uIGEgc3lzdGVtIHdpdGgNCiAgICA+ICAgICAgcGFzcy10aHJv
dWdoLCBzZXRzIHRoZSBwb3dlciBidXR0b24gYmFjayB0byB0aGUgaGFyZHdhcmUgZGVmYXVsdA0K
ICAgID4gICAgICBhdXRvbWF0aWNhbGx5LCB0aGUgc29mdHdhcmUgc2V0dGluZyBkb2Vzbid0IG1h
dHRlciwgc28gaXQgaXMgbGVmdCBhdCAwLg0KICAgID4gICAgICANCiAgICA+ICAgICAgSWYgeW91
IGRvbid0IG5lZWQgdG8ga2VlcCBob2xkaW5nIHRoZSBHUElPIGxpbmUgZm9yIFBPV0VSX09VVCwg
SSB0aGluaw0KICAgID4gICAgICB5b3UgY2FuIGp1c3QgYWRkIHRoZSBjb2RlIHRvIHJldmVydCB0
aGUgUE9XRVJfT1VUIHZhbHVlIHdoZW4gdGhlIHRpbWVyDQogICAgPiAgICAgIGV4cGlyZXMuDQog
ICAgPiAgICAgIA0KICAgID4gICAgICBUYWtlIHRoaXMgbGluZToNCiAgICA+ICAgICAgICAgICAg
ICAgICAgIC8vIFNldCB0aGUgbWFza2VkIEdQSU8gbGluZSBiYWNrIHRvIHRoZSBvcHBvc2l0ZSB2
YWx1ZQ0KICAgID4gICAgICAgICAgICAgICAgICAgbWFza2VkR1BJT0xpbmUuc2V0X3ZhbHVlKCF2
YWx1ZSk7DQogICAgPiAgICAgICBGcm9tIGhlcmU6DQogICAgPiAgICAgIGh0dHBzOi8vZ2l0aHVi
LmNvbS9vcGVuYm1jL3g4Ni1wb3dlci1jb250cm9sL2Jsb2IvbWFzdGVyL3Bvd2VyLWNvbnRyb2wt
eDg2L3NyYy9wb3dlcl9jb250cm9sLmNwcCNMODkxDQogICAgPiAgICAgIA0KICAgID4gICAgICBB
bmQgYWRkIGl0IGhlcmU6DQogICAgPiAgICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3g4
Ni1wb3dlci1jb250cm9sL2Jsb2IvbWFzdGVyL3Bvd2VyLWNvbnRyb2wteDg2L3NyYy9wb3dlcl9j
b250cm9sLmNwcCNMOTMyDQogICAgPiANCiAgICA+IEkgYWxyZWFkeSBkaWQgdGhhdCBhcyBhIHdv
cmsgYXJvdW5kLCB0ZXN0aW5nIGRpZmZlcmVudCBzY2VuYXJpby4gV2lsbCBzZW5kIHBhdGNoIG9u
Y2UgSSBzZWUgaXQgd29ya2luZy4NCiAgICA+IA0KICAgID4gSSBhbHNvIHdhbnQgdG8gbWFrZSB0
aGVzZSB0aW1lb3V0IHZhbHVlcyBhcyBjb25maWd1cmFibGUsIGVpdGhlciBJIGNhbiBhZGQgdGhl
c2UgYXMgYSBwcm9wZXJ0eSBpbiBkYnVzIGludGVyZmFjZSBvcg0KICAgID4gRW50aXR5LW1hbmFn
ZXIgb3IgaGF2ZSBhIHNlcGFyYXRlIGNvbmZpZyBqc29uIGZpbGUuIFdoYXQgd291bGQgeW91IHBy
ZWZlci4NCiAgICBBbm90aGVyIG9wdGlvbiB0aGF0IG1heSBiZSBzaW1wbGVyIGlzIHRvIG1vdmUg
dGhlIHZhbHVlcyB0aGF0IHlvdSB3YW50IA0KICAgIHRvIGNvbmZpZ3VyZSBvdXQgdG8gYSBoZWFk
ZXIgZmlsZSBhbmQgdGhlbiBvdmVycmlkZSB0aGUgaGVhZGVyIGluIGEgDQogICAgYmJhcHBlbmQu
ICBUaGVuIHlvdSBkb24ndCBuZWVkIHRvIHJlYWQgb3IgcGFyc2UgYW55IGFkZGl0aW9uYWwgDQog
ICAgY29uZmlndXJhdGlvbiBpbmZvcm1hdGlvbiBhdCBydW4gdGltZS4NCiAgICANCkkgY2FuIGRv
IHRoYXQgYnV0IGJiYXBwZW5kIGZvciBwYXRjaCBpcyBub3QgYWNjZXB0ZWQgaW4gYW55IHJlcG9z
aXRvcnkuDQogICAgPiANCiAgICA+ICAgICAgDQogICAgPiAgICAgID4NCiAgICA+ICAgICAgPg0K
ICAgID4gICAgICANCiAgICA+IA0KICAgIA0KDQo=
