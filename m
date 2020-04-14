Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 931441A8A89
	for <lists+openbmc@lfdr.de>; Tue, 14 Apr 2020 21:12:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491w9K1cjqzDqGT
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 05:12:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=137338503b=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=jYsSO/KR; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=fMoUeYA1; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491w6f4kLgzDqgq
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 05:10:17 +1000 (AEST)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03EJ4FT1029110; Tue, 14 Apr 2020 12:10:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=SfYiOxNq/I8rY8QgYnpWKgAldtYZaLsMYqya+p6QSkI=;
 b=jYsSO/KRJfkjTpg4MlXBjMkQ28GjZtAlo8e2Hl/VMV2rQkLbf9jGu+gWJhhkSYfv3kEk
 3SgSLDkAVekgrABHBzs7DoSUVTwBCtS9s76f3InXwfV7VowJMFPGOJbn2wB3JO3kRLUe
 9UHGa0l9h/SOT4ZwsLiBvY2W0lZtNH4+rFs= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 30cbux1pw6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 14 Apr 2020 12:10:12 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.173) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Tue, 14 Apr 2020 12:10:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e7GOya6pE4eUZp4QxRGQOsFtbe9OY/BKS3LfkVgXdXpK61N+J94CAnSC4ImXLp3Qkf+YC2IP1zKMB5KptZPv5s+EpHKNXHSo58ZjunwbOZKhubvC4jKDjPGkq6tPO4Xo2r/zBNdcIIeC4sMiDC7kBDMcyCbIq57RSB0wO7LELA8IlHX+kPiiJB+xq/0gwdlsqsuxwYUrDCgjFYU9oS4Ftl4CQpHFHW6I6Gwt4sXolSCUGORPFBVCoWOLWgrXa/dVTdyXWXqa/bgJ/H97jrWCnseqx4C1e6VUKdZ0L/F8uhvoDDscRewPpvI/uIkxS5ZCLjXOBicqZ5/txFN5+IXjjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SfYiOxNq/I8rY8QgYnpWKgAldtYZaLsMYqya+p6QSkI=;
 b=bQtQrdH3T3U6cGdqxGq2OwhpLrbziqw9m9gaDTW7blzBS/3xcw1vhlT+bWdcW9JUZ3znsKd6767cz9eG7RjPjuizlbXkwRE1I1leKW68FJbYrAcoOH1jaR3X0Y9D026YeXwy4hmSGXwnCg/0fMQgWfE5wu/NcY6DTuYxzk67jR4GOkgffHfknEdSBA2tWLkQZRvG3h/peCcXUd9vmVvLY7RKnDwMGHdHMfScaBuB/AV/KdUBcM85hx8Ucd1JYdzAl0eKGTF9vv8Ffck9WwDhY5mMrTYM3uoQr3DmQPLWHG7VXpu19dxaJ+DOut7L1djjog6beOIk9tZV4DLtzttFjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SfYiOxNq/I8rY8QgYnpWKgAldtYZaLsMYqya+p6QSkI=;
 b=fMoUeYA1RwBXd9pYUiAMX4D9xAEnJ0UPC9yLcWvV2IQ21MFHDz3Zw5tlXC+a2tmHQhpthesCtVdkoTzx9EtCGVtPIg5TDbuOymTt47dds6YyEyPg8WFvyTPNXYounjBrFRzkkjs5M2GAZJKJur6lYNJ3rCkGg5tNSGq+gxFiYyA=
Received: from MW3PR15MB3947.namprd15.prod.outlook.com (2603:10b6:303:49::9)
 by MW3PR15MB3819.namprd15.prod.outlook.com (2603:10b6:303:43::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.28; Tue, 14 Apr
 2020 19:10:10 +0000
Received: from MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::950:594c:b2fc:be8]) by MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::950:594c:b2fc:be8%4]) with mapi id 15.20.2900.028; Tue, 14 Apr 2020
 19:10:10 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: James Feist <james.feist@linux.intel.com>, krtaylor
 <kurt.r.taylor@gmail.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Call for Gardening Tasks
Thread-Topic: Call for Gardening Tasks
Thread-Index: AQHWDrmuNFZqAsujrUqlx9b5NhLbqKhxVX8A//+RtgCAAYJ/gIAAAhGAgAA6tQCABedcAA==
Date: Tue, 14 Apr 2020 19:10:10 +0000
Message-ID: <9E425EB0-BC70-4D6D-9DEC-5D4F43A60AC7@fb.com>
References: <CAH1kD+bqZfeO8ezvwbmjx_PZ4vaKyhxGgvirVz13P3FK9UDBWQ@mail.gmail.com>
 <CAH1kD+b3ij5KiZn+-N0O+BnbB-XONmbWtYSRA2feKNb+zw6kjw@mail.gmail.com>
 <521FD3E2-3AFE-4E56-A6CF-B0ABA7E9C8E3@fb.com>
 <e42cef9e-1760-d3ee-4396-61cd1d141983@linux.ibm.com>
 <d3eac624-f1a2-fd2d-6639-3290c8085abd@gmail.com>
 <bea70fb0-780c-39a7-a677-dfc41e864337@linux.intel.com>
In-Reply-To: <bea70fb0-780c-39a7-a677-dfc41e864337@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:523e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5cb0e8c6-2689-434c-3ebe-08d7e0a77424
x-ms-traffictypediagnostic: MW3PR15MB3819:
x-microsoft-antispam-prvs: <MW3PR15MB3819FF013F478ADC6176EC48DDDA0@MW3PR15MB3819.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0373D94D15
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR15MB3947.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(136003)(346002)(39860400002)(366004)(376002)(396003)(2616005)(3480700007)(81156014)(478600001)(186003)(71200400001)(8936002)(66446008)(64756008)(66556008)(8676002)(86362001)(66946007)(76116006)(66476007)(966005)(36756003)(53546011)(6506007)(6512007)(6486002)(2906002)(5660300002)(110136005)(33656002)(316002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZwNWUVMWGqbS2gFjvhsDxDh5SZR2tYlVkk9kNxpbWkZDlQhg4VIxMcanZa/icxYmywxfis2MwBRdLHO9CR3kMYLWUDomVt/ZoW6Hrz84i1PATPJ5/Uu9R2MpLCWvRvtRrQxDSeUo5ulfRMY0eLUojkltYH/AQmWGwIrlJ72UdLCEQgXsSp/1ZeGCbpVL4pzixyhDS7JcOgzBXeTtcRGbzXBKapOal6sSiRTwsMKwxC95EXAM5vO8jD5MZthFgAU2a0o2gOgd+C1DDoHgGkRbaMzxbSX4egE3MhR4kREqczQbfw02uTmqllFNW6pGsr+j9AO8APMulnGC6dX8d/bgXSH+01pUVKk4HH+f9zcBTQBeum75oq/qIoIuvghjdJ59Imc30g7fJJVmhv0Mj/YJ0Xrh7uRqF+18aY5duR2xIHYjvQFaBLvLeSQfjrmFFXcl/Zs+Ga7pbu5UkHlGsX1RRTHBpPR2E43ALunSmbmYDeDah1EejctegEHb/zDCk2l4dfoFQx3CqzvymTBKvQ/AAA==
x-ms-exchange-antispam-messagedata: Ct0xhf+v3FiKcId+h+hfkOVGL9DYQ1BAk70HRVayFhXBajqvpwsV2jXpin/wDrzQQM5wX6YVYYskARURYvQaNVvUoqUfUCzmA3/gLNo6VrHH9suU7VdnBUr5S8QWpgZXcuorGigGG4DFpTyRRjZ5ITZZ2oH7vVhbnTrgdKUkzwBo5da7lJLpt6hm7s69+9GM
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D31306D838401498E63C453736450EE@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cb0e8c6-2689-434c-3ebe-08d7e0a77424
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2020 19:10:10.7722 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r3loYYYk9zgtXZlLXf7xuMHpj5/HmbN/ThdRVIRwG1DMZTh1NnV+5/jWRpf1aZypo3q/I5Pbt08I09eKOI5LFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3819
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_09:2020-04-14,
 2020-04-14 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 spamscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011 mlxscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004140135
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

DQoNCu+7v09uIDQvMTAvMjAsIDExOjAyIEFNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgSmFtZXMg
RmVpc3QiIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFicy5v
cmcgb24gYmVoYWxmIG9mIGphbWVzLmZlaXN0QGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQoNCiAg
ICBPbiA0LzEwLzIwMjAgNzozMCBBTSwga3J0YXlsb3Igd3JvdGU6DQogICAgPiBPbiA0LzEwLzIw
IDk6MjMgQU0sIEpvc2VwaCBSZXlub2xkcyB3cm90ZToNCiAgICA+PiBPbiA0LzkvMjAgNToxOSBQ
TSwgVmlqYXkgS2hlbWthIHdyb3RlOg0KICAgIA0KICAgIEknZCByZWFsbHkgbGlrZSB0byBzZWUg
Y2xhbmctdGlkeSBvciBvdGhlciBjaGVja3MgZm9yIHN0eWxlIGFkZGVkIGludG8gDQogICAgdGhl
IGJ1aWxkIENJLiBUaGUgbnVtYmVyIG9mIHN0eWxlIHZpb2xhdGlvbnMgd2FzdGUgbG90cyBvZiB0
aW1lIGluIA0KICAgIGNvZGUtcmV2aWV3IGZvciBib3RoIHRoZSBzdWJtaXR0ZXIgYW5kIHJldmll
d2Vycy4NCg0KWWVzIEkgYWdyZWUsIHdlIG1heSBhbHNvIG5lZWQgdG8gYWRkIHNvbWUgYmFzaWMg
YXV0b21hdGlvbiB0ZXN0aW5nIGluIENJLg0KICAgIA0KICAgID4+Pg0KICAgID4+PiBJIGNhbiBz
ZWUgZm9sbG93aW5nIHNtYWxsIHRhc2tzIHdoaWNoIG5lZWQgcmVmYWN0b3JpbmcNCiAgICA+Pj4N
CiAgICA+Pj4gSVBNSUQ6DQogICAgPj4+DQogICAgPj4+IFNvbWUgb2Ygc3RhbmRhcmQgY29tbWFu
ZHMgYXJlIGluY29tcGxldGUgaGVyZSBsaWtlIOKAnHJlc3RvcmUgcG93ZXIgDQogICAgPj4+IHBv
bGljaWVz4oCdLCBzb21lIG9mIHNlbnNvcnMgIHNkcnMgZXRjLg0KICAgID4+Pg0KICAgID4+PiBE
YnVzIGludGVyZmFjZToNCiAgICA+Pj4NCiAgICA+Pj4gRGVmaW5lIG1vcmUgZGJ1cyBpbnRlcmZh
Y2VzIGJlaW5nIHVzZWQgaW4gY29tbW9uIGNvZGUuIEkgc2VlIG11bHRpcGxlIA0KICAgID4+PiBy
ZXBvcyBoYXMgdGhlc2UgaW50ZXJmYWNlcyBoYXJkIGNvZGVkLiBBbmQgSSBhZ3JlZSBmb3IgY2xp
ZW50IHNpZGUgDQogICAgPj4+IGNvZGUgd291bGQgcmVhbGx5IGJlIGhlbHBmdWwuDQogICAgPj4+
DQogICAgPj4+IFBob3NwaG9yIHBhY2thZ2UgY2xlYW4gdXA6DQogICAgPj4+DQogICAgPj4+IFRo
ZXJlIGFyZSBtYW55IHBob3NwaG9yIHBhY2thZ2VzIGluIGltYWdlIHdoaWNoIGFyZSBhZGRlZCBi
eSBkZWZhdWx0IA0KICAgID4+PiBhbmQgbG90cyBvZiBzeXN0ZW1kIHVuaXQgYXJlIHJ1bm5pbmcg
aXJyZXNwZWN0aXZlIG9mIHBsYXRmb3JtIA0KICAgID4+PiByZXF1aXJlbWVudHMuDQogICAgPj4+
DQogICAgPj4+IERvY3VtZW50YXRpb246DQogICAgPj4+DQogICAgPj4+IE1hbnkgcmVwb3MgZG9l
c27igJl0IGhhdmUgcHJvcGVyIGRvY3VtZW50YXRpb25zIGFuZCBpdCB3aWxsIGJlIHJlYWxseSAN
CiAgICA+Pj4gZ29vZCB0byBhZGQgYW5kIGEgcm9vdCBsZXZlbCBkb2N1bWVudHMgZ2l2aW5nIGFu
IGlkZWEgYWJvdXQgZGlmZmVyZW50IA0KICAgID4+PiBmZWF0dXJlcyBhbmQgbWFwcGVkIHRvIG11
bHRpcGxlIGF2YWlsYWJsZSByZXBvcy4NCiAgICA+Pj4NCiAgICA+Pg0KICAgID4+IENhbiB3ZSBm
bGVzaCBvdXQgdGhlIGxpc3Qgb2YgZmVhdHVyZXM/DQogICAgPj4gaHR0cHM6Ly9naXRodWIuY29t
L29wZW5ibWMvZG9jcy9ibG9iL21hc3Rlci9mZWF0dXJlcy5tZA0KICAgID4gDQogICAgPiBIZWNr
LCBjYW4gd2Ugc3RhcnQgYnkgc2ltcGx5IGZsZXNoaW5nIG91dCB3aGF0IGRldnMgKGNvbXBhbmll
cykgYXJlL2hhdmUgDQogICAgPiB3b3JrZWQgb24gZm9yIHRoaXMgcmVsZWFzZT8gIDstKQ0KICAg
ID4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3BlbmJtYy93aWtpL0N1cnJlbnQtUmVsZWFz
ZS1Db250ZW50DQogICAgPiANCiAgICA+IC0ga3J0YXlsb3INCiAgICA+IA0KICAgID4+DQogICAg
Pj4gVGhlIG9wZW5ibWMvZG9jcyByZXBvIGhhcyBnb29kIHN0dWZmIGZvciBkZXZlbG9wZXJzLiAg
Q2FuIHdlIHRha2UgaXQgDQogICAgPj4gdGhlIG5leHQgbGV2ZWwgYnkgYWRkaW5nOg0KICAgID4+
IC0gR3VpZGUgZm9yIHN5c3RlbSBpbnRlZ3JhdG9ycyAtIHNvdXJjZSBhbmQgYnVpbGQgY29uZmln
LCBzaWduaW5nIA0KICAgID4+IGtleXMsIGV0Yy4NCiAgICA+PiAtIEd1aWRlIGZvciBpbml0aWFs
IEJNQyBzZXR1cCAtIGdlbmVzaXMgYm9vdCwgZGlzY292ZXJ5LCBjb25maWd1cmUgSVAsIA0KICAg
ID4+IGNlcnRzLCB1c2VycywgZXRjLg0KICAgID4+IC0gR3VpZGUgZm9yIHN5c3RlbSBhZG1pbnMg
LSBvbmdvaW5nIHRhc2tzIGxpa2UgYXVkaXRpbmcgbG9ncywgZmlybXdhcmUgDQogICAgPj4gdXBk
YXRlcywgZXRjLg0KICAgID4+IC0gU2VjdXJpdHkgdGVjaG5pY2FsIGltcGxlbWVudGF0aW9uIGd1
aWRlIChTVElHKS4NCiAgICA+Pg0KICAgID4+IFdlJ3ZlIGRpc2N1c3NlZCB0aGVzZSBpbiB0aGUg
T3BlbkJNQyBzZWN1cml0eSB3b3JraW5nIGdyb3VwLCBhbmQgSSd2ZSANCiAgICA+PiBjb2xsZWN0
ZWQgc29tZSBkZXRhaWxzIGhlcmU6DQogICAgPj4gaHR0cHM6Ly9naXRodWIuY29tL2libS1vcGVu
Ym1jL2Rldi9pc3N1ZXMvMTUzMQ0KICAgID4+DQogICAgPj4gSSB3b3VsZCBiZSBoYXBweSB0byBj
b250cmlidXRlIHRvIHRoZXNlIC4uLiBqdXN0IGxvb2tpbmcgZm9yIHNvbWVvbmUgDQogICAgPj4g
dG8gY29sbGFib3JhdGUgd2l0aC4gIDotKQ0KICAgID4+DQogICAgPj4+IEkgd2lsbCBhZGQgbW9y
ZSBvbmNlIEkgcmVtZW1iZXIgYmFjay4NCiAgICA+Pj4NCiAgICA+Pj4gUmVnYXJkcw0KICAgID4+
Pg0KICAgID4+PiAtVmlqYXkNCiAgICA+Pj4NCiAgICA+Pj4gKkZyb206ICpvcGVuYm1jIDxvcGVu
Ym1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFicy5vcmc+IA0KICAgID4+
PiBvbiBiZWhhbGYgb2YgUmljaGFyZCBIYW5sZXkgPHJoYW5sZXlAZ29vZ2xlLmNvbT4NCiAgICA+
Pj4gKkRhdGU6ICpUaHVyc2RheSwgQXByaWwgOSwgMjAyMCBhdCAyOjU3IFBNDQogICAgPj4+ICpU
bzogKk9wZW5CTUMgTWFpbGxpc3QgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NCiAgICA+Pj4g
KlN1YmplY3Q6ICpSZTogQ2FsbCBmb3IgR2FyZGVuaW5nIFRhc2tzDQogICAgPj4+DQogICAgPj4+
IEhlcmUgYXJlIHNvbWUgaWRlYXMgSSBoYXZlIGFzIGEgd2lzaGxpc3QgZm9yIGdhcmRlbmluZy9p
bXByb3ZlbWVudHMuDQogICAgPj4+DQogICAgPj4+ICpDbGllbnQgTW9kZWxzIGZvciBEQnVzKg0K
ICAgID4+Pg0KICAgID4+PiBSaWdodCBub3cgc2RidXNwbHVzIGRvZXMgYSBwcmV0dHkgZ29vZCBq
b2Igb2YgbWFraW5nIHNlcnZlciANCiAgICA+Pj4gZGV2ZWxvcG1lbnQgZWFzeS4gIEhvd2V2ZXIs
IEkgd2lzaCB3ZSBoYWQgc29tZSBtb3JlIHRvb2xpbmcgb24gdGhlIA0KICAgID4+PiBjbGllbnQg
c2lkZS4gSSBzZWUgYSBkZWNlbnQgYW1vdW50IG9mIHJlcGVhdGVkIGNvZGUgYXJvdW5kIE9iamVj
dE1hcHBlci4NCiAgICA+Pj4NCiAgICA+Pj4gT25lIHdheSB0byBzZXBhcmF0ZSBjb25jZXJucyBh
bmQgY3V0IGRvd24gb24gYm9pbGVycGxhdGUgaXMgdG8gaGF2ZSBhIA0KICAgID4+PiBtb2RlbCBs
aWJyYXJ5LiBBIGNhbGwgdG8gYSBtb2RlbCB3b3VsZCBzcGluIG9mZiBhbiBhc3luYyBtZXRob2Qg
Y2FsbCANCiAgICA+Pj4gdG8gbWFuYWdlIHRoZSBkYXRhIG1hcnNoYWxsaW5nLCB3aGljaCB3b3Vs
ZCB0aGVuIGNhbGwgYSBsYW1iZGEgd2l0aCBhIA0KICAgID4+PiBmdWxseSByZWlmaWVkIG9iamVj
dC4gIFRoaXMgaXMgc2ltaWxhciBpbiBjb25jZXB0IHRvIHRoZSB3YXkgbW9kZWxzIA0KICAgID4+
PiB3b3JrIGluIHdlYiBkZXZlbG9wbWVudC4NCiAgICA+Pj4NCiAgICA+Pj4gKlVuaXQgVGVzdGlu
ZyBpbiBibWN3ZWIqDQogICAgPj4+DQogICAgPj4+IFRoaXMgaXMgcHJldHR5IGVhc3kgdG8gc2F5
LCBhbmQgaGFyZGVyIHRvIGRvLiBJJ3ZlIGJlZW4gdGhpbmtpbmcgYSANCiAgICA+Pj4gYml0IGFi
b3V0IGhvdyB0byBhZGQgaW4gdW5pdCB0ZXN0cyB3aXRob3V0IHRoZW0gYmVpbmcgdG9vIGZyYWdp
bGUuIA0KICAgID4+PiAoVGhpcyB3YXMgYWxzbyBzb21ldGhpbmcgdGhhdCBnZWlzc29uYXRvciBt
ZW50aW9uZWQpLg0KICAgID4+Pg0KICAgID4+PiAqREJ1cyBWaXJ0dWFsaXphdGlvbiBhbmQgUGxh
eWJhY2sqDQogICAgPj4+DQogICAgPj4+IE9uZSB0aGluZyB0aGF0IEkgdGhpbmsgbWFrZXMgdW5p
dCB0ZXN0aW5nIGluIHNvbWUgbW9kdWxlcyBoYXJkIGlzIA0KICAgID4+PiB0aGF0IHRoZXJlIGlz
IGEgaGlnaCBiYXJyaWVyIGFyb3VuZCBtb2NraW5nIERCdXMuICBJJ20gbm90IHN1cmUgdGhlIA0K
ICAgID4+PiBiZXN0IHdheSB0byBidWlsZCB0aGlzIHN1c3RhaW5hYmx5LCBidXQgaXQgd291bGQg
aGVscCBpbXByb3ZlIG91ciBDSSANCiAgICA+Pj4gdGVzdGluZy4NCiAgICA+Pj4NCiAgICA+Pj4g
Kk9wZW5BUEkgZm9yIFJlZGZpc2gqDQogICAgPj4+DQogICAgPj4+IFNvIGZhciB0aGUgZ2VuZXJh
bCBpbXByZXNzaW9uIEkndmUgc2VlbiB3aXRoIHRoaXMgaXMgdGhhdCB0aGUgU3dhZ2dlciANCiAg
ICA+Pj4gb3V0cHV0IGZvciBPcGVuQVBJIGlzbid0IHJlYWxseSBnb29kIGZvciBDKysuICBFaXRo
ZXIgdGhlIGVyZ29ub21pY3MgDQogICAgPj4+IGFyZW4ndCByZWFsbHkgZ29vZCwgb3IgdGhlcmUg
aXMgYSBsb3Qgb2YgY29kZSBibG9hdC4gIEknZCBsb3ZlIHRvIA0KICAgID4+PiBoYXZlIHNvbWUg
T3BlbkFQSSBiaW5kaW5ncyB0aGF0IHdvcmsgd2VsbCBpbiBPcGVuQk1DLg0KICAgID4+Pg0KICAg
ID4+PiAqUlVTVCE/IT8qDQogICAgPj4+DQogICAgPj4+IEknbSBiZXR0aW5nIGEgbG90IG9mIHBl
b3BsZSBoYXZlIHRob3VnaHQgYWJvdXQgUnVzdC4gSSdkIGxvdmUgdG8gaGVhciANCiAgICA+Pj4g
d2hhdCBwZW9wbGUgaGF2ZSB0cmllZCBhbmQgd2hhdCBhcmUgdGhlIHN0aWNraW5nIHBvaW50cy4g
IEFueSANCiAgICA+Pj4gdGhvdWdodHMgb24gd2hhdCBtb2R1bGUvZnVuY3Rpb25hbGl0eSBjb3Vs
ZCBiZSBhIGRlY2VudCBjYW5kaWRhdGUgZm9yIA0KICAgID4+PiBicmVha2luZyBncm91bmQgaGVy
ZT8NCiAgICA+Pj4NCiAgICA+Pg0KICAgID4+IFdlIGRpc2N1c3NlZCB0aGUgcnVzdCBsYW5ndWFn
ZSBpbiB0aGUgT3BlbkJNQyBzZWN1cml0eSB3b3JraW5nIGdyb3VwIA0KICAgID4+IG1lZXRpbmdz
IDIwMTktMTAtMDINCiAgICA+PiBPcGVuQk1DIHNlY3VyaXR5IHdvcmtpbmcgZ3JvdXAgbWludXRl
czoNCiAgICA+PiBodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0
cHMtM0FfX2RvY3MuZ29vZ2xlLmNvbV9kb2N1bWVudF9kXzFiN3g5QmF4c2ZjdWtRRHFidlpzVTJl
aE1xNHhvSlJRdkx4eHNEVVdtQU9JJmQ9RHdJRGFRJmM9NVZEMFJUdE5sVGgzeWNkNDFiM01VdyZy
PXY5TVUwS2k5cFduVFhDV3dqSFBWZ3BuQ1I4MHZYa2tjcklhcVU3VVNsNWcmbT1NcXplSGJBZERD
RFFQUHF4dEwyc2JNOWdCbEtYb0dkaXo1aGowNmcxV2U4JnM9Z1dzaXVBQ1I4RlNpUF9GbW9hMXlP
MWgzSW9ESDQyVmtVRTZwVU9acVJUQSZlPSAgDQogICAgPj4NCiAgICA+Pg0KICAgID4+PiAtUmlj
aGFyZA0KICAgID4+Pg0KICAgID4+PiBPbiBUaHUsIEFwciA5LCAyMDIwIGF0IDI6NTQgUE0gUmlj
aGFyZCBIYW5sZXkgPHJoYW5sZXlAZ29vZ2xlLmNvbSANCiAgICA+Pj4gPG1haWx0bzpyaGFubGV5
QGdvb2dsZS5jb20+PiB3cm90ZToNCiAgICA+Pj4NCiAgICA+Pj4gICAgIEhpIGV2ZXJ5b25lLA0K
ICAgID4+Pg0KICAgID4+PiAgICAgTGFzdCB3ZWVrIEkgc3RhcnRlZCBhIHRocmVhZCBvbiBPcGVu
IEJNQyBHYXJkZW5pbmcNCiAgICA+Pj4gPGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNv
bS92Mi91cmw/dT1odHRwcy0zQV9fbGlzdHMub3psYWJzLm9yZ19waXBlcm1haWxfb3BlbmJtY18y
MDIwLTJEQXByaWxfMDIxMTAwLmh0bWwmZD1Ed01GYVEmYz01VkQwUlR0TmxUaDN5Y2Q0MWIzTVV3
JnI9djlNVTBLaTlwV25UWENXd2pIUFZncG5DUjgwdlhra2NySWFxVTdVU2w1ZyZtPWZBWlp0bVds
NGc4Vm5nazU2X1JzMDloZ1M5NlRZUU1leVJzeVpLR0h6QW8mcz1IWGRIbDU2anE0cDVlWGJoeVVI
VWtrbW9GX2hHaDV0SldNVWFWS1E2OFZNJmU9PiwgDQogICAgPj4+DQogICAgPj4+ICAgICBhbmQg
SSB3YW50ZWQgdG8ga2ljayBvZmYgdGhlIHByb2Nlc3MuDQogICAgPj4+DQogICAgPj4+ICAgICBU
aGUgYmFzaWMgaWRlYSBoZXJlIGlzIHRvIGdldCBhIHN1cnZleSBvZiB2YXJpb3VzDQogICAgPj4+
ICAgICBpbXByb3ZlbWVudCB0YXNrcyB0aHJvdWdob3V0IE9wZW5CTUMuICBTb21lIHRoaW5ncyBt
aWdodCBiZSBzbWFsbA0KICAgID4+PiAgICAgcmVmYWN0b3Jpbmcgb3IgY2hhbmdlcyB0aGF0IGNh
biBiZSBkb25lIGluY3JlbWVudGFsbHkgKGkuZS4NCiAgICA+Pj4gICAgIHdlZWRpbmcgdGhlIGdh
cmRlbikuIE90aGVyIHRhc2tzIG1pZ2h0IGJlIG1vcmUgcmVzZWFyY2ggb3INCiAgICA+Pj4gICAg
IHN0cnVjdHVyYWwgKGkuZS4gZXhjYXZhdGluZyB0aGUgZ2FyZGVuKS4NCiAgICA+Pj4NCiAgICA+
Pj4gICAgIEp1c3QgZ2V0dGluZyB0aGVzZSBpbiB3cml0aW5nIGNhbiBiZSBoZWxwZnVsIGZvciBv
dGhlcnMgdG8gZ2F1Z2UNCiAgICA+Pj4gICAgIHdoYXQgdGhleSBzaG91bGQgZm9jdXMgb24uIEl0
IGFsc28gaGVscHMgbGVhdmUgYnJlYWRjcnVtYnMgZm9yIGFueQ0KICAgID4+PiAgICAgbmV3IGRl
dmVsb3BlciBpbnRlcmVzdGVkIGluIHRoZSBzdWJqZWN0Lg0KICAgID4+Pg0KICAgID4+DQogICAg
Pj4gUmljaGFyZCwNCiAgICA+Pg0KICAgID4+IFRoYW5rcyBmb3IgeW91ciBlZmZvcnRzIHRvIG1v
dmUgdGhpcyBmb3J3YXJkLg0KICAgID4+DQogICAgPj4gU2VjdXJpdHkgd2lzaCBsaXN0IGhlcmU6
IA0KICAgID4+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL29wZW5ibWMvd2lraS9TZWN1cml0
eS13b3JraW5nLWdyb3VwI3NlY3VyaXR5LWZlYXR1cmUtd2lzaC1saXN0IA0KICAgID4+DQogICAg
Pj4NCiAgICA+PiAtIEpvc2VwaA0KICAgID4+DQogICAgPj4+ICAgICBTbyBoZXJlJ3MgaG93IEkg
c2VlIHRoaXMgd29ya2luZy4gQW55b25lIHdobyBoYXMgc29tZSBpZGVhcyBjYW4NCiAgICA+Pj4g
ICAgIHJlcGx5IHRvIHRoaXMgdGhyZWFkIHdpdGggYSBzaG9ydCB0byBtZWRpdW0gZGVzY3JpcHRp
b24uICBUcnkgdG8NCiAgICA+Pj4gICAgIGF2b2lkIG5ldyBmZWF0dXJlcywgYW5kIGluc3RlYWQg
bG9vayBhdCB3YXlzIHdlIGNvdWxkIGltcHJvdmUgdGhlDQogICAgPj4+ICAgICBzdGF0dXMgcXVv
LiBUaGluayBhYm91dCBjaGFuZ2VzIGFuZCB0b29scyB0aGF0IHdvdWxkIG1ha2UgeW91ciBkYXkN
CiAgICA+Pj4gICAgIHRvIGRheSBsaWZlIGJldHRlci4NCiAgICA+Pj4NCiAgICA+Pj4gICAgIEZy
b20gdGhlcmUgd2UgY2FuIGRvIGEgd3JpdGUgdXAgYWJvdXQgd2hhdCB3ZSBrbm93IGFib3V0IHRo
ZQ0KICAgID4+PiAgICAgaXNzdWUuICBUaGlzIGNhbiBmdW5jdGlvbiBhcyBhbiBlYXJseSBzdGFn
ZSBkZXNpZ24gZG9jIHRoYXQgZ2l2ZXMNCiAgICA+Pj4gICAgIGEgYnJvYWQgb3ZlcnZpZXcgb24g
d2hlcmUgdGhlIGRldidzIGhlYWQgaXMgYXQgcmlnaHQgbm93Lg0KICAgID4+Pg0KICAgID4+PiAg
ICAgRmluYWxseSwgd2UgY2FuIGRvIGEgcXVhcnRlcmx5IHJldmlldyB0byBrZWVwIHRoZSBnYXJk
ZW4NCiAgICA+Pj4gICAgIHJlZnJlc2hlZC4gT2J2aW91c2x5LCB0aGluZ3MgY2FuIGNoYW5nZSBi
ZXR3ZWVuIHRoYXQgdGltZSwgYnV0DQogICAgPj4+ICAgICBoYXZpbmcgYSBzZW1pLXJlZ3VsYXIg
Y2FkZW5jZSB3aWxsIGhvcGVmdWxseSBnaXZlIHVzIGEgYmV0dGVyDQogICAgPj4+ICAgICBjaGFu
Y2Ugb2Yga2VlcGluZyB0aGlzIHVwIHRvIGRhdGUuDQogICAgPj4+DQogICAgPj4+ICAgICAtIFJp
Y2hhcmQNCiAgICA+Pj4NCiAgICA+Pg0KICAgID4gDQogICAgDQoNCg==
