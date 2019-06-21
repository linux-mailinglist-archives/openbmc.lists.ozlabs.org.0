Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1CD4EEEF
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2019 20:52:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VnqR1KVnzDqdv
	for <lists+openbmc@lfdr.de>; Sat, 22 Jun 2019 04:52:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::236; helo=mail-oi1-x236.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="J0GsTU/y"; 
 dkim-atps=neutral
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Vnpw67KQzDqdp
 for <openbmc@lists.ozlabs.org>; Sat, 22 Jun 2019 04:51:52 +1000 (AEST)
Received: by mail-oi1-x236.google.com with SMTP id e189so5352488oib.11
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jun 2019 11:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qYqa41kXVXLOdMnIZXn9CLnnZdbeYnwSpvDqnzpANNk=;
 b=J0GsTU/yS03j5FmlAfWHJwbZWbhJIPEx5fYHfD/Nz4EcijZVGW02S/JRjOawknEtId
 lP56BCzoZOUNNrTNDuQXHbbhkVK9Ur6VZBWJ8sc6EPSfG6anasXWxSXtDQdTRncfyvJ7
 JGnr1NNTkC2fBDqN4HjBcylWISw6L6962oVKVoFYEP7zf3Psi0Cf8lRdAlXznXpSWSmf
 4NKnOvhffssxncFKryk+ZODO0fShYOw/VTmKmXFdl5HP2W7aKx81Kxv02rpvvJVClkwV
 stduXntZjvk1u5g011VnYIRN60XqzhQRXpmHHk2LQSrxJCkIvScMmkApcazvc27Dw92u
 eOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qYqa41kXVXLOdMnIZXn9CLnnZdbeYnwSpvDqnzpANNk=;
 b=erIbqZUD7zu0W2A1v9bpJjWveNh9vK1WH38w0vJ58IaxuJ3XUyIQOZbB7aTJfp21yt
 yqVHWy594IkIY+IISXsU3PVmmSLNvTMwBwXhyvkBhMaFY/9Oy2nUxyzES8DoHkzOv5UL
 hZvlyQHrlKR1H4KJZVcI9MW1r+SuecjVXYrR+QQnzwtzcytIooThqfReOK4ZvAZ0FzTm
 xCUsY7vSn5IQPKr+3A7XKqD0AtR3U/1my+IEN1Ac1xgVh1KhdUhoju2qVohQEurio1V4
 T8S/nzfC92PgBHdSeEk74kEEubUiXho24WpPr4rPaTCQFT99o0CIJ+BmdTNFPKTM3jBp
 drgQ==
X-Gm-Message-State: APjAAAUwUjVWRQfeSKYlKzPtYz3pRvYAQsjwZbW4ButjYfvXJJbYMeTT
 qKnYRj2qw4fRFBjDIT14ZFlvYxBzWbYPF/8iivI=
X-Google-Smtp-Source: APXvYqxy/41izrHKk/s0fSLtRHZMr4Y8EUsP5q5Hyj6NZnqkHQPSxfhNQDYSvcUYmj59vShg8qE6fytrLttT+Gp1PKo=
X-Received: by 2002:aca:aad3:: with SMTP id t202mr3973571oie.158.1561143110122; 
 Fri, 21 Jun 2019 11:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <CALLMt=qZOxWDH8eDqv6JYbkvgk10mR1K_REgnE-DkssLWD=iVg@mail.gmail.com>
 <CACPK8XdV6X6j=A2Qf7RcBnWWoESi6SWMZfcoA2mJPO_JFCdcrQ@mail.gmail.com>
 <CAO=notxmm4JWPSS3o6bBXpFxO=n-e43F8kLPcjSvudvGoCCZPA@mail.gmail.com>
 <CALLMt=om6w-0um4vBKoosxVHjL2egHd-Fs=0aT3zE6LJHXedyw@mail.gmail.com>
 <CACPK8XdZWGJ8d32N1D8Np2Ja8DOPZ4BqB9wJ4GyFOJ5PCmO5gg@mail.gmail.com>
 <CADKL2t7a41=uwFQaB8UyLOJUNm65rq4hgxCK1zdURCZ6reXZ0A@mail.gmail.com>
 <CACPK8XdXNaWBNsigUuxGJtKPrrO=9Jhuy_Tci3ShBVXFD3WKSg@mail.gmail.com>
In-Reply-To: <CACPK8XdXNaWBNsigUuxGJtKPrrO=9Jhuy_Tci3ShBVXFD3WKSg@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 21 Jun 2019 13:51:34 -0500
Message-ID: <CALLMt=pX201pj9o8jWPZCXV+udeijVDAHcot1z_=_4nSy-3ShA@mail.gmail.com>
Subject: Re: CI to stop testing meta-* layers not in tested machine
To: Joel Stanley <joel@jms.id.au>
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jun 20, 2019 at 7:38 PM Joel Stanley <joel@jms.id.au> wrote:
>
> On Fri, 14 Jun 2019 at 15:55, Benjamin Fair <benjaminfair@google.com> wrote:
> > >
> > > Andrew tried to build the machine and ran into u-boot issues which is
> > > still blocking the machine's addition to our CI. Patrick, are you able
> > > to look into that?
> > >
> > >  https://github.com/openbmc/openbmc/issues/3542#issuecomment-501706892
> >
> > That issue will be resolved by switching to a 2019-based U-Boot branch:
> >
> > https://gerrit.openbmc-project.xyz/c/openbmc/meta-nuvoton/+/22556
>
> This has been merged now.
>
> Andrew G, are we able to turn on the CI?
>
> I think we have consensus to drop qemu, and enable gsj. There were no
> objections to enabling swift too.

I removed qemu and added in gsj but we still need to work a few things out
to get Swift going. I pinged you offline on that Joel.

>
> Cheers,
>
> Joel
