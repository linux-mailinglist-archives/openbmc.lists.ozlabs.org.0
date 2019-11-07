Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2C1F2ECA
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2019 14:04:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4783WX2MNlzF5Vj
	for <lists+openbmc@lfdr.de>; Fri,  8 Nov 2019 00:04:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=p.zabel@pengutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=pengutronix.de
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4783Qc5b5qzF52P
 for <openbmc@lists.ozlabs.org>; Thu,  7 Nov 2019 23:59:50 +1100 (AEDT)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1iShNt-0008Ok-BL; Thu, 07 Nov 2019 13:59:33 +0100
Message-ID: <1bacac547977493e50bb1fadfaf4b9ad5b4fdf0c.camel@pengutronix.de>
Subject: Re: [PATCH v5 0/3] reset: npcm: add NPCM reset driver support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Tomer Maimon <tmaimon77@gmail.com>, robh+dt@kernel.org, 
 mark.rutland@arm.com, yuenn@google.com, venture@google.com, 
 benjaminfair@google.com, avifishman70@gmail.com, joel@jms.id.au
Date: Thu, 07 Nov 2019 13:59:32 +0100
In-Reply-To: <20191106145331.25740-1-tmaimon77@gmail.com>
References: <20191106145331.25740-1-tmaimon77@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: openbmc@lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tomer,

On Wed, 2019-11-06 at 16:53 +0200, Tomer Maimon wrote:
> This patch set adds reset controller support 
> for the Nuvoton NPCM Baseboard Management Controller (BMC).
> 
> Apart of controlling all NPCM BMC reset module lines the NPCM reset driver
> support NPCM BMC software reset to restarting the NPCM BMC.
> 
> Supporting NPCM USB-PHY reset as follow:
> 
> NPCM BMC USB-PHY connected to two modules USB device (UDC) and USB host.
> 
> If we will restart the USB-PHY at the UDC probe and later the 
> USB host probe will restart USB-PHY again it will disable the UDC
> and vice versa.
> 
> The solution is to reset the USB-PHY at the reset probe stage before 
> the UDC and the USB host are initializing.
> 
> NPCM reset driver tested on NPCM750 evaluation board.
> 
> Addressed comments from:.
>  - Philipp Zabel
> 
> Changes since version 4:
>  - Check for stored GCR string in the of_device_id->data to gain
>    GCR regmap access. 
>  - Adding check if the user used undefined reset pins
>    in the of_xlate function.
>  - Remove nr_resets initialization since it of_xlate replaced 
>    with the custom version.

Thanks, all three applied to reset/next with Rob's R-b.

regards
Philipp

