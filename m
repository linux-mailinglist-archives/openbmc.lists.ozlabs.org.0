Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F045546B334
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 07:49:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7W9c6N13z2yNY
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 17:49:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=nmqkN6GJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::735;
 helo=mail-qk1-x735.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=nmqkN6GJ; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7W9B0C8jz2xYL
 for <openbmc@lists.ozlabs.org>; Tue,  7 Dec 2021 17:48:44 +1100 (AEDT)
Received: by mail-qk1-x735.google.com with SMTP id a11so13711559qkh.13
 for <openbmc@lists.ozlabs.org>; Mon, 06 Dec 2021 22:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=23KDQH+obM9uYaG8+SZPmfqdTc3JzHgy33Qwp2KGj9U=;
 b=nmqkN6GJQY6iY8xu305xuSPtHB7J5izqwBqvR/GMHpERP6WJei6IaIInDuzJZa7Z4S
 Zwi9Lcqw44immdJvqoeLAcVPI0FGItDDKp1Y7SKGGqoN94V5w1xeW0wvozpKWGS0QR9Y
 N5HlCZhvKLxKqrfKINco5wN/w66pPX5gt/Hwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=23KDQH+obM9uYaG8+SZPmfqdTc3JzHgy33Qwp2KGj9U=;
 b=VYC887ZEdKnlgvjShqwhlvOVequc3UeigbHz2pv7C8HxxdIdvmKCthVN6723zw00LE
 2YEpFRyTMBp8t1ImhWdh+voCWi+0TJWOYDbfPUR5OXCex808NiFqi+Yap6k4j21gbWlU
 xomy4s9uMbkeCqPcxpI1vIvXbcFaLq13K1SIpH3XUULdFC8b8jW42oWfQfuGTR5xJ3vI
 o0fpgis1R+gc4Kis4K8/1isNMhxCsUlncMyKppM/9kihEcI8I5DVRA0c/d/re2fA2841
 iRTd9FDNoe9gEkF8CPN0xooRmgtiC/0kit175N6w/Fi5hR862mC9gzuwSHB5C0cSHcVX
 v63Q==
X-Gm-Message-State: AOAM531BT7WD+/jFlHSZdj4noPpN3AWKISPtrEEeC334BzKkeQ8z3tbr
 ANV2Dbm8DmMefGtH3pB4GmUXKFuWlh8mnFZA3NY=
X-Google-Smtp-Source: ABdhPJzTfy2V6TLwhEaoeh6tE5+7iiX6QmIVn7RZ9sSbPMQvg8v+lUDmpXgPg3YjJ5LnFN+ISC1Da2i90zfKZTtJNGo=
X-Received: by 2002:ae9:ef11:: with SMTP id d17mr38193980qkg.347.1638859721488; 
 Mon, 06 Dec 2021 22:48:41 -0800 (PST)
MIME-Version: 1.0
References: <20211201072902.127542-1-joel@jms.id.au>
 <CAMRc=McG0stAC_v9_oLjwXa4=nyJVpmuyi2eVWCFA+NW9mWibg@mail.gmail.com>
 <CACPK8XcEhsz8Xk2m7bdPaFnwQ3BrKTH80r-ir_qwngTZ+FmGBQ@mail.gmail.com>
 <20211203035019.GC25091@packtop>
 <56d66cf6-a05f-461f-9db5-b02b30dc12b2@www.fastmail.com>
 <CAMRc=Me26z7d26AY-UFe7T83doqXvreuEtjs1W--uJLmzKaNvA@mail.gmail.com>
In-Reply-To: <CAMRc=Me26z7d26AY-UFe7T83doqXvreuEtjs1W--uJLmzKaNvA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Dec 2021 06:48:29 +0000
Message-ID: <CACPK8XdpJP8VuDGAtpuRCVe8+GCyJe6Z_BrNcAvS_1o3RxyN1Q@mail.gmail.com>
Subject: Re: [libgpiod PATCH] gpioget: Add --line-name to lookup GPIO line
To: Bartosz Golaszewski <brgl@bgdev.pl>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>, Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 3 Dec 2021 at 10:18, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> > > My two cents: like Jeremy, I would very much welcome the ability to
> > > specify GPIOs by name instead of number, but the one-line-only
> > > limitation does seem unfortunate.  How about making a command-line flag
> > > that just means "line-specifier arguments should be interpreted as names
> > > instead of numbers"?
> > >
> > > So you could do:
> > >
> > >   $ gpioget --by-name chassis-intrusion cpu1-prochot
> > >   0 1
> > >
> > >   $ gpioset --by-name led-green=1 led-red=0
>
> I like this more - that way we either allow offsets or names. Please
> make sure corner cases are covered. If you can add this to other tools
> too, I'm fine with that, but put the name lookup code into
> tools-common.c please. I would also like to see bats test cases
> covering this.

Good plan. Thanks Jeremy, Zev, Andrew and Bart. I'll get hacking.

Cheers,

Joel
