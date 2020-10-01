Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D70CD28093E
	for <lists+openbmc@lfdr.de>; Thu,  1 Oct 2020 23:12:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C2Qmw53dVzDqcS
	for <lists+openbmc@lfdr.de>; Fri,  2 Oct 2020 07:12:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=fPG28hR3; dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C2Qls53spzDqbr
 for <openbmc@lists.ozlabs.org>; Fri,  2 Oct 2020 07:11:16 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id a2so88863otr.11
 for <openbmc@lists.ozlabs.org>; Thu, 01 Oct 2020 14:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m+YYuOGfjR+pz1ug1JOX4HfqWyfMVXMcD5ez2Q2W6EY=;
 b=fPG28hR3+ElDHaok1coAb15VBGOxPHvavjn1+R2FlD8REunHXkZlvsDfEGH9wiQaF2
 KvyY8Ze9/EThbpGscdJNDIMWBpg1/2tElBbq/9omzMP3EN6TPdZwGn649zkEKiVJ9Jwb
 W1jn97DnlnWyxRMBeA/fcnGrMzGABs4bb/r0g3jh7kYB2xorJADT8psq/Y+vsSmA+Y1K
 GaZhSJxk2gh2zpHyYVRCwUGmC8gdakJGc8PlRiK4gcJk0ihVf+ZuwNaG0NqHAQasV+zI
 xT7cOItLxZKesH2VycqKmgqh9slqqANIseUSv/Rk3cmRVp7zznL2PQBH+5DygN1ldF8o
 RueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m+YYuOGfjR+pz1ug1JOX4HfqWyfMVXMcD5ez2Q2W6EY=;
 b=X6Hy6uM2HNtARzjAj2tC511F9+eLYXEu3mfZ9ONOB0LztYZyJs4wauYtkHYODY+6Ci
 VJ9Z0NMdjo2anWj+mkORtoTfTUexU/Ox0zjbqsK1w17osZtFwDGb1Uh7M3GPGd3P6K+u
 QKCtzDixm3hZZjuZGKPwGwjpu9R7kuLivMZ4txkNCtHc46uxbLd/rOkiD1s24/uhzWhX
 qU+Oo8sVobKe+SN7SmtdKhXUG2RQwuNYvV+M79yPhIde0W4kWFBUuRKmgj6MWejqE/GC
 wCZwc+94Gj+UhRs6QGGKtO/3nWWkzWQNAS5EvKg7WQmrswHPpgKHN+jIcJwmxgKLJPLj
 OXMw==
X-Gm-Message-State: AOAM531JBPC4d2U0P5rpcLuX2cw5dd+WyyHj9pwTG/0XJC1SnSTMpNqI
 bHgM2jWHh1Cj5ZgkKuO9SZs+CsGqsAnutNY6ZcV2Fw==
X-Google-Smtp-Source: ABdhPJxGJ6qQVW6nndRug8X+BSvf0baEKqe+DQDcXeAnDZDLc7BtQWlfudbLCsaMAbs7xkE+Dw/9iUIJKsv6dsfPnXs=
X-Received: by 2002:a9d:7448:: with SMTP id p8mr6252420otk.306.1601586673364; 
 Thu, 01 Oct 2020 14:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200930071342.98691-1-tali.perry1@gmail.com>
 <20200930093117.GY3956970@smile.fi.intel.com>
 <CAHb3i=sWxiVLCC0hfY+6-_x92ZEMY7Ctyyuz9CbMYxrH_BqAZQ@mail.gmail.com>
 <CAHp75Vc3Bw-dTpEmpeUpB4n5-8-xGPx+jm_HkB5Pj6Qr8U=CAw@mail.gmail.com>
 <CAKKbWA4gHobXFGi5CiPnawWoMOi0GFrCbzanuOFZ+Aky6=9Mpg@mail.gmail.com>
 <20201001174046.GK3956970@smile.fi.intel.com>
 <CAA_a9xL+qP3zOy=oKHjCuR+CvsXeoU5EX9WgEhUH0Fza2Vs5DA@mail.gmail.com>
 <CAKKbWA62G+B7p-bc7TRoa22iJNGdTUaopQVj3S3_FHh43ntasA@mail.gmail.com>
 <CAHp75Ver-O8=3eKHsHoKgpdd0sBQhLiC+UAqM=4C-gUfMBteuA@mail.gmail.com>
In-Reply-To: <CAHp75Ver-O8=3eKHsHoKgpdd0sBQhLiC+UAqM=4C-gUfMBteuA@mail.gmail.com>
From: Alex Qiu <xqiu@google.com>
Date: Thu, 1 Oct 2020 14:11:02 -0700
Message-ID: <CAA_a9xL98fV8Rd=vBLBZBcFCUo8iE6O=Q4WsOcB0Z-tFa1GtoQ@mail.gmail.com>
Subject: Re: [PATCH v1] i2c: npcm7xx: Support changing bus speed using debugfs.
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
Cc: Benjamin Fair <benjaminfair@google.com>,
 Avi Fishman <avifishman70@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 1, 2020 at 11:51 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> I see. So, there are following statements:
>  - the elaboration is good but I guess needs to be added somewhere in
> form of the documentation
>  - the internal schedules or so are not crucial for the upstream (it
> rather sounds like a bribing the judge)
>  - the current approach, if I'm not mistaken, is using debugfs, which
> is not ABI and it's good
>  - I'm not a maintainer here, but I don't like the approach
>
> Let the maintainer decide.
>
> --
> With Best Regards,
> Andy Shevchenko

Hi Andy,

That makes perfect sense. We may keep it downstream to unblock our own
work if it's not accepted upstream. Thanks for your review!

- Alex Qiu
