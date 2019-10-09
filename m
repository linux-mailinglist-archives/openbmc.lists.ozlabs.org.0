Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF8AD07B6
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2019 08:57:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46p4lz1bxkzDqNb
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2019 17:57:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="g5sePjYC"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46p4lP1GWDzDqJk
 for <openbmc@lists.ozlabs.org>; Wed,  9 Oct 2019 17:57:04 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id o12so1921259qtf.3
 for <openbmc@lists.ozlabs.org>; Tue, 08 Oct 2019 23:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZGKRgUfJ3GPDu9ubgHZOVj92d8V4fuVYj8CbIpvSBOM=;
 b=g5sePjYCp3TWd/hSJP9YHkp/lmQxzmFl3ARy2hyJPk7osuCxqyMw8iBKml8RVBJY7s
 31jCcbO2o2B1JPvAiq0Gw9HBp+j4hBntWwpFMNji3HLaeBfqyo0FPD9fc/8bDqph1380
 KTWvzhRmijwKxjkHjCcJAQ01Qc0ppLd45NLTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZGKRgUfJ3GPDu9ubgHZOVj92d8V4fuVYj8CbIpvSBOM=;
 b=idpAzSgACONCZ3L15K9zVvMM/D7fNn9/T+w5O/oymSf76K6WxDsy+tU/lm9GkFIrFO
 E9Yig4nNKVVCt6pS53DZ9IM8mA9yZoylGT8uYHiKiGC8KG34IuyNevh4oxszluYbohDB
 2zmG2HhIwQdiXI6np00e61v90/LVkhjODBtnfGMrmPFWohQfFxifCEkplKTQ3z4KXENz
 Av9Ng8rFy+MtfV6M9/biGJiCb+CViHlqnurw7P2CU71m8N550sCA3FEUQUupDdUnz1ZW
 0/hT/bhcLeO9slmKWhwU67JvowzdansYosuGQznReBH1J/MB6e/LMh3n/KZV6DhXDz4+
 pDNA==
X-Gm-Message-State: APjAAAVP0DuGKg25sYS9jlMt6rS+2810WKPOYzSzMKa8TgbrVg44WMh5
 gIwANy89g8HAavn8PDBqCF9NU5PwRQjwL0wJXw0=
X-Google-Smtp-Source: APXvYqzBudERsZgVQMwtQElZRfvOiRGGu/r4ZOfXZ7sLE3zwZsnAJlKnOC+qkWi/2N4w3NNDxUQG0LDhSmbk4Mrl7Kg=
X-Received: by 2002:ac8:5252:: with SMTP id y18mr2099390qtn.220.1570604220686; 
 Tue, 08 Oct 2019 23:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <a75f96a83100994878c2ad459146b7107b5d1da8.camel@yadro.com>
 <CACPK8XfLqGqZSWqfUtOWqvxyBdOyd_PpAA7NMuUUARoNn1Gu-w@mail.gmail.com>
 <106edb5ee091ec873c0461d28fb4820856a742ba.camel@yadro.com>
In-Reply-To: <106edb5ee091ec873c0461d28fb4820856a742ba.camel@yadro.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 9 Oct 2019 06:56:49 +0000
Message-ID: <CACPK8XdDTL7YmGezNSdJWZy1erx5KAqHq1NtxYWMCp9F3_szqw@mail.gmail.com>
Subject: Re: watchdog's patches backport from dev to 2.7/warrior
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 8 Oct 2019 at 16:56, Ivan Mikhaylov <i.mikhaylov@yadro.com> wrote:
>
> On Tue, 2019-10-08 at 06:20 +0000, Joel Stanley wrote:
> > On Mon, 7 Oct 2019 at 16:16, Ivan Mikhaylov <i.mikhaylov@yadro.com> wrote:
> > > Hey Joel, Brad,
> > >
> > > Can we backport these patches into 2.7 warrior, please?
> >
> > Sure. There are two ways to achieve this:
> >
> >  -  apply changes as kernel patches to the kernel in the layer for your
> > machine.
> >   - update the kernel to a newer version by updating meta-aspeed
> >
> > As the kernel is not being maintained for the branch, I would suggest
> > updating meta-aspeed is the best way to go.

> Joel, we had same idea about kernel patches for our layer but meta-aspeed
> approach is much better for us. So should I send those patches into gerrit for
> meta-aspeed?

I can handle the updating.

Brad, are we happy with this approach?

We will update the warrior branch to use the same kernel as master.

Cheers,

Joel


> >
> > Cheers,
> >
> > Joel
> >
> > > c536e5f66af75f4301361363e37d7f4e3aa4eb37
> > > ARM: dts: aspeed: vesnin: Add wdt2 with alt-boot option
> > >
> > > 6984ef32d05c2b5567f5d3f09d260ca7cbc2fc27
> > > ARM: dts: aspeed: vesnin: Add secondary SPI flash chip
> > >
> > > 653aedbf02b71d6930959323e76961da98eab858
> > > watchdog: aspeed: add support for dual boot
> > >
> > > Thanks.
> > >
>
