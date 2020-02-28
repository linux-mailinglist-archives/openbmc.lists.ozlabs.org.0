Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 466ED1741E4
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 23:19:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TkVC2dgwzDrCB
	for <lists+openbmc@lfdr.de>; Sat, 29 Feb 2020 09:19:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=0327bd19d5=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=MdzeqJ5C; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=ff5otlXX; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TkTP3t4tzDqq5
 for <openbmc@lists.ozlabs.org>; Sat, 29 Feb 2020 09:18:46 +1100 (AEDT)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01SMG0kn011812; Fri, 28 Feb 2020 14:18:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=xCGG+nvQlEV16JJG7XWcCq87O+qXW4zKdz8d7nSntsQ=;
 b=MdzeqJ5CjMEo7wYhfX3vfyrdzGLtC3KgeycwGI/vQuzZFZKr6lipJ77UnZ9gmpsUhv+s
 p09Cd0htV495xWx7q2mUL0QoixPqqZnr0tbkbkliHczG7AfpiOeYU2O16VmWjmIuv9jY
 vhj+kAK9+KU27ILNb+KlSPuuUl9ZiWaQ6iM= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2yepu8wvgf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 28 Feb 2020 14:18:41 -0800
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 28 Feb 2020 14:18:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kmOChcuxFiruO+N0eoWGn3YdcrfD5+bRyBHxkd0O9/QwbPJPAGauszM+mgQ55X+Ja+2tPr/QRDMzq9EejlbYzVgjuRYVZwP2nFpK6ElE1ymLZoI9eMon45RqCHjw0cQZzex+lIIdIGX+WCpZCdkd9BDaSTXP0whhcK6l4Ns2uJHQ1bf1GFniginbeCXQe13l+mi/D3GqG4I2kUbUt32d7asKVSXVcsnqrQ22fhgOOFU912lIH3aE/RaYdFR7MMhnk8hz0LA5GoyE3CaAwlGcKyyaSNShsGvbCmz368XolZLVh3Gjeuukp4frzoepTw6zAs4kgBffMNeqAex1POh3YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCGG+nvQlEV16JJG7XWcCq87O+qXW4zKdz8d7nSntsQ=;
 b=K9Z0M6gBN1qrNPdwyfk84ihR3MsOezcU4ICN/h3+Saxu5ez2GeXI057wv1xdCHpTsrKoG6LWmhLu/rsB7k32aZrz/pRXv8YxqR6bVyYn7G/e3uvnsSWSTXtoBVuWz0NjkulFzSgM7sEbclJI73UBw4NJ49FbBX6+lgUA2+pPOOk/MuD1/MdSB/kAXEUv42O0YHBIFAVoDTGOBz9aPFe6EW3FQQ/Ic6MaiVKs5E8m5jTB7ZBR10ughGFze+qBcr+Cgo96xuueartfX707ve/yX3GgaCughBf6GYrTBGKj6uD6dyKZ7pQsc1BS31VrpdTsAyat0/tsc7PLnx2LC/tDcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCGG+nvQlEV16JJG7XWcCq87O+qXW4zKdz8d7nSntsQ=;
 b=ff5otlXXho5ljq63p1gcOgEF3o0an+P2kEWmtu2tQMYZAEjbFQGxRJlmSOn2QYPB+R/dNoGymkHjS27/0W+pUaUk0bMSpY3TdTOf8uQ7R/+ajCV4c0Ik81Q+zUX4j8nweHYHfQhGuOcUCVy18XcH6FyKWcB2Yy5oVTZj5F21v3I=
Received: from MW3PR15MB3947.namprd15.prod.outlook.com (2603:10b6:303:49::9)
 by MW3PR15MB3932.namprd15.prod.outlook.com (2603:10b6:303:51::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15; Fri, 28 Feb
 2020 22:18:38 +0000
Received: from MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936]) by MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936%4]) with mapi id 15.20.2772.018; Fri, 28 Feb 2020
 22:18:38 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: obmc console for multiple host
Thread-Topic: obmc console for multiple host
Thread-Index: AQHV7faP5RFIDWYuz0yVWkpwSrbrE6gwE56AgACUY4A=
Date: Fri, 28 Feb 2020 22:18:38 +0000
Message-ID: <0AB52768-6D88-4FF5-85C1-7BF1005CEF3A@fb.com>
References: <37851ADF-67EC-4761-A4C5-33F28373A609@fb.com>
 <64e1858f-7713-4ca4-880f-db639ab78d30@www.fastmail.com>
In-Reply-To: <64e1858f-7713-4ca4-880f-db639ab78d30@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:500::7:bb5c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5eaf8460-81bf-4640-60c5-08d7bc9c2926
x-ms-traffictypediagnostic: MW3PR15MB3932:
x-microsoft-antispam-prvs: <MW3PR15MB393251151E235A9F258D04F2DDE80@MW3PR15MB3932.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0327618309
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(396003)(39860400002)(366004)(136003)(189003)(199004)(4326008)(316002)(2616005)(478600001)(36756003)(2906002)(186003)(8676002)(81156014)(6486002)(81166006)(66946007)(86362001)(6916009)(33656002)(5660300002)(64756008)(6506007)(71200400001)(76116006)(8936002)(66556008)(66476007)(6512007)(66446008)(966005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MW3PR15MB3932;
 H:MW3PR15MB3947.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0TbO/AyQTVkXrko1X9kEDWWQjbzw1OfsjoB7/qECy8RHnzY8DeviGC+uF8rutXPcqfcGioAWRdYGqzvoN4BrWE8iOKTZXiKru7a0TDrZuSFrD35TWLsSMdiBH5Am+mQ4Wg0oc57+qOylq97bepPa5MPb5OljEXZMyhnmHkmXT+RAgLiEVWAr/glpa1EjqST8Nqc95S16lpjMfXozbgKBtihNVmft2n8YNWcIYU5U6mqkkR+kAVPbugi1x1TlfsZ5O0kjLdbCfpOWeDy5vnyb0kCkNuOdzXJtPFfMxZQVYPQNyqmd5W7Ue0VCPQ4VHCtG85diLguellPVzOSQwloGQU7manuykq6/ku1o27LlpM6KdNPPlnsJGL5yrue2t3zIRj0YGzdFuFwwI4N7GvHBDT4FVBlW4R95W7tXuxYOMQ1SsHOdjG4tcqQXEdAFiUL3gAJJOSp2MfyhF2GGof3BsnctAZxRYgnPwJBVx+1Gx86WEdi7W42pdU0w2JJcrnWiiPL4Jb1tCM8gmpzCa5JhSg==
x-ms-exchange-antispam-messagedata: 3vOXfhgPn5Ns8lGn7Uj9ncZ0xsMKDeaxhz8ATBl8Qd2FERy9fnOcVx4lfJFcEyL96esVPXTGRXwDqEYQ+KwJZzbwPRn3GfBu0S+V00ip7xu72597FATRgNbufuF0XFV67XYmiaFfwBZj1Dppt3YkYDu72dMCZdUhQZBdCSa6lFYpPa3WpjYrsAhEm4JMzq3h
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF059252887EC94A8405F25E422274B4@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eaf8460-81bf-4640-60c5-08d7bc9c2926
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2020 22:18:38.5743 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CHgeYMeGJsjUUUzFpquGNasD+hVM6kXxQzasH9Jr1mMHYGor/axthRtylNf1bWpsugg7yDr3IlGsBI03Ky2fwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3932
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-28_08:2020-02-28,
 2020-02-28 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 suspectscore=0
 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=865 clxscore=1015
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002280159
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

SGkgQW5kcmV3LA0KSSBhbSBhYmxlIHRvIHNlZSBjb25jdXJyZW50IHNlcnZlciB3b3JraW5nLiBJ
IGhhdmUgdG8gYWRqdXN0IG15IGJiYXBwZW5kLiANCg0KVGhhbmtzIGEgbG90IGZvciB0aGlzIHN1
cHBvcnQuDQoNClJlZ2FyZHMNCi1WaWpheQ0KDQrvu79PbiAyLzI3LzIwLCA5OjI3IFBNLCAiQW5k
cmV3IEplZmZlcnkiIDxhbmRyZXdAYWouaWQuYXU+IHdyb3RlOg0KDQogICAgSGkgVmlqYXksDQog
ICAgDQogICAgT24gRnJpLCAyOCBGZWIgMjAyMCwgYXQgMTU6NDgsIFZpamF5IEtoZW1rYSB3cm90
ZToNCiAgICA+ICANCiAgICA+IEhpIEFuZHJldywNCiAgICA+IA0KICAgID4gSSBzYXcgbmV3IG11
bHRpIGhvc3Qgc3VwcG9ydCBpbiBvYm1jIGNvbnNvbGUuIFRoYW5rcyBmb3IgZXh0ZW5kaW5nIA0K
ICAgID4gb2JtYy1jb25zb2xlIGZvciBtdWx0aSBob3N0IGNvbm5lY3Rpb24uDQogICAgDQogICAg
Tm8gcHJvYmxlbXMhDQogICAgDQogICAgPiANCiAgICA+IA0KICAgID4gQ2FuIHlvdSBwbGVhc2Ug
c2VuZCBtZSBuZXcgY2hhbmdlcyByZXF1aXJlZCBpbiBjb25maWd1cmF0aW9uIGZpbGUgYXMgd2Ug
DQogICAgPiBhcmUgZGVmaW5pbmcgbG9jYWwtdHR5IGFuZCBiYXVkIGZvciBob3N0IGluIG91dCBj
b25maWd1cmF0aW9uIGZpbGUgZm9yIA0KICAgID4gc2luZ2xlIGhvc3QuIFdoYXQgd291bGQgYmUg
YSBzYW1wbGUgY29uZmlnIGZpbGUgZm9yIG11bHRpcGxlIGhvc3QgDQogICAgPiBzdXBwb3J0IGFu
ZCBhbHNvIHdoYXQgYXJlIGNvbW1hbmQgbGluZSBvcHRpb24gd291bGQgYmUgZm9yIGNsaWVudCB0
byANCiAgICA+IGNvbm5lY3QgdG8gcGFydGljdWxhciB0dHkuDQogICAgDQogICAgRGlkIHlvdSBz
ZWUgbXkgcmVzcG9uc2UgaGVyZT8gSSB0aGluayBpdCBjb3ZlcnMgdGhlIGFuc3dlcnMgdG8geW91
cg0KICAgIHF1ZXN0aW9uczoNCiAgICANCiAgICBodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2lu
dC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX2xpc3RzLm96bGFicy5vcmdfcGlwZXJtYWlsX29wZW5i
bWNfMjAyMC0yREZlYnJ1YXJ5XzAyMDczNi5odG1sJmQ9RHdJQkFnJmM9NVZEMFJUdE5sVGgzeWNk
NDFiM01VdyZyPXY5TVUwS2k5cFduVFhDV3dqSFBWZ3BuQ1I4MHZYa2tjcklhcVU3VVNsNWcmbT1r
cDhkUTNmTlNjcUJwUFI2QlFnRTJOaWlxN3NSQnFvT1BGMVN6cTgySmdFJnM9NTVSa1hmektYM0ZH
YVpWVU0yYVhnUlRIYkRZbXlXQnlHamN6dWpublo1byZlPSANCiAgICANCiAgICBJZiBpdCBkb2Vz
bid0IGNhbiB5b3UgcGxlYXNlIHJlc3BvbmQgaW4gdGhhdCB0aHJlYWQgYWJvdXQgd2hhdCBpcyB1
bmNsZWFyPw0KICAgIA0KICAgIEkgZGlkIGxlYXZlIG91dCBleGFjdCBkZXRhaWxzIG9uIGhvdyB5
b3UgbWlnaHQgaW50ZWdyYXRlIGNvbmN1cnJlbnQgc2VydmVyDQogICAgc3VwcG9ydCBpbnRvIHlv
dXIgYml0YmFrZSByZWNpcGVzLiBJIGNhbiBwcm92aWRlIHN1Z2dlc3Rpb25zIG9uIGhvdyB0byBk
bw0KICAgIHNvIGlmIGl0IGhlbHBzLg0KICAgIA0KICAgIENoZWVycywNCiAgICANCiAgICBBbmRy
ZXcNCiAgICANCg0K
