Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 826A038BAB4
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 02:10:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmRpM4t61z307C
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 10:10:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Lm4gDSJq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2c;
 helo=mail-yb1-xb2c.google.com; envelope-from=lukas.bulwahn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Lm4gDSJq; dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm0vL15N6z2yXh
 for <openbmc@lists.ozlabs.org>; Thu, 20 May 2021 16:58:35 +1000 (AEST)
Received: by mail-yb1-xb2c.google.com with SMTP id n4so2940125ybf.5
 for <openbmc@lists.ozlabs.org>; Wed, 19 May 2021 23:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OOnCvrmBVmZJvIgFsTp0MHGvpgi/wTmOhJpH9VAETjw=;
 b=Lm4gDSJqG2vlLHYaqIzBqUjvv3o692GWvO3G47R0akkLAgEXRBwntlShNPZmt74ghm
 nws0+SLM+qiy4bca7mi2DahPnFGPuN9bXp1mjqJ7jTj0+9UJr9it1fikC0MT1RwXQyhf
 AvWFeQcfKcCTO26z3HIJWcScl5mkyPehCDMCQn3pn0z51W8UVPJgLoe7vu8zZXaQmO+W
 I6gCZEvmUBu7FwaAtgBiraaYHRTz/g6SjOAvTepYvn0pTMJXxgw+M+IIBN7g0EOH7ior
 +kx+EwuOgYjt2NRVY4oLlPESzbteXcaR+EA/VKD9F2X5dUf0Sx/FkDkZZ8uX5R34dsak
 /wxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OOnCvrmBVmZJvIgFsTp0MHGvpgi/wTmOhJpH9VAETjw=;
 b=GoK3XPFv83tmqmok1Sc+KlRHiUSnuMWrxyshl+zAQyn2521GCQYJPnoUvUxWVKzMSb
 H1FbkrefWhyGD+WTuIrio4XoP9KpNj8GuHtXpnt8mxMb0VpKP5oRTXgf2+XHBj2OWCac
 pD1aHxh3xfqScxENr63J1SR+Rh6vmtWxVbX1h+fR3TSFWhlJQhiKsFLdDXIq0AG8cflA
 2IulpGNvt+hLMBjjno5Ej4kJktW9zKad0EaeAC+731Jz9V+MOJz8z7nIsuzEPt416NLl
 URA82Kijcgi/Sid1bGkn/bCg2xpfX7fhgTkrp0Pg3lifjaDVjnT0kYOB35kGQp4FBHW/
 9tFQ==
X-Gm-Message-State: AOAM5309XOHV7AMN3RKI9g6bXAuIU9aifzZKbv0H+t+vrAsQUYHzAbEg
 wCWh2iHlrKlsX6nlfceuxQFChhGe+EQRBKtuLwk=
X-Google-Smtp-Source: ABdhPJzes7jm5YzVxbSEXeWNu/17oBVCUgxdbC4mNsKxCn3j7Xc8THnPTTi32iNdIu7wBIbjGyiP4k7v2+VxuuZP+3M=
X-Received: by 2002:a25:5d08:: with SMTP id r8mr4651409ybb.464.1621493911937; 
 Wed, 19 May 2021 23:58:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210520015704.489737-1-andrew@aj.id.au>
In-Reply-To: <20210520015704.489737-1-andrew@aj.id.au>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 20 May 2021 08:58:21 +0200
Message-ID: <CAKXUXMxTnz6edBLpBgqOo6uUiSGm8rULH9P8G24xx2OhP_Yb6A@mail.gmail.com>
Subject: Re: [PATCH] Documentation: checkpatch: Tweak BIT() macro include
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 21 May 2021 10:10:39 +1000
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
Cc: Jonathan Corbet <corbet@lwn.net>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 openbmc@lists.ozlabs.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Joe Perches <joe@perches.com>, Jiri Slaby <jirislaby@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 20, 2021 at 3:57 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> While include/linux/bitops.h brings in the BIT() macro, it was moved to
> include/linux/bits.h in [1]. Since [1] BIT() has moved again into
> include/vdso/bits.h via [2].
>
> I think the move to the vDSO header can be considered a implementation
> detail, so for now update the checkpatch documentation to recommend use
> of include/linux/bits.h.
>
> [1] commit 8bd9cb51daac ("locking/atomics, asm-generic: Move some macros from <linux/bitops.h> to a new <linux/bits.h> file")
> [2] commit 3945ff37d2f4 ("linux/bits.h: Extract common header for vDSO")
>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Looks sound to me.

I would prefer a bit of word-smithing the commit message by just
removing the references:

So:

> While include/linux/bitops.h brings in the BIT() macro, it was moved to
> include/linux/bits.h in commit 8bd9cb51daac ("locking/atomics, asm-generic: Move some macros from <linux/bitops.h> to a new <linux/bits.h> file"). Since that commit, BIT() has moved again into
> include/vdso/bits.h via commit 3945ff37d2f4 ("linux/bits.h: Extract common header for vDSO").
>
> I think the move to the vDSO header can be considered a implementation
> detail, so for now update the checkpatch documentation to recommend use
> of include/linux/bits.h.
>

And then drop references [1] and [2].

Andrew, what do you think?

Lukas
