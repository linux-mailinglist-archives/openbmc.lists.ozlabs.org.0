Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E1D6C0EF
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2019 20:26:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pm1D1WJ0zDqTy
	for <lists+openbmc@lfdr.de>; Thu, 18 Jul 2019 04:26:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=21012f26b2=benwei@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="EzlBVUVR"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="etyic/zn"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pm0Y6QZVzDqQs
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jul 2019 04:25:32 +1000 (AEST)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6HI9Tjo027962; Wed, 17 Jul 2019 11:25:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=wxstGDcdO8DCtXlI8dSOEb6IDtvCd990Fh7qGSo/9N4=;
 b=EzlBVUVRutMCA6Tc1U1VswGEfXstgnDt6f+UAZsZt+DzQqvuH1BOA3PPNUBnyRNzqDR1
 6HasTF22gjcaRUl5S6ImPCLIZg5ajpbgLjwUmm+rpSCmEgQBhBdtrlPhsE7UqZdY1emi
 FLn4vwY7Yr0HqIlbQ2evS3oFO8pApufllew= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2tsnfq3u6b-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 17 Jul 2019 11:25:24 -0700
Received: from ash-exopmbx101.TheFacebook.com (2620:10d:c0a8:82::b) by
 ash-exhub101.TheFacebook.com (2620:10d:c0a8:82::e) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 17 Jul 2019 11:25:21 -0700
Received: from ash-exhub101.TheFacebook.com (2620:10d:c0a8:82::e) by
 ash-exopmbx101.TheFacebook.com (2620:10d:c0a8:82::b) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 17 Jul 2019 11:25:21 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.173) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 17 Jul 2019 11:25:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jxKCFBhllUZRBRqNtKw0v68VtsmjmhkaMuXLhuFAuXaXc4m+uYVTbJSwQbyQcazso/9DKz2YCIVqFnbDRP0BkPT/AUSDdB4/ro6H/1vDPWm+lbjPXXgQDJM1cv9whI/G0QGi53IbgtR8iZRMcvo2KRUxCDAULtd4Rm/eaSDwbAsnSr0uR8Y2VwIoa1vrhdBNLmXT5D1GBOn0gQzcc8Iwm+wIvpqp6leY6/9EgbafJx2VI04hdtMZi/psowJQslumyyMDkkylAHgBlXbBMD4m+B7D+Mab340OlTtHytBLYlVRNie/zI3SyfdUCGo1EWot+WUsWGlJjnfLnXzzSaEhUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxstGDcdO8DCtXlI8dSOEb6IDtvCd990Fh7qGSo/9N4=;
 b=NR/tTwmX8zQ2iTM3KN+jUTzr8cPD/R1q6DqF5quMNh8oDpfKxaj8CLlJo9U8pKtJ0+Uuvn0Jz5y1V37QMBHZaLZyAua1TNGLpBDUjVe4RCw5tD9g+seTtemtwUa8c2aSysWkG7y1CqycI2C6Z0FXGm6AuXBNLXvZXB+b8RqYlIPKcWhXmqwWwt81enJ+gmOgeaFR0zyPnw1sw5WWaZ/WkqZGVwr8h9w24byGiha/rfb2cuGLuEyF55LSH//VRIvg9viNpPaamaVTkj1kWwIs2wuvu85aGmiPPdASim219SF9FDj29TrTElcppPVWuCqZea4Q/xZCLV6tWp0wrxryKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=fb.com;dmarc=pass action=none header.from=fb.com;dkim=pass
 header.d=fb.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxstGDcdO8DCtXlI8dSOEb6IDtvCd990Fh7qGSo/9N4=;
 b=etyic/zn+LcatffdG5L2HlttDWytM5vlvlKLlAJp8n31SDy9PJG11BZPOSw/7X3fsUPwQK++Y8Jw/let2+wHFPOCFvjQuYdSkD20x5Lca4/kW4ntyMDz8qWEwEcx4QhFzuBOCXlJcbGKNIc/FCXoeKQ21uvCKBvyCuCSjh1cH0I=
Received: from DM5PR15MB1321.namprd15.prod.outlook.com (10.173.211.143) by
 DM5PR15MB1369.namprd15.prod.outlook.com (10.173.218.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.13; Wed, 17 Jul 2019 18:25:20 +0000
Received: from DM5PR15MB1321.namprd15.prod.outlook.com
 ([fe80::1849:40c8:9086:b250]) by DM5PR15MB1321.namprd15.prod.outlook.com
 ([fe80::1849:40c8:9086:b250%5]) with mapi id 15.20.2073.015; Wed, 17 Jul 2019
 18:25:20 +0000
From: Ben Wei <benwei@fb.com>
To: Supreeth Venkatesh <supreeth.venkatesh@arm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Out-of-band NIC management
Thread-Topic: Out-of-band NIC management
Thread-Index: AdU8H8pBvdsVlvP/RSqN9qCJJOBAZQAnu/IAAAMS/TA=
Date: Wed, 17 Jul 2019 18:25:20 +0000
Message-ID: <DM5PR15MB1321AAEFD4F1E91F452085AEA3C90@DM5PR15MB1321.namprd15.prod.outlook.com>
References: <MWHPR15MB132793F6F3B5BD2777083F46A3CE0@MWHPR15MB1327.namprd15.prod.outlook.com>
 <6c8358ba6edda830110b331be552beedba0a50a2.camel@arm.com>
In-Reply-To: <6c8358ba6edda830110b331be552beedba0a50a2.camel@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:2c07]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 89866fef-6639-4afa-3876-08d70ae42041
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM5PR15MB1369; 
x-ms-traffictypediagnostic: DM5PR15MB1369:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <DM5PR15MB13699642A32136D529ECBA5AA3C90@DM5PR15MB1369.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1388;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(136003)(346002)(376002)(396003)(366004)(53754006)(199004)(189003)(6116002)(25786009)(478600001)(86362001)(8936002)(6436002)(8676002)(229853002)(966005)(68736007)(305945005)(76116006)(33656002)(71200400001)(74316002)(186003)(14454004)(102836004)(7696005)(46003)(6506007)(54906003)(11346002)(476003)(446003)(76176011)(2906002)(4326008)(66946007)(110136005)(52536014)(316002)(66556008)(66476007)(7736002)(71190400001)(256004)(66446008)(2501003)(14444005)(53936002)(64756008)(3480700005)(5660300002)(55016002)(99286004)(6306002)(6246003)(486006)(81166006)(9686003)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR15MB1369;
 H:DM5PR15MB1321.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6Ft3dnCIHN37ERY4FI+vE9ebavy4o9Nv7mnDol5rwWM/LuH6UUznm8vRHhJ+3anIA02PEQbnlZh7nlcV2bxdBFgLPlP51EKu92H5mkI+cdPadCKGQrbGBa3oibcvBH26WAFsJMd+UKErAQ1X49sAqv7gImFBoQHyk4cSdwYbdun36VjkNOsegwoRTz6kAEISqi8xtD1mdnyrOUICBrb9SozCbT09hA0nXJbSYGleIu+CuGC8BIov70Z0dkFhbPw7jAY0bDR4/3+hU38cZ9Onbk8MLE+IJC6m3ixnHndNqRtGKBdLo7CKp8O3LVFkQluikEEJQYHjCm7f1zr0ksE/IuiFga+LZNar+Y8FDe8YbPgdOZPtbvakRlujuPRWIUDkqoUP/qC4QpboaaHd17VE6kQfmSaix/xvt4eiZZ4im3Q=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 89866fef-6639-4afa-3876-08d70ae42041
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 18:25:20.4999 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: benwei@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR15MB1369
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-17_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1031 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907170208
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
 "dong.wei@arm.com" <dong.wei@arm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiA+IEhpIGFsbCwNCj4gSGkgQmVuLA0KPiA+ICANCj4gPiBXb3VsZCBhbnlvbmUgYmUgaW50ZXJl
c3RlZCBpbiBjb2xsYWJvcmF0aW5nIG9uIG91dC1vZi1iYW5kIE5JQyANCj4gPiBtYW5hZ2VtZW50
IGFuZCBtb25pdG9yaW5nPw0KPiBZZXMuIElmIHRoZXJlIGlzIGFuIGV4aXN0aW5nIGltcGxlbWVu
dGF0aW9uIHRoYXQgY2FuIGJlIGxldmVyYWdlZC9leHRlbmRlZCB3aXRoaW4gT3BlbkJNQywgaXQg
d2lsbCBiZSBmYW50YXN0aWMuDQo+DQo+ID4gIA0KPiA+IA0KPiA+IERNVEYgaGFzIGFzIGEgTkNT
SSBzcGVjICgNCj4gPiBodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9
aHR0cHMtM0FfX3d3dy5kbXRmLm9yZ19zaXRlDQo+ID4gc19kZWZhdWx0X2ZpbGVzX3N0YW5kYXJk
c19kb2N1bWVudHNfRFNQMDIyMi01RjEuMS4wLnBkZiZkPUR3SUNhUSZjPTVWRA0KPiA+IDBSVHRO
bFRoM3ljZDQxYjNNVXcmcj1VMzVJYVEtN1Rud2pzN3FfRndmX2JRJm09SkVvcDdvaE1tZ29nbnBH
cWMxN0liMTENCj4gPiBCem9rdUx1ZmNFREktdUdvaC13USZzPXNiblFFU293Qi1saDFSWVVCd2Zn
eDdxSDVIaTExS1hfSnR6bTNabkcyX0kmZT0NCj4gPiApLCB0aGF0IGRlZmluZXMgYSBzdGFuZGFy
ZCBpbnRlcmZhY2UgZm9yIEJNQ3MgdG8gbWFuYWdlIE5JQ3MuDQo+IEkgYXNzdW1lIHRoYXQgTkMt
U0kgb3ZlciBNQ1RQIEJpbmRpbmcNCj4gaHR0cHM6Ly91cmxkZWZlbnNlLnByb29mcG9pbnQuY29t
L3YyL3VybD91PWh0dHBzLTNBX193d3cuZG10Zi5vcmdfc2l0ZXNfZGVmYXVsdF9maWxlc19zdGFu
ZGFyZHNfZG9jdW1lbnRzX0RTUDAyNjEtNUYxLjIuMS5wZGYmZD1Ed0lDYVEmYz01VkQwUlR0TmxU
aDN5Y2Q0MWIzTVV3JnI9VTM1SWFRLTdUbndqczdxX0Z3Zl9iUSZtPUpFb3A3b2hNbWdvZ25wR3Fj
MTdJYjExQnpva3VMdWZjRURJLXVHb2gtPiB3USZzPWpxYlpvWklaNnpBYnBhTDFEaEI3dDhuYmNG
cUhLVC1jYUhkUU5aR3ZGZlUmZT0NCj4gIHdpbGwgYWxzbyBiZSB0YXJnZXRlZC4gQ29ycmVjdD8N
Cj4NCj4gSmVyZW15IHdhcyB3b3JraW5nIG9uIE1DVFAsIHNvIHdlIHNob3VsZCBjb2xsYWJvcmF0
ZSB3aXRoIEplcmVteSBhbmQgdGVhbS4gDQoNCkZvciB0aGUgQ0xJIHRvb2wgYW5kIG1hbmFnZW1l
bnQgJiBtb25pdG9yaW5nIGRhZW1vbiwgSSB3YXMgaW5pdGlhbGx5IHRoaW5raW5nIHVzaW5nIE5D
LVNJIG92ZXIgUk1JSS9SQlQsIG1haW5seSBiZWNhdXNlIGtlcm5lbCBhbHJlYWR5IHN1cHBvcnRz
IHRoaXMgYW5kIGl0IHByb3ZpZGVzIGEgbmV0bGluayBpbnRlcmZhY2UgZm9yIHVzZXJzcGFjZSB0
byBzZW5kL3JlY2VpdmUgY29tbWFuZHMuDQpCdXQgSSB0aGluayB3ZSBjYW4gbWFrZSBvdXIgbWFu
YWdlbWVudCB0b29sIHRyYW5zcG9ydGF0aW9uIGFnbm9zdGljLCBzbyBmb3IgTkNTSW9STUlJL1JC
VCwgaXQgY29tbXVuaWNhdGVzIHRvIGtlcm5lbCBOQ1NJIGRyaXZlciBvdmVyIG5ldGxpbmssIGFu
ZCBmb3IgTkNTSSBvdmVyIE1DVFAsIGl0IHVzZXMgYSB0aGUgbWVjaGFuaXNtIHByb3ZpZGVkIGJ5
IGxpYm1jdHAuDQoNCj4gPiBBbmQgaW4ga2VybmVsIDUueCAsIE5DLVNJIGRyaXZlciBzdXBwb3J0
cyBOZXRsaW5rIGludGVyZmFjZSBmb3IgDQo+ID4gY29tbXVuaWNhdGluZyB3aXRoIHVzZXJzcGFj
ZSBwcm9jZXNzZXMuDQo+ID4gICANCj4gPiBJJ20gdGhpbmtpbmcgYWRkaW5nIHRoZSBmb2xsb3dp
bmcgdG9vbHMgdG8gT3BlbkJNQyBhcyBhIHN0YXJ0aW5nIHBvaW50IA0KPiA+IGFuZCBidWlsZCBm
b3JtIHRoZXJlOg0KPiA+ICANCj4gPiAgICAgICAxLiBBIGNvbW1hbmQgbGluZSB1dGlsaXR5IChl
LmcuIG5jc2ktdXRpbCkgdG8gc2VuZCByYXcgTkMtU0kgDQo+ID4gY29tbWFuZHMsIHVzZWZ1bCBm
b3IgZGVidWdnaW5nIGFuZCBpbml0aWFsIE5JQyBicmluZyB1cCwNCj4gPiAgICAgICBGb3IgZXhh
bXBsZToNCj4gPiAgICAgICAgICAgbmNzaS11dGlsIC1ldGgwIC1jaCAwIDxyYXcgTkMtU0kgY29t
bWFuZD4NCj4gPiAgDQo+ID4gICAgICAgV2UgY2FuIGZ1cnRoZXIgZXh0ZW5kIHRoaXMgY29tbWFu
ZCBsaW5lIHRvb2wgdG8gc3VwcG9ydCBvdGhlciANCj4gPiBtYW5hZ2VtZW50IGludGVyZmFjZXMs
IGUuZyBzZW5kaW5nIE1DVFAgb3IgUExETSBjb21tYW5kcyB0byBOSUMuDQo+ID4gIA0KPiA+ICAg
ICAgIDIuIEEgZGFlbW9uIHJ1bm5pbmcgb24gT3BlbkJNQyAoZS5nIG5jc2lkKSBtb25pdG9yaW5n
IE5JQyANCj4gPiBzdGF0dXMsICBmb3IgZXhhbXBsZToNCj4gPiAgICAgICAgICAgYS4gUXVlcnkg
YW5kIGxvZyBOSUMgY2FwYWJpbGl0eSBhbmQgY3VycmVudCBwYXJhbWV0ZXIgDQo+ID4gc2V0dGlu
Zw0KPiA+ICAgICAgICAgICBiLiBQZXJpb2RpY2FsbHkgY2hlY2sgTklDIGxpbmsgc3RhdHVzLCBy
ZS1pbml0aWFsaXplIE5DLVNJIA0KPiA+IGxpbmsgaWYgTklDIGlzIHVucmVhY2hhYmxlLCBsb2cg
dGhlIHN0YXR1cw0KPiA+ICAgICAgICAgICBjLiBFbmFibGUgYW5kIG1vbml0b3IgTklDIEFzeW5j
aHJvbm91cyBFdmVudCBOb3RpZmljYXRpb25zDQo+ID4gKEFFTnMpIA0KPiA+ICAgICAgICAgICAg
ICAgICBpLiBzdWNoIGFzICBMaW5rIFN0YXR1cyBDaGFuZ2UsIENvbmZpZ3VyYXRpb24gDQo+ID4g
cmVxdWlyZWQsIEhvc3QgZHJpdmVyIHN0YXR1cyBjaGFuZ2UNCj4gPiAgICAgICAgICAgICAgICAg
aWkuIHRoZXJlIGFyZSBPRU0tc3BlY2lmaWMgQUVOcyB0aGF0IEJNQyBtYXkgYWxzbyANCj4gPiBl
bmFibGUgYW5kIG1vbml0b3INCj4gPiAgICAgICAgICAgICAgICAgaWlpLiBlaXRoZXIgbG9nIHRo
ZXNlIGV2ZW50cywgYW5kL29yIHBlcmZvcm1zIHJlY292ZXJ5IA0KPiA+IGFuZCByZW1lZGlhdGlv
biBhcyBuZWVkZWQNCj4gPiAgICAgICAgICAgZC4gQWRkaXRpb25hbCBtb25pdG9yaW5nIHN1Y2gg
YXMgDQo+ID4gICAgICAgICAgICAgICAgIGkuICB0ZW1wZXJhdHVyZSAobm90IGluIHN0YW5kYXJk
IE5DLVNJIGNvbW1hbmQgeWV0KSwgDQo+ID4gICAgICAgICAgICAgICAgIGlpLiBmaXJtd2FyZSB2
ZXJzaW9uLCB1cGRhdGUgZXZlbnQsIG5ldHdvcmsgdHJhZmZpYyANCj4gPiBzdGF0aXN0aWNzDQo+
ID4gIA0KPiA+IEJvdGggdGhlIENMSSB0b29sIGFuZCB0aGUgbW9uaXRvcmluZyBkYWVtb24gY2Fu
IGVpdGhlciBjb21tdW5pY2F0ZSB0byANCj4gPiBrZXJuZWwgZHJpdmVyIGRpcmVjdGx5IHZpYSBO
ZXRsaW5rIGluZGVwZW5kZW50bHksIG9yIHdlIGNhbiBoYXZlIHRoZSANCj4gPiBuY3NpIGRhZW1v
biBhY3RpbmcgYXMgY29tbWFuZCBzZXJpYWxpemVyIHRvIGtlcm5lbCBhbmQgb3RoZXIgdXNlciAN
Cj4gc3BhY2UgcHJvY2Vzc2VzLg0KPiA+IFRoZXNlIGFyZSBqdXN0IHNvbWUgb2YgbXkgaW5pdGlh
bCB0aG91Z2h0cyBhbmQgSSdkIGxvdmUgdG8gaGVhciBzb21lIA0KPiA+IGZlZWRiYWNrIGlmIHRo
ZXNlIHdvdWxkIGJlIHVzZWZ1bCB0byBPcGVuQk1DLg0KPiA+IA0KPiA+IElmIGFueW9uZSBpbiBp
bnRlcmVzdGVkIGluIGNvbGxhYm9yYXRlIG9uIHRoZXNlIHdlIGNhbiBkaXNjdXNzIG1vcmUgb24g
DQo+ID4gZmVhdHVyZXMgYW5kIGRlc2lnbiBkZXRhaWxzLg0KPiBJIGFtIGludGVyZXN0ZWQgaW4g
Y29sbGFib3JhdGluZyBvbiB0aGUgZGVzaWduIGRldGFpbHMuDQoNCkdyZWF0ISBJIGNhbiBwdXQg
YSBkcmFmdCBvbiBHZXJyaXQgYW5kIHdlIGNhbiB3b3JrIHRvZ2V0aGVyIG9uIHRoaXMuIERvIHlv
dSBoYXZlIGFkZGl0aW9uYWwgdXNlcyBjYXNlcyB5b3UncmUgbG9va2luZyBmb3I/DQoNClJlZ2Fy
ZHMNCi1CZW4NCg==
