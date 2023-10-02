Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BA67B4F98
	for <lists+openbmc@lfdr.de>; Mon,  2 Oct 2023 11:55:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rzbt52VMJz3c9G
	for <lists+openbmc@lfdr.de>; Mon,  2 Oct 2023 20:55:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=simd=fq=xs4all.nl=hverkuil-cisco@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rzbsh4j2Lz2ym1;
	Mon,  2 Oct 2023 20:55:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 84F4860DFD;
	Mon,  2 Oct 2023 09:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32784C433C7;
	Mon,  2 Oct 2023 09:54:58 +0000 (UTC)
Message-ID: <907ef8a8-209e-48ec-b5ce-a3f7fe0a43d3@xs4all.nl>
Date: Mon, 2 Oct 2023 11:54:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: aspeed: Fix the NULL vs IS_ERR() bug for
 debugfs_create_file()
Content-Language: en-US, nl
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-media@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Jammy Huang <jammy_huang@aspeedtech.com>
References: <20230914033135.3760727-1-ruanjinjie@huawei.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230914033135.3760727-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 14/09/2023 05:31, Jinjie Ruan wrote:
> Since debugfs_create_file() returns ERR_PTR and never NULL, use IS_ERR() to
> check the return value.
> 
> And so return the err code based on IS_ERR instead of checking NULL.
> 
> Fixes: 52fed10ad756 ("media: aspeed: add debugfs")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/media/platform/aspeed/aspeed-video.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
> index a9c2c69b2ed9..f4e624c13d3b 100644
> --- a/drivers/media/platform/aspeed/aspeed-video.c
> +++ b/drivers/media/platform/aspeed/aspeed-video.c
> @@ -1975,10 +1975,12 @@ static int aspeed_video_debugfs_create(struct aspeed_video *video)
>  	debugfs_entry = debugfs_create_file(DEVICE_NAME, 0444, NULL,
>  					    video,
>  					    &aspeed_video_debugfs_fops);
> -	if (!debugfs_entry)
> +	if (IS_ERR(debugfs_entry)) {
>  		aspeed_video_debugfs_remove(video);
> +		return -EIO;
> +	}
>  
> -	return !debugfs_entry ? -EIO : 0;
> +	return 0;
>  }
>  #else
>  static void aspeed_video_debugfs_remove(struct aspeed_video *video) { }

Actually, standard behavior is not to check the error at all. It is not
considered a bug if creating a debugfs directory fails, you can just continue.

So rather than 'fixing' this, just drop the error check completely.

See e.g. commit 8c23f411296e ("media: sti: no need to check return value of
debugfs_create functions").

Regards,

	Hans
