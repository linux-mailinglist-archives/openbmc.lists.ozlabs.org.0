Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F41FA542170
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 08:23:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHxxL6kFsz3bgh
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 16:23:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=adXIS+mA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=adXIS+mA;
	dkim-atps=neutral
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHxwz3nTvz2xZR
	for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2022 16:22:59 +1000 (AEST)
Received: by mail-wm1-x335.google.com with SMTP id j5-20020a05600c1c0500b0039c5dbbfa48so1271983wms.5
        for <openbmc@lists.ozlabs.org>; Tue, 07 Jun 2022 23:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SQlghhJeteMzt1ZZRtyUbNXahs6wUs4TU0piCNtE/Xk=;
        b=adXIS+mAsVbSIcgZoRoKeQr2J//mUCf4eUUdaaBDuvri1NHk+e5LtY96X7CdA+FIyZ
         dmICp6Oo4K3OwT7wJNrVFMhRwK/nuTsDxEFV2RruQXTsUHYAYlVFXpVlnVnWsmA49oo6
         KXcLBS2bdiXOZRMGmVdOZ0JUQIMZW06z0H6O0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SQlghhJeteMzt1ZZRtyUbNXahs6wUs4TU0piCNtE/Xk=;
        b=FExtfja2bl5XzykEsYMbK/5ZBO0E5l5xJU+VuMh3dVxEKvqf0mZynS3VQcqm5L90JW
         9onqCk3ux7NjzvHK1+/EFZAYcd+qJ3x9fXARRkef/xcpCopgfI9yAz5pV+H2PAxHG6sa
         oRlyxBLjhbyp5VBzXPbUVZdA06WQuW40n9/cbvnXCuQ3J4lTIuuRgz0xHc36xxADoS6F
         x0jeL/tvlbvAbLmn9z/+FjZwT9ZnmI3cjBDKNgQoFvbZUKk9bEr9qZ/Cq+p7w53bQd13
         MSqxp6Qx1vyQisHcq4I4p4gBbPks29X5yy4cPBuUZLntq9+LXmZd7CgqDpR7/C9gkPWf
         zXHQ==
X-Gm-Message-State: AOAM5301E1r/3yineA5Rp1Izp4IiS2HIHl02akI6qDeKEC9vRqtnK3zD
	gxcpxyb/tg109Jqgqbpx7xaoVhX7IepPsL8l51wAsA6t
X-Google-Smtp-Source: ABdhPJyeH+5v5AjEmpKeExKx0x94/qjF1MLLiu/WdBnp4G02Z4rcsvXvnN2cGa88rLWvK9GMlFh3DlQD9fmgMRuwzQg=
X-Received: by 2002:a05:600c:4e50:b0:39c:eeb:dabe with SMTP id
 e16-20020a05600c4e5000b0039c0eebdabemr49194465wmq.190.1654669375364; Tue, 07
 Jun 2022 23:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220608061455.365123-1-clg@kaod.org>
In-Reply-To: <20220608061455.365123-1-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 8 Jun 2022 06:22:43 +0000
Message-ID: <CACPK8Xcoe=TNv-R-4OYZtOfBpavTDrgPrEEZFy0cz97xEcWDOg@mail.gmail.com>
Subject: Re: [PATCH 1/2] spi: aspeed: Use "jedec,spi-nor" compatible to count devices
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 8 Jun 2022 at 06:15, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The SoC device trees use the "jedec,spi-nor" compatible property to
> describe the flash devices and the board device trees override this
> property with "spi-flash", "sst,w25q256". This comes from the initial
> driver which was first written when spi-nor support had not been
> merged in U-boot yet.
>
> "jedec,spi-nor" should be preferred since it is used by Linux and the
> latest U-boot. Use it to count devices. We will clean up the board
> device trees later.
>
> Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/spi/aspeed_spi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/spi/aspeed_spi.c b/drivers/spi/aspeed_spi.c
> index 65d69105e8e8..45f6a8dd6850 100644
> --- a/drivers/spi/aspeed_spi.c
> +++ b/drivers/spi/aspeed_spi.c
> @@ -1241,7 +1241,8 @@ static int aspeed_spi_count_flash_devices(struct ud=
evice *bus)
>
>         dev_for_each_subnode(node, bus) {
>                 if (ofnode_is_available(node) &&
> -                   ofnode_device_is_compatible(node, "spi-flash"))
> +                   (ofnode_device_is_compatible(node, "spi-flash") ||
> +                    ofnode_device_is_compatible(node, "jedec,spi-nor")))
>                         count++;
>         }
>
> --
> 2.35.3
>
