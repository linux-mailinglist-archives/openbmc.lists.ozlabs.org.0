Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB35337CD
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2019 20:26:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Hk5Y1PTpzDqT9
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 04:26:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Hk532xlyzDqKZ
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jun 2019 04:25:41 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jun 2019 11:25:35 -0700
X-ExtLoop1: 1
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148])
 ([10.7.153.148])
 by orsmga007.jf.intel.com with ESMTP; 03 Jun 2019 11:25:35 -0700
Subject: Re: [PATCH dev-5.1 4/4] media: aspeed: add a workaround to fix
 asilicon bug (Jae Hyun Yoo)
To: xiuzhi <1450335857@qq.com>, openbmc <openbmc@lists.ozlabs.org>,
 eajames <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
 "Andrew.Jeffery" <andrew@aj.id.au>
References: <mailman.9.1558663202.24371.openbmc@lists.ozlabs.org>
 <tencent_18FB023D486815FB74809705@qq.com>
 <41494d02-452f-5a09-d29e-476c6d4e4085@linux.intel.com>
 <tencent_10A7D5E3614D49E602F427F6@qq.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <e9a3d82f-df30-6930-cb00-cdcf0bc7d4e7@linux.intel.com>
Date: Mon, 3 Jun 2019 11:25:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <tencent_10A7D5E3614D49E602F427F6@qq.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

Hi Xiuzhi,

Thanks a lot for sharing the test result. Please let us update if you
find any issue in the further test.

Regards,
Jae

On 6/1/2019 7:46 PM, xiuzhi wrote:
> Hi Jae,
>      This new  patch works very well so far,
>   I will test it more cases next week.
> Best,
> xiuzhi
> 
> 
> ------------------ Original ------------------
> *From: * "jae.hyun.yoo";<jae.hyun.yoo@linux.intel.com>;
> *Date: * Jun 1, 2019
> *To: * "xiuzhi"<1450335857@qq.com>; "openbmc"<openbmc@lists.ozlabs.org>; 
> "eajames"<eajames@linux.ibm.com>; "joel"<joel@jms.id.au>; 
> "andrew"<andrew@aj.id.au>;
> *Subject: * Re: [PATCH dev-5.1 4/4] media: aspeed: add a workaround to 
> fix asilicon bug (Jae Hyun Yoo)
> 
> On 5/31/2019 4:21 AM, xiuzhi wrote:
>  > Hi  Jae,
>  >     I tested this patch ,it works on 1680*1050,but I found an issue:
>  >
>  > The ikvm webpage will be black screen when you reboot the host after
>  > switching solution between 1680*1050 and 800*600 on chrome browser (my
>  > chrome version is 65).
>  > you can reproduce it:
>  > 1, Set host screen solution to 1680*1050 and save it . ikvm webpage works
>  > 2,Set host screen solution to 800*600 and save it. ikvm webpage works
>  > 3,Reset host screen solution to   1680*1050 and save it,
>  > 4,reboot the host,
>  > 5, the ikvm webpage is black screen when boot to Centos GUI
> 
> Hi Xiuzhi,
> 
> Checked that the issue isn't related this patch. Actually, that is
> caused by the first patch of this patch series. Since the patch removes
> source buffer allocation before mode detection, remaining allocation
> logic should be changed accordingly, otherwise it can't allocate buffers
> and eventually causes the issue. I'll fix the first patch in the next
> spin. In the meantime, you can apply below quick fix on top of what you
> tested the issue.
> 
> Thanks,
> Jae
> 
> 
> diff --git a/drivers/media/platform/aspeed-video.c
> b/drivers/media/platform/aspeed-video.c
> index c2d4a2e6f20f..034f2f436d76 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -865,20 +865,14 @@ static void aspeed_video_set_resolution(struct
> aspeed_video *video)
> 
>           size *= 4;
> 
> -       if (size == video->srcs[0].size / 2) {
> -               aspeed_video_write(video, VE_SRC1_ADDR,
> -                                  video->srcs[0].dma + size);
> -       } else if (size == video->srcs[0].size) {
> -               if (!aspeed_video_alloc_buf(video, &video->srcs[1], size))
> -                       goto err_mem;
> -
> -               aspeed_video_write(video, VE_SRC1_ADDR, video->srcs[1].dma);
> -       } else {
> -               aspeed_video_free_buf(video, &video->srcs[0]);
> +       if (size != video->srcs[0].size) {
> +               if (video->srcs[0].size)
> +                       aspeed_video_free_buf(video, &video->srcs[0]);
> +               if (video->srcs[1].size)
> +                       aspeed_video_free_buf(video, &video->srcs[1]);
> 
>                   if (!aspeed_video_alloc_buf(video, &video->srcs[0], size))
>                           goto err_mem;
> -
>                   if (!aspeed_video_alloc_buf(video, &video->srcs[1], size))
>                           goto err_mem;
> 
