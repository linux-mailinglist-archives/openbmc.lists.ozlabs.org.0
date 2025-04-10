Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 918A9A84780
	for <lists+openbmc@lfdr.de>; Thu, 10 Apr 2025 17:15:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYNfm2tw6z3cWS
	for <lists+openbmc@lfdr.de>; Fri, 11 Apr 2025 01:15:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744298125;
	cv=none; b=GBGZ1EYA11We8aTc4dfcySjj+MIyKLLD5GDCOsSZlgHFZPAqXoyi5Qca86pzN8U0PFnxD5zvR9FDYUhBsDm43U92hJFn5KK2EjjfZZdp1loEFQZdzDuOeF9Mb1XrXmBrkHNvLwgMQU50x24F4SZ4mbsxTjqxEhSc+MmfzDPE32C057zvpi/sOhtpDW7LeBW5wSmEWg5H6azXrt4zFfY68JqdO5y3Xp7fn1V52v6RD1zLSuz7qddgVmgPWBSIXJF39ptmMmkpvleF6wkg9mRs/oP3FLjD56LFcUQcyqNOhfX6MdBP3g5IeLhVklWxhpz8wrUHGP60PWnXnnA8V4DYfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744298125; c=relaxed/relaxed;
	bh=GGBRp/mJ44odAQ+DK3ZQeuktW6/k2UiJ6GrDt9QhUkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZtFa7ehEUaueoWNtwzralYEiyqicIBQO9HW+4YIMe6vnCq9li5J0ZVYfiz+rHuZTMKzTkXGwbgdq5RecFf9PSo/V7OfUsa2Bx7cXAxWLxA1GjJFYQj+BSPd4You2HklEsgYIFhSfzHo5oCx+sQccs7wqAgRyV7emrT3dpe+ZkjfmUAdrldmQGAq9bIkLX04t7Jqe7Pv7rPP/A224UrZlekAm0D80wNjnOJ4WK2a/+QEJxOf35BPyECORl2ehn+s+Sw61NUPfuzkSKmLenFqJGeJP3K7x+zFL8wz8gp1JQRpIAxgLobSjNAzEmPAhj/im2jVVfBdWG3cCDxGxutKTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U8IUshQ7; dkim-atps=neutral; spf=none (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=sakari.ailus@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U8IUshQ7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=sakari.ailus@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYNfg0Y5Qz3bn4
	for <openbmc@lists.ozlabs.org>; Fri, 11 Apr 2025 01:15:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744298123; x=1775834123;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V4GHZJ8ckeMnMp0rIGnPoc0LafTsnMm513zi7ZBVHVQ=;
  b=U8IUshQ7jmhy4hd0MkfGHfZpja/7rpcXwnaejCEzEU/J4WZBZJ8HxQfa
   /fwrCibqxfS8w9a0CznlFpMgzIcnK5rd9esreW7XQl9snLFdt64PVq3fn
   aQ/fwWuzg0KBuOC/CphJv/MK999PiVd9+vBXCAumCtDBP+mM3+tFhcdtf
   jrMhiy32CZtQsvZyaaxTA87l30SSVMNVBzsS0MAEL8gAbdo4sIWsoPNwJ
   rQ2AF6y/YlZWAfh04S3WJob5vgBsgf2ys40ym0JLPthvntdWq8z4IgEnJ
   l2SYIZaLIWRVH9KGcMqjxrnaeP4dVFp+XEkzLBuj5lL0UWbnI9s3pi1/f
   w==;
X-CSE-ConnectionGUID: ut0+TwTLSJWKsCvVhOq+cw==
X-CSE-MsgGUID: T7H2auVfT+6zoRjQmIz0zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="48534426"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="48534426"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 08:15:18 -0700
X-CSE-ConnectionGUID: vQ7lhxf+QZ2w5KQxjMC4EQ==
X-CSE-MsgGUID: XLyoK8lKQ9C7x/NfnQcgNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="128912597"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 08:15:15 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id CE9BF11F74E;
	Thu, 10 Apr 2025 18:15:12 +0300 (EEST)
Date: Thu, 10 Apr 2025 15:15:12 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH 1/3] hwrng: atmel - Add a local variable for struct
 device pointer
Message-ID: <Z_fggNyPaotb2mYh@kekkonen.localdomain>
References: <20250410070623.3676647-1-sakari.ailus@linux.intel.com>
 <20250410070623.3676647-2-sakari.ailus@linux.intel.com>
 <Z_d2fcuWPiel_OnT@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_d2fcuWPiel_OnT@gondor.apana.org.au>
X-Spam-Status: No, score=-3.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>, openbmc@lists.ozlabs.org, Sean Wang <sean.wang@mediatek.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Tali Perry <tali.perry1@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>, linux-crypto@vger.kernel.org, Olivia Mackall <olivia@selenic.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Herbert,

On Thu, Apr 10, 2025 at 03:42:53PM +0800, Herbert Xu wrote:
> On Thu, Apr 10, 2025 at 10:06:21AM +0300, Sakari Ailus wrote:
> > Add a local variable for a struct device pointer instead of obtaining the
> > hwrng priv field and casting it as a struct device pointer whenever it's
> > needed.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/char/hw_random/atmel-rng.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/char/hw_random/atmel-rng.c b/drivers/char/hw_random/atmel-rng.c
> > index 143406bc6939..5192c39ebaeb 100644
> > --- a/drivers/char/hw_random/atmel-rng.c
> > +++ b/drivers/char/hw_random/atmel-rng.c
> > @@ -56,12 +56,13 @@ static int atmel_trng_read(struct hwrng *rng, void *buf, size_t max,
> >  			   bool wait)
> >  {
> >  	struct atmel_trng *trng = container_of(rng, struct atmel_trng, rng);
> > +	struct device *dev = (struct device *)trng->rng.priv;
> 
> Please stop using the priv field and instead add a struct device
> pointer to struct atmel_trng.

Thanks for the review. I'll do that in v2.

-- 
Regards,

Sakari Ailus
