Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 807EC4413CD
	for <lists+openbmc@lfdr.de>; Mon,  1 Nov 2021 07:40:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HjNhC2gkxz2xZL
	for <lists+openbmc@lfdr.de>; Mon,  1 Nov 2021 17:40:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=C7gkol+c;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f33;
 helo=mail-qv1-xf33.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=C7gkol+c; dkim-atps=neutral
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HjNgp5PqPz2xXt
 for <openbmc@lists.ozlabs.org>; Mon,  1 Nov 2021 17:40:05 +1100 (AEDT)
Received: by mail-qv1-xf33.google.com with SMTP id g25so9631870qvf.13
 for <openbmc@lists.ozlabs.org>; Sun, 31 Oct 2021 23:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KpilIOKY5/Xb9TE7hGKURS64/m0giO4T6fRi+Y3BcfY=;
 b=C7gkol+cCwFjVjwpYQuCXyOz2GehPv8SOm5OUOnvPd/F1i9jFu29ivhWP8ZnkZXu5j
 SS0mff+v/y82VSagQTvwq61F8PDVYk2YRY61BY1DqUgfML0+XmAioiIx1X3h/409ohMF
 S8ljW4Rg8u9L7KBXZUZf+Eavmadgs19LhXH2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KpilIOKY5/Xb9TE7hGKURS64/m0giO4T6fRi+Y3BcfY=;
 b=uiY8g6SFoELSHNAwCMsErMobaAim2mplnslTr4XOxll/f9sQWLvxxVZtQftoyyLwf3
 uqvk5v4hN2wIDk1TdBd+jwIggVavOQF6v6KSlr5kAwddnm4c9Z+l6Bn8NyNqwIp28AFD
 SLXsSqA+wqzK5t+zpPgYjCPXp/SSvbRm5vYeHzJsCcV7f/j1v6wFmb6m4x4U1onevZ/T
 m4I+JnWtbChFgqQlGldAIM7UwFMuuCmS4Hi/PAc25BijGw6ltj/r64gv6nsK/vLhNzQC
 khYj4pMN8vHmV+tvkUOaJkFO2429zULDXgxXeGGrloSkBf+IyLTrLM6SxpcYthbF0W8c
 iCaQ==
X-Gm-Message-State: AOAM533etJp2I7fdy1hdJLHYTl0Um3+YL7y/IC5uuHHYEqu6BVNzPJMl
 Mmn+XeB+jdFBSAHRGyKIXQnZ5Sd2HHgC5eNjPkc=
X-Google-Smtp-Source: ABdhPJzksndlDw+KI/eqWfxfXUAi9xHhhygjRkpc9hmfZrpPlFOfxyhIyS+dhcpZW6w+1Qe6OhIzVNd58d7hQ1SH+lA=
X-Received: by 2002:a05:6214:98d:: with SMTP id
 dt13mr26577001qvb.13.1635748800649; 
 Sun, 31 Oct 2021 23:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <dcebf35e-56a3-4f16-0380-841925e093f4@amperemail.onmicrosoft.com>
In-Reply-To: <dcebf35e-56a3-4f16-0380-841925e093f4@amperemail.onmicrosoft.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 1 Nov 2021 06:39:48 +0000
Message-ID: <CACPK8XfZBy5cW7QD4OvCMeRB01hzQshGCRP=6A=+U+3y=4nisA@mail.gmail.com>
Subject: Re: Fix u-boot 2016.07 env fail on 64MB layout
To: Thang Nguyen <thang@amperemail.onmicrosoft.com>
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

On Fri, 29 Oct 2021 at 11:16, Thang Nguyen
<thang@amperemail.onmicrosoft.com> wrote:
>
> Hi,
> My platform uses Aspeed2500 BMC with 64MB SPI-NOR. Since the change in
> BMC SPI-NOR layout at
> https://github.com/openbmc/linux/commit/985c3f59cc645c397726ad4ca0872cfaf7ef2579,
> the patch
> meta-phosphor/aspeed-layer/recipes-bsp/u-boot/files/0001-configs-ast-Add-redundnant-env.patch
> becomes incorrect for 64MB layout (but still correct for 32MB SPI-NOR
> layout).
> Do you have any idea on correcting it for 64MB layout?

I suggest deleting the patch. It should not live in meta-phosphor. If
this feature is required, it should be controlled with a configuration
in u-boot defconfig.

I also suggest using the newer u-boot version (2019.04) for your platform.

Cheers,

Joel

>
> Thanks,
> Thang Q. Nguyen
