Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB9A287523
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 15:16:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6Wtx43tPzDqLj
	for <lists+openbmc@lfdr.de>; Fri,  9 Oct 2020 00:16:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.129.137; helo=kor01-sl2-obe.outbound.protection.outlook.com;
 envelope-from=priyatharshanp@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=D6xIMh8n; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=D6xIMh8n; 
 dkim-atps=neutral
Received: from KOR01-SL2-obe.outbound.protection.outlook.com
 (mail-eopbgr1290137.outbound.protection.outlook.com [40.107.129.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6WrJ2MQjzDqWL
 for <openbmc@lists.ozlabs.org>; Fri,  9 Oct 2020 00:14:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4L8nmhJa6RptK/PJWXumQmayhBLuU2BXdnzLUoiEe4g=;
 b=D6xIMh8nAhqaeZ2qFCQP3l3TvkdtgkK3SCsuK+f0qMfmzYUdJX4Fxfu8lK28C7QR/Px2lWbog+vS60oLouHYQ9xEJlXMzzxiskCaqUrGvzzBFXdvEXch/BxDsQZGhp10uYU+o0TpfhaRVe6RgX1eHUxlnBfeHYmcxI7ILu4BKxA=
Received: from HK2PR0401CA0005.apcprd04.prod.outlook.com (2603:1096:202:2::15)
 by SL2PR04MB3113.apcprd04.prod.outlook.com (2603:1096:100:3c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Thu, 8 Oct
 2020 13:13:54 +0000
Received: from HK2APC01FT018.eop-APC01.prod.protection.outlook.com
 (2603:1096:202:2:cafe::c7) by HK2PR0401CA0005.outlook.office365.com
 (2603:1096:202:2::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23 via Frontend
 Transport; Thu, 8 Oct 2020 13:13:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.52)
 smtp.mailfrom=hcl.com; fb.com; dkim=pass (signature was verified)
 header.d=HCL.COM;fb.com; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.52 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.52; helo=APC01-HK2-obe.outbound.protection.outlook.com;
Received: from APC01-HK2-obe.outbound.protection.outlook.com (192.8.245.52) by
 HK2APC01FT018.mail.protection.outlook.com (10.152.248.183) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Thu, 8 Oct 2020 13:13:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJNED1vkT7shFZER2/YeE/DHu/1cEVGtd3QQmfkMllNBgW/e7hY88cS5cmgDlTl5JmxNftngOeNkYh+tnCqURMq3yvrhIP46HPKXoIbpbZK6Uf2wNG5WdVmxk+AJ1Cisb2R+pInuiF9YVuWyWqN7AoqC7kvFLuEgS39k2tIDiltne9kLB9baJ2g/6nqzKaWo2dd4NprUaT+YmhFMFFVj1WOAV/8yxfL5EIemdA6Ao/fkbSgT0RjYRWOKKPQ7N+2/WM6go3QEOVyDlx4zHv3Bdq2ko3ovdNrWmBBhteOMekYw7oNQxN4f3eyDiAmNpJ1XJilw4CZC+wol+DW81eAEtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4L8nmhJa6RptK/PJWXumQmayhBLuU2BXdnzLUoiEe4g=;
 b=L4/hTlkdqf9bxMyRfUCKuH7CRZYrIG+SRt21jtrYtOE7INMnP7z3fxQvxb8Tir8nj7PzDQv7x8diUD2eboSn+YarVuA1H8rAH3PVLM1bYsu/H+izeKFkDNzEeLnZ4608bf5o9+Njg02W4IsWJJxYLM0/v5nwx/3a97OLv2jO7ONfAVEbEIza2XwFOJu3tyVWfPYtVjRQNl2JDQ0MeO1z6Uh7/90EOCXsChBp3YuwbGhBGBZgmsU2nsq4SGr5XyIhV3eEYiJ4wnIb6rH+7LABhQ9dQ5ph0Bo8+ZOnnYhiF8mb/+d3g9gTdTLhCPmzTQkhHLiJJOEtTVtYqDRM3LzDxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4L8nmhJa6RptK/PJWXumQmayhBLuU2BXdnzLUoiEe4g=;
 b=D6xIMh8nAhqaeZ2qFCQP3l3TvkdtgkK3SCsuK+f0qMfmzYUdJX4Fxfu8lK28C7QR/Px2lWbog+vS60oLouHYQ9xEJlXMzzxiskCaqUrGvzzBFXdvEXch/BxDsQZGhp10uYU+o0TpfhaRVe6RgX1eHUxlnBfeHYmcxI7ILu4BKxA=
Received: from TY2PR04MB3311.apcprd04.prod.outlook.com (2603:1096:404:94::9)
 by TY2PR04MB3310.apcprd04.prod.outlook.com (2603:1096:404:93::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.37; Thu, 8 Oct
 2020 13:13:50 +0000
Received: from TY2PR04MB3311.apcprd04.prod.outlook.com
 ([fe80::70ff:f1c8:a5fd:6ef2]) by TY2PR04MB3311.apcprd04.prod.outlook.com
 ([fe80::70ff:f1c8:a5fd:6ef2%6]) with mapi id 15.20.3455.023; Thu, 8 Oct 2020
 13:13:50 +0000
From: "P. Priyatharshan" <PriyatharshanP@hcl.com>
To: Vijay Khemka <vijaykhemka@fb.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "ed@tanous.net" <ed@tanous.net>
Subject: Re: 12v slot AC Support  in x86-power-control
Thread-Topic: 12v slot AC Support  in x86-power-control
Thread-Index: AQHWm/+U/ovub+7wQkO9Ywat+ZJBqKmMahsAgAFEL8g=
Date: Thu, 8 Oct 2020 13:13:49 +0000
Message-ID: <TY2PR04MB3311145637BFB1FAB1CFF2C4CA0B0@TY2PR04MB3311.apcprd04.prod.outlook.com>
References: <TY2PR04MB3311FEF038529B122E1123DECA0D0@TY2PR04MB3311.apcprd04.prod.outlook.com>,
 <EC03A9B2-FE8C-499C-B456-E76EE677E28D@fb.com>
In-Reply-To: <EC03A9B2-FE8C-499C-B456-E76EE677E28D@fb.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: fb.com; dkim=none (message not signed)
 header.d=none;fb.com; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [2409:4072:797:fdd0:31e8:c3e6:208:7743]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 034821a2-9c21-4e39-4d70-08d86b8c00ef
x-ms-traffictypediagnostic: TY2PR04MB3310:|SL2PR04MB3113:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <SL2PR04MB3113AA2021468AB903C3315BCA0B0@SL2PR04MB3113.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: KpW4TMRWBlbO/SEB2tAaJyfa7Ag9AqZMJls7cV7IrW7kh+6T0t1R+8EGrqRUAFLe/JWeN66vFRKAjuzSqBZbkz8pj7kt/2HLdVodO9oMCXucYtMu4ruYNk054o4hvo7k7PujzLZSHOu1XUs/EtHPnjf2aZFkdTCQUxk8RClplgjBP6Vj56Mk5VpBzeP8Ux5ZZK9jeP1ATj8U9C+SrTsD2yBt2b5TQlRbVkc4efdFCGxmxxLW5w+GguDpM+PttjpUoswQc0N45iiuZGFA4TDqRA7GNzDt4XHxsdq8dluGFT5OkZG7xgtNifF2g/gWIhsOGoyckT4hDg1on00tgffCluV4n0ttrCgmutNCfNw7JXK3BxZFDEjsGUXbsdNidH7gVwEUWg0Z5pwJek4EAKs/cw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:TY2PR04MB3311.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(376002)(396003)(39860400002)(21615005)(33656002)(86362001)(966005)(19627235002)(478600001)(19627405001)(66946007)(316002)(2906002)(110136005)(52536014)(76116006)(91956017)(53546011)(6506007)(4326008)(7696005)(66446008)(64756008)(66556008)(5660300002)(66476007)(8936002)(8676002)(83380400001)(83080400001)(71200400001)(186003)(9686003)(55016002)(166002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: WIfa5H9dcKfNtXF6dgLZrmySnsrpX3OC0w2RwC64WXJIwl6Vcu0N/pM4oHozC60Dp+JM9hg/6/05Nd4yM70OmcBCvHgihjQV2sM9S+yEamkZTIQ8di8/aEZLQymqQnG3ZEoAE5qqmw2KSpmOlZPQHuKMLDCSOKl7IVRuOvl6iG9F3BRqZVnBVlayGP7PwYQ6b1BebeWXV6j7Z4Om//DHXozAX+uZy3k8CbsQW05mABjSOJeIwty3mQvKOwXUD7N3SJkCdueyp09GcDayDKC297Jni5nWA2Q7grqIvrmRF8nDAWpN5DlZKYBejorPNGMgSYS41HWp1Z5MeQrrCPgT9vCH8vFTnMMv/Gmxv4qtlmlcln8BNzHcJWlTQbzZLc0B8SGdZqkcgRB7+hGdUuUrWpsxIyxAhrkVbdK1pbTchrL8jqdSr6cPbqUTWaChzcB7KyB/3EnHX5OwLNV3TEciZ/g5hgi2rdMcor+hkDsF8QFkH6LqqV2uQu/qFne/q8mqkYLyD/jolZfjvpmThNKXwbFbsZwIM/zHBC/x2VIw5JFvzlt6WcVSUTHL1p4dJK5RRizIgnpXgEmbhA9nRf++6qXWo8vYBeZ0+XdJtytJEZqfFYfJ8qEYM7kWW/Vy85qKyd+lL+i+ppM+0Wh5A8952o6m0mWGYvXRJ8x1pn0alBrV90ifbLKc3j73IYGlCdpIQkJ0PUiX5EKhyLsmhkCJEw==
Content-Type: multipart/alternative;
 boundary="_000_TY2PR04MB3311145637BFB1FAB1CFF2C4CA0B0TY2PR04MB3311apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB3310
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT018.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 52e98a30-1297-47f8-d06e-08d86b8bff4b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nuaXf9X5CaS6fqP2t0TAB3zJ+N1CaG3D8oevnD+m3vpaFiesKJoFEsu9gjZXIBZ5VaBZwpiAg1D+d+TKHGT38rMToT+JDpC2PwF+W7XPIVhJ0Q3JOJfjvOGS+ksOQdKG0j92DUI5/TBmpLc1Fxv9G1deywN9rLdqCynHv6rC9vMGZHGtyJpMwSfN83xCdVsaSDJUjdeUEe3ontE/8x9YLdHsk4egNWx4h4FYg/8WFGgPtl1F+1VsQmnVNj3GKvpnx3HXdC7X14x1cePJQzJv4hJUAFG9UxMjwrVtFI7ZTEHdmzrboLFHPy04Y0Ia0iFWW5Fb+v3P7dFXULpw/GQecsL1FbdUK2Mzb7GlXMuP/jT3sJLZKWvcDp7LyYQKHuyR4pIxW1xjQ5w2FA+RH+mtS0e0KJKba5AwUH73GLDdkDn9kuUsyfCFpjfnH1y9I0+SkopEIUTj0y92yTEpoybyMdKzUvExjdXc/+7JRaB9ZSZvbj6xxI2sXC681IgYQ06K
X-Forefront-Antispam-Report: CIP:192.8.245.52; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-HK2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(396003)(346002)(46966005)(21615005)(83380400001)(8936002)(33656002)(55016002)(47076004)(2906002)(356005)(19627235002)(166002)(82310400003)(34020700004)(6506007)(26005)(53546011)(7696005)(52536014)(336012)(81166007)(82740400003)(186003)(70586007)(4326008)(70206006)(5660300002)(110136005)(36906005)(8676002)(478600001)(966005)(83080400001)(316002)(9686003)(86362001)(19627405001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2020 13:13:52.1854 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 034821a2-9c21-4e39-4d70-08d86b8c00ef
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.52];
 Helo=[APC01-HK2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT018.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR04MB3113
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

--_000_TY2PR04MB3311145637BFB1FAB1CFF2C4CA0B0TY2PR04MB3311apcp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Thanks Vijay/Patrick for your comments.

The feature we are working is different from vijay's feature.


Out platform is multi host system and we  have the host as FRU and it can b=
e plugged in to a slot. The slot has an option to control slot power and th=
is can be used for a AC cycle.

We proposed  a design to add the slot power control in the x86-power-contro=
l.The earlier discussion can be found in the below link.

https://lists.ozlabs.org/pipermail/openbmc/2020-August/022481.html

ed tanous,

I will create a clear document on when to use this slot power control featu=
re.

Thanks,
Priyatharshan P

________________________________
From: Vijay Khemka <vijaykhemka@fb.com>
Sent: 08 October 2020 06:11
To: P. Priyatharshan <PriyatharshanP@hcl.com>; openbmc@lists.ozlabs.org <op=
enbmc@lists.ozlabs.org>; ed@tanous.net <ed@tanous.net>
Cc: Velumani T-ERS,HCLTech <velumanit@hcl.com>
Subject: Re: 12v slot AC Support in x86-power-control


[CAUTION: This Email is from outside the Organization. Unless you trust the=
 sender, Don=92t click links or open attachments as it may be a Phishing em=
ail, which can steal your Information and compromise your Computer.]

Hi Priyatharshan,

Chassis system reset is for removing AC power for the whole chassis and it =
is already supported in x86-power-control. I am working on enabling this fe=
ature in redfish. I am not sure how it is related to your new features. If =
it is related then you can also define system_reset target unit.



Regards

-Vijay



From: "P. Priyatharshan" <PriyatharshanP@hcl.com>
Date: Tuesday, October 6, 2020 at 9:43 AM
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Vijay Khemka <vi=
jaykhemka@fb.com>, "ed@tanous.net" <ed@tanous.net>
Cc: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
Subject: 12v slot AC Support in x86-power-control



Hi Vijay,



I am working on a patch to support  12v slot AC cycle in x86-power-control.=
This can be enabled by configuring slotACPowerName in json config file.Sinc=
e you are also working on similar kind of feature in x86-power-control, I w=
ould like bring up this discussion on mailing list to understand how these =
two features, and the design you proposed for chassis reset are intended to=
 work together.Kindly go through my design changes below and share your tho=
ughts.



I have modified the existing /xyz/openbmc_project/state/chassis0 object to =
implement 12V On, Off, and Power Cycle for system which has 12V Slot power =
support.





If slotACPowerName is disabled and if,



RequestedPowerTransition =3D "xyz.openbmc_project.State.Chassis.Transition.=
Off" then poweroff [existing functionality not changed]



RequestedPowerTransition =3D "xyz.openbmc_project.State.Chassis.Transition.=
On" then powerOn [existing functionality not changed]



RequestedPowerTransition =3D "xyz.openbmc_project.State.Chassis.Transition.=
PowerCycle" then PowerCycle [existing functionality not changed]



events will be called.







If slotACPowerName is enabled and if,



RequestedPowerTransition =3D "xyz.openbmc_project.State.Chassis.Transition.=
Off" then 12V Ac Slot Off



RequestedPowerTransition =3D "xyz.openbmc_project.State.Chassis.Transition.=
On" then 12V Ac Slot On



RequestedPowerTransition =3D "xyz.openbmc_project.State.Chassis.Transition.=
PowerCycle" then 12V Ac Slot PowerCycle



events will be called.



Thanks,

Priyatharshan P

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

--_000_TY2PR04MB3311145637BFB1FAB1CFF2C4CA0B0TY2PR04MB3311apcp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt">
Thanks Vijay/Patrick for your comments.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt">
The feature we are working is different from vijay's feature.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt">
<p style=3D"font-size:11pt; font-family:Calibri,sans-serif; margin:0">Out p=
latform is multi host system and we&nbsp; have the host as FRU and it can b=
e plugged in to a slot. The slot has an option to control slot power and th=
is can be used for a AC cycle.</p>
<p style=3D"font-size:11pt; font-family:Calibri,sans-serif; margin:0">We pr=
oposed&nbsp; a design to add the slot power control in the x86-power-contro=
l.The earlier discussion can be found in the below link.
</p>
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt">
<a href=3D"https://lists.ozlabs.org/pipermail/openbmc/2020-August/022481.ht=
ml">https://lists.ozlabs.org/pipermail/openbmc/2020-August/022481.html</a><=
/div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt">
ed tanous,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt">
I will create a clear document on when to use this slot power control featu=
re.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt">
Thanks,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt">
Priyatharshan P<br>
</div>
</div>
<br>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Vijay Khemka &lt;vija=
ykhemka@fb.com&gt;<br>
<b>Sent:</b> 08 October 2020 06:11<br>
<b>To:</b> P. Priyatharshan &lt;PriyatharshanP@hcl.com&gt;; openbmc@lists.o=
zlabs.org &lt;openbmc@lists.ozlabs.org&gt;; ed@tanous.net &lt;ed@tanous.net=
&gt;<br>
<b>Cc:</b> Velumani T-ERS,HCLTech &lt;velumanit@hcl.com&gt;<br>
<b>Subject:</b> Re: 12v slot AC Support in x86-power-control</font>
<div>&nbsp;</div>
</div>
<style>
<!--
@font-face
	{font-family:"Cambria Math"}
@font-face
	{font-family:Calibri}
p.x_MsoNormal, li.x_MsoNormal, div.x_MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
span.x_EmailStyle19
	{font-family:"Calibri",sans-serif;
	color:windowtext}
.x_MsoChpDefault
	{font-size:10.0pt}
@page WordSection1
	{margin:1.0in 1.0in 1.0in 1.0in}
div.x_WordSection1
	{}
-->
</style>
<div lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:b=
reak-word">
<p></p>
<p class=3D"x_MsoNormal" style=3D"line-height:12.0pt; background:#FFEB9C"><=
b><span style=3D"font-size:11.0pt; color:#9C6501"></span></b><span style=3D=
"font-size:10.0pt; color:red">[CAUTION: This Email is from outside the Orga=
nization. Unless you trust the sender, Don=92t
 click links or open attachments as it may be a Phishing email, which can s=
teal your Information and compromise your Computer.]</span></p>
<div>
<div class=3D"x_WordSection1">
<p class=3D"x_MsoNormal">Hi Priyatharshan,</p>
<p class=3D"x_MsoNormal">Chassis system reset is for removing AC power for =
the whole chassis and it is already supported in x86-power-control. I am wo=
rking on enabling this feature in redfish. I am not sure how it is related =
to your new features. If it is related
 then you can also define system_reset target unit.</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">Regards</p>
<p class=3D"x_MsoNormal">-Vijay</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<div style=3D"border:none; border-top:solid #B5C4DF 1.0pt; padding:3.0pt 0i=
n 0in 0in">
<p class=3D"x_MsoNormal"><b><span style=3D"font-size:12.0pt; color:black">F=
rom: </span>
</b><span style=3D"font-size:12.0pt; color:black">&quot;P. Priyatharshan&qu=
ot; &lt;PriyatharshanP@hcl.com&gt;<br>
<b>Date: </b>Tuesday, October 6, 2020 at 9:43 AM<br>
<b>To: </b>&quot;openbmc@lists.ozlabs.org&quot; &lt;openbmc@lists.ozlabs.or=
g&gt;, Vijay Khemka &lt;vijaykhemka@fb.com&gt;, &quot;ed@tanous.net&quot; &=
lt;ed@tanous.net&gt;<br>
<b>Cc: </b>&quot;Velumani T-ERS,HCLTech&quot; &lt;velumanit@hcl.com&gt;<br>
<b>Subject: </b>12v slot AC Support in x86-power-control</span></p>
</div>
<div>
<p class=3D"x_MsoNormal">&nbsp;</p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">Hi V=
ijay, </span>
</p>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">I am=
 working on a patch to support &nbsp;12v slot AC cycle in x86-power-control=
.This can be enabled by configuring slotACPowerName in json config file.Sin=
ce you are also working on similar kind of
 feature in x86-power-control, I would like bring up this discussion on mai=
ling list to understand how these two features, and the design you proposed=
 for chassis reset are intended to work together.Kindly go through my desig=
n changes below and share your thoughts.</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">I ha=
ve modified the existing /xyz/openbmc_project/state/chassis0 object to impl=
ement 12V On, Off, and Power Cycle for system which has 12V Slot power supp=
ort.</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">If s=
lotACPowerName is disabled and if,</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">Requ=
estedPowerTransition =3D &quot;xyz.openbmc_project.State.Chassis.Transition=
.Off&quot; then poweroff [existing functionality not changed]</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">Requ=
estedPowerTransition =3D &quot;xyz.openbmc_project.State.Chassis.Transition=
.On&quot; then powerOn [existing functionality not changed]</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">Requ=
estedPowerTransition =3D &quot;xyz.openbmc_project.State.Chassis.Transition=
.PowerCycle&quot; then PowerCycle [existing functionality not changed]</spa=
n></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p; </span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">even=
ts will be called.</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p; </span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">If s=
lotACPowerName is enabled and if,</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">Requ=
estedPowerTransition =3D &quot;xyz.openbmc_project.State.Chassis.Transition=
.Off&quot; then 12V Ac Slot Off</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">Requ=
estedPowerTransition =3D &quot;xyz.openbmc_project.State.Chassis.Transition=
.On&quot; then 12V Ac Slot On
</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">Requ=
estedPowerTransition =3D &quot;xyz.openbmc_project.State.Chassis.Transition=
.PowerCycle&quot; then 12V Ac Slot PowerCycle
</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p; </span></p>
</div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">even=
ts will be called.</span></p>
</div>
<div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p;</span></p>
</div>
<div id=3D"x_Signature">
<div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">Than=
ks,</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">Priy=
atharshan P</span></p>
</div>
</div>
</div>
</div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:7.5pt; font-family:&quot;=
Arial&quot;,sans-serif; color:gray">::DISCLAIMER::</span></p>
<div class=3D"x_MsoNormal" align=3D"center" style=3D"text-align:center"><sp=
an style=3D"font-size:7.5pt; font-family:&quot;Arial&quot;,sans-serif; colo=
r:gray">
<hr size=3D"0" width=3D"100%" align=3D"center">
</span></div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:7.5pt; font-family:&quot;=
Arial&quot;,sans-serif; color:gray">The contents of this e-mail and any att=
achment(s) are confidential and intended for the named recipient(s) only. E=
-mail transmission is not guaranteed to be secure
 or error-free as information could be intercepted, corrupted, lost, destro=
yed, arrive late or incomplete, or may contain viruses in transmission. The=
 e mail and its contents (with or without referred errors) shall therefore =
not attach any liability on the
 originator or HCL or its affiliates. Views or opinions, if any, presented =
in this email are solely those of the author and may not necessarily reflec=
t the views or opinions of HCL or its affiliates. Any form of reproduction,=
 dissemination, copying, disclosure,
 modification, distribution and / or publication of this message without th=
e prior written consent of authorized representative of HCL is strictly pro=
hibited. If you have received this email in error please delete it and noti=
fy the sender immediately. Before
 opening any email and/or attachments, please check them for viruses and ot=
her defects.</span></p>
<div class=3D"x_MsoNormal" align=3D"center" style=3D"text-align:center"><sp=
an style=3D"font-size:7.5pt; font-family:&quot;Arial&quot;,sans-serif; colo=
r:gray">
<hr size=3D"0" width=3D"100%" align=3D"center">
</span></div>
</div>
</div>
</div>
</body>
</html>

--_000_TY2PR04MB3311145637BFB1FAB1CFF2C4CA0B0TY2PR04MB3311apcp_--
