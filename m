Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36130170E50
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 03:16:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Sbr3630czDqn4
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 13:16:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.129.120; helo=kor01-sl2-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=QZlFytAX; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=QZlFytAX; 
 dkim-atps=neutral
Received: from KOR01-SL2-obe.outbound.protection.outlook.com
 (mail-eopbgr1290120.outbound.protection.outlook.com [40.107.129.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NYQT5dy4zDqP2
 for <openbmc@lists.ozlabs.org>; Thu, 20 Feb 2020 23:13:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sglwUP8nblpnYJ+KhRKeVl6bWS6YYiEQILzT0LEq2Q=;
 b=QZlFytAXcbzzpikP8mte93vOCmOrSH+i+EFoVfdRogq8zP86kFeApGeN57dIQ+plGTCuINzAjtdwyZ57Kby/7m87Q0ufhLqUA1nctKs2nmC2FtViS3bkjYyZEtA0a1Umz6XiUCF8f+q2NJMrIoe25R1VA4sGCAvIdbsRrj6HNQY=
Received: from HK2PR04CA0048.apcprd04.prod.outlook.com (2603:1096:202:14::16)
 by PS2PR04MB3798.apcprd04.prod.outlook.com (2603:1096:300:68::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.25; Thu, 20 Feb
 2020 12:13:14 +0000
Received: from PU1APC01FT012.eop-APC01.prod.protection.outlook.com
 (2a01:111:f400:7ebd::202) by HK2PR04CA0048.outlook.office365.com
 (2603:1096:202:14::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.18 via Frontend
 Transport; Thu, 20 Feb 2020 12:13:13 +0000
Authentication-Results: spf=pass (sender IP is 192.8.195.56)
 smtp.mailfrom=hcl.com; aj.id.au; dkim=pass (signature was verified)
 header.d=HCL.COM;aj.id.au; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.56 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.56; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.195.56) by
 PU1APC01FT012.mail.protection.outlook.com (10.152.252.220) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.18 via Frontend Transport; Thu, 20 Feb 2020 12:13:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aN8iQHig4xj9yfISwXCVo4CMpYWqspBrtgN03BCYX/VsjC+rB5jmmJtLcvCFARuhhU8Tn3egHUYAQc9H60tuAw1XJtlb6yLryUXpk1PjKlt4TPeg3Fdb8QZBonB7mjFHeDSttr2+dNk4I8sRnRqqPVjVFLP2AkHo+DgD2AWn3Ui1VmSx/DN/lfuUz/uZZtcR0V68VdNut25FCjDrMW2EBaj2esSQNSacINgK56+V6Mu5bOh0uUr7eAp2ON3yQPLXu9IKn/E2EiX2G7H+9WwqpAzAXdMjGlFZpRTQ4YhhPNzzmHznCNdWob1/OetZWHNEXZy8qaO88d4S0yv8t6v4xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sglwUP8nblpnYJ+KhRKeVl6bWS6YYiEQILzT0LEq2Q=;
 b=DQb9vXtodXFeHPRGMzRC8Ob8ZxNZhPCmdPv5EAv9v2r4RWZe6E3Xa3vC6kc67nmw29OJp+rNGdt9NGeBwLFsGlBYh4poseYaWqftlqXlIQwEpMYIzlRUlTgSBe3RDKVlh9cZzQhwLnEQHD3+zvuJRDsabepoUf8Ifj4qGxej0OAJ7zxokXDLY72dVX/6m1uDjyfiGBMhuWgWkD7hXznGCxY+O/L1qZB4TMgTZU8pI95AbXQqOywbvcfVSkQXTR33VyPtHyf/Xh8KlJLOov5Ow2s57EgYOgMPs0d4wCayPqBfdOzo8zVTAatzsFSVyNtQu5/L94eYEWFLmpT6VqxRRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sglwUP8nblpnYJ+KhRKeVl6bWS6YYiEQILzT0LEq2Q=;
 b=QZlFytAXcbzzpikP8mte93vOCmOrSH+i+EFoVfdRogq8zP86kFeApGeN57dIQ+plGTCuINzAjtdwyZ57Kby/7m87Q0ufhLqUA1nctKs2nmC2FtViS3bkjYyZEtA0a1Umz6XiUCF8f+q2NJMrIoe25R1VA4sGCAvIdbsRrj6HNQY=
Received: from SG2PR04MB3029.apcprd04.prod.outlook.com (20.177.93.17) by
 SG2PR04MB3643.apcprd04.prod.outlook.com (20.178.157.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.31; Thu, 20 Feb 2020 12:13:09 +0000
Received: from SG2PR04MB3029.apcprd04.prod.outlook.com
 ([fe80::b81f:3d84:4a0c:b0ca]) by SG2PR04MB3029.apcprd04.prod.outlook.com
 ([fe80::b81f:3d84:4a0c:b0ca%3]) with mapi id 15.20.2729.033; Thu, 20 Feb 2020
 12:13:09 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: obmc-console design for multi host support
Thread-Topic: obmc-console design for multi host support
Thread-Index: AdXm91y2HzF+4aeQSEmyf5zx3Cqy5AAinyYAABfmB4A=
Date: Thu, 20 Feb 2020 12:13:08 +0000
Message-ID: <SG2PR04MB30295AD664D4B5BD5F24EFD3FD130@SG2PR04MB3029.apcprd04.prod.outlook.com>
References: <SG2PR04MB3029CF9F520DF543B57B93C2FD100@SG2PR04MB3029.apcprd04.prod.outlook.com>
 <f136d4ad-65e6-4e74-8f53-2ca3edaf9288@www.fastmail.com>
In-Reply-To: <f136d4ad-65e6-4e74-8f53-2ca3edaf9288@www.fastmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-hclclassification: null
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiNjcxNjIzNzktOWUxNS00NTQyLWIyNzQtNjA4YWZiNDhiNmI0IiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoibnVsbCJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6IkNWV2VlOGd5OUZ4dXkxclwvdGdYR0RCTVQxbTFGeHFDMTY1eUorS1huT0NcL3lCTGxPTE9sSTdcL01RNUNtektoQzAifQ==
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=thangavel.k@hcl.com; 
x-originating-ip: [192.8.255.10]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 12b74343-f9ef-4d89-bfc7-08d7b5fe4224
X-MS-TrafficTypeDiagnostic: SG2PR04MB3643:|SG2PR04MB3643:|PS2PR04MB3798:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <PS2PR04MB3798DD988869C24866C04704FD130@PS2PR04MB3798.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:5797;
x-forefront-prvs: 031996B7EF
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(136003)(366004)(396003)(376002)(346002)(189003)(199004)(76116006)(8936002)(81156014)(33656002)(86362001)(110136005)(316002)(66556008)(54906003)(64756008)(66476007)(66946007)(66446008)(71200400001)(26005)(6506007)(53546011)(52536014)(2906002)(186003)(81166006)(5660300002)(4326008)(55016002)(7696005)(9686003)(966005)(8676002)(478600001)(45080400002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SG2PR04MB3643;
 H:SG2PR04MB3029.apcprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: hcl.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 1B0v3zKIGFatb0u0RocuuCAE3wJTVbrnRCOpH4s6Rdm0HfDHWWg+bPOl4ZqW9cnUHcGGoWuiWK2XwX7A8pmUV1J4axfQGm/Vhb6QN6cMyFXVprAhkmxk/gJTuNbJ8eQ4A/85Ho0uCD6rRnuySrHoKlBg7Lu7IU8jH2obz47jTOFvK6jo0dkmPogHL9JEFnnteC3D8CCP1ZxdHSL3kuaZV5UedqK7lY2cRLIeRS8YUjKmHS1nP0dWGldvjG+U4lyE0FnPFMe7c9QQxaNrGOTyev0uEZnoyYrqOz3JOonWwd/gbOA3UnjLgYi5Kr1drHFIIl4ZDIKZMn7fnE0s493bnApaQiK18rzaVUTUVxQYAqrigWnioFzF46KNHWAdsAvr6tCsAdKHg7Tl2ttOWn5CDHBaof2NwBLiI8TXFJNjYVMpxGHKO43XqW5YEVxHLBAunJxqHGxB8OB5GJRFA8Urxz9NM6isuPyeKInvxeZmVwhmUX9WoopbfUx8xKKqWd7GGbpNi/4ZY2OqKWxUnLC5Jw==
x-ms-exchange-antispam-messagedata: AuPfiyzNtHUWoTjFIyht47OM333jRXWehXuWXubRaQYYoL+K4LsnHSfC1/l/w802DcqucducNl90X/rIby9b+pOlex2RQge68xiw3Mkjq5LgGwDpOuOxJG2oSHs6M3UDtXdxhjLrW8jw04R8AtYPtA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3643
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT012.eop-APC01.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:192.8.195.56; IPV:; CTRY:IN; EFV:NLI; SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(346002)(136003)(39860400002)(376002)(189003)(199004)(26005)(186003)(86362001)(52536014)(7696005)(356004)(54906003)(110136005)(4326008)(316002)(55016002)(966005)(5660300002)(81156014)(336012)(53546011)(6506007)(8936002)(2906002)(33656002)(81166006)(45080400002)(70206006)(8676002)(9686003)(478600001)(70586007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:PS2PR04MB3798;
 H:APC01-SG2-obe.outbound.protection.outlook.com; FPR:; SPF:Pass; LANG:en;
 PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 320247db-ec71-4e58-81f5-08d7b5fe3fb0
X-Forefront-PRVS: 031996B7EF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ReaydDch7MF4+4109HZiwNIp9rfZH/+/ZyKL6z///kkPab6bM69hlcE5kSNeYCGspq36tMUwn90NfyLH2ue1avi6d6UONIqBpYgpD0Ksy5bYIcYddelh0jv6zKgUsPu3JXXzA/7vYq82OyHuVzsetJ5p2TY+RfWewwpf0sOVD2rC1gvANYE7qU8tcCr7VPiyUt3vZeG5chqpvzC3VxYdP4fRBwUS4brkeHu16SnoJlZkcXflKABCKOeSuVqTZAGYNUVU2rMQdzLnnC1ZsuaunEVKoy3ac8rS7/QcPCYYH05c1AOaHcJ+G6QT/0sFvvkThEhab8zfaLrhgBOCIcw8E0sbxpBEYZ2xllrIrdaH44NqbmLig/faLIXM8b/Yaf7JcUrfVSXH5Rfja3R8ZZybTjIA+WwS7JpaSUdSYEGzKRfyVqxOgdl4pY1s5onXTFXfZUHxdcVhKk2AJdDJsa+hUBz3fvGqTeomSRJVrODfJKMy1o0SYHA6ZK8goUjKjulucNmjDoDIDZzM8Dmt9NEHsA==
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2020 12:13:12.6154 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12b74343-f9ef-4d89-bfc7-08d7b5fe4224
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.56];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR04MB3798
X-Mailman-Approved-At: Thu, 27 Feb 2020 13:08:42 +1100
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
Cc: "Velumani
 T-ERS,HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,

       Thanks for your response and information.

       Please find my response inline below.

Thanks,
Kumar.

-----Original Message-----
From: Andrew Jeffery <andrew@aj.id.au>
Sent: Thursday, February 20, 2020 5:38 AM
To: Kumar Thangavel <thangavel.k@hcl.com>; openbmc@lists.ozlabs.org
Cc: Jeremy Kerr <jk@ozlabs.org>; Joel Stanley <joel@jms.id.au>; Velumani T-=
ERS,HCLTech <velumanit@hcl.com>
Subject: Re: obmc-console design for multi host support

[CAUTION: This Email is from outside the Organization. Do not click links o=
r open attachments unless you trust the sender.]

Hi Kumar,

On Wed, 19 Feb 2020, at 18:24, Kumar Thangavel wrote:
>
> Hi All,
>
>
>  Obmc-console application current design may not support multi host or
> multiple console. So, we proposed the design to handle multi
> host/multiple console in obmc-console client and server applications.

Thanks for writing a proposal.

>
>  Please find the attached design document.
>
>
>  Could you please review and provide your comments on this.

Interesting timing, because I've actually just solved this problem. Please =
review this series in Gerrit:

https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgerrit.=
openbmc-project.xyz%2Fq%2Ftopic%3A%2522concurrent-servers%2522%2B(status%3A=
open%2520OR%2520status%3Amerged&amp;data=3D02%7C01%7Cthangavel.k%40hcl.com%=
7Cc3bc8632eb5b4b538a3508d7b59904ba%7C189de737c93a4f5a8b686f4ca9941912%7C0%7=
C0%7C637177541130921053&amp;sdata=3DHIYcn2Cd6tgCrAJCUwTaT5AqUkXfrB25HR0ncps=
ejdg%3D&amp;reserved=3D0)

Regarding the proposal, I have a few thoughts:

1. Please try to keep it to plain-text
2. If you have code it's best to post it straight away (rather than lead wi=
th a proposal and no code)

Kumar : Sure. Will Keep plain text for posting proposals/code.

On point 1, this is an open-source community and sending documents in forma=
ts like docx might mean that some people can't access them. Plain- text alw=
ays works, especially as emails are generally composed that way, which mean=
s you can put your proposal directly in an email and people can respond to =
it with ease.

On point 2, it seems that you've included screenshots of code changes that =
you have made locally - a few sub-points there:

a. Code is text - you can include snippets of it in your document directly,=
 which removes the need for rich media formats, which removes the need for =
something like docx.

b. If you've got code, push it to github or gerrit and we can look at it di=
rectly!

Kumar : Sure, Will keep code snippets in the plain text or will push it to =
github or gerrit.

On point b, given that this proposal largely deals with implementation deta=
ils, it's much more effective if you lead with code and then drive a discus=
sion on the list if necessary. At least this way we have something concrete=
 to point at and argue about, or in the happy case we can just merge it and=
 you've avoided the effort of driving redundant discussion.

Finally, these thoughts are about helping you help us help you to get your =
code merged with the least amount of effort/friction. Hopefully they are us=
eful to you :)

Kumar : I looked at your patches and this is really good information and ve=
ry helpful. Will look more in detail and get back to you.

Cheers,

Andrew
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
