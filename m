Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB341D4AE3
	for <lists+openbmc@lfdr.de>; Fri, 15 May 2020 12:26:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Nl2K5LYHzDqSB
	for <lists+openbmc@lfdr.de>; Fri, 15 May 2020 20:26:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::22b;
 helo=mail-lj1-x22b.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=DPO9dViH; dkim-atps=neutral
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Nkw05mmZzDqpR
 for <openbmc@lists.ozlabs.org>; Fri, 15 May 2020 20:21:19 +1000 (AEST)
Received: by mail-lj1-x22b.google.com with SMTP id w10so1673419ljo.0
 for <openbmc@lists.ozlabs.org>; Fri, 15 May 2020 03:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=6tcPbl1ysERN8aGivS/t0vQwniO+clM1VdpBpb3R4Fw=;
 b=DPO9dViHp9oRfti0+kvfftgRKoL/K+cT+jnqCMcjlfoZDbe+R4TljaBZNCsS6RbfqY
 4eo2rTmz1l1HBIhXzFayQQ+LowNjqtKf49WTqTkCylraSjjN8HaA2XWSNo2J0fWikmrC
 msAJ49dJuKRFXaFjeU3QUoxWCcx9rOIi9zfdlYiW+f7HbqZs0/tBv1sS5H/pCaQ/zqPD
 /bK9fldfg1vpJLH91Nx58tu8X3YyDfZsP9SOBiD0ZOQwaalUVzQtcvuo+tpVGtJ4I5Vb
 wjrvH6xhCNqXZKka9XxU47Ik9XDj7AHY2+eTFw1htV48YKg2ww/P9PMBx7DB5btw1zpL
 yc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=6tcPbl1ysERN8aGivS/t0vQwniO+clM1VdpBpb3R4Fw=;
 b=JIZ+iS4NW4ulWSmUlsqGY0NaF/ogwqB882uNVIMBcz/DDF1RNI0NkxXynKNZOAZlah
 y+PjnRPcBI186oU/ki4DaWkqA/yJnl/K2N92lThtkDZpR7gtg7XN+FDV4h2Sp9+dt6xD
 +Zlp78RN4KWaFqDBoKYcrKsvXpugF/byshnbKHFe/vj1ukFJAY41A2lZhJ4tnTNtkREu
 50aYtM+PpOfsGcHGnF2MSozuNXDyLmU6l3RlEDbsRd9bpOsMIyPaTafczLNopssIgWMK
 TDYJpmdynA8Kl4lqS1MWN/roKdfagkO7RjYbxqB07TKwgXsf8sDmQ6LykbOufador5lb
 woYw==
X-Gm-Message-State: AOAM531qXQKvC3PSDXz9qAkU4HNIpHsnVDiQm2pPeAL6jwK2276FnyvL
 FTwFKwtwxrCsJF9Stk0ksQu+WTzyjrhrmqYIIZtFZw==
X-Google-Smtp-Source: ABdhPJzMSnlC9UII2JaaNWHgJnWHiDArcP0EjXKSYj2ry7J/ryMP8jNE9X+L8/Swh10cm1uSCvck7iMJSbXtM5k0JJc=
X-Received: by 2002:a2e:8e6c:: with SMTP id t12mr1747308ljk.107.1589538073136; 
 Fri, 15 May 2020 03:21:13 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>
Date: Fri, 15 May 2020 18:21:02 +0800
Message-ID: <CAGm54UGm1iWAYpmJxsYjZh8fsNQ6D75vOYSANWAAqxVXu0SJOg@mail.gmail.com>
Subject: Re: Reducing fragmentation in OpenBMC
To: Jeremy Kerr <jk@ozlabs.org>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, May 15, 2020 at 5:04 PM Jeremy Kerr <jk@ozlabs.org> wrote:
>
> So - any thoughts on how we can improve this? Comments / disagreements
> / questions always welcome.

I am all in for making the effort to upstream the separated projects.
E.g. one candidate step could be to upstream the static flash layout
and the code update in Intel-BMC/openbmc, which uses a different
layout and different update method than the upstream.
It seems to uses a single "big" chip to support A/B side of BMC
firmware, and at runtime, the rofs is mounted in ram so it could
safely update the rofs at runtime. All of these are good features that
are not implemented in OpenBMC upstream.

If one of the Intel developers could provide some initial patches, I
could test and work on shepherding those upstream.

--
BRs,
Lei YU
