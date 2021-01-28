Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE4A3072D1
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 10:36:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRFhd5FcQzDr83
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 20:36:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=eibzpRus; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Kub5A/wP; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRFXN3yxnzDrgN
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 20:28:52 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 2C9C15C0235;
 Thu, 28 Jan 2021 04:28:47 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 28 Jan 2021 04:28:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=3AjmN8nQsg5407uLjsB+p3CoRno1+O0
 90UD9BZy+abY=; b=eibzpRus63fVj4HFxn+D8GMq8DJCEx4KbujyhLvn5Jzp1dS
 jl0PGqHg/ZMPi/FZTMi2vHFXqFudcsaEV5hyh/HftYME51p81X6j8u+VTjVZJPdf
 KXjTuSm2TDGcprgcdMwfUV8nbn9EDp9kAruIMdwQLqvZ1XO/KNG1RZf6v0A1bIRm
 14mep7f4QfwramuchZeUd3yMnrrmXLXgbNHo4SAYRVnZG/qvy+nuoWerfnKz0MNl
 y1dInTaPqc0WRD+UnMYShhUDvwBdX3CMsKhcBqjvuNT0aAPMW6PnzTRnFwnBfu/J
 nagTJ1zTWY5Nq8AgtN/ezmpa1LBNvGpgiAD8y+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=3AjmN8
 nQsg5407uLjsB+p3CoRno1+O090UD9BZy+abY=; b=Kub5A/wPkWT30slHnDt5WV
 0Wd2gQ23PDZSBHrhi8XZCKH2upPZohH/6Z3nFCaJ9SLcYSbb1daY8tkJMru3G68Y
 mjqBGtxYhG71uKomNqD6dxg9lU5d+qqwfPn9t9KErDGIgl3AlHIe5sCnFBvRrwmO
 EkGc0LN3XVBsBLD9QEp8FUELSE7cBswBIpmTOguHwWTc+SzKUaWQDpPLUhK5vGHq
 +1yRJjC0Yqa6OSybQ7DDVKqbv2muE0ZmpMCCjRzP2TyMx9QuMNxo4xBDz1oiAOtm
 962EtTCzK/CzdlYtHaAFjy/Lf+Lp2rkFJJdz13QbiEt2cueUC2w0xmK/BDZNvQ+w
 ==
X-ME-Sender: <xms:zYMSYI20B6A5acwldf62KlHbRS1IrYicXgHGTkbaQ3hV7KytYoXCZA>
 <xme:zYMSYDGqcA_WxFMRGTKckgobj0RrxsKJOrHKXrJ4H61ZkCh7IOIsHbLzhiGKr7NhC
 F1kmnaOQx3WOkBB7g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtgddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpedutddtkeeugeegvddttdeukeeiuddtgfeuuddtfeeiueetfeeileettedv
 tdfhieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:zYMSYA7VbCZDDiXOp6Dwbf89KnOVuk7vH2cob7pQlJm5ZeiLSYN-Bw>
 <xmx:zYMSYB23jPWAwMO5niBugvat6JUMD5DBXuqJff1xHzN5nDyF7wE1ag>
 <xmx:zYMSYLHJbSomCq5B-uB3CzD9vM5pxLrjB8NJmEXEFgP8_x94IzgQdA>
 <xmx:z4MSYBOpZqKXMN4Hn1jDG_hJ6eKg-YsT1gvtVkUQhmHrySDnxE7S0w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7130FA0005D; Thu, 28 Jan 2021 04:28:45 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-84-gfc141fe8b8-fm-20210125.001-gfc141fe8
Mime-Version: 1.0
Message-Id: <6ad8834f-a99b-49f9-a517-21e4c2207dae@beta.fastmail.com>
In-Reply-To: <20210128092540.343138-1-joel@jms.id.au>
References: <20210128092540.343138-1-joel@jms.id.au>
Date: Thu, 28 Jan 2021 19:58:22 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>,
 "Klaus Heinrich Kiwi" <klaus@linux.vnet.ibm.com>,
 "Ryan Chen" <ryan_chen@aspeedtech.com>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_u-boot_v2019.04-aspeed-openbmc]_ast2600:_spl:_Inclu?=
 =?UTF-8?Q?de_RAM_loader_in_BL2_ifdef?=
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



On Thu, 28 Jan 2021, at 19:55, Joel Stanley wrote:
> With this patch all of the BL2 verification call sites are behind the
> Kconfig symbol. When it is disabled, 1903 bytes is saved.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
