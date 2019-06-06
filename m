Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D2236A22
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 04:46:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45K95b0SKDzDqfy
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 12:46:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45K9566ySTzDqdX
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jun 2019 12:45:45 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Jun 2019 19:45:42 -0700
X-ExtLoop1: 1
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.254.36.100])
 ([10.254.36.100])
 by fmsmga006.fm.intel.com with ESMTP; 05 Jun 2019 19:45:42 -0700
Subject: Re: ikvm gadget usb_ep_queue error when the hostOS reboot
To: xiuzhi <1450335857@qq.com>, openbmc <openbmc@lists.ozlabs.org>,
 eajames <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
 "Andrew.Jeffery" <andrew@aj.id.au>
References: <tencent_6F8069FB02E8C854660BE3B0@qq.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <9d03c1b8-914f-bc28-4035-17738c0622bb@linux.intel.com>
Date: Wed, 5 Jun 2019 19:45:42 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <tencent_6F8069FB02E8C854660BE3B0@qq.com>
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

On 6/5/2019 7:07 PM, xiuzhi wrote:
> Hi Jae,
>     The bmc serial port will print an  usb_ep_queue errors when reboot 
> the hostOS.
> I can reproduce it by the following steps:
> 1, Login the bmc webpage ,open the kvm webpage.
> 2, reboot the host OS
> 3,  Bmc  Serial port will print error messages:
> [  680.786134] aspeed-video 1e700000.video: Timed out; first mode detect
> [  681.846125] aspeed-video 1e700000.video: Timed out when stopping 
> streaming
> [  682.356106] aspeed-video 1e700000.video: Timed out; first mode detect

Looks like you didn't apply this patch:
https://lists.ozlabs.org/pipermail/openbmc/2019-May/016177.html

> [  682.377294] configfs-gadget gadget: usb_ep_queue error on int 
> endpoint -108

This is expected because ikvm service will keep sending keyboard and
mouse events to host but host disconnects the usb connection while host
rebooting. This message is ignorable but if you want to disable printing
out of this message in the case, use this:
https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-common/recipes-kernel/linux/linux-aspeed/0049-Suppress-excessive-HID-gadget-error-logs.patch

Thanks,
Jae

> [  682.896212] aspeed-video 1e700000.video: Timed out; first mode detect
> [  684.917892] configfs-gadget gadget: usb_ep_queue error on int 
> endpoint -108
> [  685.426159] aspeed-video 1e700000.video: Timed out; first mode detect
> 4, It will stop the error output when the hostOS start to bootup.[  
> 739.598840] configfs-gadgetgadget: high-speed config #1: c              
>        [  739.629961] aspeed_vhub 1e6a0000.usb-vhub: status direction 
> mismatch
> 
> Does this output make sense?
> Best,
> Xiuzhi
> ------------------ Original ------------------
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
>           size *= 4;
> 
> -       if (size == video->srcs[0].size / 2) {
> -               aspeed_video_write(video, VE_SRC1_ADDR,
> -                                  video->srcs[0].dma + size);
> -       } else if (size == video->srcs[0].size) {
> -               if (!aspeed_video_alloc_buf(video, &video->srcs[1], size))
> -                       goto err_mem;
> -
> -               aspeed_video_write(video, VE_SRC1_ADDR, video->srcs[1].dma);
> -       } else {
> -               aspeed_video_free_buf(video, &video->srcs[0]);
> +       if (size != video->srcs[0].size) {
> +               if (video->srcs[0].size)
> +                       aspeed_video_free_buf(video, &video->srcs[0]);
> +               if (video->srcs[1].size)
> +                       aspeed_video_free_buf(video, &video->srcs[1]);
> 
>                   if (!aspeed_video_alloc_buf(video, &video->srcs[0], size))
>                           goto err_mem;
> -
>                   if (!aspeed_video_alloc_buf(video, &video->srcs[1], size))
>                           goto err_mem;
> 
