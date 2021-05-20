Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E57F838BAB9
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 02:12:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmRrS6ZnDz3035
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 10:12:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=RpXnY12B;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b29;
 helo=mail-yb1-xb29.google.com; envelope-from=lukas.bulwahn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RpXnY12B; dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm7kf6TlFz2ym5
 for <openbmc@lists.ozlabs.org>; Thu, 20 May 2021 22:06:33 +1000 (AEST)
Received: by mail-yb1-xb29.google.com with SMTP id n4so3998362ybf.5
 for <openbmc@lists.ozlabs.org>; Thu, 20 May 2021 05:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BpnZbz1EGOrIuAMnUU3qLJnhcMy80CnQMklnM6U5PS0=;
 b=RpXnY12B54L3+4ROy8QkuQ1Vu9h+zk4PjZbv0y3FRvD+ad9TzbyN72GxGB4d2rjikO
 Tfp93Wx/ZeGJhHy6SQ/exodESiqY0D9pyXqSH1oE5kn3jw0uWjegTLoAPRbfFyVFx5Zd
 YPCwZkPFGJZdQOIMMXgXq3DV6iKhMkLu6qpr9Iz2L/PTHFjRR9QG4ssV3i4dhuMt3bYt
 oOMnY0OkX2umW2M62TSQGvSoC+oQrsRjLDLqE8IKImHqOdpwwno5voxKuVJxRQvJ0tJu
 xRWi8OSHiFkFx9tjAXbLDk0W4gWR8uaHFRoP/vTNKEZwY2iFgDx2W2d2ssON55hXGoVs
 sYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BpnZbz1EGOrIuAMnUU3qLJnhcMy80CnQMklnM6U5PS0=;
 b=gzeCxifHyO9HIHgdFkb/ZTsoA9IQsdjiYPYA6JUUHVaouvLP4IV90tX4I3hVheX/aP
 QLCAOwu6Dgwz9APr7qa7FgQuabcCewAxJoE/GHO9UyH3SBVhEJgC2PgtyqaGSxJvCOhs
 Hk+gILpdqr8jBW/SqnSK/xDW2oKUnEZgpXWTh7/9F56VTnssFW/hiF8/Vv4b6legneI0
 MCubVIomYiCdEdnzdVlcAJ9b/TIpp4cmU/2/3T3os7pfgkJD4+HAlSjoK5+2jfmZ6k7R
 T52Z8uJWsgYK/7ChIVqJrLZVc8Chkrgrx+0dXAHGFiMzdk4sAp1MtNiRH1XBVY+KgEy3
 qS4Q==
X-Gm-Message-State: AOAM532g5GIZzihv1zWQGIfg6FPmG6TZZadk57eeREWHqcVGn4DTeKvM
 jJyPzbF7eHfUP8SjdcWKX5Y+MJGaVqEeM1DEDsA=
X-Google-Smtp-Source: ABdhPJxcqHoGfDIubcpklyMLW47ufXvxtAvygG7bqSBd8EXKLuwNOUATJclwHf158J3+WUsorsyRORsNdi/mRFy+oK8=
X-Received: by 2002:a25:8b86:: with SMTP id j6mr6186342ybl.470.1621512390469; 
 Thu, 20 May 2021 05:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210520015704.489737-1-andrew@aj.id.au>
 <CAKXUXMxTnz6edBLpBgqOo6uUiSGm8rULH9P8G24xx2OhP_Yb6A@mail.gmail.com>
 <a0d1f44a-c8ff-4108-af34-6455b5683262@www.fastmail.com>
 <CABJPP5C7ZokRycaE0aAvUv3BfOJqOvPyqn-P0bbPdyCfnuuESw@mail.gmail.com>
 <72ed5aa8-bca5-451d-9458-48735fc17b84@www.fastmail.com>
 <CABJPP5AMPL22dJ2YKNqdTtHrTJRr=SKnxo05PKn9FoveNX7tow@mail.gmail.com>
In-Reply-To: <CABJPP5AMPL22dJ2YKNqdTtHrTJRr=SKnxo05PKn9FoveNX7tow@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 20 May 2021 14:06:19 +0200
Message-ID: <CAKXUXMzTiYOe9T6w_mPny8S1gBGyktSzpZ+FFPLxVTUhkTTUcQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: checkpatch: Tweak BIT() macro include
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
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
Cc: Jonathan Corbet <corbet@lwn.net>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Joe Perches <joe@perches.com>, Jiri Slaby <jirislaby@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 20, 2021 at 12:21 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> On Thu, May 20, 2021 at 3:15 PM Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> >
> >
> > On Thu, 20 May 2021, at 18:47, Dwaipayan Ray wrote:
> > > On Thu, May 20, 2021 at 12:55 PM Andrew Jeffery <andrew@aj.id.au> wrote:
> > > >
> > > >
> > > >
> > > > On Thu, 20 May 2021, at 16:28, Lukas Bulwahn wrote:
> > > > > On Thu, May 20, 2021 at 3:57 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > > > > >
> > > > > > While include/linux/bitops.h brings in the BIT() macro, it was moved to
> > > > > > include/linux/bits.h in [1]. Since [1] BIT() has moved again into
> > > > > > include/vdso/bits.h via [2].
> > > > > >
> > > > > > I think the move to the vDSO header can be considered a implementation
> > > > > > detail, so for now update the checkpatch documentation to recommend use
> > > > > > of include/linux/bits.h.
> > > > > >
> > > > > > [1] commit 8bd9cb51daac ("locking/atomics, asm-generic: Move some macros from <linux/bitops.h> to a new <linux/bits.h> file")
> > > > > > [2] commit 3945ff37d2f4 ("linux/bits.h: Extract common header for vDSO")
> > > > > >
> > > > > > Cc: Jiri Slaby <jirislaby@kernel.org>
> > > > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > > >
> > > > > Looks sound to me.
> > > > >
> > > > > I would prefer a bit of word-smithing the commit message by just
> > > > > removing the references:
> > > > >
> > > > > So:
> > > > >
> > > > > > While include/linux/bitops.h brings in the BIT() macro, it was moved to
> > > > > > include/linux/bits.h in commit 8bd9cb51daac ("locking/atomics, asm-generic: Move some macros from <linux/bitops.h> to a new <linux/bits.h> file"). Since that commit, BIT() has moved again into
> > > > > > include/vdso/bits.h via commit 3945ff37d2f4 ("linux/bits.h: Extract common header for vDSO").
> > > > > >
> > > > > > I think the move to the vDSO header can be considered a implementation
> > > > > > detail, so for now update the checkpatch documentation to recommend use
> > > > > > of include/linux/bits.h.
> > > > > >
> > > > >
> > > > > And then drop references [1] and [2].
> > > > >
> > > > > Andrew, what do you think?
> > > >
> > > > I mostly did this because initially I wrapped the commit message and
> > > > checkpatch spat out errors when it failed to properly identify the
> > > > commit description for [1]. But, leaving the description unwrapped
> > > > inline in the text feels untidy as it's just a work-around to dodge a
> > > > shortcoming of checkpatch.
> > > >
> > > > With the reference style the long line moves out of the way and
> > > > checkpatch can identify the commit descriptions, at the expense of
> > > > complaints about line length instead. But the line length issue was
> > > > only a warning and so didn't seem quite so critical.
> > > >
> > > > While the referencing style is terse I felt it was a reasonable
> > > > compromise that didn't involve fixing checkpatch to fix the checkpatch
> > > > documentation :/
> > > >
> > >
> > > Hey,
> > > Can you share which wrap around caused the checkpatch errors
> > > to be emitted? We can try to fix that.
> > >
> > > I was able to wrap it without checkpatch complaining. You might consider
> > > replacing it with this if you wish?
> > >
> > > While include/linux/bitops.h brings in the BIT() macro, it was moved to
> > > include/linux/bits.h in commit 8bd9cb51daac ("locking/atomics, asm-generic:
> > > Move some macros from <linux/bitops.h> to a new <linux/bits.h> file").
> >
> > This wording works because the commit description is only split across
> > two lines. With the wording I had it was split across three, and this
> > caused checkpatch to barf. If we do this:
> >
>
> Yes it won't work for 3 lines. We are checking only for an additional line
> for split commit descriptions. Might be a thing to improve in the future.
>

Dwaipayan, you certainly got my go to improve checkpatch for this
issue. You might want to re-run our known checkpatch evaluation and
see how often this issue for commit references with multiple lines
appears.

Looking forward to your patch,

Lukas
