Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4012A351363
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 12:24:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9znq1s4tz30BK
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 21:24:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=nl9uBM9U;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.148.236;
 helo=mx0a-00268f01.pphosted.com;
 envelope-from=prvs=57252e1af0=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=nl9uBM9U; 
 dkim-atps=neutral
X-Greylist: delayed 3195 seconds by postgrey-1.36 at boromir;
 Thu, 01 Apr 2021 21:24:31 AEDT
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9znW6Xs1z302T;
 Thu,  1 Apr 2021 21:24:31 +1100 (AEDT)
Received: from pps.filterd (m0165119.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1319OdB4017140; Thu, 1 Apr 2021 09:30:42 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 by mx0a-00268f01.pphosted.com with ESMTP id 37n296hh3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Apr 2021 09:30:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cowjl1aFJL3P8f3UvkGOfCYmTH+z9HtUHti4RLZQVVvs+mOlvQj162PYOqtn5hLW7RX+T4hOIcIroWSSpOmBR42JvENVPMsrL9sUSvDM8em02jkFsSrkn4lDScOx1M2GlZbuLelX+pLqV6Gayf5aJYxjV4VyI68oFiPCfZn3DHmLZrQGDjp9A9XwowaTtyEdfdD3qDQMBL0Dd0dE9sUk7GAjmRdcJdEodNRjmruuFmXaCsMhowBYfOWdZEhqW5NZZqh7MfCteBzbHULcOxu0qlhQsBId5A3ElfB6C06FE/hocG8NB1ZR2cxUrqCkBOYq9vYImyDPR03nKfSSmXEgBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eyrOr0T8Mpmt21r8dkJTEWt285iJcL64jmQdtsxas0E=;
 b=oJw5ICFVtxiEgDJOxRNriNBuSJG3he21EVB+LWak9LX+qCXcoULjCIPIgbc1ijau5DAOlw+yNLpoODubAVXE1R7NCGwkvZ5SxR+QCLjDJlIYjDC7qMSipepBahSrhSsTgPm8YTOpRq9aR18xJiJiKBDdM2RaV/pC9aNcQWBGOFFSffWEBKLj3kQXkGFkRL0qOaBLWbyKda7uYIy354VKVbCOhJBmKoc5gw9KD5s0unUajmwhXYNd4xboUV93Qw+VZA+5Uws6yYMuLv8MNvhAoNvyXmIieM0qlSdOGJSPpenXrJsZZfVYROGsq9d3PeUYFkYD6F8MQGqoxV5Cy7rCJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eyrOr0T8Mpmt21r8dkJTEWt285iJcL64jmQdtsxas0E=;
 b=nl9uBM9U7n5LIWC7FYLar7XhslpMkd4a3+Gvhc1mCu5eQazggCBUvIcJibI6YJE8Fn08vBVnC8Yb57rDMvB8SPASvywMczae7HlEHmX76R9FD4CCurFtGgFgCf5Myi50E8INQzGxZyAnt0QOThNsN6JM79LWx0IE0U+2zgj/+M4=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (10.172.185.141) by
 DM5PR04MB0187.namprd04.prod.outlook.com (10.168.235.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.27; Thu, 1 Apr 2021 09:30:38 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad%5]) with mapi id 15.20.3977.033; Thu, 1 Apr 2021
 09:30:38 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [EXTERNAL] [PATCH v2 19/21] ipmi: kcs_bmc_aspeed: Implement KCS
 SerIRQ configuration
Thread-Topic: [EXTERNAL] [PATCH v2 19/21] ipmi: kcs_bmc_aspeed: Implement KCS
 SerIRQ configuration
Thread-Index: AQHXHIp2IZml0ru49Eaj2kMGkdtd9qqfekOA
Date: Thu, 1 Apr 2021 09:30:38 +0000
Message-ID: <YGWSvRQADGK4Rfkc@packtop>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-19-andrew@aj.id.au>
In-Reply-To: <20210319062752.145730-19-andrew@aj.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=equinix.com;
x-originating-ip: [24.181.166.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1afe43c2-c9da-4c6f-1033-08d8f4f0cf85
x-ms-traffictypediagnostic: DM5PR04MB0187:
x-microsoft-antispam-prvs: <DM5PR04MB01873230AB6D412918C8ECF6C37B9@DM5PR04MB0187.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lsMJPPH9tkwYDpAQU/bojqT5fez/zDyzejJYTBmZ1Eqf/qgboflKoRBNypke9b7i6KyenHZPPIcSjq/c4MmZ/GNS3m9lm5kA2IZnd0XdcHKbLZvlddIlMcriZd5pHU2rmHG1o1Jt8NXKF/ITYNlqHHHqaMMipAIR0Q8bQU8T7IqKYZohOa/ZYtwlO/h/3XlN5DbsgC3gCsoHyyCZSHUT1S3Ow4xRtxVaRo6NZMgSSAx49AOhAyjWbbJGD/q1v9NFLShWRe7HIvg/VzrvDCDROKdQIKsfWVuRDrBIiDkS8FyBHo8eCsYIpyCj6tpQW7mrXTa2QQ2p6yP6+OeHCMEXO1csXrQirs+ncZp0mTYfCH+j+n/TEQSWSYbs0GRkjN4dnCoU1Vl6zyJwWGRTiu1hSODIp6L3qDf+tvxZWD+ClkzZho3IeME7P2E7VsN3WiqjmMJZJyqS9CfOXJeQkzmvrCzzol4VOUvffEGt300EkKqPUpINSXgzjqpb5toEr8M81u+FPajTXWgrcbMI8dXuy8gBUXpt4l2KdvvwnoNHZ02vvhH1UcHq1NbJKq3sWQOoDMMs0YMZNahwq3sRg9BeexleUS80v15BFpi/bTkiicQudLOt6NPzcp4LPz0XabUgXC3DaaeFxKMPCnZnFMTO8g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(366004)(346002)(376002)(396003)(39860400002)(136003)(86362001)(38100700001)(6916009)(478600001)(54906003)(66556008)(186003)(66446008)(66946007)(76116006)(71200400001)(33716001)(26005)(64756008)(66476007)(6512007)(316002)(5660300002)(8676002)(6506007)(9686003)(83380400001)(4326008)(7416002)(2906002)(8936002)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?d4jEn9Lqej/pw1j5v2cDObDB9ku2hGlPtJwaRkpzJYP+o4CP9vkLXMDH6T8Z?=
 =?us-ascii?Q?lI0Pkmq/rYdJ4JylSn22I64Yq8bzEZWBKXPp9cgPAMQJbpxjmx+pdcW2auh5?=
 =?us-ascii?Q?KfQIpW1rQPlOhe9uUMdjsgFO9U05WT6EHQ1dVkMMsFZS2ncqFw1Ds+8DpYTf?=
 =?us-ascii?Q?u5aRYzg0CHQId1j4r7AiDe6op477DBnqW+AI/dy6jjOWxV3734mNmRo9pcme?=
 =?us-ascii?Q?j14BewU8fKv2WjVgjXNFIDVqMZSiuY0S/2ib+prJSqJUslscY5mn1oCnWKs3?=
 =?us-ascii?Q?G/3WD0rH1VHb5LygDYR1Kj7gJiJumOGPUmQzwy/RFjDtDfC5891YDIeNZ2/W?=
 =?us-ascii?Q?z6nDuY6mCBNmhab5a5AnuzNMkNRnmDiHW+yLTn0rvGDVmKqbGpG7TOvDH5lD?=
 =?us-ascii?Q?CuXDz7Z1BfW3eb8+twB0fLfUcF3TW4spaByZQxeFygOwRXbQEcjMlzB5TMPB?=
 =?us-ascii?Q?34gLE2JtX5cW9cQfq3dQl9mY7ymonX0WlKXq0NRMtFocRE+2HHLC1f/pBbAn?=
 =?us-ascii?Q?kyrvk5M8DeK05ki4msrHUYsJTdLwCa3B/SJlrkBpwDLLo/eNeo3Qnnq1g+Qh?=
 =?us-ascii?Q?YBR8sn+2Hmwvym5UfTUec9wlYMLMeW/FvalQIM28rzcJpbVy4sRPmu6VeP8A?=
 =?us-ascii?Q?OCnv8JFuquXceIckYRPjohzKHDk3hPurtRKyFfJDGpQ2+WfQabE6PEdFUkXR?=
 =?us-ascii?Q?NmO7qtsnZKu0CxobbC+HzNTYj2PkrgHGg45G1Vh/K+fE0nyD0KErmByjEYAQ?=
 =?us-ascii?Q?IhwsudxFeRHIoYP7rGLg5V74laGsYd+d+6cYWYnrrPWqwnw8Zyp2LKT97UtQ?=
 =?us-ascii?Q?AuFM9k+BUDQLOKMlvkIpgPc3QEHrcx2ceN6XNA0e9Q8ucVV3uvODG5qLZ+/z?=
 =?us-ascii?Q?1VHlUekOx7CECJw0MdQLLUgL0OaGuPCSSXJt7QkHPmdvkyvGIabO7JBFAzqX?=
 =?us-ascii?Q?KbOMexepkzh/MrjTxu45bZiptzA5hQ4TIoE/iHCDit8tger9VOuqe8aGTfXt?=
 =?us-ascii?Q?I+zCpjBcviOowaADta+atoQtOutJlrJzfiN+7OTc2BP4bDwE8rzH5dLUmH+G?=
 =?us-ascii?Q?XfXJnUemuhO8pLU+Z5X7q5f0SF54qg3OzBS6qRbHJVl9EM6W8t8KQ+Rfng0F?=
 =?us-ascii?Q?F8Pm4aW+C0b6XsvDTJIqHDQWHkkVa/OAbQnE4apSrB3WVIAyoly+zZNvsNLA?=
 =?us-ascii?Q?tfU4HiKTs0Oh7C99IvWqeoxYoaU6XoWTaN6HpmoTW5hSO8RPiaKzt9rSO3na?=
 =?us-ascii?Q?12fJMhAwVsUfZoAVxwP60+vVhi2EphcVBKk0bwadUp+/lCKSF6Fh0UPrFPZZ?=
 =?us-ascii?Q?0cYF/zRIH6VhVrc+qZ68jLpa?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1023A3215875A84889D115121B2E88DA@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1afe43c2-c9da-4c6f-1033-08d8f4f0cf85
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2021 09:30:38.2668 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mr+azly1OQoMhXqJcrRa4BvPgDTbtQk3SpwB66GNHC52aEEhNHkzvo/DBKVOk+zyt4gAgtwHasICUDtzZNmSaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0187
X-Proofpoint-GUID: 1bJJrtbjc351uoEOZkvkENHOuYhIeAfv
X-Proofpoint-ORIG-GUID: 1bJJrtbjc351uoEOZkvkENHOuYhIeAfv
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-01_04:2021-03-31,
 2021-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103310000 definitions=main-2104010066
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
 "chiawei_wang@aspeedtech.com" <chiawei_wang@aspeedtech.com>,
 "ryan_chen@aspeedtech.com" <ryan_chen@aspeedtech.com>,
 "tmaimon77@gmail.com" <tmaimon77@gmail.com>,
 "minyard@acm.org" <minyard@acm.org>,
 "avifishman70@gmail.com" <avifishman70@gmail.com>,
 "venture@google.com" <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tali.perry1@gmail.com" <tali.perry1@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "benjaminfair@google.com" <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Mar 19, 2021 at 01:27:50AM CDT, Andrew Jeffery wrote:
>Apply the SerIRQ ID and level/sense behaviours from the devicetree if
>provided.
>
>Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>---
> drivers/char/ipmi/kcs_bmc_aspeed.c | 179 ++++++++++++++++++++++++++++-
> 1 file changed, 177 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bm=
c_aspeed.c
>index 271845eb2e26..3782aef4eb73 100644
>--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
>+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
>@@ -9,6 +9,7 @@
> #include <linux/errno.h>
> #include <linux/interrupt.h>
> #include <linux/io.h>
>+#include <linux/irq.h>
> #include <linux/mfd/syscon.h>
> #include <linux/module.h>
> #include <linux/of.h>
>@@ -28,6 +29,22 @@
>
> #define KCS_CHANNEL_MAX     4
>
>+/*
>+ * Field class descriptions
>+ *
>+ * LPCyE	Enable LPC channel y
>+ * IBFIEy	Input Buffer Full IRQ Enable for LPC channel y
>+ * IRQxEy	Assert SerIRQ x for LPC channel y (Deprecated, use IDyIRQX, IRQ=
XEy)
>+ * IDyIRQX	Use the specified 4-bit SerIRQ for LPC channel y
>+ * SELyIRQX	SerIRQ polarity for LPC channel y (low: 0, high: 1)
>+ * IRQXEy	Assert the SerIRQ specified in IDyIRQX for LPC channel y
>+ */
>+
>+#define LPC_TYIRQX_LOW       0b00
>+#define LPC_TYIRQX_HIGH      0b01
>+#define LPC_TYIRQX_RSVD      0b10
>+#define LPC_TYIRQX_RISING    0b11
>+
> #define LPC_HICR0            0x000
> #define     LPC_HICR0_LPC3E          BIT(7)
> #define     LPC_HICR0_LPC2E          BIT(6)
>@@ -39,6 +56,19 @@
> #define LPC_HICR4            0x010
> #define     LPC_HICR4_LADR12AS       BIT(7)
> #define     LPC_HICR4_KCSENBL        BIT(2)
>+#define LPC_SIRQCR0	     0x070
>+/* IRQ{12,1}E1 are deprecated as of AST2600 A3 but necessary for prior ch=
ips */
>+#define     LPC_SIRQCR0_IRQ12E1	     BIT(1)
>+#define     LPC_SIRQCR0_IRQ1E1	     BIT(0)
>+#define LPC_HICR5	     0x080
>+#define     LPC_HICR5_ID3IRQX_MASK   GENMASK(23, 20)
>+#define     LPC_HICR5_ID3IRQX_SHIFT  20
>+#define     LPC_HICR5_ID2IRQX_MASK   GENMASK(19, 16)
>+#define     LPC_HICR5_ID2IRQX_SHIFT  16
>+#define     LPC_HICR5_SEL3IRQX       BIT(15)
>+#define     LPC_HICR5_IRQXE3         BIT(14)
>+#define     LPC_HICR5_SEL2IRQX       BIT(13)
>+#define     LPC_HICR5_IRQXE2         BIT(12)
> #define LPC_LADR3H           0x014
> #define LPC_LADR3L           0x018
> #define LPC_LADR12H          0x01C
>@@ -55,6 +85,13 @@
> #define LPC_HICRB            0x100
> #define     LPC_HICRB_IBFIF4         BIT(1)
> #define     LPC_HICRB_LPC4E          BIT(0)
>+#define LPC_HICRC            0x104
>+#define     LPC_HICRC_ID4IRQX_MASK   GENMASK(7, 4)
>+#define     LPC_HICRC_ID4IRQX_SHIFT  4
>+#define     LPC_HICRC_TY4IRQX_MASK   GENMASK(3, 2)
>+#define     LPC_HICRC_TY4IRQX_SHIFT  2
>+#define     LPC_HICRC_OBF4_AUTO_CLR  BIT(1)
>+#define     LPC_HICRC_IRQXE4         BIT(0)
> #define LPC_LADR4            0x110
> #define LPC_IDR4             0x114
> #define LPC_ODR4             0x118
>@@ -62,11 +99,21 @@
>
> #define OBE_POLL_PERIOD	     (HZ / 2)
>
>+enum aspeed_kcs_irq_mode {
>+	aspeed_kcs_irq_none,
>+	aspeed_kcs_irq_serirq,
>+};
>+
> struct aspeed_kcs_bmc {
> 	struct kcs_bmc_device kcs_bmc;
>
> 	struct regmap *map;
>
>+	struct {
>+		enum aspeed_kcs_irq_mode mode;
>+		int id;
>+	} upstream_irq;
>+
> 	struct {
> 		spinlock_t lock;
> 		bool remove;
>@@ -103,6 +150,49 @@ static void aspeed_kcs_outb(struct kcs_bmc_device *kc=
s_bmc, u32 reg, u8 data)
>
> 	rc =3D regmap_write(priv->map, reg, data);
> 	WARN(rc !=3D 0, "regmap_write() failed: %d\n", rc);
>+
>+	/* Trigger the upstream IRQ on ODR writes, if enabled */
>+
>+	switch (reg) {
>+	case LPC_ODR1:
>+	case LPC_ODR2:
>+	case LPC_ODR3:
>+	case LPC_ODR4:
>+		break;
>+	default:
>+		return;
>+	}
>+
>+	if (priv->upstream_irq.mode !=3D aspeed_kcs_irq_serirq)
>+		return;
>+
>+	switch (kcs_bmc->channel) {
>+	case 1:
>+		switch (priv->upstream_irq.id) {
>+		case 12:
>+			regmap_update_bits(priv->map, LPC_SIRQCR0, LPC_SIRQCR0_IRQ12E1,
>+					   LPC_SIRQCR0_IRQ12E1);
>+			break;
>+		case 1:
>+			regmap_update_bits(priv->map, LPC_SIRQCR0, LPC_SIRQCR0_IRQ1E1,
>+					   LPC_SIRQCR0_IRQ1E1);
>+			break;
>+		default:
>+			break;
>+		}
>+		break;
>+	case 2:
>+		regmap_update_bits(priv->map, LPC_HICR5, LPC_HICR5_IRQXE2, LPC_HICR5_IR=
QXE2);
>+		break;
>+	case 3:
>+		regmap_update_bits(priv->map, LPC_HICR5, LPC_HICR5_IRQXE3, LPC_HICR5_IR=
QXE3);
>+		break;
>+	case 4:
>+		regmap_update_bits(priv->map, LPC_HICRC, LPC_HICRC_IRQXE4, LPC_HICRC_IR=
QXE4);
>+		break;
>+	default:
>+		break;
>+	}
> }
>
> static void aspeed_kcs_updateb(struct kcs_bmc_device *kcs_bmc, u32 reg, u=
8 mask, u8 val)
>@@ -161,6 +251,73 @@ static void aspeed_kcs_set_address(struct kcs_bmc_dev=
ice *kcs_bmc, u16 addr)
> 	}
> }
>
>+static inline int aspeed_kcs_map_serirq_type(u32 dt_type)
>+{
>+	switch (dt_type) {
>+	case IRQ_TYPE_EDGE_RISING:
>+		return LPC_TYIRQX_RISING;
>+	case IRQ_TYPE_LEVEL_HIGH:
>+		return LPC_TYIRQX_HIGH;
>+	case IRQ_TYPE_LEVEL_LOW:
>+		return LPC_TYIRQX_LOW;
>+	default:
>+		return -EINVAL;
>+	}
>+}
>+
>+static int aspeed_kcs_config_upstream_irq(struct aspeed_kcs_bmc *priv, u3=
2 id, u32 dt_type)
>+{
>+	unsigned int mask, val, hw_type;
>+
>+	if (id > 15)
>+		return -EINVAL;
>+
>+	hw_type =3D aspeed_kcs_map_serirq_type(dt_type);
>+	if (hw_type < 0)
>+		return hw_type;
>+
>+	priv->upstream_irq.mode =3D aspeed_kcs_irq_serirq;
>+	priv->upstream_irq.id =3D id;
>+
>+	switch (priv->kcs_bmc.channel) {
>+	case 1:
>+		/* Needs IRQxE1 rather than (ID1IRQX, SEL1IRQX, IRQXE1) before AST2600 =
A3 */
>+		break;
>+	case 2:
>+		if (!(hw_type =3D=3D LPC_TYIRQX_LOW || hw_type =3D=3D LPC_TYIRQX_HIGH))
>+			return -EINVAL;
>+
>+		mask =3D LPC_HICR5_SEL2IRQX | LPC_HICR5_ID2IRQX_MASK;
>+		val =3D (id << LPC_HICR5_ID2IRQX_SHIFT);
>+		val |=3D (hw_type =3D=3D LPC_TYIRQX_HIGH) ? LPC_HICR5_SEL2IRQX : 0;
>+		regmap_update_bits(priv->map, LPC_HICR5, mask, val);
>+
>+		break;
>+	case 3:
>+		if (!(hw_type =3D=3D LPC_TYIRQX_LOW || hw_type =3D=3D LPC_TYIRQX_HIGH))
>+			return -EINVAL;
>+
>+		mask =3D LPC_HICR5_SEL3IRQX | LPC_HICR5_ID3IRQX_MASK;
>+		val =3D (id << LPC_HICR5_ID3IRQX_SHIFT);
>+		val |=3D (hw_type =3D=3D LPC_TYIRQX_HIGH) ? LPC_HICR5_SEL3IRQX : 0;
>+		regmap_update_bits(priv->map, LPC_HICR5, mask, val);
>+
>+		break;
>+	case 4:
>+		mask =3D LPC_HICRC_ID4IRQX_MASK | LPC_HICRC_TY4IRQX_MASK | LPC_HICRC_OB=
F4_AUTO_CLR;
>+		val =3D (id << LPC_HICRC_ID4IRQX_SHIFT) | (hw_type << LPC_HICRC_TY4IRQX=
_SHIFT);
>+		regmap_update_bits(priv->map, LPC_HICRC, mask, val);
>+		break;
>+	default:
>+		dev_warn(priv->kcs_bmc.dev,
>+			 "SerIRQ configuration not supported on KCS channel %d\n",
>+			 priv->kcs_bmc.channel);
>+		return -EINVAL;
>+	}
>+
>+	return 0;
>+}
>+
> static void aspeed_kcs_enable_channel(struct kcs_bmc_device *kcs_bmc, boo=
l enable)
> {
> 	struct aspeed_kcs_bmc *priv =3D to_aspeed_kcs_bmc(kcs_bmc);
>@@ -267,7 +424,7 @@ static irqreturn_t aspeed_kcs_irq(int irq, void *arg)
> 	return rc =3D=3D KCS_BMC_EVENT_HANDLED ? IRQ_HANDLED : IRQ_NONE;
> }
>
>-static int aspeed_kcs_config_irq(struct kcs_bmc_device *kcs_bmc,
>+static int aspeed_kcs_config_downstream_irq(struct kcs_bmc_device *kcs_bm=
c,
> 			struct platform_device *pdev)
> {
> 	struct device *dev =3D &pdev->dev;
>@@ -371,6 +528,8 @@ static int aspeed_kcs_probe(struct platform_device *pd=
ev)
> 	struct aspeed_kcs_bmc *priv;
> 	struct device_node *np;
> 	int rc, channel, addr;
>+	bool have_upstream_irq;
>+	u32 upstream_irq[2];
>
> 	np =3D pdev->dev.of_node->parent;
> 	if (!of_device_is_compatible(np, "aspeed,ast2400-lpc-v2") &&
>@@ -379,6 +538,7 @@ static int aspeed_kcs_probe(struct platform_device *pd=
ev)
> 		dev_err(&pdev->dev, "unsupported LPC device binding\n");
> 		return -ENODEV;
> 	}
>+
> 	ops =3D of_device_get_match_data(&pdev->dev);
> 	if (!ops)
> 		return -EINVAL;
>@@ -391,6 +551,13 @@ static int aspeed_kcs_probe(struct platform_device *p=
dev)
> 	if (addr < 0)
> 		return addr;
>
>+	np =3D pdev->dev.of_node;
>+	rc =3D of_property_read_u32_array(np, "aspeed,lpc-interrupts", upstream_=
irq, 2);
>+	if ((rc && rc !=3D -EINVAL))
>+		return -EINVAL;
>+
>+	have_upstream_irq =3D !rc;
>+
> 	priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> 	if (!priv)
> 		return -ENOMEM;
>@@ -413,10 +580,17 @@ static int aspeed_kcs_probe(struct platform_device *=
pdev)
>
> 	aspeed_kcs_set_address(kcs_bmc, addr);
>
>-	rc =3D aspeed_kcs_config_irq(kcs_bmc, pdev);
>+	/* Host to BMC IRQ */
>+	rc =3D aspeed_kcs_config_downstream_irq(kcs_bmc, pdev);
> 	if (rc)
> 		return rc;
>
>+	/* BMC to Host IRQ */
>+	if (have_upstream_irq)
>+		aspeed_kcs_config_upstream_irq(priv, upstream_irq[0], upstream_irq[1]);

This has a return value that could indicate an error if the DT
properties are misconfigured; do we want to check for that here?

>+	else
>+		priv->upstream_irq.mode =3D aspeed_kcs_irq_none;
>+
> 	platform_set_drvdata(pdev, priv);
>
> 	aspeed_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EV=
ENT_TYPE_OBE), 0);
>@@ -481,4 +655,5 @@ module_platform_driver(ast_kcs_bmc_driver);
>
> MODULE_LICENSE("GPL v2");
> MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
>+MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
> MODULE_DESCRIPTION("Aspeed device interface to the KCS BMC device");
>--=20
>2.27.0
>=
