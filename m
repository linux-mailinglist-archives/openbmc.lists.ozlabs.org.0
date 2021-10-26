Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D833B43A978
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 02:53:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdYGm5pkyz2yPS
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 11:53:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=Z+qVG2iA;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=WBSJ4GRJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=Z+qVG2iA; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=WBSJ4GRJ; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdYGJ14tXz2xt0;
 Tue, 26 Oct 2021 11:53:12 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id DA120580728;
 Mon, 25 Oct 2021 20:53:09 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Mon, 25 Oct 2021 20:53:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=V0T2kJy73U3uAaMJMaKuV6KJcyjcpfP
 oCYCDulI/FAk=; b=Z+qVG2iAadM4MbCKcUhZK7A9dVqRKHJZCXjtaFwZL4NvG5f
 u20dU4z/aLL5RjL3fdlQiuSBkcG+rZGjUXivmWgc6GpROX5oH2PVoG8gyxM3tCPV
 +zgaopnS4rp1aiF2LalCIKk9pwYQlQNTcw+fvmDybIP+HIjXwqksMc4TlHyAfffS
 Bg+yozqnUVRkucLZof7Z0zz24m2eC7O3KrYIWc5iGu+qPEanIpPRygxF0+Q0Vtnt
 dyI2ya3eFjK+yqiQH34gWcras6Bvmnw4LdwfKY2Jh6VYhw5CVLZM03QKODpoPL8r
 FFW1ie7T6BUw0bD63ONK322g4lYhVEPOy5tf1gQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=V0T2kJ
 y73U3uAaMJMaKuV6KJcyjcpfPoCYCDulI/FAk=; b=WBSJ4GRJxNzEuiKowL0A82
 QgmhMIGDAIr9TCG/RR6qYka0JtQjHIJtbp506aw61Ivg8x1wSHhzWgH0IRJWoIB9
 3PyMvWAmvUx8x9+Vs1kPGetb/4LCi9EJUmmMTVWxTqzI+kTU9+e7sXXagYuGo4Ez
 XgMu0F31LmPRUylRYcwEMqLy4f/8Pvca1N5aYNTdbv5HaR5LqaehzoTurUpSpEzn
 GrELCwJuMyxD+dWeyBcCX/QEZfqyWzrN4JdRzW8WSbJLhW/PHoPBc8OT3yx797Hv
 Q2t3/90E6O1u8XsqfDMmpVOdojDLql9kZL2ckGR4e8DyrMpGGFokEBOsaE7tLjWA
 ==
X-ME-Sender: <xms:dVF3YbisDWbGSHxF9z8xdApzqt_B9j05JClaC5yX_0uszojqul4Wqw>
 <xme:dVF3YYD2lc4fBU-RNRpYkq1DpkaEOdemdfpLPpMjWb9idZ5d7Kayef9CHjb0JPGvB
 vul_12VkGdwK2OUOQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefiedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepudfftddvveekfffgteffffeuveegjeelgefhffejtdehtdfhlefgkeef
 hfefkeeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:dVF3YbFMseYAinOGxo5AcNdSXiQmQlWiToSO5I1Fema7QxPdwZQZ1Q>
 <xmx:dVF3YYQZdPr9pe6ZXIKVvFzNGTBUyKlknofeKk4qqXG-mrxSMKv9Dw>
 <xmx:dVF3YYw5TyzcXVz1SVKjtNySWBbNcWClqg6N25styc5hty8uTP8htQ>
 <xmx:dVF3YTpOp9l8IpeBaBvI0RXlFBDBxiWKBOf4g8moiS-RPkglrTNAhg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 30210AC03DB; Mon, 25 Oct 2021 20:53:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1369-gd055fb5e7c-fm-20211018.002-gd055fb5e
Mime-Version: 1.0
Message-Id: <5a235916-f250-48ac-b931-6ec2c5c2ea5d@www.fastmail.com>
In-Reply-To: <20210922103116.30652-5-chin-ting_kuo@aspeedtech.com>
References: <20210922103116.30652-1-chin-ting_kuo@aspeedtech.com>
 <20210922103116.30652-5-chin-ting_kuo@aspeedtech.com>
Date: Tue, 26 Oct 2021 11:22:49 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Chin-Ting Kuo" <chin-ting_kuo@aspeedtech.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Adrian Hunter" <adrian.hunter@intel.com>, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-mmc <linux-mmc@vger.kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 04/10] mmc: Add invert flag for clock phase signedness
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
Cc: BMC-SW@aspeedtech.com, Steven Lee <steven_lee@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 22 Sep 2021, at 20:01, Chin-Ting Kuo wrote:
> The clock phase degree may be between -360 to 360.
> If the data signal is leading to the clock, the signedness
> of clock phase is postive, otherwise, the signedness
> is negative.
>
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>

The implementation here can't be changed without a change to the 
binding documentation:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/mmc/mmc-controller.yaml?h=v5.15-rc7#n345

> ---
>  drivers/mmc/core/host.c  | 10 ++++++----
>  include/linux/mmc/host.h |  2 ++
>  2 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> index d4683b1d263f..c2de7cbc7838 100644
> --- a/drivers/mmc/core/host.c
> +++ b/drivers/mmc/core/host.c
> @@ -214,14 +214,16 @@ static void mmc_retune_timer(struct timer_list *t)
>  static void mmc_of_parse_timing_phase(struct device *dev, const char *prop,
>  				      struct mmc_clk_phase *phase)
>  {
> -	int degrees[2] = {0};
> +	int degrees[4] = {0};
>  	int rc;
> 
> -	rc = device_property_read_u32_array(dev, prop, degrees, 2);
> +	rc = device_property_read_u32_array(dev, prop, degrees, 4);
>  	phase->valid = !rc;
>  	if (phase->valid) {
> -		phase->in_deg = degrees[0];
> -		phase->out_deg = degrees[1];
> +		phase->inv_in_deg = degrees[0] ? true : false;
> +		phase->in_deg = degrees[1];
> +		phase->inv_out_deg = degrees[2] ? true : false;
> +		phase->out_deg = degrees[3];

This fundamentally breaks any in-tree users. We can't do this.

In terms of the binding, if negative phase values are something we must 
do, we can just extend the value range to include [-359, -1] right? 
That avoids changing the type of the value positions in the manner this 
patch does.

Andrew
