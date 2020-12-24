Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E53E2E288F
	for <lists+openbmc@lfdr.de>; Thu, 24 Dec 2020 19:24:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D1z4H0tkNzDqP0
	for <lists+openbmc@lfdr.de>; Fri, 25 Dec 2020 05:24:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=C/ZV1tE+; dkim-atps=neutral
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D1z3b6xxCzDqGM
 for <openbmc@lists.ozlabs.org>; Fri, 25 Dec 2020 05:23:35 +1100 (AEDT)
Received: by mail-yb1-xb2b.google.com with SMTP id k78so2771760ybf.12
 for <openbmc@lists.ozlabs.org>; Thu, 24 Dec 2020 10:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DOQLJON5WW4evO7jR3k5DCwhaeZ13QvgXg0JaM1911k=;
 b=C/ZV1tE+MBIM3i9ucYqof7zWQ34LWpwBFCF/hc3DlVRo6NezUFU3+vGIlEP38CfsAF
 2hSshxaJFuz9okflc0U24c1FY0I9RdExbIbvLXYCbCkLajQbV1rCKXF8XSQl/tofvcZg
 D6SjSP2YJ5DEMRX6nxODNn8Wi0FO88qUkxdD9DyOjPsTKG4bb/Qw5zpF/HW8PS6F3aEA
 yB4n9cBCTGjft2Mpq+AznJSN1NoGiNujyp6BSb3v9zQ6pqIEdlGIhdm36BDM6qD7ZhrQ
 Q1j1CjxWM0UqyAyPfNn+MsFUmRZI35lPKpupefghjJ1+etd/KUoAORuh259Qg5pY5Jmg
 77lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DOQLJON5WW4evO7jR3k5DCwhaeZ13QvgXg0JaM1911k=;
 b=JwkaH8wDgs2KNGpCxH1tYbAfsUSwaHc6p8GCcuPGaiAoFi+il64cUxsg/PFZyhVgVH
 Wlnzo+w4lCDzwTi6nbMslkCQAYzqhqgP7mFYQXIggqy4KLLAUI5sO9ZAOdw1ZrWSOL0r
 4P2JDrZXi8ihiv6nVWlxEYOmBMCDmRvBvglglBHC9UP7x7exFWrfAY+AM8bjXOzgbG4c
 3kvkzoZVhPGykEIu9LE2pkrA7Ju2Lygok27bOXtr+cg9blvBs5hsqJvybPNYHvo6BDqI
 UpKKLvTSSearh6s7Rgg03fiexP7XCtW81meHuYSFykx/CGR15q+v4wnYoRiNlbXQFR1R
 HeYA==
X-Gm-Message-State: AOAM530cyXgaQbJHJStRNpwExyIG/uy+I2txeQyKxZqN02T0kezToogG
 EkiQZDZWidl9BS9YP5U68LmTKWhkmoNtB6KcOIloyw==
X-Google-Smtp-Source: ABdhPJytsqS8cKx9SU9VKVzCESblNNn2qSY/Ju8/7pqbJcCk8R5cc2rLsM1lJ6oIigYBLgywkdpojT4j9K+Bc99FDPY=
X-Received: by 2002:a25:d4e:: with SMTP id 75mr41355182ybn.340.1608834211428; 
 Thu, 24 Dec 2020 10:23:31 -0800 (PST)
MIME-Version: 1.0
References: <6c2c44435e704f6eee95b7e35cbc39ccfae32b62.camel@yadro.com>
 <EC305987-22B3-40D2-86A6-4FF95B395956@stwcx.xyz>
In-Reply-To: <EC305987-22B3-40D2-86A6-4FF95B395956@stwcx.xyz>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 24 Dec 2020 10:23:19 -0800
Message-ID: <CACWQX82quUYK+r0BkDqT0ZABXgRPj797Wwr8Joov05w8tCLwuA@mail.gmail.com>
Subject: Re: peci-pcie CI issues
To: Patrick Williams <patrick@stwcx.xyz>
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
 Andrei Kartashev <a.kartashev@yadro.com>, openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Dec 24, 2020 at 10:07 AM Patrick Williams <patrick@stwcx.xyz> wrote=
:
>
> We have had this issue with a number of repositories lately. The most rec=
ent version of boost::asio does not allow -fno-rtti.  The makefile needs to=
 be changed to no longer force this option.

Or, as another option, just wait until boost 1.75.0 lands in yocto
master and subsequent openbmc bump.  It was released a couple weeks
ago and fixes this issue.  We'll likely be adding the no-rtti flags
back to most of the repos shortly after that.

>
> Sent from my iPhone
>
> > On Dec 24, 2020, at 9:48 AM, Andrei Kartashev <a.kartashev@yadro.com> w=
rote:
> >
> > =EF=BB=BFHello Jason,
> >
> > I push several patches to peci-pcie repo, but looks like CI broken
> > there. Could you take a look on how to fix CI?
> >
> > [ 90%] Building CXX object CMakeFiles/peci-pcie.dir/src/peci_pcie.cpp.o
> > In file included from /usr/local/include/boost/asio/execution.hpp:19,
> >                 from /usr/local/include/boost/asio/system_executor.hpp:=
20,
> >                 from /usr/local/include/boost/asio/associated_executor.=
hpp:22,
> >                 from /usr/local/include/boost/asio/detail/bind_handler.=
hpp:20,
> >                 from /usr/local/include/boost/asio/detail/wrapped_handl=
er.hpp:18,
> >                 from /usr/local/include/boost/asio/io_context.hpp:23,
> >                 from /usr/local/include/boost/asio/io_service.hpp:18,
> >                 from /home/jenkins-op/workspace/ci-repository/openbmc/p=
eci-pcie/src/peci_pcie.cpp:22:
> > /usr/local/include/boost/asio/execution/any_executor.hpp: In static mem=
ber function =C3=A2=E2=82=AC=CB=9Cstatic const std::type_info& boost::asio:=
:execution::detail::any_executor_base::target_type_void()=C3=A2=E2=82=AC=E2=
=84=A2:
> > /usr/local/include/boost/asio/execution/any_executor.hpp:811:23: error:=
 cannot use =C3=A2=E2=82=AC=CB=9Ctypeid=C3=A2=E2=82=AC=E2=84=A2 with =C3=A2=
=E2=82=AC=CB=9C-fno-rtti=C3=A2=E2=82=AC=E2=84=A2
> >  811 |     return typeid(void);
> >      |                       ^
> > /usr/local/include/boost/asio/execution/any_executor.hpp: In static mem=
ber function =C3=A2=E2=82=AC=CB=9Cstatic const std::type_info& boost::asio:=
:execution::detail::any_executor_base::target_type_ex()=C3=A2=E2=82=AC=E2=
=84=A2:
> > /usr/local/include/boost/asio/execution/any_executor.hpp:851:21: error:=
 cannot use =C3=A2=E2=82=AC=CB=9Ctypeid=C3=A2=E2=82=AC=E2=84=A2 with =C3=A2=
=E2=82=AC=CB=9C-fno-rtti=C3=A2=E2=82=AC=E2=84=A2
> >  851 |     return typeid(Ex);
> >      |                     ^
> >
> > --
> > Best regards,
> > Andrei Kartashev
> >
> >
>
