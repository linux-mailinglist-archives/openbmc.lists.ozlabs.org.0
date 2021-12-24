Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 705E547ED3D
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 09:33:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JL0h12kmxz3056
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 19:33:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=eUv9EiLy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=eUv9EiLy; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JL0gX08wJz2xtL;
 Fri, 24 Dec 2021 19:32:54 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0335461FE8;
 Fri, 24 Dec 2021 08:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7584DC36AE5;
 Fri, 24 Dec 2021 08:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1640334770;
 bh=oAGJa1eQZdR4k8gaHp+oWjXb51Y31FZ01er7yJKkMOI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eUv9EiLyLp7rAXeV2DY3PM6Ci3kQf/LPxlARr3ea+c4lU8gY7hDvWmUxS0p6/3XWm
 q4w4vwFGH6Rk/InS30d/o3V5XGw7C0s4P7lCU8xHnsO65KgGJFTpUrCUndyg6YFy/1
 lmHAOe6plivc/xHjQWNEqw7aYRNmmztia9FBkrXU=
Date: Fri, 24 Dec 2021 09:32:44 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v6 6/9] misc: smpro-errmon: Add Ampere's SMpro error
 monitor driver
Message-ID: <YcWFrCjWSG65KQgb@kroah.com>
References: <20211224041352.29405-1-quan@os.amperecomputing.com>
 <20211224041352.29405-7-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211224041352.29405-7-quan@os.amperecomputing.com>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 Phong Vo <phong@os.amperecomputing.com>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, openbmc@lists.ozlabs.org,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Derek Kiernan <derek.kiernan@xilinx.com>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Arnd Bergmann <arnd@arndb.de>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Rob Herring <robh+dt@kernel.org>,
 Open Source Submission <patches@amperecomputing.com>,
 linux-hwmon@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Dec 24, 2021 at 11:13:49AM +0700, Quan Nguyen wrote:
> This commit adds Ampere's SMpro error monitor driver for monitoring
> and reporting RAS-related errors as reported by SMpro co-processor
> found on Ampere's Altra processor family.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> Change in v6:
>   + First introduced in v6 [Quan]
> 
>  drivers/mfd/smpro-mfd.c     |   1 +
>  drivers/misc/Kconfig        |   7 +
>  drivers/misc/Makefile       |   1 +
>  drivers/misc/smpro-errmon.c | 571 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 580 insertions(+)
>  create mode 100644 drivers/misc/smpro-errmon.c

You need Documentation/ABI/ updates when you add sysfs files.  Please do
that for your next version of this patch.

Also remember that sysfs is only "one value per file", this driver seems
to violate that in huge ways and is not ok.

thanks,

greg k-h
