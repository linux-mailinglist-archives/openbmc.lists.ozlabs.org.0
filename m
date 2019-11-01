Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C53EBC3D
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 04:07:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4746ZH1RdHzF5JM
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 14:07:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="rf7LfZT7"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="GuZw5y4b"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4746YZ70mxzF4gG
 for <openbmc@lists.ozlabs.org>; Fri,  1 Nov 2019 14:07:14 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1586F20E94;
 Thu, 31 Oct 2019 23:07:12 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 31 Oct 2019 23:07:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=JNODO02r/yDofJEoGhu5D4RQF+y7J/V
 zDpXDdeazVjM=; b=rf7LfZT7ZLh5YebuZuXxYVaMpvxM5c5JPDPMGv7QzfQpAEE
 XjLk9E7MyvL6GCxEh6WjmhIRIEyBVQ66aATH3gvEu0SJFQJUvLsZJCaScNHgvpPp
 ouu0gRTipAmosdev9T6n3r1l6hbqhq4PyLIyf+gJd2cKpyIjxGgAHMxe/0DjDivC
 siyuJEz1pCIz/FTwABhRGmAR2PHrFNBhYRYx6o/1KWeM5w+ySaffhDm74xMFB+9o
 VR8QqQSX17HIlP4VDDu1z+mF/NC1jBLGdEAK2DNIrJIeboa0xHAtFdybLlRXoStF
 5BgeU6NFdgnJdK/4Ts2vFI5JEUnpQ/RHw4fuYAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=JNODO0
 2r/yDofJEoGhu5D4RQF+y7J/VzDpXDdeazVjM=; b=GuZw5y4b+wzqnBgJIAgoQa
 JqfRrkoD4YNjgRXGPuon/v39huBUySQYQ9j7jDFy7B1wBrXf6P66Lx04FkbQqqeC
 hExXeqDEX3YvB/5/o/D3elxhcrYQ4ei009vS1OJX/l14byhoCZ3wQtw8MHqXwrZD
 Zo4IWqPCy9Q+zBX6p6f+MEivsx9BzynwWnT7FDuatlkmkDttrD5+V1/VutSavP4Q
 raTJxOl0TgABa47Jc8jMj0ZEF9TK5DMWI80XzR8e83eVConvoYXT23I1FegeSMAd
 8FPYIrn8Dcbsjlf703HRIZwv1q1Jb0Dl1sygvrVrCb9qq6PtY7ULM4C1GpaAxJ3w
 ==
X-ME-Sender: <xms:XqG7XZFCjDHUuqDtW9canOKN9PIOQX7ER3SKRrDMZyFM6OOFWfjEIQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtiedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:XqG7XUrh8AzWJuf7Jke06SMFyEnUeBPHdySIH0jbH0F9IxGnk0rmZA>
 <xmx:XqG7XX2_aN8EMgMHmOGSRjfp4q4Lruz5Qf77MCXr9QIdVpkdFjb0WA>
 <xmx:XqG7XdtOlyAMQXRb-StjpoL0WIOgfrS3YKIjah4WHgI51YS5p1deLA>
 <xmx:YKG7XZAFsKSIiwVFX5wz2RvnoCmTyP6jp2FfjnWChkRNVE-DtfQVGA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A5D17E00A3; Thu, 31 Oct 2019 23:07:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-509-ge3ec61c-fmstable-20191030v1
Mime-Version: 1.0
Message-Id: <e9bd5891-8a4d-4501-a5b1-9d6651f109a1@www.fastmail.com>
In-Reply-To: <20191031053625.422-7-joel@jms.id.au>
References: <20191031053625.422-1-joel@jms.id.au>
 <20191031053625.422-7-joel@jms.id.au>
Date: Fri, 01 Nov 2019 13:38:16 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "Jeremy Kerr" <jk@ozlabs.org>
Subject: Re: [PATCH linux dev-5.3 v2 6/8] fsi: aspeed: Fix link enable
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



On Thu, 31 Oct 2019, at 16:06, Joel Stanley wrote:
> Link enable was saving the value of the write to result, which was
> not checked. It should either have been ignoring the result of the
> write, or erroring out if it failed. This chose to error out.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Lolled-by^W

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  drivers/fsi/fsi-master-aspeed.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/fsi/fsi-master-aspeed.c 
> b/drivers/fsi/fsi-master-aspeed.c
> index 8f757eaa6a55..ee760e84c576 100644
> --- a/drivers/fsi/fsi-master-aspeed.c
> +++ b/drivers/fsi/fsi-master-aspeed.c
> @@ -344,7 +344,9 @@ static int aspeed_master_link_enable(struct 
> fsi_master *master, int link)
>  
>  	reg = cpu_to_be32(0x80000000 >> bit);
>  
> -	result = opb_writel(aspeed, ctrl_base + FSI_MSENP0 + (4 * idx), reg);
> +	ret = opb_writel(aspeed, ctrl_base + FSI_MSENP0 + (4 * idx), reg);
> +	if (ret)
> +		return ret;
