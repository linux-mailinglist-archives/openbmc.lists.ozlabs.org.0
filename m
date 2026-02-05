Return-Path: <openbmc+bounces-1326-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJgcJfFKhGm82QMAu9opvQ
	(envelope-from <openbmc+bounces-1326-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Thu, 05 Feb 2026 08:46:57 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EBEEF8F8
	for <lists+openbmc@lfdr.de>; Thu, 05 Feb 2026 08:46:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f68SG0Qfcz2xrk;
	Thu, 05 Feb 2026 18:46:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770277614;
	cv=none; b=nMH4d3bCHZCdANJLy1N6PYZ8gbR/SKernn7vuGy8wJMc/NR3JwkJPG0v1c6nh/R1RcRCWP2U8wvhOJt1QXqhY2PW54p2qFl7IE/mLpqr1J7rd1lgyKuR38sK7uhdV6hEMvRmGluO3+Ql4pI3h2eUx1FoDOUyxxDO+4tWoDlQ+hzbTCMgvuW3xpomUsl2EBVpW5tdmP7Ztf93wxaIei5LPHPcSo9gyTgjZF1qd3cbpgQ4ww9xmnBvfO8QtcPIU3138x7Mhdekm2Y9nJHwgBAWTi9FhgmVpk9WC+ktmHZFb2y3QOwlk66ZYUmlftpTcEMyjOePKbhBVJ8UPv8OUSVlZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770277614; c=relaxed/relaxed;
	bh=51rMqP89ybL9/USwIwbP89c/Vrt6NV8Ggq3EbtDmOg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YCT7xXaTfk6WPe675neUw0lfKo4z7Qy66Ej7XZh/4nAgUKGdJ9MMpH+ChDM+ZCi+JvFLPp875FeTiqvvL3FOQofF9lrJO1C905724q1Z1xyy/j93jkfZhd00S4kAZ9h03nQ512CNBgmh3wPdoLZaUwqrqoqyZuCTmGxLKM5+/0HeBINRkvfQHP0zf4Divc/72tg8xTC9z4e79LrNTRGwTdkdaLKjlql3maNc1NixrxvTuXYY4ogSZBb/3rc0idquaBmghvQ7FoNJ2mS0TkC1WgIALc625lvv2kcpVsjdP00EIX41GuSWecFmXVuiK36W9DeqNmskMPBMK6Z+9TBNsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t6igMoyz; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t6igMoyz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f68SD34MPz2xg9
	for <openbmc@lists.ozlabs.org>; Thu, 05 Feb 2026 18:46:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9BC1043641;
	Thu,  5 Feb 2026 07:46:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2075C4CEF7;
	Thu,  5 Feb 2026 07:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770277610;
	bh=s8L9I7EB/iuzJpgXM9qjt6ubKbWYNVz45wTmfz3GthI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=t6igMoyz6eWo1nPv4cLyjXLRWLPg8/PB3vTuTYgI2xScEVsoZiJaE+1WJ+IXsGND9
	 8hx+93uFFrtKimz/nIffCt2NCuDVLgNGx5RwQSrAimep0mI9RQahxyCI5An3qF9qMe
	 nYj1KMOvhnVZaSFZ9sXcvKtAwCMyftb6lTnAxjYJY3wDUL2kAuhjx4jaSgm8xauXuI
	 fl/aVRfsZIj0sEJtcqbCch3sz56NNNtK23Z0Ys6M7OinyDlwKkgjv6bYAmbaSfL6tt
	 //rVm3ne7WbAFnmZ4DfkE6hAaxkvsfB43ggAbmqC5PUftyrrqQU4zomzqGsuw8y783
	 WlJemxmRcrUaQ==
Message-ID: <82f7f4f4-6f88-4293-ae13-5da9d7252efa@kernel.org>
Date: Thu, 5 Feb 2026 08:46:46 +0100
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] usb: gadget: udc: Add UDC driver for Axiado Device
 controller IP Corigine
To: Vladimir Moravcevic <vmoravcevic@axiado.com>,
 Krutik Shah <krutikshah@axiado.com>, Prasad Bolisetty
 <pbolisetty@axiado.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
References: <20260202-axiado-ax3000-usb-device-controller-v1-0-45ce0a8b014f@axiado.com>
 <20260202-axiado-ax3000-usb-device-controller-v1-2-45ce0a8b014f@axiado.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260202-axiado-ax3000-usb-device-controller-v1-2-45ce0a8b014f@axiado.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.70 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1326-lists,openbmc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[krzk@kernel.org,openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:vmoravcevic@axiado.com,m:krutikshah@axiado.com,m:pbolisetty@axiado.com,m:gregkh@linuxfoundation.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[openbmc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: B3EBEEF8F8
X-Rspamd-Action: no action

On 02/02/2026 14:16, Vladimir Moravcevic wrote:
> Add Corigine USB IP Driver for Axiado AX3000 SoC's
> USB peripheral (USB 2.0/3.0).
> The driver is based on the Corigine USB IP core with
> Axiado-specific enhancements including VBUS detection and USB link
> stability fixes.


This driver looks way too complicated for simple USB controller, so I
guess you just re-implemented a lot of Linux stack or other drivers.

Also did not pass basic litmus test for sending usu 15 year old junk
code, which disqualifies it from review IMO. There is simply no point to
review code from 15 yaers ago - you should never start with such code.

> +static const struct crg_udc_priv ax3000_plat_setup_gen2 = {
> +	.plat_setup_gen3 = false,
> +};
> +
> +static const struct crg_udc_priv ax3000_plat_setup_gen3 = {
> +	.plat_setup_gen3 = true,
> +};
> +
> +/**
> + * crg_gadget_probe - Initializes gadget driver
> + *
> + *
> + * Returns 0 on success otherwise negative errno.
> + */

Completely pointless and wrongly placed comment. Do not ever add such
comments.

> +
> +static const struct of_device_id of_crg_udc_match[] = {
> +	{
> +		.compatible = "axiado,ax3000-udc",
> +		.data = &ax3000_plat_setup_gen2
> +	},
> +	{
> +		.compatible = "axiado,ax3000-udc-gen3",
> +		.data = &ax3000_plat_setup_gen3
> +	},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, of_crg_udc_match);
> +
> +static int crg_udc_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +	int i;
> +	struct crg_gadget_dev *crg_udc;
> +	static int udc_gcnt = INIT_ZERO;
> +	char udc_gname[10] = {""};
> +	const struct crg_udc_priv *priv;
> +
> +	priv = of_device_get_match_data(&pdev->dev);
> +	sprintf(udc_gname, "gadget-%d", udc_gcnt);
> +	crg_udc = devm_kzalloc(&pdev->dev, sizeof(*crg_udc), GFP_KERNEL);
> +	if (!crg_udc)
> +		return -ENOMEM;
> +	crg_udc->dev = &pdev->dev;
> +
> +	spin_lock_init(&crg_udc->udc_lock);
> +	platform_set_drvdata(pdev, crg_udc);
> +
> +	dev_set_name(&crg_udc->gadget.dev, udc_gname);
> +	crg_udc->gadget.ops = &crg_gadget_ops;
> +	crg_udc->gadget.ep0 = &crg_udc->udc_ep[0].usb_ep;
> +	crg_udc->gadget.dev.parent = &pdev->dev;
> +	INIT_LIST_HEAD(&crg_udc->gadget.ep_list);
> +	if (priv->plat_setup_gen3) {
> +		crg_udc->gadget.max_speed = USB_SPEED_SUPER;
> +		crg_udc->gadget.speed = USB_SPEED_SUPER;
> +	} else {
> +		crg_udc->gadget.max_speed = USB_SPEED_HIGH;
> +		crg_udc->gadget.speed = USB_SPEED_HIGH;
> +	}
> +	crg_udc->gadget.name = udc_gname;
> +	crg_udc->gadget.sg_supported = true;
> +	dev_dbg(crg_udc->dev, "%s sg support\n", __func__);
> +	crg_udc->connected = 0;
> +	crg_udc->dev_addr = 0;
> +
> +	crg_udc->udc_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!crg_udc->udc_res) {
> +		dev_err(&pdev->dev, "missing memory resource\n");
> +		return -ENODEV;
> +	}
> +
> +	crg_udc->mmio_virt_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(crg_udc->mmio_virt_base)) {
> +		dev_err(&pdev->dev, "mmio ioremap failed\n");
> +		return PTR_ERR(crg_udc->mmio_virt_base);
> +	}
> +
> +	/* set controller device role*/
> +	writel((readl(crg_udc->mmio_virt_base + CRG_UDC_MODE_REG) |
> +		 CRGUDC_ROLE_DEVICE),
> +		 crg_udc->mmio_virt_base + CRG_UDC_MODE_REG);
> +	for (i = 0; i < CRG_RING_NUM; i++) {
> +		crg_udc->uicr[i] = crg_udc->mmio_virt_base +
> +				CRG_UICR_OFFSET + i * CRG_UICR_STRIDE;
> +
> +		dev_dbg(crg_udc->dev, "crg_udc->uicr[%d] = %p\n", i,
> +			crg_udc->uicr[i]);
> +	}
> +	crg_udc->uccr = crg_udc->mmio_virt_base + CRG_UCCR_OFFSET;
> +
> +	crg_udc_reset(crg_udc);
> +
> +	crg_udc_clear_portpm(crg_udc);
> +
> +	ret = reset_data_struct(crg_udc);
> +	if (ret) {
> +		dev_err(crg_udc->dev, "reset_data_struct error\n");
> +		goto err0;
> +	}
> +
> +	init_ep_info(crg_udc);
> +	init_ep0(crg_udc);
> +
> +	EP0_Start(crg_udc);

Did you read coding style?

> +
> +	crg_gadget_irq_init(pdev, crg_udc);
> +
> +	ret = usb_add_gadget_udc(&pdev->dev, &crg_udc->gadget);
> +	if (ret)
> +		goto err0;
> +
> +	udc_gcnt++;
> +
> +	return 0;
> +
> +err0:
> +	return -1;

What?

> +}
> +
> +static void crg_udc_remove(struct platform_device *pdev)
> +{
> +	struct crg_gadget_dev *crg_udc = platform_get_drvdata(pdev);
> +	u32 tmp = 0;
> +
> +	dev_dbg(crg_udc->dev, "%s %d called\n", __func__, __LINE__);
> +
> +	crg_udc->device_state = USB_STATE_ATTACHED;
> +	crg_vbus_detect(crg_udc, 0);
> +
> +	usb_del_gadget_udc(&crg_udc->gadget);
> +
> +	/* set controller host role*/
> +	tmp = readl(crg_udc->mmio_virt_base + CRG_UDC_MODE_REG) & ~0x1;
> +	writel(tmp, crg_udc->mmio_virt_base + CRG_UDC_MODE_REG);
> +
> +	if (crg_udc->irq)
> +		free_irq(crg_udc->irq, crg_udc);
> +
> +	platform_set_drvdata(pdev, 0);
> +
> +	dev_dbg(crg_udc->dev, "%s %d gadget remove\n", __func__, __LINE__);

Drop all such debugs.

> +
> +}
> +
> +static void crg_udc_shutdown(struct platform_device *pdev)
> +{
> +	struct crg_gadget_dev *crg_udc = platform_get_drvdata(pdev);
> +
> +	dev_dbg(crg_udc->dev, "%s %d called\n", __func__, __LINE__);

It's really pointless code.

> +
> +	crg_udc->device_state = USB_STATE_ATTACHED;
> +	crg_vbus_detect(crg_udc, 0);
> +	usb_del_gadget_udc(&crg_udc->gadget);
> +
> +	if (crg_udc->irq)
> +		free_irq(crg_udc->irq, crg_udc);
> +	/*
> +	 * Clear the drvdata pointer.
> +	 */
> +	platform_set_drvdata(pdev, 0);
> +}
> +
> +#ifdef CONFIG_PM
> +static int crg_udc_suspend(struct device *dev)
> +{
> +	return 0;
> +}
> +
> +static int crg_udc_resume(struct device *dev)
> +{
> +
> +
> +	return 0;
> +}
> +#else
> +#define crg_udc_suspend	NULL
> +#define crg_udc_resume	NULL
> +#endif
> +
> +static const struct dev_pm_ops crg_udc_pm_ops = {
> +	.suspend = crg_udc_suspend,
> +	.resume = crg_udc_resume,
> +};
> +
> +static struct platform_driver crg_udc_driver = {
> +	.probe = crg_udc_probe,
> +	.remove = crg_udc_remove,
> +	.shutdown = crg_udc_shutdown,
> +	.driver			= {
> +		.name		= "crg_udc",
> +		.owner		= THIS_MODULE,

Do not upstream 10 or 15 year old driver. Why do we need to repeat all
the same comments as we repeated for last 15 years? Take newest driver
as starting point, not 15 year old code. You just replicated all old issues.



Best regards,
Krzysztof

