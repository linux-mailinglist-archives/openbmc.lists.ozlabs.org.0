Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7256BFBCD5
	for <lists+openbmc@lfdr.de>; Thu, 14 Nov 2019 01:05:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47D1vV6n1RzF793
	for <lists+openbmc@lfdr.de>; Thu, 14 Nov 2019 11:05:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47D1td47sxzF78c
 for <openbmc@lists.ozlabs.org>; Thu, 14 Nov 2019 11:04:25 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xADNuc0L139706
 for <openbmc@lists.ozlabs.org>; Wed, 13 Nov 2019 19:04:20 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.82])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w8rqhe8pf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 13 Nov 2019 19:04:20 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 14 Nov 2019 00:04:19 -0000
Received: from us1a3-smtp06.a3.dal06.isc4sb.com (10.146.103.243)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 14 Nov 2019 00:04:10 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp06.a3.dal06.isc4sb.com
 with ESMTP id 2019111400040938-1142723 ;
 Thu, 14 Nov 2019 00:04:09 +0000 
In-Reply-To: <20191113155237.30646-3-i.mikhaylov@yadro.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
Date: Thu, 14 Nov 2019 00:04:09 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <20191113155237.30646-3-i.mikhaylov@yadro.com>,
 <20191113155237.30646-1-i.mikhaylov@yadro.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-LLNOutbound: False
X-Disclaimed: 46159
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 19111400-9463-0000-0000-00000173B243
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.002686
X-IBM-SpamModules-Versions: BY=3.00012103; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01289727; UDB=6.00684066; IPR=6.01071925; 
 MB=3.00029520; MTD=3.00000008; XFM=3.00000015; UTC=2019-11-14 00:04:17
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-11-13 22:35:31 - 6.00010644
x-cbparentid: 19111400-9464-0000-0000-000049232CB6
Message-Id: <OF20F73C7F.F32D5A9E-ON002584B1.00836403-002584B2.0000614A@notes.na.collabserv.com>
Subject: Re:  [PATCH 2/2] mmc: sdhci-of-aspeed: add inversion signal presence
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-13_06:, , signatures=0
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11/13/2019 around 09:57AM in some time zone, Ivan Mikhaylov wrote:
>Change the default .get=5Fcd callback. Add inverted signal card
>detection
>check.
>
>Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
>
>diff --git a/drivers/mmc/host/sdhci-of-aspeed.c
>b/drivers/mmc/host/sdhci-of-aspeed.c
>index 8962f6664381..8eded8a6ed8d 100644
>--- a/drivers/mmc/host/sdhci-of-aspeed.c
>+++ b/drivers/mmc/host/sdhci-of-aspeed.c
>@@ -31,6 +31,7 @@ struct aspeed=5Fsdc {
> struct aspeed=5Fsdhci {
> 	struct aspeed=5Fsdc *parent;
> 	u32 width=5Fmask;
>+	u8 cd=5Finverted;

The mmc core/host.c checks the device tree and stores the
result as mmc->caps2 & MMC=5FCAP2=5FCD=5FACTIVE=5FHIGH

This appears to be accessale as sdhci=5Fhost->mmc->caps2.

Please reuse this bit like the other drivers.

> };
>=20
> static void aspeed=5Fsdc=5Fconfigure=5F8bit=5Fmode(struct aspeed=5Fsdc *s=
dc,
>@@ -143,6 +144,21 @@ static inline int
>aspeed=5Fsdhci=5Fcalculate=5Fslot(struct aspeed=5Fsdhci *dev,
> 	return (delta / 0x100) - 1;
> }
>=20
>+static int aspeed=5Fget=5Fcd(struct mmc=5Fhost *mmc)
>+{
>+	struct aspeed=5Fsdhci *aspeed=5Fsdhci;
>+	struct sdhci=5Fpltfm=5Fhost *pltfm=5Fpriv;
>+	struct sdhci=5Fhost *host =3D mmc=5Fpriv(mmc);
>+
>+	int presence =3D !!(sdhci=5Freadl(host, SDHCI=5FPRESENT=5FSTATE)
>+			 & SDHCI=5FCARD=5FPRESENT);
>+
>+	pltfm=5Fpriv =3D sdhci=5Fpriv(host);
>+	aspeed=5Fsdhci =3D sdhci=5Fpltfm=5Fpriv(pltfm=5Fpriv);
>+
>+	return presence ^ aspeed=5Fsdhci->cd=5Finverted;
>+}
>+
> static int aspeed=5Fsdhci=5Fprobe(struct platform=5Fdevice *pdev)
> {
> 	struct sdhci=5Fpltfm=5Fhost *pltfm=5Fhost;
>@@ -183,6 +199,13 @@ static int aspeed=5Fsdhci=5Fprobe(struct
>platform=5Fdevice *pdev)
> 		goto err=5Fpltfm=5Ffree;
> 	}
>=20
>+	dev->cd=5Finverted =3D 0;
>+	host->mmc=5Fhost=5Fops.get=5Fcd =3D aspeed=5Fget=5Fcd;
>+	if (of=5Fproperty=5Fread=5Fbool(pdev->dev.of=5Fnode, "cd-inverted")) {
>+		dev->cd=5Finverted =3D 1;
>+		dev=5Finfo(&pdev->dev, "aspeed: sdhci: presence signal inversion
>enabled\n");
>+	}
>+
> 	ret =3D mmc=5Fof=5Fparse(host->mmc);
> 	if (ret)
> 		goto err=5Fsdhci=5Fadd;
>--=20
>2.20.1
>
>

