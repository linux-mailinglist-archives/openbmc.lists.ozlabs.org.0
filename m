Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A79CC465D6D
	for <lists+openbmc@lfdr.de>; Thu,  2 Dec 2021 05:30:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4NKt3d8kz304v
	for <lists+openbmc@lfdr.de>; Thu,  2 Dec 2021 15:30:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=ep2tyg/a;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f29;
 helo=mail-qv1-xf29.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=ep2tyg/a; dkim-atps=neutral
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4NKT5P5dz2xDT
 for <openbmc@lists.ozlabs.org>; Thu,  2 Dec 2021 15:30:03 +1100 (AEDT)
Received: by mail-qv1-xf29.google.com with SMTP id jo22so23832098qvb.13
 for <openbmc@lists.ozlabs.org>; Wed, 01 Dec 2021 20:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bGCeikFSnVN8dKwJOvIvDzC/KJwmdObCCAzrzpCAJ/E=;
 b=ep2tyg/axtHnJq6lnmrdZs8eNm+xbpSxf7+cWlCu7wV6drt9PjMvbkZpvbty/9Dfte
 21n/Th92jFH9tZN2V++oInh+pBLNXAZTpOl8QrgHaDUqkAqaNEX02wDIYmC1yj4fS5kL
 dBI+jEKrgvPC+fSpSQzoPDArbmymd7vnvpUu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bGCeikFSnVN8dKwJOvIvDzC/KJwmdObCCAzrzpCAJ/E=;
 b=5ETfkJTedUze6UXkmiRtm6lDwk7H/UXzxyiLovp/XCyEeTu3iU583/WNJwKV9GU+qh
 e0feID9rqVc5PatNXpIGmbkRWdwpDdFEs+B/+yfvc8W8e9/nTzFejNn3F//okWDwqwAa
 Uu2Yf2aa29gh2Py+u2ScMcH5+Mk3EOQSqlKBYUtYdyw7YXGNJAU6X9oqj5p6QZ7ESMGc
 03zP8KSfWv+lNo1aDYFmmDN/q3Xvp7KVNKzP7+8kfMzVJ91bR/y48jF9jY89sULG//aW
 U0UqxROqHlwHSF4oQFgOMZ0gm+5PzCeWg1ziR0uELPaxhxUpADU2GxsrQ4R4j6rDNpJc
 RCTg==
X-Gm-Message-State: AOAM531ryPasiS8gImI/6Ps6I+SxV7Zavugj6IyvGCbLCNRn9FTGrwmu
 LpAe1nbYrF8SromLf5+dk6+CmElSUjLaM/Pqimw=
X-Google-Smtp-Source: ABdhPJy9YCb0OsP8aRyRht0rMpOWft/kYkSw1s90maipTvcAICcfj7+aCxTMF4SkGD2KALddT9nXHXyH8pn1qBCU8ck=
X-Received: by 2002:a0c:c246:: with SMTP id w6mr10924727qvh.130.1638419400288; 
 Wed, 01 Dec 2021 20:30:00 -0800 (PST)
MIME-Version: 1.0
References: <20211201072902.127542-1-joel@jms.id.au>
 <CAMRc=McG0stAC_v9_oLjwXa4=nyJVpmuyi2eVWCFA+NW9mWibg@mail.gmail.com>
In-Reply-To: <CAMRc=McG0stAC_v9_oLjwXa4=nyJVpmuyi2eVWCFA+NW9mWibg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 2 Dec 2021 04:29:47 +0000
Message-ID: <CACPK8XcEhsz8Xk2m7bdPaFnwQ3BrKTH80r-ir_qwngTZ+FmGBQ@mail.gmail.com>
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
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 1 Dec 2021 at 08:29, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Wed, Dec 1, 2021 at 8:29 AM Joel Stanley <joel@jms.id.au> wrote:
> >
> > Systems provide line names to make using GPIOs easier for userspace. Use
> > this feature to make the tools user friendly by adding the ability to
> > show the state of a named line.
> >
> >  $ gpioget --line-name power-chassis-good
> >  1
> >
> >  $ gpioget -L pcieslot-power
> >  0

> I'm not very convinced to be honest. It's not like "gpioget gpiochip0
> `gpiofind gpiochip0 line-name`" requires much more typing than
> "gpioget gpiochip --line-name=name".

I'm taking on feedback from people working in our labs, and
implementing userspace applications. We've been building BMCs with
mainline Linux for about six years now, and it's been a long road
re-training them from "back in the day we just did devmem <this>
<that>" and "why can't we just do cat /sys/class/gpio/gpio305/value",
and now "why does the level of the GPIO change back after I run the
command?".

This usability improvement is one more step towards them using and
being happy with the "new world" of the gpiod API.

Once we settle on a good API here, I plan on submitting a version of
gpioget/gpioset added to busybox.

> There are also other questions:
> this uses getopt and only allows to specify a single line name. What
> if we want to specify more lines like with offsets? Even if you allow
> multiple names, getopt() doesn't guarantee ordering of arguments.

If you're happy with the concept I'm happy to iterate on the implementation.

Yes, it only allows a single line name. That tends to be how the tool
is used, both from the command line and in scripts.

Can you give me an example of your proposed command line API, so I can
understand what you're suggesting here?

Cheers,

Joel
