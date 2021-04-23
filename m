Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E25369ADF
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 21:24:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRkkD1fLRz302f
	for <lists+openbmc@lfdr.de>; Sat, 24 Apr 2021 05:24:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=G4TvgBaW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::333;
 helo=mail-wm1-x333.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=G4TvgBaW; dkim-atps=neutral
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRkjz4l6wz2xZR
 for <openbmc@lists.ozlabs.org>; Sat, 24 Apr 2021 05:24:06 +1000 (AEST)
Received: by mail-wm1-x333.google.com with SMTP id
 y5-20020a05600c3645b0290132b13aaa3bso1766314wmq.1
 for <openbmc@lists.ozlabs.org>; Fri, 23 Apr 2021 12:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nd6gdVOyP1xF7To0c6hPjH0ej5/r0w2qKFBRFw0TMzk=;
 b=G4TvgBaWqbOuVvCL7Am/zeKLJI5Ki+qYECyGcg+/kuLfGCCGvjN0LV6TVUSVk9DKfi
 ZFKN6GSEK2Eo5v8hIRn+9ZRpgAIHCufJ0ZevkJ5uMnX+yUAAQuftWiUz/cfsQd4N3NzX
 5fGHWTrUZxxo9HEe6r2nSod63TFZJ+4x0ohn4YZCuiO8ZSnuNtRSw0faVyrvfZFV8UoE
 O/wYSSKCkm1b2faGWJ0Ixo15UYRcq8NydQemYOyouU+3MprBjG+D2XnOhFhuzVyIiUL/
 y4PGkBkfD0BbTnPRyPDp6xCAzJhQfW3vIN7iHLMBxnc7o+d0cni7oFPGnbHcvV4KZCaT
 /npg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nd6gdVOyP1xF7To0c6hPjH0ej5/r0w2qKFBRFw0TMzk=;
 b=BjR7MOb3VQcGc2AMVAtGL93bHYlK1fMTdMDhPcecMG08SibIRtkpok5wuk4jUoCn44
 BpOOuY6zJSKjNWAO2vGlOcl9ZImVMF84RT1fzVTQrijfcYjBHUZcIGkf4f4d9gkG5eJd
 xw9bz8i+tOP6oXarkxDGWzT+jVXskJcS05BBs2SFNvexiyl3kJ0zGNhrzMd+thPYaoD8
 6NZx1irFfoSKRnYe77bVrVAnYukhzH8vGJ2zvICPrTkEhePoq4UDISqwqyNEM82FcYRS
 NDsj+dxTXMw5tGsC6NtfTAPEKUVwxgSIjwCZZsBov8TdfwfnF8JVEq0NasLvhcVFNmUn
 DO8A==
X-Gm-Message-State: AOAM531tMDYc06wx5s1CVSyy1cqnxKY2AoYUkRIdx7M9qgTjSkMRvzXF
 pFtZ3W2dD4XnkWZZ2OUeCIT4kNaA1YdEnDqfRikd2tDzkXn09g==
X-Google-Smtp-Source: ABdhPJzqkBs+/q8SfE/g+b4n68xTGXOS03AFBB1R55FX3kHVFc+Qbh64OTR1b91kPPVncNhgFqLrvdWOGLaOrlxwTXs=
X-Received: by 2002:a1c:f618:: with SMTP id w24mr5761540wmc.93.1619205841181; 
 Fri, 23 Apr 2021 12:24:01 -0700 (PDT)
MIME-Version: 1.0
References: <1381833945.17566380.1619166988825.JavaMail.zimbra@raptorengineeringinc.com>
 <CACWQX80mH2kBB3pCWPFxaYtDCMbMnfmXQWKh91Q+MsQSczpWcQ@mail.gmail.com>
 <435557601.17654407.1619204401116.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <435557601.17654407.1619204401116.JavaMail.zimbra@raptorengineeringinc.com>
From: Ed Tanous <edtanous@google.com>
Date: Fri, 23 Apr 2021 12:23:49 -0700
Message-ID: <CAH2-KxB85CNG7p9n8fmEy44YUTNZ4zfFEJ8evMOKrooZQ+=pcQ@mail.gmail.com>
Subject: Re: OpenBMC on RCS platforms
To: Timothy Pearson <tpearson@raptorengineering.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Apr 23, 2021 at 12:00 PM Timothy Pearson
<tpearson@raptorengineering.com> wrote:
>
>
>
> ----- Original Message -----
> > From: "Ed Tanous" <ed@tanous.net>
> > To: "Timothy Pearson" <tpearson@raptorengineering.com>
> > Cc: "openbmc" <openbmc@lists.ozlabs.org>
> > Sent: Friday, April 23, 2021 12:23:23 PM
> > Subject: Re: OpenBMC on RCS platforms
>
> > On Fri, Apr 23, 2021 at 7:36 AM Timothy Pearson
> > <tpearson@raptorengineering.com> wrote:
> >>
> >
> > First off, this is great feedback, and despite some of my comments
> > below, I do really appreciate you putting it out there.
> >
> >> All,
> >>
> >> I'm reaching out after some internal discussion on how we can better integrate
> >> our platforms with the OpenBMC project.  As many of you may know, we have been
> >> using OpenBMC in our lineup of OpenPOWER-based server and desktop products,
> >> with a number of custom patches on top to better serve our target markets.
> >>
> >> While we have had fairly good success with OpenBMC in the server / datacenter
> >> space, reception has been lukewarm at best in the desktop space.  This is not
> >> too surprising, given OpenBMC's historical focus on datacenter applications,
> >> but it is also becoming an expensive technical and PR pain point for us as the
> >> years go by.  To make matters worse, we're still shielding our desktop /
> >> workstation customer base to some degree from certain design decisions that
> >> persist in upstream OpenBMC, and we'd like to open discussion on all of these
> >> topics to see if a resolution can be found with minimal wasted effort from all
> >> sides.
> >>
> >> Roughly speaking, we see issues in OpenBMC in 5 main areas:
> >>
> >>
> >> == Fan control ==
> >>
> >> Out of all of the various pain points we've dealt with over the years, this has
> >> proven the most costly and is responsible on its own for the lack of RCS
> >> platforms upstream in OpenBMC.
> >>
> >> To be perfectly frank, OpenBMC's current fan control subsystem is a technical
> >> embarrassment, and not up to the high quality seen elsewhere in the project.
> >
> > Which fan control subsystem are you referring to?  Phosphor-fans or
> > phosphor-pid-control?
> >
> >>  Worse, this multi-daemon DBUS-interconnected Rube Goldberg contraption has
> >>  somehow managed to persist over the past 4+ years, likely because it reached a
> >>  complexity level where it is both tightly integrated with the rest of the
> >>  OpenBMC system and extremely difficult to understand, therefore it is equally
> >>  difficult to replace.  Furthering the lack of progress is the fact that it is
> >>  mostly "working" for datacenter applications, so there may be a "don't touch
> >>  what isn't broken" mentality in play.
> >
> > I'm not really sure I agree with that.  If someone came with a design
> > for "We should replace dbus with X", had good technical foundations
> > for why X was better, and was putting forward the monumental effort to
> > do the work, I know that I personally wouldn't be opposed.  For the
> > record, I agree with you about the complexity here, but most of the
> > ideas I've heard to make it better were "Throw everything out and
> > start over", which, if that's what you want to do, by all means do,
> > but I don't think the community is willing to redo all of the untold
> > hours of engineering effort spent over the years the project has
> > existed.
> >
> > FWIW, u-bmc was a project that took the existing kernel, threw out all
> > the userspace and started over.  From my view outside the project,
> > they seem to have failed to gain traction, and only support a couple
> > of platforms.
> >
> >>  From a technical perspective, it is indirected to a sufficient level as to be
> >>  nearly incomprehensible to most people, with the source spread across multiple
> >>  different projects and repositories, yet somehow it remains rigid / fragile
> >>  enough to not support basic features like runtime (or even post-compile) fan
> >>  configuration for a given server.
> >
> > With respect, this statement is incorrect.  On an entity-manager
> > enabled system + phosphor-pid-control, all of the fan control
> > parameters are fully modifiable at runtime either from within the
> > system (through dbus) or through Redfish out of band through the
> > OEMManager API.  If you haven't ported your systems to entity-manager
> > yet, there's quite a bit of people doing it at the moment and are
> > discussing this stuff on discord basically every day that I'm sure
> > would be able to give you some direction on where to start getting
> > your systems moved over.
>
> <snip>
>
> Interesting.  I assume entity-manager is pretty new still?

It's a couple years old at this point (I think first commit was in
2018?).  It has certainly gotten more momentum over time though.

>  A year ago there was zero solution to the problem of runtime configuration, and when I checked several weeks ago the bug report on it [1] had no meaningful progress.

Bug reports aren't generally the best way to get answers in my
experience, especially if it's not a "bug" but an enhancement you want
to make to the overall architecture. The mailing list or discord tends
to get better responses (as you've seen here in this thread).

For what it's worth, Redfish configurable PID loops were checked in
back in October of 2018, so about 2 and a half years old now.
https://github.com/openbmc/bmcweb/commit/af996fe4d12668d1a096e36e791c49690e54c9bb

>  Looks like that's finally changing.
>
> Is the entity manager fairly stable API-wise at this point?

While we do our best to not make backward incompatible configuration
changes (I can't think of any we've done yet) we don't guarantee it,
and certainly can't make any stability guarantees about code we can't
see.  The best way to keep your systems stable is to get them
upstreamed, so when we need to make "might break things" type changes,
we'll have a good idea if anyone is actually using the features in
question, and which systems we should ask maintainers to test changes
against.

More details under "Intent" heading item #3 here:
https://github.com/openbmc/entity-manager/blob/21608383661285e63e97c0457f55817f6e1d6b92/CONFIG_FORMAT.md

>  That might be enough of a game changer for me to go back and get approval for what will effectively be our fourth port of the Talos II systems to OpenBMC.

Glad to see you're interested.

>
> [1] https://github.com/openbmc/openbmc/issues/3595
