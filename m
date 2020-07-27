Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D16A622F8B0
	for <lists+openbmc@lfdr.de>; Mon, 27 Jul 2020 21:10:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFqBg1MWQzF1LJ
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 05:10:19 +1000 (AEST)
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
 header.s=20150623 header.b=F0YJgLuf; dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFq9m0FbDzF1LJ
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jul 2020 05:09:30 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id d133so7365937ybh.5
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jul 2020 12:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eJzjKzkCGkUAm1CaC+ou5VRTXJvSZhmnantxF/ZlacI=;
 b=F0YJgLufKbSlUMaYYRaVuuPaSb8oWzOGjFrS9ciU8XpfFzGfaexfkPRxJR04INAwSV
 YQTxRXiawkPYkkOlECqAw1lopkk7RjLNcyqCxUB3aQxxlPU4/GL3po2gUszbUSuCkYSD
 H1OCl19838RK9latGqbWfhBVypLe+7w8rm/WQBDBqYOlRaRY2LnrL/giXEJT0X4GVNzX
 r8mx2SKIMmdHwnzsIt82dogHruK1SKBX1Zmor9zRGfmxIsXTAetYorWx3H3weptM7StJ
 0BkUE74fOinZDp3NlA7U/rgTj2HqWhJlZufryygN1KFG3zlRekTQgk+KcPq0/kkACy53
 OKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eJzjKzkCGkUAm1CaC+ou5VRTXJvSZhmnantxF/ZlacI=;
 b=thsvK/T9NqhGWqZvx1myEVXr2JCk7quCXffh9abIVX7gg1sAmwuJAO6R/bzA8Lz7aP
 yi+EXi863BpenkC8gdb6v6FPZjfhBmDgY0zR4YgnWidXdPJ1p+EGFpFYEBziueBcKUaW
 JMZNC553HAMUA63563k2zzdH0VhOTC+8Eg7fEKxIMllY6FZrDQYbW4vUps957lbTEjrc
 JcAYG5h2AtbyH+mzcQKLzGnd6olLC1Lm+Q8TZFmbdux4KdVvNkiMcehYwSU+CanuLjYA
 xBiEyJCAprkhEsfaYyI23bvsvPgVHiS6aapMNswbx1v83hm30l2RhYrf72bBKJZALTMy
 cVPQ==
X-Gm-Message-State: AOAM530Vage3KSECa9pgeg20krgFeNIwET7iauC0fhz6MEZ3BaihwRju
 VMY0jMq2Z6qP5DLsf0ZHNbqg90ma0sZHHe53auVvgw==
X-Google-Smtp-Source: ABdhPJw7dKNcNAE+Rbuv6YjYg3Vn3y49npLpd62ffYltfTDzBeD0Il2Ung6JnMKKavgZhO2zHqla5bM7FDhMEpMxx9A=
X-Received: by 2002:a25:ab34:: with SMTP id u49mr36798780ybi.203.1595876966681; 
 Mon, 27 Jul 2020 12:09:26 -0700 (PDT)
MIME-Version: 1.0
References: <E38290F8-4FC6-4FF3-9FF2-5ED7853FE1DB@gmail.com>
In-Reply-To: <E38290F8-4FC6-4FF3-9FF2-5ED7853FE1DB@gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 27 Jul 2020 12:09:17 -0700
Message-ID: <CACWQX81_jq5asAMmiU-WCN1xsUDUpGL9DQtw5MuKSiq2q5GEPQ@mail.gmail.com>
Subject: Re: Infinite redirect.
To: Mike Jones <proclivis@gmail.com>
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

On Mon, Jul 27, 2020 at 12:03 PM Mike Jones <proclivis@gmail.com> wrote:
>
> I need help debugging an infinite redirect.

Without reading the rest of your email, there is a 95% chance that
this means you didn't include phosphor-webui component in your build.
It is a known "bug" that has bit several people, and I've been meaning
to fix it so it at least gives you some better error and/or at least
doesn't redirect, but architecturally it breaks some weird boundaries
a little bit (the login routes have to be aware of which other routes
have been registered, which imposes an unintended ordering on the
route handler) , and I've just never had the chance.

>
> Using tag 2.8.0
>
> I built meta-phosphor with raspberrypi4. See https://github.com/Proclivis/conf-meta-rasberrypi-evb.git
>
> I setup a host entry on my ubuntu laptop in /etc/hosts
>
> 10.0.1.72 bmc
>
> Then with firefox use url
>
> https://bmc:18080
>
> I get a redirect to
>
> https://bmc:18080/#/login?next=%2F
>
> Which also redirects again.
>
> bmcweb is not sending a cookie on the first request.

Nor should it.  You're not logged in yet, nor have you given valid
login credentials.  The redirect is trying to move you to the webui,
which can then present a pretty login screen.  Unfortunately the webui
doesn't exist, so you hit another redirect.

>
> On the target, token_authorization_middleware.hpp:187 is failing the cookie authorization, probably because Firefox is not sending back the cookie it never received.
>
> There are two failed services not running:
>
> obmc-phosphor-sysd.service
> start-ipkvm-.service

Those should be irrelevant to this issue.

>
> I assume these would not interfere with something as basic as cookies.
>
> Is there something I need to configure on the target?

See above.
