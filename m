Return-Path: <openbmc+bounces-1082-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BF1CEF59A
	for <lists+openbmc@lfdr.de>; Fri, 02 Jan 2026 22:25:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djcDN62jwz2x9M;
	Sat, 03 Jan 2026 08:25:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767389124;
	cv=none; b=iH/6NbHexb/YtmcEhdfW9Or1NmppCGW9CxuqzszgDB2/Rl1/gOS80gl1m5B5brioUWFuPP+hcLKzOMlVoy0xClijnownDU/MW3z385BfWL2E+H59+/dPeBY8bjS7+czGPBOXNK40l02WSMBO0L+DRYnc/XSUDpJ26UWzx/A9X2Zhowu+dEY8rZ7wug+7UxOeuJpF6KY60DBCY4Klzl0R0pr+MFWlXR3tTPaCScYz6W+BnPpvYA5P/UHCEBqJqgSswT/6/Ayv6KEqeTgOPUYHuYax4cq+vvRfPaMXoc430GIpJtJZhG3WeJirvi9BaiRc3T3VD83thuGZZGyyS41Hgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767389124; c=relaxed/relaxed;
	bh=Awl09BwhuIELnSnP5lfIqPu923VWH4uy5ZBlp30qc0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kZl/U28UMLLdriwhpL+vuDjd20IHRnuVwFIyJsgWKNKEGHtWSqAvYeD2TLsz1C28jdS1xlf3rOVTPhoS2Q/k5oxRYnW+lVQqYDdqaFbzd384qEVFOFRrFw8i8fxzGvR8ZOTUxJWgFZbC+9wfqr3mlIzQfp7v9dUHpXegmFWMii+w00GkEPotA4yGG/JtyaqsKIbI0SiFAojKE9/ZY8X28plZWXFoQbdvJY/AkXCWbGSZPGby7Hb+BxlO/q7W+LkMXxLLyAR6V3fMn/Hy5OtNlLTG6J76X4/wczVXUWPeJAmzjET77UTy/BwxB0dnEIfGRFw48wR3GehifT4Wz5Vn1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XT0q53eH; dkim-atps=neutral; spf=pass (client-ip=209.85.216.52; helo=mail-pj1-f52.google.com; envelope-from=fr0st61te@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XT0q53eH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.216.52; helo=mail-pj1-f52.google.com; envelope-from=fr0st61te@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4djcDL0sxhz2x99
	for <openbmc@lists.ozlabs.org>; Sat, 03 Jan 2026 08:25:21 +1100 (AEDT)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-34c84ec3b6eso15871099a91.3
        for <openbmc@lists.ozlabs.org>; Fri, 02 Jan 2026 13:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767389059; x=1767993859; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Awl09BwhuIELnSnP5lfIqPu923VWH4uy5ZBlp30qc0w=;
        b=XT0q53eH/ZwKhGGYrC6/zZTmVNFZy66JhCDGe19WDyUHcqMmzX+voEwyjHDKotDjS+
         pd5YCT2HcWNm+Y6t0EmB7ZrrxhqXyltaThnXfhsUBuDJsZO5orJVbHgMrKvS0uZ2batE
         /C4R0EuMMW4GKINsbl8po9ZcaqAJxsVq7egDkaA9p3+TYyXPOOBuzi+SPzbse/xvV1HE
         4P/j11wuXL/UaAI4u81xgYEHyZqLUjNDjDfupQz41SVNu7jiabtWKD15scUZyzK+SnVN
         lHpj6LbeWeBj6jd1KDoFQvJaZq8hC+6VxAsc2D6Fbj1wLhKah+BhM+oGpkqZcmjDcRgX
         bFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767389059; x=1767993859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Awl09BwhuIELnSnP5lfIqPu923VWH4uy5ZBlp30qc0w=;
        b=bePyDncXySgcRbKOFD7X3S1QzyHdRAa5GaZQb2aL9csdbUs0bSdjsadLh8L3OARBM1
         /QmqdgOJ/voYeHHHSIiJ2qjWUYr8uwe1ZtCWdYuw88IxB3vCC73NSvfcafo/LK91X7py
         9+GbYPdZZgR6DDLmeb0b9zroGtS9gUizxNonxarvvRGtsLjGyXu11pKkdIHeO5W79ipb
         jU2JxnyWZFD96OnVA99UL4fuDhq+0oYHu9QBQ9aVa80w1LR40xXvIQ+2zoPool98dCwB
         7Fwqs3YG+YHsIQGfQApW0AT304LW3VYfJ0OllVI4d8B8PJGXIGHzAKn4qvpuun5MJ8Ai
         w1og==
X-Forwarded-Encrypted: i=1; AJvYcCWWkMU01sHnAlEIpFrIxu1pksvG5r1gB4sYFj1uUfcaoLAp3dHsUc3MyHUWokdXNZCNPU3a6dqq@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzmgc04XrUXyjRojoun4H0nPUouIIpKPPry1zakKMh/1eOPTxT4
	uLUEJycxF8jqHvo60vw69PdGhdrteYQLnHd/u03EvQzpyIX168SIetL0uw2Z0ao1E+So8fqWqmx
	QqRwyHHlpT5wRMRXq/CPofnzckzoEW5g=
X-Gm-Gg: AY/fxX7xlin4cPqetHQ52kfNw8v++UUkVslQVHcMniRgXh6SN5GK9iBsH7cO35gY65I
	kJGTgYqMd6qgCu2MTW9BGCq95h4SuRdvqDRvbqIaepoiddrPxQ652mIlALCVhDFrfukMGmMqWQE
	GJzQbnUc/7JmVACbHismfRWkWPmsHc4w/u/TUhuVDwzUAzW1UpRs5PP2doJ7mGkKzAVmaFwt0Rn
	13BalYa3LXIVYU1EpXB5FODa6u4v/Q0gtGHVCv4buLWs6abE6nwq6tecwwLJ93yzY0bI4Ih
X-Google-Smtp-Source: AGHT+IEplm7mEH0tbp4brKLcpXIrSQWmIJbYGFnU3TEELYkZ1ynTN/o7n27W6SW7/t/vkPdG0eRaq8ViCezXdYT3rKQ=
X-Received: by 2002:a17:90b:580e:b0:34e:7938:669c with SMTP id
 98e67ed59e1d1-34e921cbe18mr32338336a91.25.1767389058843; Fri, 02 Jan 2026
 13:24:18 -0800 (PST)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20251202-msx4-v2-0-a605d448bd02@nvidia.com> <20251202-msx4-v2-1-a605d448bd02@nvidia.com>
In-Reply-To: <20251202-msx4-v2-1-a605d448bd02@nvidia.com>
From: =?UTF-8?B?0JjQstCw0L0g0JzQuNGF0LDQudC70L7Qsg==?= <fr0st61te@gmail.com>
Date: Sat, 3 Jan 2026 00:24:07 +0300
X-Gm-Features: AQt7F2puUeFAAaG-XfYSBKsF_1-L7o9HhizO3mq-VdajfCop_nLr5h0ExT7khOA
Message-ID: <CAKkNK0JOPAyw8HA0XnD836d115p5YBbo=uBD9eXXvByzCv92Yg@mail.gmail.com>
Subject: Re: [PATCH u-boot v2 1/2] drivers: spi: Add support for disabling
 FMC_WDT2 for aspeed
To: Marc Olberding <molberding@nvidia.com>
Cc: andrew@codeconstruct.com.au, joel@jms.id.au, openbmc@lists.ozlabs.org, 
	eajames@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Dec 3, 2025 at 2:53=E2=80=AFAM Marc Olberding <molberding@nvidia.co=
m> wrote:
>
> Adds support for disabling the ast2600 FMC_WDT2 through
> a device tree entry in the fmc node.
> Set `aspeed,watchdog-disable` in your device tree to have
> the driver disable it.

Marc, FMC_WDT2 doesn't disable watchdog, it controls ABR mode.
Watchdog with or without ABR still in operational mode.
So, maybe aspeed,abr-disable?

Below namings probably should be corrected.

>
> Signed-off-by: Marc Olberding <molberding@nvidia.com>
> ---
>  drivers/spi/aspeed_spi.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/spi/aspeed_spi.c b/drivers/spi/aspeed_spi.c
> index 54520122f1c48c8b2052b4b1e47445a9b990d25e..de954e477aa15e6d1be042a2a=
ee47f5a501178da 100644
> --- a/drivers/spi/aspeed_spi.c
> +++ b/drivers/spi/aspeed_spi.c
> @@ -30,14 +30,16 @@ struct aspeed_spi_regs {
>                                         /* 0x30 .. 0x38 Segment Address *=
/
>         u32 _reserved1[5];              /* .. */
>         u32 soft_rst_cmd_ctrl;  /* 0x50 Auto Soft-Reset Command Control *=
/
> -       u32 _reserved2[11];             /* .. */
> +       u32 _reserved2[4];              /* .. */
> +       u32 wdt2_ctrl;                  /* 0x64 FMC_WDT2 control */
> +       u32 _reserved3[6];              /* .. */
>         u32 dma_ctrl;                   /* 0x80 DMA Control/Status */
>         u32 dma_flash_addr;             /* 0x84 DMA Flash Side Address */
>         u32 dma_dram_addr;              /* 0x88 DMA DRAM Side Address */
>         u32 dma_len;                    /* 0x8c DMA Length Register */
>         u32 dma_checksum;               /* 0x90 Checksum Calculation Resu=
lt */
>         u32 timings;                    /* 0x94 Read Timing Compensation =
*/
> -       u32 _reserved3[1];
> +       u32 _reserved4[1];
>         /* not used */
>         u32 soft_strap_status;          /* 0x9c Software Strap Status */
>         u32 write_cmd_filter_ctrl;      /* 0xa0 Write Command Filter Cont=
rol */
> @@ -45,7 +47,7 @@ struct aspeed_spi_regs {
>         u32 lock_ctrl_reset;            /* 0xa8 Lock Control (SRST#) */
>         u32 lock_ctrl_wdt;              /* 0xac Lock Control (Watchdog) *=
/
>         u32 write_addr_filter[8];       /* 0xb0 Write Address Filter */
> -       u32 _reserved4[12];
> +       u32 _reserved5[12];
>         u32 fully_qualified_cmd[20];    /* 0x100 Fully Qualified Command =
*/
>         u32 addr_qualified_cmd[12];     /* 0x150 Address Qualified Comman=
d */
>  };
> @@ -163,7 +165,8 @@ struct aspeed_spi_regs {
>  #define SPI_3B_AUTO_CLR_REG   0x1e6e2510
>  #define SPI_3B_AUTO_CLR       BIT(9)
>
> -
> +/* FMC_WDT2 control register */
> +#define WDT2_ENABLE            BIT(0)
>  /*
>   * flash related info
>   */
> @@ -267,6 +270,7 @@ struct aspeed_spi_priv {
>         ulong hclk_rate; /* AHB clock rate */
>         u8 num_cs;
>         bool is_fmc;
> +       bool disable_wdt;
>
>         struct aspeed_spi_flash flashes[ASPEED_SPI_MAX_CS];
>         u32 flash_count;
> @@ -683,6 +687,9 @@ static int aspeed_spi_controller_init(struct aspeed_s=
pi_priv *priv)
>         setbits_le32(&priv->regs->conf,
>                      CONF_ENABLE_W2 | CONF_ENABLE_W1 | CONF_ENABLE_W0);
>
> +       if (priv->is_fmc && priv->disable_wdt)
> +               clrbits_le32(&priv->regs->wdt2_ctrl, WDT2_ENABLE);
> +
>         /*
>          * Set safe default settings for each device. These will be
>          * tuned after the SPI flash devices are probed.
> @@ -1907,6 +1914,10 @@ static int aspeed_spi_probe(struct udevice *bus)
>          * SPI controllers
>          */
>         priv->is_fmc =3D dev_get_driver_data(bus);
> +       if (device_is_compatible(bus, "aspeed,ast2600-fmc") &&
> +           dev_read_bool(bus, "aspeed,watchdog-disable"))
> +               priv->disable_wdt =3D true;
> +
>
>         ret =3D aspeed_spi_controller_init(priv);
>         if (ret)
>
> --
> 2.34.1
>

This patch go through the standard upstream process or just openbmc u-boot?
Do you have plans to do any changes around the linux kernel with
fmc_wdt2 + spi part?

Thanks.

