Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E19C36140AD
	for <lists+openbmc@lfdr.de>; Mon, 31 Oct 2022 23:29:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1SWJ5D5cz3c16
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 09:29:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=Rtb5mwma;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.22; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=Rtb5mwma;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1SVh6f32z2xb4
	for <openbmc@lists.ozlabs.org>; Tue,  1 Nov 2022 09:29:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1667255332; bh=aMm72pcYD4B6skjo8RlmafJnq13ND5XBcNX4Keostng=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=Rtb5mwmazQ8ffgtu6ihCSn/zPqT1V6ua5DsyaurraxKlLU65m5mXxOripDbtYAp7U
	 GiYb1iDVT0Ts40g5Om3khjpHvav02hPbkUafRQEhlXUHHhxEjcXBjJknIszkrPtsVy
	 tzvuOhSfOfJ9jy0pN3J2SzE+Y9enizB5Bn5+V6KVqYJl5HOI040249gettos6GuaKC
	 p94meQvpoUfrzZCMEPTbVir58OL+zq0V3ADTQmw7vx4rVaDgnCfHnaCXWRc1gwucs7
	 dAPtdSX5Yrn//I6/Tl48rIPbpzFZO05eI2LjlEAN8xlNhN6cESnmZ6Un7VWGWBCFKZ
	 qgAt47Wnuae0g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([78.35.189.154]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDQeU-1oiVzW0Zhm-00AVgd; Mon, 31
 Oct 2022 23:28:52 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-gpio@vger.kernel.org
Subject: [PATCH v3 RESEND] pinctrl: nuvoton: wpcm450: Convert irqchip to IRQCHIP_IMMUTABLE
Date: Mon, 31 Oct 2022 23:28:33 +0100
Message-Id: <20221031222833.201322-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AtvZpBuUU6LlAmn5RA1tvbcrSn7Rb3dI5GZyg0bVc91Ut1a9Ocb
 30BwrMiXfcuNpvtjLOjZhQv8LgoZk48txOJO4cA22r5X/Y8T6vb9r7w8uUWu9u2Tlyu/oc9
 3GoS3ZtkwxV8mYgoj2xMlksgICgtSRxt0RWmBe58Z0NtPjxIkSxL9P8a4hWhgkEQm1RpArv
 /i/9dsRHlez7i2sWnVirQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cncHiHb1PpY=;B+C+jK/ZBgDFsw16uSifjWNh2uI
 PWbGLIqQTGxauUJa7vN9GQSYOvAhYJh4IFHmqrcWCjkBTu6QBP+P5nOXjblogsrLp+3TzgUpk
 oTnHg/uKssW6DdoC8rZR4vuk7TffxRaqS1rj72xf2eFI+Zn29O2Niz2gWXfpYosE8vKmGLiv9
 65kOC6ZmDbIbyLH/v1/LVYIvrm0ycTQ7/Bp7d5iWBnj6GNdiSW9eOtAg6nlXwQSCy7s188ytM
 Opd1Ztf9nFhlx1iQBQIps05fFo/o4pp/BPYM1tsLI74GvDPz7PhJW1ab252XRZq60rwcnPKmE
 ZkMdFtgwPLiCUFFoWsBqlU05r78fJ6cI4c29yqGn0i+JwffVtMuuowFh7rO2/QDZXGGrusOWK
 HWcprQEGq2/VC6bipL8ofWvjfdPLlZ0V8ZamSgVg/Oo7uflYE9AsjKsbls7MHn/lhqux8sqSZ
 d+mtne37yC1iEqQQzjxJZOMe1JqOWhrsZP+YElMWbwVPL3l7xMspE3S292RRptZwHPW3xXVeN
 pgqAfuifkzBFDovwj5ooARpeR7kUsqNGaE2ec1B2ctFFnokittvdSHXjalDquIOYQvvweeVFC
 OV5/XN1dKqBnva+Zvk2SEi0OP4BffV8K8o/p981HAwvSNGzMCk73abrU3cbmORapXReaD6294
 a8FRZN5BkwGGdxRdaA0/NG5iy4+22xGyuPMZB6dEia4tUn5IQw83G+WyVpfOhnGEzK2Yt3Co2
 GgyWjwMQbACpwv1u9Cp0fcHcw4wPJ0pM4O8CwokaT2Udh+RaqFcLZ7/hXXNsscewaUX/cWq3g
 oun0MquWZ/4OoW1/huJ1hmv847FbLUMep1k3QryyWvJQv9ACgb7vdZN7dyNal4+UcqHSNkKqi
 wr9T8xhmwgCJ68RzFotcHUD++E76Qb9mDM9Pn8Ja8haiwvBvcn7mr+DNzlq0jjyP1AU+9sc4V
 /uuPGctgvZLsrot8t9WeoaNS3xQ=
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

v3:
- Switch from raw d->hwirq to irqd_to_hwirq(d)

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
index 0dbeb91f0bf27..528259496da5b 100644
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
+	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
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

+	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
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

