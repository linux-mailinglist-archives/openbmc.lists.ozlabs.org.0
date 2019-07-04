Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0498E5F18C
	for <lists+openbmc@lfdr.de>; Thu,  4 Jul 2019 04:39:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45fMd60KZwzDqYk
	for <lists+openbmc@lfdr.de>; Thu,  4 Jul 2019 12:39:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dctsa4yG"; 
 dkim-atps=neutral
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45fMbc6gJxzDqc8
 for <openbmc@lists.ozlabs.org>; Thu,  4 Jul 2019 12:38:20 +1000 (AEST)
Received: by mail-io1-xd30.google.com with SMTP id u13so5315648iop.0
 for <openbmc@lists.ozlabs.org>; Wed, 03 Jul 2019 19:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xXf8QtSnasO1ZWusny6TvnduVN5Xgetr8WONv1DkQCM=;
 b=Dctsa4yGHPj0vCpW/bhzn+lBmtCypM+ELbqpbc0HTL+Zmb56Lru26ORh6UQKBKOc+7
 4Nunpto25UHbg+oUWCbev4NGYXSBM1L4PFh3elDTWogOqcX6ROdoSNe5RXdYbQwzeLmD
 I+JybzxQWOteSV6+AIaZ4WwyHsRXvwMB4oB3jrOmR9h/wGItPMs9XE1A51FlHRy7nSHs
 erRslAUdovUqn4zKQDk0llZzTQsnqitDcLlFT8ya+srL96k4bMIpw3wL3iaHpdN04GZo
 YLvYaIcC1YxoqJrWDiANAtFAOSa7KvQr57LBud22NAlkzCmaOA/RfDkoljvr2QdvpePf
 vU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xXf8QtSnasO1ZWusny6TvnduVN5Xgetr8WONv1DkQCM=;
 b=qtuBOPH9CSihtgszAn1ZuBd3CcoRrGYidZVibW0CqA8xcFwsicGI9p9199CY761yQ3
 +P9SfxEeUuqt6vvJO6kQqGtfmdsD1YYIgDh/hOO7js5ZtHvztgWGEVLMIoNBjqwmDFCz
 EHbugpgagORsq62z1qR9cUlI5MaPyL6TRkwi4W5k63KsNJH+FOqL7B5J26S26j77u1yX
 PLRaQc7/ekzKpAbwmM70piVv9gzv1mbYOfHC2d8rbee57jEdVVhUjOHsHS3kZiYZpseD
 ++4QUsf8oDbE8eHOjeGfoHI/bl7tmj7yIPeOULjOxmrlyqdl9Bs6Cj/+sJBItDF+oREM
 79xw==
X-Gm-Message-State: APjAAAVU1bbk27nyJxzoPaNrnoYeKTiRYx6zK/GZNzILLyrP/f0RRc2t
 HmTYdrzoYyRrow0D/jjHUu84mCGSK329r2ka5mQ=
X-Google-Smtp-Source: APXvYqyI6iQ2woP70hj907a0CI7awyipQk8JZ52+cPuiYc/KugXKN8maaPr0/w2gOydbpRXx9680i7Lx4Mjkk5UxIfM=
X-Received: by 2002:a6b:e615:: with SMTP id g21mr12756169ioh.178.1562207897641; 
 Wed, 03 Jul 2019 19:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxEsabCU_2U+ooZrkrYqM+yC8YWXs-1tmdGha6kzifkyg@mail.gmail.com>
In-Reply-To: <CAO=notxEsabCU_2U+ooZrkrYqM+yC8YWXs-1tmdGha6kzifkyg@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Thu, 4 Jul 2019 10:38:06 +0800
Message-ID: <CAARXrt=v=288DTkLJuQ9bM7svt5aX0TNmQs8YFbkGiwcvoyZ3g@mail.gmail.com>
Subject: Re: Upstream Support for flto plugin with automake
To: Patrick Venture <venture@google.com>
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

On Thu, Jul 4, 2019 at 1:25 AM Patrick Venture <venture@google.com> wrote:
>
> Only one recipe currently uses flto-automake which provides for the
> gcc-ar and gcc-ranlib replacements to build with the flto option.
> IIRC, James added this because phosphor-pid-control required them to
> compile.  Many (if not all) Makefiles in openbmc pass in the flto
> option, and seem to compile fine.
>
> I did some light documentation reading on this feature and as I
> understand it, when objects are compiled with this they're left in a
> state to improve final "total optimization" during linking.  So,
> perhaps in the cases where it compiles without the flto-automake swap
> it's not actually able to take advantage of this during compilation?
>
> I ran into an issue today while debugging an SDK issue:
> x86_64-openbmc-linux-ar:
> .libs/libupdater.lax/libfirmware_common.a/libfirmware_common_la-sys.o:
> plugin needed to handle lto object
> x86_64-openbmc-linux-ar:
> .libs/libupdater.lax/libfirmware_common.a/libfirmware_common_la-util.o:
> plugin needed to handle lto object
> x86_64-openbmc-linux-ranlib:
> .libs/libupdater.a(libfirmware_common_la-sys.o): plugin needed to
> handle lto object
> x86_64-openbmc-linux-ranlib:
> .libs/libupdater.a(libfirmware_common_la-util.o): plugin needed to
> handle lto object
>
> This was with phosphor-ipmi-flash, building for the tool.  When
> building for the BMC library it also builds those objects, but does so
> without issue.  It seems to detect it automatically or favor it
> already:
>
> checking for arm-openbmc-linux-gnueabi-ar... (cached)
> arm-openbmc-linux-gnueabi-gcc-ar
> checking for archiver @FILE support... @
> checking for arm-openbmc-linux-gnueabi-strip... (cached)
> arm-openbmc-linux-gnueabi-strip
> checking for arm-openbmc-linux-gnueabi-ranlib...
> arm-openbmc-linux-gnueabi-gcc-ranlib
>
> So it seems flto-automake is obsolete?
>
> If that's the case, I can 1) drop the change from phosphor-pid-control
> (the only user) and 2) drop the bbclass.
>
> However, I was wondering what in the SDK could be used to inform it.
> I ended up getting past this by adding the information to the
> configure line, and that worked fine.
>
> Patrick

It's my first time to notice that we have flto-automake.bbclass for general
purpose, looks good!

But in your case, if you are building phosphor-ipmi-flash in SDK, it has
nothing to do with .bbclass, and you got the above issue.

One possible solution is to speicify the AR/RANLIB in configure.ac, see
example in
https://github.com/openbmc/phosphor-time-manager/blob/master/configure.ac#L9-L11

I do not know if we have better solutions though.
