Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEB42FBCDD
	for <lists+openbmc@lfdr.de>; Tue, 19 Jan 2021 17:49:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DKvl56tdNzDr0V
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 03:49:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::332;
 helo=mail-wm1-x332.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=qhgzqMSv; dkim-atps=neutral
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DKvk72Ft4zDqxL
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2021 03:48:42 +1100 (AEDT)
Received: by mail-wm1-x332.google.com with SMTP id m187so392094wme.2
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jan 2021 08:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=T8zGhCuArtJI8g8UJASxPoHq0r5zWuwl+DG+txuugJA=;
 b=qhgzqMSv1ydWhDJZBgnfBg7WQkRWLk3jlmA4rTGvzsNumgyLZRDkHdqHMW9n8FOaIR
 EUm1cHl0REwjr6Nk11TLbqviDqnBPH0YuNZP74JOYaQ/cd4C011LtqdW3Ei5USruRsZU
 wiYiG9TlRFr6wv7cRhZ1kDIp4JN6SkzReBrYrOB7h1DrRu3aL2tJbFOPh0muNHaa73cf
 gStTjCsJStplbtM/X9MumxzUWRQHiekNNQFbFS6gttMevRQNTkVkw81E3E+N6Yo3bK15
 kV6f3OXT64DiaFyzIcuLkrb25nSwZyk6t/Q61ElnBlysf93XVQAOWD2DKaGTrDdHBmDa
 93pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=T8zGhCuArtJI8g8UJASxPoHq0r5zWuwl+DG+txuugJA=;
 b=U2XpBfiR2ZLgB1RO6RNSPue468aoWUVAk/Sjo1ldlfw2LtpVeVSqFm5DHYE8lvnl+h
 h7L3aeTFm2y4Rr+VXCKu5qFjNzj0EPXvb2qji9B0oHDiT+zg9WfJNRxil61FfwCQbEjg
 1XS+6ILAG0dJlvUoSrMQQXJ+JqDnDeml8uShWL1YWEreoDsTHEefCyeSd4FHP/3M36mw
 tT6c0G+pNn2tH0nL7xfVJlXzw2Fm7aAXUCSvJpMwV9a4EGokwpzA5yFEVfUu+idBufX1
 jCpEkE65s87t8sOEbApe8H/6yKEHomKfxk7e7gawMg3CbF7GADUufmRFumZNDeN6Y0u1
 0xCg==
X-Gm-Message-State: AOAM532TwjOCjK2iwmHt3aWHfMpufbRAgCVHt3l28R9VUgc647N1u2AI
 AcKk5IFTcY1VYtQffe64nve/naKl+DJBQKL6NkXpDg==
X-Google-Smtp-Source: ABdhPJzAGOju3kqnoNKIDBYgbpqC1a6mZ2fuhp6+LMsIx6S6YSHctyJPNRuiGLPi/Pdxo1x7RsAMlzC/tI7k54Y8/kg=
X-Received: by 2002:a1c:a1c1:: with SMTP id k184mr400148wme.101.1611074915304; 
 Tue, 19 Jan 2021 08:48:35 -0800 (PST)
MIME-Version: 1.0
References: <5181a536-a026-2f91-7335-f6a75b4694ab@gmail.com>
In-Reply-To: <5181a536-a026-2f91-7335-f6a75b4694ab@gmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Tue, 19 Jan 2021 08:48:24 -0800
Message-ID: <CAH2-KxB+vWmhYE3E7gsBeL+v-Skc5ds9Zxu9pqjUEZD6zwPkkA@mail.gmail.com>
Subject: Re: pthreads at bmcweb
To: Sunitha Harish <sunithaharish04@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, apparao.puli@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Another option might be something like c-ares, the description of which is:

c-ares... is intended for applications which need to perform DNS
queries without blocking, or need to perform multiple DNS queries in
parallel. The primary examples of such applications are servers which
communicate with multiple clients and programs with graphical user
interfaces.


Sounds like exactly our problem statement, so it might be worth a look
to see how much binary size it adds.

On Wed, Jan 6, 2021 at 12:02 AM Sunitha Harish
<sunithaharish04@gmail.com> wrote:
>
> Hi team,
>
> Reference commit https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/31=
735 :
>
> In order to handle the multiple push-style event subscribers, bmc needs t=
o support the async resolution of the subscribers address. The async_resolv=
e() API crashes if there is no thread support in the binary.
>
> I created a bmcweb binary patch by pulling this commit and including the =
pthread. This works fine for the use-cases, but increased the bmcweb binary=
 size by 220KB.
>
> Ed's suggestion is not to use the pthreads, instead implement alternative=
s to do the same job, so that the binary size is kept minimum. He mentioned=
: "Considering that's a ~30% increase in binary size to support one line of=
f code, and most systems are already at their binary size limit, no, that's=
 not going to be acceptable. We can either patch boost to use this https://=
man7.org/linux/man-pages/man3/getaddrinfo_a.3.html or we could build our ow=
n resolver type that calls that underneath. This was based on a quick lookt=
hrough of solutions in Google. I'm open to other ideas here".
>
> I am looking for the community views about the increased bmcweb binary si=
ze v/s having a custom implementation for asyc_resolve. Please share your v=
iews & ideas to get to the best solution.
>
>
> Thanks & regards,
> Sunitha
>
>
