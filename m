Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF9D14E241
	for <lists+openbmc@lfdr.de>; Thu, 30 Jan 2020 19:51:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487qF65nyhzDqVk
	for <lists+openbmc@lfdr.de>; Fri, 31 Jan 2020 05:51:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=9298bfd363=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=dtrp1cD4; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=Cnmpeq19; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487qCV1W4nzDqVP
 for <openbmc@lists.ozlabs.org>; Fri, 31 Jan 2020 05:49:33 +1100 (AEDT)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 00UIgZP7021704;
 Thu, 30 Jan 2020 10:49:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=5SW9WCeU0H1NjoSLphM20gR3TRNS7HmWpearyX/Qi+o=;
 b=dtrp1cD4r8sFFOGLl15YBmG9JM0siPyppgY3pNr8BIEKHADUB4AIcv4MqEuXnvzVdtcI
 jlGgO6IV/2wkW8beaPtaquQjKFdYMycRYQYkiVsQWI84dQP2j6nDQ1/wn4DvHRtjKN8v
 kjK+SUY99tPRXxILgyOEDpL3Fy1lAFBX01s= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0001303.ppops.net with ESMTP id 2xu76m0aka-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 30 Jan 2020 10:49:29 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 30 Jan 2020 10:49:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JygxIqycbq/wq2dnBptLnM83pzMaAPuPIGuFVp9wZ8tKZs17ABm81tbtoDOjR2LRfLpx2gB0xVS+GtQ2p6sOWeB6setaS+53HoDRAN/QjFfMEdiaAn7xn1+CYyxdSDaGbm9OKMpPGSkDoaEWPVxVLV2Sx/AOKOpfoHP92TunjXKrhw/3sGM7eEpnlTAvLvhR5q0p+xq/s/xGvmbts9/+t0CptLXLSmP6pNZX2IBO/aM0xAz5w6ngKx7x9m1mLT7tvrAXSNCVkQHYEHN89eBRxC2XO4gpXOzP4kl3sB/ejoenCwNRYF6h9Yy+NsWyavSfhOfAnV/bCzXiXu2vgEiZag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SW9WCeU0H1NjoSLphM20gR3TRNS7HmWpearyX/Qi+o=;
 b=fUBtrzzH3LJxORmVyi5V5SeRIJU2f9+MZFdNEqUZKft+U0GsOS2YtcabwEBhaM7dhmWVv9cnaBYZZxmc7RLOx5y2p1xhFZYKpIgn9TKX255ZDbaRU0YlQ2ifU+7u5h9ZhbGXjM2WQzjejCkd1vKOoNnX09/kHrRzcGPAZhzM4Zyb7pboHT5JDjaBnydGGm0DmdR77zvfBErolw+VeVw49PGgYkfZRDykAVewnxKHsR5G2tZlMVLQEJZR9dc0W/eVSKrrUHcXh2M9EqjpdY1YiKrVmcQF6/z6VWffZYFXohlZrOD96MsPwQpgjmlM6ryjWqq07oHLtz3+oL9+cspZ/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SW9WCeU0H1NjoSLphM20gR3TRNS7HmWpearyX/Qi+o=;
 b=Cnmpeq19xEJh5pIiNaVAW4g6MRtUV0kllfJ186P9VLQvxPzJzqKzDdf8tG5bukjM07Sf6z2/JU02I6C7SOStf4GZCN688xwapP3P2KidzaJFomXwKHbs8vRfIR/SXvGOMngryh+1adXYisSIyNAR7nM7YEp7CPxGSPdqfQf/91Q=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1885.namprd15.prod.outlook.com (10.174.254.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.28; Thu, 30 Jan 2020 18:49:26 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2%8]) with mapi id 15.20.2665.027; Thu, 30 Jan 2020
 18:49:26 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: power button override
Thread-Topic: power button override
Thread-Index: AQHV0ksr3xkr2xM5GUmL71a8unTXDaf49/wAgACl3ACAAK69gIAABOgA//+HZoCABQhZAP//lXuAgAId0ACAAnzCgA==
Date: Thu, 30 Jan 2020 18:49:26 +0000
Message-ID: <A81FB058-4102-4774-B238-2C5484BCF938@fb.com>
References: <98EE6AEE-9440-4AA5-971A-833EA0342226@fb.com>
 <d01cf897-0c23-35dc-5f81-aca67d31b98a@linux.intel.com>
 <0017A7FA-E86C-4524-B53B-9129A968C7DB@fb.com>
 <563c3b07-d5f5-1897-404b-ceb97f713610@linux.intel.com>
 <1b72ee84-6ad3-f5bb-bfed-2f6487893f59@linux.intel.com>
 <3AC1554A-4B97-45CA-BDE2-299AD172A9FD@fb.com>
 <698a1a8e-786e-3713-4b94-da7cf7864406@linux.intel.com>
 <01CE1094-7B1C-44F5-8580-C0098391EA6F@fb.com>
 <da001fe8-31f4-4343-a711-a91e44c0a22c@linux.intel.com>
In-Reply-To: <da001fe8-31f4-4343-a711-a91e44c0a22c@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:c081]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cadd2efb-3887-4c8d-a729-08d7a5b52156
x-ms-traffictypediagnostic: MWHPR15MB1885:
x-microsoft-antispam-prvs: <MWHPR15MB1885FE0F2A2AD091FA784F27DD040@MWHPR15MB1885.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 02981BE340
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(189003)(199004)(8936002)(5660300002)(81166006)(81156014)(6512007)(8676002)(6506007)(53546011)(86362001)(110136005)(36756003)(2616005)(186003)(3480700007)(33656002)(498600001)(66556008)(64756008)(66446008)(966005)(71200400001)(66946007)(6486002)(66476007)(76116006)(2906002)(7116003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1885;
 H:MWHPR15MB1597.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bfJnZHtqLchTwbKnpSG6S4mvLpEIXA9lUGRn4pVw4dYvlgL/tAo2rOlslzoyjIu+zYWrGplR945ss7A4IUqhKj8wEEv1VHTXO0kYEfiIohhZ6FP3Mc46g0E/zzvtZSOt2M81xyQsHe5iSjvR+/MH24/c9TDum7zWrwcFttwDbsTvEz2QM6mvnp25gcPO30eFnCpxRL61DvCA2Ed7uu76DENe53mNLPN+UN6RtiaKPm8PZCtqr2hebX5ECwfhE6B88PnWGkjIZhJoTDzqkPqygNf/4X6VQboNNTA+yRpm8tWnnzJSGPiOwh+5E2pL7cT7ri5GGHHcsiATlgHNZCZJwteKuciEAKTn80PUbfz34MkgQuooxxtMZJ1x4aobKo9cHpCUZyFAGBin2Pwss5BgQy2gAfIIXyWg+u9UmFI+xdd/jOoqkoiLkTDqko4XK9zKjl29jUnGiMCEYekNju7p3r6iu13Mh8DyLLHEsOT58fqUot7lvFBy/IFCLvS2LCZAe4Ls45LlfW5YKZ00MGkt8g==
x-ms-exchange-antispam-messagedata: 88Igfrt0sj33AuFPrleHRfARnRGgOVcnqt9qm/alaCVVq2/wd+EMAVybiEqN42mj5PqxEOsQTA56f1fzgZVtlZD1SW/O1eOKGWU/kNPddtUm7bkblDoGDyKGVvSK0g3YIBOuEpKdg/FPlkc7+o6W9ScnENR42MTEY1BnIwONIGCVVDoa2lF+VCzYbsPIimxb
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B5F658C8EA1D1409777C8439398826C@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cadd2efb-3887-4c8d-a729-08d7a5b52156
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2020 18:49:26.1645 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CW9ZvUzy6PiGlZPA0dc116wHWL/XKGqEOW0Ex69Lr+66Ibz7s6LXWZ/cVIDwd7ol4QJhWPX8DcByzKslqHZtzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1885
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-30_06:2020-01-30,
 2020-01-30 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 malwarescore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001300128
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

SGkgSmFzb24sDQpUaGUgcHJvYmxlbSBJIGFtIHNlZWluZyBhcyBJIGFtIHVuYWJsZSB0byBzZW5k
IHJlc2V0IGlwbWkgY29tbWFuZCB0byBNRSB2aWEgSVBNQiBvbiBpMmMgYnVzLiBJIHRyaWVkIHRv
IGdpdmUgMzAgc2Vjb25kIGRlbGF5IGFmdGVyIHBvd2VyIG9mZiBhbmQgc2V0dGluZyBpbiBNRSBy
ZWNvdmVyeSBtb2RlLiBPbmNlIEkgZG8gZm9yY2UgcG93ZXJvZmYgdGhlbiBvbmx5IEkgYW0gYWJs
ZSB0byBzZW5kIGFueSBjb21tYW5kIHRvIE1FLiBJIGRvbid0IGtub3cgd2hhdCBpcyB0aGUgcmVs
YXRpb24gb2YgcG93ZXIgdG8gTUUgYWNjZXNzIG9uIGkyYyBidXMuDQoNClJlZ2FyZHMNCi1WaWph
eQ0KDQrvu79PbiAxLzI4LzIwLCAxMjo1MCBQTSwgIkJpbGxzLCBKYXNvbiBNIiA8amFzb24ubS5i
aWxsc0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOg0KDQogICAgDQogICAgDQogICAgT24gMS8yNy8y
MDIwIDEyOjMxIFBNLCBWaWpheSBLaGVta2Egd3JvdGU6DQogICAgPiANCiAgICA+IA0KICAgID4g
T24gMS8yNy8yMCwgMTA6NTIgQU0sICJCaWxscywgSmFzb24gTSIgPGphc29uLm0uYmlsbHNAbGlu
dXguaW50ZWwuY29tPiB3cm90ZToNCiAgICA+IA0KICAgID4gICAgICANCiAgICA+ICAgICAgDQog
ICAgPiAgICAgIE9uIDEvMjQvMjAyMCAyOjAxIFBNLCBWaWpheSBLaGVta2Egd3JvdGU6DQogICAg
PiAgICAgID4NCiAgICA+ICAgICAgPg0KICAgID4gICAgICA+IE9uIDEvMjQvMjAsIDE6MTMgUE0s
ICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBCaWxscywgSmFzb24gTSIgPG9wZW5ibWMtYm91bmNlcyt2
aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJzLm9yZyBvbiBiZWhhbGYgb2YgamFzb24ubS5i
aWxsc0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOg0KICAgID4gICAgICA+DQogICAgPiAgICAgID4N
CiAgICA+ICAgICAgPg0KICAgID4gICAgICA+ICAgICAgT24gMS8yNC8yMDIwIDEyOjU1IFBNLCBC
aWxscywgSmFzb24gTSB3cm90ZToNCiAgICA+ICAgICAgPiAgICAgID4NCiAgICA+ICAgICAgPiAg
ICAgID4NCiAgICA+ICAgICAgPiAgICAgID4gT24gMS8yNC8yMDIwIDEwOjI5IEFNLCBWaWpheSBL
aGVta2Egd3JvdGU6DQogICAgPiAgICAgID4gICAgICA+Pg0KICAgID4gICAgICA+ICAgICAgPj4N
CiAgICA+ICAgICAgPiAgICAgID4+IE9uIDEvMjMvMjAsIDQ6MzYgUE0sICJCaWxscywgSmFzb24g
TSIgPGphc29uLm0uYmlsbHNAbGludXguaW50ZWwuY29tPg0KICAgID4gICAgICA+ICAgICAgPj4g
d3JvdGU6DQogICAgPiAgICAgID4gICAgICA+Pg0KICAgID4gICAgICA+ICAgICAgPj4gICAgICBP
biAxLzIzLzIwMjAgNDoxMyBQTSwgVmlqYXkgS2hlbWthIHdyb3RlOg0KICAgID4gICAgICA+ICAg
ICAgPj4gICAgICA+IEhpIEphc29uLA0KICAgID4gICAgICA+ICAgICAgPj4gICAgICA+DQogICAg
PiAgICAgID4gICAgICA+PiAgICAgID4gV2UgaGF2ZSBhIHJlcXVpcmVtZW50IG9mIHBvd2VyIGJ1
dHRvbiBvdmVycmlkZS4gSSBkb27igJl0IHNlZQ0KICAgID4gICAgICA+ICAgICAgPj4geDg2LXBv
d2VyDQogICAgPiAgICAgID4gICAgICA+PiAgICAgID4gY29udHJvbCBkb2VzbuKAmXQgc3VwcG9y
dCB0aGlzIGN1cnJlbnRseS4gRG8geW91IG5lZWQgdGhpcw0KICAgID4gICAgICA+ICAgICAgPj4g
ZmVhdHVyZXMgb3IgZG8NCiAgICA+ICAgICAgPiAgICAgID4+ICAgICAgPiB5b3UgaGF2ZSBhbnkg
bG9jYWwgcGF0Y2ggZm9yIHRoaXMuDQogICAgPiAgICAgID4gICAgICA+PiAgICAgIEhpIFZpamF5
LA0KICAgID4gICAgICA+ICAgICAgPj4gICAgICBwb3dlciBidXR0b24gb3ZlcnJpZGUgaXMgdXNl
ZCBmb3IgdGhlICJGb3JjZSBPZmYiIGFjdGlvbnMgaW4NCiAgICA+ICAgICAgPiAgICAgID4+IHBv
d2VyIGNvbnRyb2w6DQogICAgPiAgICAgID4gICAgICA+Pg0KICAgID4gICAgICA+ICAgICAgPj4g
aHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMveDg2LXBvd2VyLWNvbnRyb2wvYmxvYi9tYXN0ZXIv
cG93ZXItY29udHJvbC14ODYvc3JjL3Bvd2VyX2NvbnRyb2wuY3BwI0w1MC4NCiAgICA+ICAgICAg
PiAgICAgID4+DQogICAgPiAgICAgID4gICAgICA+Pg0KICAgID4gICAgICA+ICAgICAgPj4gVGhp
cyB3aWxsIG5vdCB3b3JrIGlmIGN1cnJlbnQgc3RhdHVzIGlzIG9mZi4gVGhpcyBzaG91bGQganVz
dCBzZW5kDQogICAgPiAgICAgID4gICAgICA+PiBwdWxzZSBpbiBhbnkgc3RhdHVzIG9uL29mZi4N
CiAgICA+ICAgICAgPiAgICAgID4gQ29ycmVjdC4gIEZvcmNlIE9mZiBpcyBub3QgZG9uZSBpZiB0
aGUgY3VycmVudCBzdGF0dXMgaXMgb2ZmLg0KICAgID4gICAgICA+ICAgICAgRG8geW91IGhhdmUg
bW9yZSBkZXRhaWxzIG9uIHRoZSBwb3dlciBidXR0b24gb3ZlcnJpZGUgYmVoYXZpb3IgdGhhdCB5
b3UNCiAgICA+ICAgICAgPiAgICAgIG5lZWQ/DQogICAgPiAgICAgID4NCiAgICA+ICAgICAgPiBZ
ZXMsIFRoaXMgaXMgcmVxdWlyZWQgdG8gYnJpbmcgTUUgYmFjayB0byBvcGVyYXRpb24gbW9kZSBm
cm9tIHJlY292ZXJ5LiBIb3cgYXJlIHlvdSBoYW5kbGluZyBNRSBmb3IgQmlvcyB1cGdyYWRlLg0K
ICAgID4gICAgICBXaGVuIGluIHJlY292ZXJ5IG1vZGUsIHRoZSBNRSB3aWxsIGFjY2VwdCBhIHJl
c2V0IGNvbW1hbmQgKElQTUkgcmF3IDB4Ng0KICAgID4gICAgICAweDIpIHRvIHJlc2V0IHRvIG9w
ZXJhdGlvbmFsIG1vZGUuDQogICAgPiANCiAgICA+IEJpbGwsIEkgdHJpZWQgdGhpcyBhbmQgc2Vl
IGluY29uc2lzdGVudCBiZWhhdmlvciBmcm9tIGhvc3QuIFNvbWV0aW1lIGl0IHJlZnVzZSB0byBw
b3dlciBvbi4gU28gUEJPIHJlc29sdmVzIHRoaXMuDQogICAgSSBjaGVja2VkIHdpdGggdGhlIE1F
IHRlYW0gYW5kIE1FIHJlc2V0IHRvIG1vdmUgZnJvbSByZWNvdmVyeSBtb2RlIHRvIA0KICAgIG9w
ZXJhdGlvbmFsIG1vZGUgc2hvdWxkIHdvcmsuICBZb3UgY2FuIGZpbGUgYSB0aWNrZXQgd2l0aCBJ
bnRlbCBzdXBwb3J0IA0KICAgIHRvIGhlbHAgcmVzb2x2ZSB0aGUgaW5jb25zaXN0ZW50IGJlaGF2
aW9yIHRoYXQgeW91IHNlZSB3aGVuIGRvaW5nIHRoaXMuDQogICAgDQogICAgSW4gdGhlIG1lYW50
aW1lLCBJIHdpbGwgbG9vayBvdmVyIHlvdXIgcGF0Y2guDQogICAgDQogICAgVGhhbmtzLA0KICAg
IC1KYXNvbg0KICAgIA0KICAgID4gICAgICANCiAgICA+ICAgICAgPg0KICAgID4gICAgICA+ICAg
ICAgPj4gICAgICA+DQogICAgPiAgICAgID4gICAgICA+PiAgICAgID4gUmVnYXJkcw0KICAgID4g
ICAgICA+ICAgICAgPj4gICAgICA+DQogICAgPiAgICAgID4gICAgICA+PiAgICAgID4gLVZpamF5
DQogICAgPiAgICAgID4gICAgICA+PiAgICAgID4NCiAgICA+ICAgICAgPiAgICAgID4+DQogICAg
PiAgICAgID4NCiAgICA+ICAgICAgPg0KICAgID4gICAgICANCiAgICA+IA0KICAgIA0KDQo=
