Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F0114754B
	for <lists+openbmc@lfdr.de>; Fri, 24 Jan 2020 01:12:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483fjh2XMVzDqb0
	for <lists+openbmc@lfdr.de>; Fri, 24 Jan 2020 11:12:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=Bg4DDRlE; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=TTfWTEe3; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483fhF2LpLzDqbh
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jan 2020 11:11:41 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id ED81B689;
 Thu, 23 Jan 2020 19:11:38 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 23 Jan 2020 19:11:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=UcUdNU4E6hGlndfjQ9ZU8RkHKVfbvc2
 k90wrNjF0WwQ=; b=Bg4DDRlEIoOQd3pnl5FZuiSSz8LlFzJzku8JbTc0Auya5fp
 hsm8p91CfhUpjjeeJ5i+RPJzCDmqbsDb8B7rwLByda+hO5CvkCiO1Fl0mp8tZaQy
 uDROznzQ03PEa3Lv6nLqFW0hSoeKba5FBDqYC1+RQDhZoEk8RXgISCE66g5KNkTT
 ncrb0HWIQ10yNomRhqO9n1VD2z08T5o5muAGMRdY7/IQRQIbmU0uhIMEhJI4N/Nk
 3N8SqrlYxlPHbvTVcAbBbiPeyiC3NvXII5etgK+Z+7BajIMs2DI1R3xLkHl3jKmG
 TPzipqh0s0T/Mf8Arj46d9ghtUaiP1+q14RG36g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=UcUdNU
 4E6hGlndfjQ9ZU8RkHKVfbvc2k90wrNjF0WwQ=; b=TTfWTEe3AlcR1E5P6bOLRY
 qMcVhpEvZXJrVFD8WsST8t+UKL/mAYmLqS4mEfyW2nPwx+/AJGDpV5gcV2gna0ZK
 /pUV9GDqLfA+FqxameHfRp76SylyKra3DnTR3zWQmzg+t0jRzUvAW8JocqFdTh47
 pXrxyQukpLwRZUfRP1JHb+UqxCCO5Rouc0XGGZhFqNSEq6HTEmCg+YQpYzpOXLlU
 c5B4f4IQn2GaPB4E25LvYa6dIUF57orRrYJ0ors2Garg8eccbS33xLY4vuNywB6I
 5vrgToJf4XvlPsgLajBWQAFKGXqsjiKakODoiziishGsZvL/zFR10hUjyRhN55Ww
 ==
X-ME-Sender: <xms:OjYqXoo65cy5xrYvTT-xUzbc-98tQWxAof0bG_n-RUdN0I5eNlzk4g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrvdefgddtjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
 htvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:OjYqXkDrzCSp97n_zVzvOkc-R7bp-KxTJPZ90KQxGfTlRvm1kNonqQ>
 <xmx:OjYqXgRC5sRCYFqvdlv3PGrfZ-8twUaWs6NHTETnxfE9ABM5OMZASQ>
 <xmx:OjYqXkin255V2GxH0Jp5VqrP6OwlAZYulORbR_5LCsECFy3G-qRJMw>
 <xmx:OjYqXjSeQu4tQrhoVowTNkqKRL1TxvolNE4E0xccYWzNqCuymMFoAw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id F2EB3E00A2; Thu, 23 Jan 2020 19:11:37 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-777-gdb93371-fmstable-20200123v1
Mime-Version: 1.0
Message-Id: <a81e191b-7c69-422c-94d7-416f8981092d@www.fastmail.com>
In-Reply-To: <20200123074956.21482-3-rentao.bupt@gmail.com>
References: <20200123074956.21482-1-rentao.bupt@gmail.com>
 <20200123074956.21482-3-rentao.bupt@gmail.com>
Date: Fri, 24 Jan 2020 10:41:17 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Tao Ren" <rentao.bupt@gmail.com>, "Joel Stanley" <joel@jms.id.au>,
 "Tao Ren" <taoren@fb.com>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.4_v2_2/3]_usb:_gadget:_aspeed:_add_ast2?=
 =?UTF-8?Q?600_vhub_support?=
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



On Thu, 23 Jan 2020, at 18:19, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> Add AST2600 support in aspeed-vhub driver. There are 3 major differences
> between AST2500 and AST2600 vhub:
>   - AST2600 supports 7 downstream ports while AST2500 supports 5.
>   - AST2600 supports 21 generic endpoints while AST2500 supports 15.
>   - EP0 data buffer's 8-byte DMA alignment restriction is removed from
>     AST2600.
> 
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
