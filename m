Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9E4DF803
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 00:31:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xrvz1NlZzDqLh
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 09:31:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=5197cf6ead=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="V6RAxMuo"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="bWOP8vgp"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46xrv545jzzDqHY
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 09:30:34 +1100 (AEDT)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.42/8.16.0.42) with SMTP id x9LMRHOw005073;
 Mon, 21 Oct 2019 15:30:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=cw7VcQ077hD4QmgqC6HIhzlOZZ5OEmNh3lQPujFs/rI=;
 b=V6RAxMuoTywBL4rVjvwy2uVS7fmFEKi5URcC0drRw8Rh1JIKw1VoAuaNd3kv2SG4nlow
 PEqH+XK/cyGoX7gXNQ+7Zw7qQwurDn/BDdgHoOIdAXVj/d0rKQ4kwKga1BEcVlWQF9I7
 Pha543PM4J1B269RA1L+siybyy5hV6YEnvM= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0001303.ppops.net with ESMTP id 2vqx5ns9cs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 21 Oct 2019 15:30:29 -0700
Received: from ash-exhub104.TheFacebook.com (2620:10d:c0a8:82::d) by
 ash-exhub102.TheFacebook.com (2620:10d:c0a8:82::f) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 21 Oct 2019 15:30:29 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 21 Oct 2019 15:30:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0exIItPNjTc+3AiS4OuQQDOXruwdjMG0e8AmHUhsL31C7/hjZDI9gtGskHuGb865ee8MakEU7tefcMnO13prSFQiV1FrCA376/QlVv6vRLUhhRexaL0pgwOFuzK3gQSrALjJmdHJXMBvwf9vMjSMjtO78oV1z5UrBSAxJZ3Ah/SnszPZpF6TRFP3s5yFCutngqLZAZO79P98jWN1I0VzC0IhCeQoVLxNfuStuBUSPKg68OBNdcTSYShg/Jx6eZqFjQB7zVmN3yCA0ejcbYmWSPS5zXgg9fimQNkaFPXWyEZchWm5E0BNKNPXDZNSXRtErYl+Bc5o+6pdb0H0G8etQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cw7VcQ077hD4QmgqC6HIhzlOZZ5OEmNh3lQPujFs/rI=;
 b=c0Cf1tuU28pmbjH7RLSFoxkJThPTQnnYJFw8Y8R8BHTXzGIBLdTEWHL7+cXXpzV8YUx30Oee83c8NjEjBaENY3fJ3uk3QVSBzYc3+6H0xBNWyFXgewZ1OGNySkSDxfxY/3eTOVGB0Udw1VW6U+mj38O8BbBrCsGdFcGXxg9w/87l3LFR/JSEDFWiAaPCVbl+bVHuF7jVvV9vJmuL7YVmkEFosCBc6Kvdedizho284imj1Rdj0VfpDh63an2tDyylu4mUQHJvTwkbTTPiOTDdf19SYihM3E36ry6cXDefJQX4feylC2UD/gX+8liWS5oqH0+5wBarUZ/yLYm+5m2FkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cw7VcQ077hD4QmgqC6HIhzlOZZ5OEmNh3lQPujFs/rI=;
 b=bWOP8vgpsXhpSgj8CpS2C5BvY0zmq/uB8ISDTz4Xcnf6A3lRArs2tTMBHM+I4jnuSbriFKyR8n2CLhS9LOwrlxiGxuSY9N++j9cxmUcgM8jXSUqCoFQDbDiG3ZEeGocTzrEzts14IyG3UqnHxDFn3b0PbE9MuzxwWH2thBpChq4=
Received: from BY5PR15MB3636.namprd15.prod.outlook.com (52.133.252.91) by
 BY5PR15MB3571.namprd15.prod.outlook.com (52.133.252.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Mon, 21 Oct 2019 22:30:28 +0000
Received: from BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::7887:4f9c:70df:285c]) by BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::7887:4f9c:70df:285c%4]) with mapi id 15.20.2347.029; Mon, 21 Oct 2019
 22:30:28 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Ed Tanous <ed.tanous@intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: It's been fun
Thread-Topic: It's been fun
Thread-Index: AQHViE8WTUag1CxA2ESi3hfOf4A2dqdlOE+A
Date: Mon, 21 Oct 2019 22:30:27 +0000
Message-ID: <B3180A82-CE73-451A-8C6B-B05D195739CE@fb.com>
References: <27c9e9df-6d1f-5fce-ed88-57d9cbfa71f9@intel.com>
In-Reply-To: <27c9e9df-6d1f-5fce-ed88-57d9cbfa71f9@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:e2e8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e987bcc5-462c-40b7-d02f-08d756764651
x-ms-traffictypediagnostic: BY5PR15MB3571:
x-microsoft-antispam-prvs: <BY5PR15MB357154E3A4E928DF0069484FDD690@BY5PR15MB3571.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(39860400002)(396003)(136003)(346002)(366004)(199004)(189003)(446003)(11346002)(99286004)(2501003)(102836004)(2616005)(76116006)(316002)(91956017)(66446008)(66476007)(66556008)(64756008)(476003)(186003)(36756003)(486006)(71200400001)(66946007)(3480700005)(46003)(71190400001)(8676002)(110136005)(8936002)(76176011)(5660300002)(6506007)(4744005)(81166006)(33656002)(81156014)(6116002)(25786009)(6512007)(86362001)(2906002)(305945005)(7736002)(6246003)(478600001)(229853002)(256004)(14454004)(6486002)(6436002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR15MB3571;
 H:BY5PR15MB3636.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Rp4u42+9PgPGOGLWeHuCWxu0cedqngJAvKFjN81TuO/h9eQh6YE8VLi5w4wwYttbJZZNXKkeJZsCve30qe2E7Yx9d0Km8Y0VJi4ad04mbQwDFi1T/+HhdNjOYCLWPeDsTMgaQN8HYqhCHRL7UuJZHzBZsuE9B3GLe3Hw8B7Nft0fy0Ar2ceOV9AH+ZRKYKweZSatY9ZhzxyqyopI0Z1Fvbf+gmLcQQGpOvAVFfFKKe+kBHECcjcQk0RVZXv1ET1NYaNONxvkyS7IwB3zPBlM7U+An+NAYsoSODUs7Jbt7ich45wBEe1zoBdIS4pohd8RAFFgzMFrKqq9toNKx1R9KQPJtaN/aeyCrB7mqx+U1GC5Eo7RSirMmLuCbCoT16eOKSU4B/L/v5bDav0nnEgov3n+FS3Lcq/GPVtsbsy3jC3gKOV0qI0jEnbaaenD6k3n
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <A45A75C734B12F41ABF9FFE043B156F6@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e987bcc5-462c-40b7-d02f-08d756764651
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 22:30:27.9852 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sg6Lzk3LELykTO06YTHJcqt6wlzOe7T15IkEYatHu/tkX5CI4xioh11BIOiXPLqHwk+jP5WRGrnZFzuq4p5Kng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3571
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-21_06:2019-10-21,2019-10-21 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 clxscore=1015
 phishscore=0 mlxscore=0 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1908290000 definitions=main-1910210211
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

R29vZCBsdWNrIEVkLCBJdCB3YXMgcmVhbGx5IGdyZWF0IHdvcmtpbmcgd2l0aCB5b3UuDQpJIGFt
IHN1cmUgd2Ugd2lsbCBjcm9zcyBhZ2Fpbi4NCg0K77u/T24gMTAvMjEvMTksIDE6MzUgUE0sICJv
cGVuYm1jIG9uIGJlaGFsZiBvZiBFZCBUYW5vdXMiIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVt
a2E9ZmIuY29tQGxpc3RzLm96bGFicy5vcmcgb24gYmVoYWxmIG9mIGVkLnRhbm91c0BpbnRlbC5j
b20+IHdyb3RlOg0KDQogICAgQWxsLA0KICAgIA0KICAgIFRoaXMgd2VlayB3aWxsIGJlIG15IGxh
c3Qgd2VlayBhdCBJbnRlbC4gIEknbGwgYmUgbW92aW5nIG9udG8gc29tZXRoaW5nDQogICAgZWxz
ZSBub24tT3BlbkJNQyByZWxhdGVkIGZvciBhIGJpdDsgIFdoaWxlIEkgbWF5IGNoZWNrIGluIG9u
IHRoZSBwcm9qZWN0DQogICAgZnJvbSB0aW1lIHRvIHRpbWUsIGl0J3MgZ29pbmcgdG8gc3RvcCBi
ZWluZyBteSBkYXkgam9iLg0KICAgIA0KICAgIFlvdSdsbCBzdGlsbCBiZSBhYmxlIHRvIHJlYWNo
IG1lIGF0IG15IG90aGVyIGVtYWlsLCBlZEB0YW5vdXMubmV0LCBhbmQNCiAgICBzZXZlcmFsIGtl
eSBwZW9wbGUgYWNyb3NzIHRoZSBwcm9qZWN0IGluY2x1ZGluZyB0aGUgVFNDIGhhdmUgbXkgY2Vs
bA0KICAgIG51bWJlciBpZiB0aGVyZSdzIHNvbWUgdW5rbm93biBPcGVuQk1DICJlbWVyZ2VuY3ki
LCBidXQgSSBkb3VidCB0aGF0J3MNCiAgICBnb2luZyB0byBiZSBuZWVkZWQuICBGdW5jdGlvbmFs
bHksIEkndmUgbWFkZSBzdXJlIHRoYXQgZXZlcnkgcmVwbyBJDQogICAgbWFpbnRhaW4gaGFzIGJh
Y2t1cCBtYWludGFpbmVycywgc28gYXMgb2YgdGhlIDI1dGgsIGl0IHdpbGwgZmFsbCB0bw0KICAg
IHRob3NlIGluZGl2aWR1YWxzIHRvIGRvIG5ldyByZXZpZXdzIGZvciB0aG9zZSBpbmRpdmlkdWFs
IHJlcG9zLiAgSSdsbCBiZQ0KICAgIHB1c2hpbmcgdXBkYXRlcyB0byB0aGUgTUFJTlRBSU5FUlMg
ZmlsZXMgc2hvcnRseSB0byB0aGF0IGVmZmVjdC4NCiAgICANCiAgICBUaGFua3MgeW91IGZvciBh
bGwgdGhlIHBhdGNoZXMsIGlkZWFzLCByZXZpZXdzLCBhbmQgbWVyZ2VzIHRoYXQgb3RoZXJzDQog
ICAgaGF2ZSBkb25lIGZvciBtZSBvdmVyIHRoZSBsYXN0IGNvdXBsZSB5ZWFycy4NCiAgICANCiAg
ICBVbnRpbCB3ZSBtZWV0IGFnYWluLA0KICAgIA0KICAgIC1FZA0KICAgIA0KDQo=
