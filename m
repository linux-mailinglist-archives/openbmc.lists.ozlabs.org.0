Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A455DBA52
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 01:53:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vQvt0lhFzDqn4
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 10:52:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=51932c9067=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="VuCsIgYD"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="fvJxq9Wd"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vQty0zbxzDqlw
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 10:52:08 +1100 (AEDT)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9HNnF4q000853; Thu, 17 Oct 2019 16:52:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=Zpa7/BzG/5tyMj1zv09AT7XygrAXnJ2LjssJv5iUNW0=;
 b=VuCsIgYDw5F6JrOjJvWyOers/3qJMU7nIXX51QLn7DmlWHCEV/uoRmiYF2Tlzui3fZbv
 ThyYYlBA4gTZYw1pAJVSf9nW3p3bw+nmzWeTwkItqscQ4nxG39asLpbMRr50eAYxuWes
 uGlUr99VBZkMnzKwaeH7bCutkpUwcS3mGPU= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2vp84aesrx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 17 Oct 2019 16:52:04 -0700
Received: from prn-hub05.TheFacebook.com (2620:10d:c081:35::129) by
 prn-hub03.TheFacebook.com (2620:10d:c081:35::127) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Thu, 17 Oct 2019 16:52:02 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Thu, 17 Oct 2019 16:52:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mHC2FjaF+52x3ja1O4yl7tD7p1fRZkTkrH2PVuMsvWIn5bqQ1jG91npSekl91mh4d5ALqesOu3b4K+4trNdzUvKLGU6/YrrPN6y+l3eN6+X6OGhjbZwu9PgJQJYIep/V7o5cknagZSzirtIYaYFlB5h3eQDyI4ug6oXK4xXOrALOlQEBpcHzh4mKk0Sfq7OtS7N31Op+NNcS1rzcyg1jCYvdAOaTU4TsngF/mMLR2p2+NzClo8EzWGPF2w/ar4+UnnhYDBFRVgn5ojKQHHPXpKkh2/qYscWlOIMb1HYulaT5q7riox8rCe+MCHQFxd/zlwqk+4uTtUs1RmkWUjYYuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zpa7/BzG/5tyMj1zv09AT7XygrAXnJ2LjssJv5iUNW0=;
 b=GT2IgobKx2EuiN0Q2H4w2TTPrOmN0O+I61D1AdyUgYzjwtS5DV9+Q/vakPiO6VbIUXuEgbMzEbTYcUyOqFc4tLrPJWsksp0979yyk689yHi3zjkrZg9nYLVzj93p1gcPS68rjQd3gzsmAOkdJ2TikR9qPiIWz+inqdsKaY6AVSu5v/Yt+AGXpZ7mI5DAKBWViuDmmWrYvwXXnrEvdKJpWen0ZR/TVDAkF5JvuISkvyyAuyzGwuxyBwfPwz7W1VqFt4DZ33qFeSxo11pRbsMUWqjM19A540x1J5huO6ovbycJCmMoi1f6mlj1UEjjPCvChxCJxeobMxpW8c/bb6e2Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zpa7/BzG/5tyMj1zv09AT7XygrAXnJ2LjssJv5iUNW0=;
 b=fvJxq9WdT4BEt2olhc+uHk5VQ4uKtTJw23zaIlOFnMJLOxyvKfMmVRFJGmOkeY3J4fcYD5BqBg4U75oo/qbioTsKSxYNTysMf4PKJvSWEBGg6cScwj40wLWb13Wtxy+FRGgw/G76lHKAuJQW4rpAOciIF7HKUXNdIoMbwNj+g4w=
Received: from BY5PR15MB3636.namprd15.prod.outlook.com (52.133.252.91) by
 BY5PR15MB3617.namprd15.prod.outlook.com (52.133.253.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 17 Oct 2019 23:52:01 +0000
Received: from BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::7887:4f9c:70df:285c]) by BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::7887:4f9c:70df:285c%4]) with mapi id 15.20.2347.024; Thu, 17 Oct 2019
 23:52:01 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: x86-power-control
Thread-Topic: x86-power-control
Thread-Index: AQHVhIgk7/7PtKOKbUeMJf/8spu+0qde/1mA///3sgCAAIQ8gP//kgqA
Date: Thu, 17 Oct 2019 23:52:01 +0000
Message-ID: <8F55F038-A6E7-46A4-8C27-93C738AFEBDC@fb.com>
References: <EA590716-271A-4F5C-9B36-80260B7F35B6@fb.com>
 <66afaaab-baee-fc02-371b-2ef4a9f0d1ee@linux.intel.com>
 <37843B68-8D1C-48EB-B4B6-64CBC8F62F77@fb.com>
 <79190494-f452-286b-e304-7a901a3db26c@linux.intel.com>
In-Reply-To: <79190494-f452-286b-e304-7a901a3db26c@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:f653]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f83c51e1-e5da-4f9c-2849-08d7535d0166
x-ms-traffictypediagnostic: BY5PR15MB3617:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BY5PR15MB361726D68217F38CB8401239DD6D0@BY5PR15MB3617.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(376002)(366004)(39860400002)(136003)(346002)(396003)(189003)(199004)(6506007)(86362001)(478600001)(2501003)(46003)(6512007)(2906002)(7736002)(11346002)(2616005)(486006)(36756003)(229853002)(6436002)(6116002)(6486002)(110136005)(99286004)(446003)(476003)(305945005)(76176011)(102836004)(8936002)(53546011)(186003)(6306002)(8676002)(66946007)(6246003)(81166006)(33656002)(14444005)(256004)(76116006)(71200400001)(91956017)(71190400001)(66476007)(66446008)(64756008)(66556008)(966005)(14454004)(316002)(25786009)(5660300002)(81156014)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR15MB3617;
 H:BY5PR15MB3636.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bMlFgUX8i5V8nhuXanmH72DdlOeU/1mNibboGD9fn4vj2NCW92Yk0j9uul5ymCOPVm5QK7ID4d6hc7GFe83RkjHbRDQ4KjZl7SveenfFTUH2h44npahY8iNxF3wHwczZv6goXlOxzSOTqUEVYV/vDg/VaWT/4D4maUO13pEOCuGmZVb1NME5JscreO8p8u4cM8I1b1ZqGOz6x8pakAjLprccbBHAioO2Cp/tJSoYgHedxNsEAKGGgM2ZecTEX6Vn6Lo3DNKtJj764mzSk4ygRSmqxzbHrFGCxqDFPBkebDRuuAocZx4ny7bFe6tK9MiLPN2lCUnZy2sKYX9Jqo6Tkj5Kv2cRTMOgs2qUdhhOZdEzipA+b/SYae9wiBa3FPyEo92P33bUQcOzBZy9sc7DavRD6V6jdozSfamBM3zduYHfA4q2udgZ56UyW1KGXrXvtMbrYE7PZT8h3vdDjsDUfg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D260BA044D0314895ED7B7C4BEDA3A8@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f83c51e1-e5da-4f9c-2849-08d7535d0166
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 23:52:01.4961 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pBf+sE/XREj/yYJKlzaCmk8YiZdRTkm+ZAqqJe4KInpSg6U2+9j6vJ12cJcKZnlFOcUVhvBgM2yl3kMg6f0llQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3617
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-17_07:2019-10-17,2019-10-17 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 lowpriorityscore=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910170212
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

DQoNCu+7v09uIDEwLzE3LzE5LCA0OjI3IFBNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgQmlsbHMs
IEphc29uIE0iIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFi
cy5vcmcgb24gYmVoYWxmIG9mIGphc29uLm0uYmlsbHNAbGludXguaW50ZWwuY29tPiB3cm90ZToN
Cg0KICAgIA0KICAgIA0KICAgIE9uIDEwLzE3LzIwMTkgMzozMiBQTSwgVmlqYXkgS2hlbWthIHdy
b3RlOg0KICAgID4gDQogICAgPiBPbiAxMC8xNy8xOSwgOTowMyBBTSwgIm9wZW5ibWMgb24gYmVo
YWxmIG9mIEJpbGxzLCBKYXNvbiBNIiA8b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNv
bUBsaXN0cy5vemxhYnMub3JnIG9uIGJlaGFsZiBvZiBqYXNvbi5tLmJpbGxzQGxpbnV4LmludGVs
LmNvbT4gd3JvdGU6DQogICAgPiANCiAgICA+ICAgICAgSGkgVmlqYXkNCiAgICA+ICAgICAgDQog
ICAgPiAgICAgIE9uIDEwLzE2LzIwMTkgNjoxMyBQTSwgVmlqYXkgS2hlbWthIHdyb3RlOg0KICAg
ID4gICAgICA+IE9uZSBtb3JlIHF1ZXN0aW9uIG9uIGNvZGUsIEkgc2VlIGZvbGxvd2luZyBjb2Rl
IHJlcXVpcmVzIHBvd2VyQnV0dG9uTWFzaw0KICAgID4gICAgICA+IHRvIGJlIHNldCBiZWZvcmUg
YXF1aXJpbmcgR1BJTyBsaW5lLiBQbGVhc2UgbGV0IG1lIGtub3cgd2hvIHNldHMgdGhpcw0KICAg
ID4gICAgICA+IHBvd2VyQnV0dG9uTWFzayB0byB0cnVlLiBJIGtub3cgdGhpcyBpcyByZWxhdGVk
IHRvIEdQSU8gcGFzc3Rocm91Z2ggYnV0DQogICAgPiAgICAgID4gc3RpbGwgY291bGRu4oCZdCB1
bmRlcnN0YW5kIHdoZXJlIGluIGNvZGUgaXQgZ2V0cyBzZXQgdW50aWwgc29tZW9uZSBjYWxsDQog
ICAgPiAgICAgID4gc2V0LXByb3BlcnR5IG9mIGRidXMuDQogICAgPiAgICAgIA0KICAgID4gICAg
ICBwb3dlckJ1dHRvbk1hc2sgaXMgYSBncGlvZDo6bGluZSBvYmplY3QgdGhhdCByZXR1cm5zIHRy
dWUgaWYgaXQNCiAgICA+ICAgICAgcmVmZXJlbmNlcyBhIEdQSU8gbGluZSBhbmQgZmFsc2Ugb3Ro
ZXJ3aXNlLg0KICAgID4gDQogICAgPiBJIHVuZGVyc3Rvb2QgY29kZSBidXQgbXkgcG9pbnQgaGVy
ZSBpcyB0aGVyZSB3aWxsIG5vdCBiZSBhbnkNCiAgICA+IGdwaW9kOjpsaW5lIG9iamVjdCBpZiBw
b3dlckJ1dHRvbk1hc2sgaXMgZGVmaW5lZCBhcyBmYWxzZS4gQW5kDQogICAgPiBpbml0aWFsbHkg
aXQgaXMgZGVmaW5lZCBhcyBmYWxzZSBtZWFucyB0ZWhyZSB3aWxsIG5vdCBiZSBhbnkgbGluZQ0K
ICAgID4gb2JqZWN0IGNyZWF0ZWQgdW50aWwgc29tZW9uZSBzZXRzIGl0IHRvIHRydWUuIEFuZCBJ
IGRvbid0IHNlZSBpdA0KICAgID4gYW55IHdheSB0byBzZXQgaXQgdHJ1ZSBvdGhlciB0aGFuIHNl
dC1wcm9wZXJ0eSB0aHJvdWdoIGRidXMuDQogICAgDQogICAgVGhhdCdzIGNvcnJlY3QuICBNYXNr
aW5nIHRoZSBwb3dlciBidXR0b24gaXMgc29tZXRoaW5nIHRoYXQgaXMgZG9uZSBieSANCiAgICBz
b21lIGNvbXBvbmVudCBvdXRzaWRlIG9mIHBvd2VyLWNvbnRyb2wuDQogICAgDQogICAgRm9yIGV4
YW1wbGUsIHdlIGN1cnJlbnRseSB1c2UgaXQgd2l0aCB0aGUgU2V0IEZyb250IFBhbmVsIEJ1dHRv
biBFbmFibGVzIA0KICAgIElQTUkgY29tbWFuZCB0byBlbmFibGUvZGlzYWJsZSB0aGUgcG93ZXIg
YnV0dG9uLiAgU28sIGl0IGlzIG9ubHkgbWFza2VkIA0KICAgIHdoZW4gcmVxdWVzdGVkLg0KU28g
dG8gdXNlIHgtODYtcG93ZXItY29udHJvbCwgZWl0aGVyIHdlIG5lZWQgdG8gaGF2ZSBJUE1JIGNv
bW1hbmQgdG8gZW5hYmxlDQp0aGlzIG9yIHNvbWUgb3RoZXIgZGFlbW9uIGhhcyB0byBzZXQgdGhp
cyBwcm9wZXJ0eS4gQ2FuIHdlIGhhdmUgdGhpcyBmZWF0dXJlIA0Kb3B0aW9uYWwuIEkgZ3Vlc3Mg
dGhpcyBpcyBhIHBydCBvZyBHUElPIHBhc3N0aHJvdWdoLg0KICAgIA0KICAgIFRoZSBhY3R1YWwg
IlBPV0VSX09VVCIgbGluZSBmb3IgcG93ZXItY29udHJvbCBpcyBub3QgcGVybWFuZW50bHkgDQog
ICAgY3JlYXRlZCwgYnV0IGlzIGFzc2VydGVkIHVzaW5nIHRlbXBvcmFyeSBjYWxscyBsaWtlIHRo
aXMgb25lOg0KICAgIHNldEdQSU9PdXRwdXRGb3JNcygiUE9XRVJfT1VUIiwgMCwgcG93ZXJQdWxz
ZVRpbWVNcyk7DQoNClRoaXMgZnVuY3Rpb24gd2lsbCBub3QgcnVuIHBvd2VyIG9uL29mZiBzZXF1
ZW5jZSB1bnRpbCBidXR0b24gbWFzayBpcyBzZXQuIEl0DQpXaWxsIG9ubHkgc2V0IEdQSU8gdmFs
dWUgd2hpY2ggaXMgbm90IGVub3VnaCBmb3IgcG93ZXJpbmcgb24vb2ZmLg0KICAgIA0KICAgIGh0
dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3g4Ni1wb3dlci1jb250cm9sL2Jsb2IvbWFzdGVyL3Bv
d2VyLWNvbnRyb2wteDg2L3NyYy9wb3dlcl9jb250cm9sLmNwcCNMOTQ2DQogICAgDQogICAgPiAg
ICAgIA0KICAgID4gICAgICA+DQogICAgPiAgICAgID4gcG93ZXJfY29udHJvbDo6cG93ZXJCdXR0
b25JZmFjZS0+cmVnaXN0ZXJfcHJvcGVydHkoDQogICAgPiAgICAgID4NCiAgICA+ICAgICAgPiAi
QnV0dG9uTWFza2VkIiwgZmFsc2UsIFtdKGNvbnN0Ym9vbHJlcXVlc3RlZCwgYm9vbCYgY3VycmVu
dCkgew0KICAgID4gICAgICA+DQogICAgPiAgICAgID4gaWYocmVxdWVzdGVkKQ0KICAgID4gICAg
ICA+DQogICAgPiAgICAgID4gew0KICAgID4gICAgICA+DQogICAgPiAgICAgID4gaWYocG93ZXJf
Y29udHJvbDo6cG93ZXJCdXR0b25NYXNrKQ0KICAgID4gICAgICA+DQogICAgPiAgICAgID4gew0K
ICAgID4gICAgICBUaGlzIHdpbGwgcmV0dXJuIGlmIHBvd2VyQnV0dG9uTWFzayBhbHJlYWR5IHJl
ZmVyZW5jZXMgYSBHUElPLg0KICAgID4gICAgICANCiAgICA+ICAgICAgPg0KICAgID4gICAgICA+
IHJldHVybjE7DQogICAgPiAgICAgID4NCiAgICA+ICAgICAgPiB9DQogICAgPiAgICAgID4NCiAg
ICA+ICAgICAgPiBpZighcG93ZXJfY29udHJvbDo6c2V0R1BJT091dHB1dCgNCiAgICA+ICAgICAg
Pg0KICAgID4gICAgICA+ICJQT1dFUl9PVVQiLCAxLCBwb3dlcl9jb250cm9sOjpwb3dlckJ1dHRv
bk1hc2spKQ0KICAgID4gICAgICBPdGhlcndpc2UsIHRoaXMgd2lsbCByZXF1ZXN0IHRoZSAiUE9X
RVJfT1VUIiBHUElPIGFuZCBhc3NpZ24gaXQgdG8NCiAgICA+ICAgICAgcG93ZXJCdXR0b25NYXNr
ICh3aGljaCB3aWxsIG1ha2UgaXQgcmV0dXJuIHRydWUpLg0KICAgID4gICAgICANCiAgICA+ICAg
ICAgPg0KICAgID4gICAgICA+IHsNCiAgICA+ICAgICAgPg0KICAgID4gICAgICA+IHRocm93c3Rk
OjpydW50aW1lX2Vycm9yKCJGYWlsZWQgdG8gcmVxdWVzdCBHUElPIik7DQogICAgPiAgICAgID4N
CiAgICA+ICAgICAgPiByZXR1cm4wOw0KICAgID4gICAgICA+DQogICAgPiAgICAgID4gfQ0KICAg
ID4gICAgICA+DQogICAgPiAgICAgID4gc3RkOjpjZXJyIDw8ICJQb3dlciBCdXR0b24gTWFza2Vk
LlxuIjsNCiAgICA+ICAgICAgPg0KICAgID4gICAgICA+IH0NCiAgICA+ICAgICAgPg0KICAgID4g
ICAgICA+IGVsc2UNCiAgICA+ICAgICAgPg0KICAgID4gICAgICA+IHsNCiAgICA+ICAgICAgPg0K
ICAgID4gICAgICA+IGlmKCFwb3dlcl9jb250cm9sOjpwb3dlckJ1dHRvbk1hc2spDQogICAgPiAg
ICAgID4NCiAgICA+ICAgICAgPiB7DQogICAgPiAgICAgIFRoaXMgd2lsbCByZXR1cm4gaWYgcG93
ZXJCdXR0b25NYXNrIGRvZXMgbm90IHJlZmVyZW5jZSBhIEdQSU8gbGluZS4NCiAgICA+ICAgICAg
DQogICAgPiAgICAgID4NCiAgICA+ICAgICAgPiByZXR1cm4xOw0KICAgID4gICAgICA+DQogICAg
PiAgICAgID4gfQ0KICAgID4gICAgICA+DQogICAgPiAgICAgID4gc3RkOjpjZXJyIDw8ICJQb3dl
ciBCdXR0b24gVW4tbWFza2VkXG4iOw0KICAgID4gICAgICA+DQogICAgPiAgICAgID4gcG93ZXJf
Y29udHJvbDo6cG93ZXJCdXR0b25NYXNrLnJlc2V0KCk7DQogICAgPiAgICAgIE90aGVyd2lzZSB0
aGlzIHdpbGwgcmVzZXQgcG93ZXJCdXR0b25NYXNrIHRvIHJlbGVhc2UgdGhlICJQT1dFUl9PVVQi
DQogICAgPiAgICAgIEdQSU8gKHdoaWNoIHdpbGwgbWFrZSBpdCByZXR1cm4gZmFsc2UpLg0KICAg
ID4gICAgICANCiAgICA+ICAgICAgPg0KICAgID4gICAgICA+IH0NCiAgICA+ICAgICAgPg0KICAg
ID4gICAgICA+IFJlZ2FyZHMNCiAgICA+ICAgICAgPg0KICAgID4gICAgICA+IC1WaWpheQ0KICAg
ID4gICAgICA+DQogICAgPiAgICAgIA0KICAgID4gDQogICAgDQoNCg==
