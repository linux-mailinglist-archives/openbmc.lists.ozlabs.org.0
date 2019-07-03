Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E825EA68
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2019 19:25:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45f7KC3v44zDqV6
	for <lists+openbmc@lfdr.de>; Thu,  4 Jul 2019 03:25:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="BD524Jhx"; 
 dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45f73r3FwMzDqFY
 for <openbmc@lists.ozlabs.org>; Thu,  4 Jul 2019 03:13:28 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id m30so1582889pff.8
 for <openbmc@lists.ozlabs.org>; Wed, 03 Jul 2019 10:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=imPLNfBLp3k+4YEPq7FzAO7MvwMpLk0WVIWB5h992Zg=;
 b=BD524JhxssfZvptuLw7myFSPu9T5tCiBXjC+2nRMdiIgVIX/mm8sXXVE2OKGRJYdFU
 dpNl2HPuA3hpLNS4HvU4tuwS77apxUxehSezvlrWZi8EgQHr1jAeS3dfUBV+Y/FYGGPI
 pArRSrbPMK1VB+N4h/N2E1SwmziGMXDW4qyM21+5nCM1nIsrCPHxs6AGDFWcOU7/+f4m
 tvotd2Q8nNzby0xtnInnzjvwIVHYyeJJBPGcv/8Lqhi7j/dYXoKoZQB9aeW43M7EnCXQ
 fFsESGYhhaq2pF6+DpulVXJgSd/ck4v6vDSbzCiYOXFy6DArI+WnTPXu3lJHu1kXpsUj
 V2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=imPLNfBLp3k+4YEPq7FzAO7MvwMpLk0WVIWB5h992Zg=;
 b=pTh1DrvtfjzmiJUl3Mmha4EqNHJYf4i4uQQ+qDS1wMIRlh7V0ZsrYXTFXQdy+jDabs
 xHBKjmRbdFpYwfe02uVBXJ+nYVd3gY3T3mDteHBIfzScNvSqtsPOdvpGRzIp0G3VXNjW
 6RqpKcj6ykPEz/U8HObYvqKHdgjTQ+YXq+MpnJLKGFH3H2tGtHd0ASHGhLGycmuAeFbM
 sdc4S32XS7/Dp/skcbGZpKKPgsHLnl798vmv9EaMD05LvShRpjs6bvv1WAnAXq2ruq+V
 x9X9ztWE+OrFpucLHJj9klzV7sQKXjxf+/gnlT5BA02pAo7SpAmyXhFnmK36h2/jF3yH
 aa9Q==
X-Gm-Message-State: APjAAAXrCb3KP6sjBgq2fWNxbbFjjWRLQER8uNP8JTu+EhDEqopkhb7l
 A6+stpbZAx8ZRtcLyWESTuKeKF0xQ4phKsezbHEL4w==
X-Google-Smtp-Source: APXvYqyMeHjUxCBUtBlMk1TIV3JUFtWPZen2Jp8cttwZxjkvZhM657STsLrt9nH3eWpp9PfJtWNrFv56mxZX/swFtWU=
X-Received: by 2002:a17:90a:23a4:: with SMTP id
 g33mr14360396pje.115.1562174003391; 
 Wed, 03 Jul 2019 10:13:23 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Wed, 3 Jul 2019 10:13:12 -0700
Message-ID: <CAO=notxEsabCU_2U+ooZrkrYqM+yC8YWXs-1tmdGha6kzifkyg@mail.gmail.com>
Subject: Upstream Support for flto plugin with automake
To: James Feist <james.feist@linux.intel.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 William Kennington <wak@google.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Only one recipe currently uses flto-automake which provides for the
gcc-ar and gcc-ranlib replacements to build with the flto option.
IIRC, James added this because phosphor-pid-control required them to
compile.  Many (if not all) Makefiles in openbmc pass in the flto
option, and seem to compile fine.

I did some light documentation reading on this feature and as I
understand it, when objects are compiled with this they're left in a
state to improve final "total optimization" during linking.  So,
perhaps in the cases where it compiles without the flto-automake swap
it's not actually able to take advantage of this during compilation?

I ran into an issue today while debugging an SDK issue:
x86_64-openbmc-linux-ar:
.libs/libupdater.lax/libfirmware_common.a/libfirmware_common_la-sys.o:
plugin needed to handle lto object
x86_64-openbmc-linux-ar:
.libs/libupdater.lax/libfirmware_common.a/libfirmware_common_la-util.o:
plugin needed to handle lto object
x86_64-openbmc-linux-ranlib:
.libs/libupdater.a(libfirmware_common_la-sys.o): plugin needed to
handle lto object
x86_64-openbmc-linux-ranlib:
.libs/libupdater.a(libfirmware_common_la-util.o): plugin needed to
handle lto object

This was with phosphor-ipmi-flash, building for the tool.  When
building for the BMC library it also builds those objects, but does so
without issue.  It seems to detect it automatically or favor it
already:

checking for arm-openbmc-linux-gnueabi-ar... (cached)
arm-openbmc-linux-gnueabi-gcc-ar
checking for archiver @FILE support... @
checking for arm-openbmc-linux-gnueabi-strip... (cached)
arm-openbmc-linux-gnueabi-strip
checking for arm-openbmc-linux-gnueabi-ranlib...
arm-openbmc-linux-gnueabi-gcc-ranlib

So it seems flto-automake is obsolete?

If that's the case, I can 1) drop the change from phosphor-pid-control
(the only user) and 2) drop the bbclass.

However, I was wondering what in the SDK could be used to inform it.
I ended up getting past this by adding the information to the
configure line, and that worked fine.

Patrick
