Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 904881AD315
	for <lists+openbmc@lfdr.de>; Fri, 17 Apr 2020 01:09:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493FL26j8lzF0Rr
	for <lists+openbmc@lfdr.de>; Fri, 17 Apr 2020 09:09:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=137518329d=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=gVtAptyD; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=cYzggIEl; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493FKB2bn4zDrhF
 for <openbmc@lists.ozlabs.org>; Fri, 17 Apr 2020 09:08:53 +1000 (AEST)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 03GN2JfW020829;
 Thu, 16 Apr 2020 16:08:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=ekUnKlpfhhv7RyXwSSUCzl1yYMzm5LtCbAXBfzdIGxE=;
 b=gVtAptyDRr7a0v9gl6bhuW5/DSzxB+jKmWsCxEtzU0qb3kfoK57xOguLbBnUlNQLPm1d
 e9kx7a3ZEbhGbo1lNLPoAvB4yLXtr+gycn7QkpQKEjJTPWzX+Y8U0N8DaAKWfoNvhtWD
 sAiKnRM1x/4GlQF7KjKYuIdV7Vqhv3tePhE= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0001303.ppops.net with ESMTP id 30em7um302-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Apr 2020 16:08:48 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.230) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Thu, 16 Apr 2020 16:08:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mNJnr+sZd8+dduok+qj1ubfTpMQ+U7nM1PEoAZ2MnJTGyupBdtVuwPEJ973WcJPFg5XGuOW7R6vtKy/7g8WCWfpB7glGkmARpxn9KFaHjnCOF8P029SVAXn0TO3bYjbM9LeHvx4YO6OWDcIQyHJveyoMwwdZh/4Z9MTU82whRmUMM2ERJtI6P3x59qY6lBs5ppiUbZTMLQeULVNlycAfmu1GnRv/SecKZZTeSSqxyAzmskJtzFwGV3cDAraJ7X6D9G7rZHmQlRH0D0rWxRR/TPTt8SfbCifx/m2q7ksyUAnS0j2h0189B/yO5S6bYbC0owY/rfYgguwQ5MbGbFBKbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekUnKlpfhhv7RyXwSSUCzl1yYMzm5LtCbAXBfzdIGxE=;
 b=aKtB0CdmOSgZSwfuX1Pv424UGep8luwckkf+lJ76eZwXJWanfbdlh2XPJjJZjRYrD49HuhnpPY/dPuUvdJ5UVzMxJGhMDM4TuXaXPB2PHk1OMXM/LRFQ33pCYgiQveo4m7fjKasPO5+wiyKFYpRkfekZJe7WI3agSTZgy58WpMVRuz+pUWktEIOVBXQd9o8obH+p8+Pf8h7Bp+f+OnGcO2UdxW6faNW6J3LgyUouEcYo+65Izx5Z4TzNuekDrQKkccojiNb73MGVjbWnWnaB4SgIXO6S7iSEda3hh4szaPlUogunh+eo7GYOi2ucfRhlPawpeRiqDy9hAjiPXdePjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekUnKlpfhhv7RyXwSSUCzl1yYMzm5LtCbAXBfzdIGxE=;
 b=cYzggIEltGJblDqMlAEaGHEUm58kO3r4zpeGQ/31DHWcSCuSBClQYRbuHLk2idBHHFYKB6KNmUpPGEekQHFobKCUyMXpt23d+bsTal22sxdwqxKre1gWzWW7n8qp+eYhm4Rq2guKgIGVZeB9vdT8Di+PRow5L69+Nqn+vcGaFE0=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2519.namprd15.prod.outlook.com (2603:10b6:a03:14f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.24; Thu, 16 Apr
 2020 23:08:45 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4%3]) with mapi id 15.20.2921.027; Thu, 16 Apr 2020
 23:08:45 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: objc console new design
Thread-Topic: objc console new design
Thread-Index: AQHWCgBPwdBJh2WrEU2ViFQA6gD9zqhqcoWAgAGa3ACABcTCAIAGxG4AgAKMFQCAANv0AA==
Date: Thu, 16 Apr 2020 23:08:45 +0000
Message-ID: <70D6B234-A674-4E87-8B66-776A8ED9F74A@fb.com>
References: <73161AF5-F6B6-40C6-AE70-5FCF5A530B82@fb.com>
 <451f5f0e-a1ba-4016-b044-e55b966f64ea@www.fastmail.com>
 <B81F049C-24DB-49A0-9DE5-5D7C02496AD0@fb.com>
 <625f79f9-0490-4dbe-b364-959e2091fdc8@www.fastmail.com>
 <BBD9DDB3-49C9-4F85-9647-530AD7F3DC99@fb.com>
 <4b0f60fc-e4aa-446b-808c-5de40c12ad5a@www.fastmail.com>
In-Reply-To: <4b0f60fc-e4aa-446b-808c-5de40c12ad5a@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:457d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b760008-71b2-4523-ec97-08d7e25b1d33
x-ms-traffictypediagnostic: BYAPR15MB2519:
x-microsoft-antispam-prvs: <BYAPR15MB25194E9703C9EBBA8FE36A9FDDD80@BYAPR15MB2519.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0375972289
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(39860400002)(366004)(136003)(376002)(346002)(396003)(6486002)(76116006)(8676002)(966005)(33656002)(86362001)(316002)(64756008)(6512007)(36756003)(2906002)(66556008)(91956017)(81156014)(5660300002)(186003)(3480700007)(66476007)(66446008)(8936002)(66946007)(4326008)(2616005)(6506007)(53546011)(6916009)(478600001)(71200400001);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kp3hXJSzCZDwItaEwaLyKk8oqArOSuJNk1ra3+eLHd/686XDMmoNpNVj3Gi83r0mQWPT9opbW/1UJcDGs9YsfTVPuToGwWh0DQfP9BnvpVQWRw0+hVvvJK2Z7Fr+KFL/CyXDATYPxSpdgBWosXwT3R2vdVb8vlcX2pbVTjLZpZA3fspb0VSdKNJ3B+vwovAr+5uzEslA6G2oQKnyyHr0u2XhwQs2LxKC8jhmo9REx58svyf8VbbKq38Oq56f6ktmWIj+pg2ou8CFZZ3bYAKStBLyqpSmcS9XT0KVG3ktsC8vD8g/lsWJgS7o9euDk88yas5W8r6rRR0X9BFyq9Ttjca9Yuau4UrsMZYq8seILal5KSN8X6vwsQHepU2aOJruuziTwauO4f21FHmdpALOB38wC+KDe0dtLQbsA7iPdi02t2iaFESbDEz5GeNmqs0tJV2VeWtynt8UHTftWlh3o+hTQmrTBH9ITRwfIcbNZ7UIe8U47H9CQeAO775rsOlSPMsX2C/hzEQD9OhsirB/uA==
x-ms-exchange-antispam-messagedata: oeYucspJkF8NNDBCN+4B5e5HVD+MixuFNcZ4tCvSFG8kCLxZZmtba0YadeH/orA3GzwGp5X90gTSjR0sAh3UnPctppNXbFTJ9PUXpwieRyfPPcvvw/o5xIunFd0nz4NfZ16K44MAQq4V1nuQu9LbRx/1bS2+EllSDRWhT4nHxFWEmNy4HnLIB9DTQYJ45OEQ
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <08C7AF465AFA1A4E878401DE4ADDB5E4@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b760008-71b2-4523-ec97-08d7e25b1d33
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2020 23:08:45.3979 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mLWFzzjKO1lNqO9T1mSuXycphd5iWzp2a/5O+ZOZbIwcRYOIKgyAFNTTOgNuMeA4cpkttePSRPsT/5o7shB1kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2519
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-16_10:2020-04-14,
 2020-04-16 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 bulkscore=0 adultscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 mlxlogscore=895
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004160159
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

DQoNCu+7v09uIDQvMTUvMjAsIDg6MDEgUE0sICJBbmRyZXcgSmVmZmVyeSIgPGFuZHJld0Bhai5p
ZC5hdT4gd3JvdGU6DQoNCiAgICANCiAgICANCiAgICBPbiBXZWQsIDE1IEFwciAyMDIwLCBhdCAw
NDozNywgVmlqYXkgS2hlbWthIHdyb3RlOg0KICAgID4gDQogICAgPiANCiAgICA+IE9uIDQvOS8y
MCwgOTo0NyBQTSwgIkFuZHJldyBKZWZmZXJ5IiA8YW5kcmV3QGFqLmlkLmF1PiB3cm90ZToNCiAg
ICA+IA0KICAgID4gICAgIA0KICAgID4gICAgIA0KICAgID4gICAgIE9uIFR1ZSwgNyBBcHIgMjAy
MCwgYXQgMDU6MTEsIFZpamF5IEtoZW1rYSB3cm90ZToNCiAgICA+ICAgICA+IA0KICAgID4gICAg
ID4gDQogICAgPiAgICAgPiBPbiA0LzUvMjAsIDU6MTAgQU0sICJBbmRyZXcgSmVmZmVyeSIgPGFu
ZHJld0Bhai5pZC5hdT4gd3JvdGU6DQogICAgPiAgICAgPiANCiAgICA+ICAgICA+ICAgICANCiAg
ICA+ICAgICA+ICAgICANCiAgICA+ICAgICA+ICAgICBPbiBTYXQsIDQgQXByIDIwMjAsIGF0IDA4
OjA5LCBWaWpheSBLaGVta2Egd3JvdGU6DQogICAgPiAgICAgPiAgICAgPiAgDQogICAgPiAgICAg
PiAgICAgPiBIaSBBbmRyZXcsDQogICAgPiAgICAgPiAgICAgPiANCiAgICA+ICAgICA+ICAgICA+
IEhvdyBpcyBzZXJ2ZXIgbGF1bmNoZWQgYXMgcGVyIG5ldyBkZXNpZ24gY29kZS4gV2l0aCBsYXRl
c3QgDQogICAgPiB1cGRhdGUsIA0KICAgID4gICAgID4gICAgID4gY29uc29sZSBzZXJ2ZXIgaXMg
bm90IGxhdW5jaGluZyBpbiBvdXIgcGxhdGZvcm0uIEkgc2F3IA0KICAgID4gY29uZmlnIG9wdGlv
biANCiAgICA+ICAgICA+ICAgICA+IOKAnE9CTUNfQ09OU09MRV9IT1NUX1RUWSA/PSAidHR5VlVB
UlQwIiDigJwgaGFzIGJlZW4gcmVtb3ZlZCANCiAgICA+IGZyb20gYmIgZmlsZSANCiAgICA+ICAg
ICA+ICAgICA+IGFuZCBhbHNvIHRoZXJlIGlzIG5vIHRyaWdnZXJpbmcgcG9pbnQgaW4gb2JtYy1j
b25zb2xlLXNzaCANCiAgICA+IHNvY2tldCBhbmQgDQogICAgPiAgICAgPiAgICAgPiBzZXJ2aWNl
IGxpa2UgZWFybGllciANCiAgICA+IFdhbnRzPW9ibWMtY29uc29sZUB7T0JNQ19DT05TT0xFX0hP
U1RfVFRZfS5zZXJ2aWNlIA0KICAgID4gICAgID4gICAgID4gDQogICAgPiA8bWFpbHRvOldhbnRz
PW9ibWMtY29uc29sZUAlN2JPQk1DX0NPTlNPTEVfSE9TVF9UVFklN2Quc2VydmljZT4uDQogICAg
PiAgICAgPiAgICAgPiANCiAgICA+ICAgICA+ICAgICA+IA0KICAgID4gICAgID4gICAgID4gSSBz
ZWUgdWRldiBydWxlcyBhZGRlZCBpbiBsYXRlc3QgcGF0Y2ggZm9yIGxhdW5jaGluZyBzZXJ2ZXIg
DQogICAgPiB3aGljaCBuZWVkcyANCiAgICA+ICAgICA+ICAgICA+IGNvbmZpZyBkZWZpbml0aW9u
IG9mIHVkZXYsIGRvIHdlIG5lZWQgdGhpcyBmb3IgbGF1bmNoaW5nLCANCiAgICA+IHBsZWFzZSBh
ZHZpc2UuDQogICAgPiAgICAgPiAgICAgDQogICAgPiAgICAgPiAgICAgWWVzLCBvYm1jLWNvbnNv
bGUgbm93IHNoaXBzIGEgdWRldiBydWxlcyBmaWxlIHRoYXQgbGF1bmNoZXMgDQogICAgPiAgICAg
PiBvYm1jLWNvbnNvbGUtc2VydmVyDQogICAgPiAgICAgPiAgICAgdmlhIGFuIGBFTlZ7U1lTVEVN
RF9XQU5UU31gIGRpcmVjdGl2ZToNCiAgICA+ICAgICA+IA0KICAgID4gICAgID4gSWYgdGhpcyBp
cyBtYW5kYXRvcnkgdGhlbiB3aHkgZG8gd2UgbmVlZCB0byBlbmFibGUgVURFViBjb25maWcgYXMg
DQogICAgPiBpdCANCiAgICA+ICAgICA+IHNob3VsZCBiZSBlbmFibGVkIGJ5IGRlZmF1bHQuDQog
ICAgPiAgICAgPg0KICAgID4gICAgIA0KICAgID4gICAgIEl0J3Mgbm90IG1hbmRhdG9yeSwganVz
dCBJIGRvbid0IGtub3cgdGhlIHJlcXVpcmVtZW50cyBvZiBhbnkgc3lzdGVtcyB0aGF0DQogICAg
PiAgICAgYXJlbid0IHVzaW5nIHVkZXYuIFRoZSBzd2l0Y2ggZXhpc3RzIGluIG9ibWMtY29uc29s
ZSBzbyB5b3UgY2FuIGltcGxlbWVudA0KICAgID4gICAgIHN1cHBvcnQgZm9yIHN5c3RlbXMgd2l0
aG91dCB1ZGV2IGlmIHRoYXQncyBkZXNpcmVkLiBNYXliZSBhZGRpbmcgdGhlIHN3aXRjaA0KICAg
ID4gICAgIHdhcyBwcmVtYXR1cmU/DQogICAgPiANCiAgICA+IEFzIHBlciBuZXcgZGVzaWduLCB1
ZGV2IHJ1bGUgaXMgdGhlIG9ubHkgb25lIHdobyBjYW4gc3RhcnQgc2VydmVyIC4NCiAgICANCiAg
ICBUaGF0J3Mgbm90IHRydWUsIHlvdSBjb3VsZCBpbXBsZW1lbnQgdGhlIHN5c3RlbSBhcyBLdW1h
cidzIG9yaWdpbmFsIHBhdGNoWzFdDQogICAgaWYgeW91ciBzeXN0ZW0gZG9lc24ndCB1c2UgdWRl
di4gQnV0IEknbSBub3QgYXdhcmUgb2Ygc3lzdGVtcyB0aGF0IGFyZW4ndA0KICAgIHVzaW5nIHVk
ZXYuDQoNCkkgYWdyZWUgYWxtb3N0IGV2ZXJ5IHN5c3RlbSBpcyB1c2luZyB1ZGV2IHNvIHdlIGRv
bid0IG5lZWQgdG8gZGVmaW5lIHVkZXYgZm9yIHRoaXMgZmVhdHVyZS4NCk15IHF1ZXN0aW9uIHdh
cyBzaW1wbHkgd2UgY291bGQgYXZvaWQgcHV0dGluZyB1ZGV2IHN3aXRjaCBpbiBjb25maWcgZmls
ZSBhbmQgYWxsb3dlZCB0aGlzDQp1ZGV2IHJ1bGUgYnkgZGVmYXVsdC4gQnV0IGFueXdheXMsIGV2
ZXJ5dGhpbmcgd29ya3MgZmluZS4gQW5kIHRoYW5rcyBmb3IgY29tcGxldGUgZGV0YWlscy4NCiAg
ICANCiAgICBBbmRyZXcNCiAgICANCiAgICBbMV0gaHR0cHM6Ly91cmxkZWZlbnNlLnByb29mcG9p
bnQuY29tL3YyL3VybD91PWh0dHBzLTNBX19nZXJyaXQub3BlbmJtYy0yRHByb2plY3QueHl6X2Nf
b3BlbmJtY19tZXRhLTJEZmFjZWJvb2tfLTJCXzMxMDkxXzZfcmVjaXBlcy0yRHBob3NwaG9yX2Nv
bnNvbGVfb2JtYy0yRGNvbnNvbGUtNUYtMjUyNTI1LmJiYXBwZW5kLTIzMTkmZD1Ed0lGYVEmYz01
VkQwUlR0TmxUaDN5Y2Q0MWIzTVV3JnI9djlNVTBLaTlwV25UWENXd2pIUFZncG5DUjgwdlhra2Ny
SWFxVTdVU2w1ZyZtPTZ5Q3dZcDlMRThKbi1yS0lUQXpBVW4wLXZPN2F2TmJSZFFkSl9KZmZjeW8m
cz1uVGlIM2tValVlaUxFVVZQV2hCamRWUXdicVlaSGU0Q2ZvNmtucUFLWTBvJmU9IA0KICAgIA0K
DQo=
