Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B248831D60E
	for <lists+openbmc@lfdr.de>; Wed, 17 Feb 2021 09:05:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DgVkm5dW5z3ckb
	for <lists+openbmc@lfdr.de>; Wed, 17 Feb 2021 19:05:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=leKVx17H;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=RsFtyn4/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=leKVx17H; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=RsFtyn4/; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DgVkR4dLnz3cWy;
 Wed, 17 Feb 2021 19:05:02 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 376C95802F4;
 Wed, 17 Feb 2021 03:04:56 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 17 Feb 2021 03:04:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=nE/twV9lmTlIyX6U7fiaqg/3ZI4aMx+
 bPYLO39QK5O0=; b=leKVx17HtaHJn3FrmsRfWtV8fzB2OYxry6LHwsLi2TOoXR6
 GWY4gxCvoCb6laeSYlrndXi+xLE/IkPb0pvqGLXB1+i5nW20zpm+N/7+kDDMPIkd
 EPTeAw3132A0wOz0nBXXgjtTdrpil26/Cal4Xo/1pEyihPWrJwZUTjTCzSh8/lAI
 A3EsqQZe4zm2JmKBNUyLF9KqgAIgD414plXpciBPjKc043OAhIxmfLX9DiajDgAT
 ZDEWwykIeIdo+eNq+XDnzw0uGupXJMAWJ8wnAHL7PtxKU2L5IvfrtlhKWqtWBUDI
 a531LmQgmy7KYI1/kWRvKsv33G2m9AdOCuuVa+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=nE/twV
 9lmTlIyX6U7fiaqg/3ZI4aMx+bPYLO39QK5O0=; b=RsFtyn4/5ZrsYMmsUH8fiK
 ss76if/+SFU/X+mGqQSL0zlT/WAu2mdzS26/z5dUntdtmIk70LgFK9s0L0qY1Fcg
 Uj5TI05PU6+RvmtKowYtxFfWvRwf8Kp4el5AAkC5QXlByDoy22hsh7AjsAKold1G
 ahfB0x3+oxs/JFutjIpjALprWb53ZaTsfHScUux+OIw8WEKT3j3VsYMUE0httU8K
 JQ72ug4dz943Oq+oVq6n3AMz8T/cxcMOitzPXVZwpWv7axyVfFYCJsWlEu0TaioS
 Tp3Z2FyAdqK7E2mHXS7K7mqjU3YHleHIVY6Vsfq01G39DMuyBmzqzuz6EDdvha5w
 ==
X-ME-Sender: <xms:Js4sYK4Rhd2CEdnUu0JfJhnOCl7qBxXZ1m7-YA5iGbdB06t_7QKrOw>
 <xme:Js4sYD736FfHDDvk_otqV6Yg5n0YvuQfvuzx9_0zz9VA7qK8gmRQaILkI26oT9r5Q
 J4CfwtA10ycvs3i2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjedugdduudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:Js4sYJdR22Rn3jHyJqjtGULmYpgkTUHm1MFJ5bT9q4v3cWn8iPPQyA>
 <xmx:Js4sYHLTxmq6iU6FeOcRHtlEAp-0qjhwmBEjJDYQm2iZQMIHXWQEnw>
 <xmx:Js4sYOI3_B2V1lnlgMXmRTP5ZGtcilhyvXv_K8V9hhuUTs9IfmpSMw>
 <xmx:KM4sYEyBoR5ITQLvEbc2ZLN-LAwg-mHHOPQFi2IfN-RnRn5WorcBfg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 961C3A00060; Wed, 17 Feb 2021 03:04:54 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-141-gf094924a34-fm-20210210.001-gf094924a
Mime-Version: 1.0
Message-Id: <26958980-d998-407d-926a-40c370cfc8c6@www.fastmail.com>
In-Reply-To: <CACPK8XdFLKg9k6snLSZrRzorxBeg1fLoqakm6J_8VCXh_=JEQA@mail.gmail.com>
References: <20210114131622.8951-1-chiawei_wang@aspeedtech.com>
 <20210114131622.8951-2-chiawei_wang@aspeedtech.com>
 <85f00459-4a39-441e-8119-8e12f8132cfe@www.fastmail.com>
 <HK0PR06MB3779B25984A461E4A1ADEF1191869@HK0PR06MB3779.apcprd06.prod.outlook.com>
 <CACPK8XdFLKg9k6snLSZrRzorxBeg1fLoqakm6J_8VCXh_=JEQA@mail.gmail.com>
Date: Wed, 17 Feb 2021 18:34:25 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>,
 "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
Subject: Re: [PATCH v5 1/5] dt-bindings: aspeed-lpc: Remove LPC partitioning
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Corey Minyard <minyard@acm.org>, Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Haiyue Wang <haiyue.wang@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 17 Feb 2021, at 18:14, Joel Stanley wrote:
> Hi Chaiwei,
> 
> On Wed, 17 Feb 2021 at 07:40, ChiaWei Wang <chiawei_wang@aspeedtech.com> wrote:
> >
> > Hi All,
> >
> > Do you have update on this patch series?
> > Aspeed has subsequent LPC module upstream plan.
> > We hope that the following patches can be on the basis of the fixed LPC layout.
> 
> Andrew has expressed his support for your changes. I will take time to
> closely review your proposal this week.
> 
> We will set the goal of having this rework merged for the next merge window.
> 

FWIW I have a patch series that builds on top of Chiawei's changes. Once
some weather has passed and some power is restored I should be able to test
then send it out.

Andrew
