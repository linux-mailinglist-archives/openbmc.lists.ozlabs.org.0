Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFAC4511B2
	for <lists+openbmc@lfdr.de>; Mon, 15 Nov 2021 20:10:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtJgf29T8z2yLv
	for <lists+openbmc@lfdr.de>; Tue, 16 Nov 2021 06:10:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=uWDI6azB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=uWDI6azB; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtJgB5hCLz2xY4;
 Tue, 16 Nov 2021 06:10:29 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E5FEC63715;
 Mon, 15 Nov 2021 19:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1637003426;
 bh=DtHrB66HXLmxewymT8yGeifJxpPVREBisB7HVDuwLYk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uWDI6azBQctDhxtdF1G9iKbhqkN2qYhQctn9Q95ee03P+8wXH7qRA3GAepSUdZg2n
 uKk6RWow7OZupqCCke9iIi2MeT8WkPYc4AvR4GCkYQP6OBFfqIRBToDvoJHxCRdtmJ
 raMFBms7HRLxupcaecmEaqky9XClk8sQ0odpZa3o=
Date: Mon, 15 Nov 2021 19:49:57 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Iwona Winiarska <iwona.winiarska@intel.com>
Subject: Re: [PATCH v3 06/13] peci: Add device detection
Message-ID: <YZKr1Rqfx6Cmw+Ok@kroah.com>
References: <20211115182552.3830849-1-iwona.winiarska@intel.com>
 <20211115182552.3830849-7-iwona.winiarska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211115182552.3830849-7-iwona.winiarska@intel.com>
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
 Dave Hansen <dave.hansen@intel.com>, Zev Weiss <zweiss@equinix.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 openbmc@lists.ozlabs.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Nov 15, 2021 at 07:25:45PM +0100, Iwona Winiarska wrote:
> +void peci_device_destroy(struct peci_device *device)
> +{
> +	bool killed;
> +
> +	device_lock(&device->dev);
> +	killed = kill_device(&device->dev);

Eeek, why call this?

> +	device_unlock(&device->dev);
> +
> +	if (!killed)
> +		return;

What happened if something changed after you unlocked it?

Why is kill_device() required at all?  That's a very rare function to
call, and one that only one "bus" calls today because it is very
special (i.e. crazy and broken...)

thanks,

greg k-h
