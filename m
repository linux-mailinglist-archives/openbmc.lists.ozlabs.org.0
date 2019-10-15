Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2F7D6C7A
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 02:33:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sbxZ67nxzDqk8
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 11:33:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="G2oQMv26"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ySEApinF"; dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sbtQ2CLWzDqvr
 for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2019 11:30:22 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id BFC4257C;
 Mon, 14 Oct 2019 20:30:19 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 14 Oct 2019 20:30:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=5YGRY2dczK+1kvhx5+m5DoUQXqRFUU0
 IZRn/oU3NVq0=; b=G2oQMv26KJ2xR7Td7vna5SLF1uf35bDGpOv/pY4/r0ZGfMp
 N9epic1JpqEPTaThmwXo8mHaLDp8MM1RTtkMqg3fb2Mz+AHfj5odZTwXKnCGWCfp
 p1D2DUTRPB58FUNzLWypMvHvpLKh1Y/3nsqCYKB1bzm4QmuHxix7n5dmgWP3+L1F
 Bux7zwUSAHdcPTi1j45XRAK1pF9yZ3Sseh3AkDrgHMOYju7tcyuFdFlwblRYAWEZ
 yqFKgCRGJM79zsQYhkxC8nTkfVLw0wa92vCKSNrI1J/I6DsUvNeygyhz6emnoG/3
 X/QIppqeSxXpJ657AsAO8dwh5ykIh91JeeHmiZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=5YGRY2
 dczK+1kvhx5+m5DoUQXqRFUU0IZRn/oU3NVq0=; b=ySEApinFEAPkMzj28df/27
 CCTkkPEQAIXr0bE6GQuFvS4gAb4HBuVHTNjl0/ov4aPfTt8Zb2BwfpsyczoFHGwo
 zH3FYn+KYPrNVhBB3C23syvgpP8/YRib7LYvSzooA9roGuS14t9JEKajlfPjxaTt
 4Hru59FDMtLOdEGlryciR2As2jYCs1xL+8RptleaRNDcencnRTnOcfPP06jvV2qK
 xWTd/l2lbxLEQ0hhYYrhd+M2JysQy08w2vQ00xLkhpogO7NOrNWhJmU1oybUoHKS
 DW4gWeGiGgn4Axx+uqE2Oo3RPq29dW8uxVKoOZIKfcf56F89LWOFUg1IuSC1yMtQ
 ==
X-ME-Sender: <xms:GxOlXSbo9vJ1Loy0PeUqF9i1MOQl8sw4fl6ytyi0FstKdpvKcoXjKg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjedvgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:GxOlXWLLMKWMBDRKBTj9IdkYFjVENMKJmK4pIofHhCyKD7ZBEuPamw>
 <xmx:GxOlXZHDCDb6qLr3X5NsYtIUcOM6DQmHZHXMLCamOKHxX09zgP-mpA>
 <xmx:GxOlXVsBJPcr5Hf9FhpkLsRTsnUrGDgojZfSHSEZjOR-z-jrGvcRog>
 <xmx:GxOlXUBaSwU6ns2XPLjVd9t3MZbV9OT3A9vJ5RQ1n_OSxg5nkHuToQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5196DE00A5; Mon, 14 Oct 2019 20:30:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-360-g7dda896-fmstable-20191004v2
Mime-Version: 1.0
Message-Id: <31c4a704-692e-4d1e-8806-cf0d726fd7e9@www.fastmail.com>
In-Reply-To: <0d04e87c-d6df-4eab-aaf9-f952bffc0ec7@www.fastmail.com>
References: <20191014074618.15506-1-joel@jms.id.au>
 <20191014074618.15506-2-joel@jms.id.au>
 <0d04e87c-d6df-4eab-aaf9-f952bffc0ec7@www.fastmail.com>
Date: Tue, 15 Oct 2019 11:01:16 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux dev-5.3 1/2] fsi: aspeed: Configure optional GPIOs
Content-Type: text/plain
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
Cc: Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 15 Oct 2019, at 10:57, Andrew Jeffery wrote:
> 
> 
> On Mon, 14 Oct 2019, at 18:16, Joel Stanley wrote:
> > On Tacoma the enable and mux GPIOs allow the BMC to enable FSI and
> > control if the clock and data should come from the BMC, or from the
> > debug connector.
> > 
> > Configure these as optional GPIOs which will fail without error for
> > systems that do not have these GPIOs in their device tree.
> > 
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >  drivers/fsi/fsi-master-aspeed.c | 30 ++++++++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> > 
> > diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
> > index 6496d2972944..2048e38e7200 100644
> > --- a/drivers/fsi/fsi-master-aspeed.c
> > +++ b/drivers/fsi/fsi-master-aspeed.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/regmap.h>
> >  #include <linux/slab.h>
> >  #include <linux/iopoll.h>
> > +#include <linux/gpio/consumer.h>
> >  
> >  #include "fsi-master.h"
> >  
> > @@ -85,6 +86,9 @@ struct fsi_master_aspeed {
> >  	void __iomem		*base;
> >  	struct clk		*clk;
> >  
> > +	struct gpio_desc	*gpio_enable;
> > +	struct gpio_desc	*gpio_mux;
> > +
> >  	struct dentry		*debugfs_dir;
> >  	struct fsi_master_aspeed_debugfs_entry debugfs[FSI_NUM_DEBUGFS_ENTRIES];
> >  };
> > @@ -471,6 +475,30 @@ DEFINE_DEBUGFS_ATTRIBUTE(fsi_master_aspeed_debugfs_ops,
> >  			 fsi_master_aspeed_debugfs_get,
> >  			 fsi_master_aspeed_debugfs_set, "0x%08llx\n");
> >  
> > +static int aspeed_master_gpio_init(struct fsi_master_aspeed *master)
> > +{
> > +	struct device *dev = master->dev;
> > +	struct gpio_desc *gpio;
> > +
> > +	gpio = devm_gpiod_get_optional(dev, "fsi-enable", 0);
> > +	if (IS_ERR(gpio)) {
> 
> devm_gpiod_get_option() returns NULL if the GPIO isn't defined, and
> interfaces like gpiod_direction_output(...) return 0 if the descriptor is
> NULL. The design point of the _optional() interfaces is that it makes the
> error handling unnecessary because we know the GPIO might be absent.
> 
> The pattern is also wrong in fsi-master-ast-cf and probably fsi-master-gpio.

Actually, disregard that, NULL is only returned for -ENOENT but there may
be other errors. Sorry for the noise.
