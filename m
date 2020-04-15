Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F053B1AB2D9
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 22:59:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492ZVd0cD7zDrBj
	for <lists+openbmc@lfdr.de>; Thu, 16 Apr 2020 06:59:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=40.107.243.104;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.a=rsa-sha256 header.s=selector2 header.b=h7woSIuQ; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2104.outbound.protection.outlook.com [40.107.243.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492ZTy6Z8SzDr5l
 for <openbmc@lists.ozlabs.org>; Thu, 16 Apr 2020 06:59:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eOdA9HbhzsXAlIo8Y5nPAW5EXdU8dXhumQ15EXEdg09ZsRBrfSufKMu8l7nu71iX7CpR0L28YDg+2v3VigQ1s/4smgKFGxGXD8AiIXxFv6o8BV1PXZ3iQ9f/Tl/GlyS6zEYuuKmRPdCvReP2CJlWFPk5y9valz1EbU4TS3Fzm0v8mKfvq1vCVm6ZGv/NHYn9xH+OUqQIp649WiCCc/Y07YaYkHCAlDfND0py2qtqMHJb5SSjy4oo8dFyV8Tji0YzvmTcI9BjJvHb32w6gUdx7GJHfOnlqDwFPCol8sOzbhjG9rtHSoV6h63e6Q2xyNzB0uVRpz0yH0cSffNFkjw5SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZmBhcVIeJb0pb9aXGi2chQqUrXpWT+dF62p62GlbFxk=;
 b=bx48WdnFbQzxH2igREKGYq97PXhKLrkkrkNU1RZO3fpUhOpGCkNqgdNXT/Z7Do2p2eTOswEa5jbbN5n+/HYGIOT0cHKlYt736C3zq2nGfSBt0IgbGwxqWlVMc1TZ/bZ93BqN/su71SLBd/GPq4Sd5CZTPOPvDnqvHbuIZk7jYhHwn2G5AauWdYc6PZz/NYBXh4PrLrAjLznl75XsFdaI6DYtQBwwgl9AOYLkNe9xBdxCb8dN/8ZSKCV4/azoJIYpAfKSfsyhV+bjTdpjk0j/MvyxgZvQ5lNi7j37Tmvf2oSiAzjLT/Nu7aaVqUNL8gDhR8H9bc6fXLoaLSyWtmqf3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZmBhcVIeJb0pb9aXGi2chQqUrXpWT+dF62p62GlbFxk=;
 b=h7woSIuQgMahC+Tux1Rev3MSboopJQQcnylRQCNgtxpejxtKCJ8MaQCgbjX1z03GFGFJInBvPpVijCYQi+crGby/bSsAoVgqKd5BswqrzCp1Jr1K5/rO/g/XYFDCV7Q76XRT0iG5noiPpz7ieyCGsUlpr4+gV9KlgV0H2seCdk8=
Received: from CH2PR21MB1510.namprd21.prod.outlook.com (2603:10b6:610:8e::7)
 by CH2PR21MB1399.namprd21.prod.outlook.com (2603:10b6:610:8e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.10; Wed, 15 Apr
 2020 20:59:12 +0000
Received: from CH2PR21MB1510.namprd21.prod.outlook.com
 ([fe80::6838:df24:78e3:e78a]) by CH2PR21MB1510.namprd21.prod.outlook.com
 ([fe80::6838:df24:78e3:e78a%9]) with mapi id 15.20.2937.000; Wed, 15 Apr 2020
 20:59:12 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: Vijay Khemka <vijaykhemka@fb.com>, "james.feist@linux.intel.com"
 <james.feist@linux.intel.com>
Subject: RE: nvme sensors
Thread-Topic: nvme sensors
Thread-Index: AQHWEx5rEqsJqc4WEEC8M3OzxbfV76h5pxOAgADRXfD//5lHAIAAmM4Q
Date: Wed, 15 Apr 2020 20:59:12 +0000
Message-ID: <CH2PR21MB1510AEF844D82AC9D897B902C8DB0@CH2PR21MB1510.namprd21.prod.outlook.com>
References: <0F332F74-FF51-4239-8B52-2EBA770AE6CC@fb.com>
 <8022481D-7C72-4A7B-AF9C-D144177B4C88@fb.com>
 <CH2PR21MB1510E11F9772C45D12EEA0F1C8DB0@CH2PR21MB1510.namprd21.prod.outlook.com>
 <82E67AAA-1BD8-41D8-BE27-966F840236E2@fb.com>
In-Reply-To: <82E67AAA-1BD8-41D8-BE27-966F840236E2@fb.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [50.35.81.9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 75104b20-8bb0-4234-8b69-08d7e17fd9ab
x-ms-traffictypediagnostic: CH2PR21MB1399:
x-microsoft-antispam-prvs: <CH2PR21MB1399C74C5AB68893E604B7BDC8DB0@CH2PR21MB1399.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0374433C81
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR21MB1510.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(33656002)(7696005)(8936002)(478600001)(8990500004)(5660300002)(186003)(7116003)(316002)(86362001)(10290500003)(81156014)(110136005)(6506007)(53546011)(8676002)(52536014)(9686003)(82960400001)(82950400001)(55016002)(66476007)(26005)(3480700007)(2906002)(4326008)(76116006)(64756008)(71200400001)(66446008)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bMJIFvps/hhJagtrEQZviSEafP0nZeXkflcvMlIeFLIA5KAEuQS4QdMJ0VnT0jUeDpnKy2vCjXGCBVjCc0IQo0PBpv0PB2VclexqeKQGG8f7ifNMIaZVUdcLKXFI5UkJkfgGpUvhMVslOLbC7UfUQICnhTakchy4s9V2h2njdTaue2aig/2soCX1CCzX4cjXuVTOH+szi8/zKearKRZI7psD/tXWZpJ7L87nbKO4ui0n6jC2ox9ZDv0mXqjhZmzV5P3Qdm2cW9jHutpgbx2aO03swpx+zfWdsNr1JykmV9B/JaVMdpa5vRjWv5gpjvm3EAHtzbmljUj9/XNMWdW631eQfDl3x3a/tmDOERsutwjyXpsb4pk6AmbM0Wznyw78J1yfylRqqmWQ5/r4BzHTmpxsXjyXLGsKdayYC5GIwyoC1augqLQIhZgz5U2OVNMD
x-ms-exchange-antispam-messagedata: a7XmiNSUpzBtdMcU76aGolc4WR3qh2hceVUxPZPkEMfevZf0F2gjOGFwJ76+MQBcxNPGME1B9N7mE2IP7NvpGchlWfRH3rIYq0aBwyiBHDbf3a/IFqMasweWh4DQ+I5G6/EpuzPt9DrsO7d0hYXYKg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75104b20-8bb0-4234-8b69-08d7e17fd9ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2020 20:59:12.4223 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /vT2IU9PRR7s3SSMNmybd7c3mj0FLa3DxorInS5+yzcu5vx+KM6KVOzPHUng8oWj1dnP1M/TwOa6afNRm6Cgfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR21MB1399
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

VGhhbmtzIFZpamF5LiAgDQoNCkNhbiBhbnlvbmUgY29tbWVudCBvbiBNQ1RQIGZlYXR1cmUgY29t
cGxldGVuZXNzIG9uIE9wZW5CTUM/ICBJIHJldmlld2VkICBsaWJNQ1RQIGFuZCBzb21lIG9mIGJp
bmRpbmdzIGJ1dCBpdHMgbm90IGNsZWFyIHdobyBpcyB1c2luZyB0aGF0PyAgDQoNCk5lZXJhag0K
DQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogVmlqYXkgS2hlbWthIDx2aWpheWto
ZW1rYUBmYi5jb20+IA0KU2VudDogV2VkbmVzZGF5LCBBcHJpbCAxNSwgMjAyMCAxMTo1MCBBTQ0K
VG86IE5lZXJhaiBMYWRrYW5pIDxuZWxhZGtAbWljcm9zb2Z0LmNvbT47IGphbWVzLmZlaXN0QGxp
bnV4LmludGVsLmNvbQ0KQ2M6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KU3ViamVjdDogW0VY
VEVSTkFMXSBSZTogbnZtZSBzZW5zb3JzDQoNClllcyB0aGVyZSBpcyBhIHN1cHBvcnQgZm9yIE1D
VFAgYWxzbyBpbiBjb2RlIGJ1dCBJIGhhdmUgbm90IHRlc3RlZCB0aGlzIGZlYXR1cmUgc28gY2Fu
J3QgY29tbWVudC4NCg0K77u/T24gNC8xNS8yMCwgMTA6NTkgQU0sICJOZWVyYWogTGFka2FuaSIg
PG5lbGFka0BtaWNyb3NvZnQuY29tPiB3cm90ZToNCg0KICAgIEhpIFZpamF5LCANCiAgICANCiAg
ICBBcmUgdGhleSBpbXBsZW1lbnRlZCBvdmVyIE1DVFAgb3ZlciBTTUJVUz8gDQogICAgDQogICAg
TmVlcmFqDQogICAgDQogICAgRnJvbTogb3BlbmJtYyA8b3BlbmJtYy1ib3VuY2VzK25lbGFkaz1t
aWNyb3NvZnQuY29tQGxpc3RzLm96bGFicy5vcmc+IE9uIEJlaGFsZiBPZiBWaWpheSBLaGVta2EN
CiAgICBTZW50OiBXZWRuZXNkYXksIEFwcmlsIDE1LCAyMDIwIDU6MjggQU0NCiAgICBUbzogamFt
ZXMuZmVpc3RAbGludXguaW50ZWwuY29tDQogICAgQ2M6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9y
Zw0KICAgIFN1YmplY3Q6IFtFWFRFUk5BTF0gUmU6IG52bWUgc2Vuc29ycw0KICAgIA0KICAgIFNv
cnJ5LCBwbGVhc2UgaWdub3JlIHRoaXMsIEkgZm91bmQgTlZNRSBpbiBkYnVzLXNlbnNvcnMuIEkg
bmVlZGVkIHRvIHVwZGF0ZSByZXBvIGluIGxvY2FsIHdvcmtzcGFjZS4NCiAgICANCiAgICBSZWdh
cmRzDQogICAgLVZpamF5DQogICAgDQogICAgDQogICAgRnJvbTogVmlqYXkgS2hlbWthIDxtYWls
dG86dmlqYXlraGVta2FAZmIuY29tPg0KICAgIERhdGU6IFdlZG5lc2RheSwgQXByaWwgMTUsIDIw
MjAgYXQgNTowNyBBTQ0KICAgIFRvOiAibWFpbHRvOmphbWVzLmZlaXN0QGxpbnV4LmludGVsLmNv
bSIgPG1haWx0bzpqYW1lcy5mZWlzdEBsaW51eC5pbnRlbC5jb20+DQogICAgQ2M6ICJtYWlsdG86
b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnIiA8bWFpbHRvOm9wZW5ibWNAbGlzdHMub3psYWJzLm9y
Zz4NCiAgICBTdWJqZWN0OiBudm1lIHNlbnNvcnMNCiAgICANCiAgICBIaSBKYW1lcywNCiAgICBE
byB3ZSBoYXZlIHN1cHBvcnQgZm9yIE5WTUUgc2Vuc29ycyBpbiBkYnVzIHNlbnNvcnM/IEkgc2Vl
IHBob3NwaG9yLW52bWUgcmVwbyB3aGljaCBuZWVkcyBjb25maWd1cmF0aW9uIGZyb20geWFtbCBm
aWxlLCBpcyBpdCBwb3NzaWJsZSB0byBpbnRlZ3JhdGUgdGhpcyB3aXRoIGVudGl0eSBtYW5hZ2Vy
Pw0KICAgICANCiAgICBSZWdhcmRzDQogICAgLVZpamF5DQogICAgDQoNCg==
