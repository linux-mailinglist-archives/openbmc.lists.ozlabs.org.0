Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F4A2192C6
	for <lists+openbmc@lfdr.de>; Wed,  8 Jul 2020 23:47:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2CZh53nXzDqS4
	for <lists+openbmc@lfdr.de>; Thu,  9 Jul 2020 07:47:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::22f;
 helo=mail-oi1-x22f.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=uMv6cCw7; dkim-atps=neutral
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2CYs0BWdzDq61
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jul 2020 07:46:37 +1000 (AEST)
Received: by mail-oi1-x22f.google.com with SMTP id k22so226453oib.0
 for <openbmc@lists.ozlabs.org>; Wed, 08 Jul 2020 14:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B1/tOTaLW4AfhhSJyH81keOTY7GxZcCZ9Jf5cVk28P8=;
 b=uMv6cCw7zDMY94kqdsWJanj/BsjOEiv+tq/CkPkgUb/hdEe0mc0yq8Uvw/RXIfPdPa
 9dPtx17fDPVbcmpyiK8MFPpZkB+Sui7TQh80KbZEcc9lJYa5eFcbcvqoZMChoXZ5eB2Y
 K+hKegPaU8XKrtsMgIjP2dPJ5H+mdO88YZWA4U4Jy6AgINjJfR3Je6UsA0LZBgGYVyIv
 Ry8RBzJESy6f4X9lg0Nenu+OdRGrwL60HIXNAm8An6za7MCJcnm1H7cMfQcnPpgRJQll
 V4t2M21pXphpYs6bJrktNAUziPq+7x3mfVHZF3Wf9i+lcjy0p3hk0M/ne+oAhWxvGI9e
 ReRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B1/tOTaLW4AfhhSJyH81keOTY7GxZcCZ9Jf5cVk28P8=;
 b=O32zuFYHqtkN8zGMHd5YznrtVzXlbaIC4I/HCai4I5pir4MZvtNVld3m1MribAzEfz
 UzYs46j7EBb7RW07zOFo8jz9GHSpE63Kl3wdhf7fOTrP02tBk61O3Vmxvw8pNvScL0gR
 ySrJL7ypMHpQ8P/VPWHN31cJqz/7qftrrA9PpL3iWYV6Yi9d0LBORVj0GVgaIUJncbq7
 E9wbUMiPdLEhKend1zHeFqZc2K2zqDCqCdOh/ym0YRA/vVKrD0Yt8Ug5p/YLAav1OzMB
 5kMI23BfR+osNwjRBqr2ZHve1prt5/znCzDNaELnMNOTHKxHD62AAhFpGDbo+/H6VkDV
 mmVg==
X-Gm-Message-State: AOAM533ivglBD3bMhzOhgL8dTpuj+9DFtSxfQ9W2fOQ44FCPI2yXygMI
 XbES8jTmDFvR0n24voUbJMRV6431pMMImvOaQWXbZw==
X-Google-Smtp-Source: ABdhPJwTHumURFcO8H+6YIiWaQ5wsDNgJLCDQPauU449Bl3w5MIADs6bgHV0xJJQfmpjC/Z5BkkcI5DiAwEe4fPWlBU=
X-Received: by 2002:aca:b689:: with SMTP id g131mr2790651oif.62.1594244793532; 
 Wed, 08 Jul 2020 14:46:33 -0700 (PDT)
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
In-Reply-To: <CACWQX80nVRC_dXRiNYUmdmTubpVz3oVrv_DHiAeUPbpGKBVGYw@mail.gmail.com>
From: Alex Qiu <xqiu@google.com>
Date: Wed, 8 Jul 2020 14:46:22 -0700
Message-ID: <CAA_a9xJSx9c=_JwGDh=3ikSvF8QUkxS1No_myqcWJ6bDViYKRQ@mail.gmail.com>
Subject: Re: Feedback on Current OpenBMC and Proposing Some Improvements ----
 "Improvements" Ideas
To: Ed Tanous <ed@tanous.net>
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

On Wed, Jul 8, 2020 at 11:06 AM Ed Tanous <ed@tanous.net> wrote:
>
> On Wed, Jul 1, 2020 at 10:06 AM Alex Qiu <xqiu@google.com> wrote:
> >
> > On Tue, Jun 30, 2020 at 7:00 PM Ed Tanous <ed@tanous.net> wrote:
> > >
> > > I'm not following that statement.  "find the bus number" would occur
> > > whether or not you have the busses hardcoded.  Are you advocating for
> > > not using hwmon sensors here?  Needing to do a calculation for the new
> > > part you're adding would need to be done regardless.  If you turn it
> > > into a hwmon sensor, you could have the kernel do the math for you,
> > > and keep your debugability.
> >
> > Hardware engineers want to set the output voltage for voltage
> > regulators for debugging, which is not covered by hwmon interface or
> > drivers, so we need to send raw I2C commands.
> Or add support to the drivers.....
> I'm not against raw i2c commands for debugging, but long term, it's
> really hard to maintain (as you seem to be finding).

We've talked with the maintainer of hwmon, and he doesn't think adding
these to hwmon interface is a good idea, as hwmon is supposed to be a
monitoring interface. Although we haven't yet met the need to set the
voltage other than debugging.

>
> With respect to those companies, their downstream is their problem.
> That's why upstreaming is important.  I'm not saying we need to break
> things unnecessarily, but it's a really poor excuse to say we can't
> change things because of an unknown entity that didn't share their
> code.  If they exist, they're using a feature that's relatively new to
> entity manager, and so far as I know, is only used in a single case,
> and in that case, mod operator is at the same or greater precedence
> than + operator, so you could make the change with zero impact to a
> anyone that I'm aware of.
>
>
> We've gone several rounds on this email, with a lot of places where
> you could make improvements, including many that wouldn't break
> anything, but you always seem to come back to being too busy for it,
> or it not being "upstreamable".  Is there anything that the project
> could do to help convince you to at least share some changes that
> you've suggested?  The feedback is really great, but I was hoping with
> the level of interest you have in this, you'd be interested in putting
> together some patchsets to do some of these things, even if they're
> minor, like adding support for your new chip.

First of all, I don't have the magic to turn downstream patches into
an upstream fix in one day, one week or so, and we currently have the
priority to fix sensor performance issues so that we can get our new
platform out of the door this month. On the other hand, my intention
is to get this conversation started and rolling before we eventually
have the free time to deal with all the technical debt we accumulated
downstream, so that we know the aim is as soon as we are at that
stage.

Clearly, I see the conversation we had so far is greatly valuable at
least to us, and I believe we have an internal communication gap to
fill between different teams first. For example, before the
conversation, I never knew that we were supposed to upstream our
configuration files. By contrast, I was told that these code names
can't be publicized, and we've been keeping patches downstream, so
there's definitely something to resolve internally first. Our team has
been working underwater for a long time without knowing these
intentions upstream, and I think it's the first time that we reach
upstream in this level of detail.

I hope this explains that I can't put up patches for things that I've
been aware of right away, since we might have been doing something in
the wrong way for quite some time. Thanks.

- Alex Qiu
