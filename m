Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BFC306843
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 00:48:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR0fk2kdkzDqJc
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 10:48:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=YVW55MrY; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=iSr4jPDk; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR0dv2hzVzDqD1
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 10:47:47 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id B5F435C0223;
 Wed, 27 Jan 2021 18:47:44 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 27 Jan 2021 18:47:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=NAkVlpgzkGrtM2V/GpO1u/ZC1iem/EF
 VKJgdDcOaX1w=; b=YVW55MrYc/O2mDlJoSrYD5+X//UVh8xoLtfzcsZA6XO8KUX
 D/eQnlVaieh3dc9MoFdQM6lt+gezK/lgsscDXV+KcMvY0gKoy2NGXS7LurasWiH1
 OzWn1Lv4MPH+weAY6IVpjTWqB15sdpeAHeigcCsJIb8sgFpFCwuiejt0p+91Fo6n
 Qb/dSkhP8Aj9+WO6euouOczy21NeZrZmREwfQzvpg+lnf5ZedgUm1b6ENsK8oW6S
 tg+Lw6F8Dord8+JBhxbhtPTOEW5oz9Gw9GKQfM4wan2N2ePtxrNvxOGV/AAR2Dus
 thCFsXMUXMyXoMJV/cK5vk2CFnoCmuDuUUKQq0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=NAkVlp
 gzkGrtM2V/GpO1u/ZC1iem/EFVKJgdDcOaX1w=; b=iSr4jPDkkfwDj7u7z2NV3C
 e+h4pfEKAm6FZmKpgqxCqIm+I66FKciz341J1qtU1hqN9acHyNXQdOLoH0Ho3M4n
 9C/xsq8ERyluKoDXTjQ+cDGi0pvGhtDy5zm2t2IAj8cF+y5xOhGqZkjuwG9pAhWX
 BqcbF/k6NytoEaS5iR8coZUE5tJjaFnsj5BKbmyikBIL87NGCpjXJoQNP+Hmg1xi
 HT2Xg0TwTidqbgEXt6KqHbZ2k1/hHhT1w+HsgwS1+XUgJ17eCIHX8MoXiZJxUaXD
 mjavT5pI/KcFDS77iDNLMJtld4np97DNoh2bIz0KNCb+LSQKLnspPoXnONgwg1Tg
 ==
X-ME-Sender: <xms:n_sRYAyU_dAcyhA4pEQJ5t1JUd6SqOImHsPi2Sl-CrJRiTPOE2EU4g>
 <xme:n_sRYETtAPq-KOHTImv13IQJAHq4Ygp8C0k4Jiis1_6M9eIN81r8smpaOMhOPv_OG
 I17zml-CuuTHU-6dw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelgddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpedutddtkeeugeegvddttdeukeeiuddtgfeuuddtfeeiueetfeeileettedv
 tdfhieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:n_sRYCV2oPEfbtWGtOQ4ONcJ41B_KqQ4_GuwBIAbgakK-iiIPngIPw>
 <xmx:n_sRYOj3dlAdKowfnC2Dci2aT2_GId5YEfRovhveLvVPQ1aNg8HPcw>
 <xmx:n_sRYCDChRvpXAAPS_nQvP3_rlpJUVO0k4B0XW1DGHm9KPvJ5UuBSQ>
 <xmx:oPsRYD4YLktNExJtleBcdJ3yoN5xjMnV_2LgQenIvABZcpxJ-w9cVw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D176CA0005D; Wed, 27 Jan 2021 18:47:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-84-gfc141fe8b8-fm-20210125.001-gfc141fe8
Mime-Version: 1.0
Message-Id: <4397daff-44c1-4cba-bf15-93e91d2bad3a@www.fastmail.com>
In-Reply-To: <ef379e54-f039-07f6-fef9-d0ee83009cd3@linux.vnet.ibm.com>
References: <20210127070054.81719-1-joel@jms.id.au>
 <20210127070054.81719-5-joel@jms.id.au>
 <ef379e54-f039-07f6-fef9-d0ee83009cd3@linux.vnet.ibm.com>
Date: Thu, 28 Jan 2021 10:17:23 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Klaus Heinrich Kiwi" <klaus@linux.vnet.ibm.com>,
 "Joel Stanley" <joel@jms.id.au>, "Ryan Chen" <ryan_chen@aspeedtech.com>,
 openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_u-boot_v2019.04-aspeed-openbmc_v2_4/6]_config:_ast2?=
 =?UTF-8?Q?600:_Disable_unused_features?=
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



On Thu, 28 Jan 2021, at 05:59, Klaus Heinrich Kiwi wrote:
> Hi Joel,
> 
> > +# CONFIG_SPL_DOS_PARTITION is not set
> Sounds good.
> 
> 
> > +# CONFIG_MMC_VERBOSE is not set
> >   CONFIG_SPL_MMC_TINY=y
> >   CONFIG_MMC_SDHCI=y
> >   CONFIG_MMC_SDHCI_ASPEED=y
> > @@ -128,6 +130,7 @@ CONFIG_DM_SPI=y
> >   CONFIG_SYSRESET=y
> >   CONFIG_WDT=y
> >   CONFIG_USE_TINY_PRINTF=y
> > +# CONFIG_REGEX is not set
> Are those influencing the SPL size or just U-boot proper?

The SPL needs MMC support to load u-boot, so I assume CONFIG_MMC_VERBOSE=n is 
worthwhile.

Acked-by: Andrew Jeffery <andrew@aj.id.au>
