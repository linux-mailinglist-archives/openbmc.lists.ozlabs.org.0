Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AB59DE59
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 09:03:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Hfw91lW6zDqsM
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 17:03:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=vertiv.com
 (client-ip=2a01:111:f400:fe48::615;
 helo=nam03-co1-obe.outbound.protection.outlook.com;
 envelope-from=troy.lee@vertiv.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=vertiv.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vertivco.onmicrosoft.com
 header.i=@vertivco.onmicrosoft.com header.b="GZdYQyuy"; 
 dkim-atps=neutral
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on0615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::615])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HfvW0X0bzDqdm
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 17:02:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1XI/zHtgXk5WMNubWDF2piigbK1Skds3vxis0xuC90W9h3FPz5GTgmvjcYPcWBQ/OSs78hBDXXbbZeWkpdF2be7w4xW+YFmt/4oNXZQPqBftNE4D6qZFSq6lVuofo7wO0+MA/hfl29VfGgZXhWbgick+gybsCMO29m8crnyRkKrQIR5Eg4WGY6viNGc6TBmCI+L3ZdhW1B9qEZnomwClgjC5PxUpxeleJAAflrQzqJWHmBN5GuhGQ19UJN+2fwopIqNpHDBtMf3cSdjsi05Cta+5OTRjMOq4BWyOKe1r0OlheKYUAQOYJKOlDv/DTV/nsaSzwSKqxZHAQ4T72Sg6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78w5h4pq3IHhBRjPrPMyjU5biRPgC0ODcT1V82n1xUM=;
 b=XG2js62mn9jt1276talH4QN1yIMKx0T+McI+ivzR3FAGFwZ5lDnTPjfnXK2Hix7QRtH/SSgFBj/BEwQclP6NlL1cIuEHAhZPtSmxwCGIHp1MvA1CR256+xnTZdpTJN2yvdhf+jJXyaXeqZd/QcDuMiAMCmRhH7EfTQONew6B5JdeSoAxQOhd5UL59Y9RAJYg2HudI7TqtKwJQRcw+/0qAXOOcu+m4ZyHHS77CTmYfFOW9SatM9aiXqV9NflQ2M/TtbOpDTp2oLWJcR6uJ7ts+wJgXCJMobOlvr3QxfSHilEhBE9XgRG0tZbJNZSvc+1hEzzUP5pZClpkpOOqZT4poA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vertiv.com; dmarc=pass action=none header.from=vertiv.com;
 dkim=pass header.d=vertiv.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vertivco.onmicrosoft.com; s=selector2-vertivco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78w5h4pq3IHhBRjPrPMyjU5biRPgC0ODcT1V82n1xUM=;
 b=GZdYQyuyevck7g0zQ2NPUNKhvqWwZj1VmskEWyW7HaVTfj5MBIP55oZ3CtfUSoQTNgmPTZQEe5o+qDrAhcgX5ojVW/aM0U1drKypI8gDIumZ4HeHOLAxBxpK8Igpsq/7EDFJCTRE95kG+ZBC09bGkb5hQb/OfSoUt9mgaDg2Vlo=
Received: from MWHPR13MB1360.namprd13.prod.outlook.com (10.173.120.8) by
 MWHPR13MB1264.namprd13.prod.outlook.com (10.173.119.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.13; Tue, 27 Aug 2019 07:02:19 +0000
Received: from MWHPR13MB1360.namprd13.prod.outlook.com
 ([fe80::f8a0:214c:cccd:85a8]) by MWHPR13MB1360.namprd13.prod.outlook.com
 ([fe80::f8a0:214c:cccd:85a8%6]) with mapi id 15.20.2220.013; Tue, 27 Aug 2019
 07:02:19 +0000
From: "Troy.Lee@vertiv.com" <Troy.Lee@vertiv.com>
To: Vijay Khemka <vijaykhemka@fb.com>, Ratan Gupta
 <ratagupt@linux.vnet.ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "Tanous, Ed" <ed.tanous@intel.com>
Subject: RE: [ExternalEmail] Re: Asynchronous Event Notification support.
Thread-Topic: [ExternalEmail] Re: Asynchronous Event Notification support.
Thread-Index: AQHVXH+GlPJYVUNaM023WUEVCq+P3acOjymQ
Date: Tue, 27 Aug 2019 07:02:19 +0000
Message-ID: <MWHPR13MB1360DD37BA66B55F2A1E0495EDA00@MWHPR13MB1360.namprd13.prod.outlook.com>
References: <ad95a67f-dbf9-450b-9cf4-38d9a595bf76@linux.vnet.ibm.com>
 <CF0228C6-5A25-452E-8849-7BCC778593FA@fb.com>
In-Reply-To: <CF0228C6-5A25-452E-8849-7BCC778593FA@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Troy.Lee@vertiv.com; 
x-originating-ip: [103.83.160.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e5c7641-4d69-4d3a-ee01-08d72abc80b5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR13MB1264; 
x-ms-traffictypediagnostic: MWHPR13MB1264:
x-microsoft-antispam-prvs: <MWHPR13MB12641A2AC7CC409B623AB759EDA00@MWHPR13MB1264.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(366004)(396003)(376002)(346002)(13464003)(53754006)(199004)(189003)(7696005)(64756008)(478600001)(26005)(55016002)(14454004)(86362001)(52536014)(33656002)(71200400001)(71190400001)(486006)(5660300002)(6436002)(53936002)(110136005)(14444005)(316002)(256004)(66946007)(76116006)(66556008)(66476007)(6246003)(99286004)(6506007)(8936002)(446003)(9686003)(66066001)(25786009)(8676002)(2501003)(7736002)(81156014)(186003)(81166006)(6116002)(74316002)(305945005)(2906002)(102836004)(15650500001)(3846002)(53546011)(66446008)(229853002)(11346002)(76176011)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR13MB1264;
 H:MWHPR13MB1360.namprd13.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vertiv.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ls9XhR2++qXT2Wjr8vSysgba+ZSkxZp82RiqFFYuVrO60aaGXOv1F9AJazhsMeuPBNcGCl+dpuCk7pKadFDqLus8VNY5mTyFrGD7mV74TWA+HZbOeM5Shk4L2iimwZLewXqMvSca8J1IerdN2OAhxGTwD3JPmmDUKn4wsRhC5FRz33w2A1pEaYj3WJRBlfxhjZxFvxVI8S9hnBxQe/634UWHZ8B2cUCB5lNS/iMraDMyrA2JdOOZ4tna6q0Z0DCw4x5qEvf6QGjZy7TzrSyjQb0f2zfb9813l/QZDj26k63xsOlg0RtbLxr7IuolpELVmvZ7uAChDiCngFGf9twj2FqLPyFAN/zAoD+qCtf1B/xjP9gdAt250JHCtLyIB8L7Qe33g+x/EQUg/icgAcmd21X3eNA3GH/b+ahlMdFNBsg=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vertiv.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e5c7641-4d69-4d3a-ee01-08d72abc80b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 07:02:19.7159 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 74fe92c5-ef57-4d1a-a0e7-9451117d9272
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R2TpSuZ7Wkh7ljf6TQtqh1JUkfwtsJC4wBSz63Ep9eyZWihDEiJQmr9HbS3V+vy8sU17rT7Z3tBewirSNN7wVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR13MB1264
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

SGksDQoNCkFzIGZhciBhcyBJIGtub3csIHRoZSBwaG9zcGhvci1zZWwtbG9nZ2VyIGhhcyB0aGUg
YWJpbGl0eSB0byBtb25pdG9yIHRoZSB0aHJlc2hvbGQgY3Jvc3Npbmcgd2hpY2ggZ2VuZXJhdGVk
IGJ5IHBob3NwaG9yLWh3bW9uIG9yIGRidXMtc2Vuc29ycyBvbiBEQnVzLCBhbmQgdGhlbiBpdCB3
aWxsIGdlbmVyYXRlIHJlZGZpc2ggZXZlbnQgbG9nIG9yIGpvdXJuYWwgbG9nLg0KDQpIb3dldmVy
LCBJIGRpZG4ndCBzZWUgdGhlIElQTUkgU0VMIGJlaW5nIGdlbmVyYXRlZCByZWdhcmRpbmcgdG8g
dGhlIG5hbWUgb2YgdGhlIHJlcG9zaXRvcnkuDQoNClRoYW5rcywNClRyb3kgTGVlDQoNCi0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBvcGVuYm1jIDxvcGVuYm1jLWJvdW5jZXMrdHJv
eS5sZWU9dmVydGl2LmNvbUBsaXN0cy5vemxhYnMub3JnPiBPbiBCZWhhbGYgT2YgVmlqYXkgS2hl
bWthDQpTZW50OiBUdWVzZGF5LCBBdWd1c3QgMjcsIDIwMTkgMTA6MzAgQU0NClRvOiBSYXRhbiBH
dXB0YSA8cmF0YWd1cHRAbGludXgudm5ldC5pYm0uY29tPjsgb3BlbmJtY0BsaXN0cy5vemxhYnMu
b3JnOyBUYW5vdXMsIEVkIDxlZC50YW5vdXNAaW50ZWwuY29tPg0KU3ViamVjdDogW0V4dGVybmFs
RW1haWxdIFJlOiBBc3luY2hyb25vdXMgRXZlbnQgTm90aWZpY2F0aW9uIHN1cHBvcnQuDQoNCg0K
DQrvu79PbiA4LzI1LzE5LCAzOjQzIEFNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgUmF0YW4gR3Vw
dGEiIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFicy5vcmcg
b24gYmVoYWxmIG9mIHJhdGFndXB0QGxpbnV4LnZuZXQuaWJtLmNvbT4gd3JvdGU6DQoNCiAgICBI
aSBBbGwsDQoNCiAgICBEb2VzIGFueW9uZSBoYXZlIHN1Z2dlc3Rpb25zIG9uIGVuYWJsaW5nIEFz
eW5jaHJvbnVzIEV2ZW50IG5vdGlmaWNhdGlvbg0KICAgIHN1cHBvcnQgZm9yIFJlZGZpc2g/DQpB
cmUgeW91IGxvb2tpbmcgZm9yIHJlZGZpc2ggb25seT8gQXJlIHdlIGV2ZW4gaGFuZGxpbmcgYW55
IHN1Y2ggZXZlbnQgaW4gQk1DIExpa2Ugc2Vuc29yIHRocmVzaG9sZCBjcm9zc2luZyBvciBhbnkg
c3lzdGVtIGZhaWx1cmUgZXRjLg0KDQogICAgV2UgYXJlIGRvaW5nIHNvbWUgZXhwbG9yYXRpb24g
b24gdGhpcyBhcmVhIGFuZCB3YW50ZWQgdG8gaGVhciBpZiBzb21lb25lDQogICAgaXMgYWxyZWFk
eSB3b3JraW5nIG9uIGl0LiBXaWxsIGJlIGhhcHB5IHRvIGNvbGxhYm9yYXRlLg0KDQogICAgVGhh
bmtzLA0KICAgIFJhdGFuDQoNCg0KDQoNCg0KQ09ORklERU5USUFMSVRZIE5PVElDRTogVGhpcyBl
LW1haWwgYW5kIGFueSBmaWxlcyB0cmFuc21pdHRlZCB3aXRoIGl0IGFyZSBpbnRlbmRlZCBzb2xl
bHkgZm9yIHRoZSB1c2Ugb2YgdGhlIGluZGl2aWR1YWwgb3IgZW50aXR5IHRvIHdob20gdGhleSBh
cmUgYWRkcmVzc2VkIGFuZCBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgYW5kIHByaXZpbGVnZWQg
aW5mb3JtYXRpb24gcHJvdGVjdGVkIGJ5IGxhdy4gSWYgeW91IHJlY2VpdmVkIHRoaXMgZS1tYWls
IGluIGVycm9yLCBhbnkgcmV2aWV3LCB1c2UsIGRpc3NlbWluYXRpb24sIGRpc3RyaWJ1dGlvbiwg
b3IgY29weWluZyBvZiB0aGUgZS1tYWlsIGlzIHN0cmljdGx5IHByb2hpYml0ZWQuIFBsZWFzZSBu
b3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBieSByZXR1cm4gZS1tYWlsIGFuZCBkZWxldGUg
YWxsIGNvcGllcyBmcm9tIHlvdXIgc3lzdGVtLg0K
