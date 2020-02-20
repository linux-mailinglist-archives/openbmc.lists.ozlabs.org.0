Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB61165389
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2020 01:26:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NFkf3173zDqS8
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2020 11:26:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=p9J2m3z/; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=ytqVAfav; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NFjb4s8PzDqPy;
 Thu, 20 Feb 2020 11:25:22 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id C38167403;
 Wed, 19 Feb 2020 19:25:19 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 19 Feb 2020 19:25:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=ETRepjY32Q6DdRrxXYMas4ZgO/c7BVj
 rXiFe89IwJKw=; b=p9J2m3z/kladxjeMWX8wh1ouyA0ceWph0+WnH+NhjtnfEeI
 NcfLYlB+3Gd5scBDnF4pNkG70Hvk0Aq2Xbsja9lSdgclRNH3Q1IXE3zQ/HAPn13E
 Jtdbv9q8Eyd6sduZ5Nikr1Qj4rFhaICRq2IXfKwMvnRHUSRENaBY7H4YHQMrXO3p
 WSgUiYAGK0UY4FUPvtH5TtyHEtlBTfhWGlHg5bEQTKiBqlkQl78Qbs12iS4skVZ4
 f4iHJJI4HyiDOV8Vp77CUlQq+bCW82O9sCuAbQMpAQXavLDvIcRuAB8MFXc+OmHk
 XqTBeysh98nLodGdr9X3f05Y5CGU7rvmBQH4Lcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ETRepj
 Y32Q6DdRrxXYMas4ZgO/c7BVjrXiFe89IwJKw=; b=ytqVAfavlMnvH1MsgcwdhE
 t0Snl9wKxDCotuyyHSgv6cn6qyA8z7q8M5NgMyfJU+C8N3GNfAAfFN+971V3hgfD
 MGJ0yghLia39Zn9JiHU2fFlowACvcKcTDhRqYEe7D57y44SKpDgIUhN1bTa99tMO
 58UM8EPpyyEje+4dLzBdUucDfr8pxFRy5kvwnP0DKVoCsGRZBbgvdIVfoue0YO0C
 /xU8uUma99ch+E2P20pf9HYSwOkWkJPX0mXKrHuu0a/CLXoeaqX/rSjWDEd8tYXg
 FdXXJtOfPrZ0VaUV16bmnJwd2u9wfjC7fupRHd7pXPXyvlrBo8G6CbRg+Oxj0msQ
 ==
X-ME-Sender: <xms:7dFNXvGKlglqhK7rOkbCc3Qxdwndl-SFwTFYOFU2x3w6aBkRtUaZtQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkedugddvfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:7dFNXoicFFnJWcyHIGoMYTJmX6Ycak3ABe0OYetg8OOixGZtbgakVg>
 <xmx:7dFNXkCMZyrTWAx8td5AD_q6nrgrlKDtqdkKBNAdMCTo51SV3DUnpg>
 <xmx:7dFNXrs5HL2rX_aOsn3wsELb9FJyYFbrE3HFPUhQNxkr1yl_4frShQ>
 <xmx:79FNXuMwKCHMcz5a5RN-_EenwnMdLv21wKCP8EQ5HlRq4NmtnVGOWA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E3BD2E00B2; Wed, 19 Feb 2020 19:25:16 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-802-g7a41c81-fmstable-20200203v1
Mime-Version: 1.0
Message-Id: <5d295199-d0d7-4d58-be29-4621738d7f28@www.fastmail.com>
In-Reply-To: <20200218031315.562-1-rentao.bupt@gmail.com>
References: <20200218031315.562-1-rentao.bupt@gmail.com>
Date: Thu, 20 Feb 2020 10:55:10 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Tao Ren" <rentao.bupt@gmail.com>, "Felipe Balbi" <balbi@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Joel Stanley" <joel@jms.id.au>,
 "Benjamin Herrenschmidt" <benh@kernel.crashing.org>,
 "Chunfeng Yun" <chunfeng.yun@mediatek.com>,
 "Colin King" <colin.king@canonical.com>,
 "Stephen Boyd" <swboyd@chromium.org>, "Rob Herring" <robh+dt@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, "Tao Ren" <taoren@fb.com>
Subject: Re: [PATCH v3 0/5] aspeed-g6: enable usb support
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



On Tue, 18 Feb 2020, at 13:43, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> The patch series aims at enabling USB Host and Gadget support on AST2600
> platforms.
> 
> Patch #1 replaces hardcoded vhub port/endpoint number with device tree
> properties, so that it's more convenient to add support for ast2600-vhub
> which provides more downstream ports and endpoints.

Ah, something I should have mentioned on the previous series is you'll need
to update the binding documentation with the new properties.

> 
> Patch #2 enables ast2600 support in aspeed-vhub usb gadget driver.

Also need to add the 2600 support to the dt binding document.

Looks good to me otherwise.

Andrew
