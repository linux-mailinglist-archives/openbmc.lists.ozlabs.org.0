Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B459C700
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2019 03:32:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46GvdK25S3zDqNN
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2019 11:32:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ArrOsJbq"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="AbT9WAIJ"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Gvcg42zjzDqBl;
 Mon, 26 Aug 2019 11:32:03 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 9612039E;
 Sun, 25 Aug 2019 21:32:00 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 25 Aug 2019 21:32:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=GQy9HXGKBleVZguowV/+z3W+P9jSPkD
 lUZyUbUOI3MQ=; b=ArrOsJbq1b1aUx1WRMwKSoeZtJW1HmVpiiDf6P773HnPNyS
 cnXrvx7M0QFUG591al+NS4RD/jyl/I15ZbAqIoFdvlsSXh8Lw5GUVM3BsXSuAuI8
 h1PI0zhNozJHSAhyy2cZkYWY1hOHYg5OyvMpM5/973YxNEEcxKDoe5hndNL3o4Tw
 nmJk8nPfJgJNNH0EusawWmmgSa3OuinCzIje7N2bmaM2QTxjKSC9Fh1Tumg+klQC
 Bib1Sqr6NAJ34bS5wA8HPMkQZhoUwhl5Uew7zz7DAYDOfcelxCENwAUYu2j+vXWu
 pIyjeowXHJIIXBaERukCSUolZEUTofhpvTZ/FsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=GQy9HX
 GKBleVZguowV/+z3W+P9jSPkDlUZyUbUOI3MQ=; b=AbT9WAIJKJpiYR/fWC3eiD
 FFNskaxsxJXacirhFwmeANOQ11K0HyoO5UslpymcdnFd7AjXt3qr/pn+YsBNKht9
 O0Nzh184cFZ0GWGLbWXh2lXTGW47LuJhwiG4dXJB02LBxiPK+FMOBF0bapeqLCqr
 iRmvbgis5Dm/gvjEYqA1+jiAcdhxtaLhZm7hawvepZCbczZQfsOjbhXfRwmJ9wDx
 WDvtPFkjKyoAz5LEvNb29dUTrlGTigtf1ZGIzueMeLBnpzHFJcc07okjUlCmgvHC
 BrC0Vc0lmx2UAf/FcmPYdA64/exI6MdRPeoOPgbtQWIDYITv4YjzBGOVlvqpN9TA
 ==
X-ME-Sender: <xms:jjZjXQaQoAKLZtRZpOcz71-Kz-rmHzSd8kA4Oc3-FFk4-Q_wlBTb9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudehfedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:jjZjXRYuTTIg_vp0l4bq8Fy1NHLyytS7OiQwPF0RqdIURjRdtYMw4g>
 <xmx:jjZjXVzMTOb6vHjfuvx0tEvjjNF9ZZDq5PVz8aiq8oGmKO3y0frygQ>
 <xmx:jjZjXde7j_0jZdm--XMEXaGE4gEU0H9DbQIyUZsGLLNPq2zv0GEWtQ>
 <xmx:kDZjXfKz5t6OblkKf3AJy3PvdFtm26e1vjvP1qD1_Vl9JYX85c_HlQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5EA86E00A3; Sun, 25 Aug 2019 21:31:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-916-g49fca03-fmstable-20190821v7
Mime-Version: 1.0
Message-Id: <588f6cbd-b6ca-4f43-8034-80956ee56bb8@www.fastmail.com>
In-Reply-To: <20190823212957.26043-1-jae.hyun.yoo@linux.intel.com>
References: <20190823212957.26043-1-jae.hyun.yoo@linux.intel.com>
Date: Mon, 26 Aug 2019 11:02:19 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jae Hyun Yoo" <jae.hyun.yoo@linux.intel.com>,
 "Eddie James" <eajames@linux.ibm.com>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Joel Stanley" <joel@jms.id.au>,
 "Benjamin Herrenschmidt" <benh@kernel.crashing.org>
Subject: =?UTF-8?Q?Re:_[PATCH]_media:_aspeed:_fix_an_incorrect_return_code_on_buf?=
 =?UTF-8?Q?fer_allocation_failure?=
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
Cc: openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org,
 linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Sat, 24 Aug 2019, at 07:00, Jae Hyun Yoo wrote:
> It returns '0' even when a failure happens on jpeg buffer allocation
> so this commit fixes the issue.
> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  drivers/media/platform/aspeed-video.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/aspeed-video.c 
> b/drivers/media/platform/aspeed-video.c
> index f899ac3b4a61..94f97d96dabc 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -1624,6 +1624,7 @@ static int aspeed_video_init(struct aspeed_video 
> *video)
>  	if (!aspeed_video_alloc_buf(video, &video->jpeg,
>  				    VE_JPEG_HEADER_SIZE)) {
>  		dev_err(dev, "Failed to allocate DMA for JPEG header\n");
> +		rc = -ENOMEM;
>  		goto err_release_reserved_mem;
>  	}
>  
> -- 
> 2.7.4
> 
>
