Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3340D41B96
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 07:43:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Nwl42wTHzDqsj
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 15:43:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=mendozajonas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="ZjsX8pse"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="IGLN6KfN"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NwkP2N8SzDqsl
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jun 2019 15:42:36 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id AC502564;
 Wed, 12 Jun 2019 01:42:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 12 Jun 2019 01:42:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=message-id:subject:from:to:cc:date
 :in-reply-to:references:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=1XXJOCDS5TlstcINCL6PSOkxip
 /YpBif4YROEL9IeDE=; b=ZjsX8pseSwLZIEBOjb+eoawTGPnwc6PyTnVRxtddw4
 7+rFc410ZTaX/a/F02QSfcJm7L9PsPs2jWCIwKiYlwbvlMvv3nNPt/GTFYIIQXvP
 VAW6FUEW5553xJ8IH5QFBcTqpH4J9jRPHdS+YoFEFdrfYy+8GtNYZMd9A9ianxlR
 /iV3LhsLq5X6wTgH5V7LPRhAvEp9BL6b4iZO/7ndljYzVbzpH/WibHqNFzr/Ll+I
 RsIZ8yFoJGnEeZMg4N731oYm/LuKlK3SYZeI3uURS1YDa0UaopOWnLlSSmZSMwDV
 c32aWqVZARSbCmgs9JlUlpe5es9NOlN1Znw68encuNng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=1XXJOCDS5TlstcINCL6PSOkxip/YpBif4YROEL9Ie
 DE=; b=IGLN6KfNg9o0K4ZhimFV1J5tzfhEagZldseyjjSGFm0d94f6YXk/7Spcm
 CnLwD4tz8dzG/Tih44jt0x4bcjXKiMM8dSX5Pk0MSOVCgzVuvIDRIrIgjTrgCQfA
 sTTra81MHCoR4mcsCMZy/ryUg7/bxvFCqFkqqD6xqC9GFABocjVgQjTGveKJLPlp
 v0FDja5xXEUBhsioTi0CN1d6Aabkekd1AEmPqkCMkTTOPeB+5ImFOPhPFDn5NQZu
 Dmnh91hBBZQ0/yXFbzzwiE6q4kq6v0a0ITbmNZVcit4MNxUgOJMQQzgWrjFCzAtJ
 WemB0xPGUE+q1Kxkhel6YJeSCFgCA==
X-ME-Sender: <xms:xJAAXQwdVO8xta1y--zYxEUWOMB63SnH8wXcnIQI_djlC6dxJDQAjA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehiedgleejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepufgrmhhu
 vghlucfovghnughoiigrqdflohhnrghsuceoshgrmhesmhgvnhguohiirghjohhnrghsrd
 gtohhmqeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduvdefrddvheeg
 rdduvdeirddutdeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmsehmvghnughoii
 grjhhonhgrshdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:xJAAXciZc-WoQPCPot5D5AefqNZ9uOua6TKDyboTPX9X-b9T3UHVaA>
 <xmx:xJAAXWSvYnjSsdXcEy6_-lG-VeMV8BGaZp8dbRAGyD_GKJb4n1Yt3w>
 <xmx:xJAAXV0qkvq3YpM7qQzEzXSEdeTcjKcPuw9LDJauTSbTxecQj4BYHQ>
 <xmx:yJAAXQKPUeZMAohuZ5xeNY8PAqUuISg7hx6tJYuttA7JtQnw4p0Iaw>
Received: from v4 (unknown [123.254.126.106])
 by mail.messagingengine.com (Postfix) with ESMTPA id 467B980059;
 Wed, 12 Jun 2019 01:42:25 -0400 (EDT)
Message-ID: <3761318b0b3dc3d0e3ae1c5faaa075d63d650962.camel@mendozajonas.com>
Subject: Re: [PATCH 1/4] phy: Add support for the NC-SI protocol
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: Joel Stanley <joel@jms.id.au>
Date: Wed, 12 Jun 2019 15:42:22 +1000
In-Reply-To: <CACPK8Xd_OTZK+HO=xXp5dFn0rcZH_fCfbJndXVcttj0MR2_fxg@mail.gmail.com>
References: <20190606044950.5930-1-sam@mendozajonas.com>
 <20190606044950.5930-2-sam@mendozajonas.com>
 <CACPK8Xd_OTZK+HO=xXp5dFn0rcZH_fCfbJndXVcttj0MR2_fxg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Simon Glass <sjg@chromium.org>, joe.hershberger@ni.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2019-06-12 at 02:40 +0000, Joel Stanley wrote:
> On Thu, 6 Jun 2019 at 04:50, Samuel Mendoza-Jonas <sam@mendozajonas.com> wrote:
> > This introduces support for the NC-SI protocol, modelled as a phy driver
> > for other ethernet drivers to consume.
> > 
> > NC-SI (Network Controller Sideband Interface) is a protocol to manage a
> > sideband connection to a proper network interface, for example a BMC
> > (Baseboard Management Controller) sharing the NIC of the host system.
> > Probing and configuration occurs by communicating with the "remote" NIC
> > via NC-SI control frames (Ethernet header 0x88f8).
> > 
> > This implementation is roughly based on the upstream Linux
> > implementation[0], with a reduced feature set and an emphasis on getting
> > a link up as fast as possible rather than probing the full possible
> > topology of the bus.
> > The current phy model relies on the network being "up", sending NC-SI
> > command frames via net_send_packet() and receiving them from the
> > net_loop() loop (added in a following patch).
> > 
> > The ncsi-pkt.h header[1] is copied from the Linux kernel for consistent
> > field definitions.
> > 
> > [0]: https://github.com/torvalds/linux/tree/master/net/ncsi
> > [1]: https://github.com/torvalds/linux/blob/master/net/ncsi/ncsi-pkt.h
> > 
> > Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> 
> Looks good. Some comments below.
> 
> > +static int ncsi_validate_rsp(struct ncsi_rsp_pkt *pkt, int payload)
> > +{
> > +       struct ncsi_rsp_pkt_hdr *hdr = &pkt->rsp;
> > +       __be32 pchecksum;
> > +       u32 checksum;
> > +       if (ntohs(hdr->common.length) != payload) {
> > +               printf("NCSI: 0x%02x response has incorrect length %d\n",
> > +                      hdr->common.type, hdr->common.length);
> > +               return -1;
> > +       }
> > +
> > +       pchecksum = get_unaligned_be32((void *)(hdr + 1) + payload - 4);
> 
> Wheee. So the checksum is the last 4-bytes of the payload. I assume
> it's always longer than 4?
> 
> A clarifying comment might help, or try to write it in a different way:

"Wheee" indeed. I kept this roughly as it is in the kernel so I could
more easily verify it was doing the right thing; now that it's more
tested I'll do something like below so it's less traumatic.

> 
> endp = (void *)hdr + sizeof(hdr) + payload;
> pchecksum = get_unaligned_be32(endp - sizeof(checksum));
> 
> or
> 
>     checksum_offset = sizeof(hdr) + payload - sizeof(checksum);
>     pchecksum = get_unaligned_be32(payload + checksum_offset);
> 
> > +       if (pchecksum != 0) {
> > +               checksum = ncsi_calculate_checksum((unsigned char *)hdr,
> > +                                                  sizeof(*hdr) + payload - 4);
> 
> And then this can be:
> 
>     checksum = ((unsigned char *)hdr, checksum_offset);
> 
> > +               if (pchecksum != checksum) {
> > +                       printf("NCSI: 0x%02x response has invalid checksum\n",
> > +                              hdr->common.type);
> > +                       return -1;
> > +               }
> > +       }
> > +static void ncsi_send_sma(unsigned int np, unsigned int nc)
> > +{
> > +       struct ncsi_cmd_sma_pkt cmd;
> > +       unsigned char *addr;
> > +
> > +       addr = eth_get_ethaddr();
> > +       if (!addr) {
> > +               printf("NCSI: no MAC address configured\n");
> > +               return;
> > +       }
> > +
> > +       memset(&cmd, 0, sizeof(cmd));
> > +       memcpy(cmd.mac, addr, 6);
> 
> Are there endianness issues with addr here?

Aha, will fixup.

> 
> > +       cmd.index = 1;
> > +       cmd.at_e = 1;
> > +
> > +       ncsi_send_command(np, nc, NCSI_PKT_CMD_SMA,
> > +                         ((unsigned char *)&cmd)
> > +                         + sizeof(struct ncsi_cmd_pkt_hdr),
> > +                         cmd_payload(NCSI_PKT_CMD_SMA), true);
> > +}
> > +
> > +int ncsi_probe(struct phy_device *phydev)
> > +{
> > +       // TODO Associate per device
> 
> Is this required before we can support multiple NICs?

Yes, I'll chase this up.

> 
> > +       if (!ncsi_priv) {
> > +               ncsi_priv = malloc(sizeof(struct ncsi));
> > +               if (!ncsi_priv)
> > +                       return -ENOMEM;
> > +               memset(ncsi_priv, 0, sizeof(struct ncsi));
> > +       }
> > +
> > +       phydev->priv = ncsi_priv;
> > +
> > +       return 0;
> > +}
> > +
> > +int ncsi_startup(struct phy_device *phydev)
> > +{
> > +       /* Set phydev parameters */
> > +       phydev->speed = SPEED_100;
> > +       phydev->duplex = DUPLEX_FULL;
> > +       /* Normal phy reset is N/A */
> > +       phydev->flags |= PHY_FLAG_BROKEN_RESET;
> > +
> > +       /* Set initial probe state */
> > +       ncsi_priv->state = NCSI_PROBE_PACKAGE_SP;
> > +
> > +       /* No active package/channel yet */
> > +       ncsi_priv->current_package = NCSI_PACKAGE_MAX;
> > +       ncsi_priv->current_channel = NCSI_CHANNEL_MAX;
> > +
> > +       /* Pretend link works so ftgmac100 sets final bits up */
> 
> s/ftgmac100/mac driver/ ?

Ack

> 
> > +       phydev->link = true;
> > +
> > +       return 0;
> > +}
> > +
> > +int ncsi_shutdown(struct phy_device *phydev)
> > +{
> > +       printf("NCSI: Disabling package %d\n", ncsi_priv->current_package);
> > +       ncsi_send_dp(ncsi_priv->current_package);
> > +       return 0;
> > +}
> > +
> > +static struct phy_driver ncsi_driver = {
> > +       .uid            = PHY_NCSI_ID,
> > +       .mask           = 0xffffffff,
> > +       .name           = "NC-SI",
> > +       .features       = PHY_100BT_FEATURES | PHY_DEFAULT_FEATURES | SUPPORTED_100baseT_Full | SUPPORTED_MII,
> > +       .probe          = ncsi_probe,
> > +       .startup        = ncsi_startup,
> > +       .shutdown       = ncsi_shutdown,
> > +};
> > +
> > +int phy_ncsi_init(void)
> > +{
> > +       phy_register(&ncsi_driver);
> > +       return 0;
> > +}
> > --- /dev/null
> > +++ b/include/net/ncsi-pkt.h
> > @@ -0,0 +1,415 @@
> > +/*
> > + * Copyright Gavin Shan, IBM Corporation 2016.
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License as published by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + */
> 
> If you grab the version from 5.2-rc3 it has been SPDXified.

Cheers, will do.

> 
> > --- a/include/phy.h
> > +++ b/include/phy.h
> > @@ -17,6 +17,7 @@
> >  #include <phy_interface.h>
> > 
> >  #define PHY_FIXED_ID           0xa5a55a5a
> > +#define PHY_NCSI_ID            0xbeefcafe
> 
> hmmm...

Haha - suggestions welcome?

> 
> >  #define PHY_MAX_ADDR 32
> > 
> > --
> > 2.21.0
> > 


