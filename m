Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E98F14C36
	for <lists+openbmc@lfdr.de>; Mon,  6 May 2019 16:37:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yQLv3xr9zDqGG
	for <lists+openbmc@lfdr.de>; Tue,  7 May 2019 00:37:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="pFbB3I/3"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yQJw6zlVzDqDp
 for <openbmc@lists.ozlabs.org>; Tue,  7 May 2019 00:36:00 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id ck18so6484317plb.1
 for <openbmc@lists.ozlabs.org>; Mon, 06 May 2019 07:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oaPq0adPEapAgrJ9pJwZtYd8h2AjsGUXPo023Tk+N3g=;
 b=pFbB3I/30RTFMTClyzqxgujH812EPa/TSU0XVQXkoXVMwvej0hAD9ixN6zapTdT1uS
 pv5fJKbUsXw44GIHcQ3EdcphOshPZkpkv4kElfYAxrtBiYNdP2J5hwFgxlMt4GLVkR1r
 +i/QQHZpcksc1xD4P42mNYtU+mkk+03fy2CJkLE+eT3dN3dgtr307pzhqN3c3iGynV7Y
 +2uIoK6I5INJqE4Ieb5DOpKqIVgyWdZUlXrjy/kK+Wiw6ehVCEZDHepfklPlemaBeUAx
 9QYYPck7xYM2gNmrwnFis1eI9B9B0lLTCUu3T4eidTexm0VV8qVzfHi/TiqhHCj+sAKg
 LV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oaPq0adPEapAgrJ9pJwZtYd8h2AjsGUXPo023Tk+N3g=;
 b=DHKMf2qqoBZbvqxhGwPU85CeAgQBliyIjE7Q5IOYT6xBH53QF/W8s8T/u9C4sNJ2Hr
 nh4F4NEGjTFKDVx6TYAssjb1n+B3MEsMGpH3m1rmqbUfrQyveS5r4CcqidtEmrsFuGxp
 PyWTti4YUxAB+OgYtR2RtKldBQhxvrFDjKgU63PDK4xdh+Yj40c4+RxajcPOscGPBHKk
 MjnMoU/N/HypIMGfu06tFe06UcMH7hxICitdZAATwSCrZxTzQlhuaza2DM3cD8lET7mU
 6viWcG9oJOi0gUNM+TNQWT3c5MdAf2Lyl6Y5JQ7tWnOMEoaJ2tQVLd6DTcc5nJCbrZ4B
 Dl8A==
X-Gm-Message-State: APjAAAV90qVIb5ZJuoVpqkOMn3946FxJicVBCUuGx3FJmOGtERHyRa0T
 UeOfZrpaE/D/ZGlzluoecVP7cSckpoQM/T8y4ZPURg==
X-Google-Smtp-Source: APXvYqwcjDiFynQw8FZokAjV3xYNe5TyP4hVM65YflpmQwQPBsGlJMe94MbBqHliDuKt/gJUiFRtQ3dNt7l0TQJz37g=
X-Received: by 2002:a17:902:e183:: with SMTP id
 cd3mr32715795plb.233.1557153356272; 
 Mon, 06 May 2019 07:35:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notyajN+Sft6MNBku81Kiovagfo7B_Pzm4bqf1NsLtAOX7A@mail.gmail.com>
 <8b3e70c9-f182-44cd-997e-5d07b26d76a3@www.fastmail.com>
 <CAPnigKm6=LS5Pvf5_KUhc9yDJNJUXFfKSgpwdRvjVmOKSHcrtg@mail.gmail.com>
In-Reply-To: <CAPnigKm6=LS5Pvf5_KUhc9yDJNJUXFfKSgpwdRvjVmOKSHcrtg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 6 May 2019 07:35:44 -0700
Message-ID: <CAO=notzgk0nJvqqb9HZYRvAOA0d2gyZRfsD7ah+zr3Uu7q_eEg@mail.gmail.com>
Subject: Re: pci util cpp library
To: William Kennington <wak@google.com>
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

On Sun, May 5, 2019 at 10:02 PM William Kennington <wak@google.com> wrote:
>
> Worth noting that lspci just uses the libpci library provided by
> pciutils. I would try and use that before parsing lspci.
> https://github.com/pciutils/pciutils/blob/master/example.c

I ended up building in libpci and just calling the C methods from c++.
I preferred a single linking/calling environment, hence, cpp, but it
works fine so far.  Sorry, forgot to reply to this call-for-help.

>
> On Sun, May 5, 2019 at 8:32 PM Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> >
> >
> > On Sat, 4 May 2019, at 02:28, Patrick Venture wrote:
> > > Does anyone have a favorite CPP library for talking to PCI?  I don't
> > > think parsing lspci output is as clean.
> >
> > This feels a lot like the X-Y problem:
> >
> > https://mywiki.wooledge.org/XyProblem
> >
> > What are you actually trying to do?

Parse the PCI devices on a system to find a PCI device and then read
its configuration space, and write to a memory-mapped region. -- Which
is exactly what a library talking to PCI would do.  In this case,
there is a C one that works perfectly well for what I need.

> >
> > Maybe poking at sysfs directly might help?

No need, libpci (pciutils) handles the poking and provides convenient
methods for reading the information required.

> >
> > Andrew
> >
> > >
> > > Patrick
> > >
