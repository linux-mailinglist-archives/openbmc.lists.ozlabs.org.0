Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFFE75A478
	for <lists+openbmc@lfdr.de>; Thu, 20 Jul 2023 04:44:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=fx/Ih/Uv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5xpY44scz3bsS
	for <lists+openbmc@lfdr.de>; Thu, 20 Jul 2023 12:44:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=fx/Ih/Uv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::629; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5xnx6slzz2ywL
	for <openbmc@lists.ozlabs.org>; Thu, 20 Jul 2023 12:43:32 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQ8b8sg7RFT6I8b58MGmgHh1B/prPVEFFq2IqiFxt2Scjn7BwjcwqSq/Cxb9lYULu7BCCPdy5k/zX84qXl79/H18puEd9EEhRoODtVLPQ2Sw65kufowHtPd9FPyuZdpezX4Bx9Tv1Kg+/8UlxCfbR2HvCw2+CryXo5JQlbdxcNucZUD0B4vJBzj7oeKH7ikvJsjOXEfTh9IW+PExCZpn9Fzbtfsrl6RSQS1j96TU5XUIF7Uc0DAxmPiCRCtjGRf7HYHP/Xy0eAb05UEaylFQCRybXiyMT7IaYXr8kosGgyCgIjL4fzM7fXVWECL4JlO7kxIRz4Rv4wUS/adda177pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7GcOlPYl7CIfA7zE3z7eQ9Qe7QQoJco7MOfpi5GxaF4=;
 b=KxhVyTMxiR+Kk6JVP+pTYDOMscpc0050SF3nMy/apXUwtEeiIylbnGdwb2XdsFWaIi5c52bJVrzYXemEHFho7VJ0Q0N+rJvizEGrPCLZLKSdBxbL0qE6azQUYRK/hrFhKhQLhSk4uv1G7Hd4J+ngCTCSnSfhBMOOQh0Rr3tUEAVUwSR9ximV/FHpvTllwM884slwmmn9ksbOlVdJvyIWD13ROG8GIspPtoDpEJEsBzjlRyhUxZUuE22/sTx/QxI5ly/P1svjTCo2xTMQJDdQkardo4d0E4I7KyeWLpacimdHGiBuekoRU/lTMgO2HJThLZqr9mHWC3tUNvJlEmlD1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7GcOlPYl7CIfA7zE3z7eQ9Qe7QQoJco7MOfpi5GxaF4=;
 b=fx/Ih/Uv/bLWFCU7M7yj9eL+hrxMZz/qK4FsvCs2giE/Koscfs8HlddFvCLja+v6o+xz3Q83N/XYwQO1NvPvXiHSqQF/MJvewDHha+bDnPAABYX8gAtALbVDbiJHOYQy4XwbeABXli5MeekERGsx73V1nHldUsbuDILO7XOnwxwTVRSD+q4Zs2kOQidKXs4hPrbqCYnHPtAUvFz141ct6dUmv1YNoOpLl2rUc7tQb0XPMiu4ef1ROi7HeclhfjXjrVWPqATjSlc1//dkaqloL40ycZF/OEvbIJlfJbHNOvPBXUhRNKzquPkGsB8XIi3hBbwEOjvoP+MIlmcJxspQKA==
Received: from SEZPR04MB6657.apcprd04.prod.outlook.com (2603:1096:101:e0::15)
 by SEZPR04MB6641.apcprd04.prod.outlook.com (2603:1096:101:e2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.28; Thu, 20 Jul
 2023 02:43:07 +0000
Received: from SEZPR04MB6657.apcprd04.prod.outlook.com
 ([fe80::5a0f:d8d1:cead:c7a3]) by SEZPR04MB6657.apcprd04.prod.outlook.com
 ([fe80::5a0f:d8d1:cead:c7a3%5]) with mapi id 15.20.6588.028; Thu, 20 Jul 2023
 02:43:07 +0000
From: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>, rashmica
	<rashmica@imap.linux.ibm.com>
Subject: RE: The function of PLDM over MCTP
Thread-Topic: The function of PLDM over MCTP
Thread-Index: Adm1agx+a5fj3fPHRoaKmvhq1JIcJwDDZ5KAAFurU+AAM1sKYA==
Date: Thu, 20 Jul 2023 02:43:06 +0000
Message-ID:  <SEZPR04MB6657DD745EEFC7F54AAB49F7EF3EA@SEZPR04MB6657.apcprd04.prod.outlook.com>
References:  <KL1PR04MB6664400778345115F71B56C8EF34A@KL1PR04MB6664.apcprd04.prod.outlook.com>
 <51c860ad4e4deec3d790002c21c68dcb@imap.linux.ibm.com>
 <KL1PR04MB66647E932EB945CEA63B5BB8EF39A@KL1PR04MB6664.apcprd04.prod.outlook.com>
In-Reply-To:  <KL1PR04MB66647E932EB945CEA63B5BB8EF39A@KL1PR04MB6664.apcprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR04MB6657:EE_|SEZPR04MB6641:EE_
x-ms-office365-filtering-correlation-id: b4e034a6-3b6b-4d43-d3e9-08db88cb0c4c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  1vSspdl21uPRHlX9fHLbXz/mzW2kwzrVYKmhQ3Xi7LU0T0xlWEltmfaLi5ru2JAWbfOqwkHR0KiOyx8gowBODCBIf59wFHV+agL4XSVpZay1ZbjpJQu88FQZFY6GZiXEQDF36MMwfMWZ5q2Uomy8cgq9fiSwU9oe2W0WND+CknTDRwP4PXtZjEwDHy9lVAeZqj4u2EH2YjWWK76S/CdIMtNUaLU1EzEmPhCTRP6KLvO66vPdxO6xTAqG+3jhDI/RmgtKfUClZqf1fJRtDKWmQFaUWXf8P2rBh+q71okfmx/LcTzm80ZipnicPSnJYUwVR+8eZi+YfRBwyf7k/ggNWfBPS5BGQbzRsw+Houhp2Lul1rVIfRjIqCUPQZ0cgF3vWJ2tbFAflktV20Vgy8xdUBAgBD/gutEluldLhVf04kCaSK1BeDVy4vs8fZoCyDns1EQgHewr/qRPnFHbmf8AoQ499qura7JEPrzyXHWmJEMjKWdR9So4Wyw+/GtH1wIpxABTh1AeDbJ8PU9IT+PYiPHzxBs4tkm+hw5GmbGzdJfJGPJh59DKLTSPfhjqxq6U/CNBSDomhVjJbsMxkkF2DCHhyyyhH8ggp67HasIIZXg=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR04MB6657.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(451199021)(45080400002)(478600001)(6506007)(26005)(53546011)(9686003)(966005)(7696005)(55016003)(71200400001)(83380400001)(8936002)(33656002)(38070700005)(8676002)(5660300002)(52536014)(4326008)(316002)(41300700001)(86362001)(2906002)(186003)(122000001)(66476007)(38100700002)(76116006)(110136005)(66556008)(66446008)(64756008)(54906003)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?IxXtVdFRXskEjZIZQbmJwjKj5Ho5IUtkyrCungxPdGuH/cTEDj5J/DYySYvH?=
 =?us-ascii?Q?Uv7rckH4IqGUTNak1mQFkWDjA7Zn2cFC+PAEwXVHhLzhmGgeUtKuA24V60Mg?=
 =?us-ascii?Q?2F1XtnPrxSPFnT95rz0Sug9plIsT7rC7H9ym8LZ7iL/51gokUEYttJsXS0gE?=
 =?us-ascii?Q?BW7baX1mr/h/urhzOy19todb0LNV6emP0ZDEJUkVLXhFNzHpJvo3iTaCiTcd?=
 =?us-ascii?Q?jDrzEpqIgNkiRVrTjwsAs4JTTrf/kJMSyruPFzjAKV9VDr19FlzdkNTaoG9Q?=
 =?us-ascii?Q?0kR5T1u0OlRv8Rnp2Yhm40GLJhxa6WTdA7il5QaV9pYfv/JwfrRTRzpAFsrr?=
 =?us-ascii?Q?an9+va3fn/OuA6kXnBinL25NQfRONo1u2gt9CUQyFvW9E210LdS1mGWOl+Vf?=
 =?us-ascii?Q?wXCcfp6FkB/53VqfVQ430N1HH9PdEQrCaps75XQCENuQtoLSmHCXSuaiiMV/?=
 =?us-ascii?Q?MzizqOSKukvECth9UiLBrq9ffHpiASg1JB1wlyHvKz1NyYvFjSOJOAhWFKMM?=
 =?us-ascii?Q?en4dZy8fuMungASjhC+SLvECzpafK6dGCO6Oyv081OfrZLYdvAKzWxtwvcim?=
 =?us-ascii?Q?N6oXV/qquyGv5H255VD++uLWBj4EuAaR/ifGMofKY8lxePK0TgvyM6ITZ+mg?=
 =?us-ascii?Q?zz0f5mnX59jb8mqdVraruRwMCF/4qra3CO7GvTM/upg2yECJ0xWZDKUOK9KL?=
 =?us-ascii?Q?EwKSeA8G5K/7ADQ1/rj0ncTzaKvXU7rDn31NDT2T+QwRdIvrXubvBds+wNFH?=
 =?us-ascii?Q?nTztm7XKXNPc9XPIY7LDP95722DR0cEN4dGXR68pyeY6qw4iHpHzMWBNjB0V?=
 =?us-ascii?Q?okVqQ+KDU/6GtDG9gL4ucgmOLRYLj3leNrgrfPs3+BriHfxcfx6g6jOu68ze?=
 =?us-ascii?Q?FQWTXHlvNjL0V2EsWAYZQWAK/GPQ1HhtruCphzTKDkROMDwEg+SkrA3OPkxT?=
 =?us-ascii?Q?9oaT9Ab5i6nSdp7G0yaGMKa8kfqq5vEeKgIPxPaXht5qTEekZwkkg6wtbNLZ?=
 =?us-ascii?Q?Ot3G01YT/JnFk334xU8OTyEMFzK3sbNdF3St0aA9s/K5qVzVyjOGqqGT/uW8?=
 =?us-ascii?Q?CxMAunCj/AlSzlFSJ/36CEBvQlJ4Y4hi9hTajXoVzsjW8QXn7VudCCkKxp/A?=
 =?us-ascii?Q?TffKuh/OJ764ve3fXm55An92lwI0vWyo7B8zU1jRG8DbJHfNXvb+8V6gMpdF?=
 =?us-ascii?Q?ZKW3UeoDB80WkfTphD7+QQQS/qL3pBmI4G9XUw9TF6dlyeFU4nkUAkxZW255?=
 =?us-ascii?Q?2IqfgPYSIrT9nD1sA+mkPaANm3bDROqC26ybvc3iDNLfBjfxU8xE0ZCrmGK+?=
 =?us-ascii?Q?gZII8e6Cj7s+HmdHloNPEdFLoQm9dHJ6hrbI9cNBSfi634gWW3eky+EpqM9P?=
 =?us-ascii?Q?2AhQj1dlzOdUhkAWcj0JQFOHwg13NF+TDDbRcSAel/EJzzaSd8yvly01CAP0?=
 =?us-ascii?Q?a2Yzk3zivsuQStIp+YVRF8pq06aTNm1xxlCu8tnS1jvG3cnuaDDRMFqB8TTC?=
 =?us-ascii?Q?8lN7bpBSZ8uGj57wyNVFnFrBkYoD7TV1+xH/BvjoRBpmdO3DNVE0P75QY+YN?=
 =?us-ascii?Q?Po5H6K8Oo4fU/k6mmK7JLsmxHGqFk9w5KNz4ciIY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR04MB6657.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e034a6-3b6b-4d43-d3e9-08db88cb0c4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 02:43:06.8944
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i8FvYPwV8KDwHOlOtsA4jpcVcxokZVjWYLKRT+CDWphblT6ATZ5tqagGNrsof/wCaywFPHJocqhtip9cJ5T4ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6641
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
Cc: Patrick Williams <patrickw3@meta.com>, openbmc_compute <openbmc_compute@meta.com>, "rashmica@linux.ibm.com" <rashmica@linux.ibm.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Loop openbmc group

-----Original Message-----
From: Delphine_CC_Chiu/WYHQ/Wiwynn
Sent: Wednesday, July 19, 2023 10:14 AM
To: rashmica <rashmica@imap.linux.ibm.com>; Delphine_CC_Chiu/WYHQ/Wiwynn <D=
elphine_CC_Chiu@wiwynn.com>
Cc: rashmica@linux.ibm.com; Patrick Williams <patrickw3@meta.com>; Bonnie L=
o/WYHQ/Wiwynn <Bonnie_Lo@wiwynn.com>; openbmc_compute <openbmc_compute@meta=
.com>
Subject: RE: The function of PLDM over MCTP

Hi Rashmica,

Thank you for reply. The LF is means openbmc community.

I think is has some typo for the link:
https://gerrit.openbmc.org/c/openbmc/libpldm/+/58057
https://gerrit.openbmc.org/c/openbmc/pldm/+/58058
https://gerrit.openbmc.org/c/openbmc/pldm/+/58059

Could you help make sure the code above is up to date?

In addition, do you have a plan for when this feature will be completed?
We are willing to assist in revising and testing to ensure its workability.


Thanks,
Delphine


-----Original Message-----
From: rashmica <rashmica@imap.linux.ibm.com>
Sent: Monday, July 17, 2023 2:27 PM
To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
Cc: rashmica@linux.ibm.com; Patrick Williams <patrickw3@meta.com>; Bonnie L=
o/WYHQ/Wiwynn <Bonnie_Lo@wiwynn.com>; Eli Huang/WYHQ/Wiwynn <Eli_Huang@wiwy=
nn.com>
Subject: Re: The function of PLDM over MCTP

  Security Reminder: Please be aware that this email is sent by an external=
 sender.

Hi Delphine,

Apologies if you get two replies, my email client is playing up and I'm pre=
tty sure my last reply didn't go through.

I can only access the first link, but that commit and the other two that we=
re needed with it are out of date. I'm not sure what you mean by "LF"?

This commit message explains the current approach:
https://gerrit.openbmc.org/c/openbmc/libpldm/+/59576

Steps 1 and 2 are done. 3 and 4 are in progress, but progress is very slow =
as I have been unwell since early 2023.

There is now an instance id API (upstream) and transport API (upstream but =
not stable), and eventually there will be a requester API, and hopefully a =
responder API one day.

- pldmd needs conversion to transport API. This is being held up by making =
the transport API requester/responder agnostic.
https://gerrit.openbmc.org/c/openbmc/pldm/+/63652
- other applications need conversion to to instance id API and transport AP=
I
- then pldmd and other upstream applications will move over to AF_MCTP

If you want to help, let me know. Otherwise the easiest way to use upstream=
 and get AF_MCTP working is to change the transport objects and function ca=
lls in libpldm/src/requester/pldm.c from pldm_transport_mctp_demux to pldm_=
transport_af_mctp


Cheers,
Rashmica


On 2023-07-14 12:05, Delphine_CC_Chiu/WYHQ/Wiwynn wrote:
> Hi Rashmica,
>
> This is Delphine from Wiwynn BMC team.
>
> We plan to support the function of PLDM over MCTP.
>
> We found this commit and test is successful but the current status of
> the commit is merge conflict.
>
> Do you currently have plans to resolve conflicts for these commits and
> contribute to LF?
>
> The commit for PLDM over MCTP is as follow:
>
> https://gerr/
> it.openbmc.org%2Fc%2Fopenbmc%2Flibpldm%2F%2B%2F58057&data=3D05%7C01%7CEl
> i_Huang%40wiwynn.com%7Ce9fd7dc7600b482aeaee08db868ed14c%7Cda6e0628fc83
> 4caf9dd273061cbab167%7C0%7C0%7C638251720212845169%7CUnknown%7CTWFpbGZs
> b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D
> %7C3000%7C%7C%7C&sdata=3DsE%2BtrOCZldTspzZsyw01RnWudAzz1bSOt0d%2BbjVAykk
> %3D&reserved=3D0
>
> https://gerr/
> it.openbmc.org%2Fc%2Fopenbmc%2Flibpldm%2F%2B%2F58058&data=3D05%7C01%7CEl
> i_Huang%40wiwynn.com%7Ce9fd7dc7600b482aeaee08db868ed14c%7Cda6e0628fc83
> 4caf9dd273061cbab167%7C0%7C0%7C638251720212845169%7CUnknown%7CTWFpbGZs
> b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D
> %7C3000%7C%7C%7C&sdata=3DHcM9Zl%2BRwzaRxfiPkMNvQh6ZrFeq6NeHlcqaDc6myt4%3
> D&reserved=3D0
>
> https://gerr/
> it.openbmc.org%2Fc%2Fopenbmc%2Flibpldm%2F%2B%2F58059&data=3D05%7C01%7CEl
> i_Huang%40wiwynn.com%7Ce9fd7dc7600b482aeaee08db868ed14c%7Cda6e0628fc83
> 4caf9dd273061cbab167%7C0%7C0%7C638251720212845169%7CUnknown%7CTWFpbGZs
> b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D
> %7C3000%7C%7C%7C&sdata=3DHYcTFdCdBVRm4vyUZ3PyR9NQgSoZLUc92yauCJLktPs%3D&
> reserved=3D0
>
> Thanks,
>
> Delphine
