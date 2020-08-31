Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE002574E7
	for <lists+openbmc@lfdr.de>; Mon, 31 Aug 2020 10:01:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bg2hy1tQ3zDqTM
	for <lists+openbmc@lfdr.de>; Mon, 31 Aug 2020 18:01:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d42;
 helo=mail-io1-xd42.google.com; envelope-from=avifishman70@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AOdCeQxT; dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bg2dv0tKVzDqSM
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 17:58:58 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id l8so4955281ios.2
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 00:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZGpi+5qwZTXlfGi+xb+oDjdA7kPA3G9h6znjI9BQew0=;
 b=AOdCeQxT2jAza4/PKUwlGY32t9Nu7VJ5ktqVkH9a1b+k0F12J3MfmkECzbTg4jufCA
 jCLvQ2XJtHbIS7gI8U9W7STv4m4hPisAQzGqLu7M/q/P0enBWtyOWHIHtgGAufrSB7dg
 tBqkJuASBrVp+c5X0GQPi5qcvxUNK7P/wxe4Vkx+HCr6visW3UrptXnjGezadJCgGNwe
 /W6hhR4r5K9nnR3Rvj9IhbSYddF5UfI0wyYgXi4vjl5iID0mdpVHCiB82Z9WXdLmZvhQ
 eP8hGLezFV+mc0u9s8IQQdaMS43NOxx+B/DkjqKmXCoN3P2VLa1bEwwm+iD/z9qZ3DP+
 d0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZGpi+5qwZTXlfGi+xb+oDjdA7kPA3G9h6znjI9BQew0=;
 b=VuyvvzIKiEkPn38+jAD8WvTcNkswPXLcqgiXDerKkYR7+GThwJp+PZix4w3HO0i6kH
 vzTiTZQcvfsS2BDzEw4h2qCrC4yhET7VzPnleBBxvUSKUrGmXbYFrkjHfsWRTZ1mgEnD
 LTlnrgme3IUZy+6ykQFxMEjWx1aqTmbCidTPlpDMLE/a4WZGSkMJE+hWofeG+i6LjP7G
 ayNriIyLsZLWFSwxcI6QnnH2sovOybTgF2ibEdXnJjj1j9A6hrvrJrAQh2DqoSYyoNIC
 ZXqP5tYqgcC/bDzdhsPPpXaP0kpOUbfmUPRWsuaS8B5MOQGE6nMQne+B0zMgoIb+1sc2
 0U4Q==
X-Gm-Message-State: AOAM533Kw3ZJMDkGdDIfA2GqF24ltX8hjfUsOHj6Po8cHJ2XnVMexjwP
 iB1dXmTagNOwgCuQpjmPsKXLXLEaiu2l+kMCzA==
X-Google-Smtp-Source: ABdhPJyzPNmQVuqnQsiy0uTVTWNT0Qbgcw6B7+74VyKPKvBv+1lPzo8yJnHlFDeW92m9d2egkd4N7kv/NrWlfHp+aTI=
X-Received: by 2002:a5d:954f:: with SMTP id a15mr361144ios.53.1598860733041;
 Mon, 31 Aug 2020 00:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200830122051.197892-1-tali.perry1@gmail.com>
 <CAHp75VeX7OUeF=K_NmtXU4LACS9MxN1=nbSn01rvy-1MXoBL3Q@mail.gmail.com>
In-Reply-To: <CAHp75VeX7OUeF=K_NmtXU4LACS9MxN1=nbSn01rvy-1MXoBL3Q@mail.gmail.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Mon, 31 Aug 2020 10:57:31 +0300
Message-ID: <CAKKbWA46wSmvRshtMcShg8ka6aR2rYaB9b70EEYdQAHzJ=700g@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: npcm7xx: bug fix timeout (usec instead of msec)
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
Cc: xqiu@google.com, Benjamin Fair <benjaminfair@google.com>,
 Wolfram Sang <wsa@the-dreams.de>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, linux-i2c <linux-i2c@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Aug 30, 2020 at 9:01 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sun, Aug 30, 2020 at 3:23 PM Tali Perry <tali.perry1@gmail.com> wrote:
>
> >
> > i2c: npcm7xx: bug fix timeout (usec instead of msec)
>
> This commit message is awful. Please read [1] as a tutorial how to
> write a commit messages.
>

Would this be better:
i2c: npcm7xx: Fix microsecond timeout calculation

Inside npcm_i2c_master_xfer() we calculate a timeout for the entire
transaction in microseconds, the calculation was wrong so big i2c
massages would timeout before they ended.
This commit fix that.

> [1]: https://chris.beams.io/posts/git-commit/
>
> ...
>
> > -       /* Adaptive TimeOut: astimated time in usec + 100% margin */
> > -       timeout_usec = (2 * 10000 / bus->bus_freq) * (2 + nread + nwrite);
> > +       /*
> > +        * Adaptive TimeOut: estimated time in usec + 100% margin:
> > +        * 2: double the timeout for clock stretching case
> > +        * 9: bits per transaction (including the ack/nack)
>
> > +        * 1000000: micro second in a second
>
> No need. See below.
>
> > +        */
>
> > +       timeout_usec = (2 * 9 * 1000000 / bus->bus_freq) * (2 + nread + nwrite);
>
> USEC_PER_SEC

OK

>
> >         timeout = max(msecs_to_jiffies(35), usecs_to_jiffies(timeout_usec));
> >         if (nwrite >= 32 * 1024 || nread >= 32 * 1024) {
> >                 dev_err(bus->dev, "i2c%d buffer too big\n", bus->num);
>
> --
> With Best Regards,
> Andy Shevchenko



-- 
Regards,
Avi
