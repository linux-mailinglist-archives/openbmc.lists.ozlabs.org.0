Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 917E128F78C
	for <lists+openbmc@lfdr.de>; Thu, 15 Oct 2020 19:18:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBwwP6BXCzDqdD
	for <lists+openbmc@lfdr.de>; Fri, 16 Oct 2020 04:18:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.132.101; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=priyatharshanp@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=jk36eK4S; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=jk36eK4S; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320101.outbound.protection.outlook.com [40.107.132.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBwvY1g2YzDqTk
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2020 04:17:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfpdHrX5GKBvKXdksIlzDB5m/dveeJ7OP35QeMawye8=;
 b=jk36eK4SUbR9pHVDJL3mDXT34KrVbGTAmwfSTTofdJQldPWXPd3u3oRzehGpvAzyaKzu+j26fiShoACLg4Yw+/vw2E4aWuM080PGHjbe3510B+9L1ycpLPUUciCbKsr4m3dJhxc5dI0hiduCxXa9+K4m/z3wDks80J45wElM8e0=
Received: from SLXP216CA0004.KORP216.PROD.OUTLOOK.COM (2603:1096:100:6::14) by
 TY2PR04MB3486.apcprd04.prod.outlook.com (2603:1096:404:3c::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21; Thu, 15 Oct 2020 17:17:04 +0000
Received: from PU1APC01FT048.eop-APC01.prod.protection.outlook.com
 (2603:1096:100:6:cafe::55) by SLXP216CA0004.outlook.office365.com
 (2603:1096:100:6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend
 Transport; Thu, 15 Oct 2020 17:17:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.52)
 smtp.mailfrom=hcl.com; linux.ibm.com; dkim=pass (signature was verified)
 header.d=HCL.COM;linux.ibm.com; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.52 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.52; helo=KOR01-PS2-obe.outbound.protection.outlook.com;
Received: from KOR01-PS2-obe.outbound.protection.outlook.com (192.8.245.52) by
 PU1APC01FT048.mail.protection.outlook.com (10.152.253.79) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Thu, 15 Oct 2020 17:17:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ANavZ+eCyVlGut+vjn5IrIEzGTs7ZFyPQ5i6cManELz4b4lPhX/v1EbcikmZsc+0SwRH3vvIdgG2f1srw5ztmwYq+UsC9aEzqYsoxAjvJsgS9xhjsE0ZqNd30z1R0c7XLY72FGrWoyWz6EKONJkivxBMK/EJ8SQVVl13A2XTlc5A13s7k5ZoZeOhvIyHtYupSn5xDgbD6wT0ZQPCoO6rqSO6jAst1uCI1JqW1lvyoWkdeiO8iOWdG/kXqi9zeoaOZ74OYkf7SAJLJQQrGtbRr30880MC/EVhTfrOrfFk85XJ5MfYd3C8enk3zUN+GmO93h+6qCIO5pk0SPqBsXxM6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfpdHrX5GKBvKXdksIlzDB5m/dveeJ7OP35QeMawye8=;
 b=fwKzM+b1VXzPnExvgfK5uHV3ro2IqvVyhPYmUYrf6ePxnbz1rKDRuD6T1OOAVoIS9xb87GeNo+OEQdccNkgdJkvYALWUc8jnEdV8sCDQYF56uL0LmpXxLwJ6Vn826R8YwFR+kesNeuikPr5yGmxmmb72G5/52LK4V3GBv47FFrdKs3NWx5nP0sypvGH3DMRgaUAGlAEGbSefdNJ3/RcXB5JjskREZLFY+wEvuz3W/F+kqQdMy1wJnI4sVRd2sj+iIdtftgyavpkDUuNFyppsiP/DOtLThOT6N+h2y8eWCu6vMEkrI5tC+yA3xKsr6H88Rhp0byk6o0B0qFhqxJpq/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfpdHrX5GKBvKXdksIlzDB5m/dveeJ7OP35QeMawye8=;
 b=jk36eK4SUbR9pHVDJL3mDXT34KrVbGTAmwfSTTofdJQldPWXPd3u3oRzehGpvAzyaKzu+j26fiShoACLg4Yw+/vw2E4aWuM080PGHjbe3510B+9L1ycpLPUUciCbKsr4m3dJhxc5dI0hiduCxXa9+K4m/z3wDks80J45wElM8e0=
Received: from SL2PR04MB3306.apcprd04.prod.outlook.com (2603:1096:100:33::18)
 by SL2PR04MB3019.apcprd04.prod.outlook.com (2603:1096:100:32::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22; Thu, 15 Oct
 2020 17:16:54 +0000
Received: from SL2PR04MB3306.apcprd04.prod.outlook.com
 ([fe80::8014:c9c3:a0f2:38c1]) by SL2PR04MB3306.apcprd04.prod.outlook.com
 ([fe80::8014:c9c3:a0f2:38c1%6]) with mapi id 15.20.3477.021; Thu, 15 Oct 2020
 17:16:54 +0000
From: "P. Priyatharshan" <PriyatharshanP@hcl.com>
To: Adriana Kobylak <anoo@linux.ibm.com>
Subject: Re: Multi host bios upgrade support in phosphor-bmc-code-mgmt:
Thread-Topic: Multi host bios upgrade support in phosphor-bmc-code-mgmt:
Thread-Index: AQHWkD7TytR1qVyzD0a6ZilIwzzPvqlzfzwAgAAUMICAD2ExBYAGY2f/gABH+wCAD2x4lQ==
Date: Thu, 15 Oct 2020 17:16:54 +0000
Message-ID: <SL2PR04MB330696831B49B81F75168538CA020@SL2PR04MB3306.apcprd04.prod.outlook.com>
References: <TY2PR04MB33112E61CA54FE1A17D30B70CA3A0@TY2PR04MB3311.apcprd04.prod.outlook.com>
 <20200921194614.GL6152@heinlein>,
 <b6cd8ac0b56a372391bd108dbf84fb0f@linux.vnet.ibm.com>,
 <TY2PR04MB33117717F809C0804A00B365CA300@TY2PR04MB3311.apcprd04.prod.outlook.com>
 <TY2PR04MB3311812DB85A11934F044FB4CA0C0@TY2PR04MB3311.apcprd04.prod.outlook.com>,
 <893bbe2bbfe35c6ccdea0988c8ec1de9@linux.vnet.ibm.com>
In-Reply-To: <893bbe2bbfe35c6ccdea0988c8ec1de9@linux.vnet.ibm.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: linux.ibm.com; dkim=none (message not signed)
 header.d=none; linux.ibm.com;
 dmarc=none action=none header.from=hcl.com; 
x-originating-ip: [42.109.139.172]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5def0c0a-d836-4827-dc2f-08d8712e232a
x-ms-traffictypediagnostic: SL2PR04MB3019:|TY2PR04MB3486:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <TY2PR04MB3486B1728853A9B350EC00DACA020@TY2PR04MB3486.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: bdmRSo1VfAO5HvC/nTSwtnx1bfmaMEOjLrAbCODk0LMBoc/YkJsjZsVzsTpQuz0oAvOFAAnWYZpW24mDXbeoOb9fO6nQJlTUrxft01MmwW637qle8TkzazgM+6HkTOFL1rvXoVnRQTaHRLUoRbML3ouQf7NuahTOOTFSbllfi5F3abfwqeu3wpbOPt3T5Y3GczMyGkEq7MEMm60/97klLvlI3p+iYdTZKWT/0ylyFJnuniFV8HIH2K7smvsw29sjQriB1RMWYsHx6x5i+RTaPiXvX4P9mGxpgAleuB1WSK72xBU8GFYD8/tB7I9UWaG6laZKwq0i412CPDZBNdQCpZA3jii1h5wvGtTMCM/skUCGiCZyYSJw5LldWzl0qRklhcBnAF2WIvd+nWrY4p1x6w==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SL2PR04MB3306.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(376002)(396003)(39860400002)(5660300002)(86362001)(9686003)(6916009)(66446008)(83380400001)(91956017)(64756008)(66556008)(66946007)(71200400001)(76116006)(66476007)(166002)(52536014)(19627235002)(55016002)(54906003)(26005)(8676002)(316002)(6506007)(186003)(53546011)(7696005)(33656002)(2906002)(4326008)(8936002)(966005)(478600001)(19627405001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: jLm6VpNwq14I+FyHEg/UdJEGqCozI5NTh3x3fcLIlN6UCRw/xWoIWMYQra5O5T6wWCYbVPB+LL/AR9Lr3RassQkiTPDmd5S6dm7FJPzIZ9unmMTe8IvmrWsi2lOhe0vdIoHCjoqqqnn4AOZMzWl6QtX7Cidmq+fAWcIFK+c++7FAhC+xh/t8LtycyEH08TaVnoNDTDnIZo/T2i4cDo1caR2Xr1UCo4x8Py+lZh5liNBmRQN1fKfxXTtG6GLVBWYm/BS0Oo2kTwIF1pUlIjsiTMGblMud0ZUFO98twwo2m3oSQt1cdXmZ9tWeqFzzqMpGbed1o/HwGQyGXqm57hfSqREhHcY9IjvCxscbfPoIE50CkHdtzJ5vpD8kZfqhOegA6zlEEQVttJOxtCGyReEOk6eJ9tcEsjkVwXRAQwMzcKc5LPY6kAptUXKAbpZr65x+aASD1QZ5MrONLP6J4ULbhkYRuY59hqY4tYyAj5LWK6uYSKpUi6B70bFUtcTTibS2/r9uXf1rgeHhL9g7CP+djpnZxZ2xsI8aYQqGCOWaHiV2aamFLSRDSi7xXG8Z74SvpLBx0bG/DROnrOY/nOhNaoeloX/+SCuo2DPZk/UdZEdj0/TRVvLdS0wIyn00R5ruznNibQFPzWpIFlCGxxSPCA==
Content-Type: multipart/alternative;
 boundary="_000_SL2PR04MB330696831B49B81F75168538CA020SL2PR04MB3306apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR04MB3019
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT048.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 73c0f6f7-23f6-44ea-099e-08d8712e1d55
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2zXCAdWbKPNogH/K99pJPPrVjl26kUF66Pf8y7+7c3p1L97fFmeYAJ9oKL8YEGp+As8AOKFKTW/KkmsPuZJTTP8TZB09+vUq4qmlVQRPAp6jJRWYFoh3Dmu1ywfp2N9s9Ar+OKW4Qb4ef8oaiSMxfZO5GmlU87D4ND0VJxX/Agx0eYpIU5J94cQBCE2W/uqpvs01NBCf+EfdiVv3SbygHoy9VJ5YF4nP0LysuDEMA6JMIQFKnwAQ6LYLSkug+JuIEVc39MWfnucKjLhUHj2MjBCe9+MZteGP/we/Ciyu6wD+AkR7nLtE+FLPKfoMmj9zEe0fyJbnsCettHGUTYhp9XI3by25aZHrfBFPNq4PqBjKYbGbRirPS3wx2MF9SCUjPSND0JVCpLyOBgRZBNmjIF2bUE3rQQc0BlUMzXib/rFzJ/9g66igzyngWnazl6VtTdqGk0EndOAyJZtzTcRnQCruUeEiVDzO0DYOGSROqNw=
X-Forefront-Antispam-Report: CIP:192.8.245.52; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KOR01-PS2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(46966005)(166002)(86362001)(966005)(316002)(55016002)(36906005)(5660300002)(7696005)(4326008)(83380400001)(8676002)(2906002)(6506007)(9686003)(53546011)(30864003)(70586007)(336012)(186003)(70206006)(82740400003)(81166007)(47076004)(6916009)(356005)(54906003)(26005)(19627405001)(8936002)(478600001)(52536014)(19627235002)(82310400003)(33656002);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2020 17:17:03.8354 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5def0c0a-d836-4827-dc2f-08d8712e232a
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.52];
 Helo=[KOR01-PS2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT048.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB3486
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "anoo@us.ibm.com" <anoo@us.ibm.com>,
 "ojayanth@in.ibm.com" <ojayanth@in.ibm.com>,
 "gmills@linux.vnet.ibm.com" <gmills@linux.vnet.ibm.com>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>,
 "ratagupt@linux.vnet.ibm.com" <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_SL2PR04MB330696831B49B81F75168538CA020SL2PR04MB3306apcp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Thanks Adriana for the clarification.

For host bios update, the images will be copied to BMC(/tmp/images) and wil=
l start flashing by making RequestedActivation field "xyz.openbmc_project.S=
oftware.Activation.RequestedActivations.Active". In our case, the device lo=
cation will be same for all the bios images (BMC /tmp/images).So I think th=
e above design you proposed[id =3D version+volume ID]  may not work effecti=
vely for multi host as the id is still going to be same for all the hosts.

We would like to propose the following approach for your review.Kindly go t=
hrough the below steps and share your valuable suggestions.

1.Number of host will be identified from machine layer [OBMC_HOST_INSTANCES=
]

2.Code will be modified to create n number of objects based on number of ho=
sts

  Ex: Log taken in YosemiteV2 [4 host]

root@yosemitev2:~# busctl tree xyz.openbmc_project.Software.BMC.Updater
`-/xyz
  `-/xyz/openbmc_project
    `-/xyz/openbmc_project/software
      |-/xyz/openbmc_project/software/1929c585
      |-/xyz/openbmc_project/software/host1
      | `-/xyz/openbmc_project/software/host1/28bd62d9
      |-/xyz/openbmc_project/software/host2
      | `-/xyz/openbmc_project/software/host2/28bd62d9
      |-/xyz/openbmc_project/software/host3
      | `-/xyz/openbmc_project/software/host3/28bd62d9
      `-/xyz/openbmc_project/software/host4
        `-/xyz/openbmc_project/software/host4/28bd62d9
root@yosemitev2:~# busctl tree xyz.openbmc_project.Software.Version
`-/xyz
  `-/xyz/openbmc_project
    `-/xyz/openbmc_project/software
      |-/xyz/openbmc_project/software/host1
      | `-/xyz/openbmc_project/software/host1/28bd62d9
      |-/xyz/openbmc_project/software/host2
      | `-/xyz/openbmc_project/software/host2/28bd62d9
      |-/xyz/openbmc_project/software/host3
      | `-/xyz/openbmc_project/software/host3/28bd62d9
      `-/xyz/openbmc_project/software/host4
        `-/xyz/openbmc_project/software/host4/28bd62d9


3.This will create activation interface for each host. For a multi-host sys=
tem if the  RequestedActivation is set to "xyz.openbmc_project.Software.Act=
ivation.RequestedActivations.Active", then different bios service file will=
 be called based the host.

For single host : biosServiceFile =3D "obmc-flash-host-bios@" + versionId +=
 ".service";
For multi host  : biosServiceFile =3D  "obmc-flash-host" + host + "-bios@" =
+ versionId + ".service";


Then it can be used for multi host even if the firmware image we want to in=
stall is the same for multiple host targets.

I have created a WIP patch for the design proposed above.Kindly have a glan=
ce and share your comments.

https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-bmc-code-mgmt/+/37448

Thanks,
Priyatharshan P

________________________________
From: Adriana Kobylak <anoo@linux.ibm.com>
Sent: 06 October 2020 03:11
To: P. Priyatharshan <PriyatharshanP@hcl.com>
Cc: Patrick Williams <patrick@stwcx.xyz>; Velumani T-ERS,HCLTech <velumanit=
@hcl.com>; openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>; anoo@us.ibm=
.com <anoo@us.ibm.com>; ojayanth@in.ibm.com <ojayanth@in.ibm.com>; gmills@l=
inux.vnet.ibm.com <gmills@linux.vnet.ibm.com>; ratagupt@linux.vnet.ibm.com =
<ratagupt@linux.vnet.ibm.com>
Subject: Re: Multi host bios upgrade support in phosphor-bmc-code-mgmt:

[CAUTION: This Email is from outside the Organization. Unless you trust the=
 sender, Don=92t click links or open attachments as it may be a Phishing em=
ail, which can steal your Information and compromise your Computer.]

Hi Priyatharshan,

>  Object : /xyz/openbmc_project/software/[FIRMWARE_VERSION]_[DEVICE]
> where device could be host1, 2, ...,N
>  Interface : xyz.openbmc_project.Software.Activation
>
>  Please confirm if our understanding is correct.

I meant that to generate the id, which currently uses the version
string, would instead use the version string plus the string for the
name of the device where it's stored in order to generate the hash. For
example, today the code calls "SHA512_Update("version")", where
"version" is for example "2.9.0-dev-663-g2e34bb673". Instead the code
would detect this version is stored let's say in device "mtd1" or
"mmcblk0p1", it'd then append that device string to version, ex:
"2.9.0-dev-663-g2e34bb673-mmcblk0p1" and pass that string to
SHA512_Update(), therefore creating a different hash depending where
that version of bmc code is stored.

Note that this is for BMC versions only. We discussed that for host
versions, we'd need to modify the code to add a "os-release" file under
/media/ that contained the host version information similar to the BMC's
os-release file. In addition, we'd need to somehow determine that those
files were for host (Bios) versions instead of BMC ones. Perhaps
os-release could have an additional field added to specify the purpose.


> Adriana, Any tentative timeline on your commits availability [generate
> the id based on firmware version plus the device or volume ]

I'd say by early next year at the latest.
::DISCLAIMER::
________________________________
The contents of this e-mail and any attachment(s) are confidential and inte=
nded for the named recipient(s) only. E-mail transmission is not guaranteed=
 to be secure or error-free as information could be intercepted, corrupted,=
 lost, destroyed, arrive late or incomplete, or may contain viruses in tran=
smission. The e mail and its contents (with or without referred errors) sha=
ll therefore not attach any liability on the originator or HCL or its affil=
iates. Views or opinions, if any, presented in this email are solely those =
of the author and may not necessarily reflect the views or opinions of HCL =
or its affiliates. Any form of reproduction, dissemination, copying, disclo=
sure, modification, distribution and / or publication of this message witho=
ut the prior written consent of authorized representative of HCL is strictl=
y prohibited. If you have received this email in error please delete it and=
 notify the sender immediately. Before opening any email and/or attachments=
, please check them for viruses and other defects.
________________________________

--_000_SL2PR04MB330696831B49B81F75168538CA020SL2PR04MB3306apcp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<div class=3D"_3U2q6dcdZCrTrR_42Nxby JWNdg1hee9_Rz6bIGvG1c allowTextSelecti=
on">
<div>
<div class=3D"rps_e6fb">
<div dir=3D"ltr">Thanks Adriana for the clarification.
<div><br>
</div>
<div>For host bios update, the images will be copied to BMC(/tmp/images) an=
d will start flashing by making RequestedActivation field &quot;xyz.openbmc=
_project.Software.Activation.RequestedActivations.Active&quot;. In our case=
, the device location will be same for all
 the bios images (BMC /tmp/images).So I think the above design you proposed=
[id =3D version+volume ID] &nbsp;may not work effectively for multi host as=
 the id is still going to be same for all the hosts.</div>
<div>&nbsp; &nbsp; </div>
<div>We would like to propose the following approach for your review.Kindly=
 go through the below steps and share your valuable suggestions.</div>
<div><br>
</div>
<div>1.Number of host will be identified from machine layer [OBMC_HOST_INST=
ANCES]</div>
<div><br>
</div>
<div>2.Code will be modified to create n number of objects based on number =
of hosts</div>
<div><br>
</div>
<div>&nbsp; Ex: Log taken in YosemiteV2 [4 host]</div>
<div><br>
</div>
<div>root@yosemitev2:~# busctl tree xyz.openbmc_project.Software.BMC.Update=
r</div>
<div>`-/xyz</div>
<div>&nbsp; `-/xyz/openbmc_project</div>
<div>&nbsp; &nbsp; `-/xyz/openbmc_project/software</div>
<div>&nbsp; &nbsp; &nbsp; |-/xyz/openbmc_project/software/1929c585</div>
<div>&nbsp; &nbsp; &nbsp; |-/xyz/openbmc_project/software/host1</div>
<div>&nbsp; &nbsp; &nbsp; | `-/xyz/openbmc_project/software/host1/28bd62d9<=
/div>
<div>&nbsp; &nbsp; &nbsp; |-/xyz/openbmc_project/software/host2</div>
<div>&nbsp; &nbsp; &nbsp; | `-/xyz/openbmc_project/software/host2/28bd62d9<=
/div>
<div>&nbsp; &nbsp; &nbsp; |-/xyz/openbmc_project/software/host3</div>
<div>&nbsp; &nbsp; &nbsp; | `-/xyz/openbmc_project/software/host3/28bd62d9<=
/div>
<div>&nbsp; &nbsp; &nbsp; `-/xyz/openbmc_project/software/host4</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; `-/xyz/openbmc_project/software/host4/28bd=
62d9</div>
<div>root@yosemitev2:~# busctl tree xyz.openbmc_project.Software.Version</d=
iv>
<div>`-/xyz</div>
<div>&nbsp; `-/xyz/openbmc_project</div>
<div>&nbsp; &nbsp; `-/xyz/openbmc_project/software</div>
<div>&nbsp; &nbsp; &nbsp; |-/xyz/openbmc_project/software/host1</div>
<div>&nbsp; &nbsp; &nbsp; | `-/xyz/openbmc_project/software/host1/28bd62d9<=
/div>
<div>&nbsp; &nbsp; &nbsp; |-/xyz/openbmc_project/software/host2</div>
<div>&nbsp; &nbsp; &nbsp; | `-/xyz/openbmc_project/software/host2/28bd62d9<=
/div>
<div>&nbsp; &nbsp; &nbsp; |-/xyz/openbmc_project/software/host3</div>
<div>&nbsp; &nbsp; &nbsp; | `-/xyz/openbmc_project/software/host3/28bd62d9<=
/div>
<div>&nbsp; &nbsp; &nbsp; `-/xyz/openbmc_project/software/host4</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; `-/xyz/openbmc_project/software/host4/28bd=
62d9</div>
<div><br>
</div>
<div><br>
</div>
<div>3.This will create activation interface for each host. For a multi-hos=
t system if the &nbsp;RequestedActivation is set to &quot;xyz.openbmc_proje=
ct.Software.Activation.RequestedActivations.Active&quot;, then different bi=
os service file will be called based the host.</div>
<div><br>
</div>
<div>For single host : biosServiceFile =3D &quot;obmc-flash-host-bios@&quot=
; + versionId + &quot;.service&quot;;</div>
<div>For multi host &nbsp;: biosServiceFile =3D &nbsp;&quot;obmc-flash-host=
&quot; + host + &quot;-bios@&quot; + versionId + &quot;.service&quot;;
</div>
<div><br>
</div>
<div><br>
</div>
<div>Then it can be used for multi host even if the firmware image we want =
to install is the same for multiple host targets.</div>
<div><br>
</div>
<div>I have created a WIP patch for the design proposed above.Kindly have a=
 glance and share your comments.</div>
<div><br>
</div>
<div><a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-bmc-c=
ode-mgmt/+/37448" id=3D"LPlnk873192">https://gerrit.openbmc-project.xyz/c/o=
penbmc/phosphor-bmc-code-mgmt/+/37448</a><br>
</div>
<div><br>
</div>
<div>Thanks,</div>
Priyatharshan P
<div>
<div>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Adriana Kobylak &lt;a=
noo@linux.ibm.com&gt;<br>
<b>Sent:</b> 06 October 2020 03:11<br>
<b>To:</b> P. Priyatharshan &lt;PriyatharshanP@hcl.com&gt;<br>
<b>Cc:</b> Patrick Williams &lt;patrick@stwcx.xyz&gt;; Velumani T-ERS,HCLTe=
ch &lt;velumanit@hcl.com&gt;; openbmc@lists.ozlabs.org &lt;openbmc@lists.oz=
labs.org&gt;; anoo@us.ibm.com &lt;anoo@us.ibm.com&gt;; ojayanth@in.ibm.com =
&lt;ojayanth@in.ibm.com&gt;; gmills@linux.vnet.ibm.com &lt;gmills@linux.vne=
t.ibm.com&gt;;
 ratagupt@linux.vnet.ibm.com &lt;ratagupt@linux.vnet.ibm.com&gt;<br>
<b>Subject:</b> Re: Multi host bios upgrade support in phosphor-bmc-code-mg=
mt:</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[CAUTION: This Email is from outside the Organizat=
ion. Unless you trust the sender, Don=92t click links or open attachments a=
s it may be a Phishing email, which can steal your Information and compromi=
se your Computer.]<br>
<br>
Hi Priyatharshan,<br>
<br>
&gt;&nbsp; Object : /xyz/openbmc_project/software/[FIRMWARE_VERSION]_[DEVIC=
E]<br>
&gt; where device could be host1, 2, ...,N<br>
&gt;&nbsp; Interface : xyz.openbmc_project.Software.Activation<br>
&gt;<br>
&gt;&nbsp; Please confirm if our understanding is correct.<br>
<br>
I meant that to generate the id, which currently uses the version<br>
string, would instead use the version string plus the string for the<br>
name of the device where it's stored in order to generate the hash. For<br>
example, today the code calls &quot;SHA512_Update(&quot;version&quot;)&quot=
;, where<br>
&quot;version&quot; is for example &quot;2.9.0-dev-663-g2e34bb673&quot;. In=
stead the code<br>
would detect this version is stored let's say in device &quot;mtd1&quot; or=
<br>
&quot;mmcblk0p1&quot;, it'd then append that device string to version, ex:<=
br>
&quot;2.9.0-dev-663-g2e34bb673-mmcblk0p1&quot; and pass that string to<br>
SHA512_Update(), therefore creating a different hash depending where<br>
that version of bmc code is stored.<br>
<br>
Note that this is for BMC versions only. We discussed that for host<br>
versions, we'd need to modify the code to add a &quot;os-release&quot; file=
 under<br>
/media/ that contained the host version information similar to the BMC's<br=
>
os-release file. In addition, we'd need to somehow determine that those<br>
files were for host (Bios) versions instead of BMC ones. Perhaps<br>
os-release could have an additional field added to specify the purpose.<br>
<br>
<br>
&gt; Adriana, Any tentative timeline on your commits availability [generate=
<br>
&gt; the id based on firmware version plus the device or volume ]<br>
<br>
I'd say by early next year at the latest.<br>
</div>
</span></font></div>
<font face=3D"Arial" color=3D"Gray" size=3D"1">::DISCLAIMER::<br>
<hr>
The contents of this e-mail and any attachment(s) are confidential and inte=
nded for the named recipient(s) only. E-mail transmission is not guaranteed=
 to be secure or error-free as information could be intercepted, corrupted,=
 lost, destroyed, arrive late or
 incomplete, or may contain viruses in transmission. The e mail and its con=
tents (with or without referred errors) shall therefore not attach any liab=
ility on the originator or HCL or its affiliates. Views or opinions, if any=
, presented in this email are solely
 those of the author and may not necessarily reflect the views or opinions =
of HCL or its affiliates. Any form of reproduction, dissemination, copying,=
 disclosure, modification, distribution and / or publication of this messag=
e without the prior written consent
 of authorized representative of HCL is strictly prohibited. If you have re=
ceived this email in error please delete it and notify the sender immediate=
ly. Before opening any email and/or attachments, please check them for viru=
ses and other defects.<br>
<hr>
</font>
</body>
</html>

--_000_SL2PR04MB330696831B49B81F75168538CA020SL2PR04MB3306apcp_--
