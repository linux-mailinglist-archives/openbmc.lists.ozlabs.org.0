Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C56926C299
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 14:14:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrzYJ4BrbzDqRF
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 22:14:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::230;
 helo=mail-lj1-x230.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Sh0jnKOY; dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrzXJ2CPWzDqQN
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 22:13:33 +1000 (AEST)
Received: by mail-lj1-x230.google.com with SMTP id y4so5695771ljk.8
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 05:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2vZpoXk07hOAASyzYIR51ZIsKNwQJd4ZfpUmYjkNa64=;
 b=Sh0jnKOY1rzYOyWeyWG5pjB2/gPG52y3ytNr7kTx8Zrc2chiBCeeCs/vyy+FG3iYsg
 SpEc15Nmo5Gv0/GpsVxWqTaTdTjuFGRJHzw/tbVbo84efMcG23q2bc4ZfNEnpamyGjYR
 0MTBBXJylpn5uEOB/9y1aGMaa4fqF3pMlUR/LED/RvM/EYw/ivrcg4cdSsm5zdEGLgRt
 DGYSur0v+dMVfL1X3yv9oMglZGDV7zU7psl2bSCPkazTVjmUYA60AFhpYVR29kbNf25C
 fS14IOKt0VvrlGH0d84U9jWndcHwxcRzZY1WMs5Ci/1uaemAUbg82jGa62ICjEldHfcw
 enlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2vZpoXk07hOAASyzYIR51ZIsKNwQJd4ZfpUmYjkNa64=;
 b=s751EOwaeIjOxc2Y2H8iBLnKeQ51N6e6mUKnbqPWDjr9KybeqCaipoCgOyTzwmUlZ0
 zcm3bf/zEhwE6edTeRZQMoQtWbWvd5OrKmnQdvHz4hvo3ILZ715JkXShzHgHZUfd1xb6
 1NjrUxRZQsxRtLXoLiJXuwWiFXm3gKoj8lEoILN1d+h7XXjYnYmIBzNsodu5Dw+tLrHL
 Lr/R4Q+tLG9EXYEshNfzHY/UZBF0OloYQuri/iKi/8uIT404ag/Gzsv8OJe+qXUwQ9SH
 cMaVAoPAduUKyBim+RdiUVtIyVzSdcuYR6gUZgfe8nrwzX55iTkc9/muHQUy270kuDLp
 AH+w==
X-Gm-Message-State: AOAM530YFpB8TDyNyALMCCZJvqduErWPY2f7e4V7U1XN0xJ1LMvz3wfP
 1rzZ2lWQZcP060VtE8uCql4M8/jcQ7kbdILvc5fu7w==
X-Google-Smtp-Source: ABdhPJyKm5k/VDycr+ImpNfHKSgu4nQ27Q/UfO8dTQ3qLgRMRF+4Uq366Y5rInR1fUWnzqYiM1fK3U7AkFjaiuJz6Rs=
X-Received: by 2002:a2e:8114:: with SMTP id d20mr7889906ljg.409.1600258409266; 
 Wed, 16 Sep 2020 05:13:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm54UETBZ-EAR-2tha+qHTH7h3H_1vZUe2Tp5kOTzY0isKLtw@mail.gmail.com>
 <636cd7a2-8b60-2868-104f-70378bf30a08@yadro.com>
 <CAGm54UFJYnk=dcaWd7rsyUoBHqMkwgSLi5oYAjsMCmkugE+HaA@mail.gmail.com>
 <9ae6b1f98e354503aab6ed1af5452e8cffba7d7f.camel@yadro.com>
 <CAGm54UHG611qtbKObUkFOYjaSkSd+tMabJ=kOwo9TkauyejyRg@mail.gmail.com>
 <27aecca09a3f74d12974bfafde830ded5d69a7e0.camel@yadro.com>
 <CAGm54UFFzkTTKCXCCpFunp8i23Eu8n25gXWcjx5RWm9ioWwrdg@mail.gmail.com>
 <0bf34c28a4640d9155c3143775dfd0f7b0ee8101.camel@yadro.com>
In-Reply-To: <0bf34c28a4640d9155c3143775dfd0f7b0ee8101.camel@yadro.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Wed, 16 Sep 2020 20:13:18 +0800
Message-ID: <CAGm54UEwmNNvx-aCud2S46Aa+A051PDK4KuYUvL=Doqd=nnU9Q@mail.gmail.com>
Subject: Re: Design proposal for dual BMC flash with "golden image"
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Alexander Amelkin <a.amelkin@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 16, 2020 at 8:02 PM Ivan Mikhaylov <i.mikhaylov@yadro.com> wrote:
> > The plan is:
> > 1. When the primary flash is broken and u-boot could not be started,
> > aspeed will switch to the golden side automatically.
> > 2. When the primary flash's u-boot is OK, but the kernel/rofs fails a
> > couple of times, the u-boot could detect this and switch to the golden
> > side by setting the related registers. See example in
> > https://github.com/openbmc/openbmc/blob/master/meta-phosphor/aspeed-layer/recipes-bsp/u-boot/files/0005-config-ast-common-Fall-back-to-secondary-flash-on-fa.patch
>
> That's the standard procedure, I'm saying that you may need the access to the
> golden side at any time for different purposes(support engineers, manufacturing
> department, some problems in field) and how you can achieve that? With u-boot
> env set or manual watchdog trigger?

In that case, we could manually trigger watchdog by:
1. Enable devmem by appending mem.devmem in bootargs in u-boot, and reboot
2. Now devmem could be used, manually trigger wdt2

Be noted that such case should be rare in the field.
In the lab, we could enable devmem by default and just use it.
