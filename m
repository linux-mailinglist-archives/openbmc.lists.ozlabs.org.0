Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C091AE5BE
	for <lists+openbmc@lfdr.de>; Fri, 17 Apr 2020 21:24:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493mHq4bTfzDqSZ
	for <lists+openbmc@lfdr.de>; Sat, 18 Apr 2020 05:24:39 +1000 (AEST)
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
 header.s=facebook header.b=GI2P7hWF; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=DGxw6pwr; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493mDG2RVkzDrhN
 for <openbmc@lists.ozlabs.org>; Sat, 18 Apr 2020 05:21:33 +1000 (AEST)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03HJGNQp011535; Fri, 17 Apr 2020 12:21:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=9fXFoj7dd527tKYb1tWsdUPTMgtDNdlJ6cC0JIZb6ng=;
 b=GI2P7hWFbJxbofL5XaRhkNga3JYDTLjehqPuvNrRrmns1b3sXw1kmMx/FtGwgHU94rHe
 C/6zoLvwNay15IVAuSWmSrfS3CNH88wNHc2db6Xk8hMzDgRX2dkic1uNQUWOHbtkiEfR
 vNr3wXwrq/73/FI3YnJ9jKyt9czQuppo3Ts= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 30dn894bh2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 17 Apr 2020 12:21:21 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.101) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Fri, 17 Apr 2020 12:21:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VcuP4I3SwvkIADEuCPaJSoRB5r//hdi2UbUJAf3XeHsUwqOg8kYRuyw+ouQsBCid2OI7q8cISPdTQPoUR8LgynJMWrWEAT5aFYbDQsUO5bxYsOblejpeRcoWfq1SQXNZrPdJ6EBS53AmD6qzXzXGer6fweL28zB+pQEcHejAGxQeM6puIDOq+iO+JtOXMhVtf2GdngE9SMh1NFiyHEl4eklcqiQLsMx8v57nqKHOrcYvy7zqGOKC6UTJSJEk0HbRBkSvbAPmCv3VGMFyEn1Km3K38c69+u3TbrLJ4h4Mzw029gxq0YNecdGiE5XCRVePhVYPnAkK/egz0Osp2FXJgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fXFoj7dd527tKYb1tWsdUPTMgtDNdlJ6cC0JIZb6ng=;
 b=UHugn71rgWRQaMtSMUFBBOEavqzsk42w7k+gKb8UpYM/A9zioJ3YwZi4Hjoq8t+XuQU+Cyhe1D17kpKFzsxFvr67nW2aZl1MAK5gOOZZIWtTLcquOOIqkBFhawOCEWRVduvFPb3e9Ve/uNp6O/SdxF4irtzxajdnZ2/yeolawI4JoSx1rmd/185TE5uoz/ZGNUZT26Oaua7sIow41vXlYT+lmC0o6dug6Y6Filp4Vaxya1VbAx1p/66fUo94AgwYV8g6uTVp/npVZEmpf/2uNi+syySXAzEuuEonuuUVp0qGebnuVXQQeoWiL1RHwu4v12PFEWeOhd+0vfk69ku7EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fXFoj7dd527tKYb1tWsdUPTMgtDNdlJ6cC0JIZb6ng=;
 b=DGxw6pwrNuHNo7MeJTiB6FnFuYLqugf09haiTTlDo+JHyHFXkUdP8WQkCml545+AcSL8f3N5T2UVeKjn4nugg3Oo6ENF2qecHL7NkfGrmNdbRCVOCpvoiyvPwrUZmgCclcYrjMUxGjeXYj3PtcV0yYtMqhlmEqSjaQiiE7j5zdY=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB4087.namprd15.prod.outlook.com (2603:10b6:a02:bd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Fri, 17 Apr
 2020 19:21:05 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4%3]) with mapi id 15.20.2921.027; Fri, 17 Apr 2020
 19:21:05 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Benjamin Fair <benjaminfair@google.com>
Subject: Re: nvme sensors
Thread-Topic: nvme sensors
Thread-Index: AQHWEx5rEqsJqc4WEEC8M3OzxbfV76h5pxOAgADRXfD//5lHAIAAmM4QgABf84CAAOO4gIAAerOAgADA2ACAAHcQAP//k1uAgAB5voD//5EyAA==
Date: Fri, 17 Apr 2020 19:21:04 +0000
Message-ID: <7DF0BBCA-30D8-43A7-9D65-710F0B42CA0A@fb.com>
References: <0F332F74-FF51-4239-8B52-2EBA770AE6CC@fb.com>
 <8022481D-7C72-4A7B-AF9C-D144177B4C88@fb.com>
 <CH2PR21MB1510E11F9772C45D12EEA0F1C8DB0@CH2PR21MB1510.namprd21.prod.outlook.com>
 <82E67AAA-1BD8-41D8-BE27-966F840236E2@fb.com>
 <CH2PR21MB1510AEF844D82AC9D897B902C8DB0@CH2PR21MB1510.namprd21.prod.outlook.com>
 <4770a42d-d012-4e95-9347-d5c287c2e288@www.fastmail.com>
 <5CD00373-FD92-4E57-90C5-21FB8AD6DD25@fb.com>
 <CADKL2t5r0tCSOLiwovjiqvbV8_oCdJSSnGcekWZkGQb7JFDZBg@mail.gmail.com>
 <B555CC60-3770-454E-813B-5F00783E97C7@fb.com>
 <CADKL2t6zJU_rQ+di7FNjjSHq=xo5ig=-u_GBrR51C6DaLQJ0-w@mail.gmail.com>
 <24C73C51-BD4F-489B-A8CE-9DF805F9AAF0@fb.com>
 <CADKL2t5Sd6qo2LVpK_=C+w4WzXwimhsGKJoMD78w9DACRw+H1Q@mail.gmail.com>
In-Reply-To: <CADKL2t5Sd6qo2LVpK_=C+w4WzXwimhsGKJoMD78w9DACRw+H1Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:6798]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88546a31-66ee-46ac-b87c-08d7e3047950
x-ms-traffictypediagnostic: BYAPR15MB4087:
x-microsoft-antispam-prvs: <BYAPR15MB4087BE04BD99DA949E9E5838DDD90@BYAPR15MB4087.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0376ECF4DD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(376002)(346002)(39860400002)(136003)(396003)(366004)(186003)(66446008)(91956017)(2906002)(7116003)(3480700007)(76116006)(6512007)(86362001)(8676002)(71200400001)(36756003)(8936002)(81156014)(478600001)(4326008)(54906003)(66946007)(64756008)(66556008)(6916009)(316002)(6506007)(6486002)(5660300002)(33656002)(66476007)(2616005)(53546011);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a0lFzu1V6tUzdog4du8kMZemFw++MR1jgL1lnrbN4j7BQIGqiC+iYT3cXB5xU7u7HLCI/QBOzM89MOONey8EB2a7bC2bNPGNhUKjSgCPnU8tiiSC/ivhvUChJhBss3jOIbwgP3ZTEJMteSzIokAMac1ec/ZryA1uKYQ/xMbg+EccZVQCfWyXaat9kNm9YS+NVOA+hOfTo/9giN9q+mj8Pgc+AWp3GEq7ODC2IsPYtyIUIfFECqTvbXLy+xHQh4ONFINI5+B5Haps0VyXPs33NQWTGRUGXrMP0BJ/BUUt4J6W076JC9Np3Hn51+AbPECGKKBrWNBMCu/BM8MCl3YdrOB7TMA6HUz5PkqB200HiXKXe0+Q99cS5ULQrx9QXJ3JowKm69ONYPJOPLpj0zwka2ho/rD2Fl1aHT9DC5w9ejk4U8UMm9ZNaz37S/lLLJoi
x-ms-exchange-antispam-messagedata: meuB0aTP4btQ+tS97ylPdFmzPQODHSEYPfPklUOZ1LMu0L43aHapDG6gTxZartp5q2LjwLwIHfRwLpunKYxxAzkOTsCShZA4pBqGjwum2FRKIX723T/Z/4P61Wq/MBtaMDq7KAm9ATSWvMEwMyVvS66IPIf+c2mknCi9chMCyaJmqqcyaPqf0f9hoXu0a71Y
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <7770A028559890479801514040E56D65@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 88546a31-66ee-46ac-b87c-08d7e3047950
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2020 19:21:04.8833 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IdKJSSX7mjdoY25XUaCUwne8RNRJy6la8oUfTZq+0hYcgsDWUUOi4JeULIGLK9an/ruSizFyKR9tG2A1WU3jPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB4087
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-17_09:2020-04-17,
 2020-04-17 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 bulkscore=0
 mlxlogscore=906 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004170145
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

DQoNCu+7v09uIDQvMTcvMjAsIDExOjU4IEFNLCAiQmVuamFtaW4gRmFpciIgPGJlbmphbWluZmFp
ckBnb29nbGUuY29tPiB3cm90ZToNCg0KICAgIE9uIEZyaSwgMTcgQXByIDIwMjAgYXQgMTE6NDIs
IFZpamF5IEtoZW1rYSA8dmlqYXlraGVta2FAZmIuY29tPiB3cm90ZToNCiAgICA+DQogICAgPg0K
ICAgID4NCiAgICA+IE9uIDQvMTcvMjAsIDExOjExIEFNLCAiQmVuamFtaW4gRmFpciIgPGJlbmph
bWluZmFpckBnb29nbGUuY29tPiB3cm90ZToNCiAgICA+DQogICAgPiAgICAgT24gRnJpLCAxNyBB
cHIgMjAyMCBhdCAxMTowNSwgVmlqYXkgS2hlbWthIDx2aWpheWtoZW1rYUBmYi5jb20+IHdyb3Rl
Og0KICAgID4gICAgID4NCiAgICA+ICAgICA+DQogICAgPiAgICAgPg0KICAgID4gICAgID4gT24g
NC8xNi8yMCwgNDozNSBQTSwgIkJlbmphbWluIEZhaXIiIDxiZW5qYW1pbmZhaXJAZ29vZ2xlLmNv
bT4gd3JvdGU6DQogICAgPiAgICAgPg0KICAgID4gICAgID4gICAgIE9uIFRodSwgMTYgQXByIDIw
MjAgYXQgMTY6MTUsIFZpamF5IEtoZW1rYSA8dmlqYXlraGVta2FAZmIuY29tPiB3cm90ZToNCiAg
ICA+ICAgICA+ICAgICA+DQogICAgPiAgICAgPiAgICAgPiBDdXJyZW50bHksIGRidXMtc2Vuc29y
cyBzdXBwb3J0IHJlYWRpbmcgTlZNRSBzZW5zb3JzIHZpYSBtY3RwIG9ubHkuIEl0IHVzZXMNCiAg
ICA+ICAgICA+ICAgICA+IGxpYm1jdHAgYW5kIHNvbWUgb2Ygc21idXMgcGF0Y2ggZnJvbSBJbnRl
bC4gSXQgYWxzbyB1c2VzIHNsYXZlIG1xdWV1ZSBtY3RwDQogICAgPiAgICAgPiAgICAgPiBrZXJu
ZWwgZHJpdmVyIHdoaWNoIGlzIG5vdCB1cHN0cmVhbS4NCiAgICA+ICAgICA+ICAgICA+DQogICAg
PiAgICAgPiAgICAgPiBTbyBjdXJyZW50bHkgaXQgaXMgbm90IG1hdHVyZWQgYW5kIGZ1bGx5IHVw
c3RyZWFtZWQuDQogICAgPiAgICAgPiAgICAgPg0KICAgID4gICAgID4gICAgID4gSmFtZXMsIGhv
dyBjYW4gd2UgdXNlIHRoaXMgd2l0aG91dCBtY3RwLiBJIGRvbid0IHNlZSBhbnkgbm9uIG1jdHAg
c3VwcG9ydCBsaWtlDQogICAgPiAgICAgPiAgICAgPiBTZW5kaW5nIGRpcmVjdCBzbWJ1cyBjb21t
YW5kLCBwbGVhc2UgYWR2aXNlIGlmIEkgbWlzc2VkIGl0Lg0KICAgID4gICAgID4NCiAgICA+ICAg
ICA+ICAgICBJZiB5b3Ugd2FudCB0byB1c2UgTlZNRS1NSSB3aXRob3V0IE1DVFAsIHRoaXMgdXNl
IGNhc2UgaXMgc3VwcG9ydGVkIGJ5DQogICAgPiAgICAgPiAgICAgcGhvc3Bob3ItbnZtZS4gSXQg
bWFrZXMgZGlyZWN0IFNNQnVzIGNhbGxzLg0KICAgID4gICAgID4NCiAgICA+ICAgICA+IEJlbiwg
dGhhbmtzIEkgc2VlIHRoYXQgYnV0IGl0IG5lZWRzIGNlcnRhaW4gR1BJT3MgbGlrZSBQd3JHZCwg
cHJlc2VuY2UgYW5kIEkgYW0gdHJ5aW5nIHRvIGZpbmQgaWYNCiAgICA+ICAgICA+IE91ciBwbGF0
Zm9ybSBzdXBwb3J0IGFueSBzdWNoIEdQSU9zLg0KICAgID4NCiAgICA+ICAgICBJZiB5b3VyIHBs
YXRmb3JtIGRvZXNuJ3QgaGF2ZSB0aGVzZSBHUElPcywgd2Ugc2hvdWxkIGJlIGFibGUgdG8gbWFr
ZQ0KICAgID4gICAgIHBob3NwaG9yLW52bWUgbW9yZSBmbGV4aWJsZSBhbmQgbm90IHJlcXVpcmUg
dGhlbS4gSXQgd2FzIGRlc2lnbmVkIGZvcg0KICAgID4gICAgIG9uZSBzeXN0ZW0gYXQgZmlyc3Qg
d2l0aCB0aGUgZXhwZWN0YXRpb24gdGhhdCBpdCBjb3VsZCBiZWNvbWUgbW9yZQ0KICAgID4gICAg
IGdlbmVyYWwgb3ZlciB0aW1lLg0KICAgID4NCiAgICA+IENvb2wsIFRoYXQgd2lsbCBiZSBncmVh
dC4gSSBhbHNvIGRvbid0IHNlZSByZWNpcGUgZmlsZSBmb3IgdGhpcy4NCiAgICANCiAgICBUaGUg
cmVjaXBlIGZpbGUgaXMgYXQNCiAgICBtZXRhLXBob3NwaG9yL3JlY2lwZXMtcGhvc3Bob3Ivc2Vu
c29ycy9waG9zcGhvci1udm1lX2dpdC5iYg0KVGhhbmtzDQogICAgDQogICAgPiBBbmQgaG93IGVh
c3kvaGFyZCB0byBpbnRlZ3JhdGUgdGhpcw0KICAgID4gd2l0aCBlbnRpdHkgbWFuYWdlciBhcyB3
ZSB1c2UgZW50aXR5IG1hbmFnZXIgdG8gbGlzdCBhbGwgc2Vuc29ycy4NCiAgICANCiAgICBJJ20g
bm90IGZhbWlsaWFyIGVub3VnaCB3aXRoIGVudGl0eS1tYW5hZ2VyIHRvIHNheSBmb3Igc3VyZS4N
CiAgICANCiAgICA+DQogICAgPiAgICAgPg0KICAgID4gICAgID4gICAgID4NCiAgICA+ICAgICA+
ICAgICA+IFJlZ2FyZHMNCiAgICA+ICAgICA+ICAgICA+IC1WaWpheQ0KICAgID4gICAgID4gICAg
ID4NCiAgICA+ICAgICA+ICAgICA+DQogICAgPiAgICAgPg0KICAgID4gICAgID4NCiAgICA+DQog
ICAgPg0KICAgIA0KDQo=
