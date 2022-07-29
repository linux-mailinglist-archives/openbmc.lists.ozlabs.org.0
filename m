Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D80B2584905
	for <lists+openbmc@lfdr.de>; Fri, 29 Jul 2022 02:22:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lv7WB3VScz2xss
	for <lists+openbmc@lfdr.de>; Fri, 29 Jul 2022 10:22:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=AVCkOKlO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=AVCkOKlO;
	dkim-atps=neutral
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lv7Vm1Tvkz2xGs
	for <openbmc@lists.ozlabs.org>; Fri, 29 Jul 2022 10:21:51 +1000 (AEST)
Received: by mail-wr1-x433.google.com with SMTP id i8so4152377wro.11
        for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2022 17:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YWvzmeER4/pM4wv72fDR7NfoIhGu+hSZSXq23Gbjn30=;
        b=AVCkOKlO9CnxXcIFjFW/c2/o6PN2bkCN5bNVFyZZwnIyQith2DhCfHAODPv1EFMpCR
         ZQP5c8U5A1I7K20D918vwuhjQYW+1MoizRHidh+zMbBlkScJW22Zq4l2EqBSkZNWr77a
         +QjyWNzNLrUcjm/XqAK65XYPOLV7QzHAGGPXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YWvzmeER4/pM4wv72fDR7NfoIhGu+hSZSXq23Gbjn30=;
        b=0pLacQ8pxtYbM78VQwFk6W4YNT1Vh6BEJuNQcBRGirtipAT3vARGUI8SjJnQ6BGqTr
         ED3KV+GDpsDoIZrbpqoljyRuyXzW6zHXCqbQGs7nZ0GdNH5/+r2QedXLYIakGfpCON9g
         8duG+LRIrFZjSsVAhNQCcQLnq7zxQiqBG73QoySUG50W4ExSlqz43NesNiL03XfcWay9
         P9mUBc90GCoV7rlnMx6P5pevcEHJMjgwkZ3juVzjYMuRC/b9eymt23tjxb87euF2tQ5H
         3GDhi2hUCOYkdukR7plEKAv/XuaJUtQimfSKBA1Od32AKfghk4SNIxb7MffAJxY/Hfmo
         3LUw==
X-Gm-Message-State: ACgBeo3Uh2LZsv8rY8w+cjh3/YfFPYPbFRzxHrNPE46JZZmyw+ZORX9a
	DJUo99+IUGGk0mKZyKqI4a0zx2aUCBahtvqWVe4=
X-Google-Smtp-Source: AA6agR7byVoccb2uhTLidZfMeFDnRF1Gj53SfQjMG3lSOwEdujjrtMYugBUy9lWFG9PqTe7gMl5HtR4my8FYSv5o64c=
X-Received: by 2002:a5d:4d0b:0:b0:21e:c456:e565 with SMTP id
 z11-20020a5d4d0b000000b0021ec456e565mr721779wrt.3.1659054104002; Thu, 28 Jul
 2022 17:21:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220725225151.393384-1-peter@pjd.dev>
In-Reply-To: <20220725225151.393384-1-peter@pjd.dev>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 29 Jul 2022 00:21:31 +0000
Message-ID: <CACPK8XeM-foqPGD5yF4r_a9ZmdJRCwOC7yvY3eUAH0zsrkUheA@mail.gmail.com>
Subject: Re: [PATCH 0/1] tpm_tis_i2c: Fix -Wdeclaration-after-statement
To: Peter Delevoryas <peter@pjd.dev>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Peter,

On Mon, 25 Jul 2022 at 22:51, Peter Delevoryas <peter@pjd.dev> wrote:
>
> Hey Joel,
>
> I've been trying to build fby35 from https://github.com/openbmc/openbmc, =
and I
> noticed that the TPM TIS I2C file seems to emit a warning that causes a
> compilation error:
>
> ../drivers/char/tpm/tpm_tis_i2c.c: In function =E2=80=98tpm_tis_i2c_write=
_bytes=E2=80=99:
> ../drivers/char/tpm/tpm_tis_i2c.c:114:17: warning: ISO C90 forbids mixed =
declarations and code [-Wdeclaration-after-statement]
>   114 |                 struct i2c_msg msgs[] =3D {
>       |                 ^~~~~~
>
> I'm sending this patch as a fix for the warning, to avoid the compilation=
 error.

Thanks for trying to fix this.

>
> Normally I think I would send this to the upstream kernel mailing list, b=
ut
> this file doesn't actually seem to be in the upstream at any point:
>
>     drivers/char/tpm/tpm_tis_i2c.c
>
> It looks like it was added by Nuvoton and never upstreamed successfully? =
Perhaps
> we should get rid of it at this point? fby35 doesn't actually use the TPM=
 TIS
> I2C interface, it uses the SPI one. Bletchley doesn't use the I2C one eit=
her.
> Only older FB platforms did.

The i2c driver was added for the IBM P10 platforms.

> Actually, doing a quick search on lore.kernel.org: It looks like maybe th=
ere's
> a new version submitted by Infineon in June:
>
>     https://lore.kernel.org/all/20220608173113.9232-1-Alexander.Steffen@i=
nfineon.com/
>
> If fby35 wants to avoid this error, should we fix the driver, remove it f=
rom the
> kernel, pull in the new driver from upstream, or maybe just disable it in=
 the
> linux-aspeed tpm2 distro feature Kconfig?

The upstream maintainer has been reluctant to merge this code. Nuvoton
told me off-list they had abandoned plans to upstream it. Since then
Infineon have picked it up and made some submissions. It looks like
it's been queued for merging in v5.20.

I'd be happy moving to the latest version of the patch in the openbmc
tree. Either as a revert+new driver, or as a diff, whichever you think
makes sense. They inexplicably removed the compatible strings in the
latest submission, so we would need to add them back:

 static const struct of_device_id of_tis_i2c_match[] =3D {
-       { .compatible =3D "nuvoton,npct75x", },
-       { .compatible =3D "tcg,tpm-tis-i2c", },
+       { .compatible =3D "infineon,slb9673", },


Cheers,

Joel
