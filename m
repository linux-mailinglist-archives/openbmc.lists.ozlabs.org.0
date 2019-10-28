Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB36E772C
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 18:02:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4721H84CsNzDrdZ
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 04:02:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4721GF6pL4zDrRr;
 Tue, 29 Oct 2019 04:01:40 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Oct 2019 10:01:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,240,1569308400"; d="scan'208";a="211488272"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148])
 ([10.7.153.148])
 by orsmga002.jf.intel.com with ESMTP; 28 Oct 2019 10:01:19 -0700
Subject: Re: [PATCH v2] media: aspeed-video: Fix memory leaks in
 aspeed_video_probe
To: Navid Emamdoost <navid.emamdoost@gmail.com>
References: <d9c04318-586a-bfc2-fce6-6218c6bab1d6@linux.intel.com>
 <20191028165827.24949-1-navid.emamdoost@gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <6450dbb4-aa6f-627d-7e5d-21a20f560d60@linux.intel.com>
Date: Mon, 28 Oct 2019 10:01:19 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191028165827.24949-1-navid.emamdoost@gmail.com>
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

On 10/28/2019 9:58 AM, Navid Emamdoost wrote:
> In the implementation of aspeed_video_probe() the allocated memory for
> video should be released if either devm_ioremap_resource()
> or aspeed_video_init() or aspeed_video_setup_video() fails. Replace
> kzalloc() with devm_kzalloc to avoid explicit release for video.
> 
> Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> ---
> Changes in v2:
> 	-- replace kzalloc with devm_kzalloc based on Jae Hyun Yoo
> suggestion
> 
>   drivers/media/platform/aspeed-video.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index eb12f3793062..2aa8ea2f9824 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -1646,7 +1646,7 @@ static int aspeed_video_probe(struct platform_device *pdev)
>   {
>   	int rc;
>   	struct resource *res;
> -	struct aspeed_video *video = kzalloc(sizeof(*video), GFP_KERNEL);
> +	struct aspeed_video *video = devm_kzalloc(sizeof(*video), GFP_KERNEL);

It can't be compiled. devm_kzalloc should have 3 parameters.

Cheers,

Jae
