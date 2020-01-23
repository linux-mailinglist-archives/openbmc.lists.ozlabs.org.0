Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD82914733D
	for <lists+openbmc@lfdr.de>; Thu, 23 Jan 2020 22:38:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483bHP1WmtzDqHV
	for <lists+openbmc@lfdr.de>; Fri, 24 Jan 2020 08:38:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=82916a9fb9=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=T2jGcC07; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=cuMlWLfr; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483bGW709pzDqYj
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jan 2020 08:37:34 +1100 (AEDT)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00NLYU9e011103; Thu, 23 Jan 2020 13:37:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=n+V3VQ01ekC5UN5zDDbZo+qSZkeUM5ZVN4ea0K212N8=;
 b=T2jGcC07e+JQ6LT05SKFfT1QyMV95SiZMFH2N4EUts4aAuaU/odtCERTgC5BFUDQj4XQ
 mZjvcrAIKhmmQUAtlt9svWw3qjF3RLWwtWtA8Pe1KO+yEnI2Euowy2zhy/Qm3O/sXd8S
 jo6C8D9nT+OOyiccYpNSsxivhyuBFbh1iUI= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2xpj9trkw9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 23 Jan 2020 13:37:28 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.173) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 23 Jan 2020 13:37:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKUYx+Yu6MrjxIsKYSIjnWIrUw5VRAOGcEFLBMq8V4LPwCBX14FohTagTQup/uXFi90sQgSrZC01O2aC66/twpf66YoHWoT70SjOlP1Pm/Af+vgiB7PWRMLNmFdcpHxK0hxyxZy3o27RIYxblapN3c0IRl9iANYC/Ue/3Eye6h0xRt6VEZSFL/gNVT3xNnXuujVZkE5yOk+mnqaD7/i2FsQhtleL/hpTFGTiX9FlC8BBkuyTMxcSTZc00AzVpwgCnNO7p3VLlusH2PNUVThciz0S3Pn0ch/FUGQw7JgGDWkkC1RDrTatyAXOk3DVtaZtpeUhUWZ3epaE/R30j7EhMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+V3VQ01ekC5UN5zDDbZo+qSZkeUM5ZVN4ea0K212N8=;
 b=QeXWZrLBUmP3OoSu6T+Cdo6RTM5dmWz3cHzxkzJel67od7Myo2CPZsUFes4gFZgalqslm5nuM8KwvEGQG52i6bmYDKfRqvF1WGykoRT3zNsvFlVU1ynar/hHGqqGZ6MdG9Ea0e0AdxPmvMmM0JmcgD0yhsn9nmh/Kn7X8O0ri5tg53S8oXtN3yOYo35FBCQHK1XiplMR7NGfx5VSsJUetoI0goLIn/Rf8tKq5mkeVD4cGJYc094jQJrTa1v/6xWLKU0GRX7vmiX5jF7MhsFZeeJ5ZvmewsLkJUEkF8T9rAGbtEUYFHVge1XJYWWKkVwZ3ZjjZmi6zwNBIRhzQN2rnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+V3VQ01ekC5UN5zDDbZo+qSZkeUM5ZVN4ea0K212N8=;
 b=cuMlWLfr/UgdK1O4H9fsnyyfFE8p3WvmHSvhoFYcTxDqmD3hkoE66EBAr4fvpawh+0lmXupiUAGJtuh7jbm3DrmgM7/4cvVfSmS110ovNDgyHSH1eEKfqYhwvy6i92OfgJzV7TOdmRL3bs6Sy1pohx3p9nMZ3fzdX/1e/o/hRJs=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1918.namprd15.prod.outlook.com (10.174.101.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.24; Thu, 23 Jan 2020 21:37:12 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2%8]) with mapi id 15.20.2644.028; Thu, 23 Jan 2020
 21:37:12 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>, James Feist
 <james.feist@linux.intel.com>
Subject: Re: x86 power control for multi host
Thread-Topic: x86 power control for multi host
Thread-Index: AQHV0K1XX03zkNGXPUaqdZ+5RqCG9af1PNaAgANc5wD//6lUAA==
Date: Thu, 23 Jan 2020 21:37:12 +0000
Message-ID: <040595EA-2283-4FD6-B89D-DB6C9B93610D@fb.com>
References: <E8A81BD0-04D4-4ED5-91E3-F4CA85DC8CAE@fb.com>
 <C1AA3F44-5589-4751-B023-8A28CC5ACC19@fb.com>
 <ee4b29ec-561c-72de-1da0-57e9a5f9958b@linux.intel.com>
In-Reply-To: <ee4b29ec-561c-72de-1da0-57e9a5f9958b@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:c2ea]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1827203d-346e-4fcf-3d2b-08d7a04c6899
x-ms-traffictypediagnostic: MWHPR15MB1918:
x-microsoft-antispam-prvs: <MWHPR15MB1918A6989DBE3F03B6C34F46DD0F0@MWHPR15MB1918.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 029174C036
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(39860400002)(366004)(136003)(396003)(346002)(199004)(189003)(86362001)(2616005)(2906002)(71200400001)(6486002)(5660300002)(316002)(6506007)(8676002)(110136005)(33656002)(4326008)(53546011)(81166006)(81156014)(66476007)(66556008)(66946007)(186003)(8936002)(66446008)(64756008)(36756003)(478600001)(6512007)(76116006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1918;
 H:MWHPR15MB1597.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 79zLn+SkWnz2Q2YMvSe3ZQ/gito1q9fZgJ+fkINzPW0eRDfIV47G2M1o1RLcbDVmX2Sf7rpa9WPdLbfbUdKCITYnTEMQiR9Yc97JpPIjdAzZJQmclMbiDeVpV7kwmShqt29azgyScQneijSnLQT9Cst7xv3GfF2XlRvoCoKQrfzmzpsoGrt3WIb+UWgaw+eai+TxmPUAKeYxaIMWME12kfe/SSrTHEUfngWgUbzdFa37UMV0pEI0Q4I1ZOa+SJZWys8f09UOs8zBGAlUcKu7Jz1xIinOum5VxtX/+j1m8jupW3+M7uirbFTANZAygLtI7Xz3Knm21Nmtku6hidDoOOJoJbsVqxM6qnvCATwADE4ghbUX8f/eTzUG9YOYDjAhIZEeqaLNmx0pcGUjtMZdJDoLvfPASPZk2rUpuVd0Uc1Y9z4NaHkKiZ1gSqAcrX3Y
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <4776EB4577D1B745BD0E2468052ED949@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1827203d-346e-4fcf-3d2b-08d7a04c6899
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2020 21:37:12.7057 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XXoN47EXGFyEg16JHctyhBLp3UacES3yY9gxOdfFGIomEFetOUoCWViuFmFwFsrV83cvidVz77kMsApgvHO+uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1918
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-23_13:2020-01-23,
 2020-01-23 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001230159
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

VGhhbmtzIEphc29uIGZvciBxdWljayByZXNwb25zZS4gDQpOb3cgbXkgYW5vdGhlciBxdWVzdGlv
biBpcyBjYW4gSSBnZXQgdGhpcyBjb25maWd1cmF0aW9uIGZyb20gZW50aXR5IG1hbmFnZXIgZm9y
IGdwaW8gbGluZXMgb3Igc2hvdWxkIEkgaGF2ZSBhIHNlcGFyYXRlIGNvbmZpZy5qc29uIGZpbGU/
DQoNCu+7v09uIDEvMjMvMjAsIDEwOjQ4IEFNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgQmlsbHMs
IEphc29uIE0iIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFi
cy5vcmcgb24gYmVoYWxmIG9mIGphc29uLm0uYmlsbHNAbGludXguaW50ZWwuY29tPiB3cm90ZToN
Cg0KICAgIE9uIDEvMjEvMjAyMCAzOjI2IFBNLCBWaWpheSBLaGVta2Egd3JvdGU6DQogICAgPiBT
b3JyeSwgbWlzc2VkIHRvIGFkZCBtYWlsaW5nIGxpc3QuDQogICAgPiANCiAgICA+ICpGcm9tOiAq
VmlqYXkgS2hlbWthIDx2aWpheWtoZW1rYUBmYi5jb20+DQogICAgPiAqRGF0ZTogKlR1ZXNkYXks
IEphbnVhcnkgMjEsIDIwMjAgYXQgMjo1MSBQTQ0KICAgID4gKlRvOiAqSmFtZXMgRmVpc3QgPGph
bWVzLmZlaXN0QGxpbnV4LmludGVsLmNvbT4sIA0KICAgID4gImphc29uLm0uYmlsbHNAbGludXgu
aW50ZWwuY29tIiA8amFzb24ubS5iaWxsc0BsaW51eC5pbnRlbC5jb20+DQogICAgPiAqU3ViamVj
dDogKng4NiBwb3dlciBjb250cm9sIGZvciBtdWx0aSBob3N0DQogICAgPiANCiAgICA+IEhpIEph
bWVzL0phc29uLA0KICAgID4gDQogICAgPiBJIGFtIHBsYW5uaW5nIHRvIG1vZGlmeSB4ODYgcG93
ZXIgY29udHJvbCBmb3IgbXVsdGlwbGUgaG9zdCBzdXBwb3J0LiBBcyANCiAgICA+IGl0IGhhcyBo
YXJkY29kZWQgbmFtZSBob3N0MCBidXQgd2Ugd2FudCB0byBzdXBwb3J0IGZvciBtdWx0aXBsZSBu
dW1iZXIgDQogICAgPiBvZiBob3N0cyBiYXNlZCBvbiBjb25maWd1cmF0aW9uLiBJIGFtIHRoaW5r
aW5nIG9mIHJlYWRpbmcgZGlmZmVyZW50IEdQSU8gDQogICAgPiBsaW5lcyBmb3IgZWFjaCBob3N0
IGZyb20gYSBjb25maWcuanNvbiBmaWxlIGFuZCB0aGVuIG1vbml0b3IgZGlmZmVyZW50IA0KICAg
ID4gZ3Bpb3MuIFBsZWFzZSBzdWdnZXN0IHRoYXQgaWYgdGhlc2UgY29uZmlndXJhdGlvbiwgSSBz
aG91bGQgcmVhZCBmcm9tIA0KICAgID4gZW50aXR5LW1hbmFnZXIgPg0KICAgID4gQWxzbyBsb29r
aW5nIGZvcndhcmQgdG8geW91ciB0aG91Z2h0IG9mIHRoaXMgZmVhdHVyZSBhZGRpdGlvbiBpbiAN
CiAgICA+IGV4aXN0aW5nIGRhZW1vbiBvciBzaG91bGQgSSBoYXZlIHNlcGFyYXRlIHJlcG8gaXRz
ZWxmPw0KICAgIElmIGl0J3MgY29uZmlndXJhYmxlLCB0aGVuIEkgZG9uJ3Qgc2VlIGFueSByZWFz
b24gbm90IHRvIGhhdmUgaXQgaW4gdGhlIA0KICAgIGV4aXN0aW5nIHJlcG8uICBJcyBpdCBva2F5
IHRvIHN0YXJ0IHRoZXJlIGFuZCBzZWUgaG93IGJpZyB0aGUgaW1wYWN0IGlzIA0KICAgIGJlZm9y
ZSBkZWNpZGluZyBvbiBhIHNlcGFyYXRlIHJlcG8/DQogICAgDQogICAgPiANCiAgICA+IFJlZ2Fy
ZHMNCiAgICA+IA0KICAgID4gLVZpamF5DQogICAgPiANCiAgICANCg0K
