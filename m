Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 968724E2224
	for <lists+openbmc@lfdr.de>; Mon, 21 Mar 2022 09:24:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMSMY3ZtSz3bW6
	for <lists+openbmc@lfdr.de>; Mon, 21 Mar 2022 19:24:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ps2bUPVP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=ps2bUPVP; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMSJg75K2z30Qv
 for <openbmc@lists.ozlabs.org>; Mon, 21 Mar 2022 19:21:55 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C6E1C610D5;
 Mon, 21 Mar 2022 08:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72016C340E8;
 Mon, 21 Mar 2022 08:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1647850913;
 bh=W7j35n3i7ouQcxLyTwP0bCw1+grg/FGzjCKUso/dVLw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ps2bUPVPU2suvW45Df6jEflofLA9ipyAVHmyhz6mrrzwn5ZOC0u3kaXjUvM0VnV0A
 SJqHNeaWuu4NDAEKW+y6ax4aUHPgoepoVm3szvaigNDQw/resQ99+ghSzi/WihBjV3
 lCkPE0jcCykg22Xrseo9BnbSIfoUW+hbSzC2BVds=
Date: Mon, 21 Mar 2022 09:21:49 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v7 5/9] misc: smpro-misc: Add Ampere's Altra SMpro misc
 driver
Message-ID: <Yjg1nREijopyA+8A@kroah.com>
References: <20220321081355.6802-1-quan@os.amperecomputing.com>
 <20220321081355.6802-6-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220321081355.6802-6-quan@os.amperecomputing.com>
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
Cc: "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Phong Vo <phong@os.amperecomputing.com>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Thu Nguyen <thu@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Open Source Submission <patches@amperecomputing.com>,
 Lee Jones <lee.jones@linaro.org>, Derek Kiernan <derek.kiernan@xilinx.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Mar 21, 2022 at 03:13:51PM +0700, Quan Nguyen wrote:
> This commit adds driver support for accessing various information
> reported by Ampere's SMpro co-processor such as Boot Progress and
> other miscellaneous data.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>

No Documentation/ABI/ entries for your sysfs file?

> +static ssize_t boot_progress_show(struct device *dev, struct device_attribute *da, char *buf)
> +{
> +	struct smpro_misc *misc = dev_get_drvdata(dev);
> +	u32 boot_progress;
> +	u8 current_stage;
> +	u8 boot_status;
> +	u8 boot_stage;
> +	u32 select;
> +	u32 reg_lo;
> +	u32 reg;
> +	int ret;
> +
> +	/* Read current boot stage */
> +	ret = regmap_read(misc->regmap, BOOTSTAGE_CUR_STAGE, &reg);
> +	if (ret)
> +		return ret;
> +
> +	current_stage = reg & 0xff;
> +
> +	/* Read the boot progress */
> +	ret = regmap_read(misc->regmap, BOOTSTAGE_SELECT, &select);
> +	if (ret)
> +		return ret;
> +
> +	boot_stage = (select >> 8) & 0xff;
> +	boot_status = select & 0xff;
> +
> +	if (boot_stage > current_stage)
> +		return -EINVAL;
> +
> +	ret = regmap_read(misc->regmap,	BOOTSTAGE_STATUS_LO, &reg_lo);
> +	if (!ret)
> +		ret = regmap_read(misc->regmap, BOOTSTAGE_STATUS_HI, &reg);
> +	if (ret)
> +		return ret;
> +
> +	boot_progress = swab16(reg) << 16 | swab16(reg_lo);
> +
> +	/* Tell firmware to provide next boot stage next time */
> +	if (boot_stage < current_stage) {
> +		ret = regmap_write(misc->regmap, BOOTSTAGE_SELECT, ((select & 0xff00) | 0x1));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return snprintf(buf, PAGE_SIZE, "0x%02x 0x%02x 0x%08x\n",
> +			boot_stage, boot_status, boot_progress);

sysfs_emit() please.

Also, this is 3 different things, put all of these in different sysfs
files.

thanks,

greg k-h
