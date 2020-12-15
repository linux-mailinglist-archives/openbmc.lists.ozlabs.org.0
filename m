Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B802DB6A5
	for <lists+openbmc@lfdr.de>; Tue, 15 Dec 2020 23:48:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwYMq52T5zDqLC
	for <lists+openbmc@lfdr.de>; Wed, 16 Dec 2020 09:48:55 +1100 (AEDT)
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
 header.s=fm1 header.b=MXcvFzCL; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=b2m8f3Vj; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwYLq1VL0zDqJW;
 Wed, 16 Dec 2020 09:48:02 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 7F9265C0043;
 Tue, 15 Dec 2020 17:47:58 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Tue, 15 Dec 2020 17:47:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=QWzDvy6drK5slTeHs2rtc/DTIJ65yki
 vR5Tsxc+1DFI=; b=MXcvFzCLfwAyH3Lw6LehPx4X5BX7ctYKM8XVoHx8tHMaZTj
 FP1vr39w8LtlM2HIkpYmXlsGaZ0XpU3wbuutdM6FNaJc5aC+uoNldplUat685jeM
 DOHj3CW+nykIXuSnccUGfNWLOs4SUUoZEXtpFJINmcrgNQnBEHQcKUl5hh1/yNOp
 FSEanvh57wmqBhlWrO8+bDCAVqcPdMzJdW8Sa6zjhVE0jum/+tMLi5jJVh12TOxj
 DSCjdpOmhr50C5KYMlZTztX+6TY8DAQbRcpnNQ7mt5h9UosYJ2JKJ2JdRW71GITX
 e2Rz8EHjYw3ax/y49FvLvr+MVh+3hPqKK5IknCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=QWzDvy
 6drK5slTeHs2rtc/DTIJ65ykivR5Tsxc+1DFI=; b=b2m8f3Vjtzqu8X/XEbzq+0
 HmMV87aFW6WeQFE9tbZXMhxd8NG6NcMqvaE7dztb0w7vSPCHQ0Z4QhRSqPMplIUc
 maicbeHqdFxA49VEEnhdkSYlBJhEgx+jU9vZiJSJ7DxdMvq8YQ8OW8Y5QwQjfgAw
 wb4hkv0jcvmlCfPtLLPtedAG3aXxHUbq7t2wb+nuoTafMLdqcP4bnRFNofr+1yVe
 P0imvSsCeQ4BAp8YXN5nSssqaQrqRdGThACikQNbBX2ql7GXCuDAD5GDTBIP2RHl
 TE2S0/ZktXihYxo6cP7SADF1H+F9o4sGncczaGgmUJeDU/rU8AvLhSqlXUfwoA/Q
 ==
X-ME-Sender: <xms:HT3ZX7aNro-4wU3wDkCkJFE76CkjCxEwLz62YTO0p52slosxMUSkfQ>
 <xme:HT3ZX6b2YcD6NWfbvx79P2VKs-EnRrO_UpYj39x4lzdOy2gv3WOHf0SZ4o_Vqso9y
 gFvwZs6rYfuG95dSg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeluddgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:HT3ZX9-Atzm4CVQb1f6jHivdEBhJRZB9WWPruxvYH_lfajRtaIaNvw>
 <xmx:HT3ZXxqlYeVRsnLpVk5vG_QNnJtdPUkfoWtG5ICz7yE1asOirJ-mVg>
 <xmx:HT3ZX2psJGGzlbneb3VW5U-9LTqbqhIC5KpHUaksjdT10Q0mksMa_w>
 <xmx:Hj3ZX_lJn_UKAy5nC6MlUiDepiktkmzMyTmbuIqPb90ATNd7UqcHOw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9D6A9E0504; Tue, 15 Dec 2020 17:47:55 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.1-61-gb52c239-fm-20201210.001-gb52c2396
Mime-Version: 1.0
Message-Id: <0a513b26-a4e4-4808-a02a-eb6ffc84f5ba@www.fastmail.com>
In-Reply-To: <20201215192323.24359-2-hongweiz@ami.com>
References: <20201215192323.24359-1-hongweiz@ami.com>
 <20201215192323.24359-2-hongweiz@ami.com>
Date: Wed, 16 Dec 2020 09:17:36 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Hongwei Zhang" <hongweiz@ami.com>, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 "Jakub Kicinski" <kuba@kernel.org>, "David Miller" <davem@davemloft.net>
Subject: =?UTF-8?Q?Re:_[Aspeed, ncsi-rx,
 _v1_1/1]_net:_ftgmac100:_Fix_AST2600_EVB_N?= =?UTF-8?Q?CSI_RX_issue?=
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



On Wed, 16 Dec 2020, at 05:53, Hongwei Zhang wrote:
> Fix AST2600 EVB NCSI RX timeout issue by removing FTGMAC100_RXDES0_RX_ERR bit
> from macro RXDES0_ANY_ERROR.

But why? What is wrong with the EVB that this change resolves? Which revision 
of the EVB?

The change affects all designs using the MAC, not just the AST2600 EVB. Why is 
this patch an appropriate course of action? Can we not add a quirk targeting the
specific board (e.g. a devicetree property)?

Andrew
