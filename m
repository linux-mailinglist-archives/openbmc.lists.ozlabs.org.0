Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 908EA306085
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 17:05:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQpNQ6NmRzDqpM
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 03:05:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::732;
 helo=mail-qk1-x732.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=i3C2TEoH; dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQpMF2vmdzDqX8
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 03:04:23 +1100 (AEDT)
Received: by mail-qk1-x732.google.com with SMTP id x81so2198211qkb.0
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 08:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bk5gFe/ZheOr0ZEK2PhTMOiknd+4muPH4yGQl3AoTlY=;
 b=i3C2TEoH3YHYZL+DLoGOlaEqbny3F5AHA7fiHgCtLxmqanNBkIMw4N2DL6uZYA7Qv5
 KB5QoLO7KuvgBGnU3DhUJo9+++inmlyf/fMgdN3E+npmGHTpPSuDzGuAJcnP4/Y8TTRI
 mRV155rABhAOUeS6x0Ep0OGkbpgApnmH4Ruu4Pz0BF2anWqeQcw923IK7xX/Dnkle6Ci
 sv/YDBZ+dLPTCfLF3xiQwQJSXNDNCY8L44BqYeP38UQHXUfB83PCx49unuab5rBVYNk6
 KJunni1qaMZIaVHlG5poyD8DrizKC9m//O0BpL6Vyu4ue4EqGvUzxk3E+N+obcqPiTIc
 g1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bk5gFe/ZheOr0ZEK2PhTMOiknd+4muPH4yGQl3AoTlY=;
 b=A2Zu7Rm/s9stTPwRPy9flVk6XUm0On5tuVcIB/juq22RkusAsSNXn5uwN8CtIeifWW
 hYGZH//pw40mg2roKN61Oi8n22SeOY/YaWZaVIUVCnD4qWF0xwceCTKBlH6XtpHW9/QY
 nUL6sW2dPtg8j1qSt+0Y4N3bJvSNYO6jnl0g4462hLfMti4fc/f0aAJU3OhrzCVGEmmX
 jmwUthcdTgfMhHrOyNSR015jU5I1TTJRulXhxd1iPaOoaN84DRPD7QavIZXuTVUHS1sO
 lut0aD8mGaQDyydsnoqm2gxgOnnjQ9oYslyIMyxW15bJ1v07xv3J+39APpW6B5n+rhSw
 O5NQ==
X-Gm-Message-State: AOAM533AXb9O6qGN6J7tZ2BOixcUkueTukmcWwxWGO0wWze83VqM1n13
 iIdam1p/kzSsdtubgQ4Uu4LTdFkpvw9YmhSXGEBGig==
X-Google-Smtp-Source: ABdhPJzV/ZMpBZO56Xi0WLctzt9WBI9Mio7FCgYGw+lrhphJq2J8cikuDPBMgLbQBmBo0LJdpYDJf/OUWE9Hyl4Cr3Q=
X-Received: by 2002:ae9:d881:: with SMTP id
 u123mr11217517qkf.133.1611763459389; 
 Wed, 27 Jan 2021 08:04:19 -0800 (PST)
MIME-Version: 1.0
References: <PS1PR06MB260095F62386276E75ADC5708ABB0@PS1PR06MB2600.apcprd06.prod.outlook.com>
In-Reply-To: <PS1PR06MB260095F62386276E75ADC5708ABB0@PS1PR06MB2600.apcprd06.prod.outlook.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 27 Jan 2021 08:04:08 -0800
Message-ID: <CAO=notwtzF96o9oJe=5px4KFWFdzWQxHMMbFdA2JmwEFBLC8bA@mail.gmail.com>
Subject: Re: Supporting new interfaces in phosphor-ipmi-flash
To: Troy Lee <troy_lee@aspeedtech.com>, Brandon Kim <brandonkim@google.com>, 
 Benjamin Fair <benjaminfair@google.com>,
 William Kennington <wak@google.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jan 27, 2021 at 1:44 AM Troy Lee <troy_lee@aspeedtech.com> wrote:
>
> Hi team,
>
> For security consideration, user might want to disable AST2500/AST2600 P2=
A functionality by default. To compensate the effect to phosphor-ipmi-flash=
, we're planning to support two alternative in-band firmware upgrade over P=
CIe for AST2500/AST2600 (AST2520 and AST2620 are excluded):
>  - Through a reserved **VGA** memory on BAR[0], or
>  - Through a reserved **PCIe** shared memory on BAR[1]
>
> The usage pretty much the same as P2A, but it runs on different BAR, offs=
et and length.
> This will involves modifying phosphor-ipmi-flash/[tools|bmc]. Should I cr=
eate new **interfaces**, e.g. astpcie/astvga?

I'm not sure it makes sense to create new interfaces, but rather to
add optional parameters for those differences... but I've added some
people to the reply line to help answer.

>
> Thanks,
> Troy Lee
>
>
