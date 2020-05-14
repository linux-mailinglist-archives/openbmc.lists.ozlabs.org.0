Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC4B1D41E6
	for <lists+openbmc@lfdr.de>; Fri, 15 May 2020 01:59:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NT6L2xx1zDqy9
	for <lists+openbmc@lfdr.de>; Fri, 15 May 2020 09:59:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=guVFuZkt; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=UNavdBPW; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NT5V4FzgzDqDp
 for <openbmc@lists.ozlabs.org>; Fri, 15 May 2020 09:58:37 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 9C0AA5C0110;
 Thu, 14 May 2020 19:58:34 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 14 May 2020 19:58:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=ikrlVkNizpx9cDNTynic5IrJyG4IUSu
 YIcWJKZDpQCs=; b=guVFuZktF1mQOXzZGRJrurc8F/a8itV1e3t60y4AOR6QiKr
 rrSvl1wPpXWbjiMQizTzxwStJ0UOKVap7rDkw+ows02go7dq72WR+P9OHk4mWp6Q
 jdAxI5BRbCGyBOWjqeUQnNB3CEoUXpD/huCMqvPpbCJF5ZlRwORM3s7q1Y5cAAYx
 f1X/owwGDMlFcEgPyIdFtvOdQ36nspUQR8Ypvbh8WJabs0GAhFO/TVRlZgY70P1N
 fo5nS1gXkR/X8F4FUAt6gW1ouKVui9qhkwphiKQ6yJ6tv+bquECtRY90JEQ6fv52
 bVuqG8FYBgPfbeZAi54lx8dxPJuWU0KbsmjyRzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ikrlVk
 Nizpx9cDNTynic5IrJyG4IUSuYIcWJKZDpQCs=; b=UNavdBPWlab48M3EOXmofQ
 xW5aA5RCj9M9iiJ/Gr/n1+dvm9v89IneTq7k5ERQAZoEiaORD9jTQRSCRGw3JBB9
 /yLmUgnZ+Z5oSeAQ9y3rT6gVcltiSecLPjJ8LbktdREZePgx2GQamTMdSlH1/0c/
 iFQ0PVbBvaLvKfe5VPnVYLGjtQX8BXNXt8s1clMlsvk45AHJXHXOG8+V0whZqDpR
 TmZpZrakqjQ9g25PzeazLdnYM+x4JLO0Cuokw6xpAehUL3kTU8g4cHd1a8Exjfnt
 iEae03a+ctDAkp+ZWV+RIj0Z3edidCBEC7rlPJ6nfE4KuLtBuYV37gzJMl39kHXw
 ==
X-ME-Sender: <xms:Kdu9XkuiIpK_w7PClCQrkES2I-kcsFoEWxXOsAy8jr176bOpLkPRfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleejgddvudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpedutddtkeeugeegvddttdeukeeiuddtgfeuuddtfeeiueetfeeileettedv
 tdfhieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:Kdu9XheYqEX6y4K7ZaQ9L46aw_hfKZleosmR0sydMZO4xn3Aia8XCA>
 <xmx:Kdu9XvzDAUC-TMYcwh8I-MdJ-VR6ehK4C21ILrWaiXoj-C1O-7uBLQ>
 <xmx:Kdu9XnNGCFDqh4NZO9H1EqeXhX0B-0Yxmrt4o1Vf8Vqe8isjwikXYw>
 <xmx:Ktu9XnLrau-Okh7rDsFL2Rs4vM8SSCalolojjPh5yKGqDw7StF4uiQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B5953E0128; Thu, 14 May 2020 19:58:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-413-g750b809-fmstable-20200507v1
Mime-Version: 1.0
Message-Id: <d890ea78-6b4f-44b3-8b4a-fac878e2d8fb@www.fastmail.com>
In-Reply-To: <20200514132703.448317-4-andrew@aj.id.au>
References: <20200514132703.448317-1-andrew@aj.id.au>
 <20200514132703.448317-4-andrew@aj.id.au>
Date: Fri, 15 May 2020 09:28:11 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[RFC_PATCH_linux_dev-5.4_3/4]_ARM:_configs:_aspeed-g5:_Ena?=
 =?UTF-8?Q?ble_kprobes?=
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



On Thu, 14 May 2020, at 22:57, Andrew Jeffery wrote:
> Enable kprobes to improve the debugging experience on the AST2500 and
> later.
> 
> Setting CONFIG_KPROBES=y results in the following change in kernel size:
> 
> Before:
>          $ size vmlinux
>             text    data     bss     dec     hex filename
>          8240349 2388862  172304 10801515         a4d16b vmlinux
>          $ stat --printf '%s\n' *.zImage
>          3458368
> 
> After:
>          $ size vmlinux
>             text    data     bss     dec     hex filename
>          8279214 2399530  176912 10855656         a5a4e8 vmlinux
>          $ stat --printf '%s\n' *.zImage
>          3471880
> 
> This gives a 54,141 byte increase to vmlinux and a 13,512 byte increase
> to the size of the compressed kernel image. In the most constrained BMC
> flash layout (arch/arm/boot/dts/openbmc-flash-layout.dtsi) this change
> decreases the free space in the kernel partition from 998,080 bytes to
> 984,568 bytes.

Just realised I should be measuring the FIT not the zImage so ignore the
free-space numbers for the moment.

Andrew
