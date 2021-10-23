Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7780D4381F3
	for <lists+openbmc@lfdr.de>; Sat, 23 Oct 2021 07:18:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HbqHX0XHWz3cGB
	for <lists+openbmc@lfdr.de>; Sat, 23 Oct 2021 16:18:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HbqHG5X6xz2y7H
 for <openbmc@lists.ozlabs.org>; Sat, 23 Oct 2021 16:18:02 +1100 (AEDT)
Received: from [192.168.0.2] (ip5f5aef6e.dynamic.kabel-deutschland.de
 [95.90.239.110])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 4552A61EA191B;
 Sat, 23 Oct 2021 07:17:59 +0200 (CEST)
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: [RFC PATCH] ARM: aspeed: Add secure boot controller support
To: Joel Stanley <joel@jms.id.au>
References: <20211019080608.283324-1-joel@jms.id.au>
Message-ID: <93a1578f-442c-94ff-f22c-b6f4ba02e084@molgen.mpg.de>
Date: Sat, 23 Oct 2021 07:17:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211019080608.283324-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

[2nd try: Resent with typo fixed Andrew’s address]

Dear Joel,


Am 19.10.21 um 10:06 schrieb Joel Stanley:
> This reads out the status of the secure boot controller and exposes it
> in sysfs.

Please elaborate, what that secure boot controller is, what ASpeed 
devices support it (code seems to check for AST2600), and where it is 
documented.

> An example on a AST2600A3 QEmu model:

Nit: QEMU

> 
>   # grep . /sys/bus/soc/devices/soc0/*
>   /sys/bus/soc/devices/soc0/abr_image:0
>   /sys/bus/soc/devices/soc0/family:AST2600
>   /sys/bus/soc/devices/soc0/low_security_key:0
>   /sys/bus/soc/devices/soc0/machine:Rainier 2U
>   /sys/bus/soc/devices/soc0/otp_protected:0
>   /sys/bus/soc/devices/soc0/revision:A3
>   /sys/bus/soc/devices/soc0/secure_boot:1
>   /sys/bus/soc/devices/soc0/serial_number:888844441234abcd
>   /sys/bus/soc/devices/soc0/soc_id:05030303
>   /sys/bus/soc/devices/soc0/uart_boot:1

Can you please paste the full command to start the QEMU virtual machine?

Maybe also mention the new log message:

     AST2600 secure boot enabled

> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   arch/arm/boot/dts/aspeed-g6.dtsi    |  5 ++
>   drivers/soc/aspeed/aspeed-socinfo.c | 71 +++++++++++++++++++++++++++++
>   2 files changed, 76 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index ee171b3364fa..8f947ed47fc5 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -384,6 +384,11 @@ adc1: adc@1e6e9100 {
>   				status = "disabled";
>   			};
>   
> +			sbc: secure-boot-controller@1e6f2000 {
> +				compatible = "aspeed,ast2600-sbc";
> +				reg = <0x1e6f2000 0x1000>;
> +			};
> +
>   			gpio0: gpio@1e780000 {
>   				#gpio-cells = <2>;
>   				gpio-controller;
> diff --git a/drivers/soc/aspeed/aspeed-socinfo.c b/drivers/soc/aspeed/aspeed-socinfo.c
> index 1ca140356a08..6fa0c891f3cb 100644
> --- a/drivers/soc/aspeed/aspeed-socinfo.c
> +++ b/drivers/soc/aspeed/aspeed-socinfo.c
> @@ -9,6 +9,8 @@
>   #include <linux/slab.h>
>   #include <linux/sys_soc.h>
>   
> +static u32 security_status;
> +
>   static struct {
>   	const char *name;
>   	const u32 id;
> @@ -74,6 +76,54 @@ static const char *siliconid_to_rev(u32 siliconid)
>   	return "??";
>   }
>   
> +#define SEC_STATUS		0x14
> +#define ABR_IMAGE_SOURCE	BIT(13)
> +#define OTP_PROTECTED		BIT(8)
> +#define LOW_SEC_KEY		BIT(7)
> +#define SECURE_BOOT		BIT(6)
> +#define UART_BOOT		BIT(5)
> +
> +static ssize_t abr_image_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	return sprintf(buf, "%d\n", !!(security_status & ABR_IMAGE_SOURCE));
> +}
> +static DEVICE_ATTR_RO(abr_image);
> +
> +static ssize_t low_security_key_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	return sprintf(buf, "%d\n", !!(security_status & LOW_SEC_KEY));
> +}
> +static DEVICE_ATTR_RO(low_security_key);
> +
> +static ssize_t otp_protected_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	return sprintf(buf, "%d\n", !!(security_status & OTP_PROTECTED));
> +}
> +static DEVICE_ATTR_RO(otp_protected);
> +
> +static ssize_t secure_boot_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	return sprintf(buf, "%d\n", !!(security_status & SECURE_BOOT));
> +}
> +static DEVICE_ATTR_RO(secure_boot);
> +
> +static ssize_t uart_boot_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	/* Invert the bit, as 1 is boot from SPI/eMMC */
> +	return sprintf(buf, "%d\n", !(security_status & UART_BOOT));
> +}
> +static DEVICE_ATTR_RO(uart_boot);
> +
> +static struct attribute *aspeed_attrs[] = {
> +	&dev_attr_abr_image.attr,
> +	&dev_attr_low_security_key.attr,
> +	&dev_attr_otp_protected.attr,
> +	&dev_attr_secure_boot.attr,
> +	&dev_attr_uart_boot.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(aspeed);
> +
>   static int __init aspeed_socinfo_init(void)
>   {
>   	struct soc_device_attribute *attrs;
> @@ -81,6 +131,7 @@ static int __init aspeed_socinfo_init(void)
>   	struct device_node *np;
>   	void __iomem *reg;
>   	bool has_chipid = false;
> +	bool has_sbe = false;
>   	u32 siliconid;
>   	u32 chipid[2];
>   	const char *machine = NULL;
> @@ -109,6 +160,20 @@ static int __init aspeed_socinfo_init(void)
>   	}
>   	of_node_put(np);
>   
> +	/* AST2600 only */
> +	np = of_find_compatible_node(NULL, NULL, "aspeed,ast2600-sbc");
> +	if (of_device_is_available(np)) {
> +		void *base = of_iomap(np, 0);
> +		if (!base) {
> +			of_node_put(np);
> +			return -ENODEV;
> +		}
> +		security_status = readl(base + SEC_STATUS);
> +		has_sbe = true;
> +		iounmap(base);
> +		of_node_put(np);
> +	}
> +
>   	attrs = kzalloc(sizeof(*attrs), GFP_KERNEL);
>   	if (!attrs)
>   		return -ENODEV;
> @@ -135,6 +200,9 @@ static int __init aspeed_socinfo_init(void)
>   		attrs->serial_number = kasprintf(GFP_KERNEL, "%08x%08x",
>   						 chipid[1], chipid[0]);
>   
> +	if (has_sbe)
> +		attrs->custom_attr_group = aspeed_groups[0];
> +
>   	soc_dev = soc_device_register(attrs);
>   	if (IS_ERR(soc_dev)) {
>   		kfree(attrs->soc_id);
> @@ -148,6 +216,9 @@ static int __init aspeed_socinfo_init(void)
>   			attrs->revision,
>   			attrs->soc_id);
>   
> +	if (has_sbe && (security_status & SECURE_BOOT))
> +		pr_info("AST2600 secure boot enabled\n");
> +

Maybe it is more interesting to log, when it is not enabled?

>   	return 0;
>   }
>   early_initcall(aspeed_socinfo_init);
> 


Kind regards,

Paul
