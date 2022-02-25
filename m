Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB194C3CDC
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 05:02:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4bhN26Lwz3bZF
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 15:02:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=aIxC/EUY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f29;
 helo=mail-qv1-xf29.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=aIxC/EUY; dkim-atps=neutral
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4bgz0FqNz2yfm
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 15:02:04 +1100 (AEDT)
Received: by mail-qv1-xf29.google.com with SMTP id fc19so5818879qvb.7
 for <openbmc@lists.ozlabs.org>; Thu, 24 Feb 2022 20:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6Jh/t+jZpoXmW62Yrkq80vPjjnYG/7fIB39MphAI1U0=;
 b=aIxC/EUYBDRfTvyIFXG/Ekiy/tRLihC6TXa9frZgu+iukXrlwGvP655pE5QWrjlq3g
 tiroLgGWIiAq0mUffN9fvmhzwmx1NTgFVzx8iDiKEnBgAoneLQwMDbQ/EnjLw21JS42d
 Iu8bNIexM8wGx3u1IN/JXrjIHQfG49bWO3iVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6Jh/t+jZpoXmW62Yrkq80vPjjnYG/7fIB39MphAI1U0=;
 b=6PMcp/EyK10J/QUdjE46sijJevSmMJ2eyoOsWLavFiBNJ9aqAR/tf/sAe55aPsceKd
 7QHPQ8bIEwxlI3XzpROV6/Y5+lkpm4VlPx1XPO/X3gn77ZcdY83SKtyDCAwhj3kz+CEi
 ed+3N+g2ThGM/hX9l+0fb0hVbrvROStOetUZoxW7KieN5cxQIOcTmIDtSfqxECR9u5xa
 m/dEnGLYsmWw7FKEqE6BMj5BPzzDTehmOdlAzNiR2M1C5tDwZL7Qo0srg6PMwZAnZ94H
 ve/GABzH+jdx4hHvlAhb7CeJMfExTXIr0mSiMOVlz1IUe2XBtb94CuegcjsSzwddoSse
 mvWA==
X-Gm-Message-State: AOAM531D5TQ480xB40HaEjaDDcWpcd5wVkbZDc4QJN+GIsub/vX4vhsm
 ZqC5CSspxuzSDt5z3D0TzQ/511nU2ArCvudTg2U=
X-Google-Smtp-Source: ABdhPJxf5o5nkpZZLrEHVAK0wjzRtJUsRaOh4iEbnU18Zas1dwu+ogNLMux3vrfg9NAdlTTdhxI6G2OBCNRGC3YMTfQ=
X-Received: by 2002:a05:6214:628:b0:432:c2db:94e3 with SMTP id
 a8-20020a056214062800b00432c2db94e3mr679385qvx.107.1645761720472; Thu, 24 Feb
 2022 20:02:00 -0800 (PST)
MIME-Version: 1.0
References: <20220225024221.19422-1-potin.lai@quantatw.com>
In-Reply-To: <20220225024221.19422-1-potin.lai@quantatw.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 25 Feb 2022 04:01:48 +0000
Message-ID: <CACPK8XdFGD3wT2C+gnPaVcshnnOgjyq-32qudQWn4VtcHh3SoA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.15 00/26] Add w25q01jvq and convert flash_info
 format
To: Potin Lai <potin.lai@quantatw.com>
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

Hi Potin,

On Fri, 25 Feb 2022 at 02:42, Potin Lai <potin.lai@quantatw.com> wrote:
>
> This patch series add winbond w25q01jvq flash info and convert flash_info
> flags in new format to align with upstream (v5.17).
>
> The patchs from 01 to 25 are cherry-picked from kernel 5.17, and patch 26
> is new patch for adding w25q01jvq flash info.
>
> LINK: https://lore.kernel.org/all/20220222092222.23108-1-potin.lai@quantatw.com/

I think there was a misunderstanding. Patrick suggested that we simply
apply the v1 of your patch to support the w25q01jvq to dev-5.15:

 https://lore.kernel.org/all/20211224104522.24615-1-potin.lai@quantatw.com/

This avoids the need to backport the new style flash support from
mainline to v5.15. We avoid large backports where possible as it
complicates getting fixes: as the patches aren't in mainline v5.15,
when fixes are selected for backporting, they will not target v5.15 as
the code the fixes want to fix does not exist in that revision.
Additionally, large backports carry the risk of regressions, and
making our bmc kernel less stable.

We still want to do the work to upstream support before adding it to
the openbmc tree. That means next time we rebase on a future release,
the proper patches will be present. Thanks for doing this.

Another tip when submitting upstream: make sure you use
--suppress-cc=all, so you don't send the backport emails to the author
of patches you're backporting.

I applied v1 of your patch with correction to the chip name.

Cheers,

Joel

>
> Jonathan Lemon (1):
>   mtd: spi-nor: Enable locking for n25q128a13
>
> Potin Lai (1):
>   mtd: spi-nor: winbond: Add support for w25q01jvq
>
> Tudor Ambarus (24):
>   mtd: spi-nor: core: Fix spi_nor_flash_parameter otp description
>   mtd: spi-nor: core: Use container_of to get the pointer to struct
>     spi_nor
>   mtd: spi-nor: Get rid of nor->page_size
>   mtd: spi-nor: core: Introduce the late_init() hook
>   mtd: spi-nor: atmel: Use flash late_init() for locking
>   mtd: spi-nor: sst: Use flash late_init() for locking
>   mtd: spi-nor: winbond: Use manufacturer late_init() for OTP ops
>   mtd: spi-nor: xilinx: Use manufacturer late_init() to set setup method
>   mtd: spi-nor: sst: Use manufacturer late_init() to set _write()
>   mtd: spi-nor: spansion: Use manufacturer late_init()
>   mtd: spi-nor: Fix mtd size for s3an flashes
>   mtd: spi-nor: core: Don't use mtd_info in the NOR's probe sequence of
>     calls
>   mtd: spi-nor: Introduce spi_nor_set_mtd_info()
>   mtd: spi-nor: core: Call spi_nor_post_sfdp_fixups() only when SFDP is
>     defined
>   mtd: spi-nor: core: Introduce flash_info mfr_flags
>   mtd: spi-nor: Rework the flash_info flags
>   mtd: spi-nor: Introduce spi_nor_init_flags()
>   mtd: spi-nor: Introduce spi_nor_init_fixup_flags()
>   mtd: spi-nor: core: Init all flash parameters based on SFDP where
>     possible
>   mtd: spi-nor: core: Move spi_nor_set_addr_width() in spi_nor_setup()
>   mtd: spi-nor: winbond: w25q256jvm: Init flash based on SFDP
>   mtd: spi-nor: spansion: s25fl256s0: Skip SFDP parsing
>   mtd: spi-nor: gigadevice: gd25q256: Init flash based on SFDP
>   mtd: spi-nor: issi: is25lp256: Init flash based on SFDP
>
>  drivers/mtd/spi-nor/atmel.c      |  79 +++--
>  drivers/mtd/spi-nor/catalyst.c   |  15 +-
>  drivers/mtd/spi-nor/core.c       | 536 +++++++++++++++++--------------
>  drivers/mtd/spi-nor/core.h       | 217 ++++++++-----
>  drivers/mtd/spi-nor/eon.c        |  33 +-
>  drivers/mtd/spi-nor/esmt.c       |  15 +-
>  drivers/mtd/spi-nor/everspin.c   |  12 +-
>  drivers/mtd/spi-nor/fujitsu.c    |   3 +-
>  drivers/mtd/spi-nor/gigadevice.c |  57 ++--
>  drivers/mtd/spi-nor/intel.c      |  12 +-
>  drivers/mtd/spi-nor/issi.c       |  60 ++--
>  drivers/mtd/spi-nor/macronix.c   | 105 +++---
>  drivers/mtd/spi-nor/micron-st.c  | 208 ++++++------
>  drivers/mtd/spi-nor/otp.c        |   2 +-
>  drivers/mtd/spi-nor/sfdp.c       |  20 ++
>  drivers/mtd/spi-nor/spansion.c   | 162 +++++-----
>  drivers/mtd/spi-nor/sst.c        |  96 ++++--
>  drivers/mtd/spi-nor/swp.c        |   2 +-
>  drivers/mtd/spi-nor/winbond.c    | 174 ++++++----
>  drivers/mtd/spi-nor/xilinx.c     |  21 +-
>  drivers/mtd/spi-nor/xmc.c        |  10 +-
>  include/linux/mtd/spi-nor.h      |   2 -
>  22 files changed, 1045 insertions(+), 796 deletions(-)
>
> --
> 2.17.1
>
