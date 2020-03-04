Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6371786F7
	for <lists+openbmc@lfdr.de>; Wed,  4 Mar 2020 01:23:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XF320JbrzDqQr
	for <lists+openbmc@lfdr.de>; Wed,  4 Mar 2020 11:23:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=0332e40355=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=S8UANh/2; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=DVTySZkY; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XF256XpKzDqQ9
 for <openbmc@lists.ozlabs.org>; Wed,  4 Mar 2020 11:22:16 +1100 (AEDT)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02408vDN027478; Tue, 3 Mar 2020 16:22:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=/2oz+pxpvPWzFAidCY//ViU0gB+OECZIYh5z4Z3f6y0=;
 b=S8UANh/2vBLNKvPIH75aCfj4nVifDnPJBw+iOmgYlKUT7jlkNUyU7qYVu7mh8pX0IeAN
 Syf2pvUmnYbsi0u03tu8MCKbdg51dLk5bQlZDqAWhS+ERWFN1HMRAvaKU2PiZ6foHfwz
 LcTiF11wJid9GQ0TZ5/tuIVmAv83Q98ISMA= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2yhpfwm1ae-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 03 Mar 2020 16:22:07 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.173) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Tue, 3 Mar 2020 16:22:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJ3CSpkZMGpBG6T0ncfxVLurwkjIKQjydeXwE5Ij9nhExWQqb8NGLrQzUvgulmtFu/fqPdhOTc7X4V2J43G4cluNYULH13dDYYMv9htb3Rq0tyRMY3lYAbjuyQsBpZ2MYNcQCaB4MSxPQTWy050JMpOVqEqazFir2A7YbSf+yurvOfpjU8v7CTC8IJ9g5+6A0d/3ZptEBfaEYnQm57D4UQ9vBBBHaV9c1uGNSFgxUM5+LnuEcSDcED/YUHql5issHdx6plX+yuMXJpwwnI26eAXd9RXzw2P65YVlW9iQfdKDPsQNNTwWrGQVM+OrKqNiKn9wdE3WgvHOCjTzmYgi6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2oz+pxpvPWzFAidCY//ViU0gB+OECZIYh5z4Z3f6y0=;
 b=LF+tQcKgv0DEn4o4iCTDtxiEDRhvSq1dyudoocupIbGaaOi5D6PAooV5kDU1t6QECl1o5ZujSzkVd+wN5+vx4dxSGWsLT6v0skIOhBv1mEMElMd5b6kn5gMuGc9ciONpYFtsVIeEOCl8fyBZW4Y3bPbT0vUKj3BPn2Rl93/g3HNZc8NN+yyqVABMBx01GJdDujs75YPawi698HYfmRrei0EhLzoxAXPLomMQVdm95bM4bponQTpTfxMkYjBpSg79PZUT+hg68t5mANeeRRTjnwrSsyss9jiWzxlxuLpWD/lvFvhg5hwoFYNjHoWU5wNXAJvrWjPguiVm3vdt3xy0+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2oz+pxpvPWzFAidCY//ViU0gB+OECZIYh5z4Z3f6y0=;
 b=DVTySZkYoNs5kKmhhiJ9lrTq5hw6MKUMw1CGUkR9911Spv6jm6cRjvC3oRW9+3TiAglKynvPFfIS7Ez6JWgPPP1QFyAH8/1C2PqqtN+WJxl1hAG3F8oQG54pU0ddgGQb4kFyFGSpdlcNnMbAfbw1XiNG98O65LANzyAFeHkE3Nc=
Received: from MW3PR15MB3947.namprd15.prod.outlook.com (2603:10b6:303:49::9)
 by MW3PR15MB3866.namprd15.prod.outlook.com (2603:10b6:303:50::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15; Wed, 4 Mar
 2020 00:22:05 +0000
Received: from MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936]) by MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936%4]) with mapi id 15.20.2772.019; Wed, 4 Mar 2020
 00:22:05 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Andrew Jeffery <andrew@aj.id.au>, Kumar Thangavel <thangavel.k@hcl.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: obmc-console design for multi host support
Thread-Topic: obmc-console design for multi host support
Thread-Index: AQHV54I/nLHE21W9uEuIi5D/dIqKpKgj/zQAgAmtGoCAAS9LgIAA4TAAgAaVjgCAAM5lgA==
Date: Wed, 4 Mar 2020 00:22:05 +0000
Message-ID: <11C9DB76-A38F-41B3-AA20-1FFD79E12E8C@fb.com>
References: <SG2PR04MB3029CF9F520DF543B57B93C2FD100@SG2PR04MB3029.apcprd04.prod.outlook.com>
 <f136d4ad-65e6-4e74-8f53-2ca3edaf9288@www.fastmail.com>
 <SG2PR04MB30295AD664D4B5BD5F24EFD3FD130@SG2PR04MB3029.apcprd04.prod.outlook.com>
 <SG2PR04MB302996468E42284DE73358A6FDEA0@SG2PR04MB3029.apcprd04.prod.outlook.com>
 <5dd6cbbe-5f58-4370-82c7-55c8dc22ca5b@www.fastmail.com>
 <26B24CEE-C910-4FB1-B316-8E0676E3AD16@fb.com>
 <5867808b-871f-435e-aa79-10bf64a8f4b5@www.fastmail.com>
In-Reply-To: <5867808b-871f-435e-aa79-10bf64a8f4b5@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:500::6:f398]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2c3c588-7838-4278-adbe-08d7bfd211bf
x-ms-traffictypediagnostic: MW3PR15MB3866:
x-microsoft-antispam-prvs: <MW3PR15MB38661BE6E40E0E703B189628DDE50@MW3PR15MB3866.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0332AACBC3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(346002)(39860400002)(396003)(376002)(189003)(199004)(66476007)(76116006)(33656002)(64756008)(2616005)(110136005)(66556008)(66446008)(66946007)(316002)(2906002)(5660300002)(36756003)(81166006)(4326008)(6512007)(8936002)(8676002)(478600001)(6486002)(86362001)(81156014)(186003)(71200400001)(6506007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MW3PR15MB3866;
 H:MW3PR15MB3947.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Xs3CVlWOkFrB2YV2HMjHnH0MUNiUNsNAVyhglT7K736t+O5/jopM2Y6uDdjJYAdAj0GISjYPF8C13SG1alZI3+4zZ+WA9kVNaB+Z1q7jvwSrMLBlCjWwrUO6kZiCdjPcUSVx2dFpXwjB8gdSeI9lF5uP2qWh00zUjojXoVjbyMlPcpck2+wzaXJVXFFJ8PRjat/n/eTie7/b13i58m/uCh5N3ov01l0asFBofQR667oHQqRjX22CtajUhKpsftY9sI9nFYK1qNBhxRefD42YVDjt+nCKywJkDQKffQSdlBjYxrpzwTB3/6iV3aHXj71WqeMEgnn0BIZIOEBwXoW2V4ky2hyu7EfI6drnB8EdCXrBA+hZnuXmWgL47UNe5IMuvrXMe7X8+Hr4klmYqpvZtA3p1wtGBNorn5C5+LI149vbcVLVVRJy/86+bVsXKF7j
x-ms-exchange-antispam-messagedata: 5pynaTwlF+sTY9SgyRauSqA8wFFp3zNpq4162ktEgEAlnNivru1f8+nQvVtMehFMziz8wukF0+/+gz6WoVj6nZHJLIVIAYdjHOElqOT1bJ82nbpmtXHIv/ALAnDMzVktsptMzqoVKT6kiWFN7i4XdYTiLOxKZ+nPXI7azWHH2bJaBf03zneFpSXORqbqJhkf
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <5FBF19D15903894FA95338FA79F90620@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d2c3c588-7838-4278-adbe-08d7bfd211bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2020 00:22:05.6224 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pCxgJBNmek7GYJfx43uWfJjdXC03omh8egFdnRM+VMY/+eXbGgW5A+v9mIGrcF/+Gap7hGJ/ripCuc23YuBVNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3866
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-03_08:2020-03-03,
 2020-03-03 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 impostorscore=0
 mlxscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003040000
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
Cc: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

UGVyZmVjdCwgSXQgaXMgd29ya2luZyBmb3IgYWxsIGZvdXIgc2VydmVyIGZvciBtZS4NCg0K77u/
T24gMy8yLzIwLCA4OjAzIFBNLCAiQW5kcmV3IEplZmZlcnkiIDxhbmRyZXdAYWouaWQuYXU+IHdy
b3RlOg0KDQogICAgT24gRnJpLCAyOCBGZWIgMjAyMCwgYXQgMTg6MDAsIFZpamF5IEtoZW1rYSB3
cm90ZToNCiAgICA+IE9uIDIvMjcvMjAsIDI6MDUgQU0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBB
bmRyZXcgSmVmZmVyeSIgDQogICAgPiAgICAgDQogICAgPiAgICAgYGBgDQogICAgPiAgICAgJCBs
cyAtMSAvZXRjL29ibWMtY29uc29sZQ0KICAgID4gICAgIGNsaWVudC4yMjAwLmNvbmYNCiAgICA+
ICAgICBzZXJ2ZXIudHR5VlVBUlQwLmNvbmYNCiAgICA+ICAgICBgYGANCiAgICA+IFdoYXQgYXJl
IG90aGVyIGNvbnRlbnRzIG9mIGNsaWVudCBhbmQgc2VydmVyIGNvbmYgZmlsZSBvdGhlciB0aGFu
IHNvY2tldC1pZD8NCiAgICANCiAgICBXaGF0ZXZlciBlbHNlIHlvdSB3ZXJlIHByZXZpb3VzbHkg
c3BlY2lmeWluZyBmb3IgdGhlIHNlcnZlci4NCiAgICANCiAgICA+ICAgICANCiAgICA+ICAgICBT
byB0byBtYXAgdGhlIGNsaWVudCBhc3NvY2lhdGVkIHdpdGggcG9ydCAyMjAwIHRvIHRoZSBzZXJ2
ZXIgYXNzb2NpYXRlZA0KICAgID4gICAgIHdpdGggdHR5VlVBUlQwIHdlIHNldCB0aGUgc2FtZSBz
b2NrZXQtaWQgdmFsdWUgaW4gYm90aCBmaWxlczoNCiAgICA+IA0KICAgID4gQ2FuIHRoaXMgc29j
a2V0LWlkIGJlIGFueSByYW5kb20gd29yZCBhbmQgY2FuIHRoaXMgYmUgc2FtZSBhY3Jvc3MgbXVs
dGlwbGUNCiAgICA+IEhvc3QgKGNsaWVudC9zZXJ2ZXIpIGNvbmZpZ3VyYXRpb24uIEkgbWVhbiwg
ZG8gd2UgbmVlZCBkaWZmZXJlbnQgc29ja2V0LWlkIGZvcg0KICAgID4gY2xpZW50LjIyMDAgYW5k
IGNsaWVudC4yMjAxIG9yIGl0IGNhbiBiZSBzYW1lLg0KICAgIA0KICAgIFRoZSBzb2NrZXQtaWQg
aXMgYSB1bmlxdWUgcG9ydGlvbiBmb3IgdGhlIHVuaXggZG9tYWluIHNvY2tldCBjcmVhdGVkIGJ5
IHRoZQ0KICAgIG9ibWMtY29uc29sZS1zZXJ2ZXIgaW5zdGFuY2UuIFRoZSBzZXJ2ZXIgbmVlZHMg
dG8ga25vdyB0aGlzIGJlY2F1c2UgaXQgbmVlZHMNCiAgICB0byBrbm93IHdoYXQgdG8gbmFtZSB0
aGUgcGlwZTsgdGhlIGNsaWVudCBuZWVkcyB0byBrbm93IGl0IGFzIGl0IG5lZWRzIHRvIGZvcm0N
CiAgICB0aGUgYWJzdHJhY3Qgc29ja2V0IG5hbWUgdG8gd2hpY2ggdG8gY29ubmVjdC4NCiAgICAN
CiAgICBJbiBnZW5lcmFsIHVubGVzcyB5b3UncmUgbG9va2luZyB0byBleHBvc2UgdGhlIHNhbWUg
Y29uc29sZSBvbiBfZGlmZmVyZW50Xw0KICAgIG5ldHdvcmsgcG9ydHMsIHlvdSB3YW50IHRvIHBh
aXIgZWFjaCBjbGllbnQgd2l0aCBhIHVuaXF1ZSBzZXJ2ZXIuDQogICAgDQogICAgSGVyZSdzIGFu
IEFTQ0lJIGRpYWdyYW06DQogICAgDQogICAgICAgICAgICAgICAgICAgKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwNCiAgICAgICAgICAgICAgICAgICB8ICAgICAgIG9ibWMt
Y29uc29sZS1jbGllbnQgICAgICB1bml4IGRvbWFpbiBzb2NrZXQgICAgICAgICBvYm1jLWNvbnNv
bGUtc2VydmVyICAgICAgICAgICAgICB8DQogICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfA0KICAgICAgICAgICAgICAgICAgIHwgICAgICstLS0t
LS0tLS0tLS0tLS0tLS0tLS0rICAgICAgICAgICAgICAgICAgICAgICAgICAgKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLSsgICAgICAgICAgIHwNCiAgICAgICAgICAgICAgICAgICB8ICAgICB8IGNs
aWVudC4yMjAxLmNvbmYgICAgfCAgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLSsgIHwgc2VydmVyLnR0
eVZVQVJUMS5jb25mICB8ICAgICAgICAgICB8DQogICAgICAgICAgICAgICArLS0tKy0tKyAgKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLSsgIHwgICAgICAgICAgICAgICAgICAgICB8ICArLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tKyAgKy0tLS0tLS0tKy0tLS0tLS0rDQogICAgTmV0d29yayAgICB8IDIy
MDEgKy0tPiAgICAgICAgICAgICAgICAgICAgICstPisgQG9ibWMtY29uc29sZS5ob3N0MSArPC0r
ICAgICAgICAgICAgICAgICAgICAgICAgPC0tKyAvZGV2L3R0eVZVQVJUMSB8ICAgVUFSVHMNCiAg
ICAgICAgICAgICAgICstLS0rLS0rICB8IHNvY2tldC1pZCA9ICJob3N0MSIgfCAgfCAgICAgICAg
ICAgICAgICAgICAgIHwgIHwgc29ja2V0LWlkID0gImhvc3QxIiAgICB8ICArLS0tLS0tLS0rLS0t
LS0tLSsNCiAgICAgICAgICAgICAgICAgICB8ICAgICB8ICAgICAgICAgICAgICAgICAgICAgfCAg
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLSsgIHwgICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAg
ICAgICB8DQogICAgICAgICAgICAgICAgICAgfCAgICAgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLSsg
ICAgICAgICAgICAgICAgICAgICAgICAgICArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKyAgICAg
ICAgICAgfA0KICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwNCiAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8DQogICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfA0KICAgICAgICAgICAgICAgICAgICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLSsNCiAgICANCiAgICBEb2VzIHRoYXQgaGVscD8NCiAgICANCiAgICBBbmRyZXcN
CiAgICANCg0K
