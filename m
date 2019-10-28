Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C76FE77EA
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 18:56:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4722TV65WPzDr2c
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 04:56:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4722SK6nKPzDrdF;
 Tue, 29 Oct 2019 04:55:28 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Oct 2019 10:55:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,240,1569308400"; d="scan'208";a="211502982"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148])
 ([10.7.153.148])
 by orsmga002.jf.intel.com with ESMTP; 28 Oct 2019 10:55:24 -0700
Subject: Re: [PATCH v3] media: aspeed-video: Fix memory leaks in
 aspeed_video_probe
To: Navid Emamdoost <navid.emamdoost@gmail.com>
References: <da959329-aa40-b6e7-dcc9-48183a8da716@linux.intel.com>
 <20191028171838.28533-1-navid.emamdoost@gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <57550f1e-87b8-79c4-b1d6-7672b1ce11dc@linux.intel.com>
Date: Mon, 28 Oct 2019 10:55:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191028171838.28533-1-navid.emamdoost@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 kjlu@umn.edu, openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>,
 linux-kernel@vger.kernel.org, emamd001@umn.edu, smccaman@umn.edu,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/28/2019 10:18 AM, Navid Emamdoost wrote:
> In the implementation of aspeed_video_probe() the allocated memory for
> video should be released if either devm_ioremap_resource()
> or aspeed_video_init() or aspeed_video_setup_video() fails. Replace
> kzalloc() with devm_kzalloc to avoid explicit release for video.
> 
> Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> ---
> Changes in v3:
> 	-- fix call to devm_kzalloc()

Better keep all change history at here.

> ---
>   drivers/media/platform/aspeed-video.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index eb12f3793062..70797b41447c 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -1646,7 +1646,8 @@ static int aspeed_video_probe(struct platform_device *pdev)
>   {
>   	int rc;
>   	struct resource *res;
> -	struct aspeed_video *video = kzalloc(sizeof(*video), GFP_KERNEL);
> +	struct aspeed_video *video =
> +		devm_kzalloc(&pdev->dev, sizeof(*video), GFP_KERNEL);

For a case of assignment in definition section, let it go over the 80
chars.

With this fixed:

Reviewed-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

>   	if (!video)
>   		return -ENOMEM;
> 
