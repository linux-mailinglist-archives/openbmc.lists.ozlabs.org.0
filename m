Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB0516AD63
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2020 18:29:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48R8FJ5vFVzDqV9
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2020 04:29:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=93235271e9=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=c0jy0S0k; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=cL2QFNoO; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48R8DG1CQDzDqV3
 for <openbmc@lists.ozlabs.org>; Tue, 25 Feb 2020 04:28:22 +1100 (AEDT)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01OHOtOi019802; Mon, 24 Feb 2020 09:28:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=facebook;
 bh=sbGWYI/RGHaC2WRyMZN9u/urT7/Vg7xoyCQKFJM1cVw=;
 b=c0jy0S0kQWppZKU7yVMAq+GU80KKVZOEHqhI9KfYDJPZqc4xCEwsOrkl9mgbgO0HdHNX
 O5gvdwe5Jod+3J/jW2qn1G4cnObh1qHRP4tGcw4ISg3/Z6MPekFSxyF1wzE8Js8rKpvT
 oP4v4xVwx4EAdIymAyyyyx7axlbk+Xm0LvU= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 2ybnyjnxum-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 24 Feb 2020 09:28:17 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.230) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Mon, 24 Feb 2020 09:28:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g57B93Jc2wz2dNdvuM7b/X6gdhcFYNXegzIIowuv94OWxFnrKdUO04QBM2V6RWBGLeeNBe10ECZWmYc73R7fzJ0b4SKH4FoaBl1OzjwEhD1QQM5sH69NfmidfWZ3i5muY4aONbWaUyVdyKeFiMcft6/KEyTzmu6KiohiTu1DIq6/eNTD6fTOz7b4m63rwi/+Vj3YVbQztodrGnNJHAYeeRebHczx99/CR+Z0gcxRrAhVHSQhQ40IETVSeVhVVDI5kK/AuZjWyVUO2KBHwZ2UW7F7EOT+suw7RPQvI48Mz/KZVuQ/Vw4BAsT401TshXrvcJeintcwsSIAE2kNZ6MRLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbGWYI/RGHaC2WRyMZN9u/urT7/Vg7xoyCQKFJM1cVw=;
 b=kC1d3OrRU4wZW9CPSZ/4AvgpOT7/pVsEuuIlRyxvz/q+9ZVhdhdNtC1PHOeDQs0soCUMrrpNpRlKhX/tdgETd9iAqhdnIXr4kUO8irrk7Nq6zRNFGZnDYlYvlpDyiuZliOiMcm0TpPh8rz4Yl7GclkW4dlzxZonrmpiiw/1pHj/z2LU7gCAuFghrVI1MlC5ReKsY6UGYRPcLB7d3GiYS/jcql3UHwVyS77KEqo14uFnTBnSNBZsZ6Q428tiwSti/YHcaSacBOiuFNYDIB2Hl28aVDes/CBbY4vzZmCrsY1j+Ap8gjbNccJrlPxTWkZbRhH+472Dv+f6Zl1cKzP/5Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbGWYI/RGHaC2WRyMZN9u/urT7/Vg7xoyCQKFJM1cVw=;
 b=cL2QFNoO1+ThQX0EBMzyQgTYAnJiQK34NI/7Y8Q9w6JPSO/4aHzYBLwQ8nT7Sf7IrCwprD4zlk2fNEGZtORqFI1Evqct6647p/xWc2XwUvT4SsHzl85/OxM+THe4d9ahsHIE6J7tQdihY/WRCYbDUgDZ2THAp/3aovRPqpBICAg=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (2603:10b6:300:bd::9)
 by MWHPR15MB1680.namprd15.prod.outlook.com (2603:10b6:300:126::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Mon, 24 Feb
 2020 17:28:14 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::9cc0:e5a7:3178:5bec]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::9cc0:e5a7:3178:5bec%6]) with mapi id 15.20.2750.021; Mon, 24 Feb 2020
 17:28:14 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: =?utf-8?B?6Zmz77yM5p2+5YSJ?= <ckimchan17@gmail.com>, Brad Bishop
 <bradleyb@fuzziesquirrel.com>
Subject: =?utf-8?B?UmU6IOWbnuimhjogUmU6IOWbnuimhu+8mnNrZWxldG9u?=
Thread-Topic: =?utf-8?B?5Zue6KaGOiBSZTog5Zue6KaG77yac2tlbGV0b24=?=
Thread-Index: AQHV6zfL36RJpsRBIUWIj4LHQk6byg==
Date: Mon, 24 Feb 2020 17:28:14 +0000
Message-ID: <2A84CB54-3C83-4DDD-B548-FDC56E565F7F@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:500::5:13e6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e50cc095-c463-4a4e-ad35-08d7b94eedf2
x-ms-traffictypediagnostic: MWHPR15MB1680:
x-microsoft-antispam-prvs: <MWHPR15MB1680F15D6F0673A198CAC1BCDDEC0@MWHPR15MB1680.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 032334F434
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(136003)(366004)(346002)(39860400002)(189003)(199004)(66946007)(2616005)(6506007)(33656002)(110136005)(2906002)(6486002)(76116006)(316002)(66446008)(64756008)(66556008)(66476007)(186003)(71200400001)(9326002)(8936002)(4326008)(86362001)(5660300002)(36756003)(53546011)(81166006)(478600001)(6512007)(224303003)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1680;
 H:MWHPR15MB1597.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 518vSRocYD7fPr6eW63wcWVcFS6Sn2MpFGGjHDtuEpUNxCJH67rIR2MB2iX1A8QHFc6RNdlS3eHb45ovsgU5ZUo9toWWkSTt8jLPNd4Me7QS8+DXNdQFt0VDOq2SA5sJFqO93SErDoM812bRjiOrZN+Yy6kHNQLF48OczS2fioDNtyI1SkX14pS0L/+k5GzCzsiCG3X0MVr+LMU7QNiBBSnioqJZmgz9Kv9VGyMCqe+66PewG5dx5MKMqYLw9mrh0tKEcSPeBywYDfirKMuxHHicBxXnl8ua+V7ndsbUHQ2WrcdA/aUvsKWmqVuGI3umyC1s14Psje814XQzlef7+k8Bdwb4jttRMoX5cj3u8fQv+BkOMX0VFFsDyAumTkFHyWDwQY1e9Khj/PrNcxqqSnTocFaMT+D5MUjFF5KUBZL7g4Ul9hfsHkNfOXypXkmD
x-ms-exchange-antispam-messagedata: wEtk2px8jiiJ2uGSTYxt3iGbGXfVAyh9FHTecw6zTYde69IxcSivunmLibAYs7A2xGOt1svy+s14JntzTgAQXnVHPfGrDgjN+DbbPgleSVu27Xf1oVFyDe6BHLGmyojNGf78DJI/ZHpm/2nJyyONpplUxWetYf/bbKU77YXAuo8eprAiUGvwjkEqdmiLFk8X
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_2A84CB543C834DDDB548FDC56E565F7Ffbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e50cc095-c463-4a4e-ad35-08d7b94eedf2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2020 17:28:14.5297 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1vKQi43V04KvgucYIRLYz5UtfRdPotfpMfC5wWRJCqeGe3Hf97Q2DcIAttq8VB9gLm7Pqz6teFqLUVDyu8MR5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1680
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-24_07:2020-02-21,
 2020-02-24 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0 clxscore=1011
 mlxscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002240131
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

--_000_2A84CB543C834DDDB548FDC56E565F7Ffbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgSmVmZiwNCllvdSBjYW4gdXNlIHg4Ni1wb3dlci1jb250cm9sIGZvciBwb3dlciwgcGhvc3Bo
b3Itc29mdHdhcmUtbWFuYWdlciBmb3IgZmlybXdhcmUgdXBncmFkZSBhbmQgZW50aXR5IG1hbmFn
ZXIgJiBkYnVzLXNlbnNvcnMgZm9yIHNlbnNvci4NCg0KUmVnYXJkcw0KLVZpamF5DQoNCkZyb206
IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJz
Lm9yZz4gb24gYmVoYWxmIG9mIOmZs++8jOadvuWEiSA8Y2tpbWNoYW4xN0BnbWFpbC5jb20+DQpE
YXRlOiBTdW5kYXksIEZlYnJ1YXJ5IDIzLCAyMDIwIGF0IDE6NDcgQU0NClRvOiBCcmFkIEJpc2hv
cCA8YnJhZGxleWJAZnV6emllc3F1aXJyZWwuY29tPg0KQ2M6IE9wZW5CTUMgTWFpbGxpc3QgPG9w
ZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NClN1YmplY3Q6IOWbnuimhjogUmU6IOWbnuimhu+8mnNr
ZWxldG9uDQoNCkhpIEJyYWQsDQogICAgICAgIEnigJltIG5ldyB0byBvcGVuYm1jLCBub3cgSSBj
YW4gYm9vdCBvcGVuYm1jIG9uIE1CIHdpdGggQVNUMjUwMC4NCldoYXQgSeKAmW0gdHJ5aW5nIHRv
IGFjaGlldmUgYXJlOg0KDQogIDEuICBQb3dlciBjb250cm9sLg0KICAyLiAgVXBkYXRlIEJNQyBm
aXJtd2FyZS4NCiAgMy4gIFNlbnNvcnMgbW9uaXRvcmluZy4NCg0KVGhhbmtzIGZvciB5b3VyIHN1
Z2dlc3Rpb24gaW4gYWR2YW5jZS4NCg0KSmVmZg0KDQrlr4Tku7bogIU6IEJyYWQgQmlzaG9wPG1h
aWx0bzpicmFkbGV5YkBmdXp6aWVzcXVpcnJlbC5jb20+DQrlgrPpgIHmmYLplpM6IDIwMjDlubQy
5pyIMjHml6Ug5LiK5Y2IIDAxOjAyDQrmlLbku7bogIU6IOKAquKAquKAquKAqkplZmYgQ2hhbjxt
YWlsdG86Y2tpbWNoYW4xN0BnbWFpbC5jb20+DQrlia/mnKw6IE9wZW5CTUMgTWFpbGxpc3Q8bWFp
bHRvOm9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NCuS4u+aXqDogUmU6IOWbnuimhu+8mnNrZWxl
dG9uDQoNCg0KDQo+IE9uIEZlYiAxOSwgMjAyMCwgYXQgODowNiBQTSwg4oCq4oCq4oCq4oCqSmVm
ZiBDaGFuIDxja2ltY2hhbjE3QGdtYWlsLmNvbT4gd3JvdGU6DQo+DQo+IEhpIEJyYWQsDQo+IFRo
YW5rcyBmb3IgcmVwbHksIEkgY2hlY2tlZCAgZ2l0aHViLmNvbS9vcGVuYm1jL3NrZWxldG9uLCBt
b3N0IG9mIHRoZW0gcmVsZWFzZWQgMiB5ZWFycyBhZ28sIGFuZCB0aGUgdGl0bGUgc2FpZCAid2ls
bCBiZSByZXBsYWNlZC4uLiIsIGlzIGl0IHN0aWxsIGdvb2QgdG8gYWRvcHQgaXQ/DQoNCk5vIEkg
d291bGQgbm90IHJlY29tbWVuZCB0aGF0LiAgU2tlbGV0b24gY292ZXJzIGEgbG90IG9mIEJNQyBm
dW5jdGlvbnMgLSB3aGljaCBvbmUgaW4gcGFydGljdWxhciBhcmUgeW91IGludGVyZXN0ZWQgaW4/
DQoNCj4NCj4gSmVmZg0KPg0KPg0KPiAtLS0tLS0tLSDljp/lp4vpg7Xku7YgLS0tLS0tLS0NCj4g
5a+E5Lu26ICF77yaIEJyYWQgQmlzaG9wIDxicmFkbGV5YkBmdXp6aWVzcXVpcnJlbC5jb20+DQo+
IOaXpeacn++8miAyMDIw5bm0MuaciDE05pelIOmAseS6lCAwMjozOQ0KPiDmlLbku7bkurrvvJog
4oCq4oCq4oCq4oCqSmVmZiBDaGFuIDxja2ltY2hhbjE3QGdtYWlsLmNvbT4NCj4g5Ymv5pys77ya
IE9wZW5CTUMgTWFpbGxpc3QgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NCj4g5Li75peo77ya
IFJlOiBza2VsZXRvbg0KPg0KPg0KPiA+IE9uIEZlYiAxMSwgMjAyMCwgYXQgNjoyOSBBTSwg4oCq
4oCq4oCq4oCqSmVmZiBDaGFuIDxja2ltY2hhbjE3QGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4NCj4g
PiBIaSwNCj4gPiBBcyB0aGUgZGVzY3JpcHRpb24gaW4gc2tlbGV0b24gZ2l0aHViLCBpdCB3aWxs
IGJlIHJlcGxhY2VkIHdpdGggcHJvcGVyIGltcGxlbWVudGF0aW9uLCB3aGF0J3MgdGhlIHVwIHRv
IGRhdGUgaW1wbGVtZW50YXRpb24/IHdoZXJlIGNhbiBJIGZpbmQgdGhvc2UgZG9jcyBvciBzYW1w
bGVzPw0KPiA+DQo+ID4gSmVmZg0KPg0KPiBIaSBKZWZmDQo+DQo+IE1vc3Qgb2Ygc2tlbGV0b24g
aGFzIGJlZW4gcmV3cml0dGVuLiAgc2tlbGV0b24gY292ZXJzIGEgbG90IG9mIEJNQyBmdW5jdGlv
bnMgLSB3aGljaCBvbmUgaW4gcGFydGljdWxhciBhcmUgeW91IGludGVyZXN0ZWQgaW4/DQo+DQo+
IHRoeCAtYnJhZA0KDQo=

--_000_2A84CB543C834DDDB548FDC56E565F7Ffbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <C8D523EF320E704F9C7646A9C69A5481@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseTpQTWluZ0xpVTsNCglwYW5vc2UtMToyIDIgNSAwIDAgMCAwIDAgMCAw
O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Ik1TIEdvdGhpYyI7DQoJcGFub3NlLTE6MiAx
MSA2IDkgNyAyIDUgOCAyIDQ7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBN
YXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9u
dC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToyIDE1IDUgMiAyIDIgNCAzIDIgNDt9DQpAZm9u
dC1mYWNlDQoJe2ZvbnQtZmFtaWx5OiJcQE1TIEdvdGhpYyI7DQoJcGFub3NlLTE6MiAxMSA2IDkg
NyAyIDUgOCAyIDQ7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseToiXEBQTWluZ0xpVSI7DQoJ
cGFub3NlLTE6MiAxIDYgMSAwIDEgMSAxIDEgMTt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0K
cC5Nc29Ob3JtYWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0K
CW1hcmdpbi1ib3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTIuMHB0Ow0KCWZvbnQtZmFtaWx5
OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNv
LXN0eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9yOmJsdWU7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVy
bGluZTt9DQpwLk1zb0xpc3RQYXJhZ3JhcGgsIGxpLk1zb0xpc3RQYXJhZ3JhcGgsIGRpdi5Nc29M
aXN0UGFyYWdyYXBoDQoJe21zby1zdHlsZS1wcmlvcml0eTozNDsNCgltYXJnaW4tdG9wOjBpbjsN
CgltYXJnaW4tcmlnaHQ6MGluOw0KCW1hcmdpbi1ib3R0b206MGluOw0KCW1hcmdpbi1sZWZ0OjI0
LjBwdDsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJbXNvLXBhcmEtbWFyZ2luLXRvcDowaW47
DQoJbXNvLXBhcmEtbWFyZ2luLXJpZ2h0OjBpbjsNCgltc28tcGFyYS1tYXJnaW4tYm90dG9tOjBp
bjsNCgltc28tcGFyYS1tYXJnaW4tbGVmdDoyLjBnZDsNCgltc28tcGFyYS1tYXJnaW4tYm90dG9t
Oi4wMDAxcHQ7DQoJZm9udC1zaXplOjEyLjBwdDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fu
cy1zZXJpZjt9DQpzcGFuLkVtYWlsU3R5bGUxOQ0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1y
ZXBseTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjsNCgljb2xvcjp3aW5kb3d0
ZXh0O30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZv
bnQtc2l6ZToxMC4wcHQ7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4gMTEuMGlu
Ow0KCW1hcmdpbjoxLjBpbiAxLjI1aW4gMS4waW4gMS4yNWluO30NCmRpdi5Xb3JkU2VjdGlvbjEN
Cgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLyogTGlzdCBEZWZpbml0aW9ucyAqLw0KQGxpc3QgbDAN
Cgl7bXNvLWxpc3QtaWQ6MTc2Nzg0NTQ0MTsNCgltc28tbGlzdC10ZW1wbGF0ZS1pZHM6MTkzNDc5
NzMxMjt9DQpAbGlzdCBsMQ0KCXttc28tbGlzdC1pZDoyMTQwNTY0MDc5Ow0KCW1zby1saXN0LXR5
cGU6aHlicmlkOw0KCW1zby1saXN0LXRlbXBsYXRlLWlkczotMTU0NDEwMTYgLTEgNjc2OTg3MTMg
Njc2OTg3MTUgNjc2OTg3MDMgNjc2OTg3MTMgNjc2OTg3MTUgNjc2OTg3MDMgNjc2OTg3MTMgNjc2
OTg3MTU7fQ0KQGxpc3QgbDE6bGV2ZWwxDQoJe21zby1sZXZlbC10YWItc3RvcDpub25lOw0KCW1z
by1sZXZlbC1udW1iZXItcG9zaXRpb246bGVmdDsNCgltYXJnaW4tbGVmdDouMjVpbjsNCgl0ZXh0
LWluZGVudDotLjI1aW47fQ0KQGxpc3QgbDE6bGV2ZWwyDQoJe21zby1sZXZlbC1udW1iZXItZm9y
bWF0OmlkZW9ncmFwaC10cmFkaXRpb25hbDsNCgltc28tbGV2ZWwtdGV4dDolMuOAgTsNCgltc28t
bGV2ZWwtdGFiLXN0b3A6bm9uZTsNCgltc28tbGV2ZWwtbnVtYmVyLXBvc2l0aW9uOmxlZnQ7DQoJ
bWFyZ2luLWxlZnQ6NDguMHB0Ow0KCXRleHQtaW5kZW50Oi0yNC4wcHQ7fQ0KQGxpc3QgbDE6bGV2
ZWwzDQoJe21zby1sZXZlbC1udW1iZXItZm9ybWF0OnJvbWFuLWxvd2VyOw0KCW1zby1sZXZlbC10
YWItc3RvcDpub25lOw0KCW1zby1sZXZlbC1udW1iZXItcG9zaXRpb246cmlnaHQ7DQoJbWFyZ2lu
LWxlZnQ6MS4waW47DQoJdGV4dC1pbmRlbnQ6LTI0LjBwdDt9DQpAbGlzdCBsMTpsZXZlbDQNCgl7
bXNvLWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJbXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjpsZWZ0
Ow0KCW1hcmdpbi1sZWZ0Ojk2LjBwdDsNCgl0ZXh0LWluZGVudDotMjQuMHB0O30NCkBsaXN0IGwx
OmxldmVsNQ0KCXttc28tbGV2ZWwtbnVtYmVyLWZvcm1hdDppZGVvZ3JhcGgtdHJhZGl0aW9uYWw7
DQoJbXNvLWxldmVsLXRleHQ6JTXjgIE7DQoJbXNvLWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJbXNv
LWxldmVsLW51bWJlci1wb3NpdGlvbjpsZWZ0Ow0KCW1hcmdpbi1sZWZ0OjEyMC4wcHQ7DQoJdGV4
dC1pbmRlbnQ6LTI0LjBwdDt9DQpAbGlzdCBsMTpsZXZlbDYNCgl7bXNvLWxldmVsLW51bWJlci1m
b3JtYXQ6cm9tYW4tbG93ZXI7DQoJbXNvLWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJbXNvLWxldmVs
LW51bWJlci1wb3NpdGlvbjpyaWdodDsNCgltYXJnaW4tbGVmdDoyLjBpbjsNCgl0ZXh0LWluZGVu
dDotMjQuMHB0O30NCkBsaXN0IGwxOmxldmVsNw0KCXttc28tbGV2ZWwtdGFiLXN0b3A6bm9uZTsN
Cgltc28tbGV2ZWwtbnVtYmVyLXBvc2l0aW9uOmxlZnQ7DQoJbWFyZ2luLWxlZnQ6MTY4LjBwdDsN
Cgl0ZXh0LWluZGVudDotMjQuMHB0O30NCkBsaXN0IGwxOmxldmVsOA0KCXttc28tbGV2ZWwtbnVt
YmVyLWZvcm1hdDppZGVvZ3JhcGgtdHJhZGl0aW9uYWw7DQoJbXNvLWxldmVsLXRleHQ6JTjjgIE7
DQoJbXNvLWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJbXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjps
ZWZ0Ow0KCW1hcmdpbi1sZWZ0OjE5Mi4wcHQ7DQoJdGV4dC1pbmRlbnQ6LTI0LjBwdDt9DQpAbGlz
dCBsMTpsZXZlbDkNCgl7bXNvLWxldmVsLW51bWJlci1mb3JtYXQ6cm9tYW4tbG93ZXI7DQoJbXNv
LWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJbXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjpyaWdodDsN
CgltYXJnaW4tbGVmdDozLjBpbjsNCgl0ZXh0LWluZGVudDotMjQuMHB0O30NCm9sDQoJe21hcmdp
bi1ib3R0b206MGluO30NCnVsDQoJe21hcmdpbi1ib3R0b206MGluO30NCi0tPjwvc3R5bGU+DQo8
L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0iYmx1ZSIgdmxpbms9InB1cnBsZSI+DQo8
ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkhpIEplZmYsPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPllvdSBjYW4g
dXNlIHg4Ni1wb3dlci1jb250cm9sIGZvciBwb3dlciwgcGhvc3Bob3Itc29mdHdhcmUtbWFuYWdl
ciBmb3IgZmlybXdhcmUgdXBncmFkZSBhbmQgZW50aXR5IG1hbmFnZXIgJmFtcDsgZGJ1cy1zZW5z
b3JzIGZvciBzZW5zb3IuPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFu
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0
Ij5SZWdhcmRzPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPi1WaWpheTxvOnA+PC9vOnA+PC9zcGFuPjwvcD4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpw
PiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXIt
dG9wOnNvbGlkICNCNUM0REYgMS4wcHQ7cGFkZGluZzozLjBwdCAwaW4gMGluIDBpbiI+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48Yj48c3BhbiBzdHlsZT0iY29sb3I6YmxhY2siPkZyb206IDwvc3Bh
bj48L2I+PHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNrIj5vcGVuYm1jICZsdDtvcGVuYm1jLWJvdW5j
ZXMmIzQzO3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMub3JnJmd0OyBvbiBiZWhhbGYg
b2YNCjwvc3Bhbj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6JnF1b3Q7TVMgR290aGljJnF1b3Q7
O2NvbG9yOmJsYWNrIj7pmbPvvIzmnb7lhIk8L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNr
Ij4gJmx0O2NraW1jaGFuMTdAZ21haWwuY29tJmd0Ozxicj4NCjxiPkRhdGU6IDwvYj5TdW5kYXks
IEZlYnJ1YXJ5IDIzLCAyMDIwIGF0IDE6NDcgQU08YnI+DQo8Yj5UbzogPC9iPkJyYWQgQmlzaG9w
ICZsdDticmFkbGV5YkBmdXp6aWVzcXVpcnJlbC5jb20mZ3Q7PGJyPg0KPGI+Q2M6IDwvYj5PcGVu
Qk1DIE1haWxsaXN0ICZsdDtvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcmZ3Q7PGJyPg0KPGI+U3Vi
amVjdDogPC9iPjwvc3Bhbj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6JnF1b3Q7TVMgR290aGlj
JnF1b3Q7O2NvbG9yOmJsYWNrIj7lm57opoY8L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNr
Ij46IFJlOg0KPC9zcGFuPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTomcXVvdDtNUyBHb3RoaWMm
cXVvdDs7Y29sb3I6YmxhY2siPuWbnuimhu+8mjwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6Ymxh
Y2siPnNrZWxldG9uPG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7
PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+SGkgQnJhZCw8
bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBJ4oCZbSBuZXcgdG8gb3BlbmJtYywgbm93IEkgY2FuIGJv
b3Qgb3BlbmJtYyBvbiBNQiB3aXRoIEFTVDI1MDAuPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIj5XaGF0IEnigJltIHRyeWluZyB0byBhY2hpZXZlIGFyZTo8bzpwPjwvbzpwPjwv
cD4NCjxvbCBzdHlsZT0ibWFyZ2luLXRvcDowaW4iIHN0YXJ0PSIxIiB0eXBlPSIxIj4NCjxsaSBj
bGFzcz0iTXNvTGlzdFBhcmFncmFwaCIgc3R5bGU9Im1hcmdpbi1sZWZ0Oi0uMjVpbjttc28tcGFy
YS1tYXJnaW4tbGVmdDowZ2Q7bXNvLWxpc3Q6bDEgbGV2ZWwxIGxmbzMiPg0KUG93ZXIgY29udHJv
bC48bzpwPjwvbzpwPjwvbGk+PGxpIGNsYXNzPSJNc29MaXN0UGFyYWdyYXBoIiBzdHlsZT0ibWFy
Z2luLWxlZnQ6LS4yNWluO21zby1wYXJhLW1hcmdpbi1sZWZ0OjBnZDttc28tbGlzdDpsMSBsZXZl
bDEgbGZvMyI+DQpVcGRhdGUgQk1DIGZpcm13YXJlLjxvOnA+PC9vOnA+PC9saT48bGkgY2xhc3M9
Ik1zb0xpc3RQYXJhZ3JhcGgiIHN0eWxlPSJtYXJnaW4tbGVmdDotLjI1aW47bXNvLXBhcmEtbWFy
Z2luLWxlZnQ6MGdkO21zby1saXN0OmwxIGxldmVsMSBsZm8zIj4NClNlbnNvcnMgbW9uaXRvcmlu
Zy48bzpwPjwvbzpwPjwvbGk+PC9vbD4NCjxwIGNsYXNzPSJNc29MaXN0UGFyYWdyYXBoIiBzdHls
ZT0ibWFyZ2luLWxlZnQ6LjI1aW47bXNvLXBhcmEtbWFyZ2luLWxlZnQ6MGdkIj5UaGFua3MgZm9y
IHlvdXIgc3VnZ2VzdGlvbiBpbiBhZHZhbmNlLjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+Jm5ic3A7PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5KZWZm
PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1m
YW1pbHk6JnF1b3Q7UE1pbmdMaVUmcXVvdDssc2VyaWYiPiZuYnNwOzwvc3Bhbj48bzpwPjwvbzpw
PjwvcD4NCjxkaXYgc3R5bGU9ImJvcmRlcjpub25lO2JvcmRlci10b3A6c29saWQgI0UxRTFFMSAx
LjBwdDtwYWRkaW5nOjMuMHB0IDBpbiAwaW4gMGluIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxi
PjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTomcXVvdDtQTWluZ0xpVSZxdW90OyxzZXJpZiI+5a+E
5Lu26ICFPC9zcGFuPjogPC9iPg0KPGEgaHJlZj0ibWFpbHRvOmJyYWRsZXliQGZ1enppZXNxdWly
cmVsLmNvbSI+QnJhZCBCaXNob3A8L2E+PGJyPg0KPGI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5
OiZxdW90O1BNaW5nTGlVJnF1b3Q7LHNlcmlmIj7lgrPpgIHmmYLplpM8L3NwYW4+OiA8L2I+MjAy
MDxzcGFuIHN0eWxlPSJmb250LWZhbWlseTomcXVvdDtQTWluZ0xpVSZxdW90OyxzZXJpZiI+5bm0
PC9zcGFuPjI8c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6JnF1b3Q7UE1pbmdMaVUmcXVvdDssc2Vy
aWYiPuaciDwvc3Bhbj4yMTxzcGFuIHN0eWxlPSJmb250LWZhbWlseTomcXVvdDtQTWluZ0xpVSZx
dW90OyxzZXJpZiI+5pelPC9zcGFuPg0KPHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90O1BN
aW5nTGlVJnF1b3Q7LHNlcmlmIj7kuIrljYg8L3NwYW4+IDAxOjAyPGJyPg0KPGI+PHNwYW4gc3R5
bGU9ImZvbnQtZmFtaWx5OiZxdW90O1BNaW5nTGlVJnF1b3Q7LHNlcmlmIj7mlLbku7bogIU8L3Nw
YW4+OiA8L2I+PGEgaHJlZj0ibWFpbHRvOmNraW1jaGFuMTdAZ21haWwuY29tIj7igKrigKrigKri
gKpKZWZmIENoYW48L2E+PGJyPg0KPGI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90O1BN
aW5nTGlVJnF1b3Q7LHNlcmlmIj7lia/mnKw8L3NwYW4+OiA8L2I+PGEgaHJlZj0ibWFpbHRvOm9w
ZW5ibWNAbGlzdHMub3psYWJzLm9yZyI+T3BlbkJNQyBNYWlsbGlzdDwvYT48YnI+DQo8Yj48c3Bh
biBzdHlsZT0iZm9udC1mYW1pbHk6JnF1b3Q7UE1pbmdMaVUmcXVvdDssc2VyaWYiPuS4u+aXqDwv
c3Bhbj46IDwvYj5SZTogPHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90O1BNaW5nTGlVJnF1
b3Q7LHNlcmlmIj4NCuWbnuimhu+8mjwvc3Bhbj5za2VsZXRvbjxvOnA+PC9vOnA+PC9wPg0KPC9k
aXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6JnF1b3Q7
UE1pbmdMaVUmcXVvdDssc2VyaWYiPiZuYnNwOzwvc3Bhbj48bzpwPjwvbzpwPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPiZuYnNwOzxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+Jm5ic3A7PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mZ3Q7IE9uIEZl
YiAxOSwgMjAyMCwgYXQgODowNiBQTSwg4oCq4oCq4oCq4oCqSmVmZiBDaGFuICZsdDtja2ltY2hh
bjE3QGdtYWlsLmNvbSZndDsgd3JvdGU6PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj4mZ3Q7IDxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jmd0OyBIaSBC
cmFkLDxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jmd0OyBUaGFua3MgZm9y
IHJlcGx5LCBJIGNoZWNrZWQmbmJzcDsgZ2l0aHViLmNvbS9vcGVuYm1jL3NrZWxldG9uLCBtb3N0
IG9mIHRoZW0gcmVsZWFzZWQgMiB5ZWFycyBhZ28sIGFuZCB0aGUgdGl0bGUgc2FpZCAmcXVvdDt3
aWxsIGJlIHJlcGxhY2VkLi4uJnF1b3Q7LCBpcyBpdCBzdGlsbCBnb29kIHRvIGFkb3B0IGl0Pw0K
PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDs8bzpwPjwvbzpwPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPk5vIEkgd291bGQgbm90IHJlY29tbWVuZCB0aGF0LiZu
YnNwOyBTa2VsZXRvbiBjb3ZlcnMgYSBsb3Qgb2YgQk1DIGZ1bmN0aW9ucyAtIHdoaWNoIG9uZSBp
biBwYXJ0aWN1bGFyIGFyZSB5b3UgaW50ZXJlc3RlZCBpbj88bzpwPjwvbzpwPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPiZuYnNwOzxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+Jmd0OyA8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZndDsgSmVmZjxv
OnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jmd0OyA8bzpwPjwvbzpwPjwvcD4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZndDsgPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj4mZ3Q7IC0tLS0tLS0tIDxzcGFuIHN0eWxlPSJmb250LWZhbWlseTomcXVvdDtQTWlu
Z0xpVSZxdW90OyxzZXJpZiI+5Y6f5aeL6YO15Lu2PC9zcGFuPiAtLS0tLS0tLTxvOnA+PC9vOnA+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jmd0OyA8c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6
JnF1b3Q7UE1pbmdMaVUmcXVvdDssc2VyaWYiPuWvhOS7tuiAhe+8mjwvc3Bhbj4gQnJhZCBCaXNo
b3AgJmx0O2JyYWRsZXliQGZ1enppZXNxdWlycmVsLmNvbSZndDs8bzpwPjwvbzpwPjwvcD4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPiZndDsgPHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90O1BN
aW5nTGlVJnF1b3Q7LHNlcmlmIj7ml6XmnJ/vvJo8L3NwYW4+IDIwMjA8c3BhbiBzdHlsZT0iZm9u
dC1mYW1pbHk6JnF1b3Q7UE1pbmdMaVUmcXVvdDssc2VyaWYiPuW5tDwvc3Bhbj4yPHNwYW4gc3R5
bGU9ImZvbnQtZmFtaWx5OiZxdW90O1BNaW5nTGlVJnF1b3Q7LHNlcmlmIj7mnIg8L3NwYW4+MTQ8
c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6JnF1b3Q7UE1pbmdMaVUmcXVvdDssc2VyaWYiPuaXpTwv
c3Bhbj4NCjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTomcXVvdDtQTWluZ0xpVSZxdW90OyxzZXJp
ZiI+6YCx5LqUPC9zcGFuPiAwMjozOTxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+Jmd0OyA8c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6JnF1b3Q7UE1pbmdMaVUmcXVvdDssc2Vy
aWYiPuaUtuS7tuS6uu+8mjwvc3Bhbj4g4oCq4oCq4oCq4oCqSmVmZiBDaGFuICZsdDtja2ltY2hh
bjE3QGdtYWlsLmNvbSZndDs8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZn
dDsgPHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90O1BNaW5nTGlVJnF1b3Q7LHNlcmlmIj7l
ia/mnKzvvJo8L3NwYW4+IE9wZW5CTUMgTWFpbGxpc3QgJmx0O29wZW5ibWNAbGlzdHMub3psYWJz
Lm9yZyZndDs8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZndDsgPHNwYW4g
c3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90O1BNaW5nTGlVJnF1b3Q7LHNlcmlmIj7kuLvml6jvvJo8
L3NwYW4+IFJlOiBza2VsZXRvbjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
Jmd0OyA8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZndDsgPG86cD48L286
cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mZ3Q7ICZndDsgT24gRmViIDExLCAyMDIwLCBh
dCA2OjI5IEFNLCDigKrigKrigKrigKpKZWZmIENoYW4gJmx0O2NraW1jaGFuMTdAZ21haWwuY29t
Jmd0OyB3cm90ZTo8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZndDsgJmd0
OyA8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZndDsgJmd0OyBIaSw8bzpw
PjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZndDsgJmd0OyBBcyB0aGUgZGVzY3Jp
cHRpb24gaW4gc2tlbGV0b24gZ2l0aHViLCBpdCB3aWxsIGJlIHJlcGxhY2VkIHdpdGggcHJvcGVy
IGltcGxlbWVudGF0aW9uLCB3aGF0J3MgdGhlIHVwIHRvIGRhdGUgaW1wbGVtZW50YXRpb24/IHdo
ZXJlIGNhbiBJIGZpbmQgdGhvc2UgZG9jcyBvciBzYW1wbGVzPzxvOnA+PC9vOnA+PC9wPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+Jmd0OyAmZ3Q7IDxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+Jmd0OyAmZ3Q7IEplZmY8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPiZndDsgPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mZ3Q7IEhpIEpl
ZmY8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZndDsgPG86cD48L286cD48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mZ3Q7IE1vc3Qgb2Ygc2tlbGV0b24gaGFzIGJlZW4g
cmV3cml0dGVuLiZuYnNwOyBza2VsZXRvbiBjb3ZlcnMgYSBsb3Qgb2YgQk1DIGZ1bmN0aW9ucyAt
IHdoaWNoIG9uZSBpbiBwYXJ0aWN1bGFyIGFyZSB5b3UgaW50ZXJlc3RlZCBpbj88bzpwPjwvbzpw
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZndDsgPG86cD48L286cD48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj4mZ3Q7IHRoeCAtYnJhZDxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+Jm5ic3A7PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4N
Cg==

--_000_2A84CB543C834DDDB548FDC56E565F7Ffbcom_--
