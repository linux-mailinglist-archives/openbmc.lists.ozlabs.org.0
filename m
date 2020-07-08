Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FAB218F77
	for <lists+openbmc@lfdr.de>; Wed,  8 Jul 2020 20:07:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B26hl0VBDzDq5n
	for <lists+openbmc@lfdr.de>; Thu,  9 Jul 2020 04:07:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b41; helo=mail-yb1-xb41.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=OkCja4rA; dkim-atps=neutral
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B26h02q3tzDq5f
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jul 2020 04:06:38 +1000 (AEST)
Received: by mail-yb1-xb41.google.com with SMTP id 133so5424396ybu.7
 for <openbmc@lists.ozlabs.org>; Wed, 08 Jul 2020 11:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fn/JIphlxqAWOAakcX2KWDqqqGxpI0LOAs+vyK4IYEc=;
 b=OkCja4rA43cEovEE8iiCexJridTxFIOfWb9xpFsrWDjxGgwY4DMHtrsAK7NtTmoQfs
 TshdF8Y1rUKeGdUFeyTaveNU0t3ufNsBqHn9sCzKmXCtLgQfBZxBEbrjtCoZoDACOidC
 IVacWJC7l603JjOgbAk41H3ye7vUxaD3cJ+oOlO0kMkLJFzeyAGe1l9ftdC4Z/UbO9EY
 ZyVbpNahfoXoJOnbwW1BwTY932Gq4ygb56+ntAejBUJ5Smzj6FHm5cNothmhsa/MNzs3
 KCkl6UnDE56c8y8gu2RRMwc7bHFY9n7WQCgdSel6hBCnxW3aCnqxNmTcMbBSNMa7giFa
 Zgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fn/JIphlxqAWOAakcX2KWDqqqGxpI0LOAs+vyK4IYEc=;
 b=MlkWP6PIOSnQLDS6cY7HhHvLQSUL6m+Lpye+rcmijYNU9I/E+88e/2dMq1p5QO2R+1
 Ud17pjFUyhJFXUmJm/jRBfqa5kXqLhjFwOYay5YlUsfiz+cpao8pqgEJi51xtwsk2cJK
 v3wSDW8BtTf980OoTYWsiWU1EnBPXD4V1XL1h0uz5KgP2T9+Zk31ylNG96rfn2LuELsL
 OEi6i7hsuoBiSiwbiHlpKNIGDgwuwwM/mkfIV4Wl1/SY4yxdOU0KlcEJT5KNQgANl6Mq
 IbyhfBahmKgPVwnqEt2QG4vi8KEMNYjNcBbxm7HUSX5WBAIo1ET85metOvtETSbgK1rb
 LH0g==
X-Gm-Message-State: AOAM531NuPh39ET0k0TmJ1WL+BI8PmRttFooyjSN7MQmwi0p4jRydyDN
 uyR1Kxcnq3JPNGM8BaaOrQFVJ5qUojXWXE3ksXcu+A==
X-Google-Smtp-Source: ABdhPJymK0ZugRdoRAWKVDWypL/RMC4b2DHOjuNJl+4EvMfLdrISi6Gr6XncXyJ6lhegNDAKkQgpNwpXH6qBDFjgt60=
X-Received: by 2002:a25:a301:: with SMTP id d1mr2794148ybi.449.1594231594564; 
 Wed, 08 Jul 2020 11:06:34 -0700 (PDT)
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
In-Reply-To: <CAA_a9xLuCPRGawer58S-XUMo_2A27hLYsn=5_0LE4BUvqSLmtg@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 8 Jul 2020 11:06:22 -0700
Message-ID: <CACWQX80nVRC_dXRiNYUmdmTubpVz3oVrv_DHiAeUPbpGKBVGYw@mail.gmail.com>
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

On Wed, Jul 1, 2020 at 10:06 AM Alex Qiu <xqiu@google.com> wrote:
>
> On Tue, Jun 30, 2020 at 7:00 PM Ed Tanous <ed@tanous.net> wrote:
> >
> > I'm not following that statement.  "find the bus number" would occur
> > whether or not you have the busses hardcoded.  Are you advocating for
> > not using hwmon sensors here?  Needing to do a calculation for the new
> > part you're adding would need to be done regardless.  If you turn it
> > into a hwmon sensor, you could have the kernel do the math for you,
> > and keep your debugability.
>
> Hardware engineers want to set the output voltage for voltage
> regulators for debugging, which is not covered by hwmon interface or
> drivers, so we need to send raw I2C commands.
Or add support to the drivers.....
I'm not against raw i2c commands for debugging, but long term, it's
really hard to maintain (as you seem to be finding).

> When a system is not
> fully populated, I believe the kernel always assigns the largest
> sequential numbers to newly created MUX channels, so that number will
> vary based on the debug system configurations. On the other hand, our
> current workaround to populate the MUXes in the device tree while they
> may not exist fixes the bus numbers which can be calculated from a
> formula, instead of tracing symlinks.
It sounds like we have different priorities.  You want to make it easy
to debug a single given hardware configuration, entity managers goal
was to make it straightforward to debug any hardware configuration on
any platform.  Different goals, neither are wrong, just different.

>
> For the concern of compatibility, we worry that other companies are
> also using these features downstream. FYI, we are heavily relying on
> it right now, even though we find out it's not following arithmetic
> order of operations.
>
With respect to those companies, their downstream is their problem.
That's why upstreaming is important.  I'm not saying we need to break
things unnecessarily, but it's a really poor excuse to say we can't
change things because of an unknown entity that didn't share their
code.  If they exist, they're using a feature that's relatively new to
entity manager, and so far as I know, is only used in a single case,
and in that case, mod operator is at the same or greater precedence
than + operator, so you could make the change with zero impact to a
anyone that I'm aware of.


We've gone several rounds on this email, with a lot of places where
you could make improvements, including many that wouldn't break
anything, but you always seem to come back to being too busy for it,
or it not being "upstreamable".  Is there anything that the project
could do to help convince you to at least share some changes that
you've suggested?  The feedback is really great, but I was hoping with
the level of interest you have in this, you'd be interested in putting
together some patchsets to do some of these things, even if they're
minor, like adding support for your new chip.
