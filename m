Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CFC260D75
	for <lists+openbmc@lfdr.de>; Tue,  8 Sep 2020 10:21:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlymS47w3zDqRF
	for <lists+openbmc@lfdr.de>; Tue,  8 Sep 2020 18:21:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.4.55; helo=eur03-db5-obe.outbound.protection.outlook.com;
 envelope-from=peter.chen@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=VfCmvInB; 
 dkim-atps=neutral
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40055.outbound.protection.outlook.com [40.107.4.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bjvr74dhlzDqlK
 for <openbmc@lists.ozlabs.org>; Sat,  5 Sep 2020 10:02:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RFzBmSPMvdx99lkTA6eCuVwEiTO5nXnGrSDvHPzQpl0nQgn14XEPWTW45hW+gz9NU0wIKTMUmiVaojmGKcls44pjCB4dI58KIa/DeeW0hFPVSgWbNUiIqlLT+JVQI5Fl9hF8StP8yrqdzz5uD3R2e1Ne0nR2h7PheFpogCY+tulhrCnf/4Pl8ZnMlLfqVoC/Na9U0G8e8q/96KCncHGlcEfzU5U/XjKPyGr+YZ6Ix7RBB10ejLYwC3leK2r4/YMeQaBahbOkeX+TtqiGZK5OSKSVSqTfC3Uq9zSRWO6iY96GbmhaSv6upiN3zQl+xIKnQC6GDbIh61wNeTzrBrCrSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPIeNAWiJ+RwUn3Dc1XubTVydmTxUxZW8Z7aiN+EDGg=;
 b=Y6rCTxRBvelkawoAZ7y0JpZkGDip/rEEd+pXDBtGZANfxHTY6QqxiqT+7y18pVsoiYFKrU8MyMFmrBuOOuLd2iHcJVjgSsWmq7L05pQ+et9mh1XV/V0TvNJp5S0/evrVbOzzpuWFOC3dAK6fXXwT2BGUIccHyY97jr3sNuhsUcCtVyJR/tL0qzXUfzn4UHHNLzKGLmUks+uZlbLVDYnfzQEmTviQyNXHDm6FxSN+CStqShnXRd82nOCah+C/dbVxashSc56/7XcftAphw6bS8fbF18ClpvN5eBbIRBue3XJp3dax4wRNQ2c1pAatIA91vwoPacPYigWGRaMKPvkyMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPIeNAWiJ+RwUn3Dc1XubTVydmTxUxZW8Z7aiN+EDGg=;
 b=VfCmvInB4WJOiiKDDFpAgnnNmkAfKf3Vig4Bywtc+jrqNR6bJEcy1oBF4Q+CalHJunVQ6a7mCEYxLOIgFR/4hq4/5BJdxW+CsziF/AaFYIKQr+AVB22C5OkWqEUR/XKT8E66EI8SPBPNIV3eCZaOQaDydiA0gbxbol9CK7q3MJo=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB5605.eurprd04.prod.outlook.com (2603:10a6:20b:a9::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Sat, 5 Sep
 2020 00:02:39 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3348.017; Sat, 5 Sep 2020
 00:02:39 +0000
From: Peter Chen <peter.chen@nxp.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 06/20] usb/chipidea: core: Use pm_ptr() macro
Thread-Topic: [PATCH 06/20] usb/chipidea: core: Use pm_ptr() macro
Thread-Index: AQHWgeUeVblSA116M06WTywDJrW2qalZK9WA
Date: Sat, 5 Sep 2020 00:02:39 +0000
Message-ID: <20200905000215.GA24243@b29397-desktop>
References: <20200903112554.34263-1-paul@crapouillou.net>
 <20200903112554.34263-7-paul@crapouillou.net>
In-Reply-To: <20200903112554.34263-7-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: crapouillou.net; dkim=none (message not signed)
 header.d=none;crapouillou.net; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e1f6d5bb-1382-436d-cb3b-08d8512f00f6
x-ms-traffictypediagnostic: AM6PR04MB5605:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB5605566E98352146BEC9BAD68B2A0@AM6PR04MB5605.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u+NMwiRXrOXRt05a3Vkgc33HCvtdM1iy4Qwz0E/1uHUSCcs45NM/F2f3Bd9qgYmyBB+IlplHwb1O/TxUj7VuwlO0+XKHP4PadBxGu+SWTR77PvjLOGfpdUq6Q4LC2AqPiwDFu3bk4cHtSkG2k5VNSnwSs7wORhIpr6OwiXyL45y3W1P2JyENWjp7SVYdBcvoNh1XPxC6QNACLhATRUqJDMgg7xclYcz4C+Z64YrGNfDN19ZpJPEL9VEKSLH8IaeLbbR7Fgp83RstWCykAh06uE5AlGM3fETSB5HaRDXfuD5VcFuPeYcWrzZdTXpQ3+iB8WrEXsisnEti/YKFgLzdSw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7157.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(376002)(39860400002)(396003)(346002)(366004)(136003)(4326008)(54906003)(6506007)(53546011)(7416002)(186003)(8676002)(6486002)(1076003)(5660300002)(8936002)(6916009)(9686003)(6512007)(26005)(316002)(478600001)(33716001)(33656002)(44832011)(76116006)(83380400001)(86362001)(64756008)(66946007)(66446008)(66476007)(91956017)(71200400001)(2906002)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: izELUD7MsgvbelmwTLhMruPwtoYCtAKcyQnROaJ9nOHhYwl8lNq1LySfEw69wDfBN3co9FJZWG9cPKlizQcP+qvOCp0ftKJIQ4mqBuUmN/vqs/YCLESqH3KlSCzEsuqtCPAlKy0sq29ezxTeUw3EoBfcb0fYyd9gG0MBxbm42X3cWRzwAMdwp1B1Le4NwSEYBwBlPIT/TjYFe88DXoXWEz96DrcvyEKHkT4GGtdc3dphBMONA/vUc6zSN9Zkftik8FTBqZ64mYFsxHeNUg3nSccBnylMpAjsr1SMdBm8e7p3HNB85qhOXQOKK+wauLskFw7see6hX1JWLzFl4ic5xtcqu/Id/ZZD0Ktm7v8BHMAznDQQHe7pMat60lzYbFwiicTy1Y401tVyvtdvPZoR7MDLSXGBPijWURnJl8jQsXPmMle95rQPLANgJbd5QYK8PaRtFFr475OsFkRb5OJG7HgKoQQ7L2hTxshwV9/nSQPFNOcAlnRFRKXZZpqm43LrvsZMMI6qIkeugqulHfQ1xq6tw8p8dpYv2K1WatPVREXtipjiYAlfkti0z9ThPl0L8mjzkSYylY5pEIrU7N0rCndnbyhYJOgYDUjHEvctUtiE8JzfxBkBIfTrNNK2YoFzJYTozK4ALrOyF7YhR/OECQ==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0D0BEEEC3F31194C8DD1C1705C70F150@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f6d5bb-1382-436d-cb3b-08d8512f00f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2020 00:02:39.2778 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kZ5h2kYETF/pBlR7pzdqj90o/r8ZGdjQo+rib/UroNWYoXI5S0aBZl3G8XLlugayNyYTBdWVRuUjFs7unUldkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5605
X-Mailman-Approved-At: Tue, 08 Sep 2020 17:47:22 +1000
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Tomer Maimon <tmaimon77@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Fabio Estevam <festevam@gmail.com>, Benjamin Fair <benjaminfair@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Alan Stern <stern@rowland.harvard.edu>, dl-linux-imx <linux-imx@nxp.com>,
 Cristian Birsan <cristian.birsan@microchip.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Tali Perry <tali.perry1@gmail.com>,
 Bin Liu <b-liu@ti.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>, Avi Fishman <avifishman70@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tony Prisk <linux@prisktech.co.nz>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Patrick Venture <venture@google.com>, Shawn Guo <shawnguo@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 20-09-03 13:25:40, Paul Cercueil wrote:
> Use the newly introduced pm_ptr() macro, and mark the suspend/resume
> functions __maybe_unused. These functions can then be moved outside the
> CONFIG_PM_SUSPEND block, and the compiler can then process them and
> detect build failures independently of the config. If unused, they will
> simply be discarded by the compiler.

For using __maybe_unused or using MACRO, it depends. The chipidea core
has many functions are only used for power management, you need to add
__maybe_unused for everyone of them, I still prefer using MACRO.

Peter
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/usb/chipidea/core.c | 26 +++++++++++---------------
>  1 file changed, 11 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index aa40e510b806..af64ab98fb56 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -1231,9 +1231,8 @@ static int ci_hdrc_remove(struct platform_device *p=
dev)
>  	return 0;
>  }
> =20
> -#ifdef CONFIG_PM
>  /* Prepare wakeup by SRP before suspend */
> -static void ci_otg_fsm_suspend_for_srp(struct ci_hdrc *ci)
> +static void __maybe_unused ci_otg_fsm_suspend_for_srp(struct ci_hdrc *ci=
)
>  {
>  	if ((ci->fsm.otg->state =3D=3D OTG_STATE_A_IDLE) &&
>  				!hw_read_otgsc(ci, OTGSC_ID)) {
> @@ -1245,7 +1244,7 @@ static void ci_otg_fsm_suspend_for_srp(struct ci_hd=
rc *ci)
>  }
> =20
>  /* Handle SRP when wakeup by data pulse */
> -static void ci_otg_fsm_wakeup_by_srp(struct ci_hdrc *ci)
> +static void __maybe_unused ci_otg_fsm_wakeup_by_srp(struct ci_hdrc *ci)
>  {
>  	if ((ci->fsm.otg->state =3D=3D OTG_STATE_A_IDLE) &&
>  		(ci->fsm.a_bus_drop =3D=3D 1) && (ci->fsm.a_bus_req =3D=3D 0)) {
> @@ -1259,7 +1258,7 @@ static void ci_otg_fsm_wakeup_by_srp(struct ci_hdrc=
 *ci)
>  	}
>  }
> =20
> -static void ci_controller_suspend(struct ci_hdrc *ci)
> +static void __maybe_unused ci_controller_suspend(struct ci_hdrc *ci)
>  {
>  	disable_irq(ci->irq);
>  	ci_hdrc_enter_lpm(ci, true);
> @@ -1277,7 +1276,7 @@ static void ci_controller_suspend(struct ci_hdrc *c=
i)
>   * interrupt (wakeup int) only let the controller be out of
>   * low power mode, but not handle any interrupts.
>   */
> -static void ci_extcon_wakeup_int(struct ci_hdrc *ci)
> +static void __maybe_unused ci_extcon_wakeup_int(struct ci_hdrc *ci)
>  {
>  	struct ci_hdrc_cable *cable_id, *cable_vbus;
>  	u32 otgsc =3D hw_read_otgsc(ci, ~0);
> @@ -1294,7 +1293,7 @@ static void ci_extcon_wakeup_int(struct ci_hdrc *ci=
)
>  		ci_irq(ci->irq, ci);
>  }
> =20
> -static int ci_controller_resume(struct device *dev)
> +static int __maybe_unused ci_controller_resume(struct device *dev)
>  {
>  	struct ci_hdrc *ci =3D dev_get_drvdata(dev);
>  	int ret;
> @@ -1332,8 +1331,7 @@ static int ci_controller_resume(struct device *dev)
>  	return 0;
>  }
> =20
> -#ifdef CONFIG_PM_SLEEP
> -static int ci_suspend(struct device *dev)
> +static int __maybe_unused ci_suspend(struct device *dev)
>  {
>  	struct ci_hdrc *ci =3D dev_get_drvdata(dev);
> =20
> @@ -1366,7 +1364,7 @@ static int ci_suspend(struct device *dev)
>  	return 0;
>  }
> =20
> -static int ci_resume(struct device *dev)
> +static int __maybe_unused ci_resume(struct device *dev)
>  {
>  	struct ci_hdrc *ci =3D dev_get_drvdata(dev);
>  	int ret;
> @@ -1386,9 +1384,8 @@ static int ci_resume(struct device *dev)
> =20
>  	return ret;
>  }
> -#endif /* CONFIG_PM_SLEEP */
> =20
> -static int ci_runtime_suspend(struct device *dev)
> +static int __maybe_unused ci_runtime_suspend(struct device *dev)
>  {
>  	struct ci_hdrc *ci =3D dev_get_drvdata(dev);
> =20
> @@ -1408,13 +1405,12 @@ static int ci_runtime_suspend(struct device *dev)
>  	return 0;
>  }
> =20
> -static int ci_runtime_resume(struct device *dev)
> +static int __maybe_unused ci_runtime_resume(struct device *dev)
>  {
>  	return ci_controller_resume(dev);
>  }
> =20
> -#endif /* CONFIG_PM */
> -static const struct dev_pm_ops ci_pm_ops =3D {
> +static const struct dev_pm_ops __maybe_unused ci_pm_ops =3D {
>  	SET_SYSTEM_SLEEP_PM_OPS(ci_suspend, ci_resume)
>  	SET_RUNTIME_PM_OPS(ci_runtime_suspend, ci_runtime_resume, NULL)
>  };
> @@ -1424,7 +1420,7 @@ static struct platform_driver ci_hdrc_driver =3D {
>  	.remove	=3D ci_hdrc_remove,
>  	.driver	=3D {
>  		.name	=3D "ci_hdrc",
> -		.pm	=3D &ci_pm_ops,
> +		.pm	=3D pm_ptr(&ci_pm_ops),
>  		.dev_groups =3D ci_groups,
>  	},
>  };
> --=20
> 2.28.0
>=20

--=20

Thanks,
Peter Chen=
