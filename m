Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF17250BEE
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 00:54:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bb6r942G5zDqQf
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 08:54:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=550569eddf=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=L5ngT9Sw; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=eIEcnCR0; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bb6nv6xP7zDqRM
 for <openbmc@lists.ozlabs.org>; Tue, 25 Aug 2020 08:52:16 +1000 (AEST)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07OMiSeu027822; Mon, 24 Aug 2020 15:52:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=DEj0HikQsgYj9JxLNWJEMpPGuEKJpFAMtvc8njfQ1ug=;
 b=L5ngT9Sw842uk2hakDPsqFttfsiqhm1wUzXU+k3NCOWmAlETFKfUQ5nji7+IPBVq+uN/
 Th1IjGhDo5Qy/pbo5owBkQ0PB2VPaVDi7G4qJnX+f+hIFmYJQhK4aAk4VK+nlAab/vya
 ynUF/UjnoXdjJNo+RTqVjyBQmlX6h2otSQ4= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 333kmmyh3n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 24 Aug 2020 15:52:13 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.101) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 24 Aug 2020 15:52:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gdc1q30Ke4c2FhtRwxwmFGL48uwfBp3YLKrhmGDTjWWiELc/1hP9Yb5HhZMYRQG2M1k0t3EBFEpu0J3uUlRlAANktPp5wA5OeRdShauxCC+Tl+DB7JdEgneSa8eddAuCW7qoWO1zu4e9sPRxjrScOKqo53A3DmGiI85MiuisfkxJKvAZz2VDDKvpMtLPSMenHGsazQMVyfrL9udM9k7Um8phSH1QWEZ+2VTkNSOozjpwKdZV6TY3bSFLyKwfW0COwcs8iFzwS9xQFoxokPDTaE+wZMEkc7MrPdhNwtnFHRk0sM9FEXdGP5Q9J/IBgz+g/Pz8OLI5CyYwpdPgDppO6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEj0HikQsgYj9JxLNWJEMpPGuEKJpFAMtvc8njfQ1ug=;
 b=Y2m5wJ7wcPM4vksqoSYUtwA/219g++LtdbdCw8zvZyFiLzFI+PoBd+jnY8wC58lTVmFMjOozNsW4/geLaumgE1vbRLh4FnVoP0ijc7P9+A76sCYp/e2A4UGuYChSq/ZFupuPlr5a3T4/Z0COWthhip8ur4zqAhDepTwMpm+8UlISa+51Jq9hnY4mci0H5e2AKPRu3AZssrb5jvrXBT/3Uy/wr4ImlI6mdNYs0T0l0wD9EXN6cN6FCb6adIVzvmhckJInye9D2NiVkvcsb8CKdnXn6v25Wk3HPdj4GGoLIEGHNK3CTytDaUzl2/l8pDFbzQufs7kAvG+3mbLy9uzpHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEj0HikQsgYj9JxLNWJEMpPGuEKJpFAMtvc8njfQ1ug=;
 b=eIEcnCR0cuxQVdixY8FydmOFxtoaohOgwWyFrlT7oLMYI2KS1cy63NkSYmJLh47DyjW1pldAUGnXo+Gc3kp8gPp0za+yY/fw9Nd4HQf1bmUFIll5LPi69ws6lQYklR1QIcBCYYZaaeQpPRnn/Pf3oY1+TYyJnFDu0xjuItjigYw=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB3048.namprd15.prod.outlook.com (2603:10b6:a03:fc::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Mon, 24 Aug
 2020 22:52:10 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::2908:ebc2:73a5:45b3]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::2908:ebc2:73a5:45b3%5]) with mapi id 15.20.3305.026; Mon, 24 Aug 2020
 22:52:10 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Bruce Mitchell <Bruce_Mitchell@phoenix.com>, Neil Bradley
 <Neil_Bradley@phoenix.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Tioga Pass OpenBMC 2.8
Thread-Topic: Tioga Pass OpenBMC 2.8
Thread-Index: AdZ4G9/pZ44Ttxs7TiCWRTJU7JTTHQCHCA1A///tC4A=
Date: Mon, 24 Aug 2020 22:52:10 +0000
Message-ID: <FB7166EF-0F80-4F40-8C3F-1127A9054CC8@fb.com>
References: <c27c916296c14b7a973ce10ce462a574@SCL-EXCHMB-13.phoenix.com>
 <9b882b4043804f8bb619f46e94f7e237@SCL-EXCHMB-13.phoenix.com>
In-Reply-To: <9b882b4043804f8bb619f46e94f7e237@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: phoenix.com; dkim=none (message not signed)
 header.d=none;phoenix.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2601:647:4b00:fd70:18e2:66b5:5e3d:3d1a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae50e0cf-ac31-4158-af07-08d8488055ba
x-ms-traffictypediagnostic: BYAPR15MB3048:
x-microsoft-antispam-prvs: <BYAPR15MB3048A41A692E05D40FBB036DDD560@BYAPR15MB3048.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eRoFSXaOl8wpP/Znlkf55sBm4e6iLSMXnf2xe7ftbO7qGcsrXxiHW8fHD6Zdj2C2fGGbv/DEl0qG0LWHNly4D7mX6nlM9M3Rcz8l760xpj/lBvYkhvBvYc1AanssFl5YSEY0wW9UiGYyGuM/0/Wj4DvyJGtXpcIsqWbjYBW09LghQqMN1ok9Yj8CvZDl6MjHAYjF1cGqEhC4mu3cn2XgbkEZFaUtbueumYLH87aSeeEj4ArpVbOk8hGScLAskV9p9nK6S2jRcqgB9zr7GJhpmQpnlgkwOMHQlGz3QxwUxeFqtoYi0TXT1VIZgBLb/bhkaIuzU2rWs4bPcA5ovDh5QVXcE/tfnHh2YiyvCoh/O4uJVVq8wiXusuztVmDriKZRvMvBgRFhEQe8T08RyMpIgw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(376002)(396003)(39860400002)(346002)(8936002)(110136005)(2906002)(36756003)(186003)(7116003)(6512007)(66556008)(66476007)(76116006)(2616005)(6486002)(6506007)(71200400001)(33656002)(86362001)(53546011)(8676002)(5660300002)(66446008)(66946007)(478600001)(64756008)(4326008)(316002)(83380400001)(966005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: QEBKlg1FmSH7zyYUcFjMoOBXBbH9vD/nhyb5MnvLzTO7G3fAFBaSec1u5fOKt2rxYoQDfasS7hbtFutUrY4XMkY4vUg2RAmk2QNaoLme55wfFMrzN1d6iEhJ2e1ZEXm6bn3PjTsYydo74hA0nz+eoobogxS3FvShWV3mz+5gkjv5uzzqBWHXEfKcTOtonXFDMPH9iMm+2no6Mx6s0Z2JxrNdfggjkTkKqWvhkmz1zUTX8YlmOsduMm7uH2IwcWHfsKmVkagFPkmsJn+86XgsNgAceQqPJh2hOIEFeI8GKWdGhh6bJsOHM2ZAuQPaweS++/G5sczbyG010SbcJnGe/Y34nIygBE6RLQjYLsK99JXxnwMYiGgTg/WT3q59CcL8n6N6UUpnh3IUxCoQsV5mCgp+D8yG4Xpy69anX7so1Y2jV7kWiccQLrabltFBhON+6TMvGfHZKzekSMg8MUf+D5WvDEfzG1y5RgGxxmM4+FjXlVCppB6os+AUoITKH2CP4PWTcmPPEe2BbzK24YqRjWECV+r6hTis39hdz2/FDGNuD0PRSMiZ+AqBkOupKbQTsh0peay6hIKZCHj8w9ntiAvYPaGcGM7WZ7TfG392LiqA0tBdL+pukVhWzifPFiEW47L7yxY2+rZ5iZ3be7laitZn++lBF02IUjsu44Z9HdQckpNUM9LNzCVFfM4corW489liVCdE7LfxwUzb1yr2JA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <ABCC8149FC86F745BDF9596A705A27CB@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae50e0cf-ac31-4158-af07-08d8488055ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2020 22:52:10.2797 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uX5IFti7ZHu3M3khnb5n92t0c8qe39iJI4o0S8XQjevvGSUc597Pl6hBLkVVpPHlWqxBnZE4RRpX5owSm+sSKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3048
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-24_12:2020-08-24,
 2020-08-24 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008240179
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
Cc: Patrick Voelker <Patrick_Voelker@phoenix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQnJ1Y2UsDQpXaGF0IE5DU0kgaXNzdWVzIHlvdSBhcmUgZmFjaW5nLCBrZXJuZWwgbWVzc2Fn
ZXMgbWVudGlvbmVkIGJlbG93IGFyZSBpbml0aWFsIGxvZyB3aGVuIG5jc2kgY29uZmlndXJhdGlv
biBjb21wbGV0ZXMgYnV0IGl0IGRvZXNuJ3QgY3JlYXRlIGFueSBpc3N1ZXMgaW4gZnVuY3Rpb25p
bmcgb2YgTkNTSS4gSXMgeW91ciBuZXR3b3JrIHdvcmtpbmc/IE9yIGFyZSB5b3UgZmFjaW5nIGFu
eXRoaW5nIHdpdGggTkNTSS4gWW91IGRvbid0IG5lZWQgYW55dGhpbmcgZm9yIE5DU0kgbWFuYWdl
bWVudCBpZiB5b3UgYXJlIGp1c3QgdXNpbmcgYXMgbmV0d29yayBjYXJkIGFuZCBub3QgZG9pbmcg
YW55IE5DU0kgbWFuYWdlbWVudCBmcm9tIGFwcGxpY2F0aW9uLiBOZXR3b3JrIHdvcmtzIHBlcmZl
Y3RseSBmb3IgaXB2NCBhbmQgaXB2NiBzZWFtbGVzc2x5IHNpbmNlIDEgeWVhci4NCg0KUGxlYXNl
IGxldCBtZSBrbm93IGFjdHVhbCBpc3N1ZXMgeW91IGFyZSBmYWNpbmcsIEkgd2lsbCB0cnkgdG8g
Zml4IGl0LiANCg0KUmVnYXJkcw0KLVZpamF5IA0KDQrvu79PbiA4LzI0LzIwLCAyOjE3IFBNLCAi
b3BlbmJtYyBvbiBiZWhhbGYgb2YgQnJ1Y2UgTWl0Y2hlbGwiIDxvcGVuYm1jLWJvdW5jZXMrdmlq
YXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFicy5vcmcgb24gYmVoYWxmIG9mIEJydWNlX01pdGNo
ZWxsQHBob2VuaXguY29tPiB3cm90ZToNCg0KICAgIEluIGFkZGl0aW9uIHRvIHdoYXQgTmVpbCBo
YXMgYXNrIEkgYW0gZmluZCB0aGlzIGlzc3VlIHdpdGggTkMtU0k6DQoNCiAgICBZZXQgQmVuIFdl
aSdzIE9TRkMgMjAxOSAiTklDIE1hbmFnZW1lbnQgYW5kIE1vbml0b3JpbmcgaW4gT3BlbkJNQyIg
DQogICAgbGVhZHMgbWUgdG8gYmVsaWV2ZSB0aGF0IE5DLVNJIHNob3VsZCBiZSBpbiBteSBpbWFn
ZSBhbmQgZnVuY3Rpb25pbmcuDQogICAgSGFzIHNvbWV0aGluZyBjaGFuZ2VkIHNpbmNlIEJlbidz
IHBhcGVyPw0KDQogICAgcm9vdEB0aW9nYXBhc3M6fiMNCiAgICByb290QHRpb2dhcGFzczp+IyB1
bmFtZSAtYQ0KICAgIExpbnV4IHRpb2dhcGFzcyA1LjQuMzktMzAwNzlkNiAjMSBGcmkgQXVnIDIx
IDE3OjE0OjIyIFVUQyAyMDIwIGFybXY2bCBHTlUvTGludXgNCiAgICByb290QHRpb2dhcGFzczp+
IyBjYXQgL3Byb2MvdmVyc2lvbg0KICAgIExpbnV4IHZlcnNpb24gNS40LjM5LTMwMDc5ZDYgKG9l
LXVzZXJAb2UtaG9zdCkgKGdjYyB2ZXJzaW9uIDkuMy4wIChHQ0MpKSAjMSBGcmkgQXVnIDIxIDE3
OjE0OjIyIFVUQyAyMDIwDQogICAgcm9vdEB0aW9nYXBhc3M6fiMgY2F0IC9wcm9jL3N5cy9rZXJu
ZWwvdmVyc2lvbg0KICAgICMxIEZyaSBBdWcgMjEgMTc6MTQ6MjIgVVRDIDIwMjANCiAgICByb290
QHRpb2dhcGFzczp+IyBjYXQgL2V0Yy9vcy1yZWxlYXNlDQogICAgSUQ9b3BlbmJtYy1waG9zcGhv
cg0KICAgIE5BTUU9IlBob3NwaG9yIE9wZW5CTUMgKFBob3NwaG9yIE9wZW5CTUMgUHJvamVjdCBS
ZWZlcmVuY2UgRGlzdHJvKSINCiAgICBWRVJTSU9OPSJ2MDAuMDAwLjAwMC00NSINCiAgICBWRVJT
SU9OX0lEPXYwMC4wMDAuMDAwLTQ1LWc2NDVmNWNjMDgNCiAgICBQUkVUVFlfTkFNRT0iUGhvc3Bo
b3IgT3BlbkJNQyAoUGhvc3Bob3IgT3BlbkJNQyBQcm9qZWN0IFJlZmVyZW5jZSBEaXN0cm8pIHYw
MC4wMDAuMDAwLTQ1Ig0KICAgIEJVSUxEX0lEPSJ2MDAuMDAwLjAwMCINCiAgICBPUEVOQk1DX1RB
UkdFVF9NQUNISU5FPSJ0aW9nYXBhc3MiDQogICAgcm9vdEB0aW9nYXBhc3M6fiMgZG1lc2cgfCBn
cmVwIC1pIG5jc2kNCiAgICBbICAgIDEuODU0OTM5XSBmdGdtYWMxMDAgMWU2NjAwMDAuZXRoZXJu
ZXQ6IFVzaW5nIE5DU0kgaW50ZXJmYWNlDQogICAgWyAgIDE3LjgzMTgyN10gZnRnbWFjMTAwIDFl
NjYwMDAwLmV0aGVybmV0IGV0aDA6IE5DU0k6IEhhbmRsZXIgZm9yIHBhY2tldCB0eXBlIDB4ODIg
cmV0dXJuZWQgLTE5DQogICAgWyAgIDMzLjUyNjk1MF0gZnRnbWFjMTAwIDFlNjYwMDAwLmV0aGVy
bmV0IGV0aDA6IE5DU0k6ICdiYWQnIHBhY2tldCBpZ25vcmVkIGZvciB0eXBlIDB4OGINCiAgICBb
ICAgMzMuNTM1NTY0XSBmdGdtYWMxMDAgMWU2NjAwMDAuZXRoZXJuZXQgZXRoMDogTkNTSTogJ2Jh
ZCcgcGFja2V0IGlnbm9yZWQgZm9yIHR5cGUgMHg4Yg0KICAgIFsgICAzMy41NDM4MTNdIGZ0Z21h
YzEwMCAxZTY2MDAwMC5ldGhlcm5ldCBldGgwOiBOQ1NJOiAnYmFkJyBwYWNrZXQgaWdub3JlZCBm
b3IgdHlwZSAweDhiDQogICAgWyAgIDMzLjU1NDM0NV0gZnRnbWFjMTAwIDFlNjYwMDAwLmV0aGVy
bmV0IGV0aDA6IE5DU0k6ICdiYWQnIHBhY2tldCBpZ25vcmVkIGZvciB0eXBlIDB4OGINCiAgICBb
ICAgMzMuNTYyNTk4XSBmdGdtYWMxMDAgMWU2NjAwMDAuZXRoZXJuZXQgZXRoMDogTkNTSTogJ2Jh
ZCcgcGFja2V0IGlnbm9yZWQgZm9yIHR5cGUgMHg4Yg0KICAgIFsgICAzMy41NzA5NThdIGZ0Z21h
YzEwMCAxZTY2MDAwMC5ldGhlcm5ldCBldGgwOiBOQ1NJOiAnYmFkJyBwYWNrZXQgaWdub3JlZCBm
b3IgdHlwZSAweDhiDQogICAgWyAgIDMzLjYxMjkzNl0gZnRnbWFjMTAwIDFlNjYwMDAwLmV0aGVy
bmV0IGV0aDA6IE5DU0k6ICdiYWQnIHBhY2tldCBpZ25vcmVkIGZvciB0eXBlIDB4OGINCiAgICBb
ICAgMzMuNjI5MzE4XSBmdGdtYWMxMDAgMWU2NjAwMDAuZXRoZXJuZXQgZXRoMDogTkNTSTogJ2Jh
ZCcgcGFja2V0IGlnbm9yZWQgZm9yIHR5cGUgMHg4Yg0KICAgIFsgICAzMy42Mzg2ODNdIGZ0Z21h
YzEwMCAxZTY2MDAwMC5ldGhlcm5ldCBldGgwOiBOQ1NJOiAnYmFkJyBwYWNrZXQgaWdub3JlZCBm
b3IgdHlwZSAweDhiDQogICAgWyAgIDMzLjY0Nzk3OF0gZnRnbWFjMTAwIDFlNjYwMDAwLmV0aGVy
bmV0IGV0aDA6IE5DU0k6ICdiYWQnIHBhY2tldCBpZ25vcmVkIGZvciB0eXBlIDB4OGINCiAgICBb
ICAgMzMuNjU3MjkxXSBmdGdtYWMxMDAgMWU2NjAwMDAuZXRoZXJuZXQgZXRoMDogTkNTSTogJ2Jh
ZCcgcGFja2V0IGlnbm9yZWQgZm9yIHR5cGUgMHg4Yg0KICAgIFsgICAzMy42NjU2OTBdIGZ0Z21h
YzEwMCAxZTY2MDAwMC5ldGhlcm5ldCBldGgwOiBOQ1NJOiAnYmFkJyBwYWNrZXQgaWdub3JlZCBm
b3IgdHlwZSAweDhiDQogICAgWyAgIDMzLjY3Mzk1Nl0gZnRnbWFjMTAwIDFlNjYwMDAwLmV0aGVy
bmV0IGV0aDA6IE5DU0k6ICdiYWQnIHBhY2tldCBpZ25vcmVkIGZvciB0eXBlIDB4OGINCiAgICBb
ICAgMzMuNjgyMzgxXSBmdGdtYWMxMDAgMWU2NjAwMDAuZXRoZXJuZXQgZXRoMDogTkNTSTogJ2Jh
ZCcgcGFja2V0IGlnbm9yZWQgZm9yIHR5cGUgMHg4Yg0KICAgIFsgICAzMy42OTA3OTJdIGZ0Z21h
YzEwMCAxZTY2MDAwMC5ldGhlcm5ldCBldGgwOiBOQ1NJOiAnYmFkJyBwYWNrZXQgaWdub3JlZCBm
b3IgdHlwZSAweDhiDQogICAgcm9vdEB0aW9nYXBhc3M6fiMNCg0KICAgIEZyb206IE5laWwgQnJh
ZGxleSANCiAgICBTZW50OiBGcmlkYXksIEF1Z3VzdCAyMSwgMjAyMCAxODozNg0KICAgIFRvOiBv
cGVuYm1jQGxpc3RzLm96bGFicy5vcmcNCiAgICBDYzogQnJ1Y2UgTWl0Y2hlbGw7IFBhdHJpY2sg
Vm9lbGtlcg0KICAgIFN1YmplY3Q6IFRpb2dhIFBhc3MgT3BlbkJNQyAyLjgNCg0KICAgIEdyZWV0
aW5ncyBmZWxsb3cgQk1DIGZvbGsgPyBJ4oCZbSBOZWlsIEJyYWRsZXksIFBob2VuaXggVGVjaG5v
bG9naWVz4oCZIEJNQyBhcmNoaXRlY3QgYW5kIGhhdmUgYSBxdWVzdGlvbiBmb3IgdGhlIGdyb3Vw
Lg0KDQogICAgV2UgYXJlIGF0dGVtcHRpbmcgdG8gbG9hZCBPcGVuQk1DIDIuOCBvbiBhIFRpb2dh
IFBhc3MuIFRoaXMgaXMgd2hhdCB3ZSBkaWQ6DQoNCiAgICBta2RpciB0aW9nYXBhc3MNCiAgICBj
ZCB0aW9nYXBhc3MNCiAgICBnaXQgY2xvbmUgaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3Bl
bmJtYy5naXQNCiAgICBjZCBvcGVuYm1jDQogICAgZ2l0IGNoZWNrb3V0IDM1YTc3NDIwMDk5OWFj
MmZjYTQ4NjkzYzFjMTY5YmY5OWQyZjYzZWENCiAgICBleHBvcnQgVEVNUExBVEVDT05GPW1ldGEt
ZmFjZWJvb2svbWV0YS10aW9nYXBhc3MvY29uZg0KICAgIHNvdXJjZSBvcGVuYm1jLWVudg0KICAg
IGJpdGJha2Ugb2JtYy1waG9zcGhvci1pbWFnZQ0KDQogICAgVGhlIEJNQyBkb2VzIGJvb3QgZnVs
bHksIGhvd2V2ZXIgdGhlcmUgYXJlIHR3byBtYWpvciBwcm9ibGVtcyB3ZeKAmXZlIGVuY291bnRl
cmVkOg0KDQogICAgMS4gSG9zdCB3aWxsIG5vdCBwb3dlciBvbiB2aWEgdGhlIGZyb250IHBhbmVs
IHBvd2VyIGJ1dHRvbg0KICAgIDIuIEJNQyBXaWxsIG5vdCBvYnRhaW4gb3IgdHJ5IERIQ1AgZXZl
biB0aG91Z2ggaXRzIHNldCBlbmFibGVkIGZvciB0aGUgcHJpbWFyeSBMQU4gY2hhbm5lbA0KDQog
ICAgSSBoYXZlIGEgY291cGxlIG9mIHF1ZXN0aW9uczoNCg0KICAgIDEuIFdhcyB0aGlzIGJ1aWx0
L2RvbmUgY29ycmVjdGx5PyBJbiBvdGhlciB3b3JkcywgZGlkIEkgZG8gc29tZXRoaW5nIHdyb25n
IGluIHRoaXMgcHJvY2Vzcz8NCiAgICAyLiBEb2VzIGFueW9uZSBrbm93IHRoZSBjdXJyZW50IHN0
YXRlIG9mIFRpb2dhIFBhc3Mgc3VwcG9ydCBpbiAyLjggb3IgdGhlIGdlbmVyYWwgaGVhbHRoIHRo
ZXJlaW4/DQoNCiAgICBXZeKAmXJlIGNvbWluZyB1cCB0byBzcGVlZCBvbiB0aGlzIHF1aWNrbHks
IHNvIGFwb2xvZ2llcyBpZiB0aGVzZSBhcmUgc3R1cGlkIHF1ZXN0aW9ucy4gQW5kIGdyZWV0aW5n
cyENCg0KICAgIOKGkk5laWwNCg0KDQo=
