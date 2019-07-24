Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 431D77331E
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 17:52:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45v0H06VbdzDqQ1
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2019 01:52:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="qNjTsOam"; 
 dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45v0GK74b3zDqCY
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2019 01:52:07 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id q10so21154979pff.9
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 08:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XGiDZZnp41OecEncUGfKAubmrRE/tKkc88iRO1tIyIQ=;
 b=qNjTsOam6D4TlWsgJg76WraLUKZvxIvfNmz7uyyeEDI8KMrEznu8N7Z5OS9F5qfsQY
 XHz80YW7K6E59wItCJoa9U7NTHiqtJBblFaT9R9dtr57q6t33sLq7kPAueQGSZNpq43p
 9nZ6hbWexxVBhytl/RwGLwFyXz7vNlJAwK3tQIprFu4Wdkuh915oKJQVKYLFcuF4pcTN
 bU2o36W+YXyScnNCwUZ9iq1fc78n1DMgYmRY4CIF9MeVeFB7MiZoKSomHn6Cc02f+i6P
 e60M/rRzKQ+fc5AkZsfjRQDsGomN8EFyg3RZJbZIWp9E+A4RNOC/E7U+97iPLRZAFZT6
 CUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XGiDZZnp41OecEncUGfKAubmrRE/tKkc88iRO1tIyIQ=;
 b=mtwg8uER/JZNylcttC0SAZ6IDmlFhwRCwOiUE1sTjo+ggvLidZp2Zn/x+KOtb4ySqT
 CO5yzo3MUfDKlqwEOJi3G9pY+xHCfkqwe/AwUc/9kUFaCtL2wWbXjn+Wmz62Pv75Y3ZU
 vInxS6nu4s5i0tMxVVNVroZBkBC1u5V/TsbHG1Q9xIC6gMugy7s8veyHbtlfJewvNWCQ
 Yl80YZXm2AomFiAL8hdvjIo+YyNlO3aMNcuHfsGPs2yZWMVmjNqzWD7vY7nf2aJ3BqWo
 0Zq7K4KxH87t7w92A8DbD0jW35ZvNKmqgFCuydWVqYPs4Hi/z2DCA9/N2YXU0BCCWxT+
 8MAQ==
X-Gm-Message-State: APjAAAWQsvgBtQEdrnKkABy1mch8aAHIXgggOKfptGs62/VEpNFOy2xR
 /GLCSF21w3uNgSU7SqsSrByvDoyHbQ8i/O1VtzJ2hQ==
X-Google-Smtp-Source: APXvYqwZOY9H99ZTzYe+oy765E7A+09PbJbA3ULt1kWYjx4jUA8awHHMZ0F9JT3Owsyu4QKkyv/yYgaB9SNCj68+918=
X-Received: by 2002:a65:6288:: with SMTP id f8mr76648312pgv.292.1563983523211; 
 Wed, 24 Jul 2019 08:52:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notwuD2FJ2w1P2v29U1f98T6_D=rbPrmoW3_DD157PciWSw@mail.gmail.com>
 <CALLMt=q2gt9GC8hOPkf6_O8vL69km-E+PFmoFLxXmoaRApw2bA@mail.gmail.com>
In-Reply-To: <CALLMt=q2gt9GC8hOPkf6_O8vL69km-E+PFmoFLxXmoaRApw2bA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 24 Jul 2019 08:51:52 -0700
Message-ID: <CAO=noty3TVNm3KpaJ=3dHqJ9V8qOz4SoUvOWwUxW=egLq+A87A@mail.gmail.com>
Subject: Re: gerrit not syncing to github
To: Andrew Geissler <geissonator@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jul 24, 2019 at 5:54 AM Andrew Geissler <geissonator@gmail.com> wrote:
>
> On Tue, Jul 23, 2019 at 11:20 PM Patrick Venture <venture@google.com> wrote:
> >
> > I wanted to reach out and see if anyone else has experienced this,
> > openbmc/phosphor-ipmi-flash stopped syncing from gerrit.  I know
> > gerrit was recently updated, so I'm curious if this is a problem only
> > experienced in this one repo or something in general?
>
> That github outage a few days ago impacted gerrits ability to
> replicate, even once the github issue was resolved. I restarted
> gerrit yesterday afternoon and everything seemed to synch over ok.
> I took a quick look at gerrit and github for phosphor-ipmi-flash and
> all looks good now to me.

Thanks!

>
> Andrew
>
> >
> > Patrick
