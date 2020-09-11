Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD6C266940
	for <lists+openbmc@lfdr.de>; Fri, 11 Sep 2020 21:55:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bp61r5s5pzDqWN
	for <lists+openbmc@lfdr.de>; Sat, 12 Sep 2020 05:55:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=65234556be=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=RIQcfBtb; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=LcMiZQh2; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bp60q2XT6zDqWN
 for <openbmc@lists.ozlabs.org>; Sat, 12 Sep 2020 05:54:49 +1000 (AEST)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08BJsh0a003661; Fri, 11 Sep 2020 12:54:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=hg5cNeOoBMZo1xO+w6G0EWm4tQ3ftQAVQtc8wylKqf4=;
 b=RIQcfBtbWbScuGqoQRotIX6cKEpND42NMzYgHI6nmM/iZyc2ryXdGXl8tACUvSXCXwX5
 Pxpb8rx+HMBhGvK2IBO+SgHOWMXXfioCIn3GYqXf/q0MtWY5eK066vT65OELXHP50co9
 3Q2DSvR0eMPdOnfSWFgOsJcyyRTbF2xmEY0= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 33fhxuh5vr-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 11 Sep 2020 12:54:46 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.101) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 11 Sep 2020 12:54:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brWKTfw3kcdwdWl4aUFIyOos/qo10AwUNxSA14gz10p2qqxRJppdxH7xgwIwzYWtg6EU2TOuWdl5400m8xznl9ag1Z7dYGyrQbi2JQNxbGMCjv/aiWeEWo0Jyl5nnZuubID8EV/+tMqEXWw3jrDG9z/qwW6Dpq4DxpBXY0Aq4o8azVmVvRxozD0UcUkpc8f/XFbd+92FlK6lMWVYHtRGyjaeqZgi4N6O5EtLPCDx75np9ED5aFxJ3oMryKRoPK2L0YKHQDbcf1qG64YfxdM1wjgURXr97I/HcEOoJ6JidXk/bWnPEUadrSPwOuklDjy9z91xgSqzjWkzmeOrd45MZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hg5cNeOoBMZo1xO+w6G0EWm4tQ3ftQAVQtc8wylKqf4=;
 b=QKD8x81jbIdmQl8MFxD9byS9BfMHuyqkJtroshP3Sr3MLBNyJg0HQkgpCMPHCMP5oqvpNF7gNiwrDCw/WikIn2Z0XzA8F114y6ddMjWbWEKqn09eNlR6ZSGAuVuCAPo5zAaPtt9wyykRsCqpNUBknCb/axD22+isOB1F6pUwC61lBS9DlL0qQxJ9RwpMFOVrShhdKp3kQXzLa/qwdJ5JdXrkBYzmAUCJoWuwRdTtteJ/MTDqvv3vc7bXYW2ASnu/9QElH8Tqfb33jtEhUO2H+rS8M5axarsWm6KwCrn0KhkTzhsXGhQVTrzPeyq27DN0hK9HGdN7HPfcVApXlp4UZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hg5cNeOoBMZo1xO+w6G0EWm4tQ3ftQAVQtc8wylKqf4=;
 b=LcMiZQh24K7PkNMDHTUJbNv3B3334yic56e8bHrit5+GGIryuiPcZsC6MTDinPp5PTfu7p+ebsmlT785YYNY0yKNfFHHaC9AWDWSDtJvJAmBtaeL0sz72y5CJayU+M5oCMLBqe001+Xup8qNHgG0lsr8YqxWd8qojnn05kUB6r4=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2728.namprd15.prod.outlook.com (2603:10b6:a03:14c::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Fri, 11 Sep
 2020 19:54:44 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::4d8e:7b5d:455b:3a97]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::4d8e:7b5d:455b:3a97%6]) with mapi id 15.20.3370.016; Fri, 11 Sep 2020
 19:54:44 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Patrick Voelker <Patrick_Voelker@phoenix.com>, Neil Bradley
 <Neil_Bradley@phoenix.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Tioga Pass OpenBMC 2.8
Thread-Topic: Tioga Pass OpenBMC 2.8
Thread-Index: AdZ4G9/pZ44Ttxs7TiCWRTJU7JTTHQCA72kAAA7UvEAAALC0EP//pIUA//+ESKCAAIvbAP/+FToQgASWKQD//4oO4AAPAmyA//83aBD//mTOgP/mwW7Q/8yCMAD/mIeqQP8wEaiA/mAhSYA=
Date: Fri, 11 Sep 2020 19:54:43 +0000
Message-ID: <22A8A752-CE83-4E7E-9C0A-24828D6FDBFA@fb.com>
References: <c27c916296c14b7a973ce10ce462a574@SCL-EXCHMB-13.phoenix.com>
 <5F804DFD-B91D-4293-A410-62ED737423A7@fb.com>
 <6bc3d9da57d44f55ad66179e74a51bd1@SCL-EXCHMB-13.phoenix.com>
 <a5e34d90e0c34849a672189f8adf9cd7@SCL-EXCHMB-13.phoenix.com>
 <AA3AD0B7-CC74-4B6C-927D-101A3E721004@fb.com>
 <b62681c4a4c148b58cdd9ff1e614d400@SCL-EXCHMB-13.phoenix.com>
 <22D145E2-1328-428F-9AAF-54E138797994@fb.com>
 <ba0c0f989f1045f98a5186a57917c4b6@SCL-EXCHMB-13.phoenix.com>
 <E2ECF617-0F2B-4526-A2F9-20F343F317A3@fb.com>
 <b6891a4662b04509ae5ed0f8c54777ce@SCL-EXCHMB-13.phoenix.com>
 <868F639F-7878-4B90-8CAE-7C95EB57B26E@fb.com>
 <9b4d083d50ad4feba14f5c8848540ade@SCL-EXCHMB-13.phoenix.com>
 <37DC42F0-56AD-477E-A5E0-29F8FB466D63@fb.com>
 <0e51a98472f34f5d8626a54dd2107479@SCL-EXCHMB-13.phoenix.com>
 <F30B4C21-5AF7-4E59-8353-944BD1C9F39B@fb.com>
 <e7456a8f3f004855829dfa746cd70780@SCL-EXCHMB-13.phoenix.com>
 <DDCDB096-458F-4AC6-BFE8-C1670ADC12C8@fb.com>
In-Reply-To: <DDCDB096-458F-4AC6-BFE8-C1670ADC12C8@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: phoenix.com; dkim=none (message not signed)
 header.d=none;phoenix.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2601:647:4b00:fd70:18e2:66b5:5e3d:3d1a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b92e5a2-b3e6-4f60-919f-08d8568c877c
x-ms-traffictypediagnostic: BYAPR15MB2728:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB272887B5B7B4CFA1C0F537F8DD240@BYAPR15MB2728.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yWjJ0JY4Ji87O0gaZM+iHktKVBTleH1yo5ESHeDnItnFY8gowIp3c7CimET9JD3EfSw/tZl7uAzruRI/+CwC/2PzgiZQDMjBFI+hQOluvjP5Pjq/Qh7WZJZzu8vlykVWjv5IPTbpNIivNenZa6CoH5LqseK6HL/jaaLWI4xKT84l/ObVIzAkjBGzkNk66R3PjgalNj5AG7Y8jLuCX74+V1rnO02jm2KkGy4gQt6eQUsGZmKjFW+Fkq/PqXIOrTbVlsZp5v4MtcIRYUXNRt23FvC/zU0sSWhfyOz5frPqrOZXsDKmAcNa9pBvc/OMrcGL12rxJnVmrLgNs6HrKLWRyQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(346002)(396003)(39860400002)(136003)(478600001)(7116003)(4326008)(53546011)(6506007)(110136005)(6512007)(2616005)(76116006)(2906002)(5660300002)(8676002)(66476007)(66946007)(36756003)(6486002)(8936002)(86362001)(66556008)(186003)(83380400001)(66446008)(33656002)(316002)(71200400001)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: l+hAE97/CS1eDzbEFnzEx8R61flGBXGLzVTkHy6/4Sv1umG89QMKEMgfyhoNqvpyrNmO18aFqi1/A2sT64fRJWxxB8cHDyETp5NXlkCnQDTwdmqDRiq3sKwarEFjTTosqlu+kNCQY5G0jrkHZRcPnLTZyUdnUET2cBmyWe3z1fB3DAanV9F5DMoN+2fsvVxfRS7r/M8yJLjQtldpZ75NUEdiWYBjhSWbyp9vVms9iRhX9u2MjfKeF1F18lAoK45Cu8ZK1K2siYaE2ycNHuH0B6zSelPhUeAGte7s1hlYrfXcK+N2uAcAEGiSGUeujFc658eLR8bEhmU/RWhZaNKJ2QAUaEeIqCMJznCydnBL5Fhxe9f66b0JK8VxtnqwHplQ1LfsmeN6qNf4h0IbkMBQv98k+dP/pHv+vyYAZ2LKNYBtWzgQ5KA4//sVbB6FeA9BpPqLV1OCXCfgUXPrl06VS/jCIjivwaZWt4beNVYIZO4DquYoh+ASFPH+YH3TXwvSgRriJsLl8lt4iCv7HCE6NjSXusPtttFcKBt6UpPjiHOH9pTQxk6nX67K4PQy6iFoeh/OZlVAut25hJ31nExbVPfTj+PxgmkNOTbeYgdP9veHVNuMhiT6vBTy8owacdGXab0veY/9RWPbQEQSM3SuyEt7LW4Pzb2dkdUBC6x6V+bCA0uXZw2d5UNtNIQdWTHWunK3IbdmpMR/ZMEWWdj1Hw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E287C17CF56A342B731FB6F174107A7@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b92e5a2-b3e6-4f60-919f-08d8568c877c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2020 19:54:44.0054 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DhQdIZWiHV3W9+yiZdHfszFoAxvIQ3CGyg6H33OOjZo0HXIoSbObcSl/JA2Mimfvg8IhrL3EJ9W01YSXhFEJ0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2728
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-11_10:2020-09-10,
 2020-09-11 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 spamscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009110161
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
Cc: Amithash Prasad <amithash@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

U28gaWYgQk1DIGlzIG5vdCBydW5uaW5nIHRoZW4geW91IGNhbiBjb250cm9sIHBvd2VyIG1hbnVh
bGx5IGJ5IHBvd2VyIGJ1dHRvbiBvciByZXNldCBidXR0b24uIEFzIGZhciBhcyBJIGtub3cgVGhl
cmUgaXMgbm8gYXBwbGljYXRpb24gaW4gdWJvb3Qgd2hpY2ggY2FuIGNvbnRyb2wgcG93ZXIgZm9y
IGhvc3QsIEl0IGlzIGRvbmUgdGhyb3VnaCBCTUMgd2hlbiBpdCBpcyBib290ZWQgdG8gbGludXgg
YW5kIHBvd2VyIGNvbnRyb2wgaXMgcnVubmluZy4NCsKgDQpQbGVhc2UgbGV0IG1lIGtub3cgaWYg
SSBhbSBtaXNzaW5nIGFueXRoaW5nIGhlcmUuDQrCoA0KUmVnYXJkcw0KLVZpamF5DQrCoA0KRnJv
bTogUGF0cmljayBWb2Vsa2VyIDxQYXRyaWNrX1ZvZWxrZXJAcGhvZW5peC5jb20+DQpEYXRlOiBU
aHVyc2RheSwgU2VwdGVtYmVyIDEwLCAyMDIwIGF0IDI6NDAgUE0NClRvOiBWaWpheSBLaGVta2Eg
PHZpamF5a2hlbWthQGZiLmNvbT4sIE5laWwgQnJhZGxleSA8TmVpbF9CcmFkbGV5QHBob2VuaXgu
Y29tPiwgIm9wZW5ibWNAbGlzdHMub3psYWJzLm9yZyIgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9y
Zz4NCkNjOiBBbWl0aGFzaCBQcmFzYWQgPGFtaXRoYXNoQGZiLmNvbT4NClN1YmplY3Q6IFJFOiBU
aW9nYSBQYXNzIE9wZW5CTUMgMi44DQrCoA0KSeKAmW0gcmVmZXJyaW5nIHRvIHRoZSBpbnRlcmFj
dGl2ZSB1LWJvb3QgcHJvbXB0IHRoYXQgeW91IGNhbiBhY2Nlc3MgYnkgcHJlc3NpbmcgYSBrZXkg
b24gdGhlIEJNQyBzZXJpYWwgY29uc29sZSB0byBzdG9wIHRoZSBCTUMgYm9vdCB0byBsaW51eC4N
CsKgDQpGcm9tOiBWaWpheSBLaGVta2EgW21haWx0bzp2aWpheWtoZW1rYUBmYi5jb21dIA0KU2Vu
dDogVGh1cnNkYXksIFNlcHRlbWJlciAxMCwgMjAyMCAyOjEzIFBNDQpUbzogUGF0cmljayBWb2Vs
a2VyOyBOZWlsIEJyYWRsZXk7IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KQ2M6IEFtaXRoYXNo
IFByYXNhZA0KU3ViamVjdDogUmU6IFRpb2dhIFBhc3MgT3BlbkJNQyAyLjgNCsKgDQpIaSBQYXRy
aWNrLA0KV2hhdCBleGFjdGx5IHlvdSBtZWFuIGJ5IHN0b3BwZWQgYXQgdS1ib290IHByb21wdCwg
ZG8geW91IG1lYW4gYm1jIHN0b3BwZWQgYXQgdS1ib290Pw0KwqANClJlZ2FyZHMNCi1WaWpheQ0K
wqANCkZyb206IFBhdHJpY2sgVm9lbGtlciA8UGF0cmlja19Wb2Vsa2VyQHBob2VuaXguY29tPg0K
RGF0ZTogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgOSwgMjAyMCBhdCA0OjEzIFBNDQpUbzogVmlqYXkg
S2hlbWthIDx2aWpheWtoZW1rYUBmYi5jb20+LCBOZWlsIEJyYWRsZXkgPE5laWxfQnJhZGxleUBw
aG9lbml4LmNvbT4sICJvcGVuYm1jQGxpc3RzLm96bGFicy5vcmciIDxvcGVuYm1jQGxpc3RzLm96
bGFicy5vcmc+DQpDYzogQW1pdGhhc2ggUHJhc2FkIDxhbWl0aGFzaEBmYi5jb20+DQpTdWJqZWN0
OiBSRTogVGlvZ2EgUGFzcyBPcGVuQk1DIDIuOA0KwqANClZpamF5LA0KwqANCldl4oCZcmUgaGF2
aW5nIHN1Y2Nlc3Mgd2l0aCBwb3dlciBjb250cm9sIG9uY2UgYm9vdGVkIGludG8gTGludXggKHdp
dGggdGhlIEZhY2Vib29rIE9wZW5CTUMgMi44IHRpb2dhcGFzcyBidWlsZCkgYnV0IGNhbuKAmXQg
c2VlbSB0byBjb250cm9sIHRoZSBwb3dlciB3aGVuIHN0b3BwZWQgYXQgdGhlIHUtYm9vdCBwcm9t
cHQuwqAgSXMgdGhhdCBzb21ldGhpbmcgdGhhdCBzaG91bGQgYmUgd29ya2luZz8NCsKgDQpJZiBu
b3QsIGNhbiB5b3UgaGVscCBtZSBpZGVudGlmeSB0aGUgbWluaW11bSBjcml0aWNhbCBkaWZmZXJl
bmNlcyBiZXNpZGVzIGVuYWJsaW5nIHRoZSBHUElPRSBwYXNzdGhyb3VnaD/CoCBQb3dlciBjb250
cm9sIGluIHUtYm9vdCBpcyBhbiBpbXBvcnRhbnQgZ29hbCBmb3Igb3VyIGRldmVsb3BtZW50LsKg
IEkgdHJpZWQgdXNpbmcgYWxsIG15IGxlYXJuaW5ncyBmcm9tIHdvbGZwYXNzIHRvIGdldCBpdCB0
byB3b3JrIGJ1dCBoYXZlIG5vdCBiZWVuIHN1Y2Nlc3NmdWwgeWV0Lg0KwqANClJlZ2FyZHMsIFBh
dHJpY2sNCg0K
