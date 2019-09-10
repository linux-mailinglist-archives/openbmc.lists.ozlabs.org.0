Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 220B7AF26C
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 22:55:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Scjj6rHmzF1dq
	for <lists+openbmc@lfdr.de>; Wed, 11 Sep 2019 06:55:05 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Schs1c74zF1Cq
 for <openbmc@lists.ozlabs.org>; Wed, 11 Sep 2019 06:54:19 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8AKsBdb047112
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 16:54:15 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.81])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uxfsuxq5p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 16:54:13 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 10 Sep 2019 20:53:36 -0000
Received: from us1a3-smtp08.a3.dal06.isc4sb.com (10.146.103.57)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 10 Sep 2019 20:53:16 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp08.a3.dal06.isc4sb.com
 with ESMTP id 2019091020531513-935522 ;
 Tue, 10 Sep 2019 20:53:15 +0000 
In-Reply-To: <20190909123840.154745-3-tmaimon77@gmail.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 10 Sep 2019 20:53:13 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <20190909123840.154745-3-tmaimon77@gmail.com>,
 <20190909123840.154745-1-tmaimon77@gmail.com>
X-Mailer: IBM iNotes ($HaikuForm 1054) | IBM Domino Build
 SCN1812108_20180501T0841_FP57 August 05, 2019 at 12:42
X-LLNOutbound: False
X-Disclaimed: 34479
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 19091020-3067-0000-0000-000000AA6B2C
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.056169
X-IBM-SpamModules-Versions: BY=3.00011750; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01259539; UDB=6.00665766; IPR=6.01041294; 
 MB=3.00028569; MTD=3.00000008; XFM=3.00000015; UTC=2019-09-10 20:53:31
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-09-10 16:44:15 - 6.00010391
x-cbparentid: 19091020-3068-0000-0000-000011BD12C5
Message-Id: <OFDC101E51.54765CB8-ON00258471.006F34B7-00258471.0072BCA7@notes.na.collabserv.com>
Subject: Re:  [PATCH v2 2/2] hwrng: npcm: add NPCM RNG driver
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-10_11:, , signatures=0
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

On September 9, 2019 around 7:40AM in somet timezone, Tomer Maimon wrote:
>+#define NPCM=5FRNG=5FTIMEOUT=5FUSEC	20000
>+#define NPCM=5FRNG=5FPOLL=5FUSEC	1000

...

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
>+static int npcm=5Frng=5Fread(struct hwrng *rng, void *buf, size=5Ft max,
>bool wait)
>+{
>+	struct npcm=5Frng *priv =3D to=5Fnpcm=5Frng(rng);
>+	int retval =3D 0;
>+	int ready;
>+
>+	pm=5Fruntime=5Fget=5Fsync((struct device *)priv->rng.priv);
>+
>+	while (max >=3D sizeof(u32)) {
>+		ready =3D readl(priv->base + NPCM=5FRNGCS=5FREG) &
>+			NPCM=5FRNG=5FDATA=5FVALID;
>+		if (!ready) {
>+			if (wait) {
>+				if (readl=5Fpoll=5Ftimeout(priv->base + NPCM=5FRNGCS=5FREG,
>+						       ready,
>+						       ready & NPCM=5FRNG=5FDATA=5FVALID,
>+						       NPCM=5FRNG=5FPOLL=5FUSEC,
>+						       NPCM=5FRNG=5FTIMEOUT=5FUSEC))
>+					break;
>+			} else {
>+				break;

This break is too far from the condition and deeply nested to follow.

And looking further, readl=5Fpoll=5Ftimeout will read and check the conditi=
on before
calling usleep, so the the initial readl and check is redundant

Rearrange to make wait determine if you call readl=5Fpoll=5Ftimeout or=20
readl / compare / break.

>+			}
>+		}
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
>+}
>+
>+static int npcm=5Frng=5Fprobe(struct platform=5Fdevice *pdev)
>+{
>+	struct npcm=5Frng *priv;
>+	struct resource *res;
>+	bool pm=5Fdis =3D false;
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
>+	pm=5Fdis =3D true;
>+	priv->rng.init =3D npcm=5Frng=5Finit;
>+	priv->rng.cleanup =3D npcm=5Frng=5Fcleanup;
>+#endif

if you move this down you can use one if (ENABLED=5FCONFIG=5FPM) {}

>+	priv->rng.read =3D npcm=5Frng=5Fread;
>+	priv->rng.priv =3D (unsigned long)&pdev->dev;
>+	if (of=5Fproperty=5Fread=5Fu32(pdev->dev.of=5Fnode, "quality", &quality))
>+		priv->rng.quality =3D 1000;
>+	else
>+		priv->rng.quality =3D quality;
>+
>+	writel(NPCM=5FRNG=5FM1ROSEL, priv->base + NPCM=5FRNGMODE=5FREG);
>+	if (pm=5Fdis)
>+		writel(NPCM=5FRNG=5FCLK=5FSET=5F25MHZ, priv->base + NPCM=5FRNGCS=5FREG);
>+	else
>+		writel(NPCM=5FRNG=5FCLK=5FSET=5F25MHZ | NPCM=5FRNG=5FENABLE,
>+		       priv->base + NPCM=5FRNGCS=5FREG);

wait ... if we know the whole value here, why read/modify/write the value
in the init and cleanup hook?   Save the io read and write the known value
 ... define the value to be written for clarity between enable/disable if
needed



>+
>+	ret =3D devm=5Fhwrng=5Fregister(&pdev->dev, &priv->rng);
>+	if (ret) {
>+		dev=5Ferr(&pdev->dev, "Failed to register rng device: %d\n",
>+			ret);

need to disable if CONFIG=5FPM ?

>+		return ret;
>+	}
>+
>+	dev=5Fset=5Fdrvdata(&pdev->dev, priv);

This should probably be before the register.

>+	pm=5Fruntime=5Fset=5Fautosuspend=5Fdelay(&pdev->dev, 100);

So every 100ms power off, and if userspace does a read we
will poll every 1ms for upto 20ms.

If userspace says try once a second with -ENODELAY so no wait,
it never gets data.


Oh, and yes, rngd sets non-blocking, polls the descriptors,
and falls back to slow expensive software if no hardware
says it has data ready.

>+	pm=5Fruntime=5Fuse=5Fautosuspend(&pdev->dev);
>+	pm=5Fruntime=5Fenable(&pdev->dev);
>+
>+	return 0;
>+}
>+
>+static int npcm=5Frng=5Fremove(struct platform=5Fdevice *pdev)
>+{
>+	struct npcm=5Frng *priv =3D platform=5Fget=5Fdrvdata(pdev);
>+
>+	hwrng=5Funregister(&priv->rng);

you did devm register, but call unregister directly?

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

module=5Fplatform=5Fdriver will set owner, remove it here.

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

milton

