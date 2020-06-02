Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 176FF1EC3F7
	for <lists+openbmc@lfdr.de>; Tue,  2 Jun 2020 22:46:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49c3xS0Qr0zDqLr
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 06:46:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=3422c753b8=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=eNkHQ6p0; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=GmfnqSy/; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49c3wX1Vf7zDqLn
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jun 2020 06:45:56 +1000 (AEST)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 052KZH0F005688; Tue, 2 Jun 2020 13:45:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=yNg+BO6uhWmP2/ZfS+S1h6u2xriQlIIh8fSxnhIxN9M=;
 b=eNkHQ6p0/FVCHzQx6u3JtQAdTQDDGBmGsF8wyHk2Xo0iImcIg/BYGniHDjr0FVtt6j5u
 ZScMcZnmKEDn8IYaLDrKSXfXkDH3Vbq5vrcl8Nn7mmrgSzEh6iRw+Fv4WYB6ujUFlnJK
 ER7fYv/xsOfTJ546G5AIE/E4Hc1yQyqHMpk= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 31bnag35fm-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 02 Jun 2020 13:45:53 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 2 Jun 2020 13:45:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zz62NEivAGK+3H++yXtS2jO3SEtdjre27avhLihUgndMiV9QKhbynwEd6lWGrlUp2nXvKEYy9GwUwxcOF8dnMaP5Ym56/gwJLeVozW999dHfFIn2wRbdbK9DQpLbxpjqHqzU4jPMuOO2PTeJIm/MbiI6HZpwXhtpQPGkLFEZfxr9TfZFqnRtxfcjpb+Z/vowARKuzE5/d0TCMU4qYCVbANGAnpAFZxmN0J1RtRuVBWugTYIsbsWzOBUXzlsB7Q+WPhCqI7hvak32iKeuPIvIUl8qlfeQR7+b7VtKAA78dS2PeMYnkJFhaJ7hlS9YjFagbIpXX/pLNpq8MDIh0nZ71w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNg+BO6uhWmP2/ZfS+S1h6u2xriQlIIh8fSxnhIxN9M=;
 b=en1AJeyGYMq5QAJfISh+3xHT40FkUOGRcf6QmMLOR61jG6l++Q/T8cNb5BLZxfwI8MTCUAaiNsNjAhLViQFBkiFRke96zamir0TciyJQtIWNSxf0raXhHfyk2lBEUnwNd/xoYjJl5JQlgAuin5OKYVkM3fkDF7uaQAICVWx0EZqbzScxY8sIUJ2/nKzz7qaakfxd310q73CVR3eOJusH9ik+t6CRunRhuudsv8Uv2gHOkdIsZn/YKmtgp9TLPXcAIQxkdLz9vgm2RysiSfLSBqkaAcX04EU3gH7Q7mVYv0UHMmwKzWePr6HQz5L8bQMF/qsd3p7AGW+BOi3y/sspzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNg+BO6uhWmP2/ZfS+S1h6u2xriQlIIh8fSxnhIxN9M=;
 b=GmfnqSy//qtL1CK9CAEgRqjEOgPBiJzmLCGqur+9ArO96UnRybGO5pTrskNKP73ObY6WzkS+piTN3tzcxI/pYwAgUpM8sipWqe/UWjJNl92BTnwsZPBcso0ymrnxUMsVIDCaDD+c6KXCjPEt8hZKCU+TSLADV4Yc5RM3g2mUTls=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB3462.namprd15.prod.outlook.com (2603:10b6:a03:112::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Tue, 2 Jun
 2020 20:45:50 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::34b8:e690:6dfc:8faf]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::34b8:e690:6dfc:8faf%4]) with mapi id 15.20.3045.022; Tue, 2 Jun 2020
 20:45:50 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: krtaylor <kurt.r.taylor@gmail.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC 2.8 Release
Thread-Topic: OpenBMC 2.8 Release
Thread-Index: AQHWHj7da2d2Jv61wkuIdp56cEZ7MaiQUvuAgAcWCwCAABVVgIAuZ2WA//+mAgA=
Date: Tue, 2 Jun 2020 20:45:50 +0000
Message-ID: <42C59FC0-DBD8-4D1E-95D2-5EA20B3E9141@fb.com>
References: <CAG5Oiwj+-OnkPMc+dfeo0P=MfREPz_7E+zBaMaYy6AHMLO+BxA@mail.gmail.com>
 <f44ba049-2678-c34e-4906-5ce0b9d416d3@linux.vnet.ibm.com>
 <6458b8d3-d460-40c0-9573-fa970cc8fd47@www.fastmail.com>
 <588ffcf2-f766-952c-1ab3-da271d84516f@linux.vnet.ibm.com>
 <7075cca2-eaf0-786b-6ebc-1dad163c5d0c@gmail.com>
In-Reply-To: <7075cca2-eaf0-786b-6ebc-1dad163c5d0c@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2601:647:4b00:fd70:18e2:66b5:5e3d:3d1a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c7ff5988-534a-407d-cddf-08d80735ef8c
x-ms-traffictypediagnostic: BYAPR15MB3462:
x-microsoft-antispam-prvs: <BYAPR15MB3462E0D7E5CC8D6211786075DD8B0@BYAPR15MB3462.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0422860ED4
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r2wPLTox5Ec+JKSzuBO/xTWBQ/bd4DRyENam7kYgA3HPyFH3YPlSaVURv8+bUx66jCz07Krzoj7ildv9SX81Z8Doz/01eXfzy9ax67TqjS69I9qKXPrmz+aYMgPtJYIAPzv+isOMkTkX/MfpexYtQZw5ly43ynyQmpCuaKeInoraV/tv1XCDca2Arx9fy1foNDSLrSMVIjIUaYpU6wLnEACQUXqCVcqzQw6S9hTJ11Bp4AqZXvYkriCgS8kyoTyYOkzsczsW4DkncTr2u0tLmKPbs40SkrCnO8fRx/JoxSVFGW8KCpFrMN+asFBykHZPqFgsjbQX/Uq5TJtaENhP5UqF+bfphHMmPLIQ24c5LoMqhoBOHkdlaigCgKMAvvDQPn+LOac2EkXg2yn804M5gQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(39860400002)(396003)(346002)(136003)(376002)(5660300002)(186003)(53546011)(6506007)(110136005)(316002)(8676002)(8936002)(83380400001)(2616005)(86362001)(7116003)(6486002)(6512007)(2906002)(71200400001)(36756003)(66476007)(33656002)(66556008)(64756008)(66446008)(478600001)(966005)(76116006)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 9rCNLY8gNV12DJGCd/8SS/i1s94zjfFLq8jqwWKLVEi9I5tZ0csFp4jRvWtZlK7ph/eTspk5TT3KSgCV4Fy3izeVb4e8+dC7WKlD2ozj6WRtgMTxBLLA8Q8R/54JlPdKKN/L+7O7/17Q2/hY7W76GbP90rMPL4SBhXPbRncfiG4eyQ9cLMrRZvIbLrhroyNEpKvH39utRUpkbTUZ79vWjRX2JkjViePKGBFbJtubMHJ5UQ1IItZahtcKAYSdHrcW3OCdkXjhw2D0kHGDAi0MR9q1/kNvdvM8vZvMYcAWLQsKbliURnZjVzXxbHRUBJ/QPKDzQkbYBm3c4LrDlIQfm+lNdSN/BS+Ct8nl0YLCGirDSMEd+rhBS1iq/0y4p52SaUdQlmRNoy/fiJzQM9fKP3imRZ9yD5UsIci+Nltm3nhnp0IhrlMmDX33E3z8ie2GSQMJ7DDhUAChGmXZ5CpFeKnC+iuBL4Z1noDfaZZkuxIF33wQK+ygo3Frf5H7ryPlxL6Bdpf98IW2aCDLMTz8K4Z7rt5U3qpqSRyJNCiftwpeUBtXYrmk+O4W5muLPJbx
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9D25BD66AF7E64EBE26858E600AFD30@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c7ff5988-534a-407d-cddf-08d80735ef8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2020 20:45:50.5389 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XIhjvtBqm4Iz2EMIcBpUddI1z4gVw9tzzhcy2WFRcCuRnB//vQ5reRA+35cgNffA+3hPmiXGKJ0neajPEi8i6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3462
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-02_14:2020-06-02,
 2020-06-02 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 bulkscore=0 clxscore=1015
 phishscore=0 suspectscore=0 adultscore=0 mlxscore=0 spamscore=0
 cotscore=-2147483648 priorityscore=1501 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006020150
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

SSB3aWxsIG1hcmsgdGhpcyBodHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6LyMvYy9v
cGVuYm1jL3g4Ni1wb3dlci1jb250cm9sLysvMzI4NTIvIGFzIGFibG9ja2VyIGJlY2F1c2UgZmFu
IGNvbnRyb2xsZXIgaXMgbm90IHN0YXJ0aW5nLg0KDQrvu79PbiA2LzIvMjAsIDEyOjE1IFBNLCAi
b3BlbmJtYyBvbiBiZWhhbGYgb2Yga3J0YXlsb3IiIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVt
a2E9ZmIuY29tQGxpc3RzLm96bGFicy5vcmcgb24gYmVoYWxmIG9mIGt1cnQuci50YXlsb3JAZ21h
aWwuY29tPiB3cm90ZToNCg0KICAgIE9uIDUvNC8yMCAxOjI5IEFNLCBEZWVwYWsgS29kaWhhbGxp
IHdyb3RlOg0KICAgID4gT24gMDQvMDUvMjAgMTA6NDMgYW0sIEFuZHJldyBKZWZmZXJ5IHdyb3Rl
Og0KICAgID4+DQogICAgPj4NCiAgICA+PiBPbiBUaHUsIDMwIEFwciAyMDIwLCBhdCAwMjozMCwg
R3VubmFyIE1pbGxzIHdyb3RlOg0KICAgID4+PiBPbiA0LzI5LzIwMjAgMTA6NDggQU0sIEt1cnQg
VGF5bG9yIHdyb3RlOg0KICAgID4+Pj4ganVzdCBhZGQgaXQgZGlyZWN0bHkgaGVyZToNCiAgICA+
Pj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL29wZW5ibWMvd2lraS9DdXJyZW50LVJlbGVh
c2UtQ29udGVudA0KICAgID4+PiBBZGRlZDoNCiAgICA+Pj4gICAqIFlvY3RvIHJlZnJlc2ggdG8g
IkR1bmZlbGwiIHZlcnNpb24gMy4xDQogICAgPj4+ICAgKiBSZWRmaXNoIHN1cHBvcnQgZm9yOiBm
dWxsIGNlcnRpZmljYXRlIG1hbmFnZW1lbnQsIGNvbXBsZXRlIExEQVANCiAgICA+Pj4gbWFuYWdl
bWVudCwgZnVsbCBzZW5zb3Igc3VwcG9ydCwgZXZlbnQgc2VydmljZSBzY2hlbWEsIHRhc2sgc2No
ZW1hDQogICAgPj4+ICAgKiBNb3ZlIHRvIFJlZGZpc2ggU3BlY2lmaWNhdGlvbiAxLjkuMA0KICAg
ID4+PiAgICogUmVkZmlzaCBzdXBwb3J0IGZvciAyMDE5LjQgU2NoZW1hcw0KICAgID4+PiAgICog
R1VJIGVuaGFuY2VtZW50czogTERBUCwgY2VydGlmaWNhdGUgbWFuYWdlbWVudA0KDQogICAgV2Ug
YXJlIHRhcmdldGluZyB0aGlzIEZyaWRheSwgSnVuZSA1dGggZm9yIHJlbGVhc2UgMi44LiBJJ20g
bm90IHNlZWluZyANCiAgICBtdWNoIChvciBhbnkpIGRpc2N1c3Npb24gb24gdGVzdGluZy4gSWYg
eW91IGhhdmUgdGVzdGVkIHRoZSByZWxlYXNlIHRhZyANCiAgICBwbGVhc2UgcG9zdCB0aGUgcmVz
dWx0cyBmb3IgeW91ciBwbGF0Zm9ybS4gQW55IGJsb2NrZXJzPw0KDQogICAgaHR0cHM6Ly9naXRo
dWIuY29tL29wZW5ibWMvb3BlbmJtYy9yZWxlYXNlcw0KDQogICAgQWxzbywgcGxlYXNlIHJldmll
dyBhbmQgYWRkIGNvbnRlbnQgdG8gdGhlIHJlbGVhc2Ugbm90ZXMgaGVyZToNCg0KICAgIGh0dHBz
Oi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwcy0zQV9fZ2Vycml0Lm9w
ZW5ibWMtMkRwcm9qZWN0Lnh5el9jX29wZW5ibWNfZG9jc18tMkJfMzI0NDAmZD1Ed0lEYVEmYz01
VkQwUlR0TmxUaDN5Y2Q0MWIzTVV3JnI9djlNVTBLaTlwV25UWENXd2pIUFZncG5DUjgwdlhra2Ny
SWFxVTdVU2w1ZyZtPVNDVGZiUnpBMHhRekQ1cG5EMGxZd1JvNHNyRXdweFEwa2Nzdi1nUGdBNkkm
cz1nOTI2R1ZrQmZZVGpPTGw3QUNvVGYtX1RYbVJUV2trN3RxQkt3OXFYTVljJmU9IA0KDQogICAg
VGhhbmtzIGV2ZXJ5b25lIQ0KDQogICAgS3VydCBUYXlsb3IgKGtydGF5bG9yKQ0KDQogICAgPj4+
DQogICAgPj4+IEFuZCByZW1vdmVkICJgUmVkZmlzaCBjb25maWd1cmF0aW9uIGJhY2t1cCBhbmQg
cmVzdG9yZSBmdW5jdGlvbmAiLg0KICAgID4+PiBKYW1lcywgSmFzb24gYXJlIHlvdSBva2F5IHdp
dGggdGhlIFJlZGZpc2ggbGlzdCBhYm92ZT8gU2hvdWxkIHdlIGFkZA0KICAgID4+PiBzb21ldGhp
bmcgYWJvdXQgU3RvcmFnZSAmIERyaXZlcz8gQW55dGhpbmcgZWxzZT8NCiAgICA+Pj4NCiAgICA+
Pj4gU2hvdWxkIHdlIGFkZCBzb21ldGhpbmcgYWJvdXQgdGhlIEtlcm5lbD8gIk1vdmUgdG8gNS40
Ij8NCiAgICA+Pj4NCiAgICA+Pj4gQW55dGhpbmcgZm9yIFBMRE0gLyBNQ1RQPyBGb3IgdGhlIDIu
NyByZWxlYXNlIGl0IHNheXMgIlBhcnRpYWwgUExETQ0KICAgID4+PiBTdXBwb3J0IiBhbmQgIlBh
cnRpYWwgTUNUUCBTdXBwb3J0Ii4NCiAgICA+Pg0KICAgID4+IENlcnRhaW5seSBNQ1RQIHN1cHBv
cnQgaXMgc3RpbGwgIlBhcnRpYWwiLiBTbG93bHkgcHJvZ3Jlc3Npbmcgd2l0aCANCiAgICA+PiBo
ZWxwIGZyb20NCiAgICA+PiBJbnRlbC4NCiAgICA+IA0KICAgID4gU2FtZSBnb2VzIGZvciBQTERN
LiBUaGVyZSdzIGRlZmluaXRlbHkgbW9yZSBQTERNIHNwZWNzIGFuZCBjb21tYW5kcyANCiAgICA+
IGltcGxlbWVudGVkIGluIGxpYnBsZG0gc2luY2UgdGhlIDIuNyByZWxlYXNlIHRob3VnaC4NCiAg
ICA+IA0KICAgID4+IEFuZHJldw0KICAgID4+DQogICAgPiANCg0KDQo=
