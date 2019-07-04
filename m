Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF27C5F28B
	for <lists+openbmc@lfdr.de>; Thu,  4 Jul 2019 08:05:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45fSBV4CcKzDqbY
	for <lists+openbmc@lfdr.de>; Thu,  4 Jul 2019 16:05:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::242; helo=mail-lj1-x242.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="I0b102pi"; 
 dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45fS9n0Bn7zDqYt
 for <openbmc@lists.ozlabs.org>; Thu,  4 Jul 2019 16:04:37 +1000 (AEST)
Received: by mail-lj1-x242.google.com with SMTP id p17so4928647ljg.1
 for <openbmc@lists.ozlabs.org>; Wed, 03 Jul 2019 23:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MQrkmrKp6SwwU5JtekI13lrfF86RU4AxQ1lZ1txpQUU=;
 b=I0b102piLXJFGW/Me73c1ThBre6BJfIq34EE+EJK8PB0FpnDUA33QDr7YY3EauF2b/
 Iqj0Pe+f2uhkEcYeIqFMWRZj/aIXcSQzWH0571/TV+B+uxNe0jiej1BYxntTfasZyZWt
 obCeSDgZKczH/bCdWDS3KUmKAxBuneS0y0ZBNlT2oN9cUpVrfTNS4lGt1jxtpTiNuyNw
 FcAskpMINRN+EuvNyFHhhOEJT52HmlqgI1Gu8SLqmLqXhkwBL95dsU4EZVnTvJFUm+PL
 2pxhOmfefxtUPK1jLOUHEaDRq5y4YenTurw02u0Do8WskAJ2ZiFZwc5xwT698jf4c93/
 46PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MQrkmrKp6SwwU5JtekI13lrfF86RU4AxQ1lZ1txpQUU=;
 b=ljqEBoMUGu7orVFxPPnCO08Bg/ROadIKMMuf59pm+xXsdw4soRaicSiC2+MPVLh7Pr
 3YNKDDPJd7NpIbXsAwwqgQNJGnXDWrQXYqtso8P/k7qR4v5VilWNVjArv1mDrKZNIcpm
 Kt6jcXeSkjk+1dXqXOigNkzYHkXQ16QKRO6RERaK6ndFNi5I5fsEFLOBFWsPKgLRTpno
 hu7HuGYFD3SGaVJ1ebOH4jEOnDWpLutw9gDRQUWmIAarFVws01fZSesK4PrvPyCyeS04
 Dnc9H6y2UeHvDdpSwYVyLMMtffO1VCWtdVUduGefJEyjclcZj3Smp2lp5FYPOnJW5pMI
 JY3g==
X-Gm-Message-State: APjAAAXDypGcdQbQVJsDA8/jjVc3qlKGqipd7vAcK6sY6I9c7nzmnT5G
 8Kl0iZBq9F4iBoWm9x5Ukl6IGf4oCfLrkqLXd8sDTQ==
X-Google-Smtp-Source: APXvYqxQlen/MH5zjnVk5jqI1kLenuo3LCBt1yZeyF2E40abdFPiA46ITGuaxuPXYy8aoEU6tsh+VFD3BTp25+CUQCE=
X-Received: by 2002:a2e:8849:: with SMTP id z9mr23107020ljj.203.1562220272797; 
 Wed, 03 Jul 2019 23:04:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxEsabCU_2U+ooZrkrYqM+yC8YWXs-1tmdGha6kzifkyg@mail.gmail.com>
 <CAARXrt=v=288DTkLJuQ9bM7svt5aX0TNmQs8YFbkGiwcvoyZ3g@mail.gmail.com>
In-Reply-To: <CAARXrt=v=288DTkLJuQ9bM7svt5aX0TNmQs8YFbkGiwcvoyZ3g@mail.gmail.com>
From: William Kennington <wak@google.com>
Date: Wed, 3 Jul 2019 23:04:21 -0700
Message-ID: <CAPnigKn+QqjwoGyGn=7f=ztS8x8vTOW+_b43v_9URdAUHBP=ig@mail.gmail.com>
Subject: Re: Upstream Support for flto plugin with automake
To: Lei YU <mine260309@gmail.com>
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

We shouldn't be hardcoding the use of lto anywhere in our builds and
instead should rely on higher layer build logic adding it if needed.
It's not very hard to apply classes in bitbake if we think our
binaries really need lto when built for a BMC target.

On Wed, Jul 3, 2019 at 7:38 PM Lei YU <mine260309@gmail.com> wrote:
>
> On Thu, Jul 4, 2019 at 1:25 AM Patrick Venture <venture@google.com> wrote:
> >
> > Only one recipe currently uses flto-automake which provides for the
> > gcc-ar and gcc-ranlib replacements to build with the flto option.
> > IIRC, James added this because phosphor-pid-control required them to
> > compile.  Many (if not all) Makefiles in openbmc pass in the flto
> > option, and seem to compile fine.
> >
> > I did some light documentation reading on this feature and as I
> > understand it, when objects are compiled with this they're left in a
> > state to improve final "total optimization" during linking.  So,
> > perhaps in the cases where it compiles without the flto-automake swap
> > it's not actually able to take advantage of this during compilation?
> >
> > I ran into an issue today while debugging an SDK issue:
> > x86_64-openbmc-linux-ar:
> > .libs/libupdater.lax/libfirmware_common.a/libfirmware_common_la-sys.o:
> > plugin needed to handle lto object
> > x86_64-openbmc-linux-ar:
> > .libs/libupdater.lax/libfirmware_common.a/libfirmware_common_la-util.o:
> > plugin needed to handle lto object
> > x86_64-openbmc-linux-ranlib:
> > .libs/libupdater.a(libfirmware_common_la-sys.o): plugin needed to
> > handle lto object
> > x86_64-openbmc-linux-ranlib:
> > .libs/libupdater.a(libfirmware_common_la-util.o): plugin needed to
> > handle lto object
> >
> > This was with phosphor-ipmi-flash, building for the tool.  When
> > building for the BMC library it also builds those objects, but does so
> > without issue.  It seems to detect it automatically or favor it
> > already:
> >
> > checking for arm-openbmc-linux-gnueabi-ar... (cached)
> > arm-openbmc-linux-gnueabi-gcc-ar
> > checking for archiver @FILE support... @
> > checking for arm-openbmc-linux-gnueabi-strip... (cached)
> > arm-openbmc-linux-gnueabi-strip
> > checking for arm-openbmc-linux-gnueabi-ranlib...
> > arm-openbmc-linux-gnueabi-gcc-ranlib
> >
> > So it seems flto-automake is obsolete?
> >
> > If that's the case, I can 1) drop the change from phosphor-pid-control
> > (the only user) and 2) drop the bbclass.
> >
> > However, I was wondering what in the SDK could be used to inform it.
> > I ended up getting past this by adding the information to the
> > configure line, and that worked fine.
> >
> > Patrick
>
> It's my first time to notice that we have flto-automake.bbclass for general
> purpose, looks good!
>
> But in your case, if you are building phosphor-ipmi-flash in SDK, it has
> nothing to do with .bbclass, and you got the above issue.
>
> One possible solution is to speicify the AR/RANLIB in configure.ac, see
> example in
> https://github.com/openbmc/phosphor-time-manager/blob/master/configure.ac#L9-L11
>
> I do not know if we have better solutions though.
