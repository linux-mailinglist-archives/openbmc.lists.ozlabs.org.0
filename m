Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 677FC2578F2
	for <lists+openbmc@lfdr.de>; Mon, 31 Aug 2020 14:06:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bg8701nFwzDqTd
	for <lists+openbmc@lfdr.de>; Mon, 31 Aug 2020 22:06:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::144;
 helo=mail-il1-x144.google.com; envelope-from=avifishman70@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KOr9Qg+p; dkim-atps=neutral
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bg85k3vCtzDqRF
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 22:04:58 +1000 (AEST)
Received: by mail-il1-x144.google.com with SMTP id t4so792395iln.1
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 05:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RVDQx/5Q8O0no/oayEfb/rYh2QGwLeWVgd4QIaQ9KVU=;
 b=KOr9Qg+p497+M09E6ouEKz4/321jfNwRllwXVHV7s8tjWJdNSkoOqR7nAFYm7KzZlp
 6sYFJ120y/KYbutta22YjS+bNwKkEY3vszYyEuv1LXnyOX28tLSaw2sEaNFovJZ1pVn7
 hTwokk2isRbexxzrPGkC5J0iu0T/hv2fJCnwcj8300Jl2pR8KfwID7gJoU4Z+wgyLo5W
 fFHT0hSt/5+QVbHorqyIbEnSf1i1hVFSeiGp8G+LltQk3+N5PXh0Ks4yuV1Ki5wXgc+z
 4x3KzQsm0OHZBZa/0wyac1ABifPbjpZs8fv+AsJzJxyz7/8d97ph4ZcaKNEV3Rjx+/ij
 EIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RVDQx/5Q8O0no/oayEfb/rYh2QGwLeWVgd4QIaQ9KVU=;
 b=lOtM/u4IFPWU6oZfj7cMTlslDv+kxbXPnLQ8m1ogxXdO3bmz/tT4CpWW8LyfECX7Z0
 Lz5aXHqjfinm6Qhe0idXq5Nr8YADux5Pt11l/rmkml9DsUeJ7bXwA8DpHq5adW3k4jtt
 VfrlvjK5dAbDLQqKAdIvzmQVo/loZ1vU09XzEHhLVqQyjO1fS3CfcJGIVYNW0QluhlBu
 J/gJXZ3VHr9s5FyJCDef70/psbtQdZ9ofQwBLMSMoPLsrs4tHQ644Y9PbZLbLXxSZoxp
 LxYlmBtzvWwgDlO6SK3C1xa0npQXlAiwZUeC1WudmYxtMKs5WKa+H7QYL1pQ48cRjHyS
 tQjw==
X-Gm-Message-State: AOAM5304nVQ6sFd/Prv7fJCyWKlaw3l5fwSuJe/8d3+qRyYgCiG5kTgW
 0jaIT0R5V4j8iAN9BT1c4S9KMJ9Nd3HAjcX1ww==
X-Google-Smtp-Source: ABdhPJy/2RxfqWBVbmptzkzs0SLRso+GGnyPPFtOv7Ss3+nNUMZKXxx9jTL+DwuB/dl6lSNIuQm1ZDA8KFbroxwksZA=
X-Received: by 2002:a92:d902:: with SMTP id s2mr968251iln.21.1598875496080;
 Mon, 31 Aug 2020 05:04:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200830122051.197892-1-tali.perry1@gmail.com>
 <CAHp75VeX7OUeF=K_NmtXU4LACS9MxN1=nbSn01rvy-1MXoBL3Q@mail.gmail.com>
 <CAKKbWA46wSmvRshtMcShg8ka6aR2rYaB9b70EEYdQAHzJ=700g@mail.gmail.com>
In-Reply-To: <CAKKbWA46wSmvRshtMcShg8ka6aR2rYaB9b70EEYdQAHzJ=700g@mail.gmail.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Mon, 31 Aug 2020 15:03:34 +0300
Message-ID: <CAKKbWA71X7BJYPJg+iheaY+qXjc3hmOUb91Hmzr4Y-KZxdM_Jw@mail.gmail.com>
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

Please ignore my last mail, Tali already sent v3.

On Mon, Aug 31, 2020 at 10:57 AM Avi Fishman <avifishman70@gmail.com> wrote:
>
> On Sun, Aug 30, 2020 at 9:01 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Sun, Aug 30, 2020 at 3:23 PM Tali Perry <tali.perry1@gmail.com> wrote:
> >
> > >
> > > i2c: npcm7xx: bug fix timeout (usec instead of msec)
> >
> > This commit message is awful. Please read [1] as a tutorial how to
> > write a commit messages.
> >
>
> Would this be better:
> i2c: npcm7xx: Fix microsecond timeout calculation
>
> Inside npcm_i2c_master_xfer() we calculate a timeout for the entire
> transaction in microseconds, the calculation was wrong so big i2c
> massages would timeout before they ended.
> This commit fix that.
>
> > [1]: https://chris.beams.io/posts/git-commit/
> >
> > ...
> >
> > > -       /* Adaptive TimeOut: astimated time in usec + 100% margin */
> > > -       timeout_usec = (2 * 10000 / bus->bus_freq) * (2 + nread + nwrite);
> > > +       /*
> > > +        * Adaptive TimeOut: estimated time in usec + 100% margin:
> > > +        * 2: double the timeout for clock stretching case
> > > +        * 9: bits per transaction (including the ack/nack)
> >
> > > +        * 1000000: micro second in a second
> >
> > No need. See below.
> >
> > > +        */
> >
> > > +       timeout_usec = (2 * 9 * 1000000 / bus->bus_freq) * (2 + nread + nwrite);
> >
> > USEC_PER_SEC
>
> OK
>
> >
> > >         timeout = max(msecs_to_jiffies(35), usecs_to_jiffies(timeout_usec));
> > >         if (nwrite >= 32 * 1024 || nread >= 32 * 1024) {
> > >                 dev_err(bus->dev, "i2c%d buffer too big\n", bus->num);
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
>
>
>
> --
> Regards,
> Avi



-- 
Regards,
Avi
