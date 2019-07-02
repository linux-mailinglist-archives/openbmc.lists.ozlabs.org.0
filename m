Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD555C99B
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2019 08:56:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dFQN3pJZzDqQd
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2019 16:56:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="LG4g0FzN"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dFPf1PxtzDqLk;
 Tue,  2 Jul 2019 16:55:49 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id n11so17348140qtl.5;
 Mon, 01 Jul 2019 23:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AaShN4uzWBaZgTNfwJ+uYc/JtqMs0g8gjyrH491TL9U=;
 b=LG4g0FzNQCEpM6Jgott6CJtfjELkxt2QX5zMxIHtRrLMXVV4JP4v3Ao+9+Z16gemDc
 StGo3rufp8Ml9CrSTk1rK+M+yUBMMn9iT5yxx//AaXqGEWybzpz9bSz4CY3jTQ+k/ILs
 AnV/JqiPfUhzCX5jnj7vPRXN0aoFmFJ6I2MLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AaShN4uzWBaZgTNfwJ+uYc/JtqMs0g8gjyrH491TL9U=;
 b=F03rBeSWGD4Em0Fr0xuMeRUWuWlflzBIzpRZvbvnve4MH+GZTy0CYPiG+qRp/hBZeY
 2se2ifmWvy6MDaWWDbrBriKdRuQfvv5R9PAjBDwukGJbbS7mN+8Ygd4Vw1hBP0NEfAaz
 Dw1fSkRKskKXxjM+BT5eBCcN3qWerV7+hO+0lxCy0ZHq2QHExG3/yW8Wkfog2yGzV5fF
 XH0wIWPvLrmwmmrW2ZGw+0cp8bGgXlu+Jn5DlEDEz64wo/jM9rqEpu5FZp7E7fDN8za/
 HqjgXftm8tVvQaq/1OJq9sdVW/fwjp9wxVhSAoP9BsigiwSEa3HnsPOGUWZWCZazOjpt
 vVoA==
X-Gm-Message-State: APjAAAWr5cbW/ZwEWcoAHPbcEuXrCTISJY9ZYnRfyDybVAfEGQ1+Y2xR
 6cTs4QmVKIJnWAymdgRBjm5Wkcsi6OyPD7M4Jpg=
X-Google-Smtp-Source: APXvYqxxL32lDW2eJq5ZR/Bwv4c7ZoKjvNF5ploCqIwlzJx1ZYe4X32zlkFmLYa3y6+UuIj+8ElkFM3sDRFDhFXS70Q=
X-Received: by 2002:ac8:1887:: with SMTP id s7mr23797517qtj.220.1562050546348; 
 Mon, 01 Jul 2019 23:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190702043706.15069-1-joel@jms.id.au>
 <20190702063323.GA53677@archlinux-epyc>
In-Reply-To: <20190702063323.GA53677@archlinux-epyc>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 2 Jul 2019 06:55:33 +0000
Message-ID: <CACPK8Xd0cnpJ5L9pAjy=9qyhq6sGuyjoqMyneK4bD3+HvCb+kQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add FSI subsystem
To: Nathan Chancellor <natechancellor@gmail.com>
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
 Eddie James <eajames@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-fsi@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2 Jul 2019 at 06:33, Nathan Chancellor <natechancellor@gmail.com> wrote:
>
> Hi Joel,
>
> On Tue, Jul 02, 2019 at 02:07:05PM +0930, Joel Stanley wrote:
> > The subsystem was merged some time ago but we did not have a maintainers
> > entry.
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >  MAINTAINERS | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 01a52fc964da..2a5df9c20ecb 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -6498,6 +6498,19 @@ F:     fs/crypto/
> >  F:   include/linux/fscrypt*.h
> >  F:   Documentation/filesystems/fscrypt.rst
> >
> > +FSI SUBSYSTEM
> > +M:   Jeremy Kerr <jk@ozlabs.org>
> > +M:   Joel Stanley <joel@jms.id.au>
> > +R:   Alistar Popple <alistair@popple.id.au>
> > +R:   Eddie James <eajames@linux.ibm.com>
> > +L:   linux-fsi@lists.ozlabs.org
> > +T:   git git://git.kernel.org/pub/scm/joel/fsi.git
>
> Just a drive by review, this link does not work, seems it should be:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/joel/fsi.git

Thanks Nathan, good catch.
