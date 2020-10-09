Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E40288D4F
	for <lists+openbmc@lfdr.de>; Fri,  9 Oct 2020 17:50:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C7CGQ1KB2zDqcj
	for <lists+openbmc@lfdr.de>; Sat, 10 Oct 2020 02:50:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.132.107; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=priyatharshanp@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=EWvzG7XF; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=EWvzG7XF; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320107.outbound.protection.outlook.com [40.107.132.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C7CFY605TzDqbk
 for <openbmc@lists.ozlabs.org>; Sat, 10 Oct 2020 02:50:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCx/B2B1+fjnpAK4jGCX/dJSLrR99Sa8nbNinW2uUoc=;
 b=EWvzG7XFeydGNWs7lEwEuZialPx8mnCumGGBtPdbvXol/8OGHZ74hlhhQ8rsjkPT2YswfJJGGDPvVlYbLjQUN3fNP6zMN3ElfSb7h574Dr2Z3PhqihtkNdcD2/+90pahrF+PORuCFEGTQX4kpSnwJZ/DoGRrQ+aqGDjta0uf0cM=
Received: from SG2PR03CA0132.apcprd03.prod.outlook.com (2603:1096:4:91::36) by
 KL1PR0401MB2135.apcprd04.prod.outlook.com (2603:1096:802:5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Fri, 9 Oct
 2020 15:49:58 +0000
Received: from SG2APC01FT008.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:91:cafe::68) by SG2PR03CA0132.outlook.office365.com
 (2603:1096:4:91::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.11 via Frontend
 Transport; Fri, 9 Oct 2020 15:49:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.54)
 smtp.mailfrom=hcl.com; stwcx.xyz; dkim=pass (signature was verified)
 header.d=HCL.COM;stwcx.xyz; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.54 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.54; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.245.54) by
 SG2APC01FT008.mail.protection.outlook.com (10.152.250.99) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Fri, 9 Oct 2020 15:49:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=neD8H/4xVMGMU/83ELfVIjElfh/Ge7Hetq1KGf/bx4GADgNK0kFAa5ITrt1JlGZjskX2RLNm842fKTQq75yirM7UyiS5xkBmnn9Dmw9Zf1K+f4NvUclBqkTVRcdHpWNdHXA4AR6rFtuk73SkzIjRejT2YGpvrNwu27QbWuueUd+T8Zk+lhB5h2w8juJesdxbj8zG+V6/uaxf8HovL/GhzlBiJb8h3B7KtpCrLJkW67DubIDz5cY8DfP18EQstTN/Rq8Z2z14QSAtk/34HSXJ2Z6jI3n6mq1CugckFjCe/KMsr9Ef2yeLnFFjZSwOmD2UBtLuMirUk8tK970nfKygpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCx/B2B1+fjnpAK4jGCX/dJSLrR99Sa8nbNinW2uUoc=;
 b=OzUyz7hCSvEuzWAhKKywouveP6OpItc57V6JK5SLp7ZZCj22KGDnMZT/RRZIupzAxndN4n6+9hM1RJCEFpdGaIq9E4QrYuTVyat5Da12jFreoOvsBIx2B/EJWvVXzGPCZbaVkebyv1iwWYss18du4BJDkt7MZxO43TynKBrCr+jrbyWc4odKymZaMkS/a+CJKYVTr8telLnGwu79erxGlSGAX+lhda2R7vYiRn/+jAdseyB5gfckQcdc1Nm4+B6gtuuA32RLwM2kJdqn8VpfqY/kCCM7Qpuml9UCcYOqGkKf34UsWcjrbnzmah363/2OeGuecCvNoLKE1Pcm2qpJew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCx/B2B1+fjnpAK4jGCX/dJSLrR99Sa8nbNinW2uUoc=;
 b=EWvzG7XFeydGNWs7lEwEuZialPx8mnCumGGBtPdbvXol/8OGHZ74hlhhQ8rsjkPT2YswfJJGGDPvVlYbLjQUN3fNP6zMN3ElfSb7h574Dr2Z3PhqihtkNdcD2/+90pahrF+PORuCFEGTQX4kpSnwJZ/DoGRrQ+aqGDjta0uf0cM=
Received: from TY2PR04MB3311.apcprd04.prod.outlook.com (2603:1096:404:94::9)
 by TY2PR04MB3279.apcprd04.prod.outlook.com (2603:1096:404:a3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Fri, 9 Oct
 2020 15:49:55 +0000
Received: from TY2PR04MB3311.apcprd04.prod.outlook.com
 ([fe80::70ff:f1c8:a5fd:6ef2]) by TY2PR04MB3311.apcprd04.prod.outlook.com
 ([fe80::70ff:f1c8:a5fd:6ef2%6]) with mapi id 15.20.3455.026; Fri, 9 Oct 2020
 15:49:55 +0000
From: "P. Priyatharshan" <PriyatharshanP@hcl.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: 12v slot AC Support  in x86-power-control
Thread-Topic: 12v slot AC Support  in x86-power-control
Thread-Index: AQHWnlOfLYSMc6eE10W52XkXQ1Jh/w==
Date: Fri, 9 Oct 2020 15:49:55 +0000
Message-ID: <TY2PR04MB3311209CF7859852B33802E8CA080@TY2PR04MB3311.apcprd04.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [2409:4072:6d03:6a74:48e7:52f7:5dc9:ad8c]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ba72b8e2-51a5-4808-1825-08d86c6af964
x-ms-traffictypediagnostic: TY2PR04MB3279:|KL1PR0401MB2135:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <KL1PR0401MB21353002C785B4DF5A1E708ACA080@KL1PR0401MB2135.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: ojkt/XLtWgEX7aiYcD7mqwlHvQP1byGun9JrcO0qw/rlC1KXqcCe98e664FH4EAKV/YEWXet7taSmDWxBh+hhemBYeieu6GshpTUWDqbRmZNRd4vQ7D6Ipyvg6B+4/Pj4DuOKCgR7MFmBaIS7a4iNJ17+k9XW9+54+PStRGQuphX8xQHE3vxmfGxjtHt3U1tN8x6xXaQlocmnXjGReyali7bxfQekMQY9FTtvfxyhVhC84c/Qfo44fZlP7gx8C0C5PMpW9ym3kssptXJJHDENMwVCYGOOwnk9dyLMMU0B9UIHWAd5YuvL3LajH5JxVZTEAtlk7/cC/bwqVqADBsR9yd5zfFiG1nODJ4nzWsKlMLjS3XjkbHyU22ASJasWFThLall5NEVMXtrammzYsfQiQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:TY2PR04MB3311.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(366004)(346002)(136003)(39860400002)(66946007)(86362001)(83730400001)(66446008)(166002)(66556008)(64756008)(55016002)(966005)(54906003)(33656002)(83080400001)(52536014)(186003)(316002)(6506007)(53546011)(7696005)(76116006)(8936002)(83380400001)(5660300002)(9686003)(91956017)(2906002)(8676002)(4326008)(19627405001)(478600001)(66476007)(71200400001)(21615005)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: k9wAM8dMpMk8r1kxBNHV5dkjhRJru8AVzmZpo2Na0NXlCTC4E7uHgpiENPKJv8EB/OxLSqSfiV/6YBrag1Gdna8CFDbZEc7P045YkYChhbDsYZv7UftBDwHjkyB10qzxSU9eLuX8ENZO5AQi39sXDh2VHnwoFfG5LOfLL9ZE+PjJIltUTLHc+Z6+/0iq7BejX3Cu3namWBL972lKznb2EbRMQwY/SU48AMsR2eYZO3Uxe1uwnF3YFTZoUZtbpXUn7nUkfL0OINE16h60TjX1esw3RnHp+Mi2N1//Bl2EbhxJCdeXadc6lxU3Wl7p00QEQaf3pFtdmShGhFpNLnnQRFDA1J/YE4qD56UjJlYGXKLxOlEoRm5yDwGH+pcS4fXZIz/9MaWJnDLzlQRjmkM088/Fx1/mXaAhGbIfyhg/WGtT3bdMMqRJm6afl3YijrFmYkUdIVott88uEosWHxZphpVoQFgpTkjsrXgzTXs7nbsQ5ROYDaSH5JheZvibRbW3XNAQ8d2TbC5/szQ6l+vThyoU0V5XBZ9vCdUPE9eDrF3Er0gEMUx4RjRsw8xgof+LbhL71ACkaHJhwPl5bllyap3ZKSf7LNPAwWcfqw0Y6LoJakC4oVp4aWk5GmspdxAZSq75SPbeKsQkRDaMVdYFbky+8+ySgOpbZdl4elZkvoeAfdC/M1plh2MNzhIEd2FoblS0Fiz7RUQM0OVPQWrRpQ==
Content-Type: multipart/alternative;
 boundary="_000_TY2PR04MB3311209CF7859852B33802E8CA080TY2PR04MB3311apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB3279
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT008.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3dc59bf7-7e1e-4846-8f8b-08d86c6af819
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5oTmv8bmXnnh8yvWmF/xqxiOqG5MsTYp3ZYA0WU0tdO098idGZmhrvwnguk0hdEm9pYcBoQ1JK4h+JM0Db5Q7kYxBcVwUb2Kbhe3lydI/ZxNWAed3e1dh2tJ2vCpsy+Ap5/SZxfXCFBLg/ygbh/KDjSGu/nilmTmq2rBF3fb6fCHObnBNUj2LV5ex/nt31aUErZRpLtqpHlcdZjuKf1MMByFupfGdV+mebZLQ/++VZuLq7RVsDlnBMBkGJyX01Q8k5Wr9v35YOC5v1BHSb/r305n3EFFBkyT5yfN5pJGLg7uQY1ykh0YI67w11AXpuFsTTr4rw6kfGbS8/vyWhec0lg5r7DrjOCTvdqx9XrVlHpdtwnIeC1tue503vrWGfG2rlVhNy4w6fvLflm3yOZ+NraHw7J26EmAhdKs2lBn9PCxIOuWQ1WKNDaCcIFJ6qRhvy1vFac1V/EX0diEMbAvJx0mID7OtMIg9gzF878wwlCTTvz3o8kh6VUI+mMjz5oU
X-Forefront-Antispam-Report: CIP:192.8.245.54; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-SG2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(346002)(39860400002)(46966005)(55016002)(54906003)(70586007)(26005)(4326008)(30864003)(70206006)(966005)(316002)(7696005)(81166007)(82740400003)(53546011)(186003)(86362001)(9686003)(2906002)(36906005)(356005)(83080400001)(21615005)(33656002)(83730400001)(52536014)(5660300002)(83380400001)(166002)(34020700004)(82310400003)(8676002)(19627405001)(478600001)(336012)(6506007)(47076004)(6916009)(8936002);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2020 15:49:57.4377 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba72b8e2-51a5-4808-1825-08d86c6af964
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.54];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT008.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB2135
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
 "ed@tanous.net" <ed@tanous.net>, "Velumani
 T-ERS,HCLTech" <velumanit@hcl.com>, Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_TY2PR04MB3311209CF7859852B33802E8CA080TY2PR04MB3311apcp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Patrick,

Please find my response below.

>Priyatharshan,

>I'm still very confused by the word "AC" here.  I know your server
>doesn't have a single joule of AC power on any voltage rail.  This
>server plugs into an OCP rack with a 12V DC bus-bar powering all the
>servers in the rack.

Sorry for confusing with the word "Ac" . It is actually 12V On/Off.

>Vijay implemented, for Tiogapass, the 12V system power cycle.  This,
>in hardware, uses the HSC* to remove the server from the bus-bar, which
>power cycles the entire server including the BMC.  This is as if someone
>physically pulled the server from the rack and then pushed it back in
>but implemented via the HSC.

Agree, Vijay Implementation power cycles the entire server including the BM=
C.In Yv2(multi-host-system) for each slot 12V_STBY is connected via hot swa=
p ADM1172.This ADM1172 power will be controlled by dedicated GPIO.So my fun=
ctionality will implement power cycles only to the slot.This is as if someo=
ne physically pulled host from the slot and then pushed it back.

>On the server you are working on, we should have that same design for
>the "full system power cycle" which interacts with the HSC.  This should
>be done the same way as what Vijay implemented.

Agree.I also used Vijay's implementation and implemented "full system power=
 cycle" for Yv2.
Gerrit Link : https://gerrit.openbmc-project.xyz/c/openbmc/meta-facebook/+/=
37065


>You also have power control to the multi-host cards which feed 12V to
>each of the compute cards in your chassis.  What I don't understand is
>why does this also need control of the full 12V and why is it separate
>from the normal "power on the compute card" sequence?  This "power on
>the compute card" sequence is what is suppose to be modelled by the
>'chassisN' objects referenced by others.

>Can you expand on what the difference is and what functionality you are
>enabling by having two different slot-level power controls?

The earlier "power on/off/cycle the computer card" sequence will only handl=
e the computer card portion of the host.
But the new feature [Slot on/off/cycle] will power cycles the entire card [=
 BIC + computer card portion + rest of the hardware in twin lake] for each =
slot.

Thanks,
Priyatharshan P

________________________________
From: Patrick Williams
Sent: Thursday, October 08, 2020 22:01
To: P. Priyatharshan
Cc: Vijay Khemka; openbmc@lists.ozlabs.org; ed@tanous.net; Velumani T-ERS,H=
CLTech
Subject: Re: 12v slot AC Support in x86-power-control

On Thu, Oct 08, 2020 at 01:13:49PM +0000, P. Priyatharshan wrote:
> Out platform is multi host system and we  have the host as FRU and it can=
 be plugged in to a slot. The slot has an option to control slot power and =
this can be used for a AC cycle.

Priyatharshan,

I'm still very confused by the word "AC" here.  I know your server
doesn't have a single joule of AC power on any voltage rail.  This
server plugs into an OCP rack with a 12V DC bus-bar powering all the
servers in the rack.

Vijay implemented, for Tiogapass, the 12V system power cycle.  This,
in hardware, uses the HSC* to remove the server from the bus-bar, which
power cycles the entire server including the BMC.  This is as if someone
physically pulled the server from the rack and then pushed it back in
but implemented via the HSC.

On the server you are working on, we should have that same design for
the "full system power cycle" which interacts with the HSC.  This should
be done the same way as what Vijay implemented.

You also have power control to the multi-host cards which feed 12V to
each of the compute cards in your chassis.  What I don't understand is
why does this also need control of the full 12V and why is it separate
from the normal "power on the compute card" sequence?  This "power on
the compute card" sequence is what is suppose to be modelled by the
'chassisN' objects referenced by others.

Can you expand on what the difference is and what functionality you are
enabling by having two different slot-level power controls?

> We proposed  a design to add the slot power control in the x86-power-cont=
rol.The earlier discussion can be found in the below link.
>
> https://lists.ozlabs.org/pipermail/openbmc/2020-August/022481.html

* - HSC =3D Hot Swap Controller.

--
Patrick Williams
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

--_000_TY2PR04MB3311209CF7859852B33802E8CA080TY2PR04MB3311apcp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Patrick,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Please find my response below.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&gt;Priyatharshan,
<div><br>
</div>
<div>&gt;I'm still very confused by the word &quot;AC&quot; here. &nbsp;I k=
now your server</div>
<div>&gt;doesn't have a single joule of AC power on any voltage rail. &nbsp=
;This</div>
<div>&gt;server plugs into an OCP rack with a 12V DC bus-bar powering all t=
he</div>
<div>&gt;servers in the rack.</div>
<div><br>
</div>
<div>Sorry for confusing with the word &quot;Ac&quot; . It is actually 12V =
On/Off.</div>
<div><br>
</div>
<div>&gt;Vijay implemented, for Tiogapass, the 12V system power cycle. &nbs=
p;This,</div>
<div>&gt;in hardware, uses the HSC* to remove the server from the bus-bar, =
which</div>
<div>&gt;power cycles the entire server including the BMC. &nbsp;This is as=
 if someone</div>
<div>&gt;physically pulled the server from the rack and then pushed it back=
 in</div>
<div>&gt;but implemented via the HSC.</div>
<div><br>
</div>
<div>Agree, Vijay Implementation power cycles the entire server including t=
he BMC.In Yv2(multi-host-system) for each slot 12V_STBY is connected via ho=
t swap ADM1172.This ADM1172 power will be controlled by dedicated GPIO.So m=
y functionality will implement power
 cycles only to the slot.This is as if someone physically pulled host from =
the slot and then pushed it back.</div>
<div><br>
</div>
<div>&gt;On the server you are working on, we should have that same design =
for</div>
<div>&gt;the &quot;full system power cycle&quot; which interacts with the H=
SC. &nbsp;This should</div>
<div>&gt;be done the same way as what Vijay implemented.</div>
<div><br>
</div>
<div>Agree.I also used Vijay's implementation and implemented &quot;full sy=
stem power cycle&quot; for Yv2.</div>
<div>Gerrit Link : <a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/=
meta-facebook/+/37065" id=3D"LPlnk986657">
https://gerrit.openbmc-project.xyz/c/openbmc/meta-facebook/+/37065</a><br>
</div>
<div><br>
</div>
<div><br>
</div>
<div>&gt;You also have power control to the multi-host cards which feed 12V=
 to</div>
<div>&gt;each of the compute cards in your chassis. &nbsp;What I don't unde=
rstand is</div>
<div>&gt;why does this also need control of the full 12V and why is it sepa=
rate</div>
<div>&gt;from the normal &quot;power on the compute card&quot; sequence? &n=
bsp;This &quot;power on</div>
<div>&gt;the compute card&quot; sequence is what is suppose to be modelled =
by the</div>
<div>&gt;'chassisN' objects referenced by others.</div>
<div><br>
</div>
<div>&gt;Can you expand on what the difference is and what functionality yo=
u are</div>
<div>&gt;enabling by having two different slot-level power controls?</div>
<div><br>
</div>
<div>The earlier &quot;power on/off/cycle the computer card&quot; sequence =
will only handle the computer card portion of the host.</div>
But the new feature [Slot on/off/cycle] will power cycles the entire card [=
 BIC + computer card portion + rest of the hardware in twin lake] for each =
slot.<br>
</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Thanks,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Priyatharshan P</div>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0);">
<br>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%;">
<b>From:</b> Patrick Williams<br>
<b>Sent:</b> Thursday, October 08, 2020 22:01<br>
<b>To:</b> P. Priyatharshan<br>
<b>Cc:</b> Vijay Khemka; openbmc@lists.ozlabs.org; ed@tanous.net; Velumani =
T-ERS,HCLTech<br>
<b>Subject:</b> Re: 12v slot AC Support in x86-power-control
<div><br>
</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Thu, Oct 08, 2020 at 01:13:49PM +0000, P. Priya=
tharshan wrote:<br>
&gt; Out platform is multi host system and we&nbsp; have the host as FRU an=
d it can be plugged in to a slot. The slot has an option to control slot po=
wer and this can be used for a AC cycle.<br>
<br>
Priyatharshan,<br>
<br>
I'm still very confused by the word &quot;AC&quot; here.&nbsp; I know your =
server<br>
doesn't have a single joule of AC power on any voltage rail.&nbsp; This<br>
server plugs into an OCP rack with a 12V DC bus-bar powering all the<br>
servers in the rack.<br>
<br>
Vijay implemented, for Tiogapass, the 12V system power cycle.&nbsp; This,<b=
r>
in hardware, uses the HSC* to remove the server from the bus-bar, which<br>
power cycles the entire server including the BMC.&nbsp; This is as if someo=
ne<br>
physically pulled the server from the rack and then pushed it back in<br>
but implemented via the HSC.<br>
<br>
On the server you are working on, we should have that same design for<br>
the &quot;full system power cycle&quot; which interacts with the HSC.&nbsp;=
 This should<br>
be done the same way as what Vijay implemented.<br>
<br>
You also have power control to the multi-host cards which feed 12V to<br>
each of the compute cards in your chassis.&nbsp; What I don't understand is=
<br>
why does this also need control of the full 12V and why is it separate<br>
from the normal &quot;power on the compute card&quot; sequence?&nbsp; This =
&quot;power on<br>
the compute card&quot; sequence is what is suppose to be modelled by the<br=
>
'chassisN' objects referenced by others.<br>
<br>
Can you expand on what the difference is and what functionality you are<br>
enabling by having two different slot-level power controls?<br>
<br>
&gt; We proposed&nbsp; a design to add the slot power control in the x86-po=
wer-control.The earlier discussion can be found in the below link.<br>
&gt; <br>
&gt; <a href=3D"https://lists.ozlabs.org/pipermail/openbmc/2020-August/0224=
81.html" target=3D"_blank" rel=3D"noopener noreferrer" data-auth=3D"NotAppl=
icable">
https://lists.ozlabs.org/pipermail/openbmc/2020-August/022481.html</a><br>
<br>
* - HSC =3D Hot Swap Controller.<br>
<br>
-- <br>
Patrick Williams<br>
</div>
</span></font></div>
</div>
</div>
</div>
</div>
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

--_000_TY2PR04MB3311209CF7859852B33802E8CA080TY2PR04MB3311apcp_--
