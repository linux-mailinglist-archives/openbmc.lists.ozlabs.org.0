Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A71CBA98AA
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 05:03:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46P58z0sx1zDr0l
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 13:02:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="I8srke6y"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="r9qEM8d7"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46P57X75T2zDr0f
 for <openbmc@lists.ozlabs.org>; Thu,  5 Sep 2019 13:01:44 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8E7D821BF7;
 Wed,  4 Sep 2019 23:01:42 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 04 Sep 2019 23:01:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=wtvCyzgkXx9Qz2sSIxZ5D4E/se05uw4
 ORccoqcwFcKE=; b=I8srke6yX2AsAEs12f+XMChAlfLnFERc0oEMUXTXfYZBRGk
 xgtMowmbCdtAgoAFWKBp77ZegCkD1z4lIkNLVbFlUDtrAAvnXntrkJMIiDgX6zvR
 tGYLXnO+D7gvtmmUq74/SrZatYFdDEMYAewNw33zJK9GsdfN6pSn64I5rCiBGlGH
 GmmSs6uvyyM/m9g9Lb8mJthtyrVGQ2Z2BMx9qLLqZdTQYo5SUBYVVcQ1FMc905Cy
 FLcs2W5SHHiZKaEZue86yjO/iC8hSL1YhD082a0WGUtpEUIJGob5eRu1/YkFIlJF
 hbn6YIaJzsOeL3ylukWKnDNJomiExb/MuAz/aBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=wtvCyz
 gkXx9Qz2sSIxZ5D4E/se05uw4ORccoqcwFcKE=; b=r9qEM8d7H63E2XNEf0vd9F
 y7FwR+RYvyRIyq7VnePNDsuQtBiKTicCGhfHxsuCm070xpMFq0VCMT/Zlo8BVE+a
 5l+armSvoTADAzW6fDLTMa2ff5CWX8Pb3v5M3g0qMHnk6h053WxsI0nD3XK0V1Yj
 ER3BcGK53j0tMleo0UwzOWZXXAODZXQgkFhsFz9NUQoFdaaWq2vkGJrBw+CMpD4C
 WW1ga9J0w3dfoeYMCr4foQJ/DY6Eh7EqdxhKkBjN47/ZImGhga4phw5gwqBr6eiq
 64FpJm5d9W/WmXrhX0is+JOFN+fkWiq6oFPU1aEPPsfjI7s11aYMRsWQ+/+whF2g
 ==
X-ME-Sender: <xms:lnpwXZqqjOb-8GH38Y3qmsJZLoTlhnNHj6LiIPcyZ8IZo9Qj0wiEiQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudejiedgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:lnpwXR9D4TGe5B9fJjw51tZqTB8nNKXuzgyPyE7Agy4P5B6TUgTTIg>
 <xmx:lnpwXS7FA3iwgr0M1VlDqkT0H3_QU2WL5XjtTs_dZqje-Y8zHFs7dg>
 <xmx:lnpwXTjB4R4ZJbmYmXqUYF_wMft_T64TZsJt_q9cgQvGlceYM5I5cA>
 <xmx:lnpwXVWCRRbUwIvl5jw1arydkhR_7hSRXzGQNykG1nlKD10bidDGSQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1CABFE00A3; Wed,  4 Sep 2019 23:01:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-186-gf4cb3c3-fmstable-20190904v1
Mime-Version: 1.0
Message-Id: <a01c913e-1ae9-4aad-83a3-dec3dbd5b7f4@www.fastmail.com>
In-Reply-To: <1567629311-7553-2-git-send-email-eajames@linux.ibm.com>
References: <1567629311-7553-1-git-send-email-eajames@linux.ibm.com>
 <1567629311-7553-2-git-send-email-eajames@linux.ibm.com>
Date: Thu, 05 Sep 2019 12:32:08 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux dev-5.2 2/2] i2c: Aspeed: Add AST2600 compatible
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



On Thu, 5 Sep 2019, at 06:05, Eddie James wrote:
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Have you tested this on hardware? What was the outcome?

Andrew

> ---
>  drivers/i2c/busses/i2c-aspeed.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 8931792..1943977 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -1274,6 +1274,10 @@ static int aspeed_i2c_reset(struct aspeed_i2c_bus *bus)
>  		.compatible = "aspeed,ast2500-i2c-bus",
>  		.data = aspeed_i2c_25xx_get_clk_reg_val,
>  	},
> +	{
> +		.compatible = "aspeed,ast2600-i2c-bus",
> +		.data = aspeed_i2c_25xx_get_clk_reg_val,
> +	},
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, aspeed_i2c_bus_of_table);
> -- 
> 1.8.3.1
> 
>
