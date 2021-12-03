Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FA047281C
	for <lists+openbmc@lfdr.de>; Mon, 13 Dec 2021 11:09:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCHL66jBFz305v
	for <lists+openbmc@lfdr.de>; Mon, 13 Dec 2021 21:09:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=FII-NA.com header.i=@FII-NA.com header.a=rsa-sha256 header.s=selector1 header.b=SJADYMyt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fii-na.com (client-ip=40.107.237.73;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=mustafa.shehabi@fii-na.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=FII-NA.com header.i=@FII-NA.com header.a=rsa-sha256
 header.s=selector1 header.b=SJADYMyt; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J5TRX4gdtz2yws
 for <openbmc@lists.ozlabs.org>; Sat,  4 Dec 2021 10:24:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8gOZ2d99psWXH6YpCslVeTaK5MXrKnue0zyILLAv4NerpnpfI4rKsWeDNX3el4ySAEgGx3k9ZoayfWz2eFWiI1FOUdalbdkL1QfiUiYiMg9WLhVvL8iTsvplrI/398ZHRIx/NdqQqaRxkcKGwIjvJpg+9RhJgpBMgoPsEApVNwihIRZK/sCbHwagY1nuDQNvp3ZjzaFJQFDx8SLyKrQO3BaO5rAGa4FWBZBTcLfjM/7pfxRkghd4Xmf+jD1eXAUHssvjhmz0jLupYJHLCRYRd/5MrZ5n5PxpgeRby7ibb3cp28loD88ZKzO9l+YiMsndUmVOBKjRe2zHwKDLwdf3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t455AFCUSQEnYXF2tcg7Wg+ZWVC/aUqVt3ExlksRjxw=;
 b=U6naItfNxjIfHd5+5BAiNgTikSsN5u4PFSr+Kb84H4ndURhqbmWT+W7U3ukaR5nnAqAa/y7zGKa5hqsibp8LkKUpP4hAcaYof5MTRUEDOlmU1uMvs2GsCKB0oZ4T9iJ4CG5Wdata1Sn2J4mo8bWhOWeg3rOsiNKJN3luo0Aiz28CFeu9E5lTSkwwWIE59FXwub8a71sPBsexBl24fIE/7NhehtHV3H0VnoRJZm87DvxsrCHdbbSZdxdW5cSz3ky6Yv12fnhfSXQ8hcNYDMDFlk7wW5gNXBb/FP5sRyc46l0+rANbBprRt9ND6nWsT7Sbja4c7LHbcZvD10qxDKvtfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fii-na.com; dmarc=pass action=none header.from=fii-na.com;
 dkim=pass header.d=fii-na.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=FII-NA.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t455AFCUSQEnYXF2tcg7Wg+ZWVC/aUqVt3ExlksRjxw=;
 b=SJADYMyt0XwvY6V4Z4GssY3YfTKDxQtBY1agpe3ibH+pX6vKKvq82+1mvjpFvCe/9H/NtaIz847zD7KcK/ErFPZKczCjYH443gfG988JYC2QXJ+l4mIWZb/rIhQcZutkPxAhQTrNzEjMU2TzcL3XG9UIF7locZGZrt6YpkBHDOWM//BEnZad0vpUtCeXkXLUGAkIX60obdqbd8+EB+kQsHJDg1I+AQNJIsfdwiKPMkmLD5K9tCRWl/ydk1wLS7vl8u5ZITyJnb+v31va+TQ3ftCM6xpfNIk/FyZNwVkPObHGci6spUiRaQWfLM4W92FfTkNO4DLQbktBrUGMP8AZqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fii-na.com;
Received: from SA1PR08MB6989.namprd08.prod.outlook.com (2603:10b6:806:1aa::12)
 by SN6PR08MB4128.namprd08.prod.outlook.com (2603:10b6:805:20::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 23:23:46 +0000
Received: from SA1PR08MB6989.namprd08.prod.outlook.com
 ([fe80::cc6c:26a0:98a0:b0f9]) by SA1PR08MB6989.namprd08.prod.outlook.com
 ([fe80::cc6c:26a0:98a0:b0f9%6]) with mapi id 15.20.4713.029; Fri, 3 Dec 2021
 23:23:46 +0000
From: Mustafa Shehabi <mustafa.shehabi@fii-na.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Benjamin Fair <benjaminfair@google.com>,
 Vivekanand Veeracholan <vveerach@google.com>,
 Lancelot Kao <lancelot.kao@fii-na.com>,
 Mustafa Shehabi <Mustafa.shehabi@fii-na.com>
Subject: [PATCH linux dev-5.10] iio: adc: TLA2024: add IT TLA202x ADCs device
Date: Fri,  3 Dec 2021 17:22:49 -0600
Message-Id: <20211203232249.31063-1-mustafa.shehabi@fii-na.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0038.namprd04.prod.outlook.com
 (2603:10b6:806:120::13) To SA1PR08MB6989.namprd08.prod.outlook.com
 (2603:10b6:806:1aa::12)
MIME-Version: 1.0
Received: from localhost.localdomain (12.231.52.155) by
 SN7PR04CA0038.namprd04.prod.outlook.com (2603:10b6:806:120::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.14 via Frontend
 Transport; Fri, 3 Dec 2021 23:23:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1d667ab-1487-471f-8ab9-08d9b6b3f45c
X-MS-TrafficTypeDiagnostic: SN6PR08MB4128:
X-Microsoft-Antispam-PRVS: <SN6PR08MB41283C6BE2CEA14B01050FEFDA6A9@SN6PR08MB4128.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ogdCDKS85zEF/qi01DhaDT9lK9wWV0B5gDx5TXyxLiqYm/Jad9fwfC6FWlQAR5+p9c0VNyT9GoZkWNZx62pP6d9BNyr0w2mt8aIMNPe2gNKKpSZEVINmCiXgr7PF/33sfTmn3pZErbTpYkyaOyXN1BQ/yfrHPQCKb6eEv35YRK7fyQPzZ654VkEp7pfMBQLNUbBN1mb6QXznm/NRjIOLMKK1hNyOA0D/IBT384+IuUP4Z9G3WPnKwpPNOxIABICmb11YFw9VkOe/QIOTjohFTdHxTbNPIITZYYtlCnvIpJKcyuKEJPBu2Au0JZHRWTKHXn7c1oPu33sg9i3QBFBdL6+31ADKYZ34SMYtyO9vSjsU8Jg8yBI9L8zsLWLw9VtnDl526+ReCKN5HJRaAcARGZ+EW6Ebx0WP6XqZqj1CVvaODUENddvPYuGRwb9WB0tM9l/hcQAY8nSiB5vuXr8E4QTAhOxWqS6OkEN0/WdNloz8qvkPtnrQMTM3t4QEvk2qUoXWxPQtnjh5KxYrhpvWBokZsRC4IlpZbzF1fkw07Xc2ftZeXNPnR5qteiStx0AE6KzLHwhsdhB0l2Fo1IoMdTb/Xb0c5xEY8o3K8m/xIgwqd31boG8BNCHX7El9rOQ4BWPeCgRJ2Eh51jlPpcHtHbbpRWDoXQ59BV6oKDBmauWgOopHCKyZxzNHn7dJlDwaICat1NkczoJ2Z4aLt32lt1KifED0d5YpsnT0UIHmyy1CbdUiDG/U9S2JScA3zG/1jeCR0swWmKG8nQwYODR/qWStnxPKZyN7nmsm/iQruS0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR08MB6989.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(83380400001)(44832011)(52116002)(4326008)(6506007)(5660300002)(2616005)(66556008)(8676002)(66946007)(956004)(38350700002)(1076003)(6512007)(316002)(6486002)(66476007)(30864003)(86362001)(2906002)(966005)(38100700002)(8936002)(508600001)(36756003)(54906003)(110136005)(26005)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v/lhPeTMQpzx8mmlqnN9k3ZHYneIG8NHNfMV1eWH4coXC3gpAbkMTScKk4sf?=
 =?us-ascii?Q?vlP6y+0jVYonox3Qoo5vE0MeKaZ77X10rFD1axT5SutCbMIx6yq6BnSQR0oz?=
 =?us-ascii?Q?47TITlIpHMwcG/gWOXOOkbB3E1NPmNwlHIEqtKlou3AkujHjU6jGe+Nuufo8?=
 =?us-ascii?Q?kvyDqPrw4Oz780Es2pxAiyQ22DM4X3YjO98Recu0lebBZJEIqxejVZPiRmYL?=
 =?us-ascii?Q?tS9Gzm7yD2cjTM/a5MxveWcKF3QznF86Je1EIevHQWyMxuYj/EqKVNyZGuB5?=
 =?us-ascii?Q?lSFOpL9mJNEp//079Gs2xKgC1IlOn1Tv3MvPTQo9Ke8xdA2+3KJwTC2rN66/?=
 =?us-ascii?Q?1QsdnNHuXXsBJ+8KBNS2awGk42W0orchtNSZAi4zuL+agRHr5USbGiuIMkAx?=
 =?us-ascii?Q?y9nV1DaBd/ZiA2pj1kToJr29Aqe1j79gac1cZaS+47h/fBOgM6NWxX9sCRXS?=
 =?us-ascii?Q?PpHi9/M5WMjSzGBUJJB7nxZ3/7VqeVAzsQiKbiiECS1nJuKwz3Y2U4JwWR2W?=
 =?us-ascii?Q?KH12U3p5K7DOON7MDxSvZ1telbOw63QA/K46Vmy76G3HoNefn5BcQLzYxojk?=
 =?us-ascii?Q?3qhR1CI+z1Yox7xKmxCi05TgFJmGnKTAT/nHxlOCm+yB0gnn048L2x0t+9Lh?=
 =?us-ascii?Q?TKPvTjlWvGvWHO+crI3+6sQSFn52qJDvRKGtjn/yeRSPyTYcy+MLWokyMSGv?=
 =?us-ascii?Q?xH1lJWlyye1SB5Y7VFpaHGRLmqhqTGK8aFjvlfO7zaxPNp6Z1y+cTNs64f7u?=
 =?us-ascii?Q?ItkXwjOLKuylFOwqkploRUTka38BTZGg1q+7kcv4QAkdMoO0Ap80ZkC5u1vj?=
 =?us-ascii?Q?sxZKm+suex7apTTjcCxDwcwXBurlsAtgATlbIzDMzSGJUOIsClxztf6W3TYH?=
 =?us-ascii?Q?pFpYPMthWFjx+fue5A41yHs+umJHMAD10yhhzihrbIw7XpkT+lIxk1JnERN8?=
 =?us-ascii?Q?B5virj/AhfSuJZg0rHZP6q/Kod5RwfTJblFKcenNYYoDF3If1Y9c3AGb/XQV?=
 =?us-ascii?Q?i+ANGhfDgVxVNpIWBAQrGxpousX8RxwWvNpr0kF3X1hqKpLR6aHbUybt1bdM?=
 =?us-ascii?Q?eRpvgptkLQ/4SwcjqxMsWIUScQyAESliiGP7s07ngvLX8gGSv8OR/nTVfCs6?=
 =?us-ascii?Q?JP1JLJWF3GAfoUb0mfLuf69oQnLmZYaQvhz0E/XrivHs9XvPxx1T1MWIhw/c?=
 =?us-ascii?Q?YP2j9ME9NC6clbfSnvy6taoxQtuhZ3Ta8TXzmb7dbyPIYtJoYmnKi92qaMha?=
 =?us-ascii?Q?/5iHwIiVGTvE6UWLCToeyCCPYCiopG2NyyXPQ0etiz4gD+7eW2hJ3+jUMTsn?=
 =?us-ascii?Q?qIZbkvAiw6HCZszopOtXYHYyaBNgRGHtDKHN58zq6dC5L5e328LknFQmQRL7?=
 =?us-ascii?Q?ScvsuD2Z8sDWPmYzC9kw5BKxfbs5wAkALZg5i3vulBE++U5OwyBTDanfclsM?=
 =?us-ascii?Q?liYjtXr3QWMIq4VZZuDLko0YMTfs8OowazF43pqILIsF9RmYi/LAhxKJU025?=
 =?us-ascii?Q?35klN2LrHVgN/kkA4UyhMPuss9ggNs49GqAtJhq0yb5vQYcAs4pS4bxf0FWC?=
 =?us-ascii?Q?HxlzPK0Ucka1DUhDqrCpPD4Gx0i3rzA61MH3ay6OOk+D3WcP7lBOxyuwpLtN?=
 =?us-ascii?Q?hSJrV8T/Ug7+R9l9KUVy9n84IFDuSXsQ1Q+hQH+LdeJpwSENv9AKxdEuObe2?=
 =?us-ascii?Q?phJlCg=3D=3D?=
X-OriginatorOrg: FII-NA.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d667ab-1487-471f-8ab9-08d9b6b3f45c
X-MS-Exchange-CrossTenant-AuthSource: SA1PR08MB6989.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 23:23:46.7878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2f78a81d-6abb-4840-a061-3fe5396c72f2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rjLsp+xiv+pP2BWoBDoD8YuI7Xtmclow6g8qWVwx7CZDb1ZQfsgAig3RFyKtjCcF7IIUani8NmgHCJGtpAqnb+d7QOSsQaxc7Uut22/QAO0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4128
X-Mailman-Approved-At: Mon, 13 Dec 2021 21:07:47 +1100
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
Cc: Ibtsam Ul-Haq <ibtsam.haq.0x01@gmail.com>,
 Mustafa Shehabi <mustafa.shehabi@fii-na.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Basic driver for Texas Instruments TLA202x series ADCs. Input channels
are configurable from the device tree. Input scaling is supported.
Trigger buffer support is not yet implemented.

Datasheets can be found here:
https://www.ti.com/lit/gpn/TLA2024

Signed-off-by: Ibtsam Ul-Haq <ibtsam.haq.0x01@gmail.com>
Signed-off-by: Mustafa Shehabi <mustafa.shehabi@fii-na.com>
---
 .../bindings/iio/adc/ti-tla2024.txt           |  45 ++
 drivers/iio/adc/Kconfig                       |  11 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/ti-tla2024.c                  | 460 ++++++++++++++++++
 4 files changed, 517 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ti-tla2024.txt
 create mode 100644 drivers/iio/adc/ti-tla2024.c

diff --git a/Documentation/devicetree/bindings/iio/adc/ti-tla2024.txt b/Documentation/devicetree/bindings/iio/adc/ti-tla2024.txt
new file mode 100644
index 000000000000..a4934df92319
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/ti-tla2024.txt
@@ -0,0 +1,45 @@
+Texas Instruments' TLA2021/TLA2022/TLA2024 12-bit ADC driver
+
+Required properties:
+
+- compatible: should be one of:
+  "ti,tla2024"
+  "ti,tla2022"
+  "ti,tla2021"
+
+- reg: should contain the I2C Address of the device
+
+Required subnodes:
+
+The ADC channels are configured as subnodes of the ADC.
+The channels can be single-ended or differential, the input pins are
+also set in the subnode.
+
+Possible channels in TLA2024:
+  single: <0>, <1>, <2>, <3>
+  differential: <0 1>, <0 3>, <1 3>, <2 3>
+
+In TLA2021/TLA2022 only the differential channel <0 1> is allowed.
+
+Example:
+
+tla2024_0: adc0@49 {
+	compatible = "ti,tla2024";
+	reg = <0x49>;
+
+	v0@0 {
+		single-channel = <0>;
+	};
+
+	v1@1 {
+		single-channel = <1>;
+	};
+
+	v23@2 {
+		diff-channels = <2 3>;
+	};
+
+	v01@3 {
+		diff-channels = <0 1>;
+	};
+};
diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index e39b679126a2..10ab06299b49 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1167,6 +1167,17 @@ config TI_TLC4541
 	  This driver can also be built as a module. If so, the module will be
 	  called ti-tlc4541.
 
+config TI_TLA2024
+	tristate "Texas Instruments TLA2024/TLA2022/TLA2021 ADC driver"
+	depends on OF
+	depends on I2C
+	help
+	  Say yes here to build support for Texas Instruments TLA2024,
+	  TLA2022 or TLA2021 I2C Analog to Digital Converters.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called ti-tla2024.
+
 config TWL4030_MADC
 	tristate "TWL4030 MADC (Monitoring A/D Converter)"
 	depends on TWL4030_CORE
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index 90f94ada7b30..1ba58306261e 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -104,6 +104,7 @@ obj-$(CONFIG_TI_ADS8688) += ti-ads8688.o
 obj-$(CONFIG_TI_ADS124S08) += ti-ads124s08.o
 obj-$(CONFIG_TI_AM335X_ADC) += ti_am335x_adc.o
 obj-$(CONFIG_TI_TLC4541) += ti-tlc4541.o
+obj-$(CONFIG_TI_TLA2024) += ti-tla2024.o
 obj-$(CONFIG_TWL4030_MADC) += twl4030-madc.o
 obj-$(CONFIG_TWL6030_GPADC) += twl6030-gpadc.o
 obj-$(CONFIG_VF610_ADC) += vf610_adc.o
diff --git a/drivers/iio/adc/ti-tla2024.c b/drivers/iio/adc/ti-tla2024.c
new file mode 100644
index 000000000000..f0eed4ad68f8
--- /dev/null
+++ b/drivers/iio/adc/ti-tla2024.c
@@ -0,0 +1,460 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Texas Instruments TLA2021/TLA2022/TLA2024 12-bit ADC driver
+ *
+ * Copyright (C) 2019 Koninklijke Philips N.V.
+ */
+
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/iio/iio.h>
+#include <linux/module.h>
+#include <linux/of.h>
+
+#define TLA2024_DATA 0x00
+#define TLA2024_DATA_RES_MASK GENMASK(15, 4)
+#define TLA2024_DATA_RES_SHIFT 4
+
+#define TLA2024_CONF 0x01
+#define TLA2024_CONF_OS_MASK BIT(15)
+#define TLA2024_CONF_OS_SHIFT 15
+#define TLA2024_CONF_MUX_MASK GENMASK(14, 12)
+#define TLA2024_CONF_MUX_SHIFT 12
+#define TLA2024_CONF_PGA_MASK GENMASK(11, 9)
+#define TLA2024_CONF_PGA_SHIFT 9
+#define TLA2024_CONF_MODE_MASK BIT(8)
+#define TLA2024_CONF_MODE_SHIFT 8
+#define TLA2024_CONF_DR_MASK GENMASK(7, 5)
+#define TLA2024_CONF_DR_SHIFT 5
+
+#define TLA2024_CONV_RETRY 10
+
+struct tla202x_model {
+	unsigned int mux_available;
+	unsigned int pga_available;
+};
+
+struct tla2024 {
+	struct i2c_client *i2c;
+	struct tla202x_model *model;
+	struct mutex lock;
+	u8 used_mux_channels;
+};
+
+struct tla2024_channel {
+	int ainp;
+	int ainn;
+	const char *datasheet_name;
+	bool differential;
+};
+
+static const struct tla2024_channel tla2024_all_channels[] = {
+	{0, 1, "AIN0-AIN1", 1},
+	{0, 3, "AIN0-AIN3", 1},
+	{1, 3, "AIN1-AIN3", 1},
+	{2, 3, "AIN2-AIN3", 1},
+	{0, -1, "AIN0", 0},
+	{1, -1, "AIN1", 0},
+	{2, -1, "AIN2", 0},
+	{3, -1, "AIN3", 0},
+};
+
+static int tla2024_find_chan_idx(u32 ainp_in, u32 ainn_in, u16 *idx)
+{
+	u16 i;
+
+	for (i = 0; i < ARRAY_SIZE(tla2024_all_channels); i++) {
+		if ((tla2024_all_channels[i].ainp == ainp_in) &&
+		    (tla2024_all_channels[i].ainn == ainn_in)) {
+			*idx = i;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+#define TLA202x_MODEL(_mux, _pga)		\
+	{					\
+		.mux_available = (_mux),	\
+		.pga_available = (_pga),	\
+	}
+
+enum tla2024_model_id {
+	TLA2021 = 0,
+	TLA2022 = 1,
+	TLA2024 = 2,
+};
+
+static struct tla202x_model tla202x_models[] = {
+	[TLA2021] = TLA202x_MODEL(0, 0),
+	[TLA2022] = TLA202x_MODEL(0, 1),
+	[TLA2024] = TLA202x_MODEL(1, 1),
+};
+
+static const int tla2024_scale[] = { /* scale, int plus micro */
+	3, 0, 2, 0, 1, 0, 0, 500000, 0, 250000, 0, 125000 };
+
+static int tla2024_get(struct tla2024 *priv, u8 addr, u16 mask,
+		       u16 shift, u16 *val)
+{
+	int ret;
+	u16 data;
+
+	ret = i2c_smbus_read_word_swapped(priv->i2c, addr);
+	if (ret < 0)
+		return ret;
+
+	data = ret;
+	*val = (mask & data) >> shift;
+
+	return 0;
+}
+
+static int tla2024_set(struct tla2024 *priv, u8 addr, u16 mask,
+		       u16 shift, u16 val)
+{
+	int ret;
+	u16 data;
+
+	ret = i2c_smbus_read_word_swapped(priv->i2c, addr);
+	if (ret < 0)
+		return ret;
+
+	data = ret;
+	data &= ~mask;
+	data |= mask & (val << shift);
+
+	ret = i2c_smbus_write_word_swapped(priv->i2c, addr, data);
+
+	return ret;
+}
+
+static int tla2024_read_avail(struct iio_dev *idev,
+			      struct iio_chan_spec const *chan,
+			      const int **vals, int *type, int *length,
+			      long mask)
+{
+	switch (mask) {
+	case IIO_CHAN_INFO_SCALE:
+
+		*length = ARRAY_SIZE(tla2024_scale);
+		*vals = tla2024_scale;
+
+		*type = IIO_VAL_INT_PLUS_MICRO;
+		return IIO_AVAIL_LIST;
+	}
+
+	return -EINVAL;
+}
+
+static int tla2024_of_find_chan(struct tla2024 *priv, struct device_node *ch)
+{
+	u16 chan_idx = 0;
+	u32 ainp, ainn;
+	int ret;
+
+	ret = of_property_read_u32_index(ch, "single-channel", 0, &ainp);
+	if (ret) {
+		ret = of_property_read_u32_index(ch,
+						 "diff-channels", 0, &ainp);
+		if (ret)
+			return ret;
+
+		ret = of_property_read_u32_index(ch,
+						 "diff-channels", 1, &ainn);
+		if (ret)
+			return ret;
+
+	} else {
+		ainn = UINT_MAX;
+	}
+
+	ret = tla2024_find_chan_idx(ainp, ainn, &chan_idx);
+	if (ret < 0)
+		return ret;
+
+	/* if model doesn"t have mux then only channel 0 is allowed */
+	if (!priv->model->mux_available && chan_idx)
+		return -EINVAL;
+
+	/* if already used */
+	if ((priv->used_mux_channels) & (1 << chan_idx))
+		return -EINVAL;
+
+	return chan_idx;
+}
+
+static int tla2024_init_chan(struct iio_dev *idev, struct device_node *node,
+			     struct iio_chan_spec *chan)
+{
+	struct tla2024 *priv = iio_priv(idev);
+	u16 chan_idx;
+	int ret;
+
+	ret = tla2024_of_find_chan(priv, node);
+	if (ret < 0)
+		return ret;
+
+	chan_idx = ret;
+	priv->used_mux_channels |= BIT(chan_idx);
+	chan->type = IIO_VOLTAGE;
+	chan->channel = tla2024_all_channels[chan_idx].ainp;
+	chan->channel2 = tla2024_all_channels[chan_idx].ainn;
+	chan->differential = tla2024_all_channels[chan_idx].differential;
+	chan->datasheet_name = tla2024_all_channels[chan_idx].datasheet_name;
+	chan->indexed = 1;
+	chan->info_mask_separate = BIT(IIO_CHAN_INFO_RAW);
+	chan->info_mask_shared_by_all = BIT(IIO_CHAN_INFO_SCALE);
+	chan->info_mask_shared_by_all_available = BIT(IIO_CHAN_INFO_SCALE);
+
+	return 0;
+}
+
+static int tla2024_wait(struct tla2024 *priv)
+{
+	int ret;
+	unsigned int retry = TLA2024_CONV_RETRY;
+	u16 status;
+
+	do {
+		if (!--retry)
+			return -EIO;
+		ret = tla2024_get(priv, TLA2024_CONF, TLA2024_CONF_OS_MASK,
+				  TLA2024_CONF_OS_SHIFT, &status);
+		if (ret < 0)
+			return ret;
+		if (!status)
+			usleep_range(25, 1000);
+	} while (!status);
+
+	return ret;
+}
+
+static int tla2024_singleshot_conv(struct tla2024 *priv,
+				   struct iio_chan_spec const *chan, int *val)
+{
+	int ret;
+	u32 ainp = chan->channel;
+	u32 ainn = chan->channel2;
+	u16 chan_id, data;
+	s16 tmp;
+
+	ret = tla2024_set(priv, TLA2024_CONF, TLA2024_CONF_MODE_MASK,
+			  TLA2024_CONF_MODE_SHIFT, 1);
+	if (ret < 0)
+		return ret;
+
+	ret = tla2024_find_chan_idx(ainp, ainn, &chan_id);
+	if (ret < 0)
+		return ret;
+
+	ret = tla2024_set(priv, TLA2024_CONF, TLA2024_CONF_MUX_MASK,
+			  TLA2024_CONF_MUX_SHIFT, chan_id);
+	if (ret < 0)
+		return ret;
+
+	ret = tla2024_set(priv, TLA2024_CONF, TLA2024_CONF_OS_MASK,
+			  TLA2024_CONF_OS_SHIFT, 1);
+	if (ret < 0)
+		return ret;
+
+	ret = tla2024_wait(priv);
+	if (ret < 0)
+		return ret;
+
+	ret = tla2024_get(priv, TLA2024_DATA, TLA2024_DATA_RES_MASK,
+			  TLA2024_DATA_RES_SHIFT, &data);
+	if (ret < 0)
+		return ret;
+
+	tmp = (s16)(data << TLA2024_DATA_RES_SHIFT);
+	*val = tmp >> TLA2024_DATA_RES_SHIFT;
+	return IIO_VAL_INT;
+}
+
+static int tla2024_set_scale(struct tla2024 *priv, int val, int val2)
+{
+	int i;
+
+	if (!(priv->model->pga_available))
+		return -EINVAL; /* scale can't be changed if no pga */
+
+	for (i = 0; i < ARRAY_SIZE(tla2024_scale); i = i + 2) {
+		if ((tla2024_scale[i] == val) &&
+		    (tla2024_scale[i + 1] == val2))
+			break;
+	}
+
+	if (i == ARRAY_SIZE(tla2024_scale))
+		return -EINVAL;
+
+	return tla2024_set(priv, TLA2024_CONF, TLA2024_CONF_PGA_MASK,
+			   TLA2024_CONF_PGA_SHIFT, i >> 1);
+}
+
+static int tla2024_get_scale(struct tla2024 *priv, int *val, int *val2)
+{
+	u16 data;
+	int ret;
+
+	if (!(priv->model->pga_available)) {
+		*val = 1; /* Scale always 1 mV when no PGA */
+		return IIO_VAL_INT;
+	}
+	ret = tla2024_get(priv, TLA2024_CONF, TLA2024_CONF_PGA_MASK,
+			  TLA2024_CONF_PGA_SHIFT, &data);
+	if (ret < 0)
+		return ret;
+
+	/* gain for the 3bit pga values 6 and 7 is same as at 5 */
+	if (data >= (ARRAY_SIZE(tla2024_scale) >> 1))
+		data = (ARRAY_SIZE(tla2024_scale) >> 1) - 1;
+
+	*val = tla2024_scale[data << 1];
+	*val2 = tla2024_scale[(data << 1) + 1];
+	return IIO_VAL_INT_PLUS_MICRO;
+}
+
+static int tla2024_read_raw(struct iio_dev *idev,
+			    struct iio_chan_spec const *channel, int *val,
+			    int *val2, long mask)
+{
+	struct tla2024 *priv = iio_priv(idev);
+	int ret;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		mutex_lock(&priv->lock);
+		ret = tla2024_singleshot_conv(priv, channel, val);
+		mutex_unlock(&priv->lock);
+		return ret;
+
+	case IIO_CHAN_INFO_SCALE:
+		return tla2024_get_scale(priv, val, val2);
+
+	default:
+		return -EINVAL;
+	}
+}
+
+static int tla2024_write_raw(struct iio_dev *idev,
+			     struct iio_chan_spec const *chan,
+			     int val, int val2, long mask)
+{
+	struct tla2024 *priv = iio_priv(idev);
+	int ret;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_SCALE:
+		mutex_lock(&priv->lock);
+		ret = tla2024_set_scale(priv, val, val2);
+		mutex_unlock(&priv->lock);
+		return ret;
+	}
+
+	return -EINVAL;
+}
+
+static int tla2024_of_chan_init(struct iio_dev *idev)
+{
+	struct device_node *node = idev->dev.of_node;
+	struct device_node *child;
+	struct iio_chan_spec *channels;
+	int ret, i, num_channels;
+
+	num_channels = of_get_available_child_count(node);
+	if (!num_channels) {
+		dev_err(&idev->dev, "no channels configured\n");
+		return -ENODEV;
+	}
+
+	channels = devm_kcalloc(&idev->dev, num_channels,
+				sizeof(struct iio_chan_spec), GFP_KERNEL);
+	if (!channels)
+		return -ENOMEM;
+
+	i = 0;
+	for_each_available_child_of_node(node, child) {
+		ret = tla2024_init_chan(idev, child, &channels[i]);
+		if (ret) {
+			of_node_put(child);
+			return ret;
+		}
+		i++;
+	}
+
+	idev->channels = channels;
+	idev->num_channels = num_channels;
+
+	return 0;
+}
+
+static const struct iio_info tla2024_info = {
+	.read_raw = tla2024_read_raw,
+	.write_raw = tla2024_write_raw,
+	.read_avail = tla2024_read_avail,
+};
+
+static int tla2024_probe(struct i2c_client *client,
+			 const struct i2c_device_id *id)
+{
+	struct iio_dev *iio;
+	struct tla2024 *priv;
+	int ret;
+
+	if (!i2c_check_functionality(client->adapter,
+				     I2C_FUNC_SMBUS_WORD_DATA))
+		return -EOPNOTSUPP;
+
+	iio = devm_iio_device_alloc(&client->dev, sizeof(*priv));
+	if (!iio)
+		return -ENOMEM;
+
+	priv = iio_priv(iio);
+	priv->i2c = client;
+	priv->model = &tla202x_models[id->driver_data];
+	mutex_init(&priv->lock);
+
+	iio->dev.parent = &client->dev;
+	iio->dev.of_node = client->dev.of_node;
+	iio->name = client->name;
+	iio->modes = INDIO_DIRECT_MODE;
+	iio->info = &tla2024_info;
+
+	ret = tla2024_of_chan_init(iio);
+	if (ret < 0)
+		return ret;
+
+	return devm_iio_device_register(&client->dev, iio);
+}
+
+static const struct i2c_device_id tla2024_id[] = {
+	{ "tla2024", TLA2024 },
+	{ "tla2022", TLA2022 },
+	{ "tla2021", TLA2021 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, tla2024_id);
+
+static const struct of_device_id tla2024_of_match[] = {
+	{ .compatible = "ti,tla2024" },
+	{ .compatible = "ti,tla2022" },
+	{ .compatible = "ti,tla2021" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tla2024_of_match);
+
+static struct i2c_driver tla2024_driver = {
+	.driver = {
+		.name = "tla2024",
+		.of_match_table = of_match_ptr(tla2024_of_match),
+	},
+	.probe = tla2024_probe,
+	.id_table = tla2024_id,
+};
+module_i2c_driver(tla2024_driver);
+
+MODULE_AUTHOR("Ibtsam Haq <ibtsam.haq@philips.com>");
+MODULE_DESCRIPTION("Texas Instruments TLA2021/TLA2022/TLA2024 ADC driver");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

