Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B61E569BEF2
	for <lists+openbmc@lfdr.de>; Sun, 19 Feb 2023 08:44:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKHcv3rZjz307T
	for <lists+openbmc@lfdr.de>; Sun, 19 Feb 2023 18:44:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hQUBJr58;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hQUBJr58;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFdSm3Gkhz3bTM;
	Mon, 13 Feb 2023 19:54:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676278488; x=1707814488;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=3Qrvb86xqpAxI2HTmIA1ize0Wpi8KHhQvVKxmBu4qVo=;
  b=hQUBJr58+qpxACT2lrRFhzyXILkYzJ8yERvlS6m5c78QK5fEWV7nVj7b
   Zw+tvLx8Rz/zoqpXR9Mo2QEYpBKjr7zftb2nPEmFYvusRKcQm0gk8d6e4
   Iv7u34ifD+e11ALp9P4MMPMWpbrPR1hnjEtqW8/7gya88Ij+u8/52e6Q2
   hLSpH4pOQfAR/8rOYhUaqVRFT2te97P7/4OAf5yILNvQsy6tR3jVlX2MM
   COTrAtONllHgQdZeSrOqmwRI71UVfvFlE/tDnSmg20kK7k7P8j0D1faES
   M9yJFG+ZTl4898joHT5eQngBHWa5J5aKNofQusQxocC9vpO1TFOqgHgI+
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="332152148"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="332152148"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 00:54:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="618579861"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="618579861"
Received: from hdevries-mobl.ger.corp.intel.com ([10.249.36.140])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 00:54:39 -0800
Date: Mon, 13 Feb 2023 10:54:36 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: ChiaWei Wang <chiawei_wang@aspeedtech.com>
Subject: RE: [PATCH 3/4] serial: 8250: Add Aspeed UART driver
In-Reply-To: <KL1PR0601MB378160E42842A0A55947BF7191DD9@KL1PR0601MB3781.apcprd06.prod.outlook.com>
Message-ID: <bc8a6d9c-48ec-e394-78d8-c53bc267af1c@linux.intel.com>
References: <20230210072643.2772-1-chiawei_wang@aspeedtech.com> <20230210072643.2772-4-chiawei_wang@aspeedtech.com> <2d389fc9-0d5-42a1-b6d7-695c70dcf0fe@linux.intel.com> <KL1PR0601MB378160E42842A0A55947BF7191DD9@KL1PR0601MB3781.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-257282810-1676278189=:1712"
Content-ID: <7f777bc7-635e-5cdb-3621-16f888c6153c@linux.intel.com>
X-Mailman-Approved-At: Sun, 19 Feb 2023 18:41:14 +1100
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-serial <linux-serial@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "andrew@aj.id.au" <andrew@aj.id.au>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, LKML <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, Jiri Slaby <jirislaby@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-257282810-1676278189=:1712
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <655a3651-c08d-25b1-4a44-7f6d39894cb8@linux.intel.com>

On Mon, 13 Feb 2023, ChiaWei Wang wrote:

> > From: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > Sent: Friday, February 10, 2023 9:52 PM
> > 
> > On Fri, 10 Feb 2023, Chia-Wei Wang wrote:
> > 
> > > Add the driver for Aspeed UART/VUART devices, which are 16550A
> > > compatible. It is an wrapper to cover the generic 16550A operation
> > > while exetending DMA feature for the devices.
> > >
> > > Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> > > ---
> > >  drivers/tty/serial/8250/8250_aspeed.c | 502
> > ++++++++++++++++++++++++++
> > >  drivers/tty/serial/8250/Kconfig       |   8 +
> > >  drivers/tty/serial/8250/Makefile      |   1 +
> > 
> > Hi,
> > 
> > Before I look any further into this, could you please explain why this is made to
> > be entirely separate from what we have in
> >   drivers/tty/serial/8250/8250_aspeed_vuart.c
> > ?
> > 
> > I quickly went through some functions and they've significant parts in common
> > with no variations at all in many functions and you're defines are 1:1 too
> > (except for the DMA buf sizes). It would seem much better to add the missing
> > functionality into 8250_aspeed_vuart.c rather than creating something from
> > scratch with large overlap with existing code.
> > 
> > If you intend to keep it as a separate one, you should have a rather good
> > justification for it.
> 
> Yes, the main difference is the UART DMA support.
> However, due to the UDMA design is not quite fit to the DMAEngine, the implementation is kind of hacking.
> We thought leaving the original VUART driver unimpacted would be better.
> The UDMA covers both UART and VUART DMA support, and so do the new 8250_aspeed.c.

To me it seems rather weak reasoning.

If you want to go to this path, then you need to anyway share the common 
code between those two drivers rather than duplicating it. It's likely 
more work for you than just putting it all into the existing driver and
having just a mostly separated setup() for 2600 case.

The DMA functions should probably also depend on SERIAL_8250_DMA anyway 
and the driver should fallback to non-DMA if SERIAL_8250_DMA is not set 
which is yet another reason to use the existing code.

-- 
 i.
--8323329-257282810-1676278189=:1712--
