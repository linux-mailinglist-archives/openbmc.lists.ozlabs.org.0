Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6ADC38C0A3
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 09:22:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmdNC5DLHz3066
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 17:22:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=QEdpeHAe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.148.236;
 helo=mx0a-00268f01.pphosted.com;
 envelope-from=prvs=6775408355=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=QEdpeHAe; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmdMb6LMGz305k;
 Fri, 21 May 2021 17:21:47 +1000 (AEST)
Received: from pps.filterd (m0105196.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14L7IQPB025205; Fri, 21 May 2021 07:21:31 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by mx0a-00268f01.pphosted.com with ESMTP id 38nmk9bqbc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 07:21:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=enStXlG6FF5BlDZjtTHRU7INyGo3xVrxcPMPuYE+BuisGreo+2NgxizrJjfKvvbMszh2TiHKXwr+4RSsK5NFyHgdL21IvhnIp2vgfpOrSnL/G58elJIGB0q+UGhXrOztPqA8Q6quLIA/FqQyRQUDVhVz9lxv7d8+QEE8nOLXRsMwur0PcIcyRCfXU3SuN8kdQruZhub/ZDq4Y+CQUr0Dcm3EFt2KMB3rbtmfCaDyGzx1rCyl/2k2ePoEX7SIfRLw7jvDDHOxmW0ne9XbDSpp1H12I/VLRwUs1eLAvInqFcus16UdrtyroyhCZD3EAV5uJ5NZNAbLzIOgD107rkbAzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FLGxGsVnK9vE+kXXv0KRrGiZFLtR+Bt9mEQbXvA3NyU=;
 b=Nmbc6pUflrk0rSYGQ54PBJtR5BUzg+PC/pLnlnCjn7AeRk158OcXRjJ6SleCTKP264iG64sWMb7c1vB2VrmtWpnGoBwokGtd8PAFlB8SGHshc8qyr9E3hvcD2y8uih91HU00mscJJP53pangBdJ/0MEV09sdpybMyVX7NNoFKhq0FcHTjbyg00mokbP/N6Ys4qhqAgOOROs4siFKRo3AfdAk3WnmW9FgvYH8Dd4XZ07VWxEbSHKBjrn+Kd5YCcCKnl/QEHu5oyD5CwB7/InLo6esRdK3WRmU0zBN8ukGpZRY84+MYw3eEAFLfwkVuDwXUDlxUNXpy34Myjxy2FMI0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FLGxGsVnK9vE+kXXv0KRrGiZFLtR+Bt9mEQbXvA3NyU=;
 b=QEdpeHAeMtnaxrxUXN3a21atip19OB3L27rbvz2DRG/A3aaeA/hVKykdM6kPwHZ/yNXi+gy5iJXQnFuo1O/Zb2pkOrqVKMJIxZGMh27YZPblkf5Qbw2dGWLc3MDpRM7eIKAL7SyVLC5ebAz2tb+pAObVFgiWijPFyxzRKiCYh90=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (2603:10b6:3:f3::13) by
 DM6PR04MB3802.namprd04.prod.outlook.com (2603:10b6:5:ac::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.28; Fri, 21 May 2021 07:21:29 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::d9ba:6e7f:b51e:6cab]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::d9ba:6e7f:b51e:6cab%2]) with mapi id 15.20.4129.034; Fri, 21 May 2021
 07:21:29 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v3 14/16] ipmi: kcs_bmc_aspeed: Implement KCS SerIRQ
 configuration
Thread-Topic: [PATCH v3 14/16] ipmi: kcs_bmc_aspeed: Implement KCS SerIRQ
 configuration
Thread-Index: AQHXThHrkyroDDNT8UOtlcaARuhCmw==
Date: Fri, 21 May 2021 07:21:29 +0000
Message-ID: <YKdfeJJM/4LYFKe4@packtop>
References: <20210510054213.1610760-1-andrew@aj.id.au>
 <20210510054213.1610760-15-andrew@aj.id.au>
In-Reply-To: <20210510054213.1610760-15-andrew@aj.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=equinix.com;
x-originating-ip: [24.181.166.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5500025d-97f7-4a7d-7b1f-08d91c290da4
x-ms-traffictypediagnostic: DM6PR04MB3802:
x-microsoft-antispam-prvs: <DM6PR04MB38028A5C5DC62B92C90E73B8C3299@DM6PR04MB3802.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OIMPBQRkmWgzLYM/pNMgn+u+HGhjJW5prDr6ePRt1o9Fl+YSPWm5XgJ2WI//Qn6dVVVvnSwSK44PS7nQ+CUkIVbDkbKTqu+uY1JrOixYBWdwzqga7Di/DFf/8JItUPTWnPCiZU3LZSZfz4TpDiYKoCeTkYtdSWUYqlDnRUlqm+Xt9IJG8ZbRIu/INEY0TCDszRxOUjwx5jyIKurFbaFRInwTLnxw+p/tWeolCk3bIjTyBpCdQtCDW2HpBMKv1qa6WEQBa+HZs/NnV0a49mDyfBaV+Du8SBrVS3dsLD03gFKanPl96qoJI8GWA2wOWfRTGOVtZuGodFeUWtxwmZdTF45h6teeCN8H+QQ4Wj/JvuQ/O3lNz+wlxs9/o4Gj7ud4eT1QHpZkjECzJvO/+Ar9LS7rwXJyQqlmSxX+Jj44nQ2RrqeAQLNoI6S0L13YLL+4NI5idKoBciBp0beI8lLN4jI0lUpWyXpY4OW2X5fS3CQLwvyJG96tY2eovHXfslnROMMvjOO4CPa/11zCWHnP74ZEAKRSr5ZTRHLgLwfX1kCenT0cZvmHMgqgzfYvfYk+s1sis3DK4H1Z7jDqR8b1VCF/Im27+u00SM7oklGqbEY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(136003)(366004)(376002)(39860400002)(346002)(396003)(8936002)(4326008)(8676002)(66946007)(9686003)(6916009)(54906003)(71200400001)(26005)(76116006)(66476007)(66446008)(66556008)(86362001)(316002)(6486002)(2906002)(6512007)(186003)(6506007)(64756008)(83380400001)(122000001)(5660300002)(33716001)(38100700002)(7416002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?WJRHSMv/AfJPSriJMuhj1+6Ob81obwrtwIMj185IF8N3BssdWM5/c39lns96?=
 =?us-ascii?Q?nZtyiUdrJ2M9P2i+j6Mm/ylriTh4wNV1fBM0dXisV5MlEE1oXt5fJaVocVN6?=
 =?us-ascii?Q?QbIiJ6QMDQiqg7VpynTYvQCsKqpoxVQgcJ4KIWXW+xE172sxz9/1yKW/AeFg?=
 =?us-ascii?Q?fmZ3myQygFXgvSQQAeLucjW6h7pYuobvQ13MdLOadz75004H5GOADzAH33ch?=
 =?us-ascii?Q?Y4imsiLYtj9ID0nNoIXll8fEjcYBrWFSGhvzwE2Z/7cqUJ9saGKisI4d9mbG?=
 =?us-ascii?Q?UcwvCIf7VqdrjsUqS0heBG7jTgjt7OiD7Qd/0eg5RY+4zNpt1aqhMS/TIpP8?=
 =?us-ascii?Q?aTHp/+zGt8dIVWupbWAbQHM29yz+LDoagqSqdU1wdM7g7cLzr6FPBcfGaGhl?=
 =?us-ascii?Q?RwNUwoHzMGbA1FTATMCvAVCPYYXyD4nZAUkBye8uLLoOOhWCF/Mvr2UQF9mJ?=
 =?us-ascii?Q?NzrjCiY6gmQ2snMMWoKdLRYR+pUYquHpxVscTuTlBtTbWu+66ovLxutzIIHX?=
 =?us-ascii?Q?6jsjX3K3Z2Uud9GnBYnKgdycMl7SQ9BpE5YPw4PtVMDI/zYwn4Ujjmvwi+g8?=
 =?us-ascii?Q?0yCtyx816JLU8X2r+INdhSN0IeiG82yottIhU9s1EYrrbL6clKE1prRfwZ6H?=
 =?us-ascii?Q?KmtKGG4RUrDIHn9N0JgCXxgFsd7dUHH0pNmIEpZc8L69LYA7FjyTrFnExAbK?=
 =?us-ascii?Q?6VOvocg/LwTsFklE0x3L08tRVZi3a2cDpLSLtiklcnTd7FyBbPmPQ3W1JB89?=
 =?us-ascii?Q?YTQbEdFU8q87ERmAVkNuopEDWPh7jbZ/NVTXiVn4W5fzfIGS8+U2es9VRo/c?=
 =?us-ascii?Q?HF7manQJ0STeN4NECJ4pSX1r8pt6ZdUP4VcltCk9ZLcxN8LyUdUGKzxUqaYo?=
 =?us-ascii?Q?2BpQ/TcZEa7SFgAmpZ4bBfX3ChNsN1vv2UwWpYu+iv2whoCqNwoe8Glr7Quj?=
 =?us-ascii?Q?cVncJ8LcjnSbxKi/jZiuyNASqFuc59uzAk3IL1rmxzmrA4pqD9FKgHXqEPlC?=
 =?us-ascii?Q?8PZqgCubtQzv6LhMTSNmIEkjIuVsc2rwJo4WWci4y9Yw/+bRPuCb01p36vv0?=
 =?us-ascii?Q?HLbM8V7bBiZq0BjlU/8/ixoXyMa2zb7GZL/axXIJ88Qd+W/Hwl01wC4XPFxc?=
 =?us-ascii?Q?ldqhRFEM+lGsl0ovdzeoI54RqZDU4OI/N8nNKf+JnYMQYdIinqEcFFdIpW/I?=
 =?us-ascii?Q?lQqn1yDrnnr2TSeWBy6hFySrwc/Tzw9L/XEZ3WNTOkgcWLLSj/ztO4/hJAE0?=
 =?us-ascii?Q?gkv2s74li8MZFXt71/DZvGXZMb3QZ1XOo0lG2GH1jujp0Vtf/ue2gbL05/AS?=
 =?us-ascii?Q?iD+3+WrdHfaUSqtRFbRNULwxT93ro+oRdwK6wswN2c4iEw=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6CF68F5639F55141A75DB0B864BE7194@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5500025d-97f7-4a7d-7b1f-08d91c290da4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 07:21:29.6186 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y2u4cpUHRLqgkz35gJ34DXHH5jRzySK5RSfMzPow0CXmk1/SE+DFVz/1BLunf3sxYTjhCOsK5TLsyHFhy5nuDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB3802
X-Proofpoint-GUID: v4YxBMgZlNy4BwHtZVPrQ3hY09lzQlE0
X-Proofpoint-ORIG-GUID: v4YxBMgZlNy4BwHtZVPrQ3hY09lzQlE0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_03:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 mlxscore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2105210046
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
 "minyard@acm.org" <minyard@acm.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "avifishman70@gmail.com" <avifishman70@gmail.com>,
 "venture@google.com" <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tali.perry1@gmail.com" <tali.perry1@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
 "benjaminfair@google.com" <benjaminfair@google.com>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>,
 "chiawei_wang@aspeedtech.com" <chiawei_wang@aspeedtech.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "tmaimon77@gmail.com" <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, May 10, 2021 at 12:42:11AM CDT, Andrew Jeffery wrote:
>Apply the SerIRQ ID and level/sense behaviours from the devicetree if
>provided.
>
>Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>---
> drivers/char/ipmi/kcs_bmc_aspeed.c | 182 ++++++++++++++++++++++++++++-
> 1 file changed, 180 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bm=
c_aspeed.c
>index 8a0b1e18e945..9b81806b4dcb 100644
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

I'm struggling a bit with understanding this comment, and relating it to
the code -- it sounds like "we need to do things one way on A3 and
later, and another way on pre-A3", but then...we just break without
doing anything at all either way.  Can you clarify any further?

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
>@@ -262,7 +419,7 @@ static irqreturn_t aspeed_kcs_irq(int irq, void *arg)
> 	return kcs_bmc_handle_event(kcs_bmc);
> }
>
>-static int aspeed_kcs_config_irq(struct kcs_bmc_device *kcs_bmc,
>+static int aspeed_kcs_config_downstream_irq(struct kcs_bmc_device *kcs_bm=
c,
> 			struct platform_device *pdev)
> {
> 	struct device *dev =3D &pdev->dev;
>@@ -366,6 +523,8 @@ static int aspeed_kcs_probe(struct platform_device *pd=
ev)
> 	struct aspeed_kcs_bmc *priv;
> 	struct device_node *np;
> 	int rc, channel, addr;
>+	bool have_upstream_irq;
>+	u32 upstream_irq[2];
>
> 	np =3D pdev->dev.of_node->parent;
> 	if (!of_device_is_compatible(np, "aspeed,ast2400-lpc-v2") &&
>@@ -374,6 +533,7 @@ static int aspeed_kcs_probe(struct platform_device *pd=
ev)
> 		dev_err(&pdev->dev, "unsupported LPC device binding\n");
> 		return -ENODEV;
> 	}
>+
> 	ops =3D of_device_get_match_data(&pdev->dev);
> 	if (!ops)
> 		return -EINVAL;
>@@ -386,6 +546,13 @@ static int aspeed_kcs_probe(struct platform_device *p=
dev)
> 	if (addr < 0)
> 		return addr;
>
>+	np =3D pdev->dev.of_node;
>+	rc =3D of_property_read_u32_array(np, "aspeed,lpc-interrupts", upstream_=
irq, 2);
>+	if ((rc && rc !=3D -EINVAL))

I think we could probably get by with slightly fewer parens here...

>+		return -EINVAL;
>+
>+	have_upstream_irq =3D !rc;
>+
> 	priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> 	if (!priv)
> 		return -ENOMEM;
>@@ -408,10 +575,20 @@ static int aspeed_kcs_probe(struct platform_device *=
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
>+	if (have_upstream_irq) {
>+		rc =3D aspeed_kcs_config_upstream_irq(priv, upstream_irq[0], upstream_i=
rq[1]);
>+		if (rc < 0)
>+			return rc;
>+	} else {
>+		priv->upstream_irq.mode =3D aspeed_kcs_irq_none;
>+	}
>+
> 	platform_set_drvdata(pdev, priv);
>
> 	aspeed_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EV=
ENT_TYPE_OBE), 0);
>@@ -474,4 +651,5 @@ module_platform_driver(ast_kcs_bmc_driver);
>
> MODULE_LICENSE("GPL v2");
> MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
>+MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
> MODULE_DESCRIPTION("Aspeed device interface to the KCS BMC device");
>--=20
>2.27.0
>=
