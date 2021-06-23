Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D05513B1121
	for <lists+openbmc@lfdr.de>; Wed, 23 Jun 2021 02:48:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8l4Z4WbZz300T
	for <lists+openbmc@lfdr.de>; Wed, 23 Jun 2021 10:48:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=Sc0DpxZH;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=pgSHElPG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=Sc0DpxZH; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=pgSHElPG; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8l4D4VLWz2yXW
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jun 2021 10:48:12 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id DC751C8B
 for <openbmc@lists.ozlabs.org>; Tue, 22 Jun 2021 20:48:07 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Tue, 22 Jun 2021 20:48:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=12BQHi5MYArgWxSTkiMy6/LcTO7NYSJ
 m2ZiAPH72em8=; b=Sc0DpxZHJ9ZgoMiCagjc8T6FRQltt0OaO0jGETPnpQ6Qk4U
 38EzBuV568LIXVYnbYOCPXKJaUoI/sSs2qGtm1yq2+2U2RdKx+ojYg02zj8rgcg/
 WgtQx6zFU4lbf9q74tjWR2fUMB3tV2+rn0dSHBK+snqFcdUBKtvsrWsVcK4EP/DM
 k/rUAcWs+19y9dqlMExEUVppBQq0wDXPDI6TKZIq767a1FHKBaHk6Rc3xkVF4tEi
 J05ADo6l2h8/bEWiotHYFd2Rm2JirYz9qLpdg7dbiiKzUZPO5I2SDqbj+JUEZsZK
 9eb3cO3EA3bDarVv2I8ew6dlbXMOexan8TBxvOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=12BQHi
 5MYArgWxSTkiMy6/LcTO7NYSJm2ZiAPH72em8=; b=pgSHElPGMezDGe/NW2vmxi
 fvBW3shEcw87nWBQyTSicdczt5rN5KGVYqCoeGCifAfnf4WsZIpWPmUwmxGOFVi0
 7s9bq70ZBPrr0qKh0ymlAc2nXhsJ+Pd6Iz+lDqrSYsppfw9BLHsu4QmoMIf/LrUj
 hEeGDrNpbKMO4gCIvafnr2UWEjRlLMhNjyhrYxrJnSSenSbKgqNvK3ouhlMMyelp
 jJKhv1a6+rz73rCbF/5km5YhBrKvYWO+DWRV0NW7CbAwWX1pfAoPRNCN3hu/m1Jj
 iSsShgHLisY+Bgc+ZEWuqqEXDUSSBIcYrW2wk7Ven2SMIASFY1EtlQ3qksUPWrRQ
 ==
X-ME-Sender: <xms:xoTSYLXKa0e4oA4PoVsYVB8Nzi6hui9idZR2WylH-ojW4N8gXHaKqg>
 <xme:xoTSYDkJ1l1TJ88vafVR0qFMYQWdROGb9OKrOX6mI0jIL0EQyTM-IMf7-NthKtdOv
 ENVLFme-19cGvqvZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeegvddgfeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
 ertderreejnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgv
 fiesrghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpedutddtkeeugeegvddttdeuke
 eiuddtgfeuuddtfeeiueetfeeileettedvtdfhieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:xoTSYHZ7VyaF8OyBWos1n-hN1xNPbUlUeZxVRakCDVDCrHySvMMkiQ>
 <xmx:xoTSYGUB11UW1ffVP08bsjmgW9KjHKDCSJME0l2EP7I8u4mxzb3cRw>
 <xmx:xoTSYFkaLNMwbMuaD9oCkd6LtRAqGrwpKKwhkrij1rxDty2SyFlEeQ>
 <xmx:x4TSYBz3RGs2nKcBJNinPVUlLPLQ2EOLofjNtBdQ0RoDJr2nMikQkg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E6ED8AC0073; Tue, 22 Jun 2021 20:48:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-530-gd0c265785f-fm-20210616.002-gd0c26578
Mime-Version: 1.0
Message-Id: <23fff90a-e291-4874-bb8e-685b69ec5c3f@www.fastmail.com>
In-Reply-To: <20210618035858.4024689-3-andrew@aj.id.au>
References: <20210618035858.4024689-1-andrew@aj.id.au>
 <20210618035858.4024689-3-andrew@aj.id.au>
Date: Wed, 23 Jun 2021 10:17:46 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.10_2/7]_ipmi:_kcs=5Fbmc:_Add_a_"raw"_ch?=
 =?UTF-8?Q?aracter_device_interface?=
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 18 Jun 2021, at 13:28, Andrew Jeffery wrote:
> +static int kcs_bmc_raw_add_device(struct kcs_bmc_device *kcs_bmc)
> +{
> +	struct kcs_bmc_raw *priv;
> +	int rc;
> +
> +	priv = devm_kzalloc(kcs_bmc->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->client.dev = kcs_bmc;
> +	priv->client.ops = &kcs_bmc_raw_client_ops;
> +
> +	init_waitqueue_head(&priv->queue);
> +	priv->writable = false;
> +	priv->readable = false;
> +
> +	priv->miscdev.minor = MISC_DYNAMIC_MINOR;
> +	priv->miscdev.name = devm_kasprintf(kcs_bmc->dev, GFP_KERNEL, "%s%u", 
> DEVICE_NAME,
> +					   kcs_bmc->channel);
> +	if (!priv->miscdev.name)
> +		return -EINVAL;
> +
> +	priv->miscdev.fops = &kcs_bmc_raw_fops;
> +
> +	/* Initialise our expected events. Listen for IBF but ignore OBE 
> until necessary */
> +	kcs_bmc_raw_update_event_mask(priv, (KCS_BMC_EVENT_TYPE_IBF | 
> KCS_BMC_EVENT_TYPE_OBE),
> +				      KCS_BMC_EVENT_TYPE_IBF);

Ah, this is now wrong wrt to some other rework that went on, we should be disabling IBF and OBE until the chardev is opened.

With the code as it is we can get a "nobody cared" WARN().

I'll send a v2.

Andrew
