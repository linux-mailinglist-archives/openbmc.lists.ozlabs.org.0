Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 785BAA3ABFD
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2025 23:47:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YyF6D0ncKz3cVT
	for <lists+openbmc@lfdr.de>; Wed, 19 Feb 2025 09:47:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739888997;
	cv=none; b=hbZfPMDlh30NMcwevzIiq3TjdQN+VQIzhGuJxG4k7wo6RFpHpQFaHEmZzHFJ44bx5q0/zWcvaecaDdFB5R0PuqVeHDTB5BVtGPdKk3dnZsuiE96WXMJG8ilF/aLuqGUaUARSmMzGto4NS5syTa5YDcJL9kUX7cEFqdUXBJnaBXJ8CSoGcJNv9cS27JCl+NQ2PxyljhSA7fLgFxcHFrRsBqNYk1iDArNm1aX90WfPgGAFeJfBNXmYa0weMzoEdj3mBCbO2TWTbw8BnurmmbsK4ZqKZCSsJW8VN06nEcBFBVLVpIvblOiSaIPcJyxRODNwHwicaplsRNI8ehCK+ynMBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739888997; c=relaxed/relaxed;
	bh=3QRdfh1WbIpc8tK9Q94M3aZHnGnDibvYpHHEVCbSFcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cPO9Q1PrcVVi0p0eyZ+HFlw9fwCZ+IkOxFt3FWeJBlHu74gAoDzWy4Q7Nq0qbYfACtc33eS2+ZAcSOPE36MGzh3SmcFURjEbzDKRJtyLD6ekNs0MP15OuGc2VVFGGxT1YqSuK1P52CXydbvUZPBiEPKmxOwTA0Y3XncfQelEx8hZBU+e2IfhEBzLAJWIHUb1/dinrXTM/5I9oH1hJsqGdtMQ/hjHS/lWNA3K0B9jKtnr4AkocNCXBJ9hir4/YqV7VxwKKEhSLgkdaQwpnBmQoqJ3XvwmKioFbXxCyOzi3fxF7uv0CMAyjBTaUipHR7+ZaprjUtaZ3dPMYFshA3qrbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=cisU6zu+; dkim-atps=neutral; spf=pass (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=cisU6zu+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 531 seconds by postgrey-1.37 at boromir; Wed, 19 Feb 2025 01:29:54 AEDT
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yy23k2Rx4z2yVF
	for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2025 01:29:53 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 306DA240101
	for <openbmc@lists.ozlabs.org>; Tue, 18 Feb 2025 15:20:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1739888455; bh=PHX9eFphN5fQHkjD5X6XVryLhS61bphBF0uF5eEXZso=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=cisU6zu+rnd1s1mtjEPgIt4ueTODrMCnMd//MamgwGEsAFQcvJYUkbxc/Qk7JpAAA
	 c8alNeb++xQetVw+zPRioHe2c0qaUQx74l1MwimQ+MYraUnmVM8judpuKvipXzxT4O
	 C6feEc37oi7bUxqlKxQVU0/IErEmYM5LpNGjyvJwtPyxyZ6IgJf5+4xCAyTWptAbxM
	 RiQW6RL22lmEJF6Yv3V/TXfnU+et4v0gSERvLD8BT3ioLHG3s0Ri/pDyMlq+bWYA/I
	 rrSZM1PGhOk5N95K7d48+qBWFG8AiL6i0Yg+Y6dzRzwcfCouHMrjhZvdcLrJvEDHQc
	 p/qR9q43etqBA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Yy1sK4BGLz9rxN;
	Tue, 18 Feb 2025 15:20:53 +0100 (CET)
Date: Tue, 18 Feb 2025 14:20:53 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] pinctrl: : Switch to use for_each_gpiochip_node()
 helper
Message-ID: <Z7SXRZtrClEVBMDx@probook>
References: <20250213193152.3120396-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250213193152.3120396-1-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Wed, 19 Feb 2025 09:47:45 +1100
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Feb 13, 2025 at 09:31:52PM +0200, Andy Shevchenko wrote:
> Switch the code to use for_each_gpiochip_node() helper.
> 
> While at it, correct header inclusion as device property APIs
> are provided in property.h.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Looks good, thanks!

Reviewed-by: J. Neuschäfer <j.ne@posteo.net>

>  drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> index cdad4ef11a2f..2f97accef837 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> @@ -10,7 +10,6 @@
>  //   block, shared between all GPIO banks
>  
>  #include <linux/device.h>
> -#include <linux/fwnode.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
> @@ -18,6 +17,7 @@
>  #include <linux/module.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include <linux/regmap.h>
>  
>  #include <linux/pinctrl/pinconf.h>
> @@ -1033,7 +1033,7 @@ static int wpcm450_gpio_register(struct platform_device *pdev,
>  		return dev_err_probe(dev, PTR_ERR(pctrl->gpio_base),
>  				     "Resource fail for GPIO controller\n");
>  
> -	device_for_each_child_node(dev, child)  {
> +	for_each_gpiochip_node(dev, child) {
>  		void __iomem *dat = NULL;
>  		void __iomem *set = NULL;
>  		void __iomem *dirout = NULL;
> @@ -1044,9 +1044,6 @@ static int wpcm450_gpio_register(struct platform_device *pdev,
>  		u32 reg;
>  		int i;
>  
> -		if (!fwnode_property_read_bool(child, "gpio-controller"))
> -			continue;
> -
>  		ret = fwnode_property_read_u32(child, "reg", &reg);
>  		if (ret < 0)
>  			return ret;
> -- 
> 2.45.1.3035.g276e886db78b
> 
