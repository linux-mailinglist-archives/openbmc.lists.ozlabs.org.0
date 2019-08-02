Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BC17FC3B
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 16:28:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460V02756kzDrF4
	for <lists+openbmc@lfdr.de>; Sat,  3 Aug 2019 00:28:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="HUu4sbc1"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460Tz54jzZzDr42
 for <openbmc@lists.ozlabs.org>; Sat,  3 Aug 2019 00:28:01 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id i18so36161752pgl.11
 for <openbmc@lists.ozlabs.org>; Fri, 02 Aug 2019 07:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dpl6fE4lieWfCCXIL8E/btB/plnsJ1/hz8MhMtqmEt8=;
 b=HUu4sbc1KDzxZPqMW4fm0IEySBM+jbAOEeuMemyjz9nWeODmumBGIRFltV48w4gsto
 JSRckij86REgLmRXchoCuhjUlDU/xNIGpwSRrgzzKyFv6Jjbi1FbRMZ+0oQGpIOO78ve
 t77nNq84iqb0Xfd1XIJRIi6tteUptRKsH4HniXS8KnJlcGin8rNm12gFCm1wld2BonLD
 5yRX3kgJ7tf3ZcvwxFd/awcYQUn1vM8yX8T7Fd1ptDXR46f+FKLa9wiB5Iuxt0As0wpF
 2J20mym6l0P9v5WePqtaRGs2AaOGXLQfJLhuyTiKoIkNiO8f6xUkf15tiVb0xyGcDIkh
 XkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dpl6fE4lieWfCCXIL8E/btB/plnsJ1/hz8MhMtqmEt8=;
 b=Hi8cWLpkbLgLdxVCve3UtbFY7W5Of2JpM4QpNzOh9KeHepSmXvXew9nB8S2L1+tb+E
 k8ucjZCqWrMmvjhBrZH61hcORJ9qo5XuoUze+stbppn53zaBp5CyKpUkDdk2uVcPOOos
 nPW2Qfv6d8beQsSAgR2vnwg9LrMOt7XR6VqeMXIps79aCobKeKfYh5h0QgYTXRIzSdgj
 K7eVOCRk3w7FfRpiKRjleq/RyKQNBi3VJ6QXCRu+Mni8w9YRtG+3JU0QS5nf4m0uRlhE
 Wg3JxTg9xsQGAyj/eLkgFOHIZohTXiyX3WLaB4Aj5iHgpJVWcK9XNntkiRj/gRpr2J5+
 XweA==
X-Gm-Message-State: APjAAAV4ZhvOOZH+j7860tbrBUDYnX6vCYYAElfGjh0oK6T9t/f+qaFn
 0iEU1BAjyF/lyd5L+2kyNPmeHrduJtEXZNEQGhUUyw==
X-Google-Smtp-Source: APXvYqwUAqjVTxvicyYd8YFoooH52KGWAJxnA6hwj8xFTH5iYWFt69p5pJOWnRbsYzqZe5lkGWJaukuiRsOaiqWQ2pE=
X-Received: by 2002:a62:e515:: with SMTP id n21mr60762706pff.186.1564756078783; 
 Fri, 02 Aug 2019 07:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxPYxa8oxQXkSLKNhTy3mZV8TOWeYyX=8Cxecz8fpAQWg@mail.gmail.com>
 <20190424161127.bzi74nsp7kzotazm@thinkpad.dyn.fuzziesquirrel.com>
 <CAO=notyKXNNfbAMBudtS8LB2cu73wBV1ee7w+s9rXd2QVwiniw@mail.gmail.com>
In-Reply-To: <CAO=notyKXNNfbAMBudtS8LB2cu73wBV1ee7w+s9rXd2QVwiniw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 2 Aug 2019 07:27:47 -0700
Message-ID: <CAO=notxMW_0Q9XayWy1bPivphHdWa1VL+R5x2txFx7OKBDWZmg@mail.gmail.com>
Subject: Re: inarp package
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Apr 24, 2019 at 9:17 AM Patrick Venture <venture@google.com> wrote:
>
> On Wed, Apr 24, 2019 at 9:10 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
> >
> > On Sat, Apr 20, 2019 at 08:16:22AM -0700, Patrick Venture wrote:
> > >The inarp packages isn't picked up currently by any meta layer and
> > >doesn't build (it needs some gcc related updates missed by its
> > >non-inclusion).  Brad, I see you're the maintainer, should we archive
> > >this package or bring it up to date?
> > >
> > >Patrick
> >
> > Hi Patrick
> >
> > Thanks for noticing this.  I'm not the maintainer - what are you reading
> > that indicates this?
>
> Yeah, that was totally my flake. I just checked the last bit of
> history.  I see there are actually maintainers.
>
> >
> > Now that you've pointed it out, Lets wait a couple months to see if
> > anyone fixes the problems and if that doesn't happen I'll go ahead and
> > archive the repository and we can remove the recipe.  Sound OK?
>
> Sounds like a good plan.

https://gerrit.openbmc-project.xyz/24126 - patch dropping inarp.

>
> >
> > thx - brad
