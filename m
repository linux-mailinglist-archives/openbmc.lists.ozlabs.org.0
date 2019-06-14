Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 978AF463A0
	for <lists+openbmc@lfdr.de>; Fri, 14 Jun 2019 18:08:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QQWK0sWbzDrYf
	for <lists+openbmc@lfdr.de>; Sat, 15 Jun 2019 02:08:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d42; helo=mail-io1-xd42.google.com;
 envelope-from=benjaminfair@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="VczkJCW6"; 
 dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QQF11TLRzDrPT
 for <openbmc@lists.ozlabs.org>; Sat, 15 Jun 2019 01:55:48 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id k13so6829940iop.5
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jun 2019 08:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vHE/4ohIGusa+tZMjIqMULTNDtjVhoDiSXOoTMZo35I=;
 b=VczkJCW6Lo+qp6h5GBOlPt5D0JwOZo0FLCGX6mkm0VDPKB+u3Ac275Ighe1teBHX4B
 IseF8uk7kL9QmJu2dC/9YMcB/ByP2QWn7iOKcbGob91yDnBwOdyy+4e20DXCuWOYA6u6
 wNHVjFxWdxyk8r4pU0ADjVorB241OJLgZ9+zjsKchMCsQF37Na+Y/AcGpYjhnYq4IpFm
 02tj1WZ8RWt1nQ1ZZUd6EbUSKjmi6TRuZB+hZJDe0Cgp7zag1y3aNv/1/Vg8HPDEMqHW
 hDOnt3j1O+qzCCArSg3TpuUvERZDBcK6xp39VLJEK/jPWUQhBwaBdbZRW8HXRG7JLFyA
 Hi1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vHE/4ohIGusa+tZMjIqMULTNDtjVhoDiSXOoTMZo35I=;
 b=TjUb3/d/w5skRNwG3HawaP9k+NuIssCISpeLNWZEv2s++lgGmpXmckPm8xuauHSMZK
 12qQtUard6kO9ygDBXRLWUFAizosw6eyPk+p2+PQrZv4uvANHyMsJ9Jg+2YdkBjVR1JZ
 21CqAoG2hfdHd+Kai5d8WpAsFX0FPHj3S/KQJcqDXVlEBMznlrKjm0qhWd+vtM8U7Mqf
 gJz5ijEUg7+d65a1EZXghnBIAz0ECzMiPpTD0LQzd9Pg/2+sg3JXaU9YDCtoi7nEcROd
 G7dNHp4TbXhV43RL9HkdqLit70luR91PjWoxGlbWDnVgZ1sxo/IHCIfHnQ3z4V3xf756
 MjOQ==
X-Gm-Message-State: APjAAAXkx+F9axivYWbNrMJpXJ8GtsD/6BmosupazPVf3OBnBpKWeK0t
 CA69Hvbsl5KRn5IbLSn3vlDoIUIs5+6PhjcpRTsLEA==
X-Google-Smtp-Source: APXvYqzsPTOncv2rlAaSXptfBBugSfk+n4mguFeOOF/evpj34WF1zR+lKqYYY0xttvZgwNX/A9a/mwl6XFE1ZXwgoSs=
X-Received: by 2002:a6b:e20a:: with SMTP id z10mr2142522ioc.76.1560527742985; 
 Fri, 14 Jun 2019 08:55:42 -0700 (PDT)
MIME-Version: 1.0
References: <CALLMt=qZOxWDH8eDqv6JYbkvgk10mR1K_REgnE-DkssLWD=iVg@mail.gmail.com>
 <CACPK8XdV6X6j=A2Qf7RcBnWWoESi6SWMZfcoA2mJPO_JFCdcrQ@mail.gmail.com>
 <CAO=notxmm4JWPSS3o6bBXpFxO=n-e43F8kLPcjSvudvGoCCZPA@mail.gmail.com>
 <CALLMt=om6w-0um4vBKoosxVHjL2egHd-Fs=0aT3zE6LJHXedyw@mail.gmail.com>
 <CACPK8XdZWGJ8d32N1D8Np2Ja8DOPZ4BqB9wJ4GyFOJ5PCmO5gg@mail.gmail.com>
In-Reply-To: <CACPK8XdZWGJ8d32N1D8Np2Ja8DOPZ4BqB9wJ4GyFOJ5PCmO5gg@mail.gmail.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Fri, 14 Jun 2019 08:55:06 -0700
Message-ID: <CADKL2t7a41=uwFQaB8UyLOJUNm65rq4hgxCK1zdURCZ6reXZ0A@mail.gmail.com>
Subject: Re: CI to stop testing meta-* layers not in tested machine
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jun 13, 2019 at 9:54 PM Joel Stanley <joel@jms.id.au> wrote:
>
> On Fri, 10 May 2019 at 18:46, Andrew Geissler <geissonator@gmail.com> wrote:
> >
> > On Fri, May 10, 2019 at 9:33 AM Patrick Venture <venture@google.com> wrote:
> > > > I'd like to have a nuvoton based machine so we have some confidence
> > > > that kernel bumps aren't broken.
> > > >
> > > > That would mean adding the evb-nuvoton or gsj machines to CI.
> > >
> > > I vote for the gsj machine.  Not that it's a democracy :)
> >
> > I gave this a try but ran into https://github.com/openbmc/openbmc/issues/3542
> > Be great to get gsj into CI since it would give us a few new layers
> > for coverage.
>
> gsj is now supported in the kernel.
>
> Andrew tried to build the machine and ran into u-boot issues which is
> still blocking the machine's addition to our CI. Patrick, are you able
> to look into that?
>
>  https://github.com/openbmc/openbmc/issues/3542#issuecomment-501706892

That issue will be resolved by switching to a 2019-based U-Boot branch:

https://gerrit.openbmc-project.xyz/c/openbmc/meta-nuvoton/+/22556

>
>
>
> Once we get the u-boot issue sorted out, I propose the following changes:
>
>  - drop qemu from CI. 'qemu' is actually testing on a generic arm
> machine. A few of us at IBM have a side project that has resulted in a
> high quality Qemu support for the aspeed boards, so if you would like
> to test in qemu I recommend grabbing palmetto or romulus and doing
> that. So consider this dropping the generic qemu image and instead
> focusing on the aspeed one.

+1

Many things are already broken on QEMU, including phosphor-ipmi-host.
It's not a useful platform to test with.

>
>  - add gsj. This gives us coverage of the nuvoton kernel and u-boot,
> as well as the nuvoton specific layers

Agreed. I'd also like to switch to (or add) a Nuvoton system with a
host once such a machine is supported upstream. The gsj is only a
storage tray so it doesn't test IPMI bridges, power control, etc.

>
>  - add swift. This is an ast2500-based system that we're looking to
> use emmc flash with, and having testing for those images will be
> useful
>
> Cheers,
>
> Joel
