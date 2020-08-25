Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0ED251D5A
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 18:40:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbZV65hkpzDqYV
	for <lists+openbmc@lfdr.de>; Wed, 26 Aug 2020 02:40:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=db389qLS; dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbZTD5qr7zDqXD
 for <openbmc@lists.ozlabs.org>; Wed, 26 Aug 2020 02:39:25 +1000 (AEST)
Received: by mail-yb1-xb30.google.com with SMTP id x10so7478791ybj.13
 for <openbmc@lists.ozlabs.org>; Tue, 25 Aug 2020 09:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=n+3Gv2/mp829YrrNlrwBmFasCwghGAr6coX6UpixNuE=;
 b=db389qLSTHsSCZw2JPiUCpxjHs/bUF+B6kqpeyJShKAtCTyAtzE79xjlj2gJkt3k2a
 ONLNoLLtvt4pLtG+v3ygppJtpXKJcd63r2sv5SJ3bXCCrWkFRgKzOShCN4DIKS0RtWp8
 wBbDjafr88l3FaWT8VTyDdicmzgGoKTPO+cdylNCva+j+qDB7d38PVDrEh61XAyOzfRW
 DXO3vfBzPTD7NbG6npniz4ZEMyBBwlmGfH9fYhEqRmIh4DtZtH+DNBQlfIGRglmRPQaA
 3EIOaG6dMbVVhHa8iRPGWyor5LrCr6sUQc1QIEtBo3yXEoOX0UzbPW95LdcHa6SbyhG9
 0epA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=n+3Gv2/mp829YrrNlrwBmFasCwghGAr6coX6UpixNuE=;
 b=PQzq+HLTkgPt5dsZ3IqsOSDgoK8WiDIoeStUmpXiYWsW94iQZWwdUCUVW47o8yQXTb
 q5FLafNngmKtkv8CgsEGaB33qJ9MIAFyhfZxx+FP2/CqeAl8lT4OsNn7nbydQrtz7e2V
 IjgPyn0UjeMRkLfWcphxcX1lrTbUpkZaDJ5wmgORM8EyYXEyM69SKKZdrdkq0mp5iwFI
 jwoMuwKDVXdWYwgteZGaFvo2s1Q7CdLeuBKt/4Upi0FvlaJkuDosNeoqWgYlmj9g3F9n
 uKJ3JeWJi34ttUSCbDBFhkmlwY6QSwDNb0tMCbkVPmGvGNQq3NccPAy64s/xAfSJHQim
 SK2Q==
X-Gm-Message-State: AOAM533JA0KYTJsSm3ZlDsZRMEGM6GInhWI7S5FfUsTRz0Cm7yjWApn4
 aHxS8ktJoxHpyfPVz9yStZRdIHi0EpmElLzH0e+bqQ==
X-Google-Smtp-Source: ABdhPJzEtQqamJKDGuSQQh0B8+BZO9ZTmwHD8oc/6OGEX1v3BL0YyQAPD+tJOc++nFPTQUzKr+x7MOxDrTLh3t/4eL8=
X-Received: by 2002:a25:cc4a:: with SMTP id l71mr15667388ybf.417.1598373561655; 
 Tue, 25 Aug 2020 09:39:21 -0700 (PDT)
MIME-Version: 1.0
From: Ed Tanous <ed@tanous.net>
Date: Tue, 25 Aug 2020 09:39:10 -0700
Message-ID: <CACWQX81Lj7w3nLRmXjnbaNto6T80SwR6H1gnyXV1QWNgAKUwsA@mail.gmail.com>
Subject: bmcweb NBD proxy
To: przemyslaw.hawrylewicz.czarnowski@intel.com, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I'm looking through the nbd proxy code in bmcweb, and I'm seeing some
issues, and I'd like to understand why they were done this way.

First off, nbd proxy has its own authorization code that's been
injected, separate from the one all other handlers (including other
websocket handlers) use.  Why was this done?  It feels like a hack,
but for the life of me I can't imagine what's being hacked around.
https://github.com/openbmc/bmcweb/blob/d139c2364bec98a5da1fe803414f3b02fdcd3092/include/nbd_proxy.hpp#L288

We have other examples that existed before nbd was merged of doing
this this recommended/right way.  Here's one from obmc_console:
https://github.com/openbmc/bmcweb/blob/d4d77e399526671076936e9d9dd879dad2d24a2f/include/obmc_console.hpp#L108

Having individual handlers own their own authorization is a huge
problem for maintenance, and significantly increases the likelihood
that we make a mistake in a handler, and inject a security problem.

This came up because I started to do a security audit (like I did
regularly when I was the bmcweb maintainer) and this route popped up
as not having authorization checks, yet controlling something
important.

The patch in question is here:
https://github.com/openbmc/bmcweb/commit/250b0ebb0e8d55882fa8e6b156f88828a7ba185d
Which makes me think it _was_ a security issue prior to that patch,
which further proves the point that doing this is a bad idea.  The
commit message contains the statement: "I have chosen this approach,
as generic privilege check for all websockets introduces significant
changes in connection upgrade flow which makes implementaion vague and
caused some memory issues difficult to track down."

It sounds like this was done just for lack of wanting to debug doing
this the right/existing way?  This seems like the wrong approach, and
something we don't really want to promote for the project in general.

Does anyone have more context on this?

-Ed
