Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CBE64CD14
	for <lists+openbmc@lfdr.de>; Wed, 14 Dec 2022 16:31:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXK8p0NxNz3cFw
	for <lists+openbmc@lfdr.de>; Thu, 15 Dec 2022 02:31:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=netrider.rowland.org (client-ip=192.131.102.5; helo=netrider.rowland.org; envelope-from=stern+638bab0c@netrider.rowland.org; receiver=<UNKNOWN>)
X-Greylist: delayed 396 seconds by postgrey-1.36 at boromir; Thu, 15 Dec 2022 02:31:19 AEDT
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lists.ozlabs.org (Postfix) with SMTP id 4NXK8R6Sbrz3bjv
	for <openbmc@lists.ozlabs.org>; Thu, 15 Dec 2022 02:31:19 +1100 (AEDT)
Received: (qmail 927728 invoked by uid 1000); 14 Dec 2022 10:24:37 -0500
Date: Wed, 14 Dec 2022 10:24:37 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
Subject: Re: [PATCH] USB: gadget: Add ID numbers to configfs-gadget driver
 names
Message-ID: <Y5nqtYa9yC8YY839@rowland.harvard.edu>
References: <20221213041203.21080-1-chanh@os.amperecomputing.com>
 <720b814d-5102-04d3-4938-33a25e87a46d@wanadoo.fr>
 <6044a542-fbcd-0fe7-abd3-83f38b731ecc@amperemail.onmicrosoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6044a542-fbcd-0fe7-abd3-83f38b731ecc@amperemail.onmicrosoft.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-usb@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, Dan Vacura <w36195@motorola.com>, Vijayavardhan Vennapusa <vvreddy@codeaurora.org>, Rondreis <linhaoguo86@gmail.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Jakob Koschel <jakobkoschel@gmail.com>, Open Source Submission <patches@amperecomputing.com>, Chanh Nguyen <chanh@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Dec 14, 2022 at 11:15:48AM +0700, Chanh Nguyen wrote:

> Thanks CJ for the review!
> 
> I've made some changes as below (in gadgets_make() to remove unnecessary
> variables) and now trying to test it as much as possible. Will re-post it as
> v2 if looks good soon.
> 
> static inline struct gadget_info *to_gadget_info(struct config_item *item)
> @@ -1623,13 +1629,25 @@ static struct config_group *gadgets_make(
> 
>      gi->composite.gadget_driver = configfs_driver_template;
> 
> +    gi->driver_id_number = ida_alloc(&driver_id_numbers, GFP_KERNEL);
> +    if (gi->driver_id_number < 0)
> +        goto err;
> +
> +    gi->composite.gadget_driver.driver.name =
> +                          kasprintf(GFP_KERNEL, "configfs-gadget.%d",
> +                                    gi->driver_id_number);
> +    if (!gi->composite.gadget_driver.driver.name)
> +        goto out_free_driver_id_number;
> +
>      gi->composite.gadget_driver.function = kstrdup(name, GFP_KERNEL);
>      gi->composite.name = gi->composite.gadget_driver.function;
> 
>      if (!gi->composite.gadget_driver.function)
> -        goto err;
> +        goto out_free_driver_id_number;

This should goto out_free_driver_name.

Alan Stern

> 
>      return &gi->group;
> +
> +out_free_driver_id_number:
> +    ida_free(&driver_id_numbers, gi->driver_id_number);
>  err:
>      kfree(gi);
>      return ERR_PTR(-ENOMEM);
