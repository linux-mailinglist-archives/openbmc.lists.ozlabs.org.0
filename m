Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DDC16EBC
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 03:55:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zKKy1RlrzDqNN
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 11:55:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="TibiRHAx"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="aA6DdAq0"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zKJp2S6mzDqLS
 for <openbmc@lists.ozlabs.org>; Wed,  8 May 2019 11:54:01 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A5F6620DC2;
 Tue,  7 May 2019 21:53:58 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 07 May 2019 21:53:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=sLjkLSsA8kk+tCMKqg0Z4BMOroe4eRe
 qX1RYiIHR8Y0=; b=TibiRHAxSX0Jv4+CoQ1WL5g8OM+5rXRsQx8L1Jr7qoPz4PD
 0EJOZoUqKfmXfye+TuIqRJ/Pesjq1zskUnPx03s4OW12gSo7i2pntde65KwAG4Ay
 L8dlp7uL2mqRf1a/P0tGafiPPH9FzI6JFVgp+/CrYp9EKtZIuRg6P2RS4ZYYMKlx
 LX0HpusU1YNUcZvwdMz4oWPdDaaChPLC+8RrBs7C1R506o95vEPcrYhe39ASfVZ5
 uVH3wjw+EVLhNXz7cwJBZbOJn1lrN8zwLS1jUghokY4DhrBh1Y7sND5xcLWMwCEa
 3OGQTJY6puBxg1j/2mAw63ZMBvz9p0lXrxOHkfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=sLjkLS
 sA8kk+tCMKqg0Z4BMOroe4eReqX1RYiIHR8Y0=; b=aA6DdAq0nZQF4a2l6pPFcn
 gjFaJDJVkhUxSQ0iYflfUEsgpTaER621L90d6Iw8eK9GiRqwvNHjib2qSfZvnZJw
 2jqVGT86kASxnIZX7UqhP5PfnYAaP+vs8pdwBJxUa1ilBwpm3yHxyjn2gaetYjZX
 +R1UgSQEKcOGbocJe2P4n6L42iJZED3Gtv1BxjzeXGxwgFGR6Py4EEX9Q1aL4YNQ
 oRNcKC1XngrCrnOA+bkQjhUz4U1cEadb10GGQgXTsS9i0tgabwUcsev94Jzdjy2T
 eQOraXDKtsQSYlIz5FMwmPmGk278Jn0jtoEh/JGRAiKzEyDDNofjEyPAHzBH6BiA
 ==
X-ME-Sender: <xms:tjbSXEsaRDcjGEZ09a525Yr5HurSBMramNz8TWhjBrsmB1y0-W65Bg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrkedugdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffohhmrg
 hinhepkhgvrhhnvghlrdhorhhgnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgv
 fiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:tjbSXIaVVfhCj6MDoRn3W5Yc9srDjINJ6JrwAMjBLr31a0wt-yFEAw>
 <xmx:tjbSXGO5DzgnIqyNH12juYuEpbH0NplMiwISA2LfQYbzbrkEhFjL5A>
 <xmx:tjbSXFvq9wGgser_z9nJjVZo_R_6yN0irV_z-ZWPgkrRW5XZnV5WKA>
 <xmx:tjbSXHI2u2TyosGEgMrp3yStQrHknb2rP85hBKkTcBCkKhPdnF5Oww>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id F2E9F7C76D; Tue,  7 May 2019 21:53:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-449-gfb3fc5a-fmstable-20190430v1
Mime-Version: 1.0
Message-Id: <18ccd5d6-0bce-4990-9d0a-62f97fae5b3b@www.fastmail.com>
In-Reply-To: <A2B0CA36-50FC-4A4D-A1EE-C87B3A55223C@gmail.com>
References: <365A980B-9730-411A-A91B-EB0A97026D95@gmail.com>
 <acf57f4c-08bd-40db-a77a-bb7f4f9f5938@Spark>
 <A2B0CA36-50FC-4A4D-A1EE-C87B3A55223C@gmail.com>
Date: Tue, 07 May 2019 21:53:50 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Brad Chou" <chou.brad@gmail.com>,
 "Samuel Jiang" <chyishian.jiang@gmail.com>
Subject: Re: How to set GPIOs to pre-defined value
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 7 May 2019, at 18:23, Brad Chou wrote:
> Hi Samuel,
> Thanks for your reply, I am using AST2500.
> I tried add gpio-hog settings into my device tree, and yes, the GPIO 
> works as it defined.
> But all GPIOs defined by gpio-hog can not be modified in user space by 
> gpioset / gpioget utility.
> I need to set all GPIOs to pre-defined state and can change it at run 
> time.
> Set GPIOs in Device tree is trying to lock it by a fixed direction and 
> value.
> 

This problem is probably best taken up with upstream. Currently GPIO
nodes in the devicetree are ignored if they do not have the `gpio-hog`
property:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpio/gpiolib-of.c?h=v5.1#n454

Changing that might be a hard argument - it may impact existing
devicetrees that expect the current behaviour.

However, I'm interested in what you see wrong with doing this from
userspace? What requirements do you have that would need this to
be done in the kernel?

Cheers,

Andrew
