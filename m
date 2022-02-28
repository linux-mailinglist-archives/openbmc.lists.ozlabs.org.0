Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 692694C64D4
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 09:24:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6YMT3rCpz30N0
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 19:24:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=Z5obv454;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=Z5obv454; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6YM23hNXz2xrm
 for <openbmc@lists.ozlabs.org>; Mon, 28 Feb 2022 19:24:14 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net
 [174.21.187.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 30F91185;
 Mon, 28 Feb 2022 00:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1646036651;
 bh=nnBN0dGrBVyqWTSRs7wxqWLOPD9yMdE1ClJpxLloK24=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z5obv454FzMLve6yKLSFEJ65pf1vEvmMRk112EdsRcl1PXOg/EgUAxkBtOCliMhW7
 XoUkl096b9oO2nGCait93mHXdMCWqTiCA2KslzcfY04A9CpuWgODXzg3oM8jgE4A/R
 xzbIf70iH/hNL9AcQOvn8eKrFiH0s5McgsJ8tb2M=
Date: Mon, 28 Feb 2022 00:24:07 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/5] hwmon: (nct6775) Rearrange attr-group initialization
Message-ID: <YhyGp0zu9OBOWt/M@hatter.bewilderbeest.net>
References: <20220226133047.6226-1-zev@bewilderbeest.net>
 <20220226133047.6226-2-zev@bewilderbeest.net>
 <b4a1d4e1-a7b9-00f9-75d2-56003138883f@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <b4a1d4e1-a7b9-00f9-75d2-56003138883f@roeck-us.net>
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
Cc: linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org,
 Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org,
 Renze Nicolai <renze@rnplus.nl>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Feb 27, 2022 at 07:01:32AM PST, Guenter Roeck wrote:
>On 2/26/22 05:30, Zev Weiss wrote:
>>We now track the number of attribute groups in nct6775_data, as a
>>measure to simplify handling differences in the set of enabled
>>attribute groups between nct6775 drivers (platform & i2c).  As a side
>>effect, we also reduce the amount of IS_ERR()/PTR_ERR() boilerplate a
>>bit.
>>
>>Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>>---
>>  drivers/hwmon/nct6775.c | 84 ++++++++++++++++++++---------------------
>>  1 file changed, 42 insertions(+), 42 deletions(-)
>>
>>diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
>>index 2b91f7e05126..139b2fe5ca4d 100644
>>--- a/drivers/hwmon/nct6775.c
>>+++ b/drivers/hwmon/nct6775.c
>>@@ -1198,6 +1198,7 @@ struct nct6775_data {
>>  	const char *name;
>>  	const struct attribute_group *groups[7];
>>+	u8 num_groups;
>>  	u16 reg_temp[5][NUM_TEMP]; /* 0=temp, 1=temp_over, 2=temp_hyst,
>>  				    * 3=temp_crit, 4=temp_lcrit
>>@@ -1405,10 +1406,18 @@ struct sensor_template_group {
>>  	int base;
>>  };
>>-static struct attribute_group *
>>-nct6775_create_attr_group(struct device *dev,
>>-			  const struct sensor_template_group *tg,
>>-			  int repeat)
>>+static int nct6775_add_attr_group(struct nct6775_data *data, const struct attribute_group *group)
>>+{
>>+	/* Need to leave a NULL terminator at the end of data->groups */
>>+	if (WARN_ON(data->num_groups == ARRAY_SIZE(data->groups) - 1))
>>+		return -ENOSPC;
>>+
>
>At work we are struggling with a whopping 500,000+ (!) WARN backtraces
>_each day_. I would be happy if you send me patches removing some of
>those, but I am not inclined to accept patches adding them. If people
>don't notice that the driver doesn't load, they won't notice the warning
>either, and it will just add to all the other warning backtrace noise.
>

Okay, I can remove that -- I mostly just added it out of concern that 
"no space left on device" would be a fairly confusing error for someone 
to potentially end up with modprobe reporting, and some further 
indication of what went wrong could perhaps make it less mystifying 
(though yes, with any luck it can hopefully remain unreachable in 
practice as long as data->groups gets expanded when needed).

I'd certainly also be open to suggestions of a more appropriate errno 
value to return in that case, though I couldn't find one that seemed 
clearly better to me.  ENOMEM seemed vaguely more appropriate in some 
ways given that it's an in-memory array that's full rather than a 
storage device, but it's also definitely not the usual ENOMEM meaning of 
a dynamic allocation failure due to memory pressure, so...(shrug).  I 
think FreedBSD's got an EDOOFUS errno value, but as far as I can see 
Linux doesn't have one for indicating a purely internal error like this.


Thanks,
Zev

