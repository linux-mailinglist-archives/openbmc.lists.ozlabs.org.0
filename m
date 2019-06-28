Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 44225595D2
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 10:13:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZqJw5WtszDqtd
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 18:13:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZqJM0YTmzDqsC
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2019 18:12:50 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x5S8CgMW009395;
 Fri, 28 Jun 2019 03:12:44 -0500
Message-ID: <07512e672f1a290d68a09a0520b7e5f586ee8db1.camel@kernel.crashing.org>
Subject: Re: [PATCH] fsi/core: Fix error paths on CFAM init
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Jeremy Kerr <jk@ozlabs.org>, openbmc@lists.ozlabs.org, Lei YU
 <mine260309@gmail.com>
Date: Fri, 28 Jun 2019 18:12:42 +1000
In-Reply-To: <20190628064139.17408-1-jk@ozlabs.org>
References: <20190628064139.17408-1-jk@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 2019-06-28 at 14:41 +0800, Jeremy Kerr wrote:
> Change d1dcd67825 re-worked the struct fsi_slave initialisation in
> fsi_slave_init, but introduced a few inconsitencies: the slave->dev
> is
> now registered through cdev_device_add, but we may kfree() the device
> out from underneath the cdev registration. We may also leave an IDA
> allocated.
> 
> This change fixes the error paths, so that we kfree() only before the
> device is registered with the core code. We also move the smode write
> to
> before we start creating proper devices, as it's the most likely to
> fail. We also remove the IDA-allocated minor on error, and properly
> clean up the of_node.
> 
> Fixes: d1dcd678257603e71cf3f3d84c70e2b6f0f14bb8
> Reported-by: Lei YU <mine260309@gmail.com>
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> ---

You want to take maintainership of drivers/fsi ? :-)

> 
> Lei: Can you test this on your hardware? Thanks!
> 
> ---
>  drivers/fsi/fsi-core.c | 34 +++++++++++++++++++++-------------
>  1 file changed, 21 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
> index 1d83f3ba478b..9ba5e19d1c42 100644
> --- a/drivers/fsi/fsi-core.c
> +++ b/drivers/fsi/fsi-core.c
> @@ -1029,6 +1029,14 @@ static int fsi_slave_init(struct fsi_master
> *master, int link, uint8_t id)
>  
>  	}
>  
> +	rc = fsi_slave_set_smode(slave);
> +	if (rc) {
> +		dev_warn(&master->dev,
> +				"can't set smode on slave:%02x:%02x
> %d\n",
> +				link, id, rc);
> +		goto err_free;
> +	}
> +
>  	/* Allocate a minor in the FSI space */
>  	rc = __fsi_get_new_minor(slave, fsi_dev_cfam, &slave->dev.devt,
>  				 &slave->cdev_idx);
> @@ -1040,17 +1048,14 @@ static int fsi_slave_init(struct fsi_master
> *master, int link, uint8_t id)
>  	rc = cdev_device_add(&slave->cdev, &slave->dev);
>  	if (rc) {
>  		dev_err(&slave->dev, "Error %d creating slave
> device\n", rc);
> -		goto err_free;
> +		goto err_free_ida;
>  	}
>  
> -	rc = fsi_slave_set_smode(slave);
> -	if (rc) {
> -		dev_warn(&master->dev,
> -				"can't set smode on slave:%02x:%02x
> %d\n",
> -				link, id, rc);
> -		kfree(slave);
> -		return -ENODEV;
> -	}
> +	/* Now that we have the cdev registered with the core, any
> fatal
> +	 * failures beyond this point will need to clean up through
> +	 * cdev_device_del(). Fortunately though, nothing past here is
> fatal.
> +	 */
> +
>  	if (master->link_config)
>  		master->link_config(master, link,
>  				    slave->t_send_delay,
> @@ -1067,11 +1072,14 @@ static int fsi_slave_init(struct fsi_master
> *master, int link, uint8_t id)
>  		dev_dbg(&master->dev, "failed during slave scan with:
> %d\n",
>  				rc);
>  
> -	return rc;
> +	return 0;
>  
> - err_free:
> -	put_device(&slave->dev);
> -	return rc;
> +err_free_ida:
> +	fsi_free_minor(slave->dev.devt);
> +err_free:
> +	of_node_put(slave->dev.of_node);
> +	kfree(slave);
> +	return rc
>  }
>  
>  /* FSI master support */

