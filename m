Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 873BB471657
	for <lists+openbmc@lfdr.de>; Sat, 11 Dec 2021 22:13:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JBL9N2TJ6z3cQj
	for <lists+openbmc@lfdr.de>; Sun, 12 Dec 2021 08:13:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20210112.gappssmtp.com header.i=@tanous-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=7R4sM4lP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20210112.gappssmtp.com
 header.i=@tanous-net.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=7R4sM4lP; dkim-atps=neutral
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JBL8x2tgJz2yPM
 for <openbmc@lists.ozlabs.org>; Sun, 12 Dec 2021 08:13:18 +1100 (AEDT)
Received: by mail-lj1-x229.google.com with SMTP id m12so18482085ljj.6
 for <openbmc@lists.ozlabs.org>; Sat, 11 Dec 2021 13:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OeOzAA/7BEF26ePEe9QACge/M6XX9487yfhDNlPypa8=;
 b=7R4sM4lP2qa5Opy6rziMNeOPPCKwT08/dKfKdW+tAvV7sCyZ5IFBMTMQ0Ca0PF3+Yc
 jMrjDOnZN/zIEwnruQ74BXGb4dohcsZ0K9xvW6ALRj3SzOVIkOOPraXfAhk7dJP93thm
 2YrF7yPwLZHcq5Zosl8epWm7Qc5YOF2wEgaq+Bzh4VU2TrcCI1mcZWXQ3PWcOFOxMNcX
 Z+jgy0SH3iA8lqt7u6UuSf1n8dbKWgVjFzgpNHJiH2JpGOf/aWNruKacdNnz8/pkun4i
 PLCrcMXD+PtLiMa9s/tRaguu1ECVYkIrSs4u5/+LqPCzpXmZ8bchQB5SyyX4yZqUuxXa
 Peyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OeOzAA/7BEF26ePEe9QACge/M6XX9487yfhDNlPypa8=;
 b=gdMhv2i5NRLsmbwXA7fUtxN+8WVSYvpS3XMzx+ojv3rVRgyRIhJYpz1H2IrI5rhswo
 aGBGGoMUcy67dRHWAc1/MtJCERqPirKBGIfCWNKDj3PJbzth/4SvEomtcmhuvrWZW4yA
 vRr5LJfPqxQPF773byLiPisegiuxmTcjdZdpFyC1lw9egCkL94BW8/Clu6nXnS1nPOy8
 RisXjTjMgGNk2IJHxbzGBSER6OIROV1ruX9fz4GcJfMbkfUW/GkTZUwfnI/EwzyUOfsj
 r1fFHxNLDdCHxa2h0g3KZj3rcaIjs1O8O1TsW3GwNck3Jc+H+tPoVm1I7ZCA1LyqCACo
 Vuuw==
X-Gm-Message-State: AOAM5331284dP5WXQA2apkcVjrBtSCbOXsaTm3Yd6StHxU8NB4kNG9Tj
 l9PdgNjLxbRec+FEpCSQrhqY5c3ofjxxCwGGG58sCw==
X-Google-Smtp-Source: ABdhPJw6NJNR13jaKcC22HnPaLL8gPtu0rxUIl0A6otpOlP9NpnSoI9DFuSJofEKIGb9AaVAKwsLZd6lwnoiFLrD4V4=
X-Received: by 2002:a2e:86cc:: with SMTP id n12mr20038932ljj.275.1639257190933; 
 Sat, 11 Dec 2021 13:13:10 -0800 (PST)
MIME-Version: 1.0
References: <DM4PR11MB52476717C6A134B92BD62061B96E9@DM4PR11MB5247.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB52476717C6A134B92BD62061B96E9@DM4PR11MB5247.namprd11.prod.outlook.com>
From: Ed Tanous <ed@tanous.net>
Date: Sat, 11 Dec 2021 13:13:00 -0800
Message-ID: <CACWQX81Q0w=oK_Sv9OHKrMo5pj2-HaPEW8Dh1MEuRDjNSQKKaA@mail.gmail.com>
Subject: Re: Virtual Media repository request
To: "Hawrylewicz Czarnowski,
 Przemyslaw" <przemyslaw.hawrylewicz.czarnowski@intel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Dec 7, 2021 at 7:52 AM Hawrylewicz Czarnowski, Przemyslaw
<przemyslaw.hawrylewicz.czarnowski@intel.com> wrote:
>
> Hi.
>
> I would like to request for new Virtual Media service repository (based on the design document located here: https://github.com/openbmc/docs/blob/master/designs/virtual-media.md).

Considering that the virtual media already uses pieces of
functionality from the old virtual media, why wouldn't this just go in
https://github.com/openbmc/jsnbd

Ideally we shouldn't need two different virtual media implementations,
and my understanding is that the "new" one is a complete replacement
for jsnbd, while still using the javascript portions of it;  Moving
the implementation there will simplify when people look for virtual
media, and will promote the reuse of code, so I think that's what we
should do.

>
> The service itself is a reworked Virtual Media which early stage is available here: https://github.com/Intel-BMC/provingground.
>
> And additional question: is there anything to do in order to enable CI for this repo?

I believe CI is already enabled for jsnbd, so I think we're already
good to go there.

>
> --
> Best regards,
> Przemyslaw Czarnowski
>
