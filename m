Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2476415FAD9
	for <lists+openbmc@lfdr.de>; Sat, 15 Feb 2020 00:42:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48K9040279zDqmj
	for <lists+openbmc@lfdr.de>; Sat, 15 Feb 2020 10:42:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=93130bc3f4=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=lQfYZQeS; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=Jn9BTKQW; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48K8zD5vHWzDqlL
 for <openbmc@lists.ozlabs.org>; Sat, 15 Feb 2020 10:41:19 +1100 (AEDT)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01ENbxGk013512; Fri, 14 Feb 2020 15:40:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=qivu599kln20iE/8DANukWBRmZ6KvfCGeSQRPB7jJOU=;
 b=lQfYZQeShD+V0flFurdASt6T1G9KnN6NKQ1AlJOGgLNEnIEkF0O5HghDm39tI52dHlQr
 ME+HhmYkrWqi17eoQjWFD/XTrK/Xp+HK2HrrQ8A28nRwx7ae1zfBInGahN3GDq1vdZ3G
 LODXb2wcSJSgS42bM/Q0S236Z1B1B/FKzwI= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 2y5gdnncj8-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 14 Feb 2020 15:40:12 -0800
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.230) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 14 Feb 2020 15:40:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBJ5WVWh27uUpX87eggsAFga5aQyOypSeriLgS+NkYmBS4MLD5NdGeL5DvuMZDuXBocpOebV/SlWGb0RHyk8mMdQFf2M9a1xZPNOzIcy7bhO60MTS+XzOpq73Gih2ebzQDMFmD54dXgN7fuTBaWqwXuxom/EDLdx756mNDHhWSNKp/vEzduqtVVHby4u+4TOAMYOa3KLMYVOUpaiub9H7/aPqkgjEigwM7If3Q3Eom9xKPSfgj++iAaD1vt40q0rLI6RfbijutNSvxwwIssks/9fN5V12+yrgPLIlG+wqqwS3mF97BPL/DPPjUkvDEYIYpJWxGj1KTsowSZyjTBImw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qivu599kln20iE/8DANukWBRmZ6KvfCGeSQRPB7jJOU=;
 b=OL2AQlYME34ZlF5T9iRsFaBhLuJZkV+ksTIieX7BREMGLwfj8QcCho6B4xmyPSGHVlFDECbvZCcxkAUDDt13O6FAD/bxoVIuf04z+TDRql6mXISMqhjftDR41IJnqzGJdopQY6xXfOBfJHpUWeyRVnZghB45sA2ctpwEr+j92SjMHJ2tDRKvIf85RFCnJzGqdgX+vZvV94lhJeYSQ3eqbHyclwfOD6VpcRkIUJ001PCgspoQ06jRspCckSrYLwdynQlyxOi9P7ItMA7/DfggY7L3aR7tSI+9pqmlQm41Xa3myvOQT7Zdido7bJ33xIt7mM+9NvzjIat+7lmmlQZaIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qivu599kln20iE/8DANukWBRmZ6KvfCGeSQRPB7jJOU=;
 b=Jn9BTKQW2WgT0rf1AJWIFWvCZayG2TN59Raas7qFNadt3L2QoysgVR5aSKoWVW6vlVB+N42he2SEHPeRE9ts+qQmANtXghDJdHM2Vqec3paBYRS+T7ynkCBqRQxaPRSZc/w2gVQoruecKHjB85BoLCvM3nq03ty5foxVcQLzsO0=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1422.namprd15.prod.outlook.com (10.173.234.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Fri, 14 Feb 2020 23:40:01 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::c863:5ef9:530d:efd2]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::c863:5ef9:530d:efd2%11]) with mapi id 15.20.2729.025; Fri, 14 Feb
 2020 23:40:01 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: James Feist <james.feist@linux.intel.com>, Peter Lundgren
 <peterlundgren@google.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "vernon.mauery@linux.intel.com"
 <vernon.mauery@linux.intel.com>, "jae.hyun.yoo@linux.intel.com"
 <jae.hyun.yoo@linux.intel.com>, Josh Lehan <krellan@google.com>, Alex Qiu
 <xqiu@google.com>, Xiang Liu <xiangliu@google.com>, Sui Chen
 <suichen@google.com>
Subject: Re: Performance issue with psusensor / dbus-sensors
Thread-Topic: Performance issue with psusensor / dbus-sensors
Thread-Index: AQHV44VsZU3ZPsFK0kSHQzeLCoDnGKgbRWOA//+NmgA=
Date: Fri, 14 Feb 2020 23:40:01 +0000
Message-ID: <4744AE6D-69D6-4486-A106-6C058A4E36EE@fb.com>
References: <CAK13xKNkmy5fTgi0xLK=F+fBJbA7EN3bRsinLbN2sTknfiCGwA@mail.gmail.com>
 <a47f684f-7007-1f55-190d-0edf79c0c0ba@linux.intel.com>
In-Reply-To: <a47f684f-7007-1f55-190d-0edf79c0c0ba@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:500::5:34ee]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7812b545-f61c-47df-bac1-08d7b1a735a9
x-ms-traffictypediagnostic: MWHPR15MB1422:
x-microsoft-antispam-prvs: <MWHPR15MB1422FD2F4668988F452472DCDD150@MWHPR15MB1422.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 03137AC81E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(346002)(136003)(39860400002)(366004)(376002)(189003)(199004)(8936002)(2616005)(33656002)(8676002)(316002)(53546011)(6506007)(186003)(71200400001)(5660300002)(66946007)(110136005)(76116006)(6512007)(36756003)(64756008)(66476007)(66446008)(66556008)(478600001)(2906002)(81156014)(81166006)(6486002)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1422;
 H:MWHPR15MB1597.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: As34z4sS77Aaf3PmgI8+u6Wn47jjd3HxeO8qB3/o7/g8iOrc27A2fLdRiWsVo0PR6oasQrDPmlWdrOFyNV0NO816Gvy6HJnv/A3m6v1n2SC5HfwlIpCKC1iOSUgOgeCsZBlEbJ460yxbv75vq5Hj4pND3JfZtd8o5qXJZDy+HDzPRd3Fhdd4GgmZZ11upUXPum6b5/yJ0Nih9jWKenkR63tRjX0W/cx++fXAkLlb/NqBlJpDELQqnMX2PAaQTgeJtKRqnrOj31CLtKJAUyfutAAmI7vgCb822s038Uswe8oFwj5jt93OE94JN76pYhzzclTHrXLPAnObeU4O2jwRmNyXswCnuU0igN22fmru8sHeIXTxjYmY6loOUXhUhyRqoyqO5VGIOgXy4KZKKEuQvdRxUcsGVlpit3Y2WNzzL917WUSOExmn53fUYX9Hkkyb
x-ms-exchange-antispam-messagedata: +J5bIqth6khUBXzqTfYfdmXT8+/U00Vg+a9Pe1jFcR9MrmuykJMiNptZUaxzdQyGqgJiomOmE17YqP/BhLOjyoGlgq/2QaQ58+SdpsEneDnHrEtO7UY6FtKekZzFALwDJqAEweyba3PUrnQpFt+X4hcbVDDjJYjo5UQSND2qalzbQ2JMmRdX9A/4QzgV3ZtM
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B990B7BEC378C4B9930B59A0018AF96@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7812b545-f61c-47df-bac1-08d7b1a735a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2020 23:40:01.2925 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vU1kp8wTQrynVwIWRBIrfoNnL6zGD2Y0ch/COHs7BZoDy6LXafh85EyPkZiQrHzLog6+RzzZPAXa7pTZgKOeyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1422
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-14_09:2020-02-14,
 2020-02-14 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 malwarescore=0
 adultscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1011 spamscore=0 bulkscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2002140172
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

DQoNCu+7v09uIDIvMTQvMjAsIDI6MzAgUE0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBKYW1lcyBG
ZWlzdCIgPG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJzLm9y
ZyBvbiBiZWhhbGYgb2YgamFtZXMuZmVpc3RAbGludXguaW50ZWwuY29tPiB3cm90ZToNCg0KICAg
IE9uIDIvMTQvMjAgMjoxNCBQTSwgUGV0ZXIgTHVuZGdyZW4gd3JvdGU6DQogICAgPiBXZSdyZSBy
dW5uaW5nIGludG8gc29tZSBvY2Nhc2lvbmFsIGFuZCBoYXJkIHRvIHJlcHJvZHVjZSBwZXJmb3Jt
YW5jZSANCiAgICA+IGlzc3VlcyB3aXRoIHNlbnNvcnMgb24gdGhlIGVudGl0eS1tYW5hZ2VyL2Ri
dXMtc2Vuc29ycy9pbnRlbC1pcG1pLW9lbSANCiAgICA+IHNvZnR3YXJlIHN0YWNrLiBJIGRvbid0
IGhhdmUgbXVjaCBjb25jcmV0ZSB0byBzYXkgb24gdGhlIHN1YmplY3QsIGJ1dCBJIA0KICAgID4g
d2FudCB0byBwdXQgYSBmZWVsZXIgb3V0IHRvIHNlZSBpZiBhbnlvbmUgZWxzZSBoYXMgc2VlbiBz
aW1pbGFyIGlzc3Vlcy4gDQogICAgPiBIZXJlJ3Mgd2hhdCB3ZSB0aGluayBzbyBmYXI6DQogICAg
PiANCiAgICA+IENvbXBsYWludHMgcmFuZ2UgZnJvbSBJUE1JIHNlbnNvciByZWFkcyBiZWluZyBz
bG93ZXIgdGhhbiBub3JtYWwgdG8gDQogICAgPiBzZW5zb3JzICJuZXZlciIgdXBkYXRpbmcuDQog
ICAgPiANCiAgICA+IEpvc2ggZ290IGFjY2VzcyB0byBvbmUgbWFjaGluZSBpbiBhIGJhZCBzdGF0
ZSBhbmQgb2JzZXJ2ZWQgdGhpczoNCiAgICA+IA0KICAgID4gIDEuIEFsbCB0aGUgSTJDIGJ1c2Vz
IHdlcmUgd29ya2luZyBub3JtYWxseS4gaTJjZGV0ZWN0IHJhbiBzdWNjZXNzZnVsbHkNCiAgICA+
ICAgICBvbiBlYWNoIGJ1cy4NCiAgICA+ICAyLiBod21vbiB3YXMgd29ya2luZyBmaW5lLiBIZSB3
cm90ZSBhIHNoZWxsIHNjcmlwdCB0byByZWFkIGFsbCBvZiB0aGUNCiAgICA+ICAgICAqX2lucHV0
IHN5c2ZzIGZpbGVzIGFuZCBjb3VsZCByZWFkIGV2ZXJ5IHNlbnNvciBpbiB0aGUgc3lzdGVtIGlu
IDMNCiAgICA+ICAgICBzZWNvbmRzLg0KICAgID4gIDMuIHBzdXNlbnNvciB3YXMgcnVubmluZy4N
CiAgICA+ICA0LiBidXNjdGwgLS1uby1wYWdlciBtb25pdG9yIHwgZ3JlcCAtaSBQcm9wZXJ0aWVz
Q2hhbmdlZCBzaG93cyBubw0KICAgID4gICAgIHRyYWZmaWMuIE9uIGEgaGVhbHRoeSBzeXN0ZW0s
IGl0IHNob3dzIG1hbnkgdXBkYXRlcyBwZXIgc2Vjb25kLiBObw0KICAgID4gICAgIG9idmlvdXMg
ZXJyb3IgbWVzc2FnZXMgaW4gam91cm5hbGN0bCAtLW5vLXBhZ2VyIC1mLg0KICAgID4gIDUuIFJl
c3RhcnRpbmcgcHN1c2Vuc29yIGFsbGV2aWF0ZXMgdGhlIHByb2JsZW0uDQogICAgDQogICAgTm90
IHN1cmUgaWYgaXQncyAxMDAlIHJlbGF0ZWQgYnV0IEphZSBpcyBsb29raW5nIGludG8gYW4gaXNz
dWUgd2l0aCB0aGUgDQogICAgQ1BVIHNlbnNvciBub3QgcmVwb3J0aW5nIGRhdGEgYWZ0ZXIgREMg
Y3ljbGVzLiBXZSBoYXZlbid0IHJvb3QgY2F1c2VkIGl0IA0KICAgIGNvbXBsZXRlbHkgeWV0IGJ1
dCB3ZSdsbCBsZXQgeW91IGtub3cgd2hhdCB3ZSBmaW5kLg0KDQpJIGhhdmUgYWxzbyBzZWVuIG1h
bnkgdGltZSBjcHUgc2Vuc29ycyBub3QgcmVwb3J0aW5nIGRhdGEgYWZ0ZXIgcG93ZXIgb2ZmIGFu
ZCBvbiwNCkkgZGlkbid0IHRlc3QgZW5vdWdoIG9yIGZvbGxvdyBpdCB0aHJvdWdoLiBCdXQgSSBz
ZWUgc29tZSBpc3N1ZXMgb24gaTJjIG5vdCBzZW5kaW5nIGFjaw0KRm9yIGZldyBtZXNzYWdlcyBh
ZnRlciBwb3dlciBvbi4NCiAgICANCiAgICAtSmFtZXMNCiAgICANCiAgICA+IA0KICAgIA0KDQo=
