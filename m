Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0221A40AF
	for <lists+openbmc@lfdr.de>; Sat, 31 Aug 2019 00:48:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Kvlc1l8czDrBk
	for <lists+openbmc@lfdr.de>; Sat, 31 Aug 2019 08:48:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=miltonm@us.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Kvkr4KVVzDrBZ
 for <openbmc@lists.ozlabs.org>; Sat, 31 Aug 2019 08:47:47 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7UMkxcj018488
 for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2019 18:47:40 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.74])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uqbbxadju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2019 18:47:40 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Fri, 30 Aug 2019 22:47:40 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 30 Aug 2019 22:47:22 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2019083022472156-935807 ;
 Fri, 30 Aug 2019 22:47:21 +0000 
In-Reply-To: <20190828162617.237398-3-tmaimon77@gmail.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Tomer Maimon <tmaimon77@gmail.com>
Date: Fri, 30 Aug 2019 22:47:21 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <20190828162617.237398-3-tmaimon77@gmail.com>,
 <20190828162617.237398-1-tmaimon77@gmail.com>
X-Mailer: IBM iNotes ($HaikuForm 1054) | IBM Domino Build
 SCN1812108_20180501T0841_FP57 August 05, 2019 at 12:42
X-LLNOutbound: False
X-Disclaimed: 11283
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 19083022-3165-0000-0000-000000D79B79
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.177132
X-IBM-SpamModules-Versions: BY=3.00011687; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01254435; UDB=6.00662622; IPR=6.01036056; 
 MB=3.00028401; MTD=3.00000008; XFM=3.00000015; UTC=2019-08-30 22:47:37
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-08-30 17:30:21 - 6.00010349
x-cbparentid: 19083022-3166-0000-0000-00001BF1D68D
Message-Id: <OF311056DF.80F736D6-ON00258466.007A807F-00258466.007D2F93@notes.na.collabserv.com>
Subject: Re:  [PATCH v1 2/2] hwrng: npcm: add NPCM RNG driver
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-30_09:, , signatures=0
X-Proofpoint-Spam-Reason: safe
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
Cc: mark.rutland@arm.com, sumit.garg@linaro.org, linux-crypto@vger.kernel.org,
 herbert@gondor.apana.org.au, arnd@arndb.de, devicetree@vger.kernel.org,
 avifishman70@gmail.com, gregkh@linuxfoundation.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, tali.perry1@gmail.com, vkoul@kernel.org,
 robh+dt@kernel.org, mpm@selenic.com, venture@google.com, tglx@linutronix.de,
 jens.wiklander@linaro.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On August 28th around 11:28AM in some timezone, Tomer Maimon wrote

>Add Nuvoton NPCM BMC Random Number Generator(RNG) driver.
>
>Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>---
> drivers/char/hw=5Frandom/Kconfig    |  13 ++
> drivers/char/hw=5Frandom/Makefile   |   1 +
> drivers/char/hw=5Frandom/npcm-rng.c | 207
>++++++++++++++++++++++++++++++
> 3 files changed, 221 insertions(+)
> create mode 100644 drivers/char/hw=5Frandom/npcm-rng.c
>
>diff --git a/drivers/char/hw=5Frandom/Kconfig
>b/drivers/char/hw=5Frandom/Kconfig
>index 59f25286befe..87a1c30e7958 100644
>--- a/drivers/char/hw=5Frandom/Kconfig
>+++ b/drivers/char/hw=5Frandom/Kconfig
>@@ -440,6 +440,19 @@ config HW=5FRANDOM=5FOPTEE
>=20
> 	  If unsure, say Y.
>=20
>+config HW=5FRANDOM=5FNPCM
>+	tristate "NPCM Random Number Generator support"
>+	depends on ARCH=5FNPCM || COMPILE=5FTEST
>+	default HW=5FRANDOM
>+	help
>+ 	  This driver provides support for the Random Number
>+	  Generator hardware available in Nuvoton NPCM SoCs.
>+
>+	  To compile this driver as a module, choose M here: the
>+	  module will be called npcm-rng.
>+
>+ 	  If unsure, say Y.
>+
> endif # HW=5FRANDOM
>=20
> config UML=5FRANDOM
>diff --git a/drivers/char/hw=5Frandom/Makefile
>b/drivers/char/hw=5Frandom/Makefile
>index 7c9ef4a7667f..17b6d4e6d591 100644
>--- a/drivers/char/hw=5Frandom/Makefile
>+++ b/drivers/char/hw=5Frandom/Makefile
>@@ -39,3 +39,4 @@ obj-$(CONFIG=5FHW=5FRANDOM=5FMTK)	+=3D mtk-rng.o
> obj-$(CONFIG=5FHW=5FRANDOM=5FS390) +=3D s390-trng.o
> obj-$(CONFIG=5FHW=5FRANDOM=5FKEYSTONE) +=3D ks-sa-rng.o
> obj-$(CONFIG=5FHW=5FRANDOM=5FOPTEE) +=3D optee-rng.o
>+obj-$(CONFIG=5FHW=5FRANDOM=5FNPCM) +=3D npcm-rng.o
>diff --git a/drivers/char/hw=5Frandom/npcm-rng.c
>b/drivers/char/hw=5Frandom/npcm-rng.c
>new file mode 100644
>index 000000000000..5b4b1b6cb362
>--- /dev/null
>+++ b/drivers/char/hw=5Frandom/npcm-rng.c
>@@ -0,0 +1,207 @@
>+// SPDX-License-Identifier: GPL-2.0
>+// Copyright (c) 2019 Nuvoton Technology corporation.
>+
>+#include <linux/kernel.h>
>+#include <linux/module.h>
>+#include <linux/io.h>
>+#include <linux/iopoll.h>
>+#include <linux/init.h>
>+#include <linux/random.h>
>+#include <linux/err.h>
>+#include <linux/platform=5Fdevice.h>
>+#include <linux/hw=5Frandom.h>
>+#include <linux/delay.h>
>+#include <linux/of=5Firq.h>
>+#include <linux/pm=5Fruntime.h>
>+
>+#define NPCM=5FRNGCS=5FREG		0x00	/* Control and status register */
>+#define NPCM=5FRNGD=5FREG		0x04	/* Data register */
>+#define NPCM=5FRNGMODE=5FREG	0x08	/* Mode register */
>+
>+#define NPCM=5FRNG=5FCLK=5FSET=5F25MHZ	GENMASK(4, 3) /* 20-25 MHz */
>+#define NPCM=5FRNG=5FDATA=5FVALID	BIT(1)
>+#define NPCM=5FRNG=5FENABLE		BIT(0)
>+#define NPCM=5FRNG=5FM1ROSEL	BIT(1)
>+
>+#define NPCM=5FRNG=5FTIMEOUT=5FPOLL	20
>+
>+#define to=5Fnpcm=5Frng(p)	container=5Fof(p, struct npcm=5Frng, rng)
>+
>+struct npcm=5Frng {
>+	void =5F=5Fiomem *base;
>+	struct hwrng rng;
>+};
>+
>+static int npcm=5Frng=5Finit(struct hwrng *rng)
>+{
>+	struct npcm=5Frng *priv =3D to=5Fnpcm=5Frng(rng);
>+	u32 val;
>+
>+	val =3D readl(priv->base + NPCM=5FRNGCS=5FREG);
>+	val |=3D NPCM=5FRNG=5FENABLE;
>+	writel(val, priv->base + NPCM=5FRNGCS=5FREG);
>+
>+	return 0;
>+}
>+
>+static void npcm=5Frng=5Fcleanup(struct hwrng *rng)
>+{
>+	struct npcm=5Frng *priv =3D to=5Fnpcm=5Frng(rng);
>+	u32 val;
>+
>+	val =3D readl(priv->base + NPCM=5FRNGCS=5FREG);
>+	val &=3D ~NPCM=5FRNG=5FENABLE;
>+	writel(val, priv->base + NPCM=5FRNGCS=5FREG);
>+}
>+
>+static bool npcm=5Frng=5Fwait=5Fready(struct hwrng *rng, bool wait)
>+{
>+	struct npcm=5Frng *priv =3D to=5Fnpcm=5Frng(rng);
>+	int timeout=5Fcnt =3D 0;
>+	int ready;
>+
>+	ready =3D readl(priv->base + NPCM=5FRNGCS=5FREG) & NPCM=5FRNG=5FDATA=5FV=
ALID;

You should honor the wait paramter here.

>+	while ((ready =3D=3D 0) && (timeout=5Fcnt < NPCM=5FRNG=5FTIMEOUT=5FPOLL)=
) {
>+		usleep=5Frange(500, 1000);
>+		ready =3D readl(priv->base + NPCM=5FRNGCS=5FREG) &
>+			NPCM=5FRNG=5FDATA=5FVALID;
>+		timeout=5Fcnt++;
>+	}
>+
>+	return !!ready;
>+}
>+
>+static int npcm=5Frng=5Fread(struct hwrng *rng, void *buf, size=5Ft max,
>bool wait)
>+{
>+	struct npcm=5Frng *priv =3D to=5Fnpcm=5Frng(rng);
>+	int retval =3D 0;
>+
>+	pm=5Fruntime=5Fget=5Fsync((struct device *)priv->rng.priv);
>+
>+	while (max >=3D sizeof(u32)) {
>+		if (!npcm=5Frng=5Fwait=5Fready(rng, wait))
>+			break;
>+
>+		*(u32 *)buf =3D readl(priv->base + NPCM=5FRNGD=5FREG);
>+		retval +=3D sizeof(u32);
>+		buf +=3D sizeof(u32);
>+		max -=3D sizeof(u32);
>+	}
>+
>+	pm=5Fruntime=5Fmark=5Flast=5Fbusy((struct device *)priv->rng.priv);
>+	pm=5Fruntime=5Fput=5Fsync=5Fautosuspend((struct device *)priv->rng.priv);
>+
>+	return retval || !wait ? retval : -EIO;

So you are doing pm get/put around each rng data sample.

Have you characterized the time to enable to the time to get a sample
and compared to the pm runtime sync parameters?

Do you get any data if you set non-blocking wait above?


>+}
>+
>+static int npcm=5Frng=5Fprobe(struct platform=5Fdevice *pdev)
>+{
>+	struct npcm=5Frng *priv;
>+	struct resource *res;
>+	u32 quality;
>+	int ret;
>+
>+	priv =3D devm=5Fkzalloc(&pdev->dev, sizeof(*priv), GFP=5FKERNEL);
>+	if (!priv)
>+		return -ENOMEM;
>+
>+	res =3D platform=5Fget=5Fresource(pdev, IORESOURCE=5FMEM, 0);
>+	priv->base =3D devm=5Fioremap=5Fresource(&pdev->dev, res);
>+	if (IS=5FERR(priv->base))
>+		return PTR=5FERR(priv->base);
>+
>+	priv->rng.name =3D pdev->name;
>+#ifndef CONFIG=5FPM
>+	priv->rng.init =3D npcm=5Frng=5Finit;
>+	priv->rng.cleanup =3D npcm=5Frng=5Fcleanup;

so npcm=5Frng=5Finit and npcm=5Frng=5Fcleanup are unused if !CONFIG=5FPM.  =
No warnings?

>+#endif
>+	priv->rng.read =3D npcm=5Frng=5Fread;
>+	priv->rng.priv =3D (unsigned long)&pdev->dev;
>+	if (of=5Fproperty=5Fread=5Fu32(pdev->dev.of=5Fnode, "quality", &quality))
>+		priv->rng.quality =3D 1000;
>+	else
>+		priv->rng.quality =3D quality;
>+
>+	writel(NPCM=5FRNG=5FM1ROSEL, priv->base + NPCM=5FRNGMODE=5FREG);
>+#ifndef CONFIG=5FPM
>+	writel(NPCM=5FRNG=5FCLK=5FSET=5F25MHZ, priv->base + NPCM=5FRNGCS=5FREG);
>+#else
>+	writel(NPCM=5FRNG=5FCLK=5FSET=5F25MHZ | NPCM=5FRNG=5FENABLE,
>+	       priv->base + NPCM=5FRNGCS=5FREG);
>+#endif

I am assuming these are safe to always set and the clock will
bein range?

Did you test without CONFIG=5FPM ? Looks like the ifndev should be
ifdef otherwise the enable will never be set.

Can you use a local variable for this value that is chosen by
the config instead of ifdef'ing the code?



>+
>+	ret =3D devm=5Fhwrng=5Fregister(&pdev->dev, &priv->rng);
>+	if (ret) {
>+		dev=5Ferr(&pdev->dev, "Failed to register rng device: %d\n",
>+			ret);
>+		return ret;
>+	}
>+
>+	dev=5Fset=5Fdrvdata(&pdev->dev, priv);
>+	pm=5Fruntime=5Fset=5Fautosuspend=5Fdelay(&pdev->dev, 100);
>+	pm=5Fruntime=5Fuse=5Fautosuspend(&pdev->dev);
>+	pm=5Fruntime=5Fenable(&pdev->dev);
>+
>+	dev=5Finfo(&pdev->dev, "Random Number Generator Probed\n");
>+
>+	return 0;
>+}
>+
>+static int npcm=5Frng=5Fremove(struct platform=5Fdevice *pdev)
>+{
>+	struct npcm=5Frng *priv =3D platform=5Fget=5Fdrvdata(pdev);
>+
>+	hwrng=5Funregister(&priv->rng);
>+	pm=5Fruntime=5Fdisable(&pdev->dev);
>+	pm=5Fruntime=5Fset=5Fsuspended(&pdev->dev);
>+
>+	return 0;
>+}
>+
>+#ifdef CONFIG=5FPM
>+static int npcm=5Frng=5Fruntime=5Fsuspend(struct device *dev)
>+{
>+	struct npcm=5Frng *priv =3D dev=5Fget=5Fdrvdata(dev);
>+
>+	npcm=5Frng=5Fcleanup(&priv->rng);
>+
>+	return 0;
>+}
>+
>+static int npcm=5Frng=5Fruntime=5Fresume(struct device *dev)
>+{
>+	struct npcm=5Frng *priv =3D dev=5Fget=5Fdrvdata(dev);
>+
>+	return npcm=5Frng=5Finit(&priv->rng);
>+}
>+#endif
>+
>+static const struct dev=5Fpm=5Fops npcm=5Frng=5Fpm=5Fops =3D {
>+	SET=5FRUNTIME=5FPM=5FOPS(npcm=5Frng=5Fruntime=5Fsuspend,
>+			   npcm=5Frng=5Fruntime=5Fresume, NULL)
>+	SET=5FSYSTEM=5FSLEEP=5FPM=5FOPS(pm=5Fruntime=5Fforce=5Fsuspend,
>+				pm=5Fruntime=5Fforce=5Fresume)
>+};
>+
>+static const struct of=5Fdevice=5Fid rng=5Fdt=5Fid[] =3D {
>+	{ .compatible =3D "nuvoton,npcm750-rng",  },
>+	{},
>+};
>+MODULE=5FDEVICE=5FTABLE(of, rng=5Fdt=5Fid);
>+
>+static struct platform=5Fdriver npcm=5Frng=5Fdriver =3D {
>+	.driver =3D {
>+		.name		=3D "npcm-rng",
>+		.pm		=3D &npcm=5Frng=5Fpm=5Fops,
>+		.owner		=3D THIS=5FMODULE,
>+		.of=5Fmatch=5Ftable =3D of=5Fmatch=5Fptr(rng=5Fdt=5Fid),
>+	},
>+	.probe		=3D npcm=5Frng=5Fprobe,
>+	.remove		=3D npcm=5Frng=5Fremove,
>+};
>+
>+module=5Fplatform=5Fdriver(npcm=5Frng=5Fdriver);
>+
>+MODULE=5FDESCRIPTION("Nuvoton NPCM Random Number Generator Driver");
>+MODULE=5FAUTHOR("Tomer Maimon <tomer.maimon@nuvoton.com>");
>+MODULE=5FLICENSE("GPL v2");
>--=20
>2.18.0
>
>

