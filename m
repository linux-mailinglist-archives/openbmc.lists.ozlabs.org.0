Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C03933AC135
	for <lists+openbmc@lfdr.de>; Fri, 18 Jun 2021 05:12:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5kWV2m1gz3bwG
	for <lists+openbmc@lfdr.de>; Fri, 18 Jun 2021 13:12:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=dnelujCN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::22e;
 helo=mail-oi1-x22e.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=dnelujCN; dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5kW94P7Mz3bsW
 for <openbmc@lists.ozlabs.org>; Fri, 18 Jun 2021 13:12:34 +1000 (AEST)
Received: by mail-oi1-x22e.google.com with SMTP id u11so8963632oiv.1
 for <openbmc@lists.ozlabs.org>; Thu, 17 Jun 2021 20:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5eSIYi1Yaf0EZWkIPsxD3tIA95PgYC/++4iBoKNQfps=;
 b=dnelujCN9/7OYaT5Q9ieu+wqqEM6aMFN8P+7gwEYifeXE6HYqJrhyR3llxwtgDPyOM
 Sgzci44vZdgH/xC49tWJ/p8RPOAFmoNNc8GsDzZ9S34iEyavaXRBHVfEWEO3A8jmR3wO
 Tig3dclhk/w2nBdjjWZyWZwN2ympqjb9Cok1/VpUrvZxVOXPo6HC23RN8DhS3rAX/cdA
 6aObBanDCuzU72fMAH92+QiLmiQz/prIKb4baHwYJHzvLtg0nAg9Y4Tnn9fZV05iSP4E
 Ewhshz/vCc0+5TgRQl3szVXVFDZxPbWyd459nKit3IVjTJPOfFvKtg7BfHaB6/gTEieW
 1W0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5eSIYi1Yaf0EZWkIPsxD3tIA95PgYC/++4iBoKNQfps=;
 b=uPoGnWm0E/JcBbe8MO46zZQPxV65nmbS4h73S0/w0Pg4o1q3SVltS4pvpNlN2GJL0n
 Hp88hKa2re77d6xu2LqqndEDIDjGlA2LyuzgJZG8UeDbnItbLDFsbeE1qeCBveGryoqV
 iOPCjE+MUtOmMG0FpsgRqBUi6GoBp/IU6ymEYndLuISWCQ0EO77i0der/xIKT8bR658S
 R2FRyu0deMLj/VhWgAnfp7Qe71lRtx7ySVPd0J2u3b9MarxXoH1RBw6jzPhcRm0NQs1U
 McW4lE1dZzbqkYY5sh0hfOYNKD9vD87QMR2jLpOnx887g2MQWrY3HKTLqwBRoWzVY1TK
 hMuQ==
X-Gm-Message-State: AOAM530pPek/0WdFMc1awqgDxgi7ljN+vzvyGWB1K1t3LpZ5dmpFfh6z
 1UWWfwdUpi+Upeffin3/bKar5gPC2tOTuCPW1duX3g==
X-Google-Smtp-Source: ABdhPJyxS5TxSmdB94esE5zXrrMP4xOw9QkBBejK076rSE9Bxrk4BkPTC0RjvkANy1ORCk/UvTSyceURzZYcjpnQ6L0=
X-Received: by 2002:aca:1116:: with SMTP id 22mr12916080oir.28.1623985949785; 
 Thu, 17 Jun 2021 20:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210618024758.892642-1-joel@jms.id.au>
 <20210618024758.892642-3-joel@jms.id.au>
In-Reply-To: <20210618024758.892642-3-joel@jms.id.au>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Fri, 18 Jun 2021 11:12:19 +0800
Message-ID: <CAGm54UFSRvCGNuqxoyKjFtM8CjLKxxprJcY+DjXjBOqaF-mJmg@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 2/2] ast2600: Add
 environment for booting from mmc
To: Joel Stanley <joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@us.ibm.com>, Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jun 18, 2021 at 10:49 AM Joel Stanley <joel@jms.id.au> wrote:
>
> This adds the default environment from the OpenBMC project.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  board/aspeed/ast2600_openbmc_mmc.txt       | 9 +++++++++
>  configs/ast2600_openbmc_spl_emmc_defconfig | 2 ++
>  2 files changed, 11 insertions(+)
>  create mode 100644 board/aspeed/ast2600_openbmc_mmc.txt
>
> diff --git a/board/aspeed/ast2600_openbmc_mmc.txt b/board/aspeed/ast2600_openbmc_mmc.txt
> new file mode 100644
> index 000000000000..47a474c92d70
> --- /dev/null
> +++ b/board/aspeed/ast2600_openbmc_mmc.txt
> @@ -0,0 +1,9 @@
> +bootargs=console=ttyS4,115200n8
> +boota=setenv bootpart 2; setenv rootfs rofs-a; run setmmcargs; ext4load mmc 0:${bootpart} ${loadaddr} fitImage && bootm; echo Error loading kernel FIT image
> +bootb=setenv bootpart 3; setenv rootfs rofs-b; run setmmcargs; ext4load mmc 0:${bootpart} ${loadaddr} fitImage && bootm; echo Error loading kernel FIT image
> +bootcmd=if test "${bootside}" = "b"; then run bootb; run boota; else run boota; run bootb; fi
> +bootdelay=2
> +bootside=a
> +loadaddr=0x83000000
> +rootfs=rofs-a
> +setmmcargs=setenv bootargs ${bootargs} rootwait root=PARTLABEL=${rootfs}
> diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
> index c5d03721c97a..344a4d8f9c96 100644
> --- a/configs/ast2600_openbmc_spl_emmc_defconfig
> +++ b/configs/ast2600_openbmc_spl_emmc_defconfig
> @@ -83,6 +83,8 @@ CONFIG_CMD_MTDPARTS=y
>  # CONFIG_SPL_EFI_PARTITION is not set
>  CONFIG_SPL_OF_CONTROL=y
>  CONFIG_ENV_IS_IN_MMC=y
> +CONFIG_USE_DEFAULT_ENV_FILE=y
> +CONFIG_DEFAULT_ENV_FILE="board/aspeed/ast2600_openbmc_mmc.txt"

This is good, we hit an issue before that is related to the default
env not in the flash.
Could you kindly help to make the same change for other configs?
E.g. for ast2500/ast2600 evb config.

>  CONFIG_NET_RANDOM_ETHADDR=y
>  CONFIG_SPL_DM=y
>  CONFIG_REGMAP=y
> --
> 2.32.0
>


-- 
BRs,
Lei YU
