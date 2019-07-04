Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5405F9B1
	for <lists+openbmc@lfdr.de>; Thu,  4 Jul 2019 16:07:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45fftw371jzDqc7
	for <lists+openbmc@lfdr.de>; Fri,  5 Jul 2019 00:07:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="RzEfefLt"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45fflb2kd7zDq9F
 for <openbmc@lists.ozlabs.org>; Fri,  5 Jul 2019 00:01:14 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id w10so2959594pgj.7
 for <openbmc@lists.ozlabs.org>; Thu, 04 Jul 2019 07:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GwYTF64ox+NjKi3BdyFwzFjAZ0GdoLqG5R33WRnLrnU=;
 b=RzEfefLt1KssGrKIr7BeBFHTUKxNW0Wm1VsXXYTfSWBUsA+egEwYBP5jbzOUyhpkJQ
 3NxPZUBJb+slXG7q87opzGnM8IargHBGpEjtkc6jT03LPjVv9qcrni5tzRCS+1dWjMvN
 0u0AYeBJG08KWomtwjjR7Ve+4MdOxwY0DdEZZWFFW2KJBsodBWkfzZIfMmkAFZCYyEbf
 968DdN9GHS1iwK8q6Rk8FKRjCP32952cZIrEbwQ7f41/MIQ2R2v9NgkNdoINbI2bUVnq
 LN8NgWI3xj74+aqCiuGcx01RhDAa0IJy2fsaiGVi9jD0DT1an4XZqb9Cv3fhrvcnPOAz
 Ugig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GwYTF64ox+NjKi3BdyFwzFjAZ0GdoLqG5R33WRnLrnU=;
 b=kBSVd0BqlL6lX0EEnH7aqtxrCvzrlOLLEaW1e5OtLCz96ysi9+Ed8bWvNhGmGhRavR
 NN1lK3pGlHc2iZBNF6Z2vqFx1eZgTlsyEj+PeJrQhxusABkxSHciGBxjuTvrTYR0Ftcg
 4Ty9TWG2P8gS8t+6V3pYCcum3xoC23Mtl31LmrYmpD/JmTYometnXB5srsc2R/1ALVAF
 SfnA7Ui/IBhGw2I3X2Lx4EXap73AOF0cwG3+I+B0WPH+yOSWCIGkKBSqiIE6ZwCx54gi
 Y02bKoRw/kmdwKcPO+6MKp3GetpJqF63V6HoTCpsk4p+rrPitQPZMWFlXoLGrKonbSog
 c52w==
X-Gm-Message-State: APjAAAX0+uUS2OUGoU1r1B/gPo8veIJF7vwEaW5URJMrObDZH/GNJmSw
 TV1dYvPJPNqk55dERPjf2grSryd/AhDhFDLdgvTt6T1m/Gk=
X-Google-Smtp-Source: APXvYqyluOj6eZp80iRUvTrrFWElHR7LOW8VYimWjWp9ernPfqRPugDQ4WT/ARdvz9RB3jtgSx2hknQOtjh19f2KZ4g=
X-Received: by 2002:a63:1f1f:: with SMTP id f31mr14072740pgf.353.1562248868892; 
 Thu, 04 Jul 2019 07:01:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxEsabCU_2U+ooZrkrYqM+yC8YWXs-1tmdGha6kzifkyg@mail.gmail.com>
 <CAARXrt=v=288DTkLJuQ9bM7svt5aX0TNmQs8YFbkGiwcvoyZ3g@mail.gmail.com>
In-Reply-To: <CAARXrt=v=288DTkLJuQ9bM7svt5aX0TNmQs8YFbkGiwcvoyZ3g@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 4 Jul 2019 07:00:57 -0700
Message-ID: <CAO=notxqmbD06cvSfCM1jA+bGhnd_sjEMH-k=qtYV1dutJiVig@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 James Feist <james.feist@linux.intel.com>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

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

Thanks, I realize that.  I only happen to notice the issue when
building for SDK that I needed to specify it, but I didn't include the
bblcass for bitbake -- so in that case I didn't need it.  That drew my
attention to not needing the bbclass anywhere.

>
> One possible solution is to speicify the AR/RANLIB in configure.ac, see
> example in
> https://github.com/openbmc/phosphor-time-manager/blob/master/configure.ac#L9-L11
>
> I do not know if we have better solutions though.
