Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5257512F58
	for <lists+openbmc@lfdr.de>; Thu, 28 Apr 2022 11:13:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kpqf93yBlz3bcR
	for <lists+openbmc@lfdr.de>; Thu, 28 Apr 2022 19:13:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=VbHkWg7l;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.148.236;
 helo=mx0a-00268f01.pphosted.com;
 envelope-from=prvs=8117ecf8fe=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=VbHkWg7l; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kpqdg4RrGz2xss
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2022 19:12:31 +1000 (AEST)
Received: from pps.filterd (m0165119.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 23S4QkpC030006;
 Thu, 28 Apr 2022 09:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=lReBFmaYwkckjvsophyW8RStQLs6RtU97zzDYXHCOVk=;
 b=VbHkWg7lVuPtdtkpLXGQN6K/a0xksdg9OtrLsYY0cK+YUYpGV8rI1srqi3HE4iryEi6h
 0pFp4dIpnyjWDXLsoL8Vr91rWK5V8ZrmMQhKKUvEiMpH+1OZ7zyUaUBER96mVLHPymNO
 6wJ1dr5xs8wT9THtvvTl6gq2e8B4I0xHTnFlUQM5FHspaRDmrR5E29XkDh9N1cRVwDXQ
 8a4LDtQuaP9Sw11OYSVfFYYt5MJ5EvzccjuaZuFtvTRhx4q0/M8CiSzVqWJxrzWBm/01
 vvA3tbpcbmkz2jLJxTUQCJ+1NPNhk4nb9X+I6d0mN3Vz7iqp3HCh1QGzNDJLGOVbR15G RQ== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by mx0a-00268f01.pphosted.com (PPS) with ESMTPS id 3fqkwcgraw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Apr 2022 09:12:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5vG+2RAMTtN4M6AIQV/i6vOaDBIpD0NMkFKdwdKxWwQSIZ8LKoE3RY9TtRW0MGZBANTLp+o0Zlh7Albh62PgaEelxVw3QlvD0MpHIhXBbGEgMsXf6lSCbFNLsU5hu0cICggEHqdQgD4IIShUH/eZMW/LwPPw35HIfQPCWb6jcJM/TjSp/jpGER40irpmockYXy1WyZbATz008n1ZCIVlt6pOfP8cOA7aquQReN5MGpKvy8XaQtWLGrA3z0yENOGbno3IHKlQj/NNNh1f0fPIbhxzz3g+21TfvqGTYd90e0m56hQy1mUzBzwXrWD7HM+UPNLD33D/e6b3+yzmIp7Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lReBFmaYwkckjvsophyW8RStQLs6RtU97zzDYXHCOVk=;
 b=W+y8AXPHF3MDc7KbZWo4ExeznjU7K9XfgsfYHwPFjmC88nYlS0NHtXbGehQEVY8jEF7iSChXtme3qm+Y/pgEON6XNC7T2OLtG4W91YOWKaU8rrr2aeyqr1uYFO9x+bBUjARVl3w7j7OmX70SaJ4qGgopEPItMM2xcarz6lPxb4S7iZzwnDmDFxVQ15LEZRmKlLizjQepWZ8BzgbgR00zQ+hHCk6LNhxEYKZ/uahJSDPNrzxZz8GbcWkf/yxLct0fwuAVlecqqPYa0wP39p52sJhUmzpgWhbg/4Tx0+9G61TCZMsjM9+Gdz+VCJGBJQwXkXDIIeC+Hm8Hu6xZrB+b3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by SA2PR04MB7596.namprd04.prod.outlook.com (2603:10b6:806:140::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 28 Apr
 2022 09:11:59 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::8d01:c5c:c8cd:7c56]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::8d01:c5c:c8cd:7c56%4]) with mapi id 15.20.5186.021; Thu, 28 Apr 2022
 09:11:58 +0000
From: Zev Weiss <zweiss@equinix.com>
To: =?iso-8859-1?Q?Jonathan_Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH 2/7] clocksource: timer-npcm7xx: Enable timer 1 clock
 before use
Thread-Topic: [PATCH 2/7] clocksource: timer-npcm7xx: Enable timer 1 clock
 before use
Thread-Index: AQHYWuADPVV+VjUAMkmBJ0XdE73Mwg==
Date: Thu, 28 Apr 2022 09:11:58 +0000
Message-ID: <20220428091158.GD11809@packtop>
References: <20220422183012.444674-1-j.neuschaefer@gmx.net>
 <20220422183012.444674-3-j.neuschaefer@gmx.net>
In-Reply-To: <20220422183012.444674-3-j.neuschaefer@gmx.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a345b9a0-602f-4601-3c8d-08da28f725ec
x-ms-traffictypediagnostic: SA2PR04MB7596:EE_
x-microsoft-antispam-prvs: <SA2PR04MB7596DFA046B14584EB7E1A09C3FD9@SA2PR04MB7596.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HhrEjlocKQdlUhiNL/c0PogdSghNgAgXS+7Hm/26tTDV0pzqsEx+9PbcVFbgeg9UNgeKvH/twe4NiJIG7+aoppEpKyl8EKlig2NgVr5uegi6z8bSFS0tU5/zAxhkNANEme/gBb1Q/O7iuiy15gtOD2qLuroxZT71xH577aOW5DtfsilEUiIkNZnR8LkrxW/JnSe/OZuPLsyQLzSsl4ZG10vSV+7CqvTGw91Bs5aFLmpxCc18FIKCM+AhuejMrzhG5VHrYIjo5j4d49z/WcU1JZHaLvxrVFf7UQKpx+HlphETwmqsMR8/KSejUJUudGPtOd1uQYp8dlCpa8o2QreyPawOn91bSp85C5ghnNKVNKBIFdFQnRw/sLx9OK8slIDiz1CLO2YYravIvIGTaeEwpOwjCEQ0abNNO7QkVh1fZMsxRGdo9b1lIySqjrGItk5iI44seL+vyj8bUwK21/xBqjxjIg9mAkIFZPGTrbhhgZf59ccQnViV2YTpwxg1w7xFuwA7hqUo+Y2nbHeOc7SWwfCTeNQLDIfFeNDIN2vvr6sgPJ4L4q93ATyIcC/NamRRB/OcjORIgdGTHr0iAikmDwHiTPKTf1OsbquIng7fgBqF1EwAFafOLE0f2BdAf8YrE0rIYnLb9qlQ/xh7JDXjJDgOttzQqBy7dbtNTpSAMadWULLYwXZgBa5cJdho6kZyIRB6PMp5wfccZlSfgTEdkw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(4636009)(366004)(186003)(26005)(54906003)(6916009)(71200400001)(1076003)(66574015)(6506007)(6512007)(9686003)(33716001)(33656002)(508600001)(6486002)(38070700005)(8676002)(8936002)(86362001)(5660300002)(7416002)(66946007)(91956017)(64756008)(66446008)(66476007)(66556008)(76116006)(316002)(38100700002)(83380400001)(2906002)(4326008)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?5Qoo5Ap0gLFjQ2Ph29tOSrQEkNfzUJcIPS0cOS5uTF7+XnJDUbm1hxD9wG?=
 =?iso-8859-1?Q?1wPJcI7rLS74+2LTpowKvPEfoASHtFCLQ7ld1VNmaHwqF5dNhoJfRvGOfR?=
 =?iso-8859-1?Q?H+RGWIwGEHxjIyQ5uQOB6F1Tccivq8no+e7wYITMn6sOb/QH0ZQb2osd7Z?=
 =?iso-8859-1?Q?8eOgEGvXlDA3yalapa2le+uXe1jTa5oQMfYv36RFV10POrEKd+1ilTT8xJ?=
 =?iso-8859-1?Q?QsBZF691Yt4FeZ3Ll2T0xuQfLBZeXKHPl1c/B9rmYo1qmrt4X/YR0kmY9V?=
 =?iso-8859-1?Q?DiYu0p9gM5W31tnCxabwF0Q2UANwBWXLHGzcXjBY7k94TMUP0pftaD5Lr5?=
 =?iso-8859-1?Q?NKDfLtQFG7vPBxlQfjdeE+dJlwDILlWkHNuOtZ4wfemr1XxJMOlasJRkVZ?=
 =?iso-8859-1?Q?xrYwvtHBvo9EL2ChMWhXB0S5B9TD9D/gcsvn1mnh334y0jgj0L6j8qxmt1?=
 =?iso-8859-1?Q?j5JCMgESyEX0mkqeUPPcACz5KksHd5W+BA9ahYbZpCtKv0O36i9tQ0y1OD?=
 =?iso-8859-1?Q?BrNb4zla4aWTmecbLA78zytefUXXCWOjzQhf2okFe1w8A9dwDxublci+zb?=
 =?iso-8859-1?Q?KHrzuVtYj3Y7nafWM9CzBo3pfgGPK69YylT9ZRN+OX0aD624Ib//f7eYPT?=
 =?iso-8859-1?Q?rvdaBzjaiCTBjdFTc8dra+fEoHfC5xLewM6MaF1aiYEfL9oIJhtWX4Faea?=
 =?iso-8859-1?Q?9AWqvUnxbDzEnztcGYDKAR4guiJ7WkoWMPaz4LVlkDpyyd7XqYRDGEbz22?=
 =?iso-8859-1?Q?kCY0C7Ausb3dSFR+LwBeOV/4KPNgXQNCkL6G+Xj7AslMSaiZuI3DG7vZ91?=
 =?iso-8859-1?Q?eyQdoyRzW6Q2O4XAGVcdOij/y8neqn+cACWsSSnL8D9duQti2qTBkND2Ft?=
 =?iso-8859-1?Q?ssF18etaeOsWrAxRKqSCeyiS5VP6d5kGXAuvJ46srmb0vBBrqyNUbw62vO?=
 =?iso-8859-1?Q?SofUDVsoIlUnuCvIJcJojXwBR4sQM3H0B04diy9rmMtYeMwShSNJGey5NA?=
 =?iso-8859-1?Q?dzPscJ5e/l3N/2i8Cb/f9GBnhT2ANvu85PQN/be0Xgehu3u4F4AFG1UXki?=
 =?iso-8859-1?Q?VfLgaA+kP8UkgPr2ySXzZYqHsuF02YTUCG/ce/sr9cit4GcyKIlud8+9my?=
 =?iso-8859-1?Q?hqwN0Tl3kLitOVlTnkL/adzL5/kj1UDnyvBdkvuV1BATJcx249Tcm/0HgN?=
 =?iso-8859-1?Q?ZKALE5g/xD6Sj+cqw+IN+71NFh22ruri+WtRGZshAFaqqgemTNwINYvUpR?=
 =?iso-8859-1?Q?zbAvALDO2UnyjeRYnXWpgu4ATHzV1XX/OiGQuZZU4h0OI07vily4uHBhPL?=
 =?iso-8859-1?Q?ImLv9CMaUMD9wvpezBY7JIaRjx7YBQPsR5n57pruaTpzxblZeZGXuxmwYb?=
 =?iso-8859-1?Q?dAPmRazoWr31BmIS+/Q+nsr14mvBYEHWitowxb0HUtU1gGAXhIbm0sud7c?=
 =?iso-8859-1?Q?HJv+c8At5KAstTj/Yer4DOgM5ihqlLA1S345wzr06PbdDPNmxYizdax+Fv?=
 =?iso-8859-1?Q?Ix8qYn+9xLS28ZumUMBo0V8TFJ3ly9aCF+W80A4uzGTIFC16+C/oLPunbN?=
 =?iso-8859-1?Q?Anp4Kf344uwnN7mAUv2fed9bYabaPWYJljANUo2c7snOvYV9I60EkPatoW?=
 =?iso-8859-1?Q?fVeGcJ6umBNazElelk14dewESOrK3FXSJl3UL4nnwGsa0EaDYTVw5aytK0?=
 =?iso-8859-1?Q?402pOIzt0byZPA64MD2n9IDBXvoWz13vm0CppjmKCx8jb+/N6Om3CoBiAF?=
 =?iso-8859-1?Q?15MES5ju8qj9VP7lszWQeNOWLWKRaX6Ntt7sZuO3ysr2jtaNNtiY9aEFrE?=
 =?iso-8859-1?Q?KunTA2VOUA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <3B5D4AD7F1F6484CA96856400AEC7674@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a345b9a0-602f-4601-3c8d-08da28f725ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2022 09:11:58.4149 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qRV2yBC/tXeAkwdthgbXBMoF2HJRk8A6zN0ezqUYwMnsAQebfclM8M4AS2oMtNy3m50NBdfo1FVCEOjB/Ne3fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR04MB7596
X-Proofpoint-ORIG-GUID: I9dJz4s1ktKy-WH-Q6L6wY7Q2aEoMQ7B
X-Proofpoint-GUID: I9dJz4s1ktKy-WH-Q6L6wY7Q2aEoMQ7B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-28_01,2022-04-27_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0 clxscore=1011
 mlxscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204280056
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Patrick Venture <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Guenter Roeck <linux@roeck-us.net>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Apr 22, 2022 at 11:30:07AM PDT, Jonathan Neusch=E4fer wrote:
>In the WPCM450 SoC, the clocks for each timer can be gated individually.
>To prevent the timer 1 clock from being gated, enable it explicitly.
>
>Signed-off-by: Jonathan Neusch=E4fer <j.neuschaefer@gmx.net>
>---
> drivers/clocksource/timer-npcm7xx.c | 14 +++++++++++++-
> 1 file changed, 13 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/clocksource/timer-npcm7xx.c b/drivers/clocksource/tim=
er-npcm7xx.c
>index a00520cbb660a..974269b6b0c36 100644
>--- a/drivers/clocksource/timer-npcm7xx.c
>+++ b/drivers/clocksource/timer-npcm7xx.c
>@@ -188,17 +188,29 @@ static void __init npcm7xx_clocksource_init(void)
>
> static int __init npcm7xx_timer_init(struct device_node *np)
> {
>+	struct clk *clk;
> 	int ret;
>
> 	ret =3D timer_of_init(np, &npcm7xx_to);
>-	if (ret)
>+	if (ret) {
>+		pr_warn("timer_of_init failed: %d\n", ret);

This seems like a somewhat opaque message to emit, especially given this
file's lack of a pr_fmt() definition -- maybe add a %pOF so it's
slightly easier to trace back to the device it stems from?

> 		return ret;
>+	}
>
> 	/* Clock input is divided by PRESCALE + 1 before it is fed */
> 	/* to the counter */
> 	npcm7xx_to.of_clk.rate =3D npcm7xx_to.of_clk.rate /
> 		(NPCM7XX_Tx_MIN_PRESCALE + 1);
>
>+	/* Enable the clock for timer1, if it exists */
>+	clk =3D of_clk_get(np, 1);
>+	if (clk) {
>+		if (!IS_ERR(clk))
>+			clk_prepare_enable(clk);
>+		else
>+			pr_warn("Failed to get clock for timer1: %pe", clk);

Likewise here (though to a slightly lesser extent).

>+	}
>+
> 	npcm7xx_clocksource_init();
> 	npcm7xx_clockevents_init();
>
>--
>2.35.1
>=
