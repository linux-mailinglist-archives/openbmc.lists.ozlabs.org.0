Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2BB4AF29
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 02:47:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45T5rL2scTzDqhN
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 10:47:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=benjaminfair@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="CG6sUb9v"; 
 dkim-atps=neutral
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45T5qZ39KlzDqQX
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jun 2019 10:46:32 +1000 (AEST)
Received: by mail-io1-xd32.google.com with SMTP id n5so34163447ioc.7
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jun 2019 17:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RH1kMUpuvoGUsUpmRi0V16+aHGLqpBHejN3DomroheY=;
 b=CG6sUb9vQhpBixZb9RQqFeJQnr9+0fh8n3Pjbuwg2LxXggmKAkdjG5ODPKR7YZsz6N
 er7H4YA8M4KdPDTtVwHB8D/+1szIknoADaZ/7+di2lJud75p6MPkAwHDROXss2ysy0QE
 cEH7hzu038QCuFyjF87qmUhgUz0+hpDgckpl9iNLrp0r7JuJ5cQFXxZlmoR0KM1UsBol
 Weldx/AVpqjfYvMEJ30xJIKb5VkmD1z1rWgPgWQAM3+NPvEXeh0vD6XB1YHHwc7LSdMc
 hIrI9P7wxjl6iCBOoCM+aZvEuqpDijMQ4DyVmv4MnK6AOS0tNHg8I5VuBBP3Fxapc1fT
 ofiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RH1kMUpuvoGUsUpmRi0V16+aHGLqpBHejN3DomroheY=;
 b=d5mywVJ24tAMwR9E8bKALpIHzRYwCUGkVh1qMbhfabCqiVg6Jw42HGkFLDmcPYSM4S
 K31ETmCG77Y/kENYj7Fe4ZufXRO3yz9JhCZuD9NPD8Qx9U3oqs+4yHGHHXrzsOkbetuE
 TEfhpKrEqHKShVa0Vpweh4Hkpcy2skkrvW+4lVN3kXwZvusP4PuW/yQ6/9IaUx1V/RRQ
 YdLfeR1ntfnXphwCVnkLwO89/TZZHhQ7rbxye3eGa3sGQTLgF6ce3XoFy2miwvsL161a
 ARvBe1i9Gs0EuyY1ZoZQxgySt4opEhMqPTktrWCF2b64ktsnNU4HmcP/zT69ZdwdIXq8
 PgHQ==
X-Gm-Message-State: APjAAAVSx0oUwhO0u62OjjZVYr7Z36poxJYnx+oibWUc77Vpw1ITj6r9
 l45QuPQznofwbp1h549Ip6tVPDWJPCYxrZAXallg9w==
X-Google-Smtp-Source: APXvYqy5cb1ph1zEvBxKR4HqCqecgz6TpE2F9zhDQT7k/H2LhaopQjOhp2reBDiJAzWKcP2Z+vZTcDLLymuULK/smBw=
X-Received: by 2002:a02:b10b:: with SMTP id r11mr6249694jah.140.1560905188108; 
 Tue, 18 Jun 2019 17:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <CALLMt=qZOxWDH8eDqv6JYbkvgk10mR1K_REgnE-DkssLWD=iVg@mail.gmail.com>
 <CACPK8XdV6X6j=A2Qf7RcBnWWoESi6SWMZfcoA2mJPO_JFCdcrQ@mail.gmail.com>
 <CAO=notxmm4JWPSS3o6bBXpFxO=n-e43F8kLPcjSvudvGoCCZPA@mail.gmail.com>
 <CALLMt=om6w-0um4vBKoosxVHjL2egHd-Fs=0aT3zE6LJHXedyw@mail.gmail.com>
 <CACPK8XdZWGJ8d32N1D8Np2Ja8DOPZ4BqB9wJ4GyFOJ5PCmO5gg@mail.gmail.com>
 <CADKL2t7a41=uwFQaB8UyLOJUNm65rq4hgxCK1zdURCZ6reXZ0A@mail.gmail.com>
 <1fc9bc66-6bbc-4b13-9ebc-e8fc2b0d5129@www.fastmail.com>
In-Reply-To: <1fc9bc66-6bbc-4b13-9ebc-e8fc2b0d5129@www.fastmail.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Tue, 18 Jun 2019 17:45:51 -0700
Message-ID: <CADKL2t4Pv_kVOfrFoDdT_FHabQkB2id3CJnqXLrzJzjViYPnnA@mail.gmail.com>
Subject: Re: CI to stop testing meta-* layers not in tested machine
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Jun 16, 2019 at 8:30 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> > >
> > >
> > >
> > > Once we get the u-boot issue sorted out, I propose the following changes:
> > >
> > >  - drop qemu from CI. 'qemu' is actually testing on a generic arm
> > > machine. A few of us at IBM have a side project that has resulted in a
> > > high quality Qemu support for the aspeed boards, so if you would like
> > > to test in qemu I recommend grabbing palmetto or romulus and doing
> > > that. So consider this dropping the generic qemu image and instead
> > > focusing on the aspeed one.
> >
> > +1
> >
> > Many things are already broken on QEMU, including phosphor-ipmi-host.
> > It's not a useful platform to test with.
> >
>
> Is that a general statement about QEMU, or are you talking about the generic
> qemu image as Joel was?

That's specifically an issue with the generic QEMU image. It's because
the generic image doesn't include u-boot, which is a dependency of
phosphor-ipmi-host (transitively through clear-once).

>
> It would be great if we had more contributions on the QEMU side. There's a
> list of things that can be attacked in the wiki:
>
> https://github.com/openbmc/qemu/wiki
>
> Modelling I2C peripherals is usually a good first step.
>
> Andrew
