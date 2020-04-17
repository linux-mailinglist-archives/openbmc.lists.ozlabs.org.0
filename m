Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9051AE5B9
	for <lists+openbmc@lfdr.de>; Fri, 17 Apr 2020 21:22:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493mFJ3WX1zDrhh
	for <lists+openbmc@lfdr.de>; Sat, 18 Apr 2020 05:22:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=13769785df=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=JOKEcCnR; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=IyTobxc4; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493mCX0cTCzDrgp
 for <openbmc@lists.ozlabs.org>; Sat, 18 Apr 2020 05:20:48 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 03HJGHXu024060;
 Fri, 17 Apr 2020 12:20:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=T3m8Nq+uYICcjN6eVb51mzdkY+NRIu41+yj4Mn/ycUE=;
 b=JOKEcCnR91bjSFiZPb6oMyVPJ5zBdlVLz9f2RL5fk9gi2twCzDQc2qGzBTyIbODwKxLs
 RPOm7b0zdSl/HyaggMK5UZAsdFwzK/IiQMs37TPWMyEVpAiXA7uXisrkq0H1MI4/jeu5
 Pgw9wTbeB0XyDgJoXNoO6QQ9mJeVsqwK+vM= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0089730.ppops.net with ESMTP id 30dn8643mg-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 17 Apr 2020 12:20:40 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.230) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Fri, 17 Apr 2020 12:20:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EwwZJabdJPJSXm9REqYMzjN3/ahKdmkJbFu95q55QxoPv0vJ2NRTRQrCD6xuiznke1zd7C1VMSmjOfIdkx/IO+dxSNk2kvyDvmI2o3rTZsy5c8VLP9kZvmLu0MtI7vZaALxShDYl3ULOeg5CIFoJsiJ7LhQ+gfPVCGCApaM9DxvpDLmEeZzuruqcSC/pYV6btx9xKgJdXK6gR4JA08G8ymH2royDUs/fB5tfnXJ0Rn92x+n6H3A+RrPW9o+a1KB6Q3lqA3f+K1tPofbixHaJ80MV63c8jORXccJvbryo8Biv77T71r0lnrif19HxXF2+bS4V0FZzKkTo3fCx+TPUBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3m8Nq+uYICcjN6eVb51mzdkY+NRIu41+yj4Mn/ycUE=;
 b=nejiXTpj6tVie0VsqbgaSahBCYmE4fs0LwP3DsKpZpNlXMtcHHKIV7q1XEn9y5sYSn24zshGlJ1Gbn9i/Q/1XKI5jYAa2X99awo65ApB0oq+osDTgUEVfwPJXNZ80i4UhnCTkWoBdHL38sN/vRMLrVDZ7E1a8IvYA8Cj/1LoP+uu8Hbz1QcGoAfym3OooIhXpBSMUw+KOSizxBZsmM/D4QbguG3MjlA2BZRhp775/5TVvwSnTaPspCmTclUzPFq3wP+9qYhwvLNqj7LazwBGuq5KdwcnZaMxmAY2Mb6fdzhWa4bipLlYiXu5qYcUCZ5goPtRFaL5Wc8pBDVsLu7XfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3m8Nq+uYICcjN6eVb51mzdkY+NRIu41+yj4Mn/ycUE=;
 b=IyTobxc4Pxs9ri6OMj39EHpO6d0ot4nIDECn+3+BSX7J70yP52Rc/KXr7fYdOeBbhqErMSeonjJ0XxtCQR2bIImk2hcDuFlYNWtFP8Un9bH5HzjTiIqF2LZRGWKpMvQLCvCxdxcZfsNVCtX1Visx7yvsF4lHkQE5R5xm0/dDJ4k=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2806.namprd15.prod.outlook.com (2603:10b6:a03:15c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Fri, 17 Apr
 2020 19:20:38 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4%3]) with mapi id 15.20.2921.027; Fri, 17 Apr 2020
 19:20:38 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: James Feist <james.feist@linux.intel.com>, Andrew Jeffery
 <andrew@aj.id.au>, Neeraj Ladkani <neladk@microsoft.com>
Subject: Re: nvme sensors
Thread-Topic: nvme sensors
Thread-Index: AQHWEx5rEqsJqc4WEEC8M3OzxbfV76h5pxOAgADRXfD//5lHAIAAmM4QgABf84CAAOO4gIABvMyA//+T+QA=
Date: Fri, 17 Apr 2020 19:20:37 +0000
Message-ID: <21A0304D-2141-4A43-B636-E6E200DB9613@fb.com>
References: <0F332F74-FF51-4239-8B52-2EBA770AE6CC@fb.com>
 <8022481D-7C72-4A7B-AF9C-D144177B4C88@fb.com>
 <CH2PR21MB1510E11F9772C45D12EEA0F1C8DB0@CH2PR21MB1510.namprd21.prod.outlook.com>
 <82E67AAA-1BD8-41D8-BE27-966F840236E2@fb.com>
 <CH2PR21MB1510AEF844D82AC9D897B902C8DB0@CH2PR21MB1510.namprd21.prod.outlook.com>
 <4770a42d-d012-4e95-9347-d5c287c2e288@www.fastmail.com>
 <5CD00373-FD92-4E57-90C5-21FB8AD6DD25@fb.com>
 <954154ef-14f8-69fd-677b-e414cbdb0ae2@linux.intel.com>
In-Reply-To: <954154ef-14f8-69fd-677b-e414cbdb0ae2@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:6798]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e6ea1228-89b2-4ba5-cc7f-08d7e3046947
x-ms-traffictypediagnostic: BYAPR15MB2806:
x-microsoft-antispam-prvs: <BYAPR15MB2806D8964E95D756C3F5F40CDDD90@BYAPR15MB2806.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0376ECF4DD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(396003)(39860400002)(376002)(346002)(366004)(136003)(478600001)(71200400001)(86362001)(76116006)(4326008)(4744005)(91956017)(8676002)(81156014)(8936002)(6512007)(36756003)(3480700007)(2906002)(186003)(110136005)(33656002)(316002)(2616005)(7116003)(66476007)(6486002)(53546011)(66446008)(64756008)(6506007)(66556008)(66946007)(5660300002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a0axHGlb0GcaLMVoiDeqRfbVxY3FflYA6GeG1biGOQyGvC4Zis9N/evoWrfGAgNoI9FsrGUaH5qly2+bMuBw5pRDNO8L/Yp7DS7k1y4wTJyK6WRwstepp2Afj1izOiqM70QF5k6ftpzC/h37pkUxNSCWk1yNxnKJbOBp7hOKFCYde0RIF+e8bVYn9nuoLDGnlhRMNXA14fqajVTj7bnr9xSaIp6BDQx5HRF268c+yHIaqnsB5mEaQ7KA1zrXzaiqVyrORxZks3Pa/115KvPpwo8/hPKDw9CIYBNGaLrdJX9SXapxQuU/kGRy8vIg2e3AleJqk0aaj4XvO8jOtfM6Z1XccuWPjZsaAzmjFkTfVwQ55Cy6i/b7HmPZNpo4S320HofBVi8COi/lARmpRsb4uOduEEJfn+JCQ0s6+CjKTz6HnpQU2FHXCFTCa7w/MGDG
x-ms-exchange-antispam-messagedata: bf9veFMTFkXrBXAJs38uTdINn9rHHe+JuUO6Ppy+PIzZTqLJS6GJKoi4NUaSesqr81YDjjE+IjGjtgEkfEoE+EUBwCZeXYNSlFf/0yaIhTsF7YEyOxqJqSFGoYxve0ub2qoKLWHS5DVZZ9ZD1MJrKZ55E/wS2dAyzZ1135s3VjvMmKbz+CzQf7wdo6BTcxJS
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A3AB7F8DCAF6F43968CDA3F83F37DD6@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ea1228-89b2-4ba5-cc7f-08d7e3046947
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2020 19:20:38.0033 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UkGO2VnS/vZZzejvywlWqKzg4y0ULnK1iPY8vyswlQLnFllrvj/WbU3xwwZqQM967EN9ROmxraIVC3b+3UTSZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2806
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-17_09:2020-04-17,
 2020-04-17 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDQvMTcvMjAsIDExOjQ3IEFNLCAiSmFtZXMgRmVpc3QiIDxqYW1lcy5mZWlzdEBs
aW51eC5pbnRlbC5jb20+IHdyb3RlOg0KDQogICAgT24gNC8xNi8yMDIwIDQ6MTUgUE0sIFZpamF5
IEtoZW1rYSB3cm90ZToNCiAgICA+IEN1cnJlbnRseSwgZGJ1cy1zZW5zb3JzIHN1cHBvcnQgcmVh
ZGluZyBOVk1FIHNlbnNvcnMgdmlhIG1jdHAgb25seS4gSXQgdXNlcw0KICAgID4gbGlibWN0cCBh
bmQgc29tZSBvZiBzbWJ1cyBwYXRjaCBmcm9tIEludGVsLiBJdCBhbHNvIHVzZXMgc2xhdmUgbXF1
ZXVlIG1jdHANCiAgICA+IGtlcm5lbCBkcml2ZXIgd2hpY2ggaXMgbm90IHVwc3RyZWFtLg0KICAg
ID4gDQogICAgPiBTbyBjdXJyZW50bHkgaXQgaXMgbm90IG1hdHVyZWQgYW5kIGZ1bGx5IHVwc3Ry
ZWFtZWQuDQogICAgPiANCiAgICA+IEphbWVzLCBob3cgY2FuIHdlIHVzZSB0aGlzIHdpdGhvdXQg
bWN0cC4gSSBkb24ndCBzZWUgYW55IG5vbiBtY3RwIHN1cHBvcnQgbGlrZQ0KICAgID4gU2VuZGlu
ZyBkaXJlY3Qgc21idXMgY29tbWFuZCwgcGxlYXNlIGFkdmlzZSBpZiBJIG1pc3NlZCBpdC4NCiAg
ICANCiAgICBDdXJyZW50bHkgaXQgb25seSBzdXBwb3J0cyBNQ1RQLiBTaG91bGQgYmUgZWFzeSB0
byBjaGFuZ2UgaXQgdG8gc3VwcG9ydCANCiAgICBib3RoIHdpdGggc29tZSBmbGFnIGlmIHlvdSBy
ZXF1aXJlIGl0Lg0KDQpUaGFua3MgSmFtZXMsIEkgd2lsbCBsb29rIGludG8gY2hhbmdlIGFzIGl0
IGRvZXNu4oCZdCBldmVuIGJ1aWxkIGN1cnJlbnRseSB3aXRoIGxpYm1jdHAgZGVwZW5kZW5jeSBh
bmQNCkludGVsJ3MgcGF0Y2guIEkgd2lsbCBzZWUgaG93IGNhbiBpdCBiZSBtb2RpZmllZCBub3Qg
dG8gbGluayBtY3RwIGJhc2VkIG9uIGNvbmZpZy4NCiAgICANCiAgICA+IA0KICAgID4gUmVnYXJk
cw0KICAgID4gLVZpamF5DQogICAgPiAgICAgIA0KICAgID4gDQogICAgDQoNCg==
