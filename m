Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8555F9C4
	for <lists+openbmc@lfdr.de>; Thu,  4 Jul 2019 16:09:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ffxV1phkzDqcG
	for <lists+openbmc@lfdr.de>; Fri,  5 Jul 2019 00:09:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="NC2qFFrk"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ffqQ457BzDqDb
 for <openbmc@lists.ozlabs.org>; Fri,  5 Jul 2019 00:04:33 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id i2so3147314plt.1
 for <openbmc@lists.ozlabs.org>; Thu, 04 Jul 2019 07:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mc3KKlt7MZPArwHEz+NT/472qy7uhLDaPeyYbMAUe1Q=;
 b=NC2qFFrkQ1cmdWQJT0KUbsDs8BPtiURKuoMTw8D9CwQpv6WSmtaO5dBSfcZCG4qjT0
 HbBS7INIyL4Gc5VzkmulMqtNhtGO/gRU62I5aGRU/cihMQGI4vke/Olcf2qs6TS7O6id
 z2O7sYWDy0OA9c6L71valvMpldqjsW03ssA3GrDSA3h6Uc46Q18Hudb30KjQgr/1E5em
 oq7h9tjz/9e1NbCDicKr+fX81056nk5kwMIPX1vsxlfp3EeFZSJTnMLSTZzAu98M8Cd7
 Ahum//7lhoOvJUgmeF5yjZ65CBUNi2E+PG4tLzGsS3pCa80RYLOC8yxVGIn6GExjG+ZW
 XhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mc3KKlt7MZPArwHEz+NT/472qy7uhLDaPeyYbMAUe1Q=;
 b=ET281KvrwjcKD+DeZzJSyj7y0pMxMuYEVmMqPyYNvGhv2P8OY9By8ls4v7saN+ZByi
 bap+jPPxGbcuAW7xBCzSVYezhBfhKlvO9RV+Z6jxYBda7e76xHVMXK9B75Y75D03uoHE
 edlrs1cWasj/wKymGQpwBVCm2RpuaTyZacG87JbVkHmgBfYQOSWhL8gJNanP29UVbLlF
 uy5OwjP7DrbagjCAOuB09QCNfZlRs+uiAqS+yYbU5tezlOtYLP5Yt7zna9xWUPw3kOiK
 v7cwx9kWr20MaHIzy6RHjTUzJQUDTXuYvx4iFkEe8YsUe/ZlJ0SPuNOpt7+gncG4EI+x
 Mc7A==
X-Gm-Message-State: APjAAAWCF3eCYNsn4sDylaMThhdfJCFKIC6CfWNTryxG0XnON31vY5+P
 GMh94oOCSvc4rXr82vnJC0KSnB35M4i+Lw/m390v4w==
X-Google-Smtp-Source: APXvYqznkvQ0g4/3g2AA/lZibn1RL67jpjaEaTO/GXvjsIBRVYInrEdIQYRhdR731A2dyh9CxjkgqKrsVa2qXCL/Aa4=
X-Received: by 2002:a17:902:b944:: with SMTP id
 h4mr40718578pls.179.1562249069895; 
 Thu, 04 Jul 2019 07:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxEsabCU_2U+ooZrkrYqM+yC8YWXs-1tmdGha6kzifkyg@mail.gmail.com>
 <CAARXrt=v=288DTkLJuQ9bM7svt5aX0TNmQs8YFbkGiwcvoyZ3g@mail.gmail.com>
 <CAPnigKn+QqjwoGyGn=7f=ztS8x8vTOW+_b43v_9URdAUHBP=ig@mail.gmail.com>
In-Reply-To: <CAPnigKn+QqjwoGyGn=7f=ztS8x8vTOW+_b43v_9URdAUHBP=ig@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 4 Jul 2019 07:04:18 -0700
Message-ID: <CAO=noty-WaONZ+mgv9k+NOU9YEC5mhpeuKfVJErzCP-bOpZ8vg@mail.gmail.com>
Subject: Re: Upstream Support for flto plugin with automake
To: William Kennington <wak@google.com>
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
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jul 3, 2019 at 11:04 PM William Kennington <wak@google.com> wrote:
>
> We shouldn't be hardcoding the use of lto anywhere in our builds and
> instead should rely on higher layer build logic adding it if needed.
> It's not very hard to apply classes in bitbake if we think our
> binaries really need lto when built for a BMC target.

I don't disagree, but specifying it explicitly is a really really
common pattern in openbmc.  Maybe it should be an anti-pattern?  I'll
leave that up to others, but if that's the way it's headed, I can
update the code I maintain.

>
> On Wed, Jul 3, 2019 at 7:38 PM Lei YU <mine260309@gmail.com> wrote:
> >
> > On Thu, Jul 4, 2019 at 1:25 AM Patrick Venture <venture@google.com> wrote:
> > >
> > > Only one recipe currently uses flto-automake which provides for the
> > > gcc-ar and gcc-ranlib replacements to build with the flto option.
> > > IIRC, James added this because phosphor-pid-control required them to
> > > compile.  Many (if not all) Makefiles in openbmc pass in the flto
> > > option, and seem to compile fine.
> > >
> > > I did some light documentation reading on this feature and as I
> > > understand it, when objects are compiled with this they're left in a
> > > state to improve final "total optimization" during linking.  So,
> > > perhaps in the cases where it compiles without the flto-automake swap
> > > it's not actually able to take advantage of this during compilation?
> > >
> > > I ran into an issue today while debugging an SDK issue:
> > > x86_64-openbmc-linux-ar:
> > > .libs/libupdater.lax/libfirmware_common.a/libfirmware_common_la-sys.o:
> > > plugin needed to handle lto object
> > > x86_64-openbmc-linux-ar:
> > > .libs/libupdater.lax/libfirmware_common.a/libfirmware_common_la-util.o:
> > > plugin needed to handle lto object
> > > x86_64-openbmc-linux-ranlib:
> > > .libs/libupdater.a(libfirmware_common_la-sys.o): plugin needed to
> > > handle lto object
> > > x86_64-openbmc-linux-ranlib:
> > > .libs/libupdater.a(libfirmware_common_la-util.o): plugin needed to
> > > handle lto object
> > >
> > > This was with phosphor-ipmi-flash, building for the tool.  When
> > > building for the BMC library it also builds those objects, but does so
> > > without issue.  It seems to detect it automatically or favor it
> > > already:
> > >
> > > checking for arm-openbmc-linux-gnueabi-ar... (cached)
> > > arm-openbmc-linux-gnueabi-gcc-ar
> > > checking for archiver @FILE support... @
> > > checking for arm-openbmc-linux-gnueabi-strip... (cached)
> > > arm-openbmc-linux-gnueabi-strip
> > > checking for arm-openbmc-linux-gnueabi-ranlib...
> > > arm-openbmc-linux-gnueabi-gcc-ranlib
> > >
> > > So it seems flto-automake is obsolete?
> > >
> > > If that's the case, I can 1) drop the change from phosphor-pid-control
> > > (the only user) and 2) drop the bbclass.
> > >
> > > However, I was wondering what in the SDK could be used to inform it.
> > > I ended up getting past this by adding the information to the
> > > configure line, and that worked fine.
> > >
> > > Patrick
> >
> > It's my first time to notice that we have flto-automake.bbclass for general
> > purpose, looks good!
> >
> > But in your case, if you are building phosphor-ipmi-flash in SDK, it has
> > nothing to do with .bbclass, and you got the above issue.
> >
> > One possible solution is to speicify the AR/RANLIB in configure.ac, see
> > example in
> > https://github.com/openbmc/phosphor-time-manager/blob/master/configure.ac#L9-L11
> >
> > I do not know if we have better solutions though.
