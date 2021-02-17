Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C4231E169
	for <lists+openbmc@lfdr.de>; Wed, 17 Feb 2021 22:32:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DgrfT1Njpz3clV
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 08:32:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=YZQognyY;
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
 header.s=20150623 header.b=YZQognyY; dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DgrfF0XFyz30HK
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 08:32:34 +1100 (AEDT)
Received: by mail-yb1-xb36.google.com with SMTP id x19so137135ybe.0
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2021 13:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gnjxlpOukpy1VVx30BX4LRpoSbywyqXxT2c7Lti6bbY=;
 b=YZQognyYmfRS00hSoPG93IgMkuE303yzUrrLj5jAF9/Xt3qkpoe8tuB03I1tvtqb0S
 9Pn7T9e7GBwLJ2uOq4X+TJhVIak12izMeyX9NC5Sma26hRKpv3e+aXLGEsGwPOxgc4Oh
 MI8OFjEldP+G/SVK65fzRbz4GRn+m2MBOZbJohaKwx/RYU06R4Oxm3hUIFTKh//NM8iP
 61qVwBbMZyUuTZR/D2P3aK0K7mfIrQ2rkP7Rk1VG5vUx0yDLVHh5VVrjKmPvlAkDBYkW
 ZtO0Mkb343tIaptS9LXxcTp3022E88rjEma9Y89Msp1NqymkNIPE+lqGK9bRrj+r/TPf
 zMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gnjxlpOukpy1VVx30BX4LRpoSbywyqXxT2c7Lti6bbY=;
 b=s03HFXqqlzgL8EwcahpqyQm1bh/YRheCCu2MK0kS+x0+18Y4S1QTco8oLoWD9MGo7A
 w5mbtHdKgtBnCCe/6isXXaiyTS1t4VXhOsoNnPcafb2+yEs6zcp286PyWpa2Gd7GSE0r
 JXMfB5eYzJsYVjecanHVVcyZVWyndL9deH+UyiQtxn+vOxviIvFvVyLpMYIY1nUeN+uC
 UZnNOODu/ImRvNJbzEsGoN0PTZ7LMHYo07u1iyH5jqv1apZP7BCSVGiDpisixfB+4E6d
 7z07fWG5zDAr9WSVfawi5eSKCxy7Llh81o46pZcUgmnJVQxQL7YZhDK2ZCe+3JSML3fT
 pgvQ==
X-Gm-Message-State: AOAM531REzMXUh9TAuJBlsKe91FJfvBxJHDv95Eu417uTDqI5ykzPJoO
 +kWvF2iStjvsas95KIxGLnt2BBsWyXu0ggGpyAPuqw==
X-Google-Smtp-Source: ABdhPJzaogreSeiQ0HvG920ueCU/YKRqGN5x1aMd+3wkjr4VRQD8s3wu8O6vqaJnuiFa7aoHqvJVsZX9WZrNJmxMrpg=
X-Received: by 2002:a25:2c82:: with SMTP id s124mr2082653ybs.340.1613597552049; 
 Wed, 17 Feb 2021 13:32:32 -0800 (PST)
MIME-Version: 1.0
References: <SG2PR02MB2796B5FB2DB9AAAE2594BA1E858B9@SG2PR02MB2796.apcprd02.prod.outlook.com>
 <SG2PR02MB27961D3A938C94341747757C858A9@SG2PR02MB2796.apcprd02.prod.outlook.com>
 <CACWQX807_KpeTHnMqPMt8E+h_ggMpKy0_Jr82HPV+oRushXdXw@mail.gmail.com>
 <SG2PR02MB2796736A2D3DCEB0AC9AEC9985869@SG2PR02MB2796.apcprd02.prod.outlook.com>
 <CACWQX80r9dYEGbwftH32Sc6fRmDLHeYg24tdO+8hME9V_bDDCg@mail.gmail.com>
 <SG2PR02MB2796D7A6B15C18F348369F0A85869@SG2PR02MB2796.apcprd02.prod.outlook.com>
 <CACWQX81Wg-+tcj+QbUCN8K=Ox7EeCmPL_b2VSYr3ziM-d2va4g@mail.gmail.com>
 <SG2PR02MB2796CC3A1DDD20838992AF5185869@SG2PR02MB2796.apcprd02.prod.outlook.com>
In-Reply-To: <SG2PR02MB2796CC3A1DDD20838992AF5185869@SG2PR02MB2796.apcprd02.prod.outlook.com>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 17 Feb 2021 13:32:20 -0800
Message-ID: <CACWQX80UBr2vGm3-ixo_G2W1SjYhmJTuX+SmpP947e5y922H_w@mail.gmail.com>
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

On Wed, Feb 17, 2021 at 1:23 PM Udupa.Ashwini ISV
<udupa.ashwini@inventec.com> wrote:
>
> On Wed, Feb 17, 2021 at 12:13 PM Udupa.Ashwini ISV <udupa.ashwini@invente=
c.com> wrote:
> > >
> > > Hi Ed,
> > >
> > >
> > >
> > > Its Inventec platform.
> > >
> > > https://github.com/openbmc/openbmc/tree/master/meta-inventec
> > >
> > > I just wanted to know how to implement /redfish/v1/Systems/system/Eth=
ernetInterfaces.
> >
> > Excellent, that helps.  I originally misread, and thought the interface=
 was missing on the platform, not that you were trying to add it to redfish=
.
> >
> > >
> > >
> > >
> > > Regards,
> > >
> > > Ashwini
> >
> > Please don't top post.
> >
> > >
> > >
> > >
> > > From: Ed Tanous <ed@tanous.net>
> > > Sent: Saturday, February 13, 2021 10:18 AM
> > > To: Udupa.Ashwini ISV <udupa.ashwini@inventec.com>
> > > Cc: openbmc@lists.ozlabs.org
> > > Subject: Re: Redfish v1/Systems/system/EthernetInterfaces
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > On Sat, Feb 13, 2021 at 10:11 AM Udupa.Ashwini ISV <udupa.ashwini@inv=
entec.com> wrote:
> > >
> > >
> > >
> > > Hi,
> > >
> > >
> > >
> > > I am new to OpenBmc and Redfish.
> > >
> > > I saw in bmcweb/Redfish.md, that below Redfish is targeted for OpenBm=
c:
> >
> > This doc is really old, and was originally written as an initial stab a=
t what interfaces we should write.  Unfortunately, when it got converted in=
to a "here's the interfaces we support today" doc, that path didn't get scr=
ubbed.  We don't have an implementation of it today.  I can get a review op=
en to update the doc.
> >
> > >
> > > /redfish/v1/Systems/system/EthernetInterfaces
> > >
> > >
> > >
> > > But, in redfish-core/lib/systems.hpp, I don=E2=80=99t see EthernetInt=
erfaces and I don=E2=80=99t see it on my server Redfish too.
> >
> > Today, we don't have this implemented because we don't really have a pa=
th to get that information from the host.  Doing that would require either =
an in-band application running on the main processor to send new ip address=
es to the bmc, or an NCSI, MCTP, or PLDM connection directly to the NIC tha=
t supported getting that level of information.
> > Both of which likely require a new daemon to expose those APIs to debug=
.
>
> Thanks Ed.
> So, only those implemented in "bmcweb/redfish-core/lib/"  are currently i=
mplemented in OpenBMC Redfish right?

Correct.

> I don=E2=80=99t see below implemented too:
> Systems/system/BootOptions

I thought there were patches in review to add this, you might try
checking gerrit.

> Please confirm.
>
> But, are these implemented?
> 1. Systems/system/NetworkInterfaces
No.

> 2. Systems/system/PCIeFunctions
Yes, but the only thing that publishes data of that type that I know
of is peci-pcie.  If that doesn't work for you, you'll likely need to
implement the appropriate dbus interfaces for your system.

> If so, what changes are needed to make these working?
>
>
> > We do have /redfish/v1/Systems/hypervisor/EthernetInterfaces today.
> > We'd ideally want to follow very closely to what that does, expose a ne=
w path on DBus that implements the xyz.openbmc_project.Network.EthernetInte=
rface interface, and grab the data from it.
> >
> > >
> > >
> > >
> > > What upstream system are you trying this on?  If your platform isn=E2=
=80=99t upstream, can you point at the code review where you=E2=80=99re add=
ing it?
> > >
> > >
> > >
> > > If you don=E2=80=99t have either, take note that it=E2=80=99s really =
difficult to help debug or make suggestions for platforms that we can=E2=80=
=99t see the code for.
> > >
> > >
> > >
> > > Its only present in Managers/bmc/EthernetInterfaces.
> > >
> > >
> > >
> > > How do I add Systems/system/EthernetInterfaces Redfish support? What =
changes do I need to make?
> > >
> > >
> > >
> > > Regards,
> > >
> > > Ashwini
> > >
> > >
> > >
> > > --
> > >
> > > -Ed
