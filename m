Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6886914E3B
	for <lists+openbmc@lfdr.de>; Mon,  6 May 2019 17:02:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yQtr2Yy0zDqK5
	for <lists+openbmc@lfdr.de>; Tue,  7 May 2019 01:01:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="CvqnuEJT"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yQpl0kkGzDqJf
 for <openbmc@lists.ozlabs.org>; Tue,  7 May 2019 00:58:22 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id x15so6501534pln.9
 for <openbmc@lists.ozlabs.org>; Mon, 06 May 2019 07:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jCzRM1TJk4LPymhZfDeM7wKK0QYk90S8NWZX4hhsDHA=;
 b=CvqnuEJTGHzTP7ETjxPzZ94KUwNbhs269KtLAk4HTrLxpmtmQ12CR83GjtgO0ZTR/t
 zamYf89ovpkayPUZsGMsIRO8oGDjIFkQcRmf62FJG3fxsYWan7/eN59tm3hNItjbwTpu
 J/2Dft+vQ5U/P2OA00HcAgCOYQ9L5qstVBjOcDsBN2UCshTnvtbRVuwKJ0EzU9uqB33H
 PHLuz4xtvH1bOXE6Wq7jZvUMQhAmOskGOSVi1sdc63qu3+CFBEHclJuqI5triZdWLDVi
 LYCdpaXfXZtm9y6COQvh4mxWIGRq7ZduQIZtV/AYYkM4tWRjkPX4tDCrHLii/udr+QMc
 IloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jCzRM1TJk4LPymhZfDeM7wKK0QYk90S8NWZX4hhsDHA=;
 b=nHXgR9STQGOyYCgN0PtMvsaiCT6RpZlMpYCa8qhXkvdYSi51CqqWyQyV8GZSOec0YH
 Rc5SO837YHOR93Hs4h7mNcoUCPcBzEvlXtjZ9SkDaufm1xR0DgrBCN22inv02izXd126
 xT7n8pB2QTpwWhEQ9Y10PWQvGuOoskQOZgWw7LAHim6hA2EKM7wsMZi8LFFiY/hlK4qC
 oecwT9VKkGWNhaMko/V1/caVxWRkW1Pl+xYnYUgMxKf8vpYfkVdVkQPWRiBl5aEEe1Nv
 Dzxv2OUsMJsnZ2Ag2qqyweAXEgblsATbmWItVRVth8J161h52z+UfI5J3HC9Z310euAE
 KZhw==
X-Gm-Message-State: APjAAAUM7ontLTskF9f2IHkj78/tLBnkCzdaAeFZyejIxTN5Jxh+y7FB
 Jh8085iv/5Z/R9tTkQ+5/J8fSNgo5KteLiBsb72UOJliLu0Wgg==
X-Google-Smtp-Source: APXvYqyp3GuLNH9rAdqG1cIBcunTYC5Kd5FZO++ghU6RV8zsAh78yT9CsAotx4e9Zmqa3YMty9B/pUmQMn+supbZ+1M=
X-Received: by 2002:a17:902:10c:: with SMTP id
 12mr22047845plb.61.1557154698793; 
 Mon, 06 May 2019 07:58:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notyajN+Sft6MNBku81Kiovagfo7B_Pzm4bqf1NsLtAOX7A@mail.gmail.com>
 <8b3e70c9-f182-44cd-997e-5d07b26d76a3@www.fastmail.com>
 <CAPnigKm6=LS5Pvf5_KUhc9yDJNJUXFfKSgpwdRvjVmOKSHcrtg@mail.gmail.com>
 <CAO=notzgk0nJvqqb9HZYRvAOA0d2gyZRfsD7ah+zr3Uu7q_eEg@mail.gmail.com>
In-Reply-To: <CAO=notzgk0nJvqqb9HZYRvAOA0d2gyZRfsD7ah+zr3Uu7q_eEg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 6 May 2019 07:58:07 -0700
Message-ID: <CAO=notxeVMNdmLnkfcfzyDOHJMMGuz49M=x45ewT+ePBr+fDEQ@mail.gmail.com>
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

On Mon, May 6, 2019 at 7:35 AM Patrick Venture <venture@google.com> wrote:
>
> On Sun, May 5, 2019 at 10:02 PM William Kennington <wak@google.com> wrote:
> >
> > Worth noting that lspci just uses the libpci library provided by
> > pciutils. I would try and use that before parsing lspci.
> > https://github.com/pciutils/pciutils/blob/master/example.c
>
> I ended up building in libpci and just calling the C methods from c++.
> I preferred a single linking/calling environment, hence, cpp, but it
> works fine so far.  Sorry, forgot to reply to this call-for-help.
>
> >
> > On Sun, May 5, 2019 at 8:32 PM Andrew Jeffery <andrew@aj.id.au> wrote:
> > >
> > >
> > >
> > > On Sat, 4 May 2019, at 02:28, Patrick Venture wrote:
> > > > Does anyone have a favorite CPP library for talking to PCI?  I don't
> > > > think parsing lspci output is as clean.
> > >
> > > This feels a lot like the X-Y problem:
> > >
> > > https://mywiki.wooledge.org/XyProblem
> > >
> > > What are you actually trying to do?
>
> Parse the PCI devices on a system to find a PCI device and then read
> its configuration space, and write to a memory-mapped region. -- Which
> is exactly what a library talking to PCI would do.  In this case,
> there is a C one that works perfectly well for what I need.

This is the code I wrote leveraging this library:

https://gerrit.openbmc-project.xyz/21158
https://gerrit.openbmc-project.xyz/21168

Not perfect, but it's nice enough and does exactly what I want without
really much overhead.  So, I'm happy with the outcome.

I hadn't seen a write-up the of the x-y problem before.  That's neat
to see like a formal description.  So often, the first question I ask
of someone is -- "what is your end goal?"

>
> > >
> > > Maybe poking at sysfs directly might help?
>
> No need, libpci (pciutils) handles the poking and provides convenient
> methods for reading the information required.
>
> > >
> > > Andrew
> > >
> > > >
> > > > Patrick
> > > >
