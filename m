Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DBAA3EFD1
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2025 10:18:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yzl1B74DVz3cVL
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2025 20:18:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740129515;
	cv=none; b=fkUJkwixZYWl5Bc711YoF7FEwMuwUiPa1+YtJ4tytd9c7g4Ae5zRs6G4W9NFFjsnRBgR6n/AMtrl9RNM0MjiEnEUt2U1T2JNPQJb2t8NcV3tF5U7LeVxs6FRwo0sb4AdLTN8CcDnVxTT0Vg9WdFpgov/4Xoyi1bp7f1qWIP4AApreJDXOZM5AoEVNgi2faKV9p0jA4brr4WoS2cKKOOSIWINx/alFORt9vT1KLa1oFJORrjtKeBNxE64Az47KQTlTcvtXc+Sk2rZypBZSjsIgpRu/2xrATQ/8HamlNCoz+HhM/looEBVaNA6IujFGMi/Y86pK0j6M4KSh/ZrEX4iIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740129515; c=relaxed/relaxed;
	bh=qxfg9hnxLXfVIhnOkgJQAJUJ6yKhNH3nT/uZPKBrOxU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Eas4HPCWWC2Zplw/u/HbaxxtPWHkvT6GK3NThY7AFcDD6TIqREmmFjigEpnS9RMgvbenALvbq89VzVXrWFXAG6tRxEC2BeU2FYPTtt7ByH6NVJ5LQyJMjnQ1sVnS4B63XsST0u3poB0wiUBkIGyfpmpQriKhxjpnFIKWS8GHul9nUNMoDBMLktA2IXBqSY7CngRCR62ezmMv8iOsjLuNgE9VyalYI9/1e487C529Cj68l8oSPwTCyXhGgJMDrNXBngD8dsYAvk6/176P7mLzUc3Au6pQMmlRSSu632EB0prK2DuCsm6Hs32+H3K3huWhafIB7jON6c+TuVGewKTzOg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=xs4all.nl; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=g8c/=vm=xs4all.nl=hverkuil@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=xs4all.nl
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=g8c/=vm=xs4all.nl=hverkuil@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yzl1618Hcz30Tf
	for <openbmc@lists.ozlabs.org>; Fri, 21 Feb 2025 20:18:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 32B695C2710;
	Fri, 21 Feb 2025 09:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5163C4CED6;
	Fri, 21 Feb 2025 09:18:28 +0000 (UTC)
Message-ID: <dffc8e0b-2603-4e7e-ba64-15691c11ff7e@xs4all.nl>
Date: Fri, 21 Feb 2025 10:18:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: nuvoton: Fix reference handling of ece_pdev
From: Hans Verkuil <hverkuil@xs4all.nl>
To: Ricardo Ribalda <ribalda@chromium.org>, Joseph Liu <kwliu@nuvoton.com>,
 Marvin Lin <kflin@nuvoton.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20250121-nuvoton-v1-0-1ea4f0cdbda2@chromium.org>
 <20250121-nuvoton-v1-1-1ea4f0cdbda2@chromium.org>
 <df5693d0-7747-4423-809e-ae081c9aae92@xs4all.nl>
Content-Language: en-US, nl
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <df5693d0-7747-4423-809e-ae081c9aae92@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: openbmc@lists.ozlabs.org, Marvin Lin <milkfafa@gmail.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 21/02/2025 10:04, Hans Verkuil wrote:
> Hi Ricardo,
> 
> On 21/01/2025 22:14, Ricardo Ribalda wrote:
>> When we obtain a reference to of a platform_device, we need to release
>> it via put_device.
>>
>> Found by cocci:
>> ./platform/nuvoton/npcm-video.c:1677:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
>> ./platform/nuvoton/npcm-video.c:1684:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
>> ./platform/nuvoton/npcm-video.c:1690:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
>> ./platform/nuvoton/npcm-video.c:1694:1-7: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
> 
> This driver uses this construct:
> 
>                 struct device *ece_dev __free(put_device) = &ece_pdev->dev;
> 
> to automatically call put_device. So this patch would 'put' the device twice.
> 
> Does cocci understand constructs like this? If I hadn't looked closely at the
> code first, I would just have merged it.

Oh wait, now that I am reading the following patches I see that it was those later
patches that add the __free code.

This is far too confusing. Please post a v2 that just combines the 'fix references'
and 'use cleanup.h macros' in a single patch. It makes no sense to have this two-phase
approach.

Regards,

	Hans

> 
> Regards,
> 
> 	Hans
> 
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 46c15a4ff1f4 ("media: nuvoton: Add driver for NPCM video capture and encoding engine")
>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>> ---
>>  drivers/media/platform/nuvoton/npcm-video.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
>> index 024cd8ee1709..7b4c23dbe709 100644
>> --- a/drivers/media/platform/nuvoton/npcm-video.c
>> +++ b/drivers/media/platform/nuvoton/npcm-video.c
>> @@ -1673,6 +1673,7 @@ static int npcm_video_ece_init(struct npcm_video *video)
>>  
>>  		regs = devm_platform_ioremap_resource(ece_pdev, 0);
>>  		if (IS_ERR(regs)) {
>> +			put_device(&ece_pdev->dev);
>>  			dev_err(dev, "Failed to parse ECE reg in DTS\n");
>>  			return PTR_ERR(regs);
>>  		}
>> @@ -1680,11 +1681,13 @@ static int npcm_video_ece_init(struct npcm_video *video)
>>  		video->ece.regmap = devm_regmap_init_mmio(dev, regs,
>>  							  &npcm_video_ece_regmap_cfg);
>>  		if (IS_ERR(video->ece.regmap)) {
>> +			put_device(&ece_pdev->dev);
>>  			dev_err(dev, "Failed to initialize ECE regmap\n");
>>  			return PTR_ERR(video->ece.regmap);
>>  		}
>>  
>>  		video->ece.reset = devm_reset_control_get(&ece_pdev->dev, NULL);
>> +		put_device(&ece_pdev->dev);
>>  		if (IS_ERR(video->ece.reset)) {
>>  			dev_err(dev, "Failed to get ECE reset control in DTS\n");
>>  			return PTR_ERR(video->ece.reset);
>>
> 
> 

