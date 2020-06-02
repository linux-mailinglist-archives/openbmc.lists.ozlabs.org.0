Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDC61EB338
	for <lists+openbmc@lfdr.de>; Tue,  2 Jun 2020 04:06:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bb4l3DwlzDqN9
	for <lists+openbmc@lfdr.de>; Tue,  2 Jun 2020 12:06:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::541;
 helo=mail-ed1-x541.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=EP4weNGA; dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bb3m2xyczDqRj
 for <openbmc@lists.ozlabs.org>; Tue,  2 Jun 2020 12:05:39 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id p18so8807553eds.7
 for <openbmc@lists.ozlabs.org>; Mon, 01 Jun 2020 19:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kBLimb4ELVPpqftxfV9TuFIS5UJvc6tuqCId2pa68/A=;
 b=EP4weNGALw3jInlOBX1DIYSPvfu84vvbYauKgC/lGZ0XOknolavAlifX0ElQV9BYml
 WzSnYwZSQPK7aJklU7BeFH2rrjQYzL/i1jsd4iSQEOIjw30PRcdSVYz6ORgHcURKRWnP
 ahMeselxPjiGWVmpJTjdBrKiL8rc1VUr4Hwks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kBLimb4ELVPpqftxfV9TuFIS5UJvc6tuqCId2pa68/A=;
 b=iABSumZHHZ0SLBoE0R8SgdmmQrVhzfxIqK+DXMr4gDRfezlgadjkbBklTtfCksqh/z
 fuHdOyxFs6PS6JBdOFPximcsGyE9DO1B1y90V9ytjDuFFj2H5I3bsJds5poogzWb5qim
 5kaFgSwxyzOT6yN1a+qu5yQ96xiF63p/26Yd9RR5Iq4BCS3Pl7QEI/Q1c6yaAHY/Mdx6
 24bYdEVJj05Ark+7F92CaWSfJWTVnsi8vUDZdAMlABY0NJAxggLTsOQw5pC9RPD0fKk5
 HfGMI9eMMtBfwgghqF4DgE7JMEjwKuK6sn2OcQtrqXjyRG8Uc69VVGYpbv4aQvtOy2WX
 eCMg==
X-Gm-Message-State: AOAM533pfI7OOuU89Ifh6sA7LkV3iIk/Fs+V4ulHhJroR758cFk7XmSY
 hnaQYgLHDW+NKSAQkb/04GQNPw+0K1526SNKU9Q=
X-Google-Smtp-Source: ABdhPJxyamCfynJ65s3GHpX4KGoRuYHKhdBJ8ZSNRVV42tP1jhtttkmHKjC142Qavu1rZ14hxGZ0MVEKktT8ImvwJXU=
X-Received: by 2002:aa7:c944:: with SMTP id h4mr23858547edt.383.1591063537181; 
 Mon, 01 Jun 2020 19:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200520181707.9235-1-eajames@linux.ibm.com>
In-Reply-To: <20200520181707.9235-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 2 Jun 2020 02:05:25 +0000
Message-ID: <CACPK8Xet=vdApyKXPe0prWhtH3qqa2_NWnoXT=Rzwe+yjNNQ=g@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.4] fsi: core: Set slave local bus ownership
 during init
To: Eddie James <eajames@linux.ibm.com>, Jeremy Kerr <jk@ozlabs.org>, 
 Andrew Jeffery <andrew@aj.id.au>, Alistair Popple <alistair@popple.id.au>
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

On Wed, 20 May 2020 at 18:17, Eddie James <eajames@linux.ibm.com> wrote:
>
> The driver ought to claim local bus ownership of the slave it's
> communicating with.

I am not familiar with this register's purpose so feel free to explain
the details.

Should we also "un-claim" ownership at any point?

>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/fsi/fsi-core.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
> index 8244da8a7241..48424b672295 100644
> --- a/drivers/fsi/fsi-core.c
> +++ b/drivers/fsi/fsi-core.c
> @@ -50,6 +50,7 @@ static const int engine_page_size = 0x400;
>  #define FSI_SMODE              0x0     /* R/W: Mode register */
>  #define FSI_SISC               0x8     /* R/W: Interrupt condition */
>  #define FSI_SSTAT              0x14    /* R  : Slave status */
> +#define FSI_SLBUS              0x30    /* W  : LBUS Ownership */
>  #define FSI_LLMODE             0x100   /* R/W: Link layer mode register */
>
>  /*
> @@ -66,6 +67,11 @@ static const int engine_page_size = 0x400;
>  #define FSI_SMODE_LBCRR_SHIFT  8               /* Clk ratio shift */
>  #define FSI_SMODE_LBCRR_MASK   0xf             /* Clk ratio mask */
>
> +/*
> + * SLBUS fields
> + */
> +#define FSI_SLBUS_FORCE                0x80000000      /* Force LBUS ownership */
> +
>  /*
>   * LLMODE fields
>   */
> @@ -981,7 +987,7 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
>         uint32_t cfam_id;
>         struct fsi_slave *slave;
>         uint8_t crc;
> -       __be32 data, llmode;
> +       __be32 data, llmode, slbus;
>         int rc;
>
>         /* Currently, we only support single slaves on a link, and use the
> @@ -1052,6 +1058,14 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
>
>         }
>
> +       slbus = cpu_to_be32(FSI_SLBUS_FORCE);
> +       rc = fsi_master_write(master, link, id, FSI_SLAVE_BASE + FSI_SLBUS,
> +                             &slbus, sizeof(slbus));
> +       if (rc)
> +               dev_warn(&master->dev,
> +                        "can't set slbus on slave:%02x:%02x %d\n", link, id,
> +                        rc);
> +
>         rc = fsi_slave_set_smode(slave);
>         if (rc) {
>                 dev_warn(&master->dev,
> --
> 2.24.0
>
