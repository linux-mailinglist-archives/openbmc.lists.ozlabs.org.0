Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCCD26D022
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 02:46:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsJF12p7DzDr7s
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 10:46:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=gsvTVMUl; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=d0NLfsFY; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsHvX1bTYzDqKX;
 Thu, 17 Sep 2020 10:31:13 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id B0FE75C0A37;
 Wed, 16 Sep 2020 19:12:49 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 16 Sep 2020 19:12:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=wWsRwlVvP8+43MZ6dwzJ2Fdj/0px7Bt
 Uhpq3T6t85KU=; b=gsvTVMUl3GJG8bCr0WIzqog4pLruzE0o4Dawa2TPuJ1t/qx
 Ren3Xs5Qkpl7qXc4qf34+KXoRLNhrJ9Zcofm8gsyhv+JrxO4yNj4JlTJlcvRCySs
 /tyC8uQwzmz7olHkRvJm969w6a+j5PG9qcekak2B6lS3M4VIJ7vPv9bi45YabCnF
 zvT7okIv6bjkxuV+6waXzQPCldibUjPx2NOWXVi1Xjz6JhgzuI7vX3K3ETLqXJoC
 IoeySVWrHW75AljKifV21TErzU/qzU+KaxwqVi3vSkpAsVUd25ZlyHrLBKygp0mJ
 9RXfG7iEyQAaiFrmu/yG3E5y5xwhhC3rXGsPuLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=wWsRwl
 VvP8+43MZ6dwzJ2Fdj/0px7BtUhpq3T6t85KU=; b=d0NLfsFYhpCurbF8wtJvhY
 jLZ+YJR2/D2BW81nT5LGL2+zM3VQ0N5eU9cXoRtc6xSNm3EeiLatKpGHUxXIywFs
 GaETtjGrLqbxhxv+OzHr5pJaTAFub0sCD+GJdr2NdxTDT6jQcNwCbkC9bmyIw0Hi
 uzKqhnAnFNnnB3lLbaxPaX0EbAHI4G6mtDTQew7aDM3H76FvnmC9p69SiWc/qLcc
 ArDjMi8DPiF8ldqrpcPaNLJUPAwDHPE//nWqaQ5RDDNog6YJxTwt1QIAJYfv4YBS
 aOd9FZEdLSwJdQgNlVVG1mfhEUMFPfImmOJtV/cUD989NVnrv5W0BLl6zrU39Ijw
 ==
X-ME-Sender: <xms:8JtiX95Q1ko-nid23vEXX398tgQo5c9I3NFfnybjHjJFpMd05BzhSw>
 <xme:8JtiX67-hcL---jVisrikvraUXrrh2bAbXOHORYgkUz2rxHwNOtfu11BunuZpZ2H_
 IZ13g2PKuZ_JPA1kA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtdefgddulecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:8JtiX0ccptkrtNtXU672t5kq8HR2WJkyq-2L3QmQr24hF3KfZ_VcqQ>
 <xmx:8JtiX2JAedFucucSNridRRpeaj-470-pL_IEsuoPz3-srrAT9qawJA>
 <xmx:8JtiXxI6FLPVJTlF0P-pZHf2l65LRjzhMrW5C0RtQr8PeR_bSlvjtw>
 <xmx:8ZtiX2qQRAk9cVvc4LR0PA6HqrLNIU8wdRJi0I6fmOKDJHxLAsQGfw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 847BEE00D1; Wed, 16 Sep 2020 19:12:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-324-g0f99587-fm-20200916.004-g0f995879
Mime-Version: 1.0
Message-Id: <60f9f14a-c9be-45ac-b3a8-516ab73d9bee@www.fastmail.com>
In-Reply-To: <20200916204216.9423-1-rentao.bupt@gmail.com>
References: <20200916204216.9423-1-rentao.bupt@gmail.com>
Date: Thu, 17 Sep 2020 08:42:27 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Tao Ren" <rentao.bupt@gmail.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
 "Joel Stanley" <joel@jms.id.au>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 "Tao Ren" <taoren@fb.com>
Subject: Re: [PATCH] gpio: aspeed: fix ast2600 bank properties
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



On Thu, 17 Sep 2020, at 06:12, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> GPIO_U is mapped to the least significant byte of input/output mask, and
> the byte in "output" mask should be 0 because GPIO_U is input only. All
> the other bits need to be 1 because GPIO_V/W/X support both input and
> output modes.
> 
> Similarly, GPIO_Y/Z are mapped to the 2 least significant bytes, and the
> according bits need to be 1 because GPIO_Y/Z support both input and
> output modes.
> 
> Fixes: ab4a85534c3e ("gpio: aspeed: Add in ast2600 details to Aspeed driver")
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>

Thanks Tao,

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
