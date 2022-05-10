Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CB9520B3C
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 04:29:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ky27H6SS3z3brN
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 12:29:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=dfpUQWKh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42b;
 helo=mail-wr1-x42b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=dfpUQWKh; dkim-atps=neutral
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ky26v7449z2xrs
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 12:29:27 +1000 (AEST)
Received: by mail-wr1-x42b.google.com with SMTP id c11so21768156wrn.8
 for <openbmc@lists.ozlabs.org>; Mon, 09 May 2022 19:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZjCdSWw/pZUWid2jY84XfOMyCqnIqpGB3u2zL+iYpqE=;
 b=dfpUQWKhjVX+irlknaH3cS5Djbdta6C54iUbCD6OQN2zp7P67XJb6oFjZrPTzHa3Il
 087Dq2pTcNz+NinCnF1lIy9+ryhPh15YfaoBZtJGV3qQcM4VoXsIM4CgyCLh2d3KIW6V
 PFEEABjg6UuAwK6mnxkS4+j3z3ZgInNnpUL7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZjCdSWw/pZUWid2jY84XfOMyCqnIqpGB3u2zL+iYpqE=;
 b=oNUCUOoA3NzdiePuWlDipHMvDl5RQmQ6Emw9LV/cEu5sH3Kq8PRdLgPTZS1l2/H9XY
 HnjePTEx054vPxZnMWw2edeCaIjjkLenj/QjPCQcPbQaoNBu6hlMMgkExO6ejujaB8gC
 86OML8tsaeY51v7uys8CCzkT5bc/HOBqPKCeet42TBx+gPKJhI6ABMkXXx+RW/BgA1+o
 7pVl4Uw3OPqjnInN5gyHXJpa7rmD2ASfmyLlvDPG0Ggqg+ODSv+vpUSkPtgXeKWoPUeE
 XMmsVYM2DG/S5Ytj5NLaOLsGjsXj03lgjOrpwENf/wIC4vJGDQ9RHTGCQ7d5XCSaDdXk
 p08A==
X-Gm-Message-State: AOAM53087OWO79tZXrZVQ7k/K6RVzuPQx/4LiVyRLZF7STzhewF/i46F
 gV7OwJBWWXA4gzVmYxMRwUZdiRCvr3buljP2fEn4//lZ
X-Google-Smtp-Source: ABdhPJz1gi3karyeRiWFX10tcrqo1A3TAvFc8X/avDMDCyXSMk5gEjWTgS99birQeavU1TU3LUQn5YsTYXYCn+JTsSw=
X-Received: by 2002:a05:6000:188c:b0:20c:563a:aa86 with SMTP id
 a12-20020a056000188c00b0020c563aaa86mr16346298wri.360.1652149760910; Mon, 09
 May 2022 19:29:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220505202829.31466-1-eajames@linux.ibm.com>
 <20220505202829.31466-2-eajames@linux.ibm.com>
In-Reply-To: <20220505202829.31466-2-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 10 May 2022 02:29:08 +0000
Message-ID: <CACPK8Xdc39xoQ900YVJG+vxN+XqxJmxJhm6nXaiYRtZGAo3nCA@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 1/5] i2c: ast_i2c: Remove
 SCL direct drive mode
To: Eddie James <eajames@linux.ibm.com>
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

On Thu, 5 May 2022 at 20:28, Eddie James <eajames@linux.ibm.com> wrote:
>
> SCL direct drive mode prevents communication with devices that
> do clock stretching, so disable. The Linux driver doesn't use
> this mode, and the engine can handle clock stretching.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/i2c/ast_i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/ast_i2c.c b/drivers/i2c/ast_i2c.c
> index bbc32d6cdb..13420ade84 100644
> --- a/drivers/i2c/ast_i2c.c
> +++ b/drivers/i2c/ast_i2c.c
> @@ -73,7 +73,7 @@ static void ast_i2c_init_bus(struct udevice *dev)
>         /* Enable Master Mode. Assuming single-master */
>         writel(I2CD_MASTER_EN
>                | I2CD_M_SDA_LOCK_EN
> -              | I2CD_MULTI_MASTER_DIS | I2CD_M_SCL_DRIVE_EN,
> +              | I2CD_MULTI_MASTER_DIS,

This driver is upstream, so it can be submitted there too.

>                &priv->regs->fcr);
>         /* Enable Interrupts */
>         writel(I2CD_INTR_TX_ACK
> --
> 2.27.0
>
