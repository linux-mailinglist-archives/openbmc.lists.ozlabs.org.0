Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D1630F452
	for <lists+openbmc@lfdr.de>; Thu,  4 Feb 2021 14:57:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWg8V6qGFzDwxd
	for <lists+openbmc@lfdr.de>; Fri,  5 Feb 2021 00:56:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e31;
 helo=mail-vs1-xe31.google.com; envelope-from=deepak.kodihalli.83@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WOTa98KB; dkim-atps=neutral
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWg762x1gzDqlX
 for <openbmc@lists.ozlabs.org>; Fri,  5 Feb 2021 00:55:44 +1100 (AEDT)
Received: by mail-vs1-xe31.google.com with SMTP id k9so1787817vsr.3
 for <openbmc@lists.ozlabs.org>; Thu, 04 Feb 2021 05:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0QLP1wiMU17RxSdRjih1w4VqfUo/WtP/ppEomTyP1Z8=;
 b=WOTa98KBXO1XhF1ECvu9OIAN7/CyVGLu8yxwNt6JW8n9gf72T7Q5iDE8Kk9ejkEGSA
 pwjiB8b+n8nfCZIIoGRCgeIWQb7UwtiFdDI8ABu/C1+LkWHG18CM+W2QRWqGArH0fUKt
 WsR3J2wNyzV6rBR064X/l/Tr2CZ1KxiMEOZdKZIaGa0ptjbKbLFKmdsRM8YxngPTcLzF
 s91oXu1+5KBiYJMqauy++OWDniJBls83itqeHPBBQSQpxuIwh46sELmJ+fO+MugMPSuf
 uIAcC627ILM3rRdt1fC4lx8x/E1waSWUf/fj7aMCFYBASbZfDtN5OxA9VzvLCln0d46A
 3GkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0QLP1wiMU17RxSdRjih1w4VqfUo/WtP/ppEomTyP1Z8=;
 b=fQBJW8pIbkqHF+uvgubIqa5DPNkgorbBrikJvajr0BdA7n9tW9T0161gW8Q17pVH5e
 oWjnIkazrat1GaxlzTwkCvfO0z/99nkwi05ZgKMM5d868lc6cWSWkSybVZn5LMkDCMbj
 XaO4DUUtUtuVHrSi1cSxBPZqlSLXgEVsu2LRSpNAKeuSxE6tY02UfNXZQC0xB8iXIbS3
 PvjEKoMygrH+oqBp9PSVsfyKOvZ1EZxEAVIQbhMnFH/mugtjuAFuY9GWBxxme0AXYiGY
 7wSu5LDU87PYE/gJ9jAqUcRc31gPiJI0GcMU95C2KkmAz45DhSXNT2cbUdpBTF5f/u/S
 zymQ==
X-Gm-Message-State: AOAM533IIEJ+kyPD3UtlGK8KquXETPUP906IjgiTKnOkwlATNKKmfLB3
 GBlBulsZUOtKe0oSz0a0THAkCUlJN7A7pgrlPCU=
X-Google-Smtp-Source: ABdhPJwGhdCpuxjGTQH4c7CQoFp3nNTb96RvZWUhcWLjaWtMwtZ7QbGCOYpJinGfQKQfchgwJMgasYSiZENbbIqNgKg=
X-Received: by 2002:a67:d896:: with SMTP id f22mr5182453vsj.43.1612446940193; 
 Thu, 04 Feb 2021 05:55:40 -0800 (PST)
MIME-Version: 1.0
References: <HK0PR04MB2964D0B4027D7B3AE80A3E9EFDCC0@HK0PR04MB2964.apcprd04.prod.outlook.com>
 <CAM=TmwX79oj-KZ2mj1ENGcGnq37TCo-KijWENU3_3mWC2AtdAw@mail.gmail.com>
 <HK0PR04MB296465225FD6E6F7BFDD138AFDCB0@HK0PR04MB2964.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB296465225FD6E6F7BFDD138AFDCB0@HK0PR04MB2964.apcprd04.prod.outlook.com>
From: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Date: Thu, 4 Feb 2021 19:25:29 +0530
Message-ID: <CAM=TmwV46bD8PcZgbqPOK45ROJDFBhQYCEg7bHDWCZ0f6sOOYw@mail.gmail.com>
Subject: Re: Add firmware implementation in pldm
To: Kumar Thangavel <thangavel.k@hcl.com>, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "richard.marian.thomaiyar@linux.intel.com"
 <richard.marian.thomaiyar@linux.intel.com>,
 "sumanth.bhat@intel.com" <sumanth.bhat@intel.com>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>, Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

I've pushed a design proposal for PLDM firmware update:
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/40289.

Thanks,
Deepak

On Thu, Dec 10, 2020 at 5:47 PM Kumar Thangavel <thangavel.k@hcl.com> wrote=
:
>
> Classification: Internal
>
> Hi Deepak,
>
>            Thanks for your response.  Please find below my response inlin=
e.
>
> Thanks,
> Kumar.
>
> -----Original Message-----
> From: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
> Sent: Wednesday, December 9, 2020 9:47 PM
> To: Kumar Thangavel <thangavel.k@hcl.com>; richard.marian.thomaiyar@linux=
.intel.com; sumanth.bhat@intel.com
> Cc: openbmc@lists.ozlabs.org; Velumani T-ERS,HCLTech <velumanit@hcl.com>;=
 sdasari@fb.com; Patrick Williams <patrickw3@fb.com>; tomjose@linux.vnet.ib=
m.com
> Subject: Re: Add firmware implementation in pldm
>
> [CAUTION: This Email is from outside the Organization. Unless you trust t=
he sender, Don=E2=80=99t click links or open attachments as it may be a Phi=
shing email, which can steal your Information and compromise your Computer.=
]
>
> Hi Kumar,
>
>
> On Wed, Dec 9, 2020 at 9:20 PM Kumar Thangavel <thangavel.k@hcl.com> wrot=
e:
> >
> > Classification: Internal
> >
> > Hi All,
> >
> >
> >
> >          We planning to do NIC firmware update for our system pldm base=
.
>
> Great!
>
> >
> >          So, We would like to add implementation support for pldm base =
firmware update. This should be generic for all to use firmware update for =
any devices.
> >          Do we need to create files =E2=80=9Cfirmwareupdate.cpp/.hpp fi=
les=E2=80=9D under pldm deamon as generic to handle firmware base pldm comm=
ands?
>
> Since there is a PLDM firmware update specification, a generic design and=
 implementation is a definite possibility.
>
> >          Also, please suggest to repo add the BMC applications to send =
and recv the command handling.
> >
> >          Could Please provide your comments/suggestions on this impleme=
ntation.
>
> Will you be able to update
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2Fopenbmc%2Fdocs%2Fblob%2Fmaster%2Fdesigns%2Fpldm-stack.md&amp;data=
=3D04%7C01%7Cthangavel.k%40hcl.com%7C8b7f49e176b941c2de4008d89c5de97f%7C189=
de737c93a4f5a8b686f4ca9941912%7C0%7C0%7C637431274447773327%7CUnknown%7CTWFp=
bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%=
7C1000&amp;sdata=3DXPh1Atf8nMzEFjL1lhqT4KnCdVSDabYtpak3909vZ8w%3D&amp;reser=
ved=3D0 with a design section on firmware update? Some of the things I woul=
d like to review via this doc update:
>
>    Kumar : Sure. I will update the document.
>
> - How does this integrate with the current OpenBMC firmware update archit=
ecture, and also with Redfish update service?
>
>     Kumar :     Need to explore. Please provide your suggestions on this.
>
> - What will PLDM run on? RBT or MCTP? MCTP over what binding?
>
>     Kumar : PLDM run on NIC-SI transport.
>
> - Do you anticipate changes to libmctp?
>
>    Kumar : No. This is based on NIC-SI transport
>
> - How does this fit into the existing https://apc01.safelinks.protection.=
outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fopenbmc%2Fpldm&amp;data=3D04%=
7C01%7Cthangavel.k%40hcl.com%7C8b7f49e176b941c2de4008d89c5de97f%7C189de737c=
93a4f5a8b686f4ca9941912%7C0%7C0%7C637431274447773327%7CUnknown%7CTWFpbGZsb3=
d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000=
&amp;sdata=3DdM8fJwGr5lz9DWZYCXmquHfHpBQGEviOpJBCP4OdxSo%3D&amp;reserved=3D=
0
> design? What new components will you be adding? Will libpldm and pldmd be=
 impacted, and how?
>
>    Kumar: pldmd will be impacted to handle firmware update commands reque=
st/response. Will investigate in detail and update you on this.
>
> - The 5.9 Linux Kernel has some APIs for PLDM based firmware update.
> Can we use those?
>
>   Kumar : Yes. We can use that also.
>
> - How do we plan to test this? Is hardware a must? Or are you planning on=
 mocking a PLDM responder?
>
>  Kumar : We have hardware. So planning to test in the hardware.
>
> I think a quick review of such a design doc will be beneficial before del=
ving into code. Also, please note - Richard and Sumanth (copied
> them) are working on similar stuff as well. So there could be scope for c=
ollaboration and to avoid likely duplicate effort. We do talk about ongoing=
 PLDM activities in OpenBMC in this meet - https://apc01.safelinks.protecti=
on.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fopenbmc%2Fopenbmc%2Fwiki%2=
FOpenBMC-PMCI-WG&amp;data=3D04%7C01%7Cthangavel.k%40hcl.com%7C8b7f49e176b94=
1c2de4008d89c5de97f%7C189de737c93a4f5a8b686f4ca9941912%7C0%7C0%7C6374312744=
47773327%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTi=
I6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DrDTsCy7Jza%2F6g8jl7a2CzKwzvoT0X=
HHnD9Gdb1197AY%3D&amp;reserved=3D0.
>
> Kumar :  Sure.  Will join the discussion.
>
> Thanks,
> Deepak
>
> >
> > Thanks,
> >
> > Kumar.
> >
> > ::DISCLAIMER::
> > ________________________________
> > The contents of this e-mail and any attachment(s) are confidential and =
intended for the named recipient(s) only. E-mail transmission is not guaran=
teed to be secure or error-free as information could be intercepted, corrup=
ted, lost, destroyed, arrive late or incomplete, or may contain viruses in =
transmission. The e mail and its contents (with or without referred errors)=
 shall therefore not attach any liability on the originator or HCL or its a=
ffiliates. Views or opinions, if any, presented in this email are solely th=
ose of the author and may not necessarily reflect the views or opinions of =
HCL or its affiliates. Any form of reproduction, dissemination, copying, di=
sclosure, modification, distribution and / or publication of this message w=
ithout the prior written consent of authorized representative of HCL is str=
ictly prohibited. If you have received this email in error please delete it=
 and notify the sender immediately. Before opening any email and/or attachm=
ents, please check them for viruses and other defects.
> > ________________________________
