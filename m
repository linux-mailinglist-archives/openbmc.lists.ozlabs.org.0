Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BB510E682
	for <lists+openbmc@lfdr.de>; Mon,  2 Dec 2019 08:54:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RHSS1JndzDqSG
	for <lists+openbmc@lfdr.de>; Mon,  2 Dec 2019 18:54:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=7239b4c66a=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="bDQDUd6v"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="FZCSxsI8"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RHRm2f3BzDqR5
 for <openbmc@lists.ozlabs.org>; Mon,  2 Dec 2019 18:53:39 +1100 (AEDT)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id xB27nThZ016458;
 Sun, 1 Dec 2019 23:53:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=k8SW87iUeuiYa+grTWPqeVXcKEWnKTk5iaBKl9xnibg=;
 b=bDQDUd6vPOOedI3fYax6/LrLFv9hoa/ggJFMBMjx0a8J4bnvDafCIQPoC68OhIjB5mgm
 oGus8w237PyChi6AiwTyqcllCRvCVR5A+VL5iXMJP16iogT/yvMm1NYNSJU/q2TNT6Ce
 crvgKn77+Kdrn771fbqdqpoNzlrNfcHaM5I= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by m0089730.ppops.net with ESMTP id 2wkmt2eswy-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Sun, 01 Dec 2019 23:53:29 -0800
Received: from prn-hub06.TheFacebook.com (2620:10d:c081:35::130) by
 prn-hub02.TheFacebook.com (2620:10d:c081:35::126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Sun, 1 Dec 2019 23:53:27 -0800
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Sun, 1 Dec 2019 23:53:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JEOYyUp9SaJZOgkJWLZZAiUHQY6R1rl+xmInjRrbLbKGLMroV4EYR958McV72bErF3lu4XL6aEjEXa/5FLtj1Kkn4bLGpELz7p6XTMdbkYokOjzcmWyfSRQD8xZwvZZuVyJtEDACDtjnR1eGJP2IYuBGLrEfoaAOtjvMjm2Nr3LpIZGrusm/hrFY/QYDK6GLtx0X5vAnuUtkCCO+pFk+QqIWT5970ht4JKVjF7OkyBZo14+tphG3WESzHWRHP3k4DtNQ0ywdatL0EBlcsZ8TvWiNYrW+8huShSC2cGacBhBz0tHmabvuz1rneqMKXq0DXQlfNEHXwLr4O8oUjLSlqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8SW87iUeuiYa+grTWPqeVXcKEWnKTk5iaBKl9xnibg=;
 b=D8eXom24Ko0XHcdZdExL/IoWL0QUPvzKmDg5Ml2K4/q4qSq7asG6200CrvSMMmvVnMXaHqxBhbd7q8Naz9+fp4KxHBq5R1EZn3S0qHm9Qgwmxkksizu2tUDD8mJad3XsgV2pp0iWhdN6MX0yOgl9tW5nqRtCS34fS3YGEQmykcKVRMdyuVSgvc5Q9w219qBTbZ3gMxNdfqeylFcYBjgZ92I4UnV42Z5LDaFrwMqh+Dt5Y5Hjkt3B2A4cDVetD/ztHbeLommkQrABcx71+TdB/Ch4hFMv0BN1P/7w5CzS+nTYF4QSWFvfSJ9jgGzyr98uLl6BSZUSe4CW5h8VmgZViQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8SW87iUeuiYa+grTWPqeVXcKEWnKTk5iaBKl9xnibg=;
 b=FZCSxsI8XvZkx4My7Gk9zYp3zPvM52/w7+c/mFIk1lILyXCSy/+Qk330RwyXYeqECB1HB99evdKlDqYJJBJjR/9U3EBWFMq29J00BMO61uUC2NmkUQz+y9Aqzv8QoWg8jy3jX7mZAt3VxC0MAGOSa+GBSOiGnirAwHFW/jgieLw=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1517.namprd15.prod.outlook.com (10.173.235.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.17; Mon, 2 Dec 2019 07:53:25 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::2c43:c44b:2c95:e376]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::2c43:c44b:2c95:e376%11]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 07:53:25 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "Troy.Lee@vertiv.com" <Troy.Lee@vertiv.com>, James Feist
 <james.feist@linux.intel.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: [ExternalEmail] Re: guidelines on new entity-manager classes
Thread-Topic: [ExternalEmail] Re: guidelines on new entity-manager classes
Thread-Index: AQHVo/rrMIYWSbSqiEmTZCVhb4d7WqedteEAgAJv9oCABdc7gA==
Date: Mon, 2 Dec 2019 07:53:25 +0000
Message-ID: <D774D565-8905-4C4D-940B-98BEF2C48827@fb.com>
References: <FB1DE03E-092D-41CB-A655-56EFCE849E47@fuzziesquirrel.com>
 <4e265913-0704-8438-3f37-389063b235b9@linux.intel.com>
 <MWHPR13MB136077B46142D54C6B036A60ED470@MWHPR13MB1360.namprd13.prod.outlook.com>
In-Reply-To: <MWHPR13MB136077B46142D54C6B036A60ED470@MWHPR13MB1360.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:180::5397]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4eb280cd-f207-4585-d0f6-08d776fcb605
x-ms-traffictypediagnostic: MWHPR15MB1517:
x-microsoft-antispam-prvs: <MWHPR15MB15171E0C3995344AC463FF97DD430@MWHPR15MB1517.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0239D46DB6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(136003)(346002)(396003)(366004)(376002)(13464003)(189003)(199004)(478600001)(6486002)(7736002)(6436002)(305945005)(102836004)(99286004)(229853002)(6506007)(76176011)(186003)(33656002)(6512007)(53546011)(66446008)(64756008)(66556008)(66476007)(66946007)(76116006)(46003)(25786009)(316002)(54906003)(110136005)(5660300002)(36756003)(2616005)(256004)(6246003)(11346002)(71190400001)(446003)(14444005)(81156014)(81166006)(8676002)(8936002)(6306002)(6116002)(4326008)(14454004)(86362001)(2906002)(2501003)(966005)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1517;
 H:MWHPR15MB1597.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kv6CvfnOgdGza0t7AZ96kubIgcnZoZx/+lo/sOC9GZN4NCctfADl326NUvq4Bed9vtXT7uJxzALxH3ywmSZVzOny/rPcMM7oEtQC4akf9R/k2ijtKbiRJeKpCklgRgNXoF08BwtycimqHI3oCla69nJ1b+EHX1cTFdJ2sIrv2VO5thI9qC/Fyt58Axn/GEVcj8VxI8sYhNETZjPTtjZbvRFU0O0y5susUKPhNIyhT9jarL0wmcJkvsiiuXrvYcS7Mvxw1AYsH1zTZ6emxwhQPZoqoB4raAWqVSDTOv40gGrIgT0f5Z5f4TT81kudT1L5qRVKr/A3kyMhIMcTdDMI7C172PMZIDueTOgszC7IOH1+5EPG3KFH3maZDjNJaUyEFlSrD6AdpeAWrUcuFs8yc4Hf/598GjlR1zolPN2vU7Ame4OjScIfpv/c+R/jZov8odvAu9lX91vLTuegQwpTuA/n4Ov1wy5/3JMXoOliXF4=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <508597A2E6BC354F9EA882AF8D7E2932@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb280cd-f207-4585-d0f6-08d776fcb605
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2019 07:53:25.2345 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Je2cN92Q374EJywDEvUTS8Ki8xFsyBSZdsauAtePxCUbyhLhKX/6/waEzFTOEZ1p/j6w+JcvkkjF8zRz+un8nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1517
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-01_04:2019-11-29,2019-12-01 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 clxscore=1011
 adultscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1912020070
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
Cc: Shawn McCarney <shawnmm@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

VG9ueSwNCllvdSBjYW4gdXBsb2FkIHlvdXIgb3duIGNvbmZpZyBmaWxlIGluIGVudGl0eSBtYW5h
Z2VyIHJlcG9zaXRvcnkuIE9yIHlvdSBjYW4gYWxzbyBpbnN0YWxsIGl0IHRocm91Z2ggYmJhcHBl
bmQgZmlsZS4NCg0KUmVnYXJkcw0KLVZpamF5DQoNCu+7v09uIDExLzI3LzE5LCAxMDo0MyBQTSwg
Im9wZW5ibWMgb24gYmVoYWxmIG9mIFRyb3kuTGVlQHZlcnRpdi5jb20iIDxvcGVuYm1jLWJvdW5j
ZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFicy5vcmcgb24gYmVoYWxmIG9mIFRyb3ku
TGVlQHZlcnRpdi5jb20+IHdyb3RlOg0KDQogICAgSGkgSmFtZXMsDQogICAgDQogICAgSXMgdGhl
cmUgYSBjbWFrZSBvcHRpb24gdG8gTk9UIGluc3RhbGwgZW50aXR5LW1hbmFnZXIvY29uZmlndXJh
dGlvbnM/DQogICAgSXQgd291bGQgYmUgZWFzaWVyIGZvciB2ZW5kb3JzIHRvIGluc3RhbGwgdGhl
aXIgb3duIGNvbmZpZ3VyYXRpb25zLg0KICAgIA0KICAgIFRoYW5rcywNCiAgICBUcm95IExlZQ0K
ICAgIA0KICAgIC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQogICAgRnJvbTogb3BlbmJtYyA8
b3BlbmJtYy1ib3VuY2VzK3Ryb3kubGVlPXZlcnRpdi5jb21AbGlzdHMub3psYWJzLm9yZz4gT24g
QmVoYWxmIE9mIEphbWVzIEZlaXN0DQogICAgU2VudDogV2VkbmVzZGF5LCBOb3ZlbWJlciAyNywg
MjAxOSAxOjI5IEFNDQogICAgVG86IEJyYWQgQmlzaG9wIDxicmFkbGV5YkBmdXp6aWVzcXVpcnJl
bC5jb20+DQogICAgQ2M6IFNoYXduIE1jQ2FybmV5IDxzaGF3bm1tQGxpbnV4LnZuZXQuaWJtLmNv
bT47IE9wZW5CTUMgTWFpbGxpc3QgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NCiAgICBTdWJq
ZWN0OiBbRXh0ZXJuYWxFbWFpbF0gUmU6IGd1aWRlbGluZXMgb24gbmV3IGVudGl0eS1tYW5hZ2Vy
IGNsYXNzZXMNCiAgICANCiAgICBPbiAxMS8yNS8xOSA1OjAyIFBNLCBCcmFkIEJpc2hvcCB3cm90
ZToNCiAgICA+IEhpIEphbWVzDQogICAgPg0KICAgID4gYW5vdGhlciBFTSBxdWVzdGlvbiBmb3Ig
eW91Li4uDQogICAgPg0KICAgID4gQXJlIHRoZXJlIGFueSBndWlkZWxpbmVzIG9yIGJlc3QgcHJh
Y3RpY2VzIG9uIHVwc3RyZWFtaW5nIEVNIGNvbmZpZ3VyYXRpb25zPyAgUHV0IGFub3RoZXIgd2F5
LCBpZiBJIHdhbnRlZCB0byBlbnN1cmUgdGhhdCB5b3Ugd291bGQgYWNjZXB0IG15IGNvbmZpZ3Vy
YXRpb25zIHdpdGggbmV3IHR5cGVzIG9yIGNsYXNzZXMgKGUuZy4gUGlkLCBBREMsIGV0Yy4uKSwg
d2hhdCB3b3VsZCBJIG5lZWQgdG8gZG8gdXAgZnJvbnQgdG8gbWFrZSB0aGF0IHByb2Nlc3MgYXMg
c21vb3RoIGFzIGl0IGNhbiBiZT8NCiAgICANCiAgICBFTSBjb25maWd1cmF0aW9ucyBhcmUgbWVh
bnQgdG8gYmUgZmxleGlibGUsIGFuZCBhcyBsb25nIGFzIHRoZSBkYWVtb24gdW5kZXJzdGFuZHMg
aXQsIGFuZCB0aGUgVHlwZSBpcyB1bmlxdWUsIHRoZXJlIHNob3VsZG4ndCBiZSBhbnkgaXNzdWVz
Lg0KICAgIFRoZXJlIGlzIGEgc2NyaXB0IGhlcmUgdG8gbWFrZSBpdCBhIGJpdCBtb3JlIHByZXR0
eSB0aGF0IENJIHdpbGwgZmFpbCBpZiBpdCBpcyBub3QgcmFuIGh0dHBzOi8vZ2l0aHViLmNvbS9v
cGVuYm1jL2VudGl0eS1tYW5hZ2VyL2Jsb2IvbWFzdGVyL3NjcmlwdHMvYXV0b2pzb24ucHkuDQog
ICAgVGhlIG9ubHkgcmVhbCB0aGluZ3MgdGhhdCBibG9jayBjb25maWd1cmF0aW9uIHJldmlld3Mg
YXJlIHRoaW5ncyB0aGF0IGNhbiBtYWtlIHRoZW0gc2hvcnRlciAodXNpbmcgdGhlIHRlbXBsYXRl
IHN0dWZmIHdoZW4gcG9zc2libGUpLiBCdXQgYXMgdGhleSBhcmUgcGVyIHZlbmRvciwgSSBub3Jt
YWxseSBsZXQgZWFjaCB2ZW5kb3Igb3duIHRoZWlyIG93biBkZXN0aW55IHdpdGggdGhlIGZpbGVz
Lg0KICAgIA0KICAgIFRoZXJlIGlzIGEganNvbiBzY2hlbWENCiAgICBodHRwczovL2dpdGh1Yi5j
b20vb3BlbmJtYy9lbnRpdHktbWFuYWdlci9ibG9iL21hc3Rlci9zY2hlbWFzL2dsb2JhbC5qc29u
DQogICAgdGhhdCBJIGV2ZW50dWFsbHkgaGF2ZSB0aGUgZHJlYW0gb2YgY3JlYXRpbmcgYSBzY3Jp
cHQgdG8gZ2VuZXJhdGUgYSBzY2hlbWEgZm9yIGV2ZXJ5IGNoZWNrZWQtaW4gVHlwZSwgYnV0IEkn
bSBub3QgdGhlcmUgeWV0Lg0KICAgIA0KICAgIC1KYW1lcw0KICAgIA0KICAgID4NCiAgICA+IHRo
eCAtIGJyYWQNCiAgICA+DQogICAgQ09ORklERU5USUFMSVRZIE5PVElDRTogVGhpcyBlLW1haWwg
YW5kIGFueSBmaWxlcyB0cmFuc21pdHRlZCB3aXRoIGl0IGFyZSBpbnRlbmRlZCBzb2xlbHkgZm9y
IHRoZSB1c2Ugb2YgdGhlIGluZGl2aWR1YWwgb3IgZW50aXR5IHRvIHdob20gdGhleSBhcmUgYWRk
cmVzc2VkIGFuZCBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgYW5kIHByaXZpbGVnZWQgaW5mb3Jt
YXRpb24gcHJvdGVjdGVkIGJ5IGxhdy4gSWYgeW91IHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVy
cm9yLCBhbnkgcmV2aWV3LCB1c2UsIGRpc3NlbWluYXRpb24sIGRpc3RyaWJ1dGlvbiwgb3IgY29w
eWluZyBvZiB0aGUgZS1tYWlsIGlzIHN0cmljdGx5IHByb2hpYml0ZWQuIFBsZWFzZSBub3RpZnkg
dGhlIHNlbmRlciBpbW1lZGlhdGVseSBieSByZXR1cm4gZS1tYWlsIGFuZCBkZWxldGUgYWxsIGNv
cGllcyBmcm9tIHlvdXIgc3lzdGVtLg0KICAgIA0KDQo=
