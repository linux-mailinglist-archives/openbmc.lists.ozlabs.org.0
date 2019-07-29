Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D66E786C2
	for <lists+openbmc@lfdr.de>; Mon, 29 Jul 2019 09:54:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xsRB6pcjzDqNC
	for <lists+openbmc@lfdr.de>; Mon, 29 Jul 2019 17:54:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=wangzhiqiang8906@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XMYPsHJ0"; 
 dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xsQc6LK7zDqK3
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jul 2019 17:54:16 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id r9so57616555ljg.5
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jul 2019 00:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wYDNa1ELLwPHlRk9XBiVoHb4KG/a2uHs/oy5XhXxrW0=;
 b=XMYPsHJ0Fseh/tgspwmYbxXd4udg/4CEstCzrkZOasHe+MBjW9xJ0p1F9Bg96E1iwZ
 DYLw3SDa2RLu3lZPIu76gkk0v1bwUyVsaBkQ70tgH2pbNMv9NKqkSrl4MnXw95uKTDpv
 llZgD07KgTw73gkc6ObKvlkYuOJsCg5Vi5hB2iRj5j2znlRRvsFhCC9MBKfvUQ4gu5yX
 GgL3XvbDflk9TAKoT7gmt/qJJtnS6BUaZKcoistggZ6jmCIYmcUD6nbq9HD7wOfUk4Jw
 Wc5+uROp2rMcuvdmA7HVPKYfVHlozqZX6RJx4OlWwq026Z+Wrin5bMJe1t14DX9nxCQR
 YrcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wYDNa1ELLwPHlRk9XBiVoHb4KG/a2uHs/oy5XhXxrW0=;
 b=jrzw+8VN8vm9PjRxnCr2Afc8rjp9PGuQV2JQSqygboa/hXi7YKBZ2gZpEE8frPq5YG
 Fohuf4ubbQ8QZRBPgXin/U5bZsPiipAE2Kwgi8fvM9NpRlnzEOfK3Qk8U2s4IbBWBAb4
 xwwsphy83Rxen+dojIa3T8HeRIgRwBdtaQDEo4lPIgf/Qk/4BA3V3OIbDh57bueoMTNQ
 YBcLm+nKb9yj0d2yXYg5Gzfr/1SgOHCGduhf2kjVbsKmszWvIjvX3QmVG/EezrbIkR+x
 Bex7v8EvItDGjpyT0aM1mwsG/xurGR6TSev2gwJfJ16qX/YMdtOZwJoUhiLSy310maGf
 zU/A==
X-Gm-Message-State: APjAAAWzGvVso49JGr90CCLA81qq42LBJFDgVgXcoNeZxqPWnGuAJAJx
 rytSvgSJW4QaOKFZdKLZG59HNcdZjjnR2IBgLqw=
X-Google-Smtp-Source: APXvYqwT0UB8qSx/rMIfxkm6dsU3LMNG28zIZLa0sMS4MmpOT5Db+gEgQo0yWkIqHG8te37TpVOZeBRdYkcUrjx6+SI=
X-Received: by 2002:a2e:9754:: with SMTP id f20mr56242231ljj.151.1564386846139; 
 Mon, 29 Jul 2019 00:54:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAHkHK0-dT2R6WUowZhaLgVurFPukL3tmJGneXCEijKew=1uRyA@mail.gmail.com>
 <46f3ba00-9382-2040-80a7-519457ecd65c@linux.vnet.ibm.com>
 <2f7ad2ea-7717-4f9b-bdd5-b6efc131cf4e@www.fastmail.com>
 <CAHkHK0-_rKUd5EbyUtcgYttpZoy1-md8AG7f-8Er075pgObqBQ@mail.gmail.com>
 <d799bdd4-8889-41d9-bf40-e5ccc7170ff4@www.fastmail.com>
In-Reply-To: <d799bdd4-8889-41d9-bf40-e5ccc7170ff4@www.fastmail.com>
From: John Wang <wangzhiqiang8906@gmail.com>
Date: Mon, 29 Jul 2019 15:53:54 +0800
Message-ID: <CAHkHK0_-qUxYC+Q9fEWqyCJKdgzs=upFA+-qMqfUtuGpQLib_Q@mail.gmail.com>
Subject: Re: How to ideally fix the log function
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@linux.ibm.com>, Patrick Venture <venture@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jul 29, 2019 at 8:26 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Fri, 26 Jul 2019, at 12:33, John Wang wrote:
> > On Fri, Jul 26, 2019 at 10:08 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > >
> > > Having said all that I'm not really a C++ person, but it appears the API has
> > > trapped itself in a C++ corner. Maybe people more experienced and creative
> > > than I can come up with something, but I think the best thing we can do
> > > is three-fold:
> > >
> > > 1. Build libsystemd with `CFLAGS=-DSD_JOURNAL_SUPPRESS_LOCATION`
> > > 2. Add a new log macro that allows us to capture the info properly
> > Maybe something like below:
> > ```
> > struct traceLog
> > {
> >     traceLog(const source_location location = source_location::current()) :
> >         location(location)
> >     {
> >     }
> >     template <level L, typename Msg, typename... Entry>
> >     void log(Msg msg, Entry... e)
> >     {
> >         phosphor::logging::log<L>(msg, entry("CODE_LINE=%d", location.line()),
> >                                   entry("CODE_FILE=%s", location.file_name()),
> >                                   e...);
> >     }
> >
> >   private:
> >     source_location location;
> > };
> >
> > int main()
> > {
> >     traceLog{}.log<level::INFO>("xxxxx", entry("entry=%s", "xxxx"));
> > }
> > ```
>
> My immediate thought is "pretty ugly" :D

I tried my best to make those codes  "pretty" ...    sad.gif..
