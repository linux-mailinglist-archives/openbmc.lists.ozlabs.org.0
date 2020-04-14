Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 170751A8C9F
	for <lists+openbmc@lfdr.de>; Tue, 14 Apr 2020 22:39:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491y572Fq7zDqwT
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 06:39:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=137338503b=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=S8jsgl8f; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=X0++HgKF; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491y4K1dy8zDqvh
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 06:38:22 +1000 (AEST)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03EJ5SSR028714; Tue, 14 Apr 2020 12:07:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=0ap7rwyzFqnKFr9vfzvSca+XBtGQ3DS91iKOk8/gUDU=;
 b=S8jsgl8fWa+8lG1LBZclD1UEuZC3MbqTMUeq69gTxvWnL+1T54XDHUJ6EZpi/jNw6TDe
 aLLUtSTZoJGxB3ght2lFVuiB/MFdNThx5CyPxxSpepS9bySbcr1ZdFhzyou5Ai+B8Wne
 U15yLKEjOMZ38bJOo5WrsoLqClB+eVMLqzs= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 30bwq7c0d3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 14 Apr 2020 12:07:39 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Tue, 14 Apr 2020 12:07:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oNUpL+zMOm0daKv/VgL9YgVs+qV4ndWE/S9oLyLiTKsrYTmDDcSCBzPg/So1oR7i2lmJWKfIzrSBSFYzTkwRhnncx65bbclScgOVg2LrvhkzpGEbaRSCRDxd/HwJ7IAapXIcWKYUNq6ELCac0BcE0iUJ+aQ0sB0dtWz5z74T/XhrPjQtzhHNCDMV+UCLK/CFZScoSvju209cvPJ2K8kkY3xB/rxXnEzmc75+FzqWWlgomyAWYZVzisut7pRPculabhrBJVGJMjyT8HT30q7RN5afMyA2uLjiAP8d8rfbnFl3v+cgNPTcZXtBZf0u+L7pELiAgflCBDEELVFLZT1kTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ap7rwyzFqnKFr9vfzvSca+XBtGQ3DS91iKOk8/gUDU=;
 b=QzfBeNHqZTsnnMhEufIcVuspCW85QY0cWFDwGGuvvpjiS+pbgQbQMwxql0z6PdLCW7s2ULZTpncz/2KkH2SXNgI8I3QWKgyCeAnPEHgORI8qPZjM1pOAt1wxrH/6NKIr998JWlcGb9pA0gYLekYoTX+gc0DnBMW0m+NcalBxyAKkrbEixIy1NckpdQ3E+mzood0qxRwouyil4qmbt6TAwYTcU+EsqNpcAY/u1ZLlFGCGCDYoVx2VWD7tDvUzNdD6PNwI1uE0Zdg+dmewB2DzhWk4IonLqfrRDvYuR5AMlDSQhewerxI5onQRJGzhRAx47gyAqySk9SU5XlnzG5qLaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ap7rwyzFqnKFr9vfzvSca+XBtGQ3DS91iKOk8/gUDU=;
 b=X0++HgKFs8QosATMfURqyHpmTM6E8Nwq4VM0aTuOadXN2+IRb5tdETV5CaW/CoAaxFVURZZbuKsjCl/Rvn58Zqw6UixKTk8+GqbztM9hbSJTthrwMO5JnzXEdzP4cykdYo0H5mz0E52/gaZVEBsFkyN62EVYnablVsQqLXFy6ZA=
Received: from MW3PR15MB3947.namprd15.prod.outlook.com (2603:10b6:303:49::9)
 by MW3PR15MB3819.namprd15.prod.outlook.com (2603:10b6:303:43::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.28; Tue, 14 Apr
 2020 19:07:37 +0000
Received: from MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::950:594c:b2fc:be8]) by MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::950:594c:b2fc:be8%4]) with mapi id 15.20.2900.028; Tue, 14 Apr 2020
 19:07:37 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: objc console new design
Thread-Topic: objc console new design
Thread-Index: AQHWCgBPwdBJh2WrEU2ViFQA6gD9zqhqcoWAgAGa3ACABcTCAIAGxG4A
Date: Tue, 14 Apr 2020 19:07:37 +0000
Message-ID: <BBD9DDB3-49C9-4F85-9647-530AD7F3DC99@fb.com>
References: <73161AF5-F6B6-40C6-AE70-5FCF5A530B82@fb.com>
 <451f5f0e-a1ba-4016-b044-e55b966f64ea@www.fastmail.com>
 <B81F049C-24DB-49A0-9DE5-5D7C02496AD0@fb.com>
 <625f79f9-0490-4dbe-b364-959e2091fdc8@www.fastmail.com>
In-Reply-To: <625f79f9-0490-4dbe-b364-959e2091fdc8@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:523e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a2c77e81-1511-486f-5e1f-08d7e0a718c8
x-ms-traffictypediagnostic: MW3PR15MB3819:
x-microsoft-antispam-prvs: <MW3PR15MB38199B1C773AE94B0C2F8C37DDDA0@MW3PR15MB3819.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0373D94D15
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR15MB3947.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(136003)(346002)(39860400002)(366004)(376002)(396003)(2616005)(3480700007)(81156014)(478600001)(186003)(71200400001)(8936002)(66446008)(64756008)(66556008)(8676002)(86362001)(66946007)(76116006)(66476007)(36756003)(53546011)(6506007)(6512007)(6486002)(2906002)(5660300002)(6916009)(4326008)(33656002)(316002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1x6BWdMUesQXkEpO2cM7aoDvZvQsNB3YIzVAzFFGbEuIE4+FrWxjOnUeRuFFKAqsv+9ZtdVYGQKTsndVHqleHTnZI5WJuyDde4bi3yOqE+athObUXiGUXgzn5kXbXtkj2LL5Ypa5wzLcFAj9DiK9RkwwykF+4p/ZuIYUUYAglc1bJS/uVs7OrLoYj6I4ZN1502JhL2oWWAqn1mHFO0Gt+gEsCDGbnh4uIapFacMx2G0K94/WjOVjjY/buYkPJLhuaty77TwB+0N4mz54E99fhge0sFOGjNeP7znXODAIItILfX/jxMwjDW2t1CvRhky/UguR5dpa8WDA/c57bTK8yWBPqicXRCcBcjjh3nbjwnr4ZvNJhd4SrHzwHM+xkhEWrdqjUgJY+vvKi1P8Qsrhx5eBj9KClkZalGt+oi39mTlYsDbODI6Qj5On6Tg/+N8D
x-ms-exchange-antispam-messagedata: QR+IDUWoqWqZcytDLjOKxwjSFQNVaohOMCyD0v4whjI3cnkRgObX1umTKgmXwOtpxWz43NZgheW159kJGUiqVf6m6/n7i8upRrwLIbZopNnQXIk+N+P+mVIKK1BGEJRS54MhziD7oI95B6NHElBogQ8+cR/DO5cqoI48AbK27dizHQVmuWzTj8vGKTbgQE8b
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <F63DB2A24AD7BD46A02188A705A42D07@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a2c77e81-1511-486f-5e1f-08d7e0a718c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2020 19:07:37.4456 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J+kyvXP/siEsthPZ3fah7Q/Vvb9UAXVfwkzInoYsdZWidNEAFoTuaa9i5OH4RX17SAGfKE4rdodtGCAkplNE4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3819
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_09:2020-04-14,
 2020-04-14 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 suspectscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=986 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDQvOS8yMCwgOTo0NyBQTSwgIkFuZHJldyBKZWZmZXJ5IiA8YW5kcmV3QGFqLmlk
LmF1PiB3cm90ZToNCg0KICAgIA0KICAgIA0KICAgIE9uIFR1ZSwgNyBBcHIgMjAyMCwgYXQgMDU6
MTEsIFZpamF5IEtoZW1rYSB3cm90ZToNCiAgICA+IA0KICAgID4gDQogICAgPiBPbiA0LzUvMjAs
IDU6MTAgQU0sICJBbmRyZXcgSmVmZmVyeSIgPGFuZHJld0Bhai5pZC5hdT4gd3JvdGU6DQogICAg
PiANCiAgICA+ICAgICANCiAgICA+ICAgICANCiAgICA+ICAgICBPbiBTYXQsIDQgQXByIDIwMjAs
IGF0IDA4OjA5LCBWaWpheSBLaGVta2Egd3JvdGU6DQogICAgPiAgICAgPiAgDQogICAgPiAgICAg
PiBIaSBBbmRyZXcsDQogICAgPiAgICAgPiANCiAgICA+ICAgICA+IEhvdyBpcyBzZXJ2ZXIgbGF1
bmNoZWQgYXMgcGVyIG5ldyBkZXNpZ24gY29kZS4gV2l0aCBsYXRlc3QgdXBkYXRlLCANCiAgICA+
ICAgICA+IGNvbnNvbGUgc2VydmVyIGlzIG5vdCBsYXVuY2hpbmcgaW4gb3VyIHBsYXRmb3JtLiBJ
IHNhdyBjb25maWcgb3B0aW9uIA0KICAgID4gICAgID4g4oCcT0JNQ19DT05TT0xFX0hPU1RfVFRZ
ID89ICJ0dHlWVUFSVDAiIOKAnCBoYXMgYmVlbiByZW1vdmVkIGZyb20gYmIgZmlsZSANCiAgICA+
ICAgICA+IGFuZCBhbHNvIHRoZXJlIGlzIG5vIHRyaWdnZXJpbmcgcG9pbnQgaW4gb2JtYy1jb25z
b2xlLXNzaCBzb2NrZXQgYW5kIA0KICAgID4gICAgID4gc2VydmljZSBsaWtlIGVhcmxpZXIgV2Fu
dHM9b2JtYy1jb25zb2xlQHtPQk1DX0NPTlNPTEVfSE9TVF9UVFl9LnNlcnZpY2UgDQogICAgPiAg
ICAgPiA8bWFpbHRvOldhbnRzPW9ibWMtY29uc29sZUAlN2JPQk1DX0NPTlNPTEVfSE9TVF9UVFkl
N2Quc2VydmljZT4uDQogICAgPiAgICAgPiANCiAgICA+ICAgICA+IA0KICAgID4gICAgID4gSSBz
ZWUgdWRldiBydWxlcyBhZGRlZCBpbiBsYXRlc3QgcGF0Y2ggZm9yIGxhdW5jaGluZyBzZXJ2ZXIg
d2hpY2ggbmVlZHMgDQogICAgPiAgICAgPiBjb25maWcgZGVmaW5pdGlvbiBvZiB1ZGV2LCBkbyB3
ZSBuZWVkIHRoaXMgZm9yIGxhdW5jaGluZywgcGxlYXNlIGFkdmlzZS4NCiAgICA+ICAgICANCiAg
ICA+ICAgICBZZXMsIG9ibWMtY29uc29sZSBub3cgc2hpcHMgYSB1ZGV2IHJ1bGVzIGZpbGUgdGhh
dCBsYXVuY2hlcyANCiAgICA+IG9ibWMtY29uc29sZS1zZXJ2ZXINCiAgICA+ICAgICB2aWEgYW4g
YEVOVntTWVNURU1EX1dBTlRTfWAgZGlyZWN0aXZlOg0KICAgID4gDQogICAgPiBJZiB0aGlzIGlz
IG1hbmRhdG9yeSB0aGVuIHdoeSBkbyB3ZSBuZWVkIHRvIGVuYWJsZSBVREVWIGNvbmZpZyBhcyBp
dCANCiAgICA+IHNob3VsZCBiZSBlbmFibGVkIGJ5IGRlZmF1bHQuDQogICAgPg0KICAgIA0KICAg
IEl0J3Mgbm90IG1hbmRhdG9yeSwganVzdCBJIGRvbid0IGtub3cgdGhlIHJlcXVpcmVtZW50cyBv
ZiBhbnkgc3lzdGVtcyB0aGF0DQogICAgYXJlbid0IHVzaW5nIHVkZXYuIFRoZSBzd2l0Y2ggZXhp
c3RzIGluIG9ibWMtY29uc29sZSBzbyB5b3UgY2FuIGltcGxlbWVudA0KICAgIHN1cHBvcnQgZm9y
IHN5c3RlbXMgd2l0aG91dCB1ZGV2IGlmIHRoYXQncyBkZXNpcmVkLiBNYXliZSBhZGRpbmcgdGhl
IHN3aXRjaA0KICAgIHdhcyBwcmVtYXR1cmU/DQoNCkFzIHBlciBuZXcgZGVzaWduLCB1ZGV2IHJ1
bGUgaXMgdGhlIG9ubHkgb25lIHdobyBjYW4gc3RhcnQgc2VydmVyIC4gU28gaWYgYW55b25lIHVz
aW5nIA0KU29MIG5lZWRzIHRvIHVzZSB0aGlzIHJ1bGVzIHNvIEkgZ3Vlc3MgdGhpcyB1ZGV2IHN3
aXRjaCBpcyBub3QgcmVxdWlyZWQgYXMgdGhpcyBpcyBhIA0KbWFuZGF0b3J5IG9wdGlvbnMuDQog
ICAgDQogICAgQW5kcmV3DQogICAgDQoNCg==
