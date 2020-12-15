Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CC22DB6B3
	for <lists+openbmc@lfdr.de>; Tue, 15 Dec 2020 23:57:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwYZ60LhRzDqL2
	for <lists+openbmc@lfdr.de>; Wed, 16 Dec 2020 09:57:50 +1100 (AEDT)
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
 header.s=fm1 header.b=Vj4BtEn1; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=U8YzC9Vk; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwYYD0JYszDqCl
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2020 09:57:03 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id B710E5C00B3;
 Tue, 15 Dec 2020 17:57:00 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Tue, 15 Dec 2020 17:57:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=y5JFQZKbtPp7HjiSyMLrh4xks4JIfYM
 xdeb69zqrccI=; b=Vj4BtEn140i14B95BSJn4Oxsx1GQ1KmGJmazBoXAbZlRema
 Vnotnzgd8YTnl/nSmI8PJ4T67MevcfEyJ3cvAasndIJSi7S+r7o1lIZIlckxU2OY
 ltp2lXyIDjabe0jmBrYSesY7K1InMrVDUnp1b7O6E9R5dC59sGs8Obs5gdCs0fig
 Af4dWtGdbqUdGx2EDLxHbmqPT8xjmHvmPLyBztLWfbx80zGcfn6I7riCkK9W5jln
 UMBNgG+G1QISFpsRqXQWvStxXuOmp4YhoYPfvzW0NLlYBl29qby5YlbbfRWL+zPJ
 rlX/Kn5oyHI3m2xAcMJWJe2n4KgiQWFVrGna6AQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=y5JFQZ
 KbtPp7HjiSyMLrh4xks4JIfYMxdeb69zqrccI=; b=U8YzC9Vk4KkT8zWjxobQvb
 IDuLNQ3+ECccR2CrNlxituvUdZq3/7cz6MfibR2AkvMV8uMJulQPzSNv6gSWfZ3Z
 r8lkUU+Z+pUQkHYVnw6snjPvg0eGo37oNOU4l8MYczp/9wu8Mge90E03qxdEjwJN
 jcPQc2a8p9cUTcBnD6UDxvNDEJmlycLAPaZCAC3JbQzV9kJKP3AxzfuFbAeUpTRo
 Uk2s7Bsv8zC6U3gd5OAcqXjdBDocDJqWkBMVu9fB9QSLoEtHZ7mSzwakRC93IArv
 f4LxxRGI4lpnJK0c5JqT5O3Qeh287uxZXO5x82IHrwmF9++op7E5jViqIzNShcpg
 ==
X-ME-Sender: <xms:Oz_ZX17sp6xux_cLr78YDdkBd0wyoww69ZPYE251i4Xw2MSeiNvI3A>
 <xme:Oz_ZXy40ehSKdjis5dUYEuWlOIGuaUtrINdUKG1JdVcrQy-BbBrsfIuz7GfZ6TnoW
 Fhex0j5dS8Da2vSYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeluddgtdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:Oz_ZX8fjsXg66bRSDDUVlwwzfgltTUxWwvDHq6uamCz6EgLiagMIJA>
 <xmx:Oz_ZX-IxuggCUCTDqwkeDPj062RflKJ_tReSCeuzzPpndGucRSjDyw>
 <xmx:Oz_ZX5INtDR3onRgZuO-ktgT4oMr3BfqQtsPnNrNt0v7L85sPd-WbA>
 <xmx:PD_ZX7wSd7g9SaaqqetVkcAoVthQKaGGWae8lBbLNMTdo561qw4uUg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B49E5E0504; Tue, 15 Dec 2020 17:56:57 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.1-61-gb52c239-fm-20201210.001-gb52c2396
Mime-Version: 1.0
Message-Id: <d1e08c9d-beb3-4510-834b-c50f45019261@www.fastmail.com>
In-Reply-To: <TY2PR04MB331168C49C1964E4D2B80E3BCAC70@TY2PR04MB3311.apcprd04.prod.outlook.com>
References: <TY2PR04MB331168C49C1964E4D2B80E3BCAC70@TY2PR04MB3311.apcprd04.prod.outlook.com>
Date: Wed, 16 Dec 2020 09:26:38 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "P. Priyatharshan" <PriyatharshanP@hcl.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Is there any way to initilize all the platform specific Gpio's
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
Cc: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 15 Dec 2020, at 03:10, P. Priyatharshan wrote:
>  Hi,
> 
> Is there any way or any application available to initilize all the 
> platform specific Gpio's.
> 

No one single application manages the state of all the GPIOs exposed from the 
BMC. You need to coordinate the various applications according to the 
requirements of your system (power control, fan / drive / PCIe presence 
detection etc).

Andrew
