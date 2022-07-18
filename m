Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7992F57859F
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 16:37:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lml172pZWz3bwb
	for <lists+openbmc@lfdr.de>; Tue, 19 Jul 2022 00:37:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=netrider.rowland.org (client-ip=192.131.102.5; helo=netrider.rowland.org; envelope-from=stern+62cbd50a@netrider.rowland.org; receiver=<UNKNOWN>)
X-Greylist: delayed 397 seconds by postgrey-1.36 at boromir; Tue, 19 Jul 2022 00:37:17 AEST
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lists.ozlabs.org (Postfix) with SMTP id 4Lml0s6rgXz3050
	for <openbmc@lists.ozlabs.org>; Tue, 19 Jul 2022 00:37:17 +1000 (AEST)
Received: (qmail 122695 invoked by uid 1000); 18 Jul 2022 10:30:34 -0400
Date: Mon, 18 Jul 2022 10:30:34 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v1 1/3] usb: host: npcm7xx: remove USB EHCI host reset
 sequence
Message-ID: <YtVuildpxcI5By4x@rowland.harvard.edu>
References: <20220718122922.9396-1-tmaimon77@gmail.com>
 <20220718122922.9396-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220718122922.9396-2-tmaimon77@gmail.com>
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
Cc: jgross@suse.com, devicetree@vger.kernel.org, benjaminfair@google.com, felipe.balbi@linux.intel.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, tony@atomide.com, robh+dt@kernel.org, arnd@arndb.de, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org, lukas.bulwahn@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jul 18, 2022 at 03:29:20PM +0300, Tomer Maimon wrote:
> Remove USB EHCI host controller reset sequence from NPCM7XX USB EHCI
> host probe function because it is done in the NPCM reset driver.
> 
> Due to it, NPCM7XX EHCI driver configuration is dependent on NPCM reset.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---

Regarding the changes to ehci-npcm7xx.c:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

But you probably should remove the "#include <linux/regmap.h>" line near 
the start of the source file.

Alan Stern

>  drivers/usb/host/Kconfig        |  2 +-
>  drivers/usb/host/ehci-npcm7xx.c | 47 ---------------------------------
>  2 files changed, 1 insertion(+), 48 deletions(-)
> 
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index 682b3d2da623..e05e2cf806f8 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -206,7 +206,7 @@ config USB_EHCI_FSL
>  
>  config USB_EHCI_HCD_NPCM7XX
>  	tristate "Support for Nuvoton NPCM7XX on-chip EHCI USB controller"
> -	depends on (USB_EHCI_HCD && ARCH_NPCM7XX) || COMPILE_TEST
> +	depends on (USB_EHCI_HCD && ARCH_NPCM7XX && RESET_NPCM) || COMPILE_TEST
>  	default y if (USB_EHCI_HCD && ARCH_NPCM7XX)
>  	help
>  	  Enables support for the on-chip EHCI controller on
> diff --git a/drivers/usb/host/ehci-npcm7xx.c b/drivers/usb/host/ehci-npcm7xx.c
> index 6b5a7a873e01..955e7c8f3db8 100644
> --- a/drivers/usb/host/ehci-npcm7xx.c
> +++ b/drivers/usb/host/ehci-npcm7xx.c
> @@ -28,13 +28,6 @@
>  #define DRIVER_DESC "EHCI npcm7xx driver"
>  
>  static const char hcd_name[] = "npcm7xx-ehci";
> -
> -#define  USB2PHYCTL_OFFSET 0x144
> -
> -#define  IPSRST2_OFFSET 0x24
> -#define  IPSRST3_OFFSET 0x34
> -
> -
>  static struct hc_driver __read_mostly ehci_npcm7xx_hc_driver;
>  
>  static int __maybe_unused ehci_npcm7xx_drv_suspend(struct device *dev)
> @@ -60,52 +53,12 @@ static int npcm7xx_ehci_hcd_drv_probe(struct platform_device *pdev)
>  {
>  	struct usb_hcd *hcd;
>  	struct resource *res;
> -	struct regmap *gcr_regmap;
> -	struct regmap *rst_regmap;
>  	const struct hc_driver *driver = &ehci_npcm7xx_hc_driver;
>  	int irq;
>  	int retval;
>  
>  	dev_dbg(&pdev->dev,	"initializing npcm7xx ehci USB Controller\n");
>  
> -	gcr_regmap = syscon_regmap_lookup_by_compatible("nuvoton,npcm750-gcr");
> -	if (IS_ERR(gcr_regmap)) {
> -		dev_err(&pdev->dev, "%s: failed to find nuvoton,npcm750-gcr\n",
> -			__func__);
> -		return PTR_ERR(gcr_regmap);
> -	}
> -
> -	rst_regmap = syscon_regmap_lookup_by_compatible("nuvoton,npcm750-rst");
> -	if (IS_ERR(rst_regmap)) {
> -		dev_err(&pdev->dev, "%s: failed to find nuvoton,npcm750-rst\n",
> -			__func__);
> -		return PTR_ERR(rst_regmap);
> -	}
> -
> -	/********* phy init  ******/
> -	// reset usb host
> -	regmap_update_bits(rst_regmap, IPSRST2_OFFSET,
> -			(0x1 << 26), (0x1 << 26));
> -	regmap_update_bits(rst_regmap, IPSRST3_OFFSET,
> -			(0x1 << 25), (0x1 << 25));
> -	regmap_update_bits(gcr_regmap, USB2PHYCTL_OFFSET,
> -			(0x1 << 28), 0);
> -
> -	udelay(1);
> -
> -	// enable phy
> -	regmap_update_bits(rst_regmap, IPSRST3_OFFSET,
> -			(0x1 << 25), 0);
> -
> -	udelay(50); // enable phy
> -
> -	regmap_update_bits(gcr_regmap, USB2PHYCTL_OFFSET,
> -			(0x1 << 28), (0x1 << 28));
> -
> -	// enable host
> -	regmap_update_bits(rst_regmap, IPSRST2_OFFSET,
> -			(0x1 << 26), 0);
> -
>  	if (usb_disabled())
>  		return -ENODEV;
>  
> -- 
> 2.33.0
> 
