Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A77552880C9
	for <lists+openbmc@lfdr.de>; Fri,  9 Oct 2020 05:45:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6v9119RZzDqVv
	for <lists+openbmc@lfdr.de>; Fri,  9 Oct 2020 14:45:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=maS5hqB5; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6v8D1RNtzDqF7
 for <openbmc@lists.ozlabs.org>; Fri,  9 Oct 2020 14:44:27 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id 188so9246552qkk.12
 for <openbmc@lists.ozlabs.org>; Thu, 08 Oct 2020 20:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IR+p9isJJXLO9WmtSnsZUQxwy7vC3aCf0f787/m717g=;
 b=maS5hqB5XB9vS3yuryEi+in/lodrn4RqA5IIBL1KB2hA8Fvg05kugf92WsrLTaUSyD
 8ODPW9gxSjvemExI/9cYKNZ0NaPAkcabBfvUjX2AZaLTLaUS+ZkEVlnAvG3G4yzJl1QU
 UEdswsAqJTTSrn4s+/YP0WVyXN6wr2zmuNSOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IR+p9isJJXLO9WmtSnsZUQxwy7vC3aCf0f787/m717g=;
 b=t7bKqndhxj7aORJPUAPZLg9U4jXTvOZuPek0LT1O1kU5MhwSx0OdHwCt8gmS4gxip9
 CenXuYcpIZdS8wa/UuicP5a/sbsq4430izUYahmWRDak/xeNYvtxuKn+TPm0k+Tt4pdK
 R+rRZvDGSIKkHAnn7ezGks/sUwUNNpDZDGppMjvQl0Gx5HktcsWpE1mYjEMFapvb7QMI
 qAisoqFRkTChbX4OeKS78Lo1c8qwnD7sZaDPXr9Rjymr9X37NMqGDDs5BYTXXqwSaNiy
 Zk52lpsucNGuQ0L5YmLoEML+Amcr68j6TkO6DKQAbLul1ppQYHWfN4BAuhw38awjqPN2
 3cBQ==
X-Gm-Message-State: AOAM531UvA9dqnvZvjeuPGI2Yy/KPHCEWclsNdl36B9gmN4SkL/XA3Be
 elLcou0L3ToGIZZ2qs+s1EQPybh+2N2d6CzAjVo=
X-Google-Smtp-Source: ABdhPJzytJRv/mnIQh1J5keVk7uR/rU/0rVO9QhRcctEXSE87LprKyKFmo5Wwefy4pN8MiXArxr6vPEaSUjI3Y6aIsk=
X-Received: by 2002:a37:a81:: with SMTP id 123mr4102797qkk.487.1602215063640; 
 Thu, 08 Oct 2020 20:44:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200928202753.58351-1-eajames@linux.ibm.com>
 <20200928202753.58351-4-eajames@linux.ibm.com>
In-Reply-To: <20200928202753.58351-4-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Oct 2020 03:44:11 +0000
Message-ID: <CACPK8XcfK-KbuQOpL--jpzMuTaWrXNVHj-Z=fkSUaBFFPK81mg@mail.gmail.com>
Subject: Re: [PATCH U-Boot v2019.04-aspeed-openbmc 3/3] configs: Add AST2600
 SPL eMMC configuration
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

On Mon, 28 Sep 2020 at 20:28, Eddie James <eajames@linux.ibm.com> wrote:

> diff --git a/include/configs/aspeed-common.h b/include/configs/aspeed-common.h
> index 4c83035d3c..876958735b 100755
> --- a/include/configs/aspeed-common.h
> +++ b/include/configs/aspeed-common.h
> @@ -41,6 +41,12 @@
>  #define CONFIG_SYS_BOOTMAPSZ           (256 * 1024 * 1024)
>  #define CONFIG_SYS_MALLOC_LEN          (32 << 20)
>
> +#ifdef CONFIG_ENV_IS_IN_MMC
> +#define CONFIG_SYS_MMC_ENV_DEV         0
> +#define CONFIG_SYS_MMC_ENV_PART                0
> +#define CONFIG_ENV_OFFSET_REDUND       0x15000

84KB? How was this chosen?
