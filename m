Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 983C52E28A8
	for <lists+openbmc@lfdr.de>; Thu, 24 Dec 2020 19:54:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D1zkx1y8VzDqPW
	for <lists+openbmc@lfdr.de>; Fri, 25 Dec 2020 05:54:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=QPcn3pFv; dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D1zkJ3fdQzDqM4
 for <openbmc@lists.ozlabs.org>; Fri, 25 Dec 2020 05:53:40 +1100 (AEDT)
Received: by mail-yb1-xb36.google.com with SMTP id o144so2893660ybc.0
 for <openbmc@lists.ozlabs.org>; Thu, 24 Dec 2020 10:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Qi+guwVKZ+JEdq2vDjiIIhSjCHvYup8t8UsEepWHj60=;
 b=QPcn3pFvPoUozlaIOwrsKvSkcva2JhzcumXkZ2dmJYpXuc8mFtVNe9JY/XMKRIWl/f
 R0J6BkdvuqOCAMA2ZXMOcplck/r3KoD8VuzhNC2FZJUAgBuose5sZCfbtURQXspAKyBU
 7OeHfjesdpOgMgWD/diaAxyDesAG98OrMvo6untssVF2wl2IPz4o0g+4rhmjNzr3kLQ3
 3rOx1h/dPLiyrrLEMLJjy5EAdfXy/mKtbCw29cdI+4ClWVn2w88OGNQSgwKAwDkpnJh4
 XeZX0z4hIdGvD+bCGuuNChPjcBBDV98xOINgeuLUzXjiL5SIHOUSF3lFYmyCJ/Y9Mp4a
 TA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Qi+guwVKZ+JEdq2vDjiIIhSjCHvYup8t8UsEepWHj60=;
 b=WmtLh0unckmT2Q8SQdt4AsIXmgpNaHjHFtPbItnV+fk9uHPmHglohULFlV4wa+cyMP
 vuxpDYoI/G15KxOvkL71cPtEsQpxcRJSAEhECgfyBlrvJzlJLn0+WCQnLFUP1qbODhww
 lz2UXeLlsnJHd+JhT8SFQQctsi9FLk6DsVfaRbVAuVYjn+WFqie8nGForAFotVnicEh+
 jPpFA+PQQFYFKA0thoGJW7j1+WAYQcTRK8XSzN37sz2f7TB5esM4pxVA2x9htTv/NH39
 ictDbXzP1wpc8kr7z2Jd5/Rx29IFAB8928ysNmeEBytwWM3RzR2CpI0sNiOxTX+/qQOX
 eM/w==
X-Gm-Message-State: AOAM530PeSHDc15toHsN8Rrp+SgXWI+sqd2gBMdPp4NsEWKnrrk+OPOY
 YrFvYslK8UhRtPHXgKNqVL6DrpWM2/UukbYnyxuvq0pBAOg=
X-Google-Smtp-Source: ABdhPJwlQQFA0KuKNG6cigCZekv6RNdZv9E74xso1j7sWccF98GaMk7uDO2aIHObj9tUHRjboNKcjzHYRx5KMpgjWzQ=
X-Received: by 2002:a25:7108:: with SMTP id m8mr30416930ybc.209.1608836016727; 
 Thu, 24 Dec 2020 10:53:36 -0800 (PST)
MIME-Version: 1.0
References: <6c2c44435e704f6eee95b7e35cbc39ccfae32b62.camel@yadro.com>
 <EC305987-22B3-40D2-86A6-4FF95B395956@stwcx.xyz>
 <CACWQX82quUYK+r0BkDqT0ZABXgRPj797Wwr8Joov05w8tCLwuA@mail.gmail.com>
 <0759e6524c910c8d24f1453dbbe226bc3460e588.camel@yadro.com>
In-Reply-To: <0759e6524c910c8d24f1453dbbe226bc3460e588.camel@yadro.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 24 Dec 2020 10:53:24 -0800
Message-ID: <CACWQX80E873CA2_LH7kVXHoGjuAZGUM21rxA6nsk8gMG-Ocemg@mail.gmail.com>
Subject: Re: peci-pcie CI issues
To: Andrei Kartashev <a.kartashev@yadro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "jason.m.bills" <jason.m.bills@linux.intel.com>,
 openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Dec 24, 2020 at 10:34 AM Andrei Kartashev <a.kartashev@yadro.com> w=
rote:
>
> Well, then probably we can wait.
> How far this could happens?

Whenever the work gets done.  Someone needs to:
Send a patch to yocto upgrading the boost recipe.
Wait for the meta-layer bump to run (I think Andrew runs the job once a wee=
k).
Resolve any issues with the bump when it gets merged to OpenBMC.

There's no exact timelines on the above, but you can certainly
accelerate it by doing step 1, after which you're probably looking at
a couple weeks before we get it in OpenBMC.

>
> On Thu, 2020-12-24 at 10:23 -0800, Ed Tanous wrote:
> > On Thu, Dec 24, 2020 at 10:07 AM Patrick Williams <patrick@stwcx.xyz>
> > wrote:
> > > We have had this issue with a number of repositories lately. The
> > > most recent version of boost::asio does not allow -fno-rtti.  The
> > > makefile needs to be changed to no longer force this option.
> >
> > Or, as another option, just wait until boost 1.75.0 lands in yocto
> > master and subsequent openbmc bump.  It was released a couple weeks
> > ago and fixes this issue.  We'll likely be adding the no-rtti flags
> > back to most of the repos shortly after that.
> >
> > > Sent from my iPhone
> > >
> > > > On Dec 24, 2020, at 9:48 AM, Andrei Kartashev <
> > > > a.kartashev@yadro.com> wrote:
> > > >
> > > > =EF=BB=BFHello Jason,
> > > >
> > > > I push several patches to peci-pcie repo, but looks like CI
> > > > broken
> > > > there. Could you take a look on how to fix CI?
> > > >
> > > > [ 90%] Building CXX object CMakeFiles/peci-
> > > > pcie.dir/src/peci_pcie.cpp.o
> > > > In file included from
> > > > /usr/local/include/boost/asio/execution.hpp:19,
> > > >                 from
> > > > /usr/local/include/boost/asio/system_executor.hpp:20,
> > > >                 from
> > > > /usr/local/include/boost/asio/associated_executor.hpp:22,
> > > >                 from
> > > > /usr/local/include/boost/asio/detail/bind_handler.hpp:20,
> > > >                 from
> > > > /usr/local/include/boost/asio/detail/wrapped_handler.hpp:18,
> > > >                 from
> > > > /usr/local/include/boost/asio/io_context.hpp:23,
> > > >                 from
> > > > /usr/local/include/boost/asio/io_service.hpp:18,
> > > >                 from /home/jenkins-op/workspace/ci-
> > > > repository/openbmc/peci-pcie/src/peci_pcie.cpp:22:
> > > > /usr/local/include/boost/asio/execution/any_executor.hpp: In
> > > > static member function =C3=A2=E2=82=AC=CB=9Cstatic const std::type_=
info&
> > > > boost::asio::execution::detail::any_executor_base::target_type_vo
> > > > id()=C3=A2=E2=82=AC=E2=84=A2:
> > > > /usr/local/include/boost/asio/execution/any_executor.hpp:811:23:
> > > > error: cannot use =C3=A2=E2=82=AC=CB=9Ctypeid=C3=A2=E2=82=AC=E2=84=
=A2 with =C3=A2=E2=82=AC=CB=9C-fno-rtti=C3=A2=E2=82=AC=E2=84=A2
> > > >  811 |     return typeid(void);
> > > >      |                       ^
> > > > /usr/local/include/boost/asio/execution/any_executor.hpp: In
> > > > static member function =C3=A2=E2=82=AC=CB=9Cstatic const std::type_=
info&
> > > > boost::asio::execution::detail::any_executor_base::target_type_ex
> > > > ()=C3=A2=E2=82=AC=E2=84=A2:
> > > > /usr/local/include/boost/asio/execution/any_executor.hpp:851:21:
> > > > error: cannot use =C3=A2=E2=82=AC=CB=9Ctypeid=C3=A2=E2=82=AC=E2=84=
=A2 with =C3=A2=E2=82=AC=CB=9C-fno-rtti=C3=A2=E2=82=AC=E2=84=A2
> > > >  851 |     return typeid(Ex);
> > > >      |                     ^
> > > >
> > > > --
> > > > Best regards,
> > > > Andrei Kartashev
> > > >
> > > >
> --
> Best regards,
> Andrei Kartashev
>
>
