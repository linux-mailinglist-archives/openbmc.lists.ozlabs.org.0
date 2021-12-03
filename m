Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FC24674A5
	for <lists+openbmc@lfdr.de>; Fri,  3 Dec 2021 11:19:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J581r6j6dz308v
	for <lists+openbmc@lfdr.de>; Fri,  3 Dec 2021 21:19:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bgdev-pl.20210112.gappssmtp.com header.i=@bgdev-pl.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=2LaKkFiq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=bgdev.pl
 (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=brgl@bgdev.pl; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bgdev-pl.20210112.gappssmtp.com
 header.i=@bgdev-pl.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=2LaKkFiq; dkim-atps=neutral
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J581P5tHxz2xDY
 for <openbmc@lists.ozlabs.org>; Fri,  3 Dec 2021 21:18:48 +1100 (AEDT)
Received: by mail-ed1-x52a.google.com with SMTP id x15so9596726edv.1
 for <openbmc@lists.ozlabs.org>; Fri, 03 Dec 2021 02:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XTjnjmHFEpnEFTVjBjOe1NAWxlCV0BUHNCPW5djSw5g=;
 b=2LaKkFiqei1zR23gg/atHaiYhBx0OqMivxbTdeyOLfY2rNOgPdTC+A+eRnAy068MZI
 F/sH1VjQRQpZbQVSz2OnsDDPRm5ERrSlFOuO7SNN9AQLZLyAMHWGCcsSDV4OxCBNkOsh
 o3QP8XT/UPWMKeApPlsTsFEtbmDAK5PaZs4YNbw8jG5b9Z4l/qj43ky4/4WWh1qQWtyP
 Iu5mrf56nPVUtmzslCG/B7jp9eg6lgGjGJp9h8hrfdU6ZQGkzNTcZhQdb8XUeHqvgiB2
 a+IxgCExg1FoWtUkICi9H+XxvSaBxcRxNgZumvRqC7i3gGzBcBM93oN23e5Ze+pe40Dg
 ryNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XTjnjmHFEpnEFTVjBjOe1NAWxlCV0BUHNCPW5djSw5g=;
 b=ORE1fqeOFCwetazkDlICttMKpOHGrvT/D7ZMNNfqaNj0MjzaSBbpZ7h4+rrQBEC8H3
 pV1KkNSLQc8SYZOzqcrQ6XDZRto7gVaiHV4KNzEPsavCykgPBmmIf1fpgX5xeTh0oYmG
 RG7lap/8aUKX0U56Glkf+M8yCeMXH9UKv1sW3vQKTGkxj0MjiLPK+hYGY4J2mbZBRrOe
 TjAS5LcVX8W4XE6tVMrtQBERSLKH7Q94R6oeoafs4jrYsGa14n8s0US50H2pP9dVYl3l
 NIXdYa3L0K7pqvyqJIZ0/9r1MzhUN6wmOjm8ZrfA9C/ZEUzmjNwICPGMfpyD1+JhKZft
 nsrA==
X-Gm-Message-State: AOAM533HIpAfg/1MHh41fwXg2C/wAGpLA8ti9sffwyidBU3vwJ6HamiV
 AgY+gtd+nyruU4ZvlO44ns1ne/rW6oA+AJCIrApgq72zOE3xKDwh
X-Google-Smtp-Source: ABdhPJxypJv8XErfHRuqkXVHyKtOg3P4RSUfdy/7URwKabJs7JnzL+f50qXCH1okVSwS3waJ+xVS+zB03SQLxFOAPWU=
X-Received: by 2002:a05:6402:27c7:: with SMTP id
 c7mr25953722ede.0.1638526721048; 
 Fri, 03 Dec 2021 02:18:41 -0800 (PST)
MIME-Version: 1.0
References: <20211201072902.127542-1-joel@jms.id.au>
 <CAMRc=McG0stAC_v9_oLjwXa4=nyJVpmuyi2eVWCFA+NW9mWibg@mail.gmail.com>
 <CACPK8XcEhsz8Xk2m7bdPaFnwQ3BrKTH80r-ir_qwngTZ+FmGBQ@mail.gmail.com>
 <20211203035019.GC25091@packtop>
 <56d66cf6-a05f-461f-9db5-b02b30dc12b2@www.fastmail.com>
In-Reply-To: <56d66cf6-a05f-461f-9db5-b02b30dc12b2@www.fastmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 3 Dec 2021 11:18:30 +0100
Message-ID: <CAMRc=Me26z7d26AY-UFe7T83doqXvreuEtjs1W--uJLmzKaNvA@mail.gmail.com>
Subject: Re: [libgpiod PATCH] gpioget: Add --line-name to lookup GPIO line
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>, Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Dec 3, 2021 at 7:20 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Fri, 3 Dec 2021, at 14:20, Zev Weiss wrote:
> > On Wed, Dec 01, 2021 at 08:29:47PM PST, Joel Stanley wrote:
> >>On Wed, 1 Dec 2021 at 08:29, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >>>
> >>> On Wed, Dec 1, 2021 at 8:29 AM Joel Stanley <joel@jms.id.au> wrote:
> >>> >
> >>> > Systems provide line names to make using GPIOs easier for userspace. Use
> >>> > this feature to make the tools user friendly by adding the ability to
> >>> > show the state of a named line.
> >>> >
> >>> >  $ gpioget --line-name power-chassis-good
> >>> >  1
> >>> >
> >>> >  $ gpioget -L pcieslot-power
> >>> >  0
> >>
> >>> I'm not very convinced to be honest. It's not like "gpioget gpiochip0
> >>> `gpiofind gpiochip0 line-name`" requires much more typing than
> >>> "gpioget gpiochip --line-name=name".
> >>
> >>I'm taking on feedback from people working in our labs, and
> >>implementing userspace applications. We've been building BMCs with
> >>mainline Linux for about six years now, and it's been a long road
> >>re-training them from "back in the day we just did devmem <this>
> >><that>" and "why can't we just do cat /sys/class/gpio/gpio305/value",
> >>and now "why does the level of the GPIO change back after I run the
> >>command?".
> >>
> >>This usability improvement is one more step towards them using and
> >>being happy with the "new world" of the gpiod API.
> >>
> >>Once we settle on a good API here, I plan on submitting a version of
> >>gpioget/gpioset added to busybox.
> >>
> >>> There are also other questions:
> >>> this uses getopt and only allows to specify a single line name. What
> >>> if we want to specify more lines like with offsets? Even if you allow
> >>> multiple names, getopt() doesn't guarantee ordering of arguments.
> >>
> >>If you're happy with the concept I'm happy to iterate on the implementation.
> >>

Alright, it looks like this has passed by popular vote.

> >>Yes, it only allows a single line name. That tends to be how the tool
> >>is used, both from the command line and in scripts.
> >>
> >>Can you give me an example of your proposed command line API, so I can
> >>understand what you're suggesting here?
> >>
> >
> > My two cents: like Jeremy, I would very much welcome the ability to
> > specify GPIOs by name instead of number, but the one-line-only
> > limitation does seem unfortunate.  How about making a command-line flag
> > that just means "line-specifier arguments should be interpreted as names
> > instead of numbers"?
> >
> > So you could do:
> >
> >   $ gpioget --by-name chassis-intrusion cpu1-prochot
> >   0 1
> >
> >   $ gpioset --by-name led-green=1 led-red=0

I like this more - that way we either allow offsets or names. Please
make sure corner cases are covered. If you can add this to other tools
too, I'm fine with that, but put the name lookup code into
tools-common.c please. I would also like to see bats test cases
covering this.

Thanks!
Bart

> >
>
> I came up with this approach as well (independently, just thinking
> about Joel's patch). I think it has good ergonomics. I hadn't figured
> out how we should interpret the arguments as line index vs line name,
> but your --by-name option solves that. I like it a lot.
>
> Andrew
