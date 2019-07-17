Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D586C251
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2019 22:50:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pqCR3sYlzDqTk
	for <lists+openbmc@lfdr.de>; Thu, 18 Jul 2019 06:50:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=21012f26b2=benwei@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="B2uvDPhW"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="iYC3XwNA"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pqBd5ZGQzDqSG
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jul 2019 06:49:28 +1000 (AEST)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6HKj1Pu019175; Wed, 17 Jul 2019 13:49:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=gOPKY+4pvPVOav2SWzCYpjFTLo47aI1X9vLp21DyWz0=;
 b=B2uvDPhWrOS+t8kz0G+5AZQmpWVqy1ATwjUpUQcOwofZTt6VZRa5eILxJaC4CiPbSZ1n
 25IU0T5USfE0h2PtwZwhsH0bh+/wRUISNQ98XdPSmx3fsh8KIPb6Eopk5hCVtzl1Mpjm
 C6zMjouOwxOClOH+avuTq4X05Ud+U3ubUeM= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2tt9rjg990-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 17 Jul 2019 13:49:22 -0700
Received: from prn-hub03.TheFacebook.com (2620:10d:c081:35::127) by
 prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Wed, 17 Jul 2019 13:49:21 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Wed, 17 Jul 2019 13:49:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FvZ4BF0jrjCPHMn2KTulJ7Sp6LKA5K1kiqcICk9N+KKp8hsVwKk0HCrRul3bOzKiTq/+gGUGSaAKcJPU0gPenAZr/BaAhJNgvl59ArbfoKknucHDSjYHyzBPafrELGvfiAu5gB1I8tKmd7AHyqSygm1lcCAr+CgyRs5YM1KCxLQ147GwNutNcfSy9chPEYqthaerPRhdHWYCwXGI7onGAAB1ro/16/imEqO1IAcODZLRx8Tmk0mizjkp9mxM4w/U9noniDD2ZYaxD6stQDVHWCTq1sgO3hHrbVWD2U9c2thnichhIKPvEc78joz2DdSDYAhN4PzBTkxNIGXnEuSOkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gOPKY+4pvPVOav2SWzCYpjFTLo47aI1X9vLp21DyWz0=;
 b=Y1bf7IfZkAu3koWLcVZANfgLkVwHgTvTk4S2WRMeMlqeW9/7H7+D8i4KQ0eMLHCCVRKPHqn9wsCIsEp/5wa2edxv/ZEDmVaJ0f1qpRfWLCc/29oBM7sUAfxFQyKz1i6C0HlYTJ1hDGX2xictA1CbMUcdyfqIlIlp3BcRq4UOu+G/CfQKye9/bZfGW0HjNC/JrT66GMtFLew8AY0vjCXEr9ub24ikhWOpbQD53/KZoXg4mKvjnKMqXbBvDsSpZIlvufRzlqwjqUamttoZbh9MPXALV62uGI5/YunoranxW1/aHK49i634sEGrEHZ5+BFJl0AndlXdiiu704jRl2RCxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=fb.com;dmarc=pass action=none header.from=fb.com;dkim=pass
 header.d=fb.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gOPKY+4pvPVOav2SWzCYpjFTLo47aI1X9vLp21DyWz0=;
 b=iYC3XwNAtE9GgRc0uFD6+PO4lWai6CdkNLVJMPVUNI+YW3emAVQ3egJDjWCHLuR1E/oGFulPP7UYtpNII5rrDpxUBfA4A/KwTN2UukqIys3H843mOLyIi6baoTXaEIAO0I6rR9mA3yDDSDL27EXS0skkVbw2OQK/YEXJK9iHYyw=
Received: from DM5PR15MB1321.namprd15.prod.outlook.com (10.173.211.143) by
 DM5PR15MB1545.namprd15.prod.outlook.com (10.173.224.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 20:49:20 +0000
Received: from DM5PR15MB1321.namprd15.prod.outlook.com
 ([fe80::1849:40c8:9086:b250]) by DM5PR15MB1321.namprd15.prod.outlook.com
 ([fe80::1849:40c8:9086:b250%5]) with mapi id 15.20.2073.015; Wed, 17 Jul 2019
 20:49:19 +0000
From: Ben Wei <benwei@fb.com>
To: "Justin.Lee1@Dell.com" <Justin.Lee1@Dell.com>,
 "supreeth.venkatesh@arm.com" <supreeth.venkatesh@arm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Out-of-band NIC management
Thread-Topic: Out-of-band NIC management
Thread-Index: AdU8H8pBvdsVlvP/RSqN9qCJJOBAZQAnu/IAAAMS/TAAA0NzAAABW4Zg
Date: Wed, 17 Jul 2019 20:49:19 +0000
Message-ID: <DM5PR15MB13211397B4364925E53293EAA3C90@DM5PR15MB1321.namprd15.prod.outlook.com>
References: <MWHPR15MB132793F6F3B5BD2777083F46A3CE0@MWHPR15MB1327.namprd15.prod.outlook.com>
 <6c8358ba6edda830110b331be552beedba0a50a2.camel@arm.com>
 <DM5PR15MB1321AAEFD4F1E91F452085AEA3C90@DM5PR15MB1321.namprd15.prod.outlook.com>
 <ef766735da734b8098e46b00359b4f85@AUSX13MPS302.AMER.DELL.COM>
In-Reply-To: <ef766735da734b8098e46b00359b4f85@AUSX13MPS302.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Justin_Lee1@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2019-07-17T19:44:40.5428473Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual;
 aiplabel=External Public
x-originating-ip: [2620:10d:c090:200::3:3155]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df1e4277-142d-4181-56bd-08d70af83db4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM5PR15MB1545; 
x-ms-traffictypediagnostic: DM5PR15MB1545:
x-microsoft-antispam-prvs: <DM5PR15MB15450ED7951C388F97603AA5A3C90@DM5PR15MB1545.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(39860400002)(366004)(396003)(136003)(199004)(189003)(476003)(2201001)(11346002)(446003)(486006)(52536014)(5660300002)(2501003)(14444005)(256004)(71200400001)(71190400001)(6246003)(6506007)(9686003)(229853002)(2906002)(66446008)(86362001)(102836004)(186003)(6436002)(66946007)(3480700005)(76116006)(66476007)(64756008)(66556008)(7736002)(53936002)(68736007)(110136005)(6116002)(54906003)(55016002)(46003)(33656002)(7696005)(316002)(76176011)(478600001)(99286004)(14454004)(8936002)(74316002)(8676002)(305945005)(81156014)(81166006)(4326008)(25786009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR15MB1545;
 H:DM5PR15MB1321.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ojCEEUH4LYhhGXDuGTddANWRoSRP1wjDBGVBiPxT6mMmK/05SCXlweRDb5vWS78io2/RF/JnLL3Q8Ka5s8K8dZfUcgG3GNNAF73Ocxp4vwJrAxiQGNBdilRzZfPShOyw/FMIr90W/W6hYladVxItM/QDWmJd+rVeq7TVoZuICoMhuGba50/Uv1Ox2zfxPPpSqBtd8xFMPkzx1cB9lNqgeu9OtoE27c/6bhHvstYXpzgCGflKkPvyBE04CA6G7PpGV5mo1+7Nd9kJwVhItU26/ll3qoKT13tWGYRsjK6ZSJIpWo0prD854t0pgX6TRBhtsCvE/yO7zGNLVsRA3YdbcryQPxMCQrz5TDfeDXZNYo+uXo3hL/2nrLDH2Qw2epTq84J4PZ5wmlr0/iBuRTIV2+0LGTxaKVScEbMe9mQ9zUY=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: df1e4277-142d-4181-56bd-08d70af83db4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 20:49:19.8919 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: benwei@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR15MB1545
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-17_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1031 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907170235
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
Cc: "Jeff.Booher-Kaeding@arm.com" <Jeff.Booher-Kaeding@arm.com>,
 "dong.wei@arm.com" <dong.wei@arm.com>,
 "sam@mendozajonas.com" <sam@mendozajonas.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiBIaSBCZW4sDQo+DQo+IEkgaGF2ZSBhIGZldyBxdWVzdGlvbnMgYWJvdXQgdGhlIDIuYyBpdGVt
IGJlbG93Lg0KPg0KPg0KPiA+IEZvciB0aGUgQ0xJIHRvb2wgYW5kIG1hbmFnZW1lbnQgJiBtb25p
dG9yaW5nIGRhZW1vbiwgSSB3YXMgaW5pdGlhbGx5IHRoaW5raW5nIHVzaW5nIE5DLVNJIG92ZXIg
Uk1JSS9SQlQsIG1haW5seSBiZWNhdXNlIGtlcm5lbCBhbHJlYWR5IHN1cHBvcnRzIHRoaXMgYW5k
IGl0IHByb3ZpZGVzIGEgbmV0bGluayBpbnRlcmZhY2UgZm9yIHVzZXJzcGFjZSB0byBzZW5kL3Jl
Y2VpdmUgY29tbWFuZHMuDQo+ID4gQnV0IEkgdGhpbmsgd2UgY2FuIG1ha2Ugb3VyIG1hbmFnZW1l
bnQgdG9vbCB0cmFuc3BvcnRhdGlvbiBhZ25vc3RpYywgc28gZm9yIE5DU0lvUk1JSS9SQlQsIGl0
IGNvbW11bmljYXRlcyB0byBrZXJuZWwgTkNTSSBkcml2ZXIgb3ZlciBuZXRsaW5rLCBhbmQgZm9y
IE5DU0kgb3ZlciBNQ1RQLCBpdCB1c2VzIGEgdGhlIG1lY2hhbmlzbSBwcm92aWRlZCBieSBsaWJt
Y3RwLg0KPiA+IA0KPiA+ID4gPiBBbmQgaW4ga2VybmVsIDUueCAsIE5DLVNJIGRyaXZlciBzdXBw
b3J0cyBOZXRsaW5rIGludGVyZmFjZSBmb3IgDQo+ID4gPiA+IGNvbW11bmljYXRpbmcgd2l0aCB1
c2Vyc3BhY2UgcHJvY2Vzc2VzLg0KPiA+ID4gPiAgIA0KPiA+ID4gPiBJJ20gdGhpbmtpbmcgYWRk
aW5nIHRoZSBmb2xsb3dpbmcgdG9vbHMgdG8gT3BlbkJNQyBhcyBhIHN0YXJ0aW5nIA0KPiA+ID4g
PiBwb2ludCBhbmQgYnVpbGQgZm9ybSB0aGVyZToNCj4gPiA+ID4gIA0KPiA+ID4gPiAgICAgICAx
LiBBIGNvbW1hbmQgbGluZSB1dGlsaXR5IChlLmcuIG5jc2ktdXRpbCkgdG8gc2VuZCByYXcgTkMt
U0kgDQo+ID4gPiA+IGNvbW1hbmRzLCB1c2VmdWwgZm9yIGRlYnVnZ2luZyBhbmQgaW5pdGlhbCBO
SUMgYnJpbmcgdXAsDQo+ID4gPiA+ICAgICAgIEZvciBleGFtcGxlOg0KPiA+ID4gPiAgICAgICAg
ICAgbmNzaS11dGlsIC1ldGgwIC1jaCAwIDxyYXcgTkMtU0kgY29tbWFuZD4NCj4gPiA+ID4gIA0K
PiA+ID4gPiAgICAgICBXZSBjYW4gZnVydGhlciBleHRlbmQgdGhpcyBjb21tYW5kIGxpbmUgdG9v
bCB0byBzdXBwb3J0IA0KPiA+ID4gPiBvdGhlciBtYW5hZ2VtZW50IGludGVyZmFjZXMsIGUuZyBz
ZW5kaW5nIE1DVFAgb3IgUExETSBjb21tYW5kcyB0byBOSUMuDQo+ID4gPiA+ICANCj4gPiA+ID4g
ICAgICAgMi4gQSBkYWVtb24gcnVubmluZyBvbiBPcGVuQk1DIChlLmcgbmNzaWQpIG1vbml0b3Jp
bmcgTklDIA0KPiA+ID4gPiBzdGF0dXMsICBmb3IgZXhhbXBsZToNCj4gPiA+ID4gICAgICAgICAg
IGEuIFF1ZXJ5IGFuZCBsb2cgTklDIGNhcGFiaWxpdHkgYW5kIGN1cnJlbnQgcGFyYW1ldGVyIA0K
PiA+ID4gPiBzZXR0aW5nDQo+ID4gPiA+ICAgICAgICAgICBiLiBQZXJpb2RpY2FsbHkgY2hlY2sg
TklDIGxpbmsgc3RhdHVzLCByZS1pbml0aWFsaXplIA0KPiA+ID4gPiBOQy1TSSBsaW5rIGlmIE5J
QyBpcyB1bnJlYWNoYWJsZSwgbG9nIHRoZSBzdGF0dXMNCj4gPiA+ID4gICAgICAgICAgIGMuIEVu
YWJsZSBhbmQgbW9uaXRvciBOSUMgQXN5bmNocm9ub3VzIEV2ZW50IA0KPiA+ID4gPiBOb3RpZmlj
YXRpb25zDQo+ID4gPiA+IChBRU5zKQ0KPg0KPg0KPiBGb3Igc2VsZWN0ZWQgY2hhbm5lbHMsIEFF
TiBpcyBlbmFibGVkIGJ5IGRlZmF1bHQuIERvIHlvdSBwbGFuIHRvIGVuYWJsZSB0aGUgQUVOIGZv
ciBub24tc2VsZWN0ZWQgY2hhbm5lbHMgdG9vPw0KPiBJZiB5ZXMsIHdoYXQgaXMgdGhlIGFwcHJv
YWNoIHlvdSBhcmUgZ29pbmcgdG8gZG8/IEVuYWJsZSBpdCBieSB1c2Vyc3BhY2Ugb3IgbW9kaWZ5
IE5DLVNJIGRyaXZlciB0byBhY2hpZXZlIHRoYXQ/DQo+IFdlIGFyZSBwbGFubmluZyB0byBtb25p
dG9yIGFsbCBjaGFubmVscyBidXQgc3RpbGwgbG9vayBmb3IgdGhlIGJlc3Qgd2F5Lg0KPg0KDQpI
aSBKdXN0aW4sDQpGb3Igbm93IEkgb25seSBwbGFuIHRvIG1vbml0b3Igc2VsZWN0ZWQgY2hhbm5l
bC4gQnV0IEknbSBjdXJpb3VzIGFib3V0IHRoZSBBRU4gZW5hYmxlZCBieSBkZWZhdWx0LiBJcyB0
aGlzIHBlcmZvcm1lZCBieSBrZXJuZWwgZHJpdmVyIHRvZGF5Pw0KSW4gdGhlIHByZXZpb3VzIHZl
cnNpb24gKGUuZy4gNC54KSwgSSBoYWQgdG8gbWFudWFsbHkgZW5hYmxlICAob3Igc3Vic2NyaWJl
IHRvKSB0aGVtIGFmdGVyIE5DLVNJIGluaXRpYWxpemF0aW9uLg0KDQoodGhpcyBpcyB3aHkgSSB3
YXMgdGhpbmtpbmcgYSB1c2Vyc3BhY2UgQ0xJIHRvIGNoZWNrIE5JQyBwYXJhbWV0ZXJzIHdvdWxk
IGJlIHVzZWZ1bCB0byBnZXQgdGhlIGN1cnJlbnQgTklDIHNldHRpbmcpDQoNCkJ1dCBpbiBhbnkg
Y2FzZSAoc2VsZWN0ZWQgdnMgYWxsIGNoYW5uZWxzKSwgSSBhbSB0aGlua2luZyBoYXZpbmcgc29t
ZSB0b29sIG9yIGRhZW1vbiBpbiB1c2Vyc3BhY2UgdG8gbW9kaWZ5IEFFTiBzZXR0aW5nIHdvdWxk
IHByb3ZpZGUgZmxleGliaWxpdHksIHNpbmNlIGtlcm5lbCBkcml2ZXIgYWxyZWFkeSBwcm92aWRl
cyBhY2Nlc3MgbWVjaGFuaXNtLg0KRm9yIHRoZSAyLmMgY2FzZSwgd2UgbWF5IHNlbGVjdGl2ZWx5
IGVuYWJsZSBBRU5zIGJhc2VkIG9uICJnZXQgY2FwYWJpbGl0eSIgY21kLiBBbHNvIHdlIG1heSBj
aGVjayB3aGljaCBPRU0gQUVOcyAoaWYgYW55KSBhcmUgc3VwcG9ydGVkLCBhbmQgYmFzZWQgb24g
b3VyIG5lZWRzIHNlbGVjdGl2ZWx5IGVuYWJsZS9kaXNhYmxlIHRoZXNlLg0KDQoNCj4gRm9yIGRl
bGl2ZXJpbmcgdGhlIEFFTiB0byB1c2Vyc3BhY2UsIGN1cnJlbnRseSwgd2UgaW1wbGVtZW50IGl0
IHZpYSB0aGUgbWNncnBzIGxvY2FsbHkgYnV0IHBsYW4gdG8gdXBzdHJlYW0uDQo+DQo+IGVudW0g
bmNzaV9nZW5sX211bHRpY2FzdF9ncm91cHMgew0KPglOQ1NJX0dFTkxfTUNHUlBfQUVOLA0KPiB9
Ow0KPg0KPiBzdGF0aWMgY29uc3Qgc3RydWN0IGdlbmxfbXVsdGljYXN0X2dyb3VwIG5jc2lfZ2Vu
bF9tY2dycHNbXSA9IHsNCj4JW05DU0lfR0VOTF9NQ0dSUF9BRU5dID0geyAubmFtZSA9IE5DU0lf
R0VOTF9NQ0dSUF9BRU5fTkFNRSB9LCB9Ow0KPg0KPiBzdGF0aWMgc3RydWN0IGdlbmxfZmFtaWx5
IG5jc2lfZ2VubF9mYW1pbHkgX19yb19hZnRlcl9pbml0ID0gew0KPgkubmFtZSA9ICJOQ1NJIiwN
Cj4JLnZlcnNpb24gPSAwLA0KPgkubWF4YXR0ciA9IE5DU0lfQVRUUl9NQVgsDQo+CS5tb2R1bGUg
PSBUSElTX01PRFVMRSwNCj4JLm9wcyA9IG5jc2lfb3BzLA0KPgkubl9vcHMgPSBBUlJBWV9TSVpF
KG5jc2lfb3BzKSwNCj4JLm1jZ3JwcyA9IG5jc2lfZ2VubF9tY2dycHMsDQo+CS5uX21jZ3JwcyA9
IEFSUkFZX1NJWkUobmNzaV9nZW5sX21jZ3JwcyksIH07DQo+DQo+DQoNClRoaXMgaXMgYSBncmVh
dCBpZGVhISBQcmV2aW91c2x5IEkgaGFkIGEgaGFja3kgc29sdXRpb24gdG8gc2VuZCBhIGN1c3Rv
bSBuZXRsaW5rIG1lc3NhZ2UgZm9yIEFFTnMsIGJ1dCB0aGlzIG11bHRpY2FzdCBncm91cCBpcyBt
b3JlIGZsZXhpYmxlLg0KSW4geW91ciBjdXJyZW50IGRlc2lnbiwgZG8geW91IGhhdmUgbXVsdGlw
bGUgcHJvY2Vzc2VzIGxpc3RlbmluZyB0byB0aGVzZT8gT3IgMSBwcm9jZXNzIHRoYXQgaGFuZGxl
cyBhbGwgQUVOcy4NCg0KUmVnYXJkcywNCi1CZW4NCg==
