Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B388B4BD3D9
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 03:42:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K265x0nBwz3cFX
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 13:42:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=aM/nGeGj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2b;
 helo=mail-qv1-xf2b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=aM/nGeGj; dkim-atps=neutral
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K265Y3Vvqz2yQC
 for <openbmc@lists.ozlabs.org>; Mon, 21 Feb 2022 13:42:07 +1100 (AEDT)
Received: by mail-qv1-xf2b.google.com with SMTP id d7so28389224qvk.2
 for <openbmc@lists.ozlabs.org>; Sun, 20 Feb 2022 18:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TlLzE0+Z9f/zQXYXTn0LbWvz/82kYt7+K45LYiLUD8g=;
 b=aM/nGeGj2Cw/Sg5naH3AG0eExU1E3BNoPjgvw/Ym2oUOZVKf6IaUoLy7KGr6EkKNVI
 eRfsYcc3FVB7cnRS7puxtFjCZIsUOhCMwPRZDaApWhMpOSnGs56PY6ERTRN/sRqcfZ4E
 UAL2Qm62TQ5SvifthIR9+nGSjSOByxZLtOCgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TlLzE0+Z9f/zQXYXTn0LbWvz/82kYt7+K45LYiLUD8g=;
 b=kQCvTToCw+QQGWdkBxgdoYKS30iQ9k6p/GH2TvcGd4RGQS00IEA73QvxQzzwMUd7ZE
 Lca2zv8Dmcyrd++WsN3u7VdUNQp3lQHjvmGBabFpO5s6UBH7aR07t+3HMemZ1K6CDb2E
 d2F/Kz8XT1bEAxzxkLhCekymFJF6ofcYr8IsGjX6+ApekfsQ7WMze/dgBJraPzA+cFTc
 /UhUPFsTkpG5SNHKhHYGgaZY6JpS+OmJ/lyWSAxkco9QZlKkfdpVbnSMDpGZaHXsOtBS
 vs0pC6Vnnazcs1hAcKvn75tHeP1MDEI//N+STq0FyGNQLzWWPVulJHs5/GFPfJ6SYXFj
 SHiw==
X-Gm-Message-State: AOAM531z4TLGgHJibiLUa9RGsXT4l3FpsstOvixj0iur4boeFL2N9c6L
 yvlw/9bKuPw4Bp/cTCOzUvBZOuioi5wObk0GOc/TEhSljZ0=
X-Google-Smtp-Source: ABdhPJw+t+Dvak8HmxG9pX/YksMp8WXygpwW/mHFt15cGwyshgtTb0mv8RXqWeJNUD9btZAWXGGmtas56rtTOr5Pxrc=
X-Received: by 2002:ac8:7f12:0:b0:2d2:24e5:95de with SMTP id
 f18-20020ac87f12000000b002d224e595demr16356767qtk.625.1645411324340; Sun, 20
 Feb 2022 18:42:04 -0800 (PST)
MIME-Version: 1.0
References: <20220218160834.320200-1-j.neuschaefer@gmx.net>
In-Reply-To: <20220218160834.320200-1-j.neuschaefer@gmx.net>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Feb 2022 02:41:52 +0000
Message-ID: <CACPK8XfQV=3TOPj_osuk4fvQYwH8F7tOiEEiYb7mL1zXvUPT+Q@mail.gmail.com>
Subject: Re: [PATCH RESEND] MAINTAINERS: ARM/WPCM450: Add 'W:' line with wiki
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 18 Feb 2022 at 16:08, Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.n=
et> wrote:
>
> The wiki is a useful source of 3rd-party information about the SoC,
> mostly hardware documentation.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

I've put this in the same branch as the dt changes you've already
sent. I'll send out a pull request this week:

https://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git/log/?h=3Dnuvot=
on-dt-for-v5.18

Cheers,

Joel

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1fbbd9fa88d86..39d9e2c6f94ac 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2350,6 +2350,7 @@ ARM/NUVOTON WPCM450 ARCHITECTURE
>  M:     Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
>  L:     openbmc@lists.ozlabs.org (moderated for non-subscribers)
>  S:     Maintained
> +W:     https://github.com/neuschaefer/wpcm450/wiki
>  F:     Documentation/devicetree/bindings/*/*wpcm*
>  F:     arch/arm/boot/dts/nuvoton-wpcm450*
>  F:     arch/arm/mach-npcm/wpcm450.c
> --
> 2.30.2
>
