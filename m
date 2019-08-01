Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C747D347
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2019 04:19:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zYsK5BnFzDqnr
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2019 12:19:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kRcwlh4l"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zYrg5LsSzDqgn
 for <openbmc@lists.ozlabs.org>; Thu,  1 Aug 2019 12:19:15 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id j5so136745913ioj.8
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jul 2019 19:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/XK9t2nXa6IvzG/6kFqvXkVVUTV0VpdT/J0R6re56Tg=;
 b=kRcwlh4lHSJhcX2LqxFyE1GckG6ImcyhpgiydcEUpK5S0Wbtsc8oXB7HZhzOGJ9Zf8
 IoHsWaZWc9GJINB0YcYCgOCi6xRV7sQ9PVlJkmYr48uUsPJ/yrJBHd85PXZ13gyqRtw1
 MLo5HPLtJzuENZmxYnLnB1UP2i5XUAL9ODHVGx62UWKTWcObd835exWzeJuHRT2Kn1ct
 29ht31fT/bPc14LEBePxvcZ2Ep9erom4GQCIVFem/PIdVeAtE+5vemGq5RJJuhX9I7EO
 RHrbDQwmIZ6MFrRASHPy4OeuKEDseeEp1gdVZOMFl36cp4C/Q0d9dtrpJydNxc+grNly
 RGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/XK9t2nXa6IvzG/6kFqvXkVVUTV0VpdT/J0R6re56Tg=;
 b=eg+DF1a3Pa/Su8Vplg7Nl4q/B+L3J+pYcyO25ftmbp3ONYwVuXCVAmVzhTEkIhgpW6
 KlKgceljSege+2iXdECBl9tBJWSQdijYMYOa/40nNFgtj7t5R0QLpaV2JAF8rxfwhwN/
 EFLe2krcsZEOLiE/31Po0mti/DbwYqRsASo4hmMSGPzrFtbHLeAbYjW6t6jW5MyyjL1f
 zYGJQ3xirW6eXpOiupf9K2dgODopqFQy3oLQWVxsL82kM3skChrOPd81zWwZ8SVU6Y4N
 vBOPvjxipIHJ4IOrEqfMx9uYXAOC3epi424azCzAgr9u8f7HCjBi/lNZHX/jdpAP6yR2
 Y1NQ==
X-Gm-Message-State: APjAAAV3PjHQF7adqhpQ1eu1q9lxIBvK+O6l4IEuHr5XxlqOvRwWoPtI
 peMDcoVMgaQjMNRNNV7Qxd2eblkLJn/7py26m+M=
X-Google-Smtp-Source: APXvYqy666aMS8cCCbXcDjc5npIR9d5+jdMBLIYbjVE9YuPJYcsPYcjjbvyt141/RsedD8z46F5SPVSMeSpXTGF8v74=
X-Received: by 2002:a6b:b985:: with SMTP id
 j127mr62510178iof.186.1564625951831; 
 Wed, 31 Jul 2019 19:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAHkHK09bSzJZ0eRPYH9cd7SOB4bektv4uK1WO1=dEcTec=jxTg@mail.gmail.com>
 <CAARXrtkqv25KVKvhU5wbk0gLp=F4T=-hL4KJLdWkTK2twGt3gQ@mail.gmail.com>
In-Reply-To: <CAARXrtkqv25KVKvhU5wbk0gLp=F4T=-hL4KJLdWkTK2twGt3gQ@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Thu, 1 Aug 2019 10:19:00 +0800
Message-ID: <CAARXrt=cL9dj4yqQt4d9pVXACjjt_Z+KQ+1fFPuM6WA7tvztaQ@mail.gmail.com>
Subject: Re: How to switch pcie/ocp Nics for ncsi
To: Patrick Venture <venture@google.com>, William Kennington <wak@google.com>
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
Cc: John Wang <wangzhiqiang8906@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I would like to bring this up again.

Could someone who worked on Zaius share how it configures NCSI source via
GPIOs?

John Wang is going to implement this feature. If Zaius has an existing
solution, it would save a lot of effort!

Thanks!

On Wed, Jul 24, 2019 at 1:24 PM Lei YU <mine260309@gmail.com> wrote:
>
> Zaius has a similar design that it uses two GPIOs to select from 3 NCSI sources.
> But I do not see related code from meta-zaius.
>
> @Patrick Venture is it possible to share what you have done on Zaius machine
> about how to configure the GPIOs to select the NCSI source?
>
> Thanks!
>
>
> On Wed, Jul 24, 2019 at 11:44 AM John Wang <wangzhiqiang8906@gmail.com> wrote:
> >
> > HI,all
> >
> > FP5280G2 BMC MAC0 is for NCSI, and there is a
> > separated GPIO to select the NCSI to connect to PCIe or OCP
> >
> >                                         -->PCIE
> > mac0-->mux(TS3L501)
> >                       ^                 -->OCP
> >                       |
> >                GPIOH7
> >
> > I want to switch pcie/ocp NICs and preserve the state bewteen
> > BMC reboots and AC cycles.
> >
> > My solutions is:
> >
> > use gpio-hog, and dynamically modify the dts file in userspace.
> > But maybe it is a bad choice.
> >
> > are there any good suggestions?
> >
> > Thanks.
> >
> > John
