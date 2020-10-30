Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F227029FD93
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 07:04:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMsGK133CzDqn5
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 17:04:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=ZbN3J4VM; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=m9i9wzOI; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMsDj2WxyzDqXq;
 Fri, 30 Oct 2020 17:03:16 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 76BEA5C00D3;
 Fri, 30 Oct 2020 02:03:13 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Fri, 30 Oct 2020 02:03:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=LKPOlYstS94XnmYzGcmMqKinafVwgnt
 a0VjXaei+HB0=; b=ZbN3J4VMb+52MuxAEhQFkDe9JVcQWwH+WnVzh1pspYkYrRo
 JVJ711E4v6GytATJFqwNuf+0OjWaNv0cqhcYcLWkSs67b1gUr1INcsdtMkbNkf0p
 qdAb2t+67TlCmLx+nl2jQFGYj2MM/+MXiaZLqs9qieTyChiScydCXBpTBEgpjdap
 t2YKtvZgS5pCzvMN/ih6IkBFiQInHsaut4aIVS0244mKyu5Co7d3SI5a7Yox59dj
 sTkgOrkGkVFjWM0XO4UjxVmEI6pNggcMBlTbDCmwPxfjpqths28EuORsC1olgN59
 SO09DG2h0VMbJRB4fw3zRzgBSNtzlcKwD2K/yxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=LKPOlY
 stS94XnmYzGcmMqKinafVwgnta0VjXaei+HB0=; b=m9i9wzOInNITtsB47K6a/i
 f8NWOV8924sGljt8G1PT+4956fgPberyQof7sdv8n22cOrFfO4vPykeY+ary+d64
 7820dHkNgX9jrVxPhqC6U9CC9yZTY+g9pCCtSRjMwJbJCziUlpj6TEnzbbTx6f4K
 5MoUJEWzhiuPV4gYyCQ2471P8G9FZD9h0jnO9NMuZyfDeQlBcWr74yOJlqpRdaqu
 70CapOmDpouwOEd7DW7rDylDZ0Wdzw+fCJwtEIZheQPoJBbpoJRdcQX4exixPU12
 GClBNMbEwuCZHMfoZfIWvLFCfrFdgQROqfHiOYzXWwRCT5c/nzczZF9fAZYkrCMQ
 ==
X-ME-Sender: <xms:n6ybXxV5Y98UPbclssTQGyZB5oPzh1wQEVeyUgqp6aPUi6COW0hkJQ>
 <xme:n6ybXxmIdZk8YIBXqaeJ9EQhm9UF-PtyJDbZGjv7YEqhwFpfvlAK_QDcU9UykgbM1
 -yre0nbDWAQCJSaaQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleeggdeklecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:n6ybX9bAvQu2KXQzX_y7QX0_TG44C1Rh8Fy8TcJjJPIuzM1oJFdZrA>
 <xmx:n6ybX0XLNhlwvnS8hXnx_bZspIhgxnp_55xpFbQyE_JBx8qdq2IYIg>
 <xmx:n6ybX7lO1GxaJ2hzGnpyz2Bzh7HhM_SvRVL8jnNrXFvc538CpBKg3g>
 <xmx:oaybX2tpVOGzPDzY4HvMrbjPQMEaPiUvNLYg09Es3UAQ5S-Ik2ewCg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5B5D6E00B8; Fri, 30 Oct 2020 02:03:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-530-g8da6958-fm-20201021.003-g69105b13-v35
Mime-Version: 1.0
Message-Id: <265dfc71-0087-44db-9f6c-4f105cc1853d@www.fastmail.com>
In-Reply-To: <20201030055450.29613-1-billy_tsai@aspeedtech.com>
References: <20201027084417.10137-1-billy_tsai@aspeedtech.com>
 <20201030055450.29613-1-billy_tsai@aspeedtech.com>
Date: Fri, 30 Oct 2020 16:32:50 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Billy Tsai" <billy_tsai@aspeedtech.com>,
 "Linus Walleij" <linus.walleij@linaro.org>, "Joel Stanley" <joel@jms.id.au>,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] pinctrl: aspeed: Fix GPI only function problem.
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
Cc: BMC-SW@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 30 Oct 2020, at 16:24, Billy Tsai wrote:
> Some gpio pin at aspeed soc is input only and the prefix name of these
> pin is "GPI" only.
> This patch fine-tune the condition of GPIO check from "GPIO" to "GPI"
> and it will fix the usage error of banks D and E in the AST2400/AST2500
> and banks T and U in the AST2600.
> 
> Fixes: 4d3d0e4272d8 ("pinctrl: Add core support for Aspeed SoCs")
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Thanks Billy. Generally the Fixes: tag should be part of the trailer block, 
hopefully Linus is happy to remove the newline for us!

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
