Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE02476945
	for <lists+openbmc@lfdr.de>; Thu, 16 Dec 2021 05:55:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF0Cn5jMcz3c6N
	for <lists+openbmc@lfdr.de>; Thu, 16 Dec 2021 15:55:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=YUF2Dlw5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::135;
 helo=mail-lf1-x135.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=YUF2Dlw5; dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JF0CQ4x7Qz2x9D
 for <openbmc@lists.ozlabs.org>; Thu, 16 Dec 2021 15:54:41 +1100 (AEDT)
Received: by mail-lf1-x135.google.com with SMTP id c32so47316460lfv.4
 for <openbmc@lists.ozlabs.org>; Wed, 15 Dec 2021 20:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nm9y9iuDRseIKAaejOtYPehe3mjg4oA9z8yKxOtHu68=;
 b=YUF2Dlw5/RXX+QV3YB9WdS6/GObtBf5Fmgs+LFYXuqxshJcpQcqVb795dkHRekWrtk
 P2qSj24vJaYKE2uorgEnNCn90bAByre8PzbuHcb7WLNcNQFiuHyzJ1MDJkW2+CmdJ4dP
 EFC7euTcSVE2ENAUGd0LVwFdf0TzUn8qiH6Xy5gYG9TAcYpW+CdFBOXuDGrZ5/L5TFF1
 nPcP9Kh7cW+5EEBWhSr8zngyHdR2+5rrgagllEoVKRicJT5m6zVp8zO2oYh/XjgDucsx
 fC5Nj4X/p8VDfSFS6BE8mNOgyKQKBzWIFgupBPUib3LD2cKJWdNeznfKF6dSpzeESs8R
 5o1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nm9y9iuDRseIKAaejOtYPehe3mjg4oA9z8yKxOtHu68=;
 b=tUSxPG/nj0ol4h7eyE/nX//d3QlPXqh88yWaUitAHFIgo4oupxuQ4AEGbROf1qxq8V
 GrIRQS3Q4Y1E/z22S6EYTKY8aZFKXLBpxcdFhF7pQdkKC4bmOAiykEF1yVLhxaTuGrjD
 FD+Ybx1XNpZUVvvo+UH7RROKb82n65FbBarRLYp55rT8JP2Bbb61gNs6/9KUbTkHm47v
 xujGnomCrz07OjfS54IeHD+X+GWyOwmt8NAACks8UyRnwWbTVV7uRT8uPTVoy68IBi11
 UHfLnPvKR8OkPNVqrV08ZOYZbMEqXjGk0qQ+I4knyHmBaZQYuEWHlbDozZRuI74sA+1J
 k6rQ==
X-Gm-Message-State: AOAM533RJ8Lcn1PJJAVGf801+PTKmBToMcHIBD0oBbmcYqSFhsOhyzrD
 u163v+5Iz1pk7myf+wrAMFFjK1MUme910MVEdxaL2w==
X-Google-Smtp-Source: ABdhPJxh7++T98wvO8dhGWKnkJRzW8AbfrK5WdKtJD/Z+nZvDmSwzuImhFBhY0tneFl77UGIR9zF9AO4DGB6QwizUN4=
X-Received: by 2002:ac2:4858:: with SMTP id 24mr12575156lfy.635.1639630474946; 
 Wed, 15 Dec 2021 20:54:34 -0800 (PST)
MIME-Version: 1.0
References: <CABoTLcTACbnnPZ8dfc_oFwgoT5JikYBHgfTjzknJbqC98rLMQQ@mail.gmail.com>
 <20211216042729.GJ25091@packtop>
In-Reply-To: <20211216042729.GJ25091@packtop>
From: Oskar Senft <osk@google.com>
Date: Wed, 15 Dec 2021 23:54:19 -0500
Message-ID: <CABoTLcQapj0LRAAWoo4ncagVGzK9brSz0RJti4H=+eeX5-o5kg@mail.gmail.com>
Subject: Re: Slow performance of VUART on AST2500 with 5.15.5
To: Zev Weiss <zweiss@equinix.com>
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
Cc: Jeremy Kerr <jk@codeconstruct.com.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Troy Lee <troy_lee@aspeedtech.com>, Ali El-Haj-Mahmoud <aaelhaj@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Zev

> >Is anyone aware of AST2500 VUART (or something else that would affect
> >performance on an AST2500) having gotten broken somewhere between
> >5.2.11 and 5.15.5?
>
> Yes, this is a known issue.

And I felt that I was going crazy! Thanks for confirming that this is
a known issue.

> Prior to commit 54da3e381c2 ("serial: 8250_aspeed_vuart: use UPF_IOREMAP
> to set up register mapping"), a long-standing bug in the aspeed-vuart
> driver had a side-effect of unintentionally leaving the VUART's FIFOs
> disabled.  With that patch applied to fix the bug, the FIFOs get enabled
> as they were originally intended to be, but that in turn seems to expose
> another bug with the host-side THRE bit not getting set when it should,
> so the host-side driver's write routine ends up waiting for a timeout to
> expire on every character (when it would otherwise continue on to the
> next character upon seeing THRE asserted).  I think this may be a VUART
> hardware problem, though that hasn't been officially confirmed thus far.

Did you reach out to Aspeed yet? I've had some good experiences when
talking with them directly.


> I'm hoping we can land on a better solution, but as a temporary
> band-aid, hacking the driver to treat the device as an 8250 instead of a
> 16550A (effectively just re-disabling the FIFOs) should speed things
> back up:

I can confirm that this fixes things, thank you! Is it worth dropping
that into upstream for the time being, or do you think a "better
solution" is imminent?

I've been trying REAL hard to keep meta-tyan (and our other downstream
stuff) patch free, but I can't leave it broken since it affects boot
time (both BIOS and Linux synchronize on writes to the serial
console).

Thanks
Oskar.
