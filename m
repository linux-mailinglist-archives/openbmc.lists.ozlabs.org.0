Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D69AF77D20
	for <lists+openbmc@lfdr.de>; Sun, 28 Jul 2019 03:31:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45x4ys2lzczDqSy
	for <lists+openbmc@lfdr.de>; Sun, 28 Jul 2019 11:31:01 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45x4yF3RqvzDqRx;
 Sun, 28 Jul 2019 11:30:27 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x6S1UBUO025476;
 Sat, 27 Jul 2019 20:30:13 -0500
Message-ID: <9fb8c99449cebd68fb5975890dedaa06ce7808ae.camel@kernel.crashing.org>
Subject: Re: [PATCH] drivers/tty/serial/8250: Make Aspeed VUART SIRQ
 polarity configurable
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Oskar Senft <osk@google.com>, joel@jms.id.au, andrew@aj.id.au
Date: Sun, 28 Jul 2019 11:30:11 +1000
In-Reply-To: <20190727134242.49847-1-osk@google.com>
References: <20190727134242.49847-1-osk@google.com>
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
Cc: openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, 2019-07-27 at 09:42 -0400, Oskar Senft wrote:
> Make the SIRQ polarity for Aspeed 24xx/25xx VUART configurable via
> sysfs. It is required on some host platforms (e.g. TYAN S7106) to
> reconfigure this setting from the default to enable the host to
> receive
> interrupts from the VUART.
> 
> The setting is configurable via sysfs rather than device-tree to stay
> in
> line with other related configurable settings.

If it's a fixed platform configuration that never changes at runtime,
shouldn't it be in the device-tree instead ?

Cheers,
Ben

> Tested: Verified on TYAN S7106 mainboard.
> Signed-off-by: Oskar Senft <osk@google.com>
> ---
>  .../ABI/stable/sysfs-driver-aspeed-vuart      | 10 ++++-
>  drivers/tty/serial/8250/8250_aspeed_vuart.c   | 39
> +++++++++++++++++++
>  2 files changed, 48 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/stable/sysfs-driver-aspeed-vuart
> b/Documentation/ABI/stable/sysfs-driver-aspeed-vuart
> index 8062953ce77b..64fad87ad964 100644
> --- a/Documentation/ABI/stable/sysfs-driver-aspeed-vuart
> +++ b/Documentation/ABI/stable/sysfs-driver-aspeed-vuart
> @@ -6,10 +6,18 @@ Description:	Configures which IO port the
> host side of the UART
>  Users:		OpenBMC.  Proposed changes should be mailed to
>  		openbmc@lists.ozlabs.org
>  
> -What:		/sys/bus/platform/drivers/aspeed-vuart*/sirq
> +What:		/sys/bus/platform/drivers/aspeed-vuart/*/sirq
>  Date:		April 2017
>  Contact:	Jeremy Kerr <jk@ozlabs.org>
>  Description:	Configures which interrupt number the host side of
>  		the UART will appear on the host <-> BMC LPC bus.
>  Users:		OpenBMC.  Proposed changes should be mailed to
>  		openbmc@lists.ozlabs.org
> +
> +What:		/sys/bus/platform/drivers/aspeed-
> vuart/*/sirq_polarity
> +Date:		July 2019
> +Contact:	Oskar Senft <osk@google.com>
> +Description:	Configures the polarity of the serial interrupt to the
> +		host via the BMC LPC bus.
> +Users:		OpenBMC.  Proposed changes should be mailed to
> +		openbmc@lists.ozlabs.org
> diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> index 0438d9a905ce..ef0a6ff69841 100644
> --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> @@ -22,6 +22,7 @@
>  
>  #define ASPEED_VUART_GCRA		0x20
>  #define ASPEED_VUART_GCRA_VUART_EN		BIT(0)
> +#define ASPEED_VUART_GCRA_HOST_SIRQ_POLARITY	BIT(1)
>  #define ASPEED_VUART_GCRA_DISABLE_HOST_TX_DISCARD BIT(5)
>  #define ASPEED_VUART_GCRB		0x24
>  #define ASPEED_VUART_GCRB_HOST_SIRQ_MASK	GENMASK(7, 4)
> @@ -131,8 +132,46 @@ static ssize_t sirq_store(struct device *dev,
> struct device_attribute *attr,
>  
>  static DEVICE_ATTR_RW(sirq);
>  
> +static ssize_t sirq_polarity_show(struct device *dev,
> +				  struct device_attribute *attr, char
> *buf)
> +{
> +	struct aspeed_vuart *vuart = dev_get_drvdata(dev);
> +	u8 reg;
> +
> +	reg = readb(vuart->regs + ASPEED_VUART_GCRA);
> +	reg &= ASPEED_VUART_GCRA_HOST_SIRQ_POLARITY;
> +
> +	return snprintf(buf, PAGE_SIZE - 1, "%u\n", reg ? 1 : 0);
> +}
> +
> +static ssize_t sirq_polarity_store(struct device *dev,
> +				   struct device_attribute *attr,
> +				   const char *buf, size_t count)
> +{
> +	struct aspeed_vuart *vuart = dev_get_drvdata(dev);
> +	unsigned long val;
> +	int err;
> +	u8 reg;
> +
> +	err = kstrtoul(buf, 0, &val);
> +	if (err)
> +		return err;
> +
> +	reg = readb(vuart->regs + ASPEED_VUART_GCRA);
> +	if (val != 0)
> +		reg |= ASPEED_VUART_GCRA_HOST_SIRQ_POLARITY;
> +	else
> +		reg &= ~ASPEED_VUART_GCRA_HOST_SIRQ_POLARITY;
> +	writeb(reg, vuart->regs + ASPEED_VUART_GCRA);
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(sirq_polarity);
> +
>  static struct attribute *aspeed_vuart_attrs[] = {
>  	&dev_attr_sirq.attr,
> +	&dev_attr_sirq_polarity.attr,
>  	&dev_attr_lpc_address.attr,
>  	NULL,
>  };

