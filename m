Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB00E971B3
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 07:53:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Cxf92dpqzDr6w
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 15:53:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=40.107.77.124; helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="hGh+hMtK"; dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770124.outbound.protection.outlook.com [40.107.77.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Cxbd0xWszDr7Z
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 15:50:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ct7KB7THY+iIkq9WP9cUYHIO2Bqxs9EmJmi4coZBdiDWjPt/+RE0rEU4zCedi7SFut0ozzQqtGlwA3eFyM9Td6/B4HZtyZ2Zx2Q/x4q3QBUZJtokFEzaLpQKcVIDuiNgUnyWVXM+CDMp15G3g/Oa7w7GZa69Cjjb78vr0EA+a+WeDV4tYzuXJug5mzS3CYIBc9+Zyehh3UgUBE5sbz6apWVURX4+T9hshYVqM/D9iJnwq9JAy+nhABk8xNtMLsQYwf7v/I89zv+9DenlxGQkCSEujmbm1BwqM/mdJY2eU/Rg6ibVXUv6mbhL6IMT6k7tGAU86RWvCC3F07PKNs0Fyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v5l9UhCLEMQBmgKfnfzRxkWKkdbvWJty76ZrtaG0+ms=;
 b=mZ7O0pyqXaqF8j8QLo11NOBt8QiqTKOi4SG0Tm3hZ+ERT8pR3NwTjJyz5DQVu8XoxtncVMEFK+/xYWHOJfB5VeB6gKjJCRDYDa3teB3RcfQAWXiuIC3aF5vmpmArddJFtYZ6F2A8f21X1pDlIkJcpKQzjuvieIju9ND0iMgMbNXbs5kjc+YaQrxSXf67v3JkCICUpoProzOdl/HccNb4MiXbhZ0ZzoA6oLgr7dZUzvOyinPa/Bk0IXXo6wXAugE/NDMcAUE6J2V3jnqscXES+dgevRCwExH9HGIHPAg8++rr+q7hmQ0osAgZuN8BvNoMYxhXKNLnWmkwtRPgkHaQbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v5l9UhCLEMQBmgKfnfzRxkWKkdbvWJty76ZrtaG0+ms=;
 b=hGh+hMtKaYRE7LOBfH/xOMme8W+5kxIdibvIM6MX2pN0vAjIayY3xnRe9zQ3klIva13i1T7r1kIyob5qRZglvw05SqUl6477l6tCTv8a8RielR2lG4Pb364nW6f1KfdgPDjGfSnV8tasKrciHxfJxqhAbC/GT1HSmSQ+UpaoiBw=
Received: from BYAPR21MB1191.namprd21.prod.outlook.com (20.179.56.209) by
 BYAPR21MB1237.namprd21.prod.outlook.com (20.179.57.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.1; Wed, 21 Aug 2019 05:50:45 +0000
Received: from BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::b855:45ab:ca06:4230]) by BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::b855:45ab:ca06:4230%9]) with mapi id 15.20.2178.016; Wed, 21 Aug 2019
 05:50:45 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: "Paul.Vancil@dell.com" <Paul.Vancil@dell.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: Telemetry Redfish Mockup location at DMTF
Thread-Topic: Telemetry Redfish Mockup location at DMTF
Thread-Index: AdVXffjt5pIc6PV9Q2GEUvsqM049eAAZhsAA
Date: Wed, 21 Aug 2019 05:50:45 +0000
Message-ID: <BYAPR21MB1191F6E61DC3BF7CA78C37CAC8AA0@BYAPR21MB1191.namprd21.prod.outlook.com>
References: <fbf557cba2d045b3a57d0adc508ae727@AUSX13MPS306.AMER.DELL.COM>
In-Reply-To: <fbf557cba2d045b3a57d0adc508ae727@AUSX13MPS306.AMER.DELL.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-08-21T05:50:42.7642350Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=5be23d72-6506-42d9-9bce-abd29764befe;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [50.35.92.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77c77544-5ba6-4103-0f46-08d725fb829d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600158)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR21MB1237; 
x-ms-traffictypediagnostic: BYAPR21MB1237:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR21MB12373DF8995A946DD13AF3F5C8AA0@BYAPR21MB1237.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(189003)(199004)(13464003)(76116006)(71190400001)(66476007)(66066001)(6116002)(3846002)(52536014)(14444005)(256004)(64756008)(71200400001)(66556008)(5660300002)(66446008)(8676002)(55016002)(6436002)(66946007)(966005)(8990500004)(81166006)(81156014)(478600001)(8936002)(229853002)(2501003)(9686003)(6306002)(486006)(7736002)(7696005)(11346002)(22452003)(446003)(102836004)(74316002)(10090500001)(76176011)(316002)(14454004)(4744005)(305945005)(99286004)(6246003)(86362001)(26005)(110136005)(6506007)(186003)(53546011)(53936002)(476003)(2906002)(33656002)(25786009)(10290500003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR21MB1237;
 H:BYAPR21MB1191.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LKyjuFqu+uBPi4rXf3aBCSFKKsy3pJGvAQ+aCnigGQE5TBaD9raS3HCVH2L9E05b65hRWmO2uJUcjMuDGHMOLEmYZnI+EQ1uPYvJh0eR8aCHqTUbt0yGmvoSZXfBOChCkL1/+VJ7HjjySS/s17ziuhuUqRgTxHJLq/aAKmahw4cmIIb62oMLOAWGJ5qr314JLhqmsbqhV+dlqLYF8L6ethB2ui40FVEXYx+G+l8nLWpaS2+e5YNjdDL20Ra86XJbemUR3irt3a4tz2mTsIyx7DFhBM9ZZpX9DGx/QkaNw9KdDb5/OBxZbf26ez76bhLfOpFZeQPsfzETjac9ljCYns99L8/Kvc26rd/xtDbzgjVFYpGHkFvkMr/tliqBPn9wY4yJW5m4sZxHfxqVFS2RdiwSsEWqGKnBaP/wbqRUw6c=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c77544-5ba6-4103-0f46-08d725fb829d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 05:50:45.2585 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L0LzFmZhxSxRnOwtVdxG0hQv2D3yujjBp8OhI+mWa3E/jIC+rqkpieVo4BVc+vks+fTiHJ1G/+MkUcmd7mxNFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR21MB1237
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

Hi Paul,=20

Link didn't work for me. Can you reconfirm.=20

Neeraj

-----Original Message-----
From: openbmc <openbmc-bounces+neladk=3Dmicrosoft.com@lists.ozlabs.org> On =
Behalf Of Paul.Vancil@dell.com
Sent: Tuesday, August 20, 2019 10:40 AM
To: openbmc@lists.ozlabs.org
Subject: Telemetry Redfish Mockup location at DMTF

For those who have access to the DMTF private repo on github, The location =
of the current Telemetry mockup is:
 https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub=
.com%2FDMTF%2FRedfish%2Ftree%2Fmaster%2Fmockups%2Fpublic-telemetry&amp;data=
=3D02%7C01%7Cneladk%40microsoft.com%7C23e27aa9627a47be38be08d725d4d0f5%7C72=
f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637019468286104259&amp;sdata=3DXZs=
0FM7p97grbS50EuS0lAWk%2Br%2BaMuGxReRSxgZ1Lvs%3D&amp;reserved=3D0
 This mockup has some issues (i.e. errors).
  I am working on pull requests into Redfish for the fixes.
  Then they will make this public as soon as possible.
  Thanks
   Paul Vancil
