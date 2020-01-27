Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D60D414AB23
	for <lists+openbmc@lfdr.de>; Mon, 27 Jan 2020 21:33:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4861fB60S2zDqGP
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 07:33:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=82951ba020=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=VJypvAXY; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=AgNRmTAm; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4861dM6vVrzDqGP
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jan 2020 07:32:18 +1100 (AEDT)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00RKOU8e010064; Mon, 27 Jan 2020 12:31:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=m/+drVYeeIu5cy2zJmOeyn3nu6A21LGywlQtsjH5p4s=;
 b=VJypvAXYW4lWqnRfh1pDAbKI4pa+Sq+oEw/ZFII58q1FF6PWcqoXJY7hXY8WT94Xr7pC
 owtumyU4gh3RpISbl3gh2yEEQrXknOW0wWsSo1WaMJWLD/DCcSSGUe878Nu/8GWQoFOL
 xiMZv+gOFF44hvO0ypR6xWwwQuJpFd9SN1M= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2xs690f5p6-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 27 Jan 2020 12:31:14 -0800
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Mon, 27 Jan 2020 12:31:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SmgwXl6tigJX1uKGVFbCquYZGrIT6jf62AhWTPF1rAaJ8ZrJ9NBJqQff4zPpsB46+cn9SIpTOtKtTmsoBIvCHcHO5HhzS6Vk1a2mT/IlwhNVR++ruR4F+ST8/bkHzpadW3XoRwttwJ8WiJ1I+bfeepBL8zDblDeQeoZlTUXFX4R45Q6IqXUi2r/P/SvQlnIqT6sHxRJFqxoALRoEg0xtiDWoEWqsl5CV3w/MC0xfclLPMathxe547SdnIts6xxGw2bQxpfs3athGTOnhaw1n4ec2yTRlkqPjb4cgmvl7iYCu0CgDVZlVaLAFQNysqP+Rh/O2SNAyfvteu1GV9LP0mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/+drVYeeIu5cy2zJmOeyn3nu6A21LGywlQtsjH5p4s=;
 b=k2maNH9iMJWGOKI/tnXKC4v0OHd+S0/KlbVkxAXQrkJP0ROGZF6J+Cz9sOPiWFZmOaD6aOijCR2JYAOsComatGfkHRZnHOk31BxZvPndn/ovHrUpBd4+ta0WsH3HpN1H1IyIuuTObFU7OGN3LzoSnFCUl63qEPrMdZ70vEaQs9tOF9x+thGyY09cYoVHAV8fHuPPcqr96w+asQIaD9+uy10oTcTc9v1DQpLTp+YQlNcPrucTwzF9rn4Zr9ZIY4zX8n4wkWQqa1jNFLNKWbvzr0d4uSFotK+2+LgJHzJt1Qh2pEzMaM3OGnajyIWIaHNNcZIJWlhzSdpkl164+O+8BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/+drVYeeIu5cy2zJmOeyn3nu6A21LGywlQtsjH5p4s=;
 b=AgNRmTAmtyv4r8GOiI5mpr+ZWxWMBTovmwPH2pYDp2elAOGsTZXPbB2AnOtkDa+GMDR4RQ9YIsLrYeL0whJ8a2wlkNCLvMGUM7RtBcJhaijIaog4Hc6yUmNai0aJgXvv+frAdti/G3bT2QUKNQAPJcdC4pioH6LdQkFVxNmyOVI=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1342.namprd15.prod.outlook.com (10.175.2.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.24; Mon, 27 Jan 2020 20:31:13 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2%8]) with mapi id 15.20.2665.026; Mon, 27 Jan 2020
 20:31:13 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: power button override
Thread-Topic: power button override
Thread-Index: AQHV0ksr3xkr2xM5GUmL71a8unTXDaf49/wAgACl3ACAAK69gIAABOgA//+HZoCABQhZAP//lXuA
Date: Mon, 27 Jan 2020 20:31:12 +0000
Message-ID: <01CE1094-7B1C-44F5-8580-C0098391EA6F@fb.com>
References: <98EE6AEE-9440-4AA5-971A-833EA0342226@fb.com>
 <d01cf897-0c23-35dc-5f81-aca67d31b98a@linux.intel.com>
 <0017A7FA-E86C-4524-B53B-9129A968C7DB@fb.com>
 <563c3b07-d5f5-1897-404b-ceb97f713610@linux.intel.com>
 <1b72ee84-6ad3-f5bb-bfed-2f6487893f59@linux.intel.com>
 <3AC1554A-4B97-45CA-BDE2-299AD172A9FD@fb.com>
 <698a1a8e-786e-3713-4b94-da7cf7864406@linux.intel.com>
In-Reply-To: <698a1a8e-786e-3713-4b94-da7cf7864406@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::823e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af696cba-3999-49e1-1434-08d7a367da09
x-ms-traffictypediagnostic: MWHPR15MB1342:
x-microsoft-antispam-prvs: <MWHPR15MB1342B1DD221B8C68786EF403DD0B0@MWHPR15MB1342.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 02951C14DC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39860400002)(376002)(366004)(136003)(346002)(189003)(199004)(36756003)(76116006)(110136005)(8676002)(66946007)(64756008)(66556008)(66446008)(66476007)(3480700007)(316002)(81166006)(81156014)(33656002)(8936002)(71200400001)(478600001)(53546011)(966005)(2906002)(186003)(6506007)(86362001)(6512007)(7116003)(2616005)(5660300002)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1342;
 H:MWHPR15MB1597.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5ak+ry5J8L4exPN99J7/KfCRNINCZKsuKLU5rekoVo96xd7ToIBAHoyLKECBWyf0uMNvNrpytHbWHmEc6i9XChenE6QRU8PHuKSpKYcL07tqUfEzJLtdJpR2+uIcOhA0ubR/iyYQ45clY1t3yqCh597PrF6bns69Z2tRIXe5YFzDYwoPb+VO3De3C06c6y8FcqF0WH3M2Rb+QZaSlSsglaEs9Lhtj6sqj1BG4WO4DikwdC80T0uewgHXUdJFviNw5LnesCiBEnsjjX9mZpAaLbAjZOq3xlAMqYtaweqIxVgXo9Gc50l++AT7SKxq68qthPXLQp58TAMNPP4wY40/roSxrPYbjif4xQ/2AW5UWpP5K0m2u5cwxCe/CZFthvCvxJj9l8Qio6J6JVT6Ns96/RDHTHGeyiLthw6LJHxNOTRpbhACESfQmocLDwrlbEN96ma68IXA0yhZz1RpJ3cqmPRHtjz1K4PtI+x6AseEpw+J0hLXaTAiZ7+aS4dBJEmt
x-ms-exchange-antispam-messagedata: dNrsNYYFDd7dArwrsqkmm5bIBl4Q9MF5sVcW1oxtH9cxedSsqVB7BzBVS1Zy1uSnulMoZN13PLoUa0TL8kCPsXepiHCXwBhz1gEUkTz1MK/ICKherKlBPrFHxZ1GywlbAkpmoknRdSdvD5G1VoMn6vHIbRrf/il7s6BnhH66840=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <B1B649535B950946A5804BB5FFD1C560@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: af696cba-3999-49e1-1434-08d7a367da09
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2020 20:31:12.8462 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mumyCopui/ZILXxjuQN1YXWarKYm3CtE1bnVEWdQs2rdsgBOvj7aGrvfh0UtrIpu+jpp+xoXjAuLdLwy/r3Ujw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1342
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-27_07:2020-01-24,
 2020-01-27 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0
 impostorscore=0 mlxlogscore=952 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1911200001 definitions=main-2001270162
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

DQoNCu+7v09uIDEvMjcvMjAsIDEwOjUyIEFNLCAiQmlsbHMsIEphc29uIE0iIDxqYXNvbi5tLmJp
bGxzQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQoNCiAgICANCiAgICANCiAgICBPbiAxLzI0LzIw
MjAgMjowMSBQTSwgVmlqYXkgS2hlbWthIHdyb3RlOg0KICAgID4gDQogICAgPiANCiAgICA+IE9u
IDEvMjQvMjAsIDE6MTMgUE0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBCaWxscywgSmFzb24gTSIg
PG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJzLm9yZyBvbiBi
ZWhhbGYgb2YgamFzb24ubS5iaWxsc0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOg0KICAgID4gDQog
ICAgPiAgICAgIA0KICAgID4gICAgICANCiAgICA+ICAgICAgT24gMS8yNC8yMDIwIDEyOjU1IFBN
LCBCaWxscywgSmFzb24gTSB3cm90ZToNCiAgICA+ICAgICAgPg0KICAgID4gICAgICA+DQogICAg
PiAgICAgID4gT24gMS8yNC8yMDIwIDEwOjI5IEFNLCBWaWpheSBLaGVta2Egd3JvdGU6DQogICAg
PiAgICAgID4+DQogICAgPiAgICAgID4+DQogICAgPiAgICAgID4+IE9uIDEvMjMvMjAsIDQ6MzYg
UE0sICJCaWxscywgSmFzb24gTSIgPGphc29uLm0uYmlsbHNAbGludXguaW50ZWwuY29tPg0KICAg
ID4gICAgICA+PiB3cm90ZToNCiAgICA+ICAgICAgPj4NCiAgICA+ICAgICAgPj4gICAgICBPbiAx
LzIzLzIwMjAgNDoxMyBQTSwgVmlqYXkgS2hlbWthIHdyb3RlOg0KICAgID4gICAgICA+PiAgICAg
ID4gSGkgSmFzb24sDQogICAgPiAgICAgID4+ICAgICAgPg0KICAgID4gICAgICA+PiAgICAgID4g
V2UgaGF2ZSBhIHJlcXVpcmVtZW50IG9mIHBvd2VyIGJ1dHRvbiBvdmVycmlkZS4gSSBkb27igJl0
IHNlZQ0KICAgID4gICAgICA+PiB4ODYtcG93ZXINCiAgICA+ICAgICAgPj4gICAgICA+IGNvbnRy
b2wgZG9lc27igJl0IHN1cHBvcnQgdGhpcyBjdXJyZW50bHkuIERvIHlvdSBuZWVkIHRoaXMNCiAg
ICA+ICAgICAgPj4gZmVhdHVyZXMgb3IgZG8NCiAgICA+ICAgICAgPj4gICAgICA+IHlvdSBoYXZl
IGFueSBsb2NhbCBwYXRjaCBmb3IgdGhpcy4NCiAgICA+ICAgICAgPj4gICAgICBIaSBWaWpheSwN
CiAgICA+ICAgICAgPj4gICAgICBwb3dlciBidXR0b24gb3ZlcnJpZGUgaXMgdXNlZCBmb3IgdGhl
ICJGb3JjZSBPZmYiIGFjdGlvbnMgaW4NCiAgICA+ICAgICAgPj4gcG93ZXIgY29udHJvbDoNCiAg
ICA+ICAgICAgPj4NCiAgICA+ICAgICAgPj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMveDg2
LXBvd2VyLWNvbnRyb2wvYmxvYi9tYXN0ZXIvcG93ZXItY29udHJvbC14ODYvc3JjL3Bvd2VyX2Nv
bnRyb2wuY3BwI0w1MC4NCiAgICA+ICAgICAgPj4NCiAgICA+ICAgICAgPj4NCiAgICA+ICAgICAg
Pj4gVGhpcyB3aWxsIG5vdCB3b3JrIGlmIGN1cnJlbnQgc3RhdHVzIGlzIG9mZi4gVGhpcyBzaG91
bGQganVzdCBzZW5kDQogICAgPiAgICAgID4+IHB1bHNlIGluIGFueSBzdGF0dXMgb24vb2ZmLg0K
ICAgID4gICAgICA+IENvcnJlY3QuICBGb3JjZSBPZmYgaXMgbm90IGRvbmUgaWYgdGhlIGN1cnJl
bnQgc3RhdHVzIGlzIG9mZi4NCiAgICA+ICAgICAgRG8geW91IGhhdmUgbW9yZSBkZXRhaWxzIG9u
IHRoZSBwb3dlciBidXR0b24gb3ZlcnJpZGUgYmVoYXZpb3IgdGhhdCB5b3UNCiAgICA+ICAgICAg
bmVlZD8NCiAgICA+IA0KICAgID4gWWVzLCBUaGlzIGlzIHJlcXVpcmVkIHRvIGJyaW5nIE1FIGJh
Y2sgdG8gb3BlcmF0aW9uIG1vZGUgZnJvbSByZWNvdmVyeS4gSG93IGFyZSB5b3UgaGFuZGxpbmcg
TUUgZm9yIEJpb3MgdXBncmFkZS4NCiAgICBXaGVuIGluIHJlY292ZXJ5IG1vZGUsIHRoZSBNRSB3
aWxsIGFjY2VwdCBhIHJlc2V0IGNvbW1hbmQgKElQTUkgcmF3IDB4NiANCiAgICAweDIpIHRvIHJl
c2V0IHRvIG9wZXJhdGlvbmFsIG1vZGUuDQoNCkJpbGwsIEkgdHJpZWQgdGhpcyBhbmQgc2VlIGlu
Y29uc2lzdGVudCBiZWhhdmlvciBmcm9tIGhvc3QuIFNvbWV0aW1lIGl0IHJlZnVzZSB0byBwb3dl
ciBvbi4gU28gUEJPIHJlc29sdmVzIHRoaXMuDQogICAgDQogICAgPiANCiAgICA+ICAgICAgPj4g
ICAgICA+DQogICAgPiAgICAgID4+ICAgICAgPiBSZWdhcmRzDQogICAgPiAgICAgID4+ICAgICAg
Pg0KICAgID4gICAgICA+PiAgICAgID4gLVZpamF5DQogICAgPiAgICAgID4+ICAgICAgPg0KICAg
ID4gICAgICA+Pg0KICAgID4gICAgICANCiAgICA+IA0KICAgIA0KDQo=
