Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C32219859
	for <lists+openbmc@lfdr.de>; Thu,  9 Jul 2020 08:16:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2Qsp3hnZzDqxB
	for <lists+openbmc@lfdr.de>; Thu,  9 Jul 2020 16:16:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b42; helo=mail-yb1-xb42.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=rOcWqdjT; dkim-atps=neutral
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2Qrl4szCzDqwm
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jul 2020 16:15:18 +1000 (AEST)
Received: by mail-yb1-xb42.google.com with SMTP id x8so504939ybl.9
 for <openbmc@lists.ozlabs.org>; Wed, 08 Jul 2020 23:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fKXeuwRLu6Ck/QAkkMcfXkvA9NI/2XyHLK9IPmNcYC0=;
 b=rOcWqdjTjB8X/U1Dw+dzWMC/uPfTA0Z2MJyMmjzJDIByiB29qGv9OKKlXZ4g+b+VcV
 MsB1xKv0W3HVP/8nQXXJyawmF6gxsGv4Kia54VDcr9fY1t5QjVXxL3ogpDe0jjkMauXA
 qSp+nNAyvepY1rfJUJfBtXqZMR/2JOe20OIUAhLeOgYuIoKDxEGdQcYLBdgQJYQmG2PT
 7JBORGiBV81minofzUice5cymUiu2dzkhrJrNimmvvNILlL+D/uVm8jGStGiDp03X8Hz
 ZHpgfcNeeGuCN0mdV/1amDu1oV/f0BpW0vaVHhT5GxIiU9de8CkTcgg5bQkz0jfeD4We
 LXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fKXeuwRLu6Ck/QAkkMcfXkvA9NI/2XyHLK9IPmNcYC0=;
 b=B10DVJdFwu4Bgv8WfO0seCJz+zmKZ+vu/vc3Ol3mSoO40oJNZs/SJIjGWiYNW71FOi
 X3tZpUcMWcG7qkdKUTrP9DFfsIry/T5yvlgHKfDQ8zJImcHH1M4kqRt/DqUAmsGAtH4K
 7uUOfodtu5Y6znSnBhMnZ7kMI9XQEcOOxGtifvgcZF3N/YANkx/wYfV9FYEUKn2RPFjp
 dqYkWwK8eZqoVX1/IKORm+xK4mcmEact1hgamT3PP6X+NajdxwWvAeYUfwgHd++iY/mM
 JSyAO6v7VSvNlnQnkjeWqU2kigGK9vBsCPXcKZ8oh+z/qd3i/b1VhcKo4F0u46pE3pw0
 TcNA==
X-Gm-Message-State: AOAM530A6gOHS1+pdVghI1OeyZBNo4jOVJ1aua5Ot2EAz5kvbMnvcLoP
 xn7zAgF7COJd9BHgJVo1yPwkvgTvQ7OoeR6xybtpvA==
X-Google-Smtp-Source: ABdhPJzyuRCYe2Z6B/kPeN+XWzpGeMrM9AW7dfXMSG+aBO9s6FpkzLlAQ08KbViNIn0MAwId0BmuGPqzx6h8m7/mm94=
X-Received: by 2002:a25:a301:: with SMTP id d1mr6929871ybi.449.1594275314396; 
 Wed, 08 Jul 2020 23:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_a9xKn77KSnwPq2pEq36JGtfWctaBXOA_4vXtP+=JGszaPkg@mail.gmail.com>
 <CACWQX82=MuAavxCqOerxi-Sdywh0xatb-f+1YzGyVSg74oNGqA@mail.gmail.com>
 <CAA_a9xLUkr5rR5Q8YATphtmWUBEE6V=6N4=k74v8hr8PePMMAQ@mail.gmail.com>
 <CACWQX80fbSwvmyNX1d=kfZEcsS30k1ziN8JtA9LtwFfkNC9ciw@mail.gmail.com>
 <CAA_a9x+7DLrwoN9YmjZneghnGaZHAqM9kzzPo2RThH=GgSFw6w@mail.gmail.com>
 <CACWQX83XycCWC+oXXea8z6vB3Vm61_C=niUXyGXA9NO89Zwf-A@mail.gmail.com>
 <CAA_a9x+h61N1j3_OPvXeb7uCH+gcouy=r7_y8uSt3+XFh38ddA@mail.gmail.com>
 <CACWQX83baDkPtr6CxEUvBCQQF2YdOkfQDxc03c8YVpqX5qcpfQ@mail.gmail.com>
 <CAA_a9x+6OfxGP+Sd6hYeBo3u1yEm1Z=OeXbk5+EOkcik9KyGdg@mail.gmail.com>
 <CACWQX83treqBh2Xh6ycyK=3eO3HbGmZuPyqFPTEXt1dH8QheFA@mail.gmail.com>
 <CAA_a9xLuCPRGawer58S-XUMo_2A27hLYsn=5_0LE4BUvqSLmtg@mail.gmail.com>
 <CACWQX80nVRC_dXRiNYUmdmTubpVz3oVrv_DHiAeUPbpGKBVGYw@mail.gmail.com>
 <CAA_a9xJSx9c=_JwGDh=3ikSvF8QUkxS1No_myqcWJ6bDViYKRQ@mail.gmail.com>
In-Reply-To: <CAA_a9xJSx9c=_JwGDh=3ikSvF8QUkxS1No_myqcWJ6bDViYKRQ@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 8 Jul 2020 23:15:03 -0700
Message-ID: <CACWQX808TL-xzCOSoh0BfZSZZQS+PJqYimw8TCU44o0Qk9qHaA@mail.gmail.com>
Subject: Re: Feedback on Current OpenBMC and Proposing Some Improvements ----
 "Improvements" Ideas
To: Alex Qiu <xqiu@google.com>
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ofer Yehielli <ofery@google.com>,
 Josh Lehan <krellan@google.com>, Richard Hanley <rhanley@google.com>,
 Kais Belgaied <belgaied@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jul 8, 2020 at 2:46 PM Alex Qiu <xqiu@google.com> wrote:
>
> On Wed, Jul 8, 2020 at 11:06 AM Ed Tanous <ed@tanous.net> wrote:
> >
> > On Wed, Jul 1, 2020 at 10:06 AM Alex Qiu <xqiu@google.com> wrote:
> > >
> > > On Tue, Jun 30, 2020 at 7:00 PM Ed Tanous <ed@tanous.net> wrote:
> > > >
> > > > I'm not following that statement.  "find the bus number" would occur
> > > > whether or not you have the busses hardcoded.  Are you advocating for
> > > > not using hwmon sensors here?  Needing to do a calculation for the new
> > > > part you're adding would need to be done regardless.  If you turn it
> > > > into a hwmon sensor, you could have the kernel do the math for you,
> > > > and keep your debugability.
> > >
> > > Hardware engineers want to set the output voltage for voltage
> > > regulators for debugging, which is not covered by hwmon interface or
> > > drivers, so we need to send raw I2C commands.
> > Or add support to the drivers.....
> > I'm not against raw i2c commands for debugging, but long term, it's
> > really hard to maintain (as you seem to be finding).
>
> We've talked with the maintainer of hwmon, and he doesn't think adding
> these to hwmon interface is a good idea, as hwmon is supposed to be a
> monitoring interface. Although we haven't yet met the need to set the
> voltage other than debugging.

Excellent.  I hadn't realized you'd done that.  You're right,
userspace is probably the right spot for this then.

>
> >
> > With respect to those companies, their downstream is their problem.
> > That's why upstreaming is important.  I'm not saying we need to break
> > things unnecessarily, but it's a really poor excuse to say we can't
> > change things because of an unknown entity that didn't share their
> > code.  If they exist, they're using a feature that's relatively new to
> > entity manager, and so far as I know, is only used in a single case,
> > and in that case, mod operator is at the same or greater precedence
> > than + operator, so you could make the change with zero impact to a
> > anyone that I'm aware of.
> >
> >
> > We've gone several rounds on this email, with a lot of places where
> > you could make improvements, including many that wouldn't break
> > anything, but you always seem to come back to being too busy for it,
> > or it not being "upstreamable".  Is there anything that the project
> > could do to help convince you to at least share some changes that
> > you've suggested?  The feedback is really great, but I was hoping with
> > the level of interest you have in this, you'd be interested in putting
> > together some patchsets to do some of these things, even if they're
> > minor, like adding support for your new chip.
>
> First of all, I don't have the magic to turn downstream patches into
> an upstream fix in one day, one week or so, and we currently have the
> priority to fix sensor performance issues so that we can get our new
> platform out of the door this month. On the other hand, my intention
> is to get this conversation started and rolling before we eventually
> have the free time to deal with all the technical debt we accumulated
> downstream, so that we know the aim is as soon as we are at that
> stage.

To be clear, I wasn't expecting you to turn patches around in a day or
week.  Even patches that are public, but not upstreamable are a start,
as they show what you're trying to accomplish, and someone else might
pick it up from there.  Tech debt is a tough mistress, I don't envy
the position you're in.

>
> Clearly, I see the conversation we had so far is greatly valuable at
> least to us, and I believe we have an internal communication gap to
> fill between different teams first. For example, before the
> conversation, I never knew that we were supposed to upstream our
> configuration files. By contrast, I was told that these code names
> can't be publicized, and we've been keeping patches downstream, so
> there's definitely something to resolve internally first. Our team has
> been working underwater for a long time without knowing these
> intentions upstream, and I think it's the first time that we reach
> upstream in this level of detail.

Great!  I'm glad we could help out.  To be clear, for non-public
codename platforms, I wouldn't expect you to upstream the config
files, but you'll have continuing tech debt as the schemas for those
files evolve, so there is an argument to be made with your powers that
be that they should be upstreamed anyway, even if the codename isn't
public, or you need a different codename.
With that said, the config files really aren't the interesting part,
and only serve to make upstream build and run out of the box.  The
real wins are the new sensor and config types, and fixes to the
existing daemons.  In general, those help everyone.

>
> I hope this explains that I can't put up patches for things that I've
> been aware of right away, since we might have been doing something in
> the wrong way for quite some time. Thanks.
>

Whether you upsteam them next week, or a year from now, so long as
that's the direction you're going, and you're willing to make
improvements, I'm happy.

Good luck getting your platform launched.

Cheers,

-Ed
