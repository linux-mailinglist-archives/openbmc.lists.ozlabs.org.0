Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 731B024DC62
	for <lists+openbmc@lfdr.de>; Fri, 21 Aug 2020 19:00:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BY77S6MW8zDrHp
	for <lists+openbmc@lfdr.de>; Sat, 22 Aug 2020 03:00:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=OaFED65Y; dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BY6zP1LYmzDqP2
 for <openbmc@lists.ozlabs.org>; Sat, 22 Aug 2020 02:53:36 +1000 (AEST)
Received: by mail-yb1-xb2c.google.com with SMTP id g3so1381243ybc.3
 for <openbmc@lists.ozlabs.org>; Fri, 21 Aug 2020 09:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6aBoFaDaVylm6nCFZh2LPE5Gg+idH10evVNZt9zJu+k=;
 b=OaFED65YQhKO/uSUPliNHDQePtMPIFENoWZx2V+UclQfcZ9ydAa0GZS/XT8D/PcN/L
 cFeP0+ctM6lCoDJtIT6j3mWZfHSE53H6OwzShUF50oEo4fIgq7ChXSt75zpUz7y0wxR1
 k1CN1LQvkH/aqhpENadtUnFHjP06MKMEhS/pjcprwclt/FrGtf+04aaYcrdwUxpTPtJD
 /dxI91OJx0My/Y6nNW6T/0czOUYNGSgo3jijKrPKZmE1tf9JTLd69hmz08KZoVt9iM5c
 9Z4L8rW2Vg+y0ConUkRc+4YOjXJaPzBjG6X0tAzwv6kioAJ9hdOKgwnj/utl/mMhC217
 mR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6aBoFaDaVylm6nCFZh2LPE5Gg+idH10evVNZt9zJu+k=;
 b=TP3dFXi0zWqnzqBdIk5pbhPUvscynm0lcTlhhG0V7WgdH4oe0VMfqwD2OZV5WxYPrn
 xB/QysGgtdObLK1VBrw+5ocGLG1WC3D1tBBW4egoeHQFtaVGXkUNlpj8XbMock32OH5d
 tG5t5snDTOFGAZizHQNBwy5jHkHx75EMpRESF3ZgpYs2IsZwJMdxlRfCglx9u+IkMPnF
 jNrEQQELD3ui6mYVSAB2UKIOc6joW0iB3l9T09zj36Fd4XgZhca0uvN0rIJ2KU4zAo4C
 1Y7YnGJ5AisXamuePL5lEj7HcCRlbDhilyl6fYvdnlCv6jt9SDXys1Tg2D6rPhcWaTvI
 Xu6A==
X-Gm-Message-State: AOAM531QObB3DTqBL5QpesE5Wi9wbb+hlnKbJlrX7M5nNpnAbbzYJuoX
 AbI3YDN5MGQEAyymyxu8UgEOIsSP4gov9VQERFqs4hf3d7M=
X-Google-Smtp-Source: ABdhPJzvRUjSI6avtmR4khPpoMrbHBjreU2uWKieYmAkAfaH7J41ktITf1miV5YXooO6K07zwABOTavByW/hY2Chkko=
X-Received: by 2002:a25:d48e:: with SMTP id m136mr5078314ybf.148.1598028813094; 
 Fri, 21 Aug 2020 09:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <d6d450e638d016d29496ef1713083e80551a84bd.camel@fuzziesquirrel.com>
 <20200820162955.GC3532@heinlein>
In-Reply-To: <20200820162955.GC3532@heinlein>
From: Ed Tanous <ed@tanous.net>
Date: Fri, 21 Aug 2020 09:53:21 -0700
Message-ID: <CACWQX80NWqfES4vA7M4+jwrfp9Z+HWt=_ni3cMzc4yaw9skekg@mail.gmail.com>
Subject: Re: moving meta-{openpower, x86, arm} content to meta-phosphor
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Aug 20, 2020 at 9:32 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Thu, Aug 20, 2020 at 09:15:52AM -0400, Brad Bishop wrote:
> > I propose we allow the creation of additional folders using this
> > convention e.g.
> >
> > - recipes-power
>
> I'd like to propose a change to the name of your processor
> architecture to avoid confusion between recipes involving the power
> subsystem, but I'm sure your marketing organization would have a thing
> or two to say about it.  In seriousness, it might be good to continue to
> use openpower in this project considering that the OpenPower Foundation
> holds the ISA specs and it avoids confusion with the power subsystem.
>
> > - recipes-x86-amd (we might want to look at renaming recipes-x86 to
> > recipes-x86-intel)
>
> I think it would be good to come up with a schema on how we represent
> the machine overrides and recipe subdirectories so there isn't
> inconsistency there.   Something like <arch>-<company>-<model>[1]?

I think in this, recipes-power would go to recipes-power-IBM.  I think
that solves it, no?

>
> I do have slight concern about there becoming an enormous number of
> variable overrides, patch files, etc. as we support an increasing number
> of processors, but I suppose that points to an underlying problem in our
> implementation which needs refactoring.
>
>
> 1. What do we do about risc-v which has a dash in the architecture name?

Technically isn't RISC-V the same thing as power9, and we just drop
the version from it?  Or is the "5" an important part of the name?
RISC-V is definitely a case where having the company in the naming
convention is going to be important, given that (to my understanding)
the design can be picked up by anyone and modded as they see fit.
