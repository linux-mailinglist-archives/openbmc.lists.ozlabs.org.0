Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8692AD205
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2019 04:41:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46RXVQ08TszDqQs
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2019 12:41:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=mendozajonas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="iUvQMnjA"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="rcNko6RA"; dkim-atps=neutral
X-Greylist: delayed 365 seconds by postgrey-1.36 at bilbo;
 Mon, 09 Sep 2019 12:40:58 AEST
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46RXTk2NbhzDqNV
 for <openbmc@lists.ozlabs.org>; Mon,  9 Sep 2019 12:40:58 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 8F854668;
 Sun,  8 Sep 2019 22:34:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sun, 08 Sep 2019 22:34:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=message-id:subject:from:to:cc:date
 :in-reply-to:references:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=kH2ROx4y/P3iN3iuHAZsxqnBpS
 qHq/scO/9Mux4QVuM=; b=iUvQMnjACyQvWVWfLOONOYLD5HsjYVtKSHHpyirCIs
 YiV+5XbnS2f/JqYVUNIS6dSkDlGRPagJEaeVpI6g7iWKmIVWBZdGBRoAXwMUE69c
 KxT8cIiHCkp/bN4BGzDEme3/ljA4hmQTtygjP/466Lvu9X/egC4ydwEyrS5b2RDB
 o/i8wxWzFKMlOihGnF60sp5Ws19sCU1V5y3ZTFbrFX35EkfYciAUKnPzk71VQkSA
 kodNosejZBK70Cnm+xX/VSvhpDeiRja1TC+w7Sq5KXUqfovK5vb2dG5c2CNeEWe3
 mCOBb8S2yvWO2Ykjr8VY7fE4YldzgI1hSUmjQnbaiIng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=kH2ROx4y/P3iN3iuHAZsxqnBpSqHq/scO/9Mux4QV
 uM=; b=rcNko6RA4z2rUhaXIgHw6XpnDZsKC8Vzi2vPwLP00Sa1qG9prmZnjmToN
 iRjq9DxjXZXmtzvXvHzDd21YkTXO88Af9eaXlh86MuKHrGjkp+y9Hb3bqwe+KQoN
 FCNtaLWPn6vFR2HgYFM8smftoZDVcS0ZbqB6G4HqujSFdJsczeMEmtzF0CKrLIve
 /73M6VUjpJXqnUbSJrMdNbjIvP7GFjq/gXsTqnxK08ktYiAHTKcWVEIpb75xyRlp
 xh82J+GZsWKkJJtYZr1MA9OmGvdCJ65o5+05TH2BlP5C3c67FRdZtwVAxqutczIQ
 /IVf6FBGfho7lwEL8Ay2qUrNWX5gw==
X-ME-Sender: <xms:Sbp1XehSW6fdQRpbrbxrCaXSMIb-JvPw1sh-q60_iZodIghsediCQw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudekhedgiedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepufgrmhhu
 vghlucfovghnughoiigrqdflohhnrghsuceoshgrmhesmhgvnhguohiirghjohhnrghsrd
 gtohhmqeenucffohhmrghinhepuggvnhigrdguvgenucfkphepjeehrddujedvrdduleek
 rdelleenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhesmhgvnhguohiirghjohhnrg
 hsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:Sbp1XUYaUYf6E5avtDY0AMZtFA03oc2lsA60FM-h4k68N9KdAm6KrQ>
 <xmx:Sbp1XSgWzzrVXNIOXQEjuQ3M-1M1uGrbGFWt4ShQwkrDaconeQ_XFQ>
 <xmx:Sbp1XcbwNFmoL0ju6MPH-2g6JTZFeKmuvDG5hTDFm90TkMr854nYuA>
 <xmx:Srp1XaQ2-BmpDS_VO3t71msio_Pu-H2pRviGpJvaHfURP7FRTlucig>
Received: from arrakis (unknown [75.172.198.99])
 by mail.messagingengine.com (Postfix) with ESMTPA id C7600D60057;
 Sun,  8 Sep 2019 22:34:48 -0400 (EDT)
Message-ID: <748dab2550c58564298d14b8e2f6063b99d10d08.camel@mendozajonas.com>
Subject: Re: [U-Boot] [PATCH v2 4/4] net: NC-SI setup and handling
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: joe.hershberger@ni.com
Date: Sun, 08 Sep 2019 19:34:47 -0700
In-Reply-To: <CANr=Z=YA64UbrDQV9SonmpFQwxEbEgVSDOPiE5++v1g8mCtBTQ@mail.gmail.com>
References: <20190618013720.2823-1-sam@mendozajonas.com>
 <20190618013720.2823-5-sam@mendozajonas.com>
 <CANr=Z=YA64UbrDQV9SonmpFQwxEbEgVSDOPiE5++v1g8mCtBTQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 
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
Cc: u-boot <u-boot@lists.denx.de>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Joseph Hershberger <joseph.hershberger@ni.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2019-07-09 at 23:33 +0000, Joe Hershberger wrote:
> On Mon, Jun 17, 2019 at 8:43 PM Samuel Mendoza-Jonas
> <sam@mendozajonas.com> wrote:
> > Add the handling of NC-SI ethernet frames, and add a check at the
> > start
> > of net_loop() to configure NC-SI before starting other network
> > commands.
> > This also adds an "ncsi" command to manually start NC-SI
> > configuration.
> > 
> > Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> > ---
> > v2: Update ncsi command help text
> > 
> >  cmd/Kconfig   |  8 ++++++++
> >  cmd/net.c     | 18 ++++++++++++++++++
> >  include/net.h |  2 +-
> >  net/net.c     | 27 ++++++++++++++++++++++++++-
> >  4 files changed, 53 insertions(+), 2 deletions(-)
> > 
> > diff --git a/cmd/Kconfig b/cmd/Kconfig
> > index 0badcb3fe0..9851b04972 100644
> > --- a/cmd/Kconfig
> > +++ b/cmd/Kconfig
> > @@ -1332,6 +1332,14 @@ config CMD_LINK_LOCAL
> >         help
> >           Acquire a network IP address using the link-local
> > protocol
> > 
> > +config CMD_NCSI
> > +       bool "ncsi"
> > +       depends on PHY_NCSI
> > +       help
> > +         Manually configure the attached NIC via NC-SI.
> > +         Normally this happens automatically before other network
> > +         operations.
> > +
> >  endif
> > 
> >  config CMD_ETHSW
> > diff --git a/cmd/net.c b/cmd/net.c
> > index 89721b8f8b..7d2c21ba4d 100644
> > --- a/cmd/net.c
> > +++ b/cmd/net.c
> > @@ -457,3 +457,21 @@ U_BOOT_CMD(
> >  );
> > 
> >  #endif  /* CONFIG_CMD_LINK_LOCAL */
> > +
> > +#if defined(CONFIG_CMD_NCSI)
> > +static int do_ncsi(cmd_tbl_t *cmdtp, int flag, int argc,
> > +                  char * const argv[])
> > +{
> > +       if (net_loop(NCSI) < 0)
> > +               return CMD_RET_FAILURE;
> > +
> > +       return CMD_RET_SUCCESS;
> > +}
> > +
> > +U_BOOT_CMD(
> > +       ncsi,   1,      1,      do_ncsi,
> > +       "Configure attached NIC via NC-SI",
> > +       ""
> > +);
> > +
> > +#endif  /* CONFIG_CMD_NCSI */
> > diff --git a/include/net.h b/include/net.h
> > index 20c448ee60..9189f0fb53 100644
> > --- a/include/net.h
> > +++ b/include/net.h
> > @@ -531,7 +531,7 @@ extern int          net_restart_wrap;       /*
> > Tried all network devices */
> > 
> >  enum proto_t {
> >         BOOTP, RARP, ARP, TFTPGET, DHCP, PING, DNS, NFS, CDP,
> > NETCONS, SNTP,
> > -       TFTPSRV, TFTPPUT, LINKLOCAL, FASTBOOT, WOL
> > +       TFTPSRV, TFTPPUT, LINKLOCAL, FASTBOOT, WOL, NCSI
> >  };
> > 
> >  extern char    net_boot_file_name[1024];/* Boot File name */
> > diff --git a/net/net.c b/net/net.c
> > index 58b0417cbe..a59169a032 100644
> > --- a/net/net.c
> > +++ b/net/net.c
> > @@ -95,6 +95,7 @@
> >  #include <net.h>
> >  #include <net/fastboot.h>
> >  #include <net/tftp.h>
> > +#include <net/ncsi.h>
> >  #if defined(CONFIG_LED_STATUS)
> >  #include <miiphy.h>
> >  #include <status_led.h>
> > @@ -407,6 +408,16 @@ int net_loop(enum proto_t protocol)
> >         net_try_count = 1;
> >         debug_cond(DEBUG_INT_STATE, "--- net_loop Entry\n");
> > 
> > +#ifdef CONFIG_PHY_NCSI
> > +       if (protocol != NCSI && !ncsi_active()) {
> > +               printf("%s: configuring NCSI first\n", __func__);
> 
> NC-SI
> 
> > +               if (net_loop(NCSI) < 0)
> > +                       return ret;
> > +               eth_init_state_only();
> > +               goto restart;
> > +       }
> > +#endif
> > +
> >         bootstage_mark_name(BOOTSTAGE_ID_ETH_START, "eth_start");
> >         net_init();
> >         if (eth_is_on_demand_init() || protocol != NETCONS) {
> > @@ -420,6 +431,7 @@ int net_loop(enum proto_t protocol)
> >         } else {
> >                 eth_init_state_only();
> >         }
> > +
> >  restart:
> >  #ifdef CONFIG_USB_KEYBOARD
> >         net_busy_flag = 0;
> > @@ -526,6 +538,11 @@ restart:
> >                 case WOL:
> >                         wol_start();
> >                         break;
> > +#endif
> > +#if defined(CONFIG_CMD_NCSI)
> > +               case NCSI:
> > +                       ncsi_probe_packages();
> > +                       break;
> >  #endif
> >                 default:
> >                         break;
> > @@ -637,7 +654,7 @@ restart:
> >                                 env_set_hex("filesize",
> > net_boot_file_size);
> >                                 env_set_hex("fileaddr", load_addr);
> >                         }
> > -                       if (protocol != NETCONS)
> > +                       if (protocol != NETCONS && protocol !=
> > NCSI)
> 
> Why is this using eth_halt_state_only()? It is not using the
> eth_init_state_only().

The aim here was to avoid completely halting the network state because
we're about to start the net_loop again with whatever protocol caused
NC-SI to need to be configured. I'm new to this part of u-boot however
so it's possible I've misinterpeted the actions here; the NC-SI model
is an odd fit for the network loop.

> 
> >                                 eth_halt();
> >                         else
> >                                 eth_halt_state_only();
> > @@ -1318,6 +1335,11 @@ void net_process_received_packet(uchar
> > *in_packet, int len)
> >         case PROT_WOL:
> >                 wol_receive(ip, len);
> >                 break;
> > +#endif
> > +#ifdef CONFIG_PHY_NCSI
> > +       case PROT_NCSI:
> > +               ncsi_receive(et, ip, len);
> > +               break;
> >  #endif
> >         }
> >  }
> > @@ -1379,6 +1401,9 @@ common:
> > 
> >  #ifdef CONFIG_CMD_RARP
> >         case RARP:
> > +#endif
> > +#ifdef CONFIG_CMD_NCSI
> > +       case NCSI:
> >  #endif
> >         case BOOTP:
> >         case CDP:
> > --
> > 2.21.0
> > 
> > _______________________________________________
> > U-Boot mailing list
> > U-Boot@lists.denx.de
> > https://lists.denx.de/listinfo/u-boot

