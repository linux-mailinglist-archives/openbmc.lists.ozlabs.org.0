Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCDC306798
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 00:16:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQzxz5P2wzDr1N
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 10:16:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=Gqzd90qi; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=XOC11u8u; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQzwC4s5szDr41
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 10:15:07 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 015D05C017F;
 Wed, 27 Jan 2021 18:15:03 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 27 Jan 2021 18:15:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=JaDYhfAge65jJsxf5p8WlwXuZlMlD66
 VyA8qHcenU2E=; b=Gqzd90qikza1rFL9yiKMZNLHgAlXC2DD3McI9nNMZLLRtj6
 TrrQa0VEzCOyw+oT3wwkWlAZt979PyJLWXkF6olhSKKPb4AJjYK5JoItQRlbnpJc
 hCCaPmHUTqAMpvfuQJdsq49F6NhJj9/iWSbLWkDYffIVwrW2TNrffdlUhksiURgx
 hpWjgSTO/scgFqBuGgVqGYYPgn5FmLK32jNhZyz/U6G0V42YScWpYbkx8U9rN/p8
 CcZ9aJ7KjeSeztnXgJbR9XdrHgw2adZAjS4qK1kH3II48BTmT1iJWNt75YCwAX1p
 +/61dbQIokFmv/ZUY0Fw7v7sWZCO2nm1BKXxZ6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=JaDYhf
 Age65jJsxf5p8WlwXuZlMlD66VyA8qHcenU2E=; b=XOC11u8uPlCBK39tHxv2QG
 5I2yGu4XQ4/tPfDrN0XTQdZH1890ywM/N4q2Up5pWGSYlxbmunmPgYebeiIrxZcm
 /v6MahcJC4bPsKa+HoBzaorHIEoIlpUx2SunKb8rA96ZJi0v1ngP4vDSSOvFpfzn
 bCevlA7klpmudmwIMQjw8jGZ/MPJHLPUkLy+6CzcL0NKgCGoqfUsIgKDicQrXuQx
 punbXoAbVTjKk57VLBZKKEbee78IGPuqAhIp7jJTi4QRqls6s9TJbhTk4uEElOgm
 L/ZvutV8RgD9SRl0MJEKYazssyfsyJ3TMLY4q8TCvWzpja2g10EXlf0W0JP7mMeQ
 ==
X-ME-Sender: <xms:9vMRYL9BIxvTz7PKy0OW_W1W5GmAHTTd8-lya5TLRr1BRbP0nLsY1Q>
 <xme:9vMRYHu0HsGIEFqDvphzZhudYy_akzD1O7O0HyhyY5RHmVaGydMdrIinDnRjQxsFe
 GdvwtCDit7MeWaPEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelgddtjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:9vMRYJCy_dKate4vepew3E24i6UfGdv2m7JwTRR1pJ1ozKLPFg9t-g>
 <xmx:9vMRYHfTFYZg6RiTr8MDmDgIDjKmZkCpexGT1ev7kgOsp0vDKxXMmw>
 <xmx:9vMRYAO4PxOBSxLbro7Y2ES7l539SuWmyR4LfJfLl7kzzehwLZrxoA>
 <xmx:9vMRYLbbmOGXbSXMDT3UqXDERMspnMPcSxkADg83U2nzNVI3eWyffg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3A7DEA0005D; Wed, 27 Jan 2021 18:15:02 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-84-gfc141fe8b8-fm-20210125.001-gfc141fe8
Mime-Version: 1.0
Message-Id: <6ea6d5b9-0e31-4a87-8990-b5ce53e2416d@www.fastmail.com>
In-Reply-To: <PS1PR06MB260095F62386276E75ADC5708ABB0@PS1PR06MB2600.apcprd06.prod.outlook.com>
References: <PS1PR06MB260095F62386276E75ADC5708ABB0@PS1PR06MB2600.apcprd06.prod.outlook.com>
Date: Thu, 28 Jan 2021 09:44:41 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Troy Lee" <troy_lee@aspeedtech.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Supporting new interfaces in phosphor-ipmi-flash
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



On Wed, 27 Jan 2021, at 20:13, Troy Lee wrote:
> Hi team,
> 
> For security consideration, user might want to disable AST2500/AST2600 
> P2A functionality by default. To compensate the effect to 
> phosphor-ipmi-flash, we're planning to support two alternative in-band 
> firmware upgrade over PCIe for AST2500/AST2600 (AST2520 and AST2620 are 
> excluded):
>  - Through a reserved **VGA** memory on BAR[0], or
>  - Through a reserved **PCIe** shared memory on BAR[1]
> 
> The usage pretty much the same as P2A, but it runs on different BAR, 
> offset and length.
> This will involves modifying phosphor-ipmi-flash/[tools|bmc]. Should I 
> create new **interfaces**, e.g. astpcie/astvga?
> 

This is the HOST2BMC functionality in the 2600 datasheet?

It would be great to have more detail on how it works.

Andrew
