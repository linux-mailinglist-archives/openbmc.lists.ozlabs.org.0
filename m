Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 768D466D5EB
	for <lists+openbmc@lfdr.de>; Tue, 17 Jan 2023 07:10:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nwz532dfLz3c9Q
	for <lists+openbmc@lfdr.de>; Tue, 17 Jan 2023 17:09:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HPx1/itz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.31; helo=mga06.intel.com; envelope-from=heikki.krogerus@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HPx1/itz;
	dkim-atps=neutral
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nsx1l1Ydcz3bcw
	for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2023 18:26:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673508395; x=1705044395;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FWSr51rrfHuS4baA2E9ohsMe/O/JvSLIOHSsJj8xzPo=;
  b=HPx1/itzxMNAfokuOhI5M8weimHN9QvxQf/gxP3cyQqCqbPg/LtmpM9e
   RqhFo6vhWs1TQdVQGNogHBy7Ab2jWggkBljLs1tRuSFwRNo5iGbOECeoc
   cfRG5uxAaMd6wsKz5kUoSl4G+zNG7uMR4NUoSyoxAKDkBae3lSRQTmBL8
   GoYGwJgViXTjKKG9Tq1IYoRIOF7B/ickv4ekkZQZE/EPjcXaxay/6D7qS
   qB/qW+0Ldo6kFQHfa+injV7ISc1cyY6TW7+dhhLIHYi08eyU5IxSabaTw
   7/uNlNbQ2eyJn9LBC/Do7E065ySXYVfwfF8tEQ5uktiU37EcWTqiRAvCL
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="385948090"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; 
   d="scan'208";a="385948090"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2023 23:26:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="800104724"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; 
   d="scan'208";a="800104724"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 11 Jan 2023 23:26:25 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 12 Jan 2023 09:26:24 +0200
Date: Thu, 12 Jan 2023 09:26:24 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Chanh Nguyen <chanh@os.amperecomputing.com>
Subject: Re: [PATCH v3] USB: gadget: Add ID numbers to configfs-gadget driver
 names
Message-ID: <Y7+2ICAKlghDAem2@kuha.fi.intel.com>
References: <20230111065105.29205-1-chanh@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111065105.29205-1-chanh@os.amperecomputing.com>
X-Mailman-Approved-At: Tue, 17 Jan 2023 17:08:32 +1100
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-usb@vger.kernel.org, Frank Li <frank.li@nxp.com>, linux-kernel@vger.kernel.org, Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Dan Vacura <w36195@motorola.com>, Vijayavardhan Vennapusa <vvreddy@codeaurora.org>, Rondreis <linhaoguo86@gmail.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Jakob Koschel <jakobkoschel@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, Open Source Submission <patches@amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jan 11, 2023 at 01:51:05PM +0700, Chanh Nguyen wrote:
> It is unable to use configfs to attach more than one gadget. When
> attaching the second gadget, it always fails and the kernel message
> prints out:
> 
> Error: Driver 'configfs-gadget' is already registered, aborting...
> UDC core: g1: driver registration failed: -16
> 
> This commit fixes the problem by using the gadget name as a suffix
> to each configfs_gadget's driver name, thus making the names
> distinct.
> 
> Fixes: fc274c1e9973 ("USB: gadget: Add a new bus for gadgets")
> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>

Tested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Thanks!

> ---
> Changes in v3:
>   - Use the gadget name as a unique suffix instead     [Andrzej]
>   - Remove the driver.name allocation by template        [Chanh]
>   - Update commit message                                [Chanh]
> 
> Changes in v2:
>   - Replace scnprintf() by kasprintf() to simplify the code [CJ]
>   - Move the clean up code from gadgets_drop() to
>     gadget_info_attr_release()                        [Frank Li]
>   - Correct the resource free up in gadges_make()   [Alan Stern]
>   - Remove the unnecessary variable in gadgets_make()    [Chanh]
>   - Fixes minor grammar issue in commit message          [Chanh]
> ---
>  drivers/usb/gadget/configfs.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> index 96121d1c8df4..0853536cbf2e 100644
> --- a/drivers/usb/gadget/configfs.c
> +++ b/drivers/usb/gadget/configfs.c
> @@ -393,6 +393,7 @@ static void gadget_info_attr_release(struct config_item *item)
>  	WARN_ON(!list_empty(&gi->string_list));
>  	WARN_ON(!list_empty(&gi->available_func));
>  	kfree(gi->composite.gadget_driver.function);
> +	kfree(gi->composite.gadget_driver.driver.name);
>  	kfree(gi);
>  }
>  
> @@ -1572,7 +1573,6 @@ static const struct usb_gadget_driver configfs_driver_template = {
>  	.max_speed	= USB_SPEED_SUPER_PLUS,
>  	.driver = {
>  		.owner          = THIS_MODULE,
> -		.name		= "configfs-gadget",
>  	},
>  	.match_existing_only = 1,
>  };
> @@ -1623,13 +1623,21 @@ static struct config_group *gadgets_make(
>  
>  	gi->composite.gadget_driver = configfs_driver_template;
>  
> +	gi->composite.gadget_driver.driver.name = kasprintf(GFP_KERNEL,
> +							    "configfs-gadget.%s", name);
> +	if (!gi->composite.gadget_driver.driver.name)
> +		goto err;
> +
>  	gi->composite.gadget_driver.function = kstrdup(name, GFP_KERNEL);
>  	gi->composite.name = gi->composite.gadget_driver.function;
>  
>  	if (!gi->composite.gadget_driver.function)
> -		goto err;
> +		goto out_free_driver_name;
>  
>  	return &gi->group;
> +
> +out_free_driver_name:
> +	kfree(gi->composite.gadget_driver.driver.name);
>  err:
>  	kfree(gi);
>  	return ERR_PTR(-ENOMEM);
> -- 
> 2.17.1

-- 
heikki
