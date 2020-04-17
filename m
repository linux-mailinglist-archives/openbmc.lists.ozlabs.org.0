Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BAF1AE439
	for <lists+openbmc@lfdr.de>; Fri, 17 Apr 2020 20:06:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493kYZ38l1zDsFZ
	for <lists+openbmc@lfdr.de>; Sat, 18 Apr 2020 04:06:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=13769785df=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=Pc+r2YTo; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=j7lRa/+c; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493kXY16rjzDrpw
 for <openbmc@lists.ozlabs.org>; Sat, 18 Apr 2020 04:05:22 +1000 (AEST)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03HHuCDZ004410; Fri, 17 Apr 2020 11:05:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=g8EnYqPUu3zeLQs/Bg9X4cR1ffKpn8cC+QM4aNEfj9A=;
 b=Pc+r2YTokUemB4fDbdc2d9WS002FA4/HQ+ikX0RyoO0imAIZBP2yDMmYIaHQXF9vFgoj
 tYAVNXKpgvFPCWwX6NxhCU7TZXV0ONaZ/0YXk5xWrUQ953uv6BnjIG/GqDEMfwkwh1Hy
 We8cqrTFYSpyjezUA+0hXCDpFJDo3yx07CQ= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 30dn893wv2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 17 Apr 2020 11:05:12 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.230) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Fri, 17 Apr 2020 11:04:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZRvQJ10v+k6ZLZMuE1YzIgbO3SQynIlYTMlCOAIGFKCHRVEajrl4H4KXb8+SKsBqVuiJm8JYlo84AOgAV3GhIT69kvN4y/co6ndEH1EITIWHMgo5xN0a0gEb7ObzWBzo3+qsialOGsWbYb1vp0EPhwqRQCk5ocErTjH80oxO1t6WYMuO/+HTSJmTWV3tFQm+3oOWUQEFOmcALJimmFmK7KMYmlZpvs08kckWiLr7XR7TktwpVwX2tNgelRuvx/xot3jTtCq2I577MT3xLFuLbBD5M3abfuu0RM8WBpIANgLrlDd6PKEY1Ze/FlL1VMY9mS7dwf9UoKgH3CDo3bbSZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8EnYqPUu3zeLQs/Bg9X4cR1ffKpn8cC+QM4aNEfj9A=;
 b=d5gp10TfzcEPv6CvUPkeYJ4qXuxjUie2SiYgyGQlWd9Mslu0XLn0e/yd3eaQsxGfyTdaGNHPvh04jSUDB58e2AEKqoyP9ZsJI5+6rwEPJGAUKZD9RfzNN8rLImiU1l0NmZXPzh1+5aLYC3zms4kq3+E/d+M1gTwFJ0Te2suzyEghw+oDbf9P6ovztC3OK2W0KESemxY8/Zfm+63G5MUBw9Y7mYnQihyulNm4vkomzF16WVS26S/+Se5+O8J4DZk5jcbkbavzQZ8UkHmbUm37oEIoGCSp+125U7WQG3AmS457p0sdQtBo/FymWnlNU75P8JftTyFS2yLUGOhmziOwkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8EnYqPUu3zeLQs/Bg9X4cR1ffKpn8cC+QM4aNEfj9A=;
 b=j7lRa/+cuIO3iRDqPbin2Kef9vGMp0e+wVAGvks6sadsW7AhmFO1J4+Eyll/he8P9JG5O29a8u8mW+dKOZbf0kJGFEriElUa4geUVgljMcrExR+vfz3XyZcUTCqvO899cuEvvByEaqTVBqLarmjt+LZitaCL4Ytqia3VHzug6h0=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB3319.namprd15.prod.outlook.com (2603:10b6:a03:10b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Fri, 17 Apr
 2020 18:04:39 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4%3]) with mapi id 15.20.2921.027; Fri, 17 Apr 2020
 18:04:39 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Benjamin Fair <benjaminfair@google.com>
Subject: Re: nvme sensors
Thread-Topic: nvme sensors
Thread-Index: AQHWEx5rEqsJqc4WEEC8M3OzxbfV76h5pxOAgADRXfD//5lHAIAAmM4QgABf84CAAOO4gIAAerOAgADA2AA=
Date: Fri, 17 Apr 2020 18:04:38 +0000
Message-ID: <B555CC60-3770-454E-813B-5F00783E97C7@fb.com>
References: <0F332F74-FF51-4239-8B52-2EBA770AE6CC@fb.com>
 <8022481D-7C72-4A7B-AF9C-D144177B4C88@fb.com>
 <CH2PR21MB1510E11F9772C45D12EEA0F1C8DB0@CH2PR21MB1510.namprd21.prod.outlook.com>
 <82E67AAA-1BD8-41D8-BE27-966F840236E2@fb.com>
 <CH2PR21MB1510AEF844D82AC9D897B902C8DB0@CH2PR21MB1510.namprd21.prod.outlook.com>
 <4770a42d-d012-4e95-9347-d5c287c2e288@www.fastmail.com>
 <5CD00373-FD92-4E57-90C5-21FB8AD6DD25@fb.com>
 <CADKL2t5r0tCSOLiwovjiqvbV8_oCdJSSnGcekWZkGQb7JFDZBg@mail.gmail.com>
In-Reply-To: <CADKL2t5r0tCSOLiwovjiqvbV8_oCdJSSnGcekWZkGQb7JFDZBg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:6798]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db153f52-410d-43ce-c3a8-08d7e2f9cbdc
x-ms-traffictypediagnostic: BYAPR15MB3319:
x-microsoft-antispam-prvs: <BYAPR15MB33198918717F0E67BFC0FE7DDDD90@BYAPR15MB3319.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0376ECF4DD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(366004)(136003)(346002)(396003)(39860400002)(376002)(6512007)(71200400001)(5660300002)(4744005)(8676002)(81156014)(6486002)(8936002)(33656002)(3480700007)(2906002)(4326008)(36756003)(86362001)(91956017)(186003)(478600001)(6916009)(2616005)(316002)(66476007)(76116006)(66446008)(64756008)(66556008)(66946007)(54906003)(6506007)(7116003);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FdJ/uZBpNKgrYNBGet4nSfM0qPaNU4i2o792+mTtYLd1Pe5xfkZYTuw7LwzHpKbmysgKWOrnMEBixsAOu1U0Ji1kcUnQr3VSN2jxyD326fKMAQ4bYCd/pxuN47jmpCw4Tq5mGwyMBtfB7/m/S6Bbe8YYolzdas8LxNcEpRWiT1rZhrC5JmJCltyoRdmWDKwXaa6joem9drSCLDrqQzwbqMIL/Ira8JesXprHYkOTCjJAzPq/Ehox7RmDAhgJJuZ0SlmOMiYk/1JmI+AWlWBkn1BZLdIA5g3/931h+o0RZkiIAQUDsvOAFUhAoj1M05GfL36O8vRnqD4eS9YK+YweoO9wof9kTkzCjYvAzXczt6CPjVCTKLd3q8GZsspP54PxWqRo4YSHZZwCp5US3/M4PCXlq4xSRFPFB6HzzszejypgaiW7AwdT5SaBw7giOVGY
x-ms-exchange-antispam-messagedata: 7DNdQYTbYLpwWlBHPenjuw5CgZ0MpXX3pCOdb3xnQxGoYU0UtLjKWuhI+N+KEnMMXZxNUWz2TUYD8pYgVy8Lj2ss93WZDreId59U9TeKp3gXOzZvm6ULIY0chfk5A92nUQ5bHBy+ETlyC6UxMMkGZXk6oNnG6vuzkUqxPM3EHNfgmRFJ407Ym5Ghq9YlhsVu
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <A55008301B430E408357080EEF39208B@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: db153f52-410d-43ce-c3a8-08d7e2f9cbdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2020 18:04:38.9172 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eln+hP/j1JWlb+GFs2sLRKkp5mzkqLRG+fYyljZrgbKQIC/6VElMUqy8Gx+oY2uLjcgvry0WLwSJfLRm2tTGUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3319
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-17_08:2020-04-17,
 2020-04-17 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 bulkscore=0
 mlxlogscore=857 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004170140
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Neeraj Ladkani <neladk@microsoft.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDQvMTYvMjAsIDQ6MzUgUE0sICJCZW5qYW1pbiBGYWlyIiA8YmVuamFtaW5mYWly
QGdvb2dsZS5jb20+IHdyb3RlOg0KDQogICAgT24gVGh1LCAxNiBBcHIgMjAyMCBhdCAxNjoxNSwg
VmlqYXkgS2hlbWthIDx2aWpheWtoZW1rYUBmYi5jb20+IHdyb3RlOg0KICAgID4NCiAgICA+IEN1
cnJlbnRseSwgZGJ1cy1zZW5zb3JzIHN1cHBvcnQgcmVhZGluZyBOVk1FIHNlbnNvcnMgdmlhIG1j
dHAgb25seS4gSXQgdXNlcw0KICAgID4gbGlibWN0cCBhbmQgc29tZSBvZiBzbWJ1cyBwYXRjaCBm
cm9tIEludGVsLiBJdCBhbHNvIHVzZXMgc2xhdmUgbXF1ZXVlIG1jdHANCiAgICA+IGtlcm5lbCBk
cml2ZXIgd2hpY2ggaXMgbm90IHVwc3RyZWFtLg0KICAgID4NCiAgICA+IFNvIGN1cnJlbnRseSBp
dCBpcyBub3QgbWF0dXJlZCBhbmQgZnVsbHkgdXBzdHJlYW1lZC4NCiAgICA+DQogICAgPiBKYW1l
cywgaG93IGNhbiB3ZSB1c2UgdGhpcyB3aXRob3V0IG1jdHAuIEkgZG9uJ3Qgc2VlIGFueSBub24g
bWN0cCBzdXBwb3J0IGxpa2UNCiAgICA+IFNlbmRpbmcgZGlyZWN0IHNtYnVzIGNvbW1hbmQsIHBs
ZWFzZSBhZHZpc2UgaWYgSSBtaXNzZWQgaXQuDQogICAgDQogICAgSWYgeW91IHdhbnQgdG8gdXNl
IE5WTUUtTUkgd2l0aG91dCBNQ1RQLCB0aGlzIHVzZSBjYXNlIGlzIHN1cHBvcnRlZCBieQ0KICAg
IHBob3NwaG9yLW52bWUuIEl0IG1ha2VzIGRpcmVjdCBTTUJ1cyBjYWxscy4NCg0KQmVuLCB0aGFu
a3MgSSBzZWUgdGhhdCBidXQgaXQgbmVlZHMgY2VydGFpbiBHUElPcyBsaWtlIFB3ckdkLCBwcmVz
ZW5jZSBhbmQgSSBhbSB0cnlpbmcgdG8gZmluZCBpZg0KT3VyIHBsYXRmb3JtIHN1cHBvcnQgYW55
IHN1Y2ggR1BJT3MuIA0KICAgIA0KICAgID4NCiAgICA+IFJlZ2FyZHMNCiAgICA+IC1WaWpheQ0K
ICAgID4NCiAgICA+DQogICAgDQoNCg==
