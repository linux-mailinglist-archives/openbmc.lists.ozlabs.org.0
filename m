Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DEBB9727
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 20:26:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Zhy36drYzF3g9
	for <lists+openbmc@lfdr.de>; Sat, 21 Sep 2019 04:26:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=4166e25665=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="ixueZUwe"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="OZ3ZVs6c"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZhxN12r0zF1nf
 for <openbmc@lists.ozlabs.org>; Sat, 21 Sep 2019 04:26:12 +1000 (AEST)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8KI8AGG015072; Fri, 20 Sep 2019 11:26:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=wmHhusxbKwfXzCFNKvpI6zuOL8V14o+ROvFSsDoiXOU=;
 b=ixueZUwenqwJrimrZA2rljh4XWdHOYGKRL8m20pimXb1LYfrorLy9R7QUIy8YQW2d2Nu
 W1u/mmzYnv9kesqbvjKdCHW1aYyJwuUiyMOw9f4QrOekTl7a32yMk76Nom9aF0+RWr3S
 48VlEnwXBVqIXPq9y6xdy79JX3PFu2wGTgI= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2v4as7pkyf-20
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 20 Sep 2019 11:26:05 -0700
Received: from prn-mbx04.TheFacebook.com (2620:10d:c081:6::18) by
 prn-hub02.TheFacebook.com (2620:10d:c081:35::126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Fri, 20 Sep 2019 11:26:03 -0700
Received: from prn-hub04.TheFacebook.com (2620:10d:c081:35::128) by
 prn-mbx04.TheFacebook.com (2620:10d:c081:6::18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Fri, 20 Sep 2019 11:26:03 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Fri, 20 Sep 2019 11:26:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UiAKI13qq1e8Xa3uDkl4AQ8HoKs5lHUNhMlLYYeOhMl/z40sXk7CvjS7eYs4w7lc4FTViZtbUADMMXFUUrzTkKzEMow9S+54I10/wjPJUf5K08DnZEsinSaoMjvghV+BjjiYkWl6mtJyJiUAJYUig0A3722ctHc9Z1YHWonYM3NVcQrt0OtqLwlLh9emuFF9fYQplIb1I89iI9PUJ1ntcshjp94/PY9vcWq+7Km7VrYu2r+7b430qrC1/fe3yQmQA1vn7W4V7VII6tiuzL5QizAWzzjRl1KozlKSdCerv9hihv1XYO8CtDIOUR51NpOQx5fy3PBAZ3swgm72KHTYtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmHhusxbKwfXzCFNKvpI6zuOL8V14o+ROvFSsDoiXOU=;
 b=UgqPf0hxa10wGg/t+A5kl+1ztx5ZBRONYqkbKXE80DkGxZGUwcDD5+u0Ol2zBuGcrXagKI16tkwDss9bCQWbICo+NJVvebrTzkt/ESMYEUEqQl13BaCYNZ2qdILrnsuZJ+0FbPnYAZ7y52S/S3aEhe0sBkt+b0oLVxsaUU4ZPNa1LjO+dzDflNhJMMiDT8CR8AQ3wI1PPIpIUzmLI1ymdUiKe+nk0kWN8x+UXyW/APgagGBwyg3mhUargI8hVoEmSntm79SMerkbZH0+SA5Z7qYEmn4SECF0DNtOft+TJteGElHsioPbT8DDdZqeIQa2aYBWsPa9AqXxa9uqZS130A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmHhusxbKwfXzCFNKvpI6zuOL8V14o+ROvFSsDoiXOU=;
 b=OZ3ZVs6cKbMR4rTBNf8jkmhPNtb46t4P7UG4XUsPxq42D1dtPuG/r5SRk/+XZtzM4E5PREyFIgKH/gCKU5J2az5Tcg53daOktBNXkSxIyCvtqLrRc9NOA9qfgFTnHRNnhC31D99PoG5JWMI+8zSJFO+bYCp0SmTp7OUJjPx+mpg=
Received: from BY5PR15MB3636.namprd15.prod.outlook.com (52.133.252.91) by
 BY5PR15MB3569.namprd15.prod.outlook.com (52.133.254.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.15; Fri, 20 Sep 2019 18:26:02 +0000
Received: from BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::bc3e:c80f:b59e:98aa]) by BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::bc3e:c80f:b59e:98aa%6]) with mapi id 15.20.2284.023; Fri, 20 Sep 2019
 18:26:02 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Lei YU <mine260309@gmail.com>, Adriana Kobylak <anoo@linux.ibm.com>
Subject: Re: Machine name in Code update
Thread-Topic: Machine name in Code update
Thread-Index: AQHVbxYzp8m43rLBBkaZTQXTNLl9nqcz1foAgACYNoA=
Date: Fri, 20 Sep 2019 18:26:01 +0000
Message-ID: <EA041A69-5148-4599-9461-2D2C1AD19CB6@fb.com>
References: <90E110C3-D171-4E85-9558-D1A0631C265A@fb.com>
 <CAARXrtmM9iHd0ohOo5Ah=O-_XBvx-abggt4jf+7wuMqhF=y_5A@mail.gmail.com>
In-Reply-To: <CAARXrtmM9iHd0ohOo5Ah=O-_XBvx-abggt4jf+7wuMqhF=y_5A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:153b]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bfc5dbfb-19df-481f-e7b5-08d73df7fdca
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR15MB3569; 
x-ms-traffictypediagnostic: BY5PR15MB3569:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR15MB3569830A1F75C6691234F743DD880@BY5PR15MB3569.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0166B75B74
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(39860400002)(346002)(136003)(376002)(396003)(366004)(189003)(199004)(229853002)(966005)(76116006)(14454004)(53546011)(476003)(33656002)(6506007)(316002)(186003)(66556008)(305945005)(4326008)(7736002)(66446008)(54906003)(11346002)(81166006)(14444005)(8936002)(110136005)(6246003)(446003)(256004)(25786009)(81156014)(478600001)(71200400001)(486006)(2616005)(8676002)(86362001)(46003)(66476007)(71190400001)(66946007)(99286004)(64756008)(76176011)(6116002)(5660300002)(102836004)(6306002)(36756003)(91956017)(15650500001)(6512007)(6486002)(2906002)(6436002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR15MB3569;
 H:BY5PR15MB3636.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 83cs492G2w5gW6lGI9TSb4Cjpdbuc2FJPuiT8HhvxmHocRF5g3LRVtebnHs8MOGWe/2O7sXTQPUZ2HmFakSoOwIZbDmOhuWx4g80b5Y5v7aFbeWMmRb5ifpNXuiZXgt7+29hsD5QREMCmlB/jk+ZIOMGFoU7v7vjV6/smCbvrDRJZ/pWqTJ9h01fXQgTgflrbI6iIOuMhasygbsrpzFriW0HjjtVtwAA6r0F7XhlAni5IPC4+IcfLG6rd75bhSXtBZ3tGqGn5tESluXkZzvPgnHsyxn6pbu458duAGXl4j3JU8A3P6aBkviOE/f14dTV5JraBl68mRuTDAhGz+I43mje9QRQXaACBbvJO+RdaEtanWhfp8ZTHmhHGknUCNhcZ//rXTUShe8PNB3T6hQ1MiK1R0dFZF0tW8LuVBcjQ4I=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A5243653D3E6D44B9B88E2F98E08613@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc5dbfb-19df-481f-e7b5-08d73df7fdca
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2019 18:26:01.8695 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sPg5ledxU50dPn+Hb90COY2LjrmJhZb0iUD2wklH9hjtXLNLi+P7d7SbQNptPVj9EDNkjYPVmoRqlKW9z5gFGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3569
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-20_06:2019-09-20,2019-09-20 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 impostorscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1011 malwarescore=0 mlxscore=0 bulkscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1908290000 definitions=main-1909200151
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
Cc: "ed.tanous@intel.com" <ed.tanous@intel.com>,
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 Ben Wei <benwei@fb.com>, Amithash Prasad <amithash@fb.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDkvMTkvMTksIDc6MjEgUE0sICJMZWkgWVUiIDxtaW5lMjYwMzA5QGdtYWlsLmNv
bT4gd3JvdGU6DQoNCiAgICBPbiBGcmksIFNlcCAyMCwgMjAxOSBhdCAyOjE1IEFNIFZpamF5IEto
ZW1rYSA8dmlqYXlraGVta2FAZmIuY29tPiB3cm90ZToNCiAgICA+DQogICAgPiBUZWFtLA0KICAg
ID4NCiAgICA+IEkgYW0gdHJ5aW5nIHRvIGFkZCBhIGZlYXR1cmUgb2YgdmVyaWZ5aW5nIG1hY2hp
bmUgbmFtZSB3aGlsZSB1cGdyYWRpbmcgQk1DIGltYWdlLiBJIGhhdmUgc3VibWl0dGVkIGEgY291
cGxlIG9mIHBhdGNoZXMsIDEuIFdoaWNoIGFkZHMgbWFjaGluZSBuYW1lIGluIG1hbmlmZXN0IGZp
bGUgYW5kIDIuIFdoaWNoIHZlcmlmaWVzIG1hY2hpbmUgbmFtZSBmcm9tIG1hbmlmZXN0IHRvIG9z
LXJlbGVhc2UgZmlsZS4gQmVsb3cgYXJlIDIgZ2Vycml0IHJldmlldyBwYXRjaC4NCiAgICA+DQog
ICAgPiBodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cHMtM0Ff
X2dlcnJpdC5vcGVuYm1jLTJEcHJvamVjdC54eXpfLTIzX2Nfb3BlbmJtY19tZXRhLTJEcGhvc3Bo
b3JfLTJCXzI1MzI0XyZkPUR3SUZhUSZjPTVWRDBSVHRObFRoM3ljZDQxYjNNVXcmcj12OU1VMEtp
OXBXblRYQ1d3akhQVmdwbkNSODB2WGtrY3JJYXFVN1VTbDVnJm09S3l0Yl9qMHUycloxbzNKNDFL
QzVfV2ljZ3NvSVVLVVZNbHFzSjNlc2ZmOCZzPUtZb2phbkZOaUVacHNHemt1bTAwN2JhSGlQa1R1
UVU3ZkdSMmhBSUhIYnMmZT0gDQogICAgPg0KICAgID4gaHR0cHM6Ly91cmxkZWZlbnNlLnByb29m
cG9pbnQuY29tL3YyL3VybD91PWh0dHBzLTNBX19nZXJyaXQub3BlbmJtYy0yRHByb2plY3QueHl6
Xy0yM19jX29wZW5ibWNfcGhvc3Bob3ItMkRibWMtMkRjb2RlLTJEbWdtdF8tMkJfMjUzNDRfJmQ9
RHdJRmFRJmM9NVZEMFJUdE5sVGgzeWNkNDFiM01VdyZyPXY5TVUwS2k5cFduVFhDV3dqSFBWZ3Bu
Q1I4MHZYa2tjcklhcVU3VVNsNWcmbT1LeXRiX2owdTJyWjFvM0o0MUtDNV9XaWNnc29JVUtVVk1s
cXNKM2VzZmY4JnM9WGIxWndhemdUR1ZkTkVWdG5uLVQtU3Nud2N3cjlnTExSZmoyamFpSUUyWSZl
PSANCiAgICA+DQogICAgPg0KICAgID4gSSBoYXZlIHJlY2VpdmVkIHNvbWUgdmFsdWFibGUgZmVl
ZGJhY2sgb24gZGVzaWduIGFwcHJvYWNoIGFuZCBJIGFncmVlZCB3aXRoIHNvbWUgb2YgdGhlbS4g
TGV0IG1lIGV4cGxhaW4gY29tcGxldGUgdGhvdWdodCBoZXJlIGFuZCBwbGVhc2UgcHJvdmlkZSB5
b3VyIHZhbHVhYmxlIGZlZWRiYWNrIGFzIHdlbGwgYXMgbmV3IGlkZWFzLg0KICAgID4NCiAgICA+
DQogICAgPg0KICAgID4gQ3VycmVudGx5IGF2YWlsYWJsZToNCiAgICA+DQogICAgPiA9PT09PT09
PT09PT09PT09DQogICAgPg0KICAgID4gQ3VycmVudGx5LCBTb2Z0d2FyZSB1cGRhdGVyIHVwZGF0
ZXMgaW1hZ2UgYmFzZWQgb24gdmVyc2lvbiByZWFkaW5nIGFuZCBwdXJwb3NlIGZyb20gbWFuaWZl
c3QgZmlsZS4NCiAgICA+DQogICAgPiBJIGZpbmQgaGVyZSBhIHNlY3VyaXR5IGlzc3VlcyBvZiB1
cGdyYWRpbmcgYW4gaW1hZ2Ugd2hpY2ggd2FzIGJ1aWx0IGZvciBkaWZmZXJlbnQgbWFjaGluZSBh
bmQgdXBncmFkZWQgdG8gQk1DIHdpdGggZGlmZmVyZW50IHBsYXRmb3JtLg0KICAgID4NCiAgICAN
CiAgICArIEBBZHJpYW5hIEtvYnlsYWsNCiAgICANCiAgICBBbmQgaGVyZSBpcyBteSB0aG91Z2h0
Og0KICAgICogSW5pdGlhbGx5IEkgd2FudGVkIHRvIGFkZCBzdWNoIGNoZWNrIHRvIG1ha2Ugc3Vy
ZSBhIEJNQyBpcyBub3QgdXBkYXRlZCB3aXRoDQogICAgICBhIGRpZmZlcmVudCBCTUMgYnVpbGQu
DQogICAgKiBMYXRlciB0aGUgc2lnbmF0dXJlIGFuZCB2ZXJpZmljYXRpb24gY29kZSBpcyBhZGRl
ZCwgYW5kIHRoZSB0YXJiYWxsIGNvbnRhaW5zDQogICAgICBzaWduYXR1cmVzLg0KICAgICAgSW4g
cHJhY3RpY2UgYW5kIGluIGZpZWxkLCB0aGUgZGVwbG95ZWQgQk1DcyB3aWxsIG5vdCBiZSB1c2lu
ZyB0aGUgImRlZmF1bHQiDQogICAgb3BlbmJtYyBrZXksIGFuZCB0aHVzIGFueSB1cGRhdGUgc2hh
bGwgYmUgdXNpbmcgYSBzaWduZWQgdGFyYmFsbC4gVGhlIG9uZSB3aG8NCiAgICBnZW5lcmF0ZXMg
dGhlIHNpZ25lZCB0YXJiYWxsIHNoYWxsIG1ha2Ugc3VyZSB0aGUgYnVpbGQgbWF0Y2hlcyB0aGUg
bWFjaGluZS4NCiAgICANCiAgICBTbyBJIHRoaW5rIHRoZSAic2VjdXJpdHkgaXNzdWUiIGlzIG5v
dCByZWFsbHkgYSBwcm9ibGVtLg0KICAgIA0KICAgIEJ1dCBJIHN0aWxsIGxpa2UgdGhlIGlkZWEg
dG8gY2hlY2sgdGhlIG1hY2hpbmUgbmFtZSB0byBwcmV2ZW50IGluY29ycmVjdA0KICAgIHVwZGF0
ZXMgYWNjaWRlbnRhbGx5Lg0KVGhhbmtzDQogICAgDQogICAgPg0KICAgID4gRGVzaWduIGFwcHJv
YWNoOg0KICAgID4NCiAgICA+ID09PT09PT09PT09PT09DQogICAgPg0KICAgID4gQXMgSSBzZWUg
dGhhdCB3aGlsZSBidWlsZGluZyBpbWFnZSwgdGhlcmUgaXMgYSAvZXRjL29zLXJlbGVhc2UgZmls
ZSB3aGljaCBnZXRzIGNyZWF0ZWQgYW5kIGluY2x1ZGVzIHZlcnNpb24sIG1hY2hpbmUgbmFtZSBh
cyBPUEVOQk1DX1RBUkdFVF9NQUNISU5FLiBUaGlzIG1hY2hpbmUgbmFtZSBpcyBub3RoaW5nIGJ1
dCBhIE1BQ0hJTkUgZGVmaW5lZCBpbiBiaXRiYWtlIGVudmlyb25tZW50LiBTbyBJIHRob3VnaHQg
b2YgdXNpbmcgc2FtZSBNQUNISU5FIHZhbHVlIHRvIGJlIGFwcGVuZGVkIGluIE1BTklGRVNUIGZp
bGUgd2hpY2ggaXMgYmVpbmcgcGFyc2VkIGJ5IHVwZGF0ZXIuIEFuZCB2ZXJpZnkgdGhpcyBhZ2Fp
bnN0IHJ1bm5pbmcgaW1hZ2UgcmVsZWFzZSBmaWxlIGJlZm9yZSB2YWxpZGF0aW5nIGltYWdlLiBU
aGVyZSBhcmUgZm9sbG93aW5nIHF1ZXN0aW9uIGNvbWVzIGhlcmUuDQogICAgPg0KICAgID4NCiAg
ICA+DQogICAgPiBCYWNrd2FyZCBjb21wYXRpYmlsaXR5IDogRm9yIHRoaXMgd2UgY2FuIGFsbG93
IGltYWdlIHVwZ3JhZGUgaWYgbWFjaGluZSBuYW1lIGlzIG5vdCBkZWZpbmVkIGluIE1BTklGRVNU
IGZpbGUgb3IgaWYgaXQgaXMgZGVmaW5lZCB0aGFuIGl0IHNob3VsZCBtYXRjaCB0byBjdXJyZW50
IHJ1bm5pbmcgaW1hZ2UuDQogICAgDQogICAgWWVzLCBJIHByZWZlciB0byBrZWVwIGJhY2t3YXJk
IGNvbXBhdGliaWxpdHkgZm9yIGEgZmV3IHJlbGVhc2UgY3ljbGVzLg0KICAgIEUuZy4gaW4gMi43
IGFuZCAyLjgsIGxldCdzIG1ha2UgaXQgc3VwcG9ydCB0YXJiYWxscyB3aXRob3V0IG1hY2hpbmUg
bmFtZS4NCiAgICBBbmQgaW4gMi45LCBtYWtlIG1hY2hpbmUgbmFtZSBtYW5kYXRvcnkuDQogICAg
V2hhdCBkbyB5b3UgdGhpbms/DQpJIGFncmVlIGFuZCBjYW4gc3RhZ2UgbGlrZSB0aGlzLg0KICAg
IA0KICAgID4gVmFsaWRhdGlvbiBsZXZlbDogQ3VycmVudCBjb2RlIHVwZGF0ZXIgc3VwcG9ydHMg
dXBncmFkZSBmb3IgaG9zdCwgYm1jIGFuZCBwc3UgYWxsIGZpcm13YXJlLiBTbyBJIGFtIG5vdCBz
dXJlIGlmIG1hY2hpbmUgbmFtZSBpcyBnb2luZyB0byBiZSBzYW1lIGZvciBhbGwgY29tcG9uZW50
cyBvciBpdCBpcyBkaWZmZXJlbnQuIEluIG15IHVuZGVyc3RhbmRpbmcsIGFsbCBjb21wb25lbnRz
IHNob3VsZCBoYXZlIHNhbWUgbWFjaGluZSBuYW1lIGlmIHRoZXkgYXJlIHBhcnQgb2Ygc2luZ2xl
IG1hY2hpbmUuIEkgYW0gb3BlbiB0byBkaXNjdXNzIHRoaXMgcG9pbnQgYXMgSSBhbSBub3Qgc3Vy
ZSBob3cgZXZlcnlvbmUgZWxzZSBpcyBkZWZpbmluZyBpdC4NCiAgICANCiAgICBJIGFncmVlIHdp
dGggdGhpcyBvbmUuDQogICAgQWRkaW5nIG1hY2hpbmUgbmFtZSBmb3IgYWxsIHRhcmJhbGxzIChC
TUMsIGhvc3QsIFBTVSkgbWFrZXMgc3VyZSB0aGUgaW1hZ2UgaXMNCiAgICBmb3IgYSBzcGVjaWZp
YyBtYWNoaW5lLg0KICAgIEV2ZW4gaWYgYW4gaW1hZ2UgaXMgbWVhbnQgdG8gc3VwcG9ydCBtdWx0
aXBsZSBzeXN0ZW1zIChlLmcuIGEgUFNVIGltYWdlIG1heSBiZQ0KICAgIHVzZWQgb24gZGlmZmVy
ZW50IHN5c3RlbXMgd2l0aCB0aGUgc2FtZSBQU1UpLCB0aGUgdXBkYXRlIGltYWdlIGNvdWxkIGJl
DQogICAgZ2VuZXJhdGVkIChhbmQgc2lnbmVkKSBmb3IgdGhlIHNwZWNpZmljIG1hY2hpbmUgYXMg
d2VsbC4NCiAgICANCg0K
