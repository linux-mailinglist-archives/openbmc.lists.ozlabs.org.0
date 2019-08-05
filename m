Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2639812BD
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 09:07:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46283S3vBczDqSS
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 17:07:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=hyvedesignsolutions.com (client-ip=66.46.24.197;
 helo=smtp5.synnex.com; envelope-from=bradc@hyvedesignsolutions.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=hyvedesignsolutions.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=synnexcorp.onmicrosoft.com
 header.i=@synnexcorp.onmicrosoft.com header.b="n2pwK4k6"; 
 dkim-atps=neutral
X-Greylist: delayed 908 seconds by postgrey-1.36 at bilbo;
 Mon, 05 Aug 2019 16:57:09 AEST
Received: from smtp5.synnex.com (smtp5.synnex.com [66.46.24.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4627qT5ZrSzDqhb
 for <openbmc@lists.ozlabs.org>; Mon,  5 Aug 2019 16:57:08 +1000 (AEST)
Received: from GSC-EXCH-HTS2.synnex.org ([192.168.9.180])
 by smtp5.synnex.com  with ESMTP id x756fpgs011470-x756fpgv011470
 (version=TLSv1.0 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=CAFAIL)
 for <openbmc@lists.ozlabs.org>; Mon, 5 Aug 2019 02:41:52 -0400
Received: from GSC-EXCH7.synnex.org (10.84.32.36) by GSC-EXCH-HTS2.synnex.org
 (192.168.9.180) with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Mon, 5 Aug 2019 02:41:51 -0400
Received: from GSC-EXCH6.synnex.org (10.84.32.34) by GSC-EXCH7.synnex.org
 (10.84.32.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 5 Aug 2019
 02:41:50 -0400
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (104.47.32.54) by
 gsc-exch6.synnex.org (10.84.32.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 5 Aug 2019 02:41:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AlOf0GCrHtPRrP522oXJBK+Obbc/HUCTdl3D2GulfrX5Du6c8kDUWG7yiB4GfZR2NIq0Ovc0s5oURSxLh4HREfnjL8bD1EyMh+XEABywFrxuMk2fx73k4foUUW8Gue3Ht/ScNReVd1DNhDNr9dtjaIQrTXEJx8JmMybazJBqHI0/z+wLoJ86lMs4XbSlN93WV5ATzIAhurKDmgxDJmgCJcME4arjN9UXdppjbaegbJrTsBqNjmBT3tsOJUohBJUGRFbDCuMWAYj2m25Cyp/fx5NVSQvZrn+7qTtNZyDhMTxyABEk2cEjpTDYMLfWO1XHWw+nEd87a5CumzKzIJQ84A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFg+ey6j+sNtH/C2QII+CtDkVM8tofY2Ix2rdhTUg/M=;
 b=SUwwJw4vYg9Me/YMALUhzX04+HjKB+fXFUanesFP/+9UOFveiYOApwQatVwluQNndBWi9rnxf5FjkbWRU35FfsPfKuoIb1NOOslhg/nx9OFlSHH5tcPBLcVfmHhSuewMX1CaCD6BNaBdtLnt3dYT1GWaw6deAHvCFw1vKj9eVQKxfhCje3Tt6LXDS7Y6u8NH6T3QqxS3xgajjE9fC58GUipErZGLCrEzHH4KRX8ZXp/sUufAe/eGrFGvsmn12AzS6DhN3xO5st1m6qhiV6740Eq9LYq8BomAqBFFL6dOG4WPAIbo5JpRFmkzC1o6ltrZuTA7u4nXzDlOYBonN3JrdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=hyvedesignsolutions.com;dmarc=pass action=none
 header.from=hyvedesignsolutions.com;dkim=pass
 header.d=hyvedesignsolutions.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synnexcorp.onmicrosoft.com; s=selector2-synnexcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFg+ey6j+sNtH/C2QII+CtDkVM8tofY2Ix2rdhTUg/M=;
 b=n2pwK4k6zcY0nkPGb5JST/aq+D9X58dxKtRtbaDlc773eeeDCJ3uJWtwGG5yq7OwfPddd1ffrmgKzotSFuR6LkqhLD03Kh9ubZOlUCtt+S7PXagtJDq7DY5jFyo7ZrsqKIF3fJAADyvadd5imOfZdW7E+F53bQ5OhdiFfrNEobs=
Received: from CH2PR04MB6933.namprd04.prod.outlook.com (20.180.14.75) by
 CH2PR04MB6888.namprd04.prod.outlook.com (20.180.5.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 06:41:49 +0000
Received: from CH2PR04MB6933.namprd04.prod.outlook.com
 ([fe80::3c4f:3a1b:7c38:1b82]) by CH2PR04MB6933.namprd04.prod.outlook.com
 ([fe80::3c4f:3a1b:7c38:1b82%3]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 06:41:49 +0000
From: Brad Chou <bradc@hyvedesignsolutions.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Nothing RPROVIDES 'virtual-p9-vcs-workaround' when creating
 romulus-prime machne
Thread-Topic: Nothing RPROVIDES 'virtual-p9-vcs-workaround' when creating
 romulus-prime machne
Thread-Index: AQHVS1jcrhl5fRucZEuchLVo1TKEOA==
Date: Mon, 5 Aug 2019 06:41:49 +0000
Message-ID: <29CA6B5F-505E-462F-A1DA-9146B97E01EC@hyvedesignsolutions.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=bradc@hyvedesignsolutions.com; 
x-originating-ip: [61.222.103.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61c7d583-6338-460a-0228-08d7196ffe95
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CH2PR04MB6888; 
x-ms-traffictypediagnostic: CH2PR04MB6888:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CH2PR04MB6888F29C7870FC1F784B24F6B9DA0@CH2PR04MB6888.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(39850400004)(346002)(396003)(376002)(136003)(199004)(189003)(53754006)(6436002)(6916009)(6486002)(1730700003)(81156014)(81166006)(33656002)(86362001)(53936002)(8676002)(54896002)(6306002)(6512007)(5640700003)(236005)(8936002)(66066001)(26005)(476003)(2616005)(966005)(478600001)(186003)(486006)(102836004)(36756003)(14444005)(71200400001)(71190400001)(606006)(256004)(7736002)(3846002)(76116006)(91956017)(2501003)(14454004)(66446008)(66946007)(66556008)(66476007)(5660300002)(25786009)(64756008)(6506007)(316002)(99286004)(6116002)(2351001)(2906002)(68736007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR04MB6888;
 H:CH2PR04MB6933.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: hyvedesignsolutions.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WHtO++qH6F3xomcUIEvqzlId1Jk0oLGSJ/uXBlETSpi1n/ubiwlS7hZZtC21SOE1tqfLw2sf7/byTG6YHBcHThp7pbAfWAFFHjQ97m1h463JSceQhEG0+wq1TGx8APJxYdDlQHNduOdirs1bDsdXZhhkBzoiDylwluXVabutYfK24qXdZhJeS6rT3KJW7wOnlr3RajokTjHAqAW39G+9AV6mMIbSBTmhTo11a+tL7OppAEfAV0eTX73GV9sgZBVYBoJL2ZsjRNWAwE5nlJBJY35nQ64z4IMNGO13xTzfGhgVpcHOTnldo8vL9aCVnnllA7zpi24YqK7OskCM6uyF++rRxSRsKNswIofw0pKfSxAxxudvrYWRNdlgnECDqeJSFO38OIx3yM8SpQ+CGPPi8ZnN9U6SWqwKJrtHJO49A8s=
Content-Type: multipart/alternative;
 boundary="_000_29CA6B5F505E462FA1DA9146B97E01EChyvedesignsolutionscom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 61c7d583-6338-460a-0228-08d7196ffe95
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 06:41:49.8616 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 972a0e27-c355-4fd7-9225-9266c8f332ac
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bradc@synnex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6888
X-OriginatorOrg: hyvedesignsolutions.com
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

--_000_29CA6B5F505E462FA1DA9146B97E01EChyvedesignsolutionscom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQWxsLA0KSSBmb2xsb3dlZCB0aGUgZXhhY3Qgc3RlcHMgaW4gQWRkIGEgTmV3IFN5c3RlbSB0
byBPcGVuQk1DLg0KaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvZG9jcy9ibG9iL21hc3Rlci9k
ZXZlbG9wbWVudC9hZGQtbmV3LXN5c3RlbS5tZA0KDQpVbmZvcnR1bmF0ZWx5LCBJIGdvdCB0aGlz
IGVycm9yIGFzICJFUlJPUjogTm90aGluZyBSUFJPVklERVMgJ3ZpcnR1YWwtcDktdmNzLXdvcmth
cm91bmQnIChidXQgL2hvbWUvYnJhZGMvRG9jdW1lbnRzL29wZW5ibWMvbWV0YS1vcGVucG93ZXIv
cmVjaXBlcy1waG9zcGhvci9ob3N0L3A5LXZjcy13b3JrYXJvdW5kLmJiIFJERVBFTkRTIG9uIG9y
IG90aGVyd2lzZSByZXF1aXJlcyBpdCnigJ0uDQoNCkkgbmVlZCB0byBkZWxldGUgb25lIGxpbmUg
aW4gcm9tdWx1cy1wcmluZS5jb25mIHRvIGZpeCB0aGlzIGVycm9yLg0KIyByZXF1aXJlIGNvbmYv
bWFjaGluZS9pbmNsdWRlL3A5LmluYw0KDQpJcyBhbnlvbmUgaGF2ZSBpZGVhIHdoeSBpdCBvbmx5
IGhhcHBlbnMgd2hlbiBjcmVhdGUgYSBuZXcgbWFjaGluZSA/DQpUaGFua3MuDQoNClRoZSBkZXRh
aWwgZXJyb3IgbWVzc2FnZXMgYXJlIDoNCg0KW2JyYWRjQGh5dmUtdGFpcGVpLWZ3LWxhYiBidWls
ZF0kIGJpdGJha2Ugb2JtYy1waG9zcGhvci1pbWFnZQ0KTG9hZGluZyBjYWNoZTogMTAwJSB8IyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjI3wgVGltZTogMDowMDowMA0KTG9hZGVkIDM1OTYgZW50cmllcyBmcm9tIGRlcGVuZGVu
Y3kgY2FjaGUuDQpQYXJzaW5nIHJlY2lwZXM6IDEwMCUgfCMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjfCBUaW1lOiAwOjAwOjAy
DQpQYXJzaW5nIG9mIDI0NDIgLmJiIGZpbGVzIGNvbXBsZXRlICgyNDQxIGNhY2hlZCwgMSBwYXJz
ZWQpLiAzNTk3IHRhcmdldHMsIDM1MSBza2lwcGVkLCAwIG1hc2tlZCwgMCBlcnJvcnMuDQpSZW1v
dmluZyAxIHJlY2lwZXMgZnJvbSB0aGUgYXJtdjYgc3lzcm9vdDogMTAwJSB8IyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjfCBUaW1lOiAwOjAwOjAwDQpSZW1vdmluZyAxIHJl
Y2lwZXMgZnJvbSB0aGUgcm9tdWx1c19wcmltZSBzeXNyb290OiAxMDAlIHwjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjfCBUaW1lOiAwOjAwOjAwDQpOT1RFOiBSZXNvbHZpbmcgYW55IG1p
c3NpbmcgdGFzayBxdWV1ZSBkZXBlbmRlbmNpZXMNCkVSUk9SOiBOb3RoaW5nIFJQUk9WSURFUyAn
dmlydHVhbC1wOS12Y3Mtd29ya2Fyb3VuZCcgKGJ1dCAvaG9tZS9icmFkYy9Eb2N1bWVudHMvb3Bl
bmJtYy9tZXRhLW9wZW5wb3dlci9yZWNpcGVzLXBob3NwaG9yL2hvc3QvcDktdmNzLXdvcmthcm91
bmQuYmIgUkRFUEVORFMgb24gb3Igb3RoZXJ3aXNlIHJlcXVpcmVzIGl0KQ0KTk9URTogUnVudGlt
ZSB0YXJnZXQgJ3ZpcnR1YWwtcDktdmNzLXdvcmthcm91bmQnIGlzIHVuYnVpbGRhYmxlLCByZW1v
dmluZy4uLg0KTWlzc2luZyBvciB1bmJ1aWxkYWJsZSBkZXBlbmRlbmN5IGNoYWluIHdhczogWyd2
aXJ0dWFsLXA5LXZjcy13b3JrYXJvdW5kJ10NCk5PVEU6IFJ1bnRpbWUgdGFyZ2V0ICdwOS12Y3Mt
d29ya2Fyb3VuZCcgaXMgdW5idWlsZGFibGUsIHJlbW92aW5nLi4uDQpNaXNzaW5nIG9yIHVuYnVp
bGRhYmxlIGRlcGVuZGVuY3kgY2hhaW4gd2FzOiBbJ3A5LXZjcy13b3JrYXJvdW5kJywgJ3ZpcnR1
YWwtcDktdmNzLXdvcmthcm91bmQnXQ0KTk9URTogUnVudGltZSB0YXJnZXQgJ3ZpcnR1YWwtb2Jt
Yy1ob3N0LWN0bCcgaXMgdW5idWlsZGFibGUsIHJlbW92aW5nLi4uDQpNaXNzaW5nIG9yIHVuYnVp
bGRhYmxlIGRlcGVuZGVuY3kgY2hhaW4gd2FzOiBbJ3ZpcnR1YWwtb2JtYy1ob3N0LWN0bCcsICdw
OS12Y3Mtd29ya2Fyb3VuZCcsICd2aXJ0dWFsLXA5LXZjcy13b3JrYXJvdW5kJ10NCkVSUk9SOiBS
ZXF1aXJlZCBidWlsZCB0YXJnZXQgJ29ibWMtcGhvc3Bob3ItaW1hZ2UnIGhhcyBubyBidWlsZGFi
bGUgcHJvdmlkZXJzLg0KTWlzc2luZyBvciB1bmJ1aWxkYWJsZSBkZXBlbmRlbmN5IGNoYWluIHdh
czogWydvYm1jLXBob3NwaG9yLWltYWdlJywgJ3ZpcnR1YWwtb2JtYy1ob3N0LWN0bCcsICdwOS12
Y3Mtd29ya2Fyb3VuZCcsICd2aXJ0dWFsLXA5LXZjcy13b3JrYXJvdW5kJ10NCg0KU3VtbWFyeTog
VGhlcmUgd2VyZSAyIEVSUk9SIG1lc3NhZ2VzIHNob3duLCByZXR1cm5pbmcgYSBub24temVybyBl
eGl0IGNvZGUuDQo=

--_000_29CA6B5F505E462FA1DA9146B97E01EChyvedesignsolutionscom_
Content-Type: text/html; charset="utf-8"
Content-ID: <715DC7150A671B4883951683267995A4@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHN0eWxlPSJ3b3JkLXdy
YXA6IGJyZWFrLXdvcmQ7IC13ZWJraXQtbmJzcC1tb2RlOiBzcGFjZTsgbGluZS1icmVhazogYWZ0
ZXItd2hpdGUtc3BhY2U7IiBjbGFzcz0iIj4NCjxkaXYgY2xhc3M9IiI+SGkgQWxsLDwvZGl2Pg0K
PGRpdiBjbGFzcz0iIj5JIGZvbGxvd2VkIHRoZSBleGFjdCBzdGVwcyBpbiZuYnNwO0FkZCBhIE5l
dyBTeXN0ZW0gdG8gT3BlbkJNQy48L2Rpdj4NCjxkaXYgY2xhc3M9IiI+PGEgaHJlZj0iaHR0cHM6
Ly9naXRodWIuY29tL29wZW5ibWMvZG9jcy9ibG9iL21hc3Rlci9kZXZlbG9wbWVudC9hZGQtbmV3
LXN5c3RlbS5tZCIgY2xhc3M9IiI+aHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvZG9jcy9ibG9i
L21hc3Rlci9kZXZlbG9wbWVudC9hZGQtbmV3LXN5c3RlbS5tZDwvYT48L2Rpdj4NCjxkaXYgY2xh
c3M9IiI+PGJyIGNsYXNzPSIiPg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSIiPlVuZm9ydHVuYXRlbHks
IEkgZ290IHRoaXMgZXJyb3IgYXMgJnF1b3Q7RVJST1I6IE5vdGhpbmcgUlBST1ZJREVTICd2aXJ0
dWFsLXA5LXZjcy13b3JrYXJvdW5kJyAoYnV0IC9ob21lL2JyYWRjL0RvY3VtZW50cy9vcGVuYm1j
L21ldGEtb3BlbnBvd2VyL3JlY2lwZXMtcGhvc3Bob3IvaG9zdC9wOS12Y3Mtd29ya2Fyb3VuZC5i
YiBSREVQRU5EUyBvbiBvciBvdGhlcndpc2UgcmVxdWlyZXMgaXQp4oCdLjwvZGl2Pg0KPGRpdiBj
bGFzcz0iIj48YnIgY2xhc3M9IiI+DQo8L2Rpdj4NCjxkaXYgY2xhc3M9IiI+SSBuZWVkIHRvIGRl
bGV0ZSBvbmUgbGluZSBpbiByb211bHVzLXByaW5lLmNvbmYgdG8gZml4IHRoaXMgZXJyb3IuPC9k
aXY+DQo8ZGl2IGNsYXNzPSIiPiMgcmVxdWlyZSBjb25mL21hY2hpbmUvaW5jbHVkZS9wOS5pbmM8
L2Rpdj4NCjxkaXYgY2xhc3M9IiI+PGJyIGNsYXNzPSIiPg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSIi
PklzIGFueW9uZSBoYXZlIGlkZWEgd2h5IGl0IG9ubHkgaGFwcGVucyB3aGVuIGNyZWF0ZSBhIG5l
dyBtYWNoaW5lID88L2Rpdj4NCjxkaXYgY2xhc3M9IiI+VGhhbmtzLjwvZGl2Pg0KPGRpdiBjbGFz
cz0iIj4mbmJzcDs8L2Rpdj4NCjxkaXYgY2xhc3M9IiI+VGhlIGRldGFpbCBlcnJvciBtZXNzYWdl
cyBhcmUgOjwvZGl2Pg0KPGRpdiBjbGFzcz0iIj48YnIgY2xhc3M9IiI+DQo8L2Rpdj4NCjxkaXYg
Y2xhc3M9IiI+W2JyYWRjQGh5dmUtdGFpcGVpLWZ3LWxhYiBidWlsZF0kIGJpdGJha2Ugb2JtYy1w
aG9zcGhvci1pbWFnZTwvZGl2Pg0KPGRpdiBjbGFzcz0iIj5Mb2FkaW5nIGNhY2hlOiAxMDAlIHwj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjfCBUaW1lOiAwOjAwOjAwPC9kaXY+DQo8ZGl2IGNsYXNzPSIiPkxvYWRlZCAzNTk2
IGVudHJpZXMgZnJvbSBkZXBlbmRlbmN5IGNhY2hlLjwvZGl2Pg0KPGRpdiBjbGFzcz0iIj5QYXJz
aW5nIHJlY2lwZXM6IDEwMCUgfCMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjfCBUaW1lOiAwOjAwOjAyPC9kaXY+DQo8ZGl2IGNs
YXNzPSIiPlBhcnNpbmcgb2YgMjQ0MiAuYmIgZmlsZXMgY29tcGxldGUgKDI0NDEgY2FjaGVkLCAx
IHBhcnNlZCkuIDM1OTcgdGFyZ2V0cywgMzUxIHNraXBwZWQsIDAgbWFza2VkLCAwIGVycm9ycy48
L2Rpdj4NCjxkaXYgY2xhc3M9IiI+UmVtb3ZpbmcgMSByZWNpcGVzIGZyb20gdGhlIGFybXY2IHN5
c3Jvb3Q6IDEwMCUgfCMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjI3wgVGlt
ZTogMDowMDowMDwvZGl2Pg0KPGRpdiBjbGFzcz0iIj5SZW1vdmluZyAxIHJlY2lwZXMgZnJvbSB0
aGUgcm9tdWx1c19wcmltZSBzeXNyb290OiAxMDAlIHwjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjfCBUaW1lOiAwOjAwOjAwPC9kaXY+DQo8ZGl2IGNsYXNzPSIiPk5PVEU6IFJlc29sdmlu
ZyBhbnkgbWlzc2luZyB0YXNrIHF1ZXVlIGRlcGVuZGVuY2llczwvZGl2Pg0KPGRpdiBjbGFzcz0i
Ij5FUlJPUjogTm90aGluZyBSUFJPVklERVMgJ3ZpcnR1YWwtcDktdmNzLXdvcmthcm91bmQnIChi
dXQgL2hvbWUvYnJhZGMvRG9jdW1lbnRzL29wZW5ibWMvbWV0YS1vcGVucG93ZXIvcmVjaXBlcy1w
aG9zcGhvci9ob3N0L3A5LXZjcy13b3JrYXJvdW5kLmJiIFJERVBFTkRTIG9uIG9yIG90aGVyd2lz
ZSByZXF1aXJlcyBpdCk8L2Rpdj4NCjxkaXYgY2xhc3M9IiI+Tk9URTogUnVudGltZSB0YXJnZXQg
J3ZpcnR1YWwtcDktdmNzLXdvcmthcm91bmQnIGlzIHVuYnVpbGRhYmxlLCByZW1vdmluZy4uLjwv
ZGl2Pg0KPGRpdiBjbGFzcz0iIj5NaXNzaW5nIG9yIHVuYnVpbGRhYmxlIGRlcGVuZGVuY3kgY2hh
aW4gd2FzOiBbJ3ZpcnR1YWwtcDktdmNzLXdvcmthcm91bmQnXTwvZGl2Pg0KPGRpdiBjbGFzcz0i
Ij5OT1RFOiBSdW50aW1lIHRhcmdldCAncDktdmNzLXdvcmthcm91bmQnIGlzIHVuYnVpbGRhYmxl
LCByZW1vdmluZy4uLjwvZGl2Pg0KPGRpdiBjbGFzcz0iIj5NaXNzaW5nIG9yIHVuYnVpbGRhYmxl
IGRlcGVuZGVuY3kgY2hhaW4gd2FzOiBbJ3A5LXZjcy13b3JrYXJvdW5kJywgJ3ZpcnR1YWwtcDkt
dmNzLXdvcmthcm91bmQnXTwvZGl2Pg0KPGRpdiBjbGFzcz0iIj5OT1RFOiBSdW50aW1lIHRhcmdl
dCAndmlydHVhbC1vYm1jLWhvc3QtY3RsJyBpcyB1bmJ1aWxkYWJsZSwgcmVtb3ZpbmcuLi48L2Rp
dj4NCjxkaXYgY2xhc3M9IiI+TWlzc2luZyBvciB1bmJ1aWxkYWJsZSBkZXBlbmRlbmN5IGNoYWlu
IHdhczogWyd2aXJ0dWFsLW9ibWMtaG9zdC1jdGwnLCAncDktdmNzLXdvcmthcm91bmQnLCAndmly
dHVhbC1wOS12Y3Mtd29ya2Fyb3VuZCddPC9kaXY+DQo8ZGl2IGNsYXNzPSIiPkVSUk9SOiBSZXF1
aXJlZCBidWlsZCB0YXJnZXQgJ29ibWMtcGhvc3Bob3ItaW1hZ2UnIGhhcyBubyBidWlsZGFibGUg
cHJvdmlkZXJzLjwvZGl2Pg0KPGRpdiBjbGFzcz0iIj5NaXNzaW5nIG9yIHVuYnVpbGRhYmxlIGRl
cGVuZGVuY3kgY2hhaW4gd2FzOiBbJ29ibWMtcGhvc3Bob3ItaW1hZ2UnLCAndmlydHVhbC1vYm1j
LWhvc3QtY3RsJywgJ3A5LXZjcy13b3JrYXJvdW5kJywgJ3ZpcnR1YWwtcDktdmNzLXdvcmthcm91
bmQnXTwvZGl2Pg0KPGRpdiBjbGFzcz0iIj48YnIgY2xhc3M9IiI+DQo8L2Rpdj4NCjxkaXYgY2xh
c3M9IiI+U3VtbWFyeTogVGhlcmUgd2VyZSAyIEVSUk9SIG1lc3NhZ2VzIHNob3duLCByZXR1cm5p
bmcgYSBub24temVybyBleGl0IGNvZGUuPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_29CA6B5F505E462FA1DA9146B97E01EChyvedesignsolutionscom_--
