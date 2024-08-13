Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F64950685
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2024 15:31:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W090LP8D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wjsjk4cKrz2yNJ
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2024 23:31:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W090LP8D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wjsj75rw1z2xgX
	for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2024 23:31:05 +1000 (AEST)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e0bfd14aff7so4826252276.3
        for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2024 06:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723555861; x=1724160661; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rpyVq4MdThrdo0O3jbkV5nxNdjMqM9NDJxdt1v99E3g=;
        b=W090LP8Do1gkQ0M9mPutiN3xB5XsqWlPY2bEkOmq8gSz0e/sIFDZls9YrMszziR/hE
         nkPWygZ7hKIe3Hwzhfcf66TpJtqupRwZbkJj/pKfMJgRl3QkJW8Ubce4j95eKQffOwgO
         lkON3NnfSL3qST651yRxZvsOkcqhA6kqXfXTp7vBaxIStPFlhhqMdWNpxGkaADHa0Z1O
         AULNdaTEma15w2a1TxTm6IlfGjIurJlXujugpQ3Ex2o5SiceBjG/aEM5rZ+ZiqGpb/Hw
         +5uIjZT5quyaJ1zhMVJHY7Ah6k6Gvv8Thi6Rgn2GtOdMwn/lzaqv73JHaPkozIhQOgoR
         j1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723555861; x=1724160661;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rpyVq4MdThrdo0O3jbkV5nxNdjMqM9NDJxdt1v99E3g=;
        b=Y2pb1hWLo20yZU7htBGFIDEkebYD9v/1HhWEaFUymRpKiV+xFMs6BP09oIajaOQmrd
         jh7l45ArAo7dSr58MGqxjDDxf1M2beuJgEunXgI2BuvFwLr6/UK9k6Ph0Ac2pRM0sazK
         GTnTmwyUQmgboxy7rlNabNKPECODH+iMJkD8cyR/R0nssutoT2ypL+XPPCCpugh6KUvY
         UOAcfbLdUqCjzB2yboFnPNq/Av4htDpEs2b3qLJKWZ4x6/opsm8NunPuZqd5GB+T0E6o
         hzUY4/hvmND8LofqxrLrllBqVFxTh2eCgeC4amK7Wj71z91Ss7kxm2xktlJ0JdQEoA13
         3dkA==
X-Gm-Message-State: AOJu0Yxx2x2CxbwxvdZEZQIsa0RCuf9sapaPN5ll6oyyjyNIpdLs08oy
	ZHQBxNeZs0HK0fYdo71rnPOlJLXPWG9zrxWuUXTVq01cZg9O6tJUStgoE3Upb6qzIutCyzcy3Ad
	nJBFosoVEHv2KnN6DlBlTmxMawrIjcA==
X-Google-Smtp-Source: AGHT+IGrj1KqkmtgUvsswMiKQL+22TJ+q3aNWrwKFuPdTcBbvnnO325roFB8Q2lFuM3EB5F0KzGI+sFU3nyH51/t5xg=
X-Received: by 2002:a05:690c:18:b0:643:92a8:ba00 with SMTP id
 00721157ae682-6a96be50401mr48000927b3.0.1723555860210; Tue, 13 Aug 2024
 06:31:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240812145816.3301570-1-tmaimon77@gmail.com> <34e98c2202990d3dcaf3b6a201605a5493d2fe91.camel@codeconstruct.com.au>
In-Reply-To: <34e98c2202990d3dcaf3b6a201605a5493d2fe91.camel@codeconstruct.com.au>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 13 Aug 2024 16:30:49 +0300
Message-ID: <CAP6Zq1jmqOctMM2qhWHavcGG2ugTYbk3YQZ0tgHo89rmJHw+TQ@mail.gmail.com>
Subject: Re: [linux dev-6.6 v3 0/7] pinctrl: npcm8xx: pin configuration changes
To: Andrew Jeffery <andrew@codeconstruct.com.au>
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
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,

Thanks a lot appreciate it!

Tomer

On Tue, 13 Aug 2024 at 04:12, Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Mon, 2024-08-12 at 17:58 +0300, Tomer Maimon wrote:
> > This patch set addresses various pin configuration changes for the
> > Nuvoton NPCM8XX BMC SoC. The patches aim to enhance functionality,
> > remove unused pins, and improve overall pin management.
> >
> > This patchset are applied to the Linux vanilla.
> > https://www.spinics.net/lists/linux-gpio/msg101676.html
> >
> > Changes since version 2:
> >         - Allign upstream version
> >
> > Changes since version 1:
> >         - Squash the non-existent pins, groups and functions.
> >         - Remove non-existent groups and functions from dt-bindings.
> >         - Modify the commit message.
> >
> > Tomer Maimon (7):
> >   dt-bindings: pinctrl: npcm8xx: remove non-existent groups and
> >     functions
> >   pinctrl: nuvoton: npcm8xx: remove non-existent pins, groups, functions
> >   pinctrl: nuvoton: npcm8xx: clear polarity before set both edge
> >   pinctrl: nuvoton: npcm8xx: add gpi35 and gpi36
> >   pinctrl: nuvoton: npcm8xx: add pin 250 to DDR pins group
> >   pinctrl: nuvoton: npcm8xx: modify clkrun and serirq pin configuration
> >   pinctrl: nuvoton: npcm8xx: modify pins flags
> >
> >  .../pinctrl/nuvoton,npcm845-pinctrl.yaml      | 80 +++++++++----------
> >  drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c     | 64 +++++++--------
> >  2 files changed, 71 insertions(+), 73 deletions(-)
> >
>
> Thanks, I've applied these to dev-6.6. The exception during the process
> was the binding patch. I've cherry-picked what was merged in linux-
> pintrl/for-next as there were some odd differences. I resolved the
> conflicts with `git checkout --theirs ...` to force the result to match
> what's upstream.
>
> Andrew
