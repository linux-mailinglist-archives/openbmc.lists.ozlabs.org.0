Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 007251ABA4F
	for <lists+openbmc@lfdr.de>; Thu, 16 Apr 2020 09:53:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492s0p6lPrzDrQZ
	for <lists+openbmc@lfdr.de>; Thu, 16 Apr 2020 17:53:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=40.107.236.96;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.a=rsa-sha256 header.s=selector2 header.b=PAUk6LFx; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2096.outbound.protection.outlook.com [40.107.236.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492rzc4ffLzDrQB
 for <openbmc@lists.ozlabs.org>; Thu, 16 Apr 2020 17:52:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aziTKPr9+k5ZP53RprdjipXIu8WZ9CCFCiKavtVYbXt00BN+JCX6K9HIn/LXltxew2Iqd32M0Q6hkXD1/FuDhvxMszFwknpQqDSz2v5+EhHm/LHLjEqDeo3N4aPb+0UzgHZ/phA90qsajrzWX1y/PhBBUioa4ijLG+r+mwHfAm3cK/WKY0sL5b4PgaxLDfjvc0SD4G7FBHrXpjIQqGDoouTI7OMKiOGwbw0XcOLmcjw6qt2R/aY78ojFVyg9cn3o2FDyxiD9lEFIfqWdUlzGZNFtSnq9n1vm3/17O2nszfq+W5IZI6mScvwpq6GK7uHRH2Ka9ED5TtABQOBfNyKF4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+h5q2arnoagLplBIBeX1m5ld9R8WBb3i0H5y1p7f7ho=;
 b=MKaI09Vl8qUWqZQRcoryCo2mMHyGJopGHctFKVFmlZjPxCFDFqgcW+xPh/WN4yojU+v4KPz8fyKBCBK63SZspc2WXceQmUf1SBXw+zg+EcNBZSnrZ2wBp84Lzs45J6snTCM4D3pVA+D/T9QG1/SGoxOAr2CO1TQ1lsNuqPI5/YExdF+f6H0gIpHFM7izP9iFmmMIDLwbFFnFTiWAdmH8m6AUv63XS/F2Thc1jZLhoj8oTU4pjwWyWJBEkNMUqAgStR151lrWSMrOLQgxapmG2Yq6E+lGEfJgnHI6/5QK7lh+dUkYBv3OyHM/WMBgL/v1Yy5ZQBmC4cKdAwMh628WxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+h5q2arnoagLplBIBeX1m5ld9R8WBb3i0H5y1p7f7ho=;
 b=PAUk6LFxuT6DQpAUxYx136Xb4eO8R8R1VvFQeLdl45O16zFpjDpQcXRWqbeUo2gAp9O+Hyc+pqolbIVKnfh1HR1K+h8h7pnMkZwMP77te/PU0elKmI5WeJUocvYVdtwit4zSkNDQ8MKsHLYmxvQJ+QYw86Vgp2OqzO3kP2DsLAk=
Received: from CH2PR21MB1510.namprd21.prod.outlook.com (2603:10b6:610:8e::7)
 by CH2PR21MB1448.namprd21.prod.outlook.com (2603:10b6:610:5e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.4; Thu, 16 Apr
 2020 07:52:21 +0000
Received: from CH2PR21MB1510.namprd21.prod.outlook.com
 ([fe80::6838:df24:78e3:e78a]) by CH2PR21MB1510.namprd21.prod.outlook.com
 ([fe80::6838:df24:78e3:e78a%9]) with mapi id 15.20.2937.000; Thu, 16 Apr 2020
 07:52:21 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: Andrew Jeffery <andrew@aj.id.au>, Vijay Khemka <vijaykhemka@fb.com>, James
 Feist <james.feist@linux.intel.com>
Subject: RE: [EXTERNAL] Re: nvme sensors
Thread-Topic: [EXTERNAL] Re: nvme sensors
Thread-Index: AQHWEx5rEqsJqc4WEEC8M3OzxbfV76h5pxOAgADRXfD//5lHAIAAmM4QgABf84CAAFTSUA==
Date: Thu, 16 Apr 2020 07:52:21 +0000
Message-ID: <CH2PR21MB151024EECAFA2663BA89E575C8D80@CH2PR21MB1510.namprd21.prod.outlook.com>
References: <0F332F74-FF51-4239-8B52-2EBA770AE6CC@fb.com>
 <8022481D-7C72-4A7B-AF9C-D144177B4C88@fb.com>
 <CH2PR21MB1510E11F9772C45D12EEA0F1C8DB0@CH2PR21MB1510.namprd21.prod.outlook.com>
 <82E67AAA-1BD8-41D8-BE27-966F840236E2@fb.com>
 <CH2PR21MB1510AEF844D82AC9D897B902C8DB0@CH2PR21MB1510.namprd21.prod.outlook.com>
 <4770a42d-d012-4e95-9347-d5c287c2e288@www.fastmail.com>
In-Reply-To: <4770a42d-d012-4e95-9347-d5c287c2e288@www.fastmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [50.35.81.9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1c4931cd-6b4d-48ca-621b-08d7e1db1822
x-ms-traffictypediagnostic: CH2PR21MB1448:
x-microsoft-antispam-prvs: <CH2PR21MB144843491DB0A08D20AD3FDAC8D80@CH2PR21MB1448.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0375972289
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR21MB1510.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(4636009)(376002)(396003)(39860400002)(346002)(136003)(366004)(8936002)(8676002)(478600001)(8990500004)(10290500003)(81156014)(9686003)(110136005)(66946007)(4326008)(55016002)(66476007)(64756008)(33656002)(186003)(26005)(76116006)(66556008)(316002)(66446008)(52536014)(5660300002)(86362001)(82960400001)(71200400001)(2906002)(6506007)(7696005)(53546011)(82950400001);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JXccyRZ76gdN/4Hnd50jAdt87zRXrFG79agB5nENHLNV0sDUqp/gkO/6czS1QGH3K0BjDw91kYbxFHMRf3Aqn9XrJQrnPxo3GMluGH2VtodS+rKpF8ElS20sVbMKSrCeRzT5HTzKGJEqNwQXofoSVUky+DPIaLvRq5tQjHkitiU6x1MYF4d47N1ss4T14mCOTto1xjr939B6ujrPTiU5kavlJUK3CrcUvxHNoOhROgmyzXRdgAJdvI5STw18gb2fh4qEYT/xqk617hUgT38/9oyP5yKSMxqeVWPAEioRfBLTk6auOR4T9LWC2n6ldL3Dw7rBY5KexUvm+IIDIEGOQ3+Zik6o3e5gjTg4ltca0jbCJ3DPqATrapHpstkFtvq2MkOErEEX4fX2HI7bM1p1sl4FTX7M5PevFW6OwF8Lo3CIlHqcG/0ui9EV0rY9Azrt
x-ms-exchange-antispam-messagedata: u8hLcg05PNQ2iGgaTDG1UcFkH+G/d+TwK+oZHCuMdvZ7PnrZ4VBn0dGvqM0w5G9lZSnDRaJtULQuciR3Xq5ov+00GfT5knn1kTJ8U5WH8l1/kX3iCRmdgM2Cd4ONZgVl19OD4JYJAGhblJJTSGeXOgXqJGD6oDT9dS1yE7+xgmbhDDE2XPqtd2EcMxsNLW8NB5pQrFnXarqmUKltXI17eSN2eTSFlLQJr3ucY6LAbYJrsYBd4/cGyRfLL9HKvIGpCEO2pNI++wrOMZZA1pJzAI1AUPdC6xo9905F8jf9RbgflNG8IP2DHLvvaUHzU6NHEObhb9iM15Q59kpFaZFiQaqdQoCKTTCNlr0b9E92ThjswSxbgjY192bBUcNgHm3J+j+jj6t7G2hV3etQk57pPN8VwmsbY4eOy6Fe/7wiNw2RneZ86wrg4945y7/akvL77Jd4+KF+GTfiflYySVzsPYHEym5d9OTGAVf0h2/upStbCa231V+taIz7XWF559lTod3GWBepqBXxdQheULq0ccXyGMHruKNTri77YVIuSqFdy64/PWfC1G1tDeyC10c1JWVBxV8uXG29fElXyUDQl1J63T2P/oMzkIFBH0JA3JslI7nfpvBnLCdswmxKHJyJrxDOEj9eb+NgZ4Lttzp2sv2fJqGf5zCt19WP3IGVQxQDQN5BKVSFYnj+otuMwKIRzLGAQ5EM+ircCUfjJCCk+ri9jbaHi1noW8wmXUMbcVTcc93k346gE/KxvM9vGW915IUefRTjP7XzEPt2a7m0TrWzwqd1+3tNVHmuBqQoOT8=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c4931cd-6b4d-48ca-621b-08d7e1db1822
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2020 07:52:21.3804 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TKsrjFBWthkItXPsjG4CRrroL5/QJS4TqwJ9TEjZHtAuNelhiOCaGg9FPbwqMw/SXP1isUkwxwUmGLz3juDs6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR21MB1448
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

Some of use cases:

- Standard MCTP message handling
- MCTP bridging=20
- Support SMBUS ( PCIe in future)=20
- MCTP tool( from console) that can be used to send any MCTP messages to a =
device and read responses, discovery etc.

Can you explain what are problems with libmctp(SMBUS binding ) with current=
 implementation?

Neeraj

-----Original Message-----
From: Andrew Jeffery <andrew@aj.id.au>=20
Sent: Wednesday, April 15, 2020 7:40 PM
To: Neeraj Ladkani <neladk@microsoft.com>; Vijay Khemka <vijaykhemka@fb.com=
>; James Feist <james.feist@linux.intel.com>
Cc: openbmc@lists.ozlabs.org
Subject: [EXTERNAL] Re: nvme sensors



On Thu, 16 Apr 2020, at 06:29, Neeraj Ladkani wrote:
> Thanks Vijay. =20
>=20
> Can anyone comment on MCTP feature completeness on OpenBMC?

What features are you looking for? Keen to see discussion about people's MC=
TP needs.

Anyway, OpenBMC's MCTP support is in progress but fairly immature.
Part of the plan is to move MCTP support into the kernel. If you're making =
use of MCTP then I'd like to hear your use-cases so I can make sure the ker=
nel interface meets everyone's requirements.

>  I reviewed
>  libMCTP and some of bindings but its not clear who is using that? =20

IBM is using libmctp in both BMC and host firmware, and Intel is working on=
 it for use in their BMCs (but not host firmware).

Andrew
