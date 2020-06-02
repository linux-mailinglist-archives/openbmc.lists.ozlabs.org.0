Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0C31EB30F
	for <lists+openbmc@lfdr.de>; Tue,  2 Jun 2020 03:37:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bZR244S4zDqR7
	for <lists+openbmc@lfdr.de>; Tue,  2 Jun 2020 11:37:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::642;
 helo=mail-ej1-x642.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=DYmF9G0U; dkim-atps=neutral
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bZQ73bbszDqHJ
 for <openbmc@lists.ozlabs.org>; Tue,  2 Jun 2020 11:36:31 +1000 (AEST)
Received: by mail-ej1-x642.google.com with SMTP id f7so11105878ejq.6
 for <openbmc@lists.ozlabs.org>; Mon, 01 Jun 2020 18:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b0ppZOyqDYhwh++aW77VLBpjzw+3ChdqGM7dWr1SSK4=;
 b=DYmF9G0UZZeUkl+pdA7oD2S4U7e6QWmgHGwvFtllYtGuxCWTHgGv81Llkk7X+piA+o
 LoyEwwJ4SCtAdcym1885DZQo0iEbcgQYHBTk9HTc1Uvt0c0HJtRSPQdOQVCuCKQaVFS9
 DLbhDuiRl+4zeceXrEwsvsiNsxP7+Cn4e2mO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b0ppZOyqDYhwh++aW77VLBpjzw+3ChdqGM7dWr1SSK4=;
 b=IPjVpd08l3yxyYVByk706f1QuDn5gOfzhvHFSHMECusv3zxd7whse2lvMDOqM2L2kF
 hj/pMQN+0omqRz4tFOzD8KTMz9rQz8QCWWCVFtr8SSbyx+7HIjjSBrcWTCadT3t1I4A5
 OpuLLpCXh+roRaVXfORuvui7qvhFsc1VKVbeSQFBVXtCZPV5KSC2RKFCLgPK+pqZVHgX
 NGil6JzWmFrDcPuyuNlorzIV1GVmFmwgEmmIuC/BNerE0ltUEzD5cG0HetKfxO65MMY5
 Hk4T9x+B/qMV++2j6gkRIq0CLqPcnz2+0WHSCFk2eg6DE0WsJkfB79XPOQD7Cx7JrP2k
 bYZg==
X-Gm-Message-State: AOAM532oHcYJuv2DJTyt3ugCqMHSAU3wAQ8US+gnbYbGPoieCdGtkY5O
 sO5ykwZi5tU2vU+rTecp3DJfQ9vOWeauJ5b8zfM++qk5
X-Google-Smtp-Source: ABdhPJxEi3rzBCX8Sz56BJ/XdewAgYj2w8bf2q4jwIiVsyMrCOn4e1mWRDluL4FgeLDjGW+4/BmroY8d2myU9fz2EXY=
X-Received: by 2002:a17:906:3603:: with SMTP id
 q3mr11611400ejb.477.1591061786993; 
 Mon, 01 Jun 2020 18:36:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200519193936.7295-1-eajames@linux.ibm.com>
 <20200519193936.7295-2-eajames@linux.ibm.com>
In-Reply-To: <20200519193936.7295-2-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 2 Jun 2020 01:36:15 +0000
Message-ID: <CACPK8XcLZZJ2J9y3XZ=+qojzr4HMxVgKfbvFn=PZz26nvb_6nA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.4 1/2] i2c: fsi: Fix the port number field in
 status register
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

On Tue, 19 May 2020 at 19:39, Eddie James <eajames@linux.ibm.com> wrote:
>
> The port number field in the status register was not correct, so fix it.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Merged into dev-5.4.

Can you please send this upstream with a fixes tag?

Cheers,

Joel

> ---
>  drivers/i2c/busses/i2c-fsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
> index e0c256922d4f..977d6f524649 100644
> --- a/drivers/i2c/busses/i2c-fsi.c
> +++ b/drivers/i2c/busses/i2c-fsi.c
> @@ -98,7 +98,7 @@
>  #define I2C_STAT_DAT_REQ       BIT(25)
>  #define I2C_STAT_CMD_COMP      BIT(24)
>  #define I2C_STAT_STOP_ERR      BIT(23)
> -#define I2C_STAT_MAX_PORT      GENMASK(19, 16)
> +#define I2C_STAT_MAX_PORT      GENMASK(22, 16)
>  #define I2C_STAT_ANY_INT       BIT(15)
>  #define I2C_STAT_SCL_IN                BIT(11)
>  #define I2C_STAT_SDA_IN                BIT(10)
> --
> 2.24.0
>
