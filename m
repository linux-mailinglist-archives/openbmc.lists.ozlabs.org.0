Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B08AD31E0FC
	for <lists+openbmc@lfdr.de>; Wed, 17 Feb 2021 22:04:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dgr1q5gSMz3cWs
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 08:04:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=WIeVX9BV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=WIeVX9BV; dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dgr1c6RYlz30Lj
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 08:04:20 +1100 (AEDT)
Received: by mail-yb1-xb36.google.com with SMTP id p193so42467yba.4
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2021 13:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PSYaaR6rEue4Qky4K6hYyQ3ZjlrpvSp0qMROYYGLS+g=;
 b=WIeVX9BV/wfK/OIitcWf5HyfqwbmcmSpkJk/AP5jRT2SboRDh6p7LBKRGYzqJFaSKD
 wSYBGDuP5sl0FgMJIrN5UWotP1x0Ii1qsii/ymwNMvEbvn52YdU35KQRsZ5Ii5o++Uj8
 9VAN7Np8yjkpKhsylEzc95fQrK5grKFi9oyivuy4qEFWCFi58M2hlrhWrHyBYyILKgu/
 O74FAYNMY9C2SIE1ku+SIy0zl3KuhqZoZoRftpyVs5GEQxQ7U7VIAMkCEp56U+g0GsAG
 rLSje/6LhH3sCsP+CVCQ6fANvHkO0jkGZl8xGiKqisOhvFA0EmorJ9/OWbTW//BYhvwT
 ahWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PSYaaR6rEue4Qky4K6hYyQ3ZjlrpvSp0qMROYYGLS+g=;
 b=rKiOxNYFvjQOsb6M6DmLjgMrpB9J41rJhcYJFPUgo3Y8nBO4Uc/EHWJY8VEfm3Opd0
 UvrDZisPaRHv3SlDo1dQ/g7arOXW7fsEGKL/Z2a47V8w8CBP2HaWtPaI77wWY66n2ID5
 NmmEy9cbKv3Rxi5YuAUci7C9vvSHPzYMDzIO954T8Zo5ji9q897svFBOVhZZVDN5uanD
 UJlqC0a1Gr7mkMxP9NfyBQrsVC6zubaLbXSkre3fai1DTVRlBzQ8Ow5liZMW0V7Vm3p1
 AwJ8fry1sDGnWi3nhmwHzlFEmENfmo/bV6yiVsMMCpXLPD1xuMAcxW2jzmb9Y/qIT4w1
 9nxg==
X-Gm-Message-State: AOAM5332c3K7lGBc67RM9IeX5ELCqyhpP6Zz/uog1hogV+URsqgyWvM0
 00qF8RYTeOHImz4hIg01ZzJKB6O72KFKoSZjNfXe5w==
X-Google-Smtp-Source: ABdhPJxQmIA1RZKG1dxdK9BjGqY6M4OU7nsq0hDvcw7TeY0YRISs0fb/+Me2kEgiWUsKET+KxjEtx9RvkxdzsE228Ac=
X-Received: by 2002:a25:c407:: with SMTP id u7mr1905452ybf.449.1613595856234; 
 Wed, 17 Feb 2021 13:04:16 -0800 (PST)
MIME-Version: 1.0
References: <SG2PR02MB2796B5FB2DB9AAAE2594BA1E858B9@SG2PR02MB2796.apcprd02.prod.outlook.com>
 <SG2PR02MB27961D3A938C94341747757C858A9@SG2PR02MB2796.apcprd02.prod.outlook.com>
 <CACWQX807_KpeTHnMqPMt8E+h_ggMpKy0_Jr82HPV+oRushXdXw@mail.gmail.com>
 <SG2PR02MB2796736A2D3DCEB0AC9AEC9985869@SG2PR02MB2796.apcprd02.prod.outlook.com>
 <CACWQX80r9dYEGbwftH32Sc6fRmDLHeYg24tdO+8hME9V_bDDCg@mail.gmail.com>
 <SG2PR02MB2796D7A6B15C18F348369F0A85869@SG2PR02MB2796.apcprd02.prod.outlook.com>
In-Reply-To: <SG2PR02MB2796D7A6B15C18F348369F0A85869@SG2PR02MB2796.apcprd02.prod.outlook.com>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 17 Feb 2021 13:04:05 -0800
Message-ID: <CACWQX81Wg-+tcj+QbUCN8K=Ox7EeCmPL_b2VSYr3ziM-d2va4g@mail.gmail.com>
Subject: Re: Redfish v1/Systems/system/EthernetInterfaces
To: "Udupa.Ashwini ISV" <udupa.ashwini@inventec.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Feb 17, 2021 at 12:52 PM Udupa.Ashwini ISV
<udupa.ashwini@inventec.com> wrote:
>
> Thanks Ed.
> So, only those implemented in "bmcweb/redfish-core/lib/"  are currently i=
mplemented in OpenBMC Redfish right?
> I don=E2=80=99t see below implemented too:
> Systems/system/BootOptions
>
> But, are these implemented?
> 1. Systems/system/NetworkInterfaces
> 2. Systems/system/PCIeFunctions
> If so, what changes are needed to make these working?
>
> Regards,
> Ashwini

You're still top posting.  Please reply to the mail inline with these
questions, and I'll answer them.

>
> -----Original Message-----
> From: Ed Tanous <ed@tanous.net>
> Sent: Wednesday, February 17, 2021 12:24 PM
> To: Udupa.Ashwini ISV <udupa.ashwini@inventec.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: Redfish v1/Systems/system/EthernetInterfaces
>
> On Wed, Feb 17, 2021 at 12:13 PM Udupa.Ashwini ISV <udupa.ashwini@invente=
c.com> wrote:
> >
> > Hi Ed,
> >
> >
> >
> > Its Inventec platform.
> >
> > https://github.com/openbmc/openbmc/tree/master/meta-inventec
> >
> > I just wanted to know how to implement /redfish/v1/Systems/system/Ether=
netInterfaces.
>
> Excellent, that helps.  I originally misread, and thought the interface w=
as missing on the platform, not that you were trying to add it to redfish.
>
> >
> >
> >
> > Regards,
> >
> > Ashwini
>
> Please don't top post.
>
> >
> >
> >
> > From: Ed Tanous <ed@tanous.net>
> > Sent: Saturday, February 13, 2021 10:18 AM
> > To: Udupa.Ashwini ISV <udupa.ashwini@inventec.com>
> > Cc: openbmc@lists.ozlabs.org
> > Subject: Re: Redfish v1/Systems/system/EthernetInterfaces
> >
> >
> >
> >
> >
> >
> >
> > On Sat, Feb 13, 2021 at 10:11 AM Udupa.Ashwini ISV <udupa.ashwini@inven=
tec.com> wrote:
> >
> >
> >
> > Hi,
> >
> >
> >
> > I am new to OpenBmc and Redfish.
> >
> > I saw in bmcweb/Redfish.md, that below Redfish is targeted for OpenBmc:
>
> This doc is really old, and was originally written as an initial stab at =
what interfaces we should write.  Unfortunately, when it got converted into=
 a "here's the interfaces we support today" doc, that path didn't get scrub=
bed.  We don't have an implementation of it today.  I can get a review open=
 to update the doc.
>
> >
> > /redfish/v1/Systems/system/EthernetInterfaces
> >
> >
> >
> > But, in redfish-core/lib/systems.hpp, I don=E2=80=99t see EthernetInter=
faces and I don=E2=80=99t see it on my server Redfish too.
>
> Today, we don't have this implemented because we don't really have a path=
 to get that information from the host.  Doing that would require either an=
 in-band application running on the main processor to send new ip addresses=
 to the bmc, or an NCSI, MCTP, or PLDM connection directly to the NIC that =
supported getting that level of information.
> Both of which likely require a new daemon to expose those APIs to debug.
>
> We do have /redfish/v1/Systems/hypervisor/EthernetInterfaces today.
> We'd ideally want to follow very closely to what that does, expose a new =
path on DBus that implements the xyz.openbmc_project.Network.EthernetInterf=
ace interface, and grab the data from it.
>
> >
> >
> >
> > What upstream system are you trying this on?  If your platform isn=E2=
=80=99t upstream, can you point at the code review where you=E2=80=99re add=
ing it?
> >
> >
> >
> > If you don=E2=80=99t have either, take note that it=E2=80=99s really di=
fficult to help debug or make suggestions for platforms that we can=E2=80=
=99t see the code for.
> >
> >
> >
> > Its only present in Managers/bmc/EthernetInterfaces.
> >
> >
> >
> > How do I add Systems/system/EthernetInterfaces Redfish support? What ch=
anges do I need to make?
> >
> >
> >
> > Regards,
> >
> > Ashwini
> >
> >
> >
> > --
> >
> > -Ed
