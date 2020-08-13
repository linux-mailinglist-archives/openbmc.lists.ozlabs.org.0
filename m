Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDB42432F2
	for <lists+openbmc@lfdr.de>; Thu, 13 Aug 2020 05:46:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRstt1lvKzDqbB
	for <lists+openbmc@lfdr.de>; Thu, 13 Aug 2020 13:46:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::543;
 helo=mail-ed1-x543.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=iuZ9UBLy; dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRssk3RvjzDqRN
 for <openbmc@lists.ozlabs.org>; Thu, 13 Aug 2020 13:45:28 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id cq28so3093358edb.10
 for <openbmc@lists.ozlabs.org>; Wed, 12 Aug 2020 20:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XEaq1ltZUdp/fNvB6iQoRtFRx9BKMr9ZFWMRqUCB+bQ=;
 b=iuZ9UBLyfsJ08Gmlv3Y0CzRTQbYPmYKS0C1eqqKlQmF6RauhyZHrglK+mj319VAnYq
 JTXkbc5+0yKHyJEz1yrmmnmwSSMYhZ8dojoxzuBubAjVCrBxtLIMHJkaCuZvgCyy7Xfa
 URxeh02i6bSOaViz3PJboM8vPqatJAsgIEqAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XEaq1ltZUdp/fNvB6iQoRtFRx9BKMr9ZFWMRqUCB+bQ=;
 b=g8L6WlLkF4mvpP1FEpUW0HlhNBWBDCBWPBuAxs6PwlEe6DcCk+G6OprMqkNRNTJxDe
 GqvPL6cFCho2TdbjMmxGdZxQxbiPZI4x7wcUmo94HPnjt9g4NHW1KpDhlJWL4H1oWCtP
 RCVG8T01Iq4d/1XZnlFIeQX+8w6qksaQgaoddMHcIMWXMCpmzWATMcrPKeCxM0yjLUQB
 NC6NtFDtloDMP7WRJPNydHQpf9sDoCcyhlvfJCbroiWlZ5eKo9ngxzCLISAOde3RYSrO
 Q+a2OIi1SB7qhS+S7n+mfT4WArckfBHcZbhX1KzjMf1GGr9OMDj7FiFLREYM2xSUjWeq
 FIuA==
X-Gm-Message-State: AOAM532wjXvzxiJ6S4Rqc1hhX9JjCpQEEt9YNooOZJtSNnWZNWjAn8c5
 zg4k9yiLr3DeXiIntsH8pddM9iEoQzbhwVGC95g=
X-Google-Smtp-Source: ABdhPJxjkxq6BnAdhTzIczQ46esDfBSFKRS/Oegcw2b6PahPN/rq9oeG0QuWARYs500h0ct+g2629LsLvnuchjS6TzA=
X-Received: by 2002:a50:a69a:: with SMTP id e26mr2840143edc.260.1597290323813; 
 Wed, 12 Aug 2020 20:45:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200730220330.16368-1-eajames@linux.ibm.com>
 <20200730220330.16368-7-eajames@linux.ibm.com>
In-Reply-To: <20200730220330.16368-7-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 13 Aug 2020 03:45:11 +0000
Message-ID: <CACPK8XfV_hWkvRdgEUwP84CcYgXcRCKRtWi+xXqDJrbSkub_ag@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.7 v2 6/7] spi: fsi: Check mux status before
 transfers
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 30 Jul 2020 at 22:03, Eddie James <eajames@linux.ibm.com> wrote:
>
> The SPI controllers are not accessible if the mux isn't set. Therefore,
> check the mux status before starting a transfer and fail out if it isn't
> set.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/spi/spi-fsi.c | 40 +++++++++++++++++++++++++++-------------
>  1 file changed, 27 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/spi/spi-fsi.c b/drivers/spi/spi-fsi.c
> index 53cfa201e187..8949a64ec87d 100644
> --- a/drivers/spi/spi-fsi.c
> +++ b/drivers/spi/spi-fsi.c
> @@ -12,6 +12,7 @@
>
>  #define FSI_ENGID_SPI                  0x23
>  #define FSI_MBOX_ROOT_CTRL_8           0x2860
> +#define  FSI_MBOX_ROOT_CTRL_8_SPI       0xf0000000

Could be called SPI_MUX or something similar.

>
>  #define FSI2SPI_DATA0                  0x00
>  #define FSI2SPI_DATA1                  0x04
> @@ -84,6 +85,26 @@ struct fsi_spi_sequence {
>         u64 data;
>  };
>
> +static int fsi_spi_check_mux(struct fsi_device *fsi, struct device *dev)
> +{
> +       int rc;
> +       u32 root_ctrl_8;
> +       __be32 root_ctrl_8_be;
> +
> +       rc = fsi_slave_read(fsi->slave, FSI_MBOX_ROOT_CTRL_8, &root_ctrl_8_be,
> +                           sizeof(root_ctrl_8_be));
> +       if (rc)
> +               return rc;
> +
> +       root_ctrl_8 = be32_to_cpu(root_ctrl_8_be);
> +       dev_dbg(dev, "Root control register 8: %08x\n", root_ctrl_8);
> +       if ((root_ctrl_8 & FSI_MBOX_ROOT_CTRL_8_SPI) ==
> +            FSI_MBOX_ROOT_CTRL_8_SPI)
> +               return 0;
> +
> +       return -ENOLINK;

We bubble this error up to device drivers. Are they ok with ENOLINK?

> +}
> +
>  static int fsi_spi_check_status(struct fsi_spi *ctx)
>  {
>         int rc;
> @@ -449,11 +470,15 @@ static int fsi_spi_transfer_init(struct fsi_spi *ctx)
>  static int fsi_spi_transfer_one_message(struct spi_controller *ctlr,
>                                         struct spi_message *mesg)
>  {
> -       int rc = 0;
> +       int rc;
>         u8 seq_slave = SPI_FSI_SEQUENCE_SEL_SLAVE(mesg->spi->chip_select + 1);
>         struct spi_transfer *transfer;
>         struct fsi_spi *ctx = spi_controller_get_devdata(ctlr);
>
> +       rc = fsi_spi_check_mux(ctx->fsi, ctx->dev);
> +       if (rc)
> +               return rc;
> +
>         list_for_each_entry(transfer, &mesg->transfers, transfer_list) {
>                 struct fsi_spi_sequence seq;
>                 struct spi_transfer *next = NULL;
> @@ -537,24 +562,13 @@ static size_t fsi_spi_max_transfer_size(struct spi_device *spi)
>  static int fsi_spi_probe(struct device *dev)
>  {
>         int rc;
> -       u32 root_ctrl_8;
>         struct device_node *np;
>         int num_controllers_registered = 0;
>         struct fsi_device *fsi = to_fsi_dev(dev);
>
> -       /*
> -        * Check the SPI mux before attempting to probe. If the mux isn't set
> -        * then the SPI controllers can't access their slave devices.
> -        */
> -       rc = fsi_slave_read(fsi->slave, FSI_MBOX_ROOT_CTRL_8, &root_ctrl_8,
> -                           sizeof(root_ctrl_8));
> +       rc = fsi_spi_check_mux(fsi, dev);
>         if (rc)
> -               return rc;
> -
> -       if (!root_ctrl_8) {
> -               dev_dbg(dev, "SPI mux not set, aborting probe.\n");

Should we make this a dev_warn so it's clear why the driver did not "work"?

>                 return -ENODEV;

> -       }
>
>         for_each_available_child_of_node(dev->of_node, np) {
>                 u32 base;
> --
> 2.24.0
>
