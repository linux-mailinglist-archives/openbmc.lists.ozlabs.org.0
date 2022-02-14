Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DEE4B40F4
	for <lists+openbmc@lfdr.de>; Mon, 14 Feb 2022 05:38:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jxs0S4sLXz30FH
	for <lists+openbmc@lfdr.de>; Mon, 14 Feb 2022 15:38:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=LPggZ0EL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:febc::707;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=LPggZ0EL; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on0707.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::707])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jxrq43YVMz3bV4
 for <openbmc@lists.ozlabs.org>; Mon, 14 Feb 2022 15:29:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lKqem1N5D8WInqybYOoJiY0OGQJgDfsXa08o0no8d3CFBREjYz/o4jmKtRNWr90a7iQAZgmoFOp1phEYPKFGloD8rOJZRnGTBvC7j9XFqIlQlWXpfE8TzuPSlEOFkG6pkDDG5vUavGTBSkT6IjDNfmqh/G7SS+DLjy1Ytn6773XikPc5zUZ5ZROpXd071oRoitb5XkLVVv1ZH+L0EKD4a1iriDfdQo9q7RGPL+fb/p89oJraNOk1cDg/Uy/JPW9kk2Y8mdVxaxNcSi2+yf+ByM+Y3jKRgEs0QBUouniaDpQbuFRv6iio+6lzQie3RJVZO4/cJc4gzQrHqqQwVvOGxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KpAZh1T7C+POkdbs/YT2d/ls+QvRhT3Kw33SEe6rvw4=;
 b=lyfB9Fi9yc2B8jRfqaIunC52BUDnsoDU+Dibi9h7+LchxRSKWf/1mdF8TRB8R28oJ+cHEFfNqdLoAIRk+dq7WqAFMZHRpdfAXClJ386wl9w6Dpu9E/sXBm4Jgu3sjoj5qlH5OO48mr/g5QDV7Z0Q3srS1Hvovpu0k2LW8MThyglDbFbEpAfMgV0pjQBI3uIglmUKlfjRnmuVF6czgeCRqrWk44mE/libvRHJ5jZXhc/E2OpaeE3knD+IUR8WmIrV39SNr4PIhaxLfBWrOvdGKe1JgmUzipD6W9YDY6uW6U4srVSUVLhEUGWIHt/RKAk7Xd5HmrQOf4Gdp0A/60O9KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KpAZh1T7C+POkdbs/YT2d/ls+QvRhT3Kw33SEe6rvw4=;
 b=LPggZ0ELBXijmlbVMJOzDhArLFvhRGWODVIdEv5sdQV6WTOls3aziIuNOzKADqAlSWB4uwiJgsVZKP2x4E7wqum3ZXUWSYrFtgQyqcmUGqw4SNIaKI1gcGBtmigssy+3yF6twDhlK7lQUZWCLhC+f/rCqqprnuPedbaLVPrPidM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by HK0PR04MB2292.apcprd04.prod.outlook.com (2603:1096:203:4b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 04:29:30 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03%4]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 04:29:29 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 v2 07/10] arch: arm: dts: bletchley: add
 shunt-resistor for ADM1278
Date: Mon, 14 Feb 2022 12:29:09 +0800
Message-Id: <20220214042912.14584-8-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220214042912.14584-1-potin.lai@quantatw.com>
References: <20220214042912.14584-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:202:16::20) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2901b23-5149-45ae-7c80-08d9ef7296e5
X-MS-TrafficTypeDiagnostic: HK0PR04MB2292:EE_
X-Microsoft-Antispam-PRVS: <HK0PR04MB2292C60CABFEFFA6940EA8608E339@HK0PR04MB2292.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:330;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zgTj7bkkiPiAAvBTReN9OnHYAVDBXL9Hm6xIpVPNepHiLlE/KtN0pNL4BUtVFhELUrUfhv/aL/13zzQnUBjDskd4m77ZKXD2q+2mqS76UpzugaVjj8ZWAiDqk0PKRVLQDkylXr518PRZEHoiyd9NgQBu4SCwwLnLshAFqqK0bsAzqVI+UFMaG9+EKQR81dYtgBIqCB5GiIgKtxsdveBhpnADHdOGhA0qCA32L2bTGDu9YOb/2bTpVTRTJii/2GxgLglhwNO11n8XuUirYb7C2m+5wdhDH4h1wn3l5nL50VpS75g2yh+epwuvpfFVa0deQ5VhMPW/wf0RbO8og5pa36oUA4EqpNM+WlmIqFWBbYs0ZuzHHtTYUm1XqiJneRHsy2jZWvgm5GFZr2xZCFOQJJXkn3kJugFHyqqG7tC8SHUOTorbgueNaJ/QlmvcerYzvMro7GT+UAkR02+DJZ55OTI7F96hCkz79TQ9ng+hGTibU7Ef16moSiVfXXBx259yONaNpkg3up3mN+7uFsihLhaOMJoAbyHUHwCF9D65b0CtaIwGPdJ1dBudfgqilcCDpmmcsVGVddm8uJVPAx/q00bueciPectAD3IGmOA0heWTiPvhLgIcrPwvBK6L5SQUqSzg3tOdcfWTlO+dWaJplOzUzs8eaKOCyQE/YuWu1CRJ14HUMATBc4ZWBjzLpF8lQNrzI3Oi7xbNninChxdh2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(6486002)(52116002)(36756003)(2906002)(44832011)(508600001)(38350700002)(316002)(38100700002)(8676002)(186003)(66946007)(4326008)(66476007)(66556008)(26005)(107886003)(6666004)(8936002)(2616005)(5660300002)(1076003)(4744005)(6506007)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5/BMU98HyUniXHp4H0JvOLd2pM3qPwuRY8WRCd41L5ZaRQywNpsdr9zZdiMj?=
 =?us-ascii?Q?MmfIS9ifZy75SHBI9uRZkOrk8UpWmopRUFK4Xub2huqt+pq4aSS1hFp2d7a8?=
 =?us-ascii?Q?kR8t10eSn7zFjpCNxZfj2RWyT+oZjklBQnB13ZAaSuMHsW/162yNZV0ihj7l?=
 =?us-ascii?Q?1d4LzG9ik+U+sDUh6mqn9nIBNkI5ftXIIEajovg1Bh45nX1b4D+6k3WSfFJG?=
 =?us-ascii?Q?5sqWLWpGsQW8wk9tWHCg4j0gVl50QEz+p4s1Kyw/j63bV2m74jTvScZKm/ep?=
 =?us-ascii?Q?A1UXKDbm+DEegaZqp33C+9Hpo2KljcfsTt6/+bFJ12adY1KDzZX4LzL8sI1w?=
 =?us-ascii?Q?CT2QuZBYDxybaFvMCOW5YOP5+ECMV5kkoPiWyYONW7a8gr6NKFD2Fi9IGHR1?=
 =?us-ascii?Q?7LxYa76CqLfHkZj7mBXQvBZANceLEblqKJXbSfOm53nwsVv1iwtnhYV2nSA1?=
 =?us-ascii?Q?HQennLapbzcAr0OMMkNYi1OgLvh17JR7a0FXhg/V8y9ctCeNpD/2RoODlFL3?=
 =?us-ascii?Q?cYauqONNiYcspLGx/br2hSY80mQSFPbw0VD0O2P9zzAdE/vIlg1kgL8dTfRI?=
 =?us-ascii?Q?wD//p7pqde0QKhpePV66Qwolhh4X+0O8bJJh4FWiGc8h9xf3zK1O/T/JOEWu?=
 =?us-ascii?Q?I4T08+9AsYFH0xsYTUGi6N0hNBTnxNZDZ9yD+93WQGScukfP4FqXOBwkW/Xl?=
 =?us-ascii?Q?i24oIIwKEKEdHQMH7NSFuZDPoH2dh7e9yQM6wd50nTfFkOsaMIU5yyWJ4mNf?=
 =?us-ascii?Q?hUdeiTxUoNzt7GJkzQAbJeRtgRg2zEtveDtUNe5Q3OvflZeLRgyzLIzlb/L9?=
 =?us-ascii?Q?FEKrCVhINqg8hxOj6JrqGW6R9tCDjdkuz3Bw7MQzM1RvC9K3qPn9QFt07vFw?=
 =?us-ascii?Q?u+8/ED9KXdeLlNOGHiKJB15J/jvgV8CDYJBDxi72pj+7m+NgufQZfV6ZjeoW?=
 =?us-ascii?Q?hYQd1sG1lAG0wL1tt2eIpYSfXVtFMx4BIaOpNeEGxW5S9s3JoA3KTTObf+st?=
 =?us-ascii?Q?xjMfzotvLrLAn+oFMzGAkfji83toydWZ2DZIzXRmVAgzToK+Y1iKgf3UPPwN?=
 =?us-ascii?Q?FKx45bHlxD0XwgHTVaatnkGt+2argIsvw9+WhNC+cOCKm4W71Jw6x0+8Xfhn?=
 =?us-ascii?Q?kDrHlzJFz16lJFjT+CVnev91TB6vPD/BeZVqbr/7yuCd6fNvQXamDUcHXBgi?=
 =?us-ascii?Q?xggcdM4cgwoxiBoejgmF0YQIyAI0AcbIxBaMxVyN2mNT0zbZ5exigrGMSAcV?=
 =?us-ascii?Q?1NLhXNaiGDC496tE65dY3ZOfUbMLOT31g94PnclIZjZsRcjcqpgCwY8GN7SC?=
 =?us-ascii?Q?IoVof7WAUOfJCAikye/x+y4wayeUJI8EHKYoZcwFqITp7E1KFbI1l/KXHhHT?=
 =?us-ascii?Q?co1bu0Y541gmCDYZgDyQop7ngDOtC0l2MQM/P+xlrJaO45i+XrbOTP4x5d+R?=
 =?us-ascii?Q?sax7geKlKN9dMXUHribDMEsDGMlvd3CZe6/xUAr5mKBeh1titbe0a24A95us?=
 =?us-ascii?Q?HGTMCWScVEobqk2Bujlz9iiAGyHM4JKDpQBrWonbsQmmur5mt+OpuUflj6ZH?=
 =?us-ascii?Q?Edj/j6M+f/V3dv5dsIO3oSTgNt1kll/os3ZCKa/HvoLC4EaHkYoAQ9SIwxSC?=
 =?us-ascii?Q?sg9zGTuObXJM88bbzLcNAjY=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2901b23-5149-45ae-7c80-08d9ef7296e5
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 04:29:29.0005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qMriXaAm94VUpKvwgfFoCSaEqhuEJAoXTkzO+p8TgDhjRIaU5QJ9jWDFFaeDIxgnB+KaQWUcKgbKmZCVBehXIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2292
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
Cc: Potin Lai <potin.lai@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

fix with correct shunt-resistor value base on EVT HW

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index 8afaa8f52c38..76c086ea7b71 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -715,6 +715,7 @@
 	adm1278@11 {
 		compatible = "adi,adm1278";
 		reg = <0x11>;
+		shunt-resistor-micro-ohms = <300>;
 	};
 
 	tmp421@4c {
-- 
2.17.1

