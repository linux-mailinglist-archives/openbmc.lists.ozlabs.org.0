Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F3141A74
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 04:41:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Nrjk4z07zDqvV
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 12:41:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Pr91t4nJ"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Nrj661r5zDqvK
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jun 2019 12:41:14 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id m29so17101190qtu.1
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 19:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MiV1uDLbmSM4MW8PZzT6ifAls5y7TIn0VDcNehNB4qQ=;
 b=Pr91t4nJ2IUCKq34hPuPMjeW+VLcyI0Y3LCR+Tgloj1yctk10oTitrm5Z3dKcxT2u1
 /uCIp8PFzQ31pytmHTZYKOB4t2pYxgfxmC+A+T2gRLE++YZXQKTZVWvdjKUg1Gutl2Zx
 lvLuaNnWLglN66tnN6+wZ+iXLr9j23I+Q77cE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MiV1uDLbmSM4MW8PZzT6ifAls5y7TIn0VDcNehNB4qQ=;
 b=BoIoXAM+1s+ePWKcy6dEJSC9vjwmg5vtbHxHPEtjafw21ELqSWC50Xn/wxae5eU4eV
 kC/AzV9NS4YsTj+mnVHeOJXxGLmaLC5VeQQL99LgzxG6DzqWxEiaap2MqjpJuH4Ho/Yw
 rytku4ye5F8GuiLEBwrRMg8k3TmBFguVDTVw6j93iQe6KdhzL3J/eO77z+Konn5BIt61
 l191DIjMMTQq4mW64Uhg2v4QhE36klnMFXLt0qBYWBqKUBvbieV3voliOKZZAphM1gqQ
 H83CM2Za9qpMJBaDSqMB7/4Jce36AvzdF1JfGycvpsQZX60SXSXBqbKjgwDLNg6JLC6b
 ZuVw==
X-Gm-Message-State: APjAAAX2nvEUoBTxcRi6XuysaICQd66m/yJCXUYBFgg7s0MAgEBuYmoj
 QOiO6EmbVjQqSGT5o11JYY3V8D0cxl7YdA2dnz4iXb1Bc8A=
X-Google-Smtp-Source: APXvYqyS6bdBcLvLLrrye5CgJHKQ2Aa3+jegqsr2gViqLAGMGLRGGpCOpdFw78McJCMn3yXqSaXifsbpV9sOEDKIJdE=
X-Received: by 2002:ac8:2493:: with SMTP id s19mr47403518qts.220.1560307268913; 
 Tue, 11 Jun 2019 19:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190606044950.5930-1-sam@mendozajonas.com>
 <20190606044950.5930-2-sam@mendozajonas.com>
In-Reply-To: <20190606044950.5930-2-sam@mendozajonas.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 12 Jun 2019 02:40:56 +0000
Message-ID: <CACPK8Xd_OTZK+HO=xXp5dFn0rcZH_fCfbJndXVcttj0MR2_fxg@mail.gmail.com>
Subject: Re: [PATCH 1/4] phy: Add support for the NC-SI protocol
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>
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
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Simon Glass <sjg@chromium.org>, joe.hershberger@ni.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 6 Jun 2019 at 04:50, Samuel Mendoza-Jonas <sam@mendozajonas.com> wrote:
>
> This introduces support for the NC-SI protocol, modelled as a phy driver
> for other ethernet drivers to consume.
>
> NC-SI (Network Controller Sideband Interface) is a protocol to manage a
> sideband connection to a proper network interface, for example a BMC
> (Baseboard Management Controller) sharing the NIC of the host system.
> Probing and configuration occurs by communicating with the "remote" NIC
> via NC-SI control frames (Ethernet header 0x88f8).
>
> This implementation is roughly based on the upstream Linux
> implementation[0], with a reduced feature set and an emphasis on getting
> a link up as fast as possible rather than probing the full possible
> topology of the bus.
> The current phy model relies on the network being "up", sending NC-SI
> command frames via net_send_packet() and receiving them from the
> net_loop() loop (added in a following patch).
>
> The ncsi-pkt.h header[1] is copied from the Linux kernel for consistent
> field definitions.
>
> [0]: https://github.com/torvalds/linux/tree/master/net/ncsi
> [1]: https://github.com/torvalds/linux/blob/master/net/ncsi/ncsi-pkt.h
>
> Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>

Looks good. Some comments below.

> +static int ncsi_validate_rsp(struct ncsi_rsp_pkt *pkt, int payload)
> +{
> +       struct ncsi_rsp_pkt_hdr *hdr = &pkt->rsp;
> +       __be32 pchecksum;
> +       u32 checksum;

> +       if (ntohs(hdr->common.length) != payload) {
> +               printf("NCSI: 0x%02x response has incorrect length %d\n",
> +                      hdr->common.type, hdr->common.length);
> +               return -1;
> +       }
> +
> +       pchecksum = get_unaligned_be32((void *)(hdr + 1) + payload - 4);

Wheee. So the checksum is the last 4-bytes of the payload. I assume
it's always longer than 4?

A clarifying comment might help, or try to write it in a different way:

endp = (void *)hdr + sizeof(hdr) + payload;
pchecksum = get_unaligned_be32(endp - sizeof(checksum));

or

    checksum_offset = sizeof(hdr) + payload - sizeof(checksum);
    pchecksum = get_unaligned_be32(payload + checksum_offset);

> +       if (pchecksum != 0) {
> +               checksum = ncsi_calculate_checksum((unsigned char *)hdr,
> +                                                  sizeof(*hdr) + payload - 4);

And then this can be:

    checksum = ((unsigned char *)hdr, checksum_offset);

> +               if (pchecksum != checksum) {
> +                       printf("NCSI: 0x%02x response has invalid checksum\n",
> +                              hdr->common.type);
> +                       return -1;
> +               }
> +       }

> +static void ncsi_send_sma(unsigned int np, unsigned int nc)
> +{
> +       struct ncsi_cmd_sma_pkt cmd;
> +       unsigned char *addr;
> +
> +       addr = eth_get_ethaddr();
> +       if (!addr) {
> +               printf("NCSI: no MAC address configured\n");
> +               return;
> +       }
> +
> +       memset(&cmd, 0, sizeof(cmd));
> +       memcpy(cmd.mac, addr, 6);

Are there endianness issues with addr here?

> +       cmd.index = 1;
> +       cmd.at_e = 1;
> +
> +       ncsi_send_command(np, nc, NCSI_PKT_CMD_SMA,
> +                         ((unsigned char *)&cmd)
> +                         + sizeof(struct ncsi_cmd_pkt_hdr),
> +                         cmd_payload(NCSI_PKT_CMD_SMA), true);
> +}

> +
> +int ncsi_probe(struct phy_device *phydev)
> +{
> +       // TODO Associate per device

Is this required before we can support multiple NICs?

> +       if (!ncsi_priv) {
> +               ncsi_priv = malloc(sizeof(struct ncsi));
> +               if (!ncsi_priv)
> +                       return -ENOMEM;
> +               memset(ncsi_priv, 0, sizeof(struct ncsi));
> +       }
> +
> +       phydev->priv = ncsi_priv;
> +
> +       return 0;
> +}
> +
> +int ncsi_startup(struct phy_device *phydev)
> +{
> +       /* Set phydev parameters */
> +       phydev->speed = SPEED_100;
> +       phydev->duplex = DUPLEX_FULL;
> +       /* Normal phy reset is N/A */
> +       phydev->flags |= PHY_FLAG_BROKEN_RESET;
> +
> +       /* Set initial probe state */
> +       ncsi_priv->state = NCSI_PROBE_PACKAGE_SP;
> +
> +       /* No active package/channel yet */
> +       ncsi_priv->current_package = NCSI_PACKAGE_MAX;
> +       ncsi_priv->current_channel = NCSI_CHANNEL_MAX;
> +
> +       /* Pretend link works so ftgmac100 sets final bits up */

s/ftgmac100/mac driver/ ?

> +       phydev->link = true;
> +
> +       return 0;
> +}
> +
> +int ncsi_shutdown(struct phy_device *phydev)
> +{
> +       printf("NCSI: Disabling package %d\n", ncsi_priv->current_package);
> +       ncsi_send_dp(ncsi_priv->current_package);
> +       return 0;
> +}
> +
> +static struct phy_driver ncsi_driver = {
> +       .uid            = PHY_NCSI_ID,
> +       .mask           = 0xffffffff,
> +       .name           = "NC-SI",
> +       .features       = PHY_100BT_FEATURES | PHY_DEFAULT_FEATURES | SUPPORTED_100baseT_Full | SUPPORTED_MII,
> +       .probe          = ncsi_probe,
> +       .startup        = ncsi_startup,
> +       .shutdown       = ncsi_shutdown,
> +};
> +
> +int phy_ncsi_init(void)
> +{
> +       phy_register(&ncsi_driver);
> +       return 0;
> +}


> --- /dev/null
> +++ b/include/net/ncsi-pkt.h
> @@ -0,0 +1,415 @@
> +/*
> + * Copyright Gavin Shan, IBM Corporation 2016.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */

If you grab the version from 5.2-rc3 it has been SPDXified.

> --- a/include/phy.h
> +++ b/include/phy.h
> @@ -17,6 +17,7 @@
>  #include <phy_interface.h>
>
>  #define PHY_FIXED_ID           0xa5a55a5a
> +#define PHY_NCSI_ID            0xbeefcafe

hmmm...

>
>  #define PHY_MAX_ADDR 32
>
> --
> 2.21.0
>
