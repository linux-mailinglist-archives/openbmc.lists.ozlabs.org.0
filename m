Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1994549C64
	for <lists+openbmc@lfdr.de>; Tue, 18 Jun 2019 10:52:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Shfm2RqZzDqWR
	for <lists+openbmc@lfdr.de>; Tue, 18 Jun 2019 18:52:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=178.33.251.80; helo=2.mo69.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 598 seconds by postgrey-1.36 at bilbo;
 Tue, 18 Jun 2019 18:52:03 AEST
Received: from 2.mo69.mail-out.ovh.net (2.mo69.mail-out.ovh.net
 [178.33.251.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ShfC0kCxzDqM9
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jun 2019 18:52:00 +1000 (AEST)
Received: from player729.ha.ovh.net (unknown [10.108.54.59])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 2A3D05E86C
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jun 2019 10:35:29 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player729.ha.ovh.net (Postfix) with ESMTPSA id ECDC771B67ED;
 Tue, 18 Jun 2019 08:35:23 +0000 (UTC)
Subject: Re: [PATCH v2 0/4] NC-SI PHY Support
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>, u-boot@lists.denx.de
References: <20190618013720.2823-1-sam@mendozajonas.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2dda04ee-d0d4-be7b-b29d-bcde5c21656a@kaod.org>
Date: Tue, 18 Jun 2019 10:35:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190618013720.2823-1-sam@mendozajonas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 11696129709599329086
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudeiledgtdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenuc
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
Cc: joe.hershberger@ni.com, openbmc@lists.ozlabs.org, sjg@chromium.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 18/06/2019 03:37, Samuel Mendoza-Jonas wrote:
> This series introduces support for the NC-SI protocol to u-boot,
> functionality which so far has only been available in vendor trees.

Would it be complex to add a romulus DT and config file ? 

Thanks,

C. 

> 
> NC-SI (Network Controller Sideband Interface) is a protocol to manage a
> sideband connection to a proper network interface, for example a BMC
> (Baseboard Management Controller) sharing the NIC of the host system.
> Probing and configuration occurs by communicating with the "remote" NIC
> via NC-SI control frames (Ethernet header 0x88f8).
> 
> Since the RFC[0] the changes have been split out into a few different
> patches to make the overall changes more obvious. Additionally a few
> small improvements have been added including adding a check to see if
> NC-SI is already configured, and marking the PHY bus "reset" as invalid
> since it does not define a bus.
> 
> An example of NC-SI setup before a normal network command:
> 
> => dhcp
> net_loop: configuring NCSI first
> ethernet@1e660000: link up, 100 Mbps full-duplex mac:0c:c4:7a:d5:48:43
> NCSI: probing channels
> NCSI: configuring channel 0
> NCSI: configuration done!
> BOOTP broadcast 1
> BOOTP broadcast 2
> DHCP client bound to address 10.61.161.188 (255 ms)
> 
> [0]: https://patchwork.ozlabs.org/patch/1107087/
> 
> Changes in v2:
> - Fix endianess issue when setting MAC address
> - Make checksum offsets easier to read
> - Instantiate per-phy ncsi_priv structures
> - Update ncsi command help text
> - Used update ncsi-pkt.h version to include SPDX header
> 
> 
> Samuel Mendoza-Jonas (4):
>   phy: Add support for the NC-SI protocol
>   phy: Include NC-SI in phy setup
>   net/ftgmac100: Add NC-SI mode support
>   net: NC-SI setup and handling
> 
>  cmd/Kconfig              |   8 +
>  cmd/net.c                |  18 +
>  drivers/net/ftgmac100.c  |  39 +-
>  drivers/net/phy/Kconfig  |   4 +
>  drivers/net/phy/Makefile |   1 +
>  drivers/net/phy/ncsi.c   | 896 +++++++++++++++++++++++++++++++++++++++
>  drivers/net/phy/phy.c    |   7 +
>  include/net.h            |   3 +-
>  include/net/ncsi-pkt.h   | 442 +++++++++++++++++++
>  include/net/ncsi.h       |  14 +
>  include/phy.h            |  12 +
>  include/phy_interface.h  |   2 +
>  net/net.c                |  27 +-
>  13 files changed, 1461 insertions(+), 12 deletions(-)
>  create mode 100644 drivers/net/phy/ncsi.c
>  create mode 100644 include/net/ncsi-pkt.h
>  create mode 100644 include/net/ncsi.h
> 

