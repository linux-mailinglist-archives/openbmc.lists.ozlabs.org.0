Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7611738BAB5
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 02:11:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmRpp2hs0z3bV0
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 10:11:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=dMifFK5m;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::229;
 helo=mail-lj1-x229.google.com; envelope-from=dwaipayanray1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dMifFK5m; dkim-atps=neutral
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm3zy6Rmjz2yj1
 for <openbmc@lists.ozlabs.org>; Thu, 20 May 2021 19:17:48 +1000 (AEST)
Received: by mail-lj1-x229.google.com with SMTP id b12so11609052ljp.1
 for <openbmc@lists.ozlabs.org>; Thu, 20 May 2021 02:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q5NNCzIDPxqo067q//hI06QgTQ23wAipeV7AqsspEK8=;
 b=dMifFK5mrbM1Aw7kDsK+Jze9zdTq/tR03g+XfLe9dj0vGZWFlJZ5I6cO3SH8ZxIpK4
 BlL1K81BNi6yCiJ8kMxf1iWv84QmbdXSor1jjZB9BQUWSB9Eo0hvyfmNnLehYDUjsX4A
 n1vAw1n8c56zTAQzKtULbGBYm/IE6e6ZZXIMvs3xe8xEtESi4ZDcDT8OSE+eUyFCFEaX
 nXPMitLkndG5KIAdZ5mfbG0tTDrjvgvTQow29im9268oVqNi/y3ECdVGdx+b1IJKHV8f
 bhWKtdxw6uGU5Wu/P1+qAmrTvU/kfhTkY6yCF6PQkz5s/JqhOgeclwYhX4GLKXljBWO6
 pPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q5NNCzIDPxqo067q//hI06QgTQ23wAipeV7AqsspEK8=;
 b=aOKtELLyrbF4nfd2yAnnQzGB3GO49ukexcZCJscoJ7oSY+CwCudrts+TKQAoQR5oFu
 I4tNSjBItOP7vOuFH+Bj4JOBakJos0BXGCwiy9lrDJpgMZR2IVkmyrvzJgsA5+JIfzIM
 uSFnq9g9HeezvRCkLYb0I8kvZImlpoLzUZqzV0lvSCUMVUgWhz9+p8Bv7QROWC3RHDRg
 Wwo0TnJht0OQBWuhNaNSG3Vnd0n7XsvxejMaN+5r4eP6ziPXmGFv/HQ/aCccTiEDyD3u
 qFuP4FdVwyhPEPgMzfVP95ZBAc4uPkOeah2TPXUBdGAiwxha3WWC/nJRTEPp18ANSPLO
 H9PQ==
X-Gm-Message-State: AOAM5329F/Bh457V0dqoRERHIYfeTVYnyv4Yuj0s9Ac2USVmgDuc7mDs
 vNah9lBWY7DznGvzGRO1ipTM7Znc8RWLFf+CseA=
X-Google-Smtp-Source: ABdhPJz4WFFNBnmNgryAJqy1rEQkzpS2J5xI4uNUIVb52y/tSHKTrUi6aO0f+Xw7ZYW8JsoC08GKWLqwhdT2s0mVxSs=
X-Received: by 2002:a2e:8903:: with SMTP id d3mr2359627lji.373.1621502261149; 
 Thu, 20 May 2021 02:17:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210520015704.489737-1-andrew@aj.id.au>
 <CAKXUXMxTnz6edBLpBgqOo6uUiSGm8rULH9P8G24xx2OhP_Yb6A@mail.gmail.com>
 <a0d1f44a-c8ff-4108-af34-6455b5683262@www.fastmail.com>
In-Reply-To: <a0d1f44a-c8ff-4108-af34-6455b5683262@www.fastmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 20 May 2021 14:47:28 +0530
Message-ID: <CABJPP5C7ZokRycaE0aAvUv3BfOJqOvPyqn-P0bbPdyCfnuuESw@mail.gmail.com>
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
Cc: Jonathan Corbet <corbet@lwn.net>, openbmc@lists.ozlabs.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 20, 2021 at 12:55 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Thu, 20 May 2021, at 16:28, Lukas Bulwahn wrote:
> > On Thu, May 20, 2021 at 3:57 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > >
> > > While include/linux/bitops.h brings in the BIT() macro, it was moved to
> > > include/linux/bits.h in [1]. Since [1] BIT() has moved again into
> > > include/vdso/bits.h via [2].
> > >
> > > I think the move to the vDSO header can be considered a implementation
> > > detail, so for now update the checkpatch documentation to recommend use
> > > of include/linux/bits.h.
> > >
> > > [1] commit 8bd9cb51daac ("locking/atomics, asm-generic: Move some macros from <linux/bitops.h> to a new <linux/bits.h> file")
> > > [2] commit 3945ff37d2f4 ("linux/bits.h: Extract common header for vDSO")
> > >
> > > Cc: Jiri Slaby <jirislaby@kernel.org>
> > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> >
> > Looks sound to me.
> >
> > I would prefer a bit of word-smithing the commit message by just
> > removing the references:
> >
> > So:
> >
> > > While include/linux/bitops.h brings in the BIT() macro, it was moved to
> > > include/linux/bits.h in commit 8bd9cb51daac ("locking/atomics, asm-generic: Move some macros from <linux/bitops.h> to a new <linux/bits.h> file"). Since that commit, BIT() has moved again into
> > > include/vdso/bits.h via commit 3945ff37d2f4 ("linux/bits.h: Extract common header for vDSO").
> > >
> > > I think the move to the vDSO header can be considered a implementation
> > > detail, so for now update the checkpatch documentation to recommend use
> > > of include/linux/bits.h.
> > >
> >
> > And then drop references [1] and [2].
> >
> > Andrew, what do you think?
>
> I mostly did this because initially I wrapped the commit message and
> checkpatch spat out errors when it failed to properly identify the
> commit description for [1]. But, leaving the description unwrapped
> inline in the text feels untidy as it's just a work-around to dodge a
> shortcoming of checkpatch.
>
> With the reference style the long line moves out of the way and
> checkpatch can identify the commit descriptions, at the expense of
> complaints about line length instead. But the line length issue was
> only a warning and so didn't seem quite so critical.
>
> While the referencing style is terse I felt it was a reasonable
> compromise that didn't involve fixing checkpatch to fix the checkpatch
> documentation :/
>

Hey,
Can you share which wrap around caused the checkpatch errors
to be emitted? We can try to fix that.

I was able to wrap it without checkpatch complaining. You might consider
replacing it with this if you wish?

While include/linux/bitops.h brings in the BIT() macro, it was moved to
include/linux/bits.h in commit 8bd9cb51daac ("locking/atomics, asm-generic:
Move some macros from <linux/bitops.h> to a new <linux/bits.h> file").

Since that commit BIT() has moved again into include/vdso/bits.h via
commit 3945ff37d2f4 ("linux/bits.h: Extract common header for vDSO").

I think the move to the vDSO header can be considered an implementation
detail, so for now update the checkpatch documentation to recommend use
of include/linux/bits.h.


Thanks,
Dwaipayan.
