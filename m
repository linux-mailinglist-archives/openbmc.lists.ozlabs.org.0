Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F4E545913
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 02:16:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LK1jV4jxwz3bwX
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 10:16:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=BJYg/2w6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=BJYg/2w6;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LK1j22Shqz3blQ
	for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 10:16:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1654820172;
	bh=/+ElgicZYLPAQqpAxpBc1K+pcplEGNPrxCUaHsk2cew=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=BJYg/2w6Z8G2uhwmKfw9zZr98K49tj7BuB8LbMVWcfXBFUJHYfOY2t+HqlYXoobL8
	 9aDgNEwUc+JR1WachioVryF+EQ+4F+VAw1T6OWGLgQtbOhfQcExwkK865PNQ+OZ1Hx
	 RNJ2Qg0NPfzNMyrpuZA4ekFcABFLPCIqrlNLloF4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.195.3]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MaJ7v-1oE9291sRR-00WDjj; Fri, 10
 Jun 2022 02:16:12 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-gpio@vger.kernel.org
Subject: [PATCH v2] pinctrl: nuvoton: wpcm450: Convert irqchip to IRQCHIP_IMMUTABLE
Date: Fri, 10 Jun 2022 02:16:08 +0200
Message-Id: <20220610001609.276220-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FSg/4zZ4D0F39BbK/XSWt8pWWf49vgchHRlaMl0mvzDrD6ye5Pp
 zXkpvHSeK7qKzXQ+CBciZaT/TAlxhAwwkVnFeeRGiRkHCO3VhCi6T2MBYpyPSFvDHKmYejd
 ZzJdN4B9+yI882DH0PPT/nDkjsL5sfz/PuwGxjXWrs8k+rdT7v17Q9DYIvk7Uxw4iui6W48
 NpE9CffmSF7zuykKF+P7A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3ICSpxXLciI=:zfxksipzFdOubIlarRmUv+
 wBvnj59BPc+tMGRyfHnXo4NUUBp4cByr1y7nAAqYE+rvwSRseXWlqsi3z4bjjgub0ZB+r3rWn
 K/tEt2e+8dlHC2sowvyWHSPS0Pmps1fEKjcrv60ouwRsZznVlBjGTwI1TUUjB2qn6s1/suECL
 X9QnF71twyQjEvw6BRsOTnhXR8tWnkf6zqjDZgjWM07DsDFPT1K69tHGB1N3hehK/vsgddKZl
 etoeANexn+QUiVODUMB3zNefq1FgVTTWy4Yw906jujWKfNnxqtTW4DMZ0IkdHff6h3EXBZIvi
 2UzUoWcOvwKFxXne60yp6SBq1CwHDg5lsBErQRzIyqtJCM40IlyMxuWv4pl67Lz+/G8WVBfqh
 ejV6fCH1tqYQV+GiduxeqJeqBwk8uLh02ohGOR3kCh76Dum9y8YPAjRD91ugC/CJbf6cvDllF
 936HuKVMC2NLI74Mnw2npK3UjWoPMVV4mSOxMIgT+9S07hWXOscZStQuesQPu12I8+pqfqN4Y
 /v8awwWRQehzvmbumcXalnWcAVI3E0BuypHRBa0NoBLpKrwwg+R/5tRS6B9egl9L6rll9b4Te
 WGa4U0qxn+zaGcY74g2P4f/0TQ7LaraE1oJ+b2eW1WXeK0YjlQUzwVAOTGbX7Q0AVxYnH4tZz
 KhlQ7ji0kghdvMEWrvj0HHOCRI3UxWdofgBtDaeC7MC99a5gtJG1l4jLokTl2or0+lGjH4S8u
 5GwqyHh/NVp/GQq1fwpiR4DbRGtU1jsxd8V1JMWkVTM3MHRJh95Hm47eRDttOQEFfHicH8HtO
 /C8Vg4ISpRfuQMPaIjFUW5EdQtN0T8+yGtMhctmPEBZ37J2+YpvXdH4Da2K6YGpgFSg839B3O
 9zip4bNoffn8oTtLwB66wT/ArSD3tXPH0BGpItrUhImov+4L53mYSypymrRhBXPhxuZGr/S74
 LskHxQHWRZZruQlutBl61/2f21sUo06UbiBrYX96tIJpd4Lt1LuW8h4CZaFLVD2VJJyTzWUms
 nev2fv5SnYt23RXqL7d5nH48e5C5ZIuQ7Ak0XCz018BmebaV67tXSMSL5nZrZ39PkMh938aEk
 6EetKqSw/FveVLnUiL0JxjjOXCxeXORP8F6QMYv6Cj4DvSSSSyxt6ECIQ==
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
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Commit 6c846d026d490 ("gpio: Don't fiddle with irqchips marked as
immutable") added a warning for irqchips that are not marked with
IRQCHIP_IMMUTABLE.

Convert the pinctrl-wpcm450 driver to an immutable irqchip.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--

v2:
- Add missing gpiochip_*able_irq calls in mask/unmask methods
- Remove unused instance of struct irq_chip in struct struct wpcm450_bank

v1:
- https://lore.kernel.org/lkml/20220606214301.2061467-1-j.neuschaefer@gmx.=
net/
=2D--
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/n=
uvoton/pinctrl-wpcm450.c
index 0dbeb91f0bf27..d44639ede2ce6 100644
=2D-- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
@@ -49,7 +49,6 @@ struct wpcm450_bank;
 struct wpcm450_gpio {
 	struct gpio_chip	gc;
 	struct wpcm450_pinctrl	*pctrl;
-	struct irq_chip		irqc;
 	const struct wpcm450_bank *bank;
 };

@@ -142,7 +141,8 @@ static void wpcm450_gpio_irq_ack(struct irq_data *d)

 static void wpcm450_gpio_irq_mask(struct irq_data *d)
 {
-	struct wpcm450_gpio *gpio =3D gpiochip_get_data(irq_data_get_irq_chip_da=
ta(d));
+	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
+	struct wpcm450_gpio *gpio =3D gpiochip_get_data(gc);
 	struct wpcm450_pinctrl *pctrl =3D gpio->pctrl;
 	unsigned long flags;
 	unsigned long even;
@@ -157,11 +157,14 @@ static void wpcm450_gpio_irq_mask(struct irq_data *d=
)
 	__assign_bit(bit, &even, 0);
 	iowrite32(even, pctrl->gpio_base + WPCM450_GPEVEN);
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+
+	gpiochip_disable_irq(gc, d->hwirq);
 }

 static void wpcm450_gpio_irq_unmask(struct irq_data *d)
 {
-	struct wpcm450_gpio *gpio =3D gpiochip_get_data(irq_data_get_irq_chip_da=
ta(d));
+	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
+	struct wpcm450_gpio *gpio =3D gpiochip_get_data(gc);
 	struct wpcm450_pinctrl *pctrl =3D gpio->pctrl;
 	unsigned long flags;
 	unsigned long even;
@@ -171,6 +174,8 @@ static void wpcm450_gpio_irq_unmask(struct irq_data *d=
)
 	if (bit < 0)
 		return;

+	gpiochip_enable_irq(gc, d->hwirq);
+
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 	even =3D ioread32(pctrl->gpio_base + WPCM450_GPEVEN);
 	__assign_bit(bit, &even, 1);
@@ -293,6 +298,8 @@ static const struct irq_chip wpcm450_gpio_irqchip =3D =
{
 	.irq_unmask =3D wpcm450_gpio_irq_unmask,
 	.irq_mask =3D wpcm450_gpio_irq_mask,
 	.irq_set_type =3D wpcm450_gpio_set_irq_type,
+	.flags =3D IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };

 static void wpcm450_gpio_irqhandler(struct irq_desc *desc)
@@ -1068,9 +1075,8 @@ static int wpcm450_gpio_register(struct platform_dev=
ice *pdev,
 		gpio->gc.fwnode =3D child;
 		gpio->gc.add_pin_ranges =3D wpcm450_gpio_add_pin_ranges;

-		gpio->irqc =3D wpcm450_gpio_irqchip;
 		girq =3D &gpio->gc.irq;
-		girq->chip =3D &gpio->irqc;
+		gpio_irq_chip_set_chip(girq, &wpcm450_gpio_irqchip);
 		girq->parent_handler =3D wpcm450_gpio_irqhandler;
 		girq->parents =3D devm_kcalloc(dev, WPCM450_NUM_GPIO_IRQS,
 					     sizeof(*girq->parents), GFP_KERNEL);
=2D-
2.35.1

