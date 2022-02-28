Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D1D4C99A8
	for <lists+openbmc@lfdr.de>; Wed,  2 Mar 2022 01:03:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7Z8f4n7Kz3bq2
	for <lists+openbmc@lfdr.de>; Wed,  2 Mar 2022 11:03:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=FII-NA.com header.i=@FII-NA.com header.a=rsa-sha256 header.s=selector1 header.b=GKBZPvph;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fii-na.com (client-ip=2a01:111:f400:7eab::601;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=mustafa.shehabi@fii-na.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=FII-NA.com header.i=@FII-NA.com header.a=rsa-sha256
 header.s=selector1 header.b=GKBZPvph; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::601])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6vMc5rfBz30L1
 for <openbmc@lists.ozlabs.org>; Tue,  1 Mar 2022 08:55:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QI89VS7PxiO99NU6UqYOcY09AYG8QLhXGVg0P17tqAL4/+0dZYAcMfSX00QiTZRUyKNb4nVvpjzlI2vDtnCSru0+ItTdJnJtSSKEiWeJjA3kClEHnZXTd+LlF6UI2cDoTBFEbsIWhO9FtkKGzp9Mo5NoUymwGTLZ8F+huGcW0WIjvEBZ9hfavjoukSneLzey3NAZIhp+uUVR1Qwk2ocBt0LxKbcV3S4Wt9kqZqUR/cK/5lSmXWMlRZL67mf5InEFatQe6ANo7tq0KQ829joUbWZXC9JxXi6aHN+nIzarKuuYaWGLcxGGdBiMGeb978IN5erxl88kfcxJW0C9jLK+FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AsBy8e5+AmRvS5BgGl/pKHnXNCVIr6c2llD+HoMslHg=;
 b=KOmsvI9ReehgjcJ/B7kOT5cnVzQX5xIJghOEurdjv/G1+c3tfCQH94//GIKvV7HqvKozTQOKq6dLgQtReKAhj0wZPi7f7kwDGz9LZRbqOKBKM1SD/RUGzxTazpvBSWhBPqyw1q+iE2HPjmYdjhmGAcUDBqgqibqqVIFOou/mVvDP5hIRpiowp2bc/IdcbMVDhL/mQtJ50A11n8eCgr8c94S8mqmCAe6NREAaassA9bt+5mRzPHgM1JbA/HhF96JNSlfB+kJoAMLASk20AQ7qTUyBChWS4M0fyFNfGEdk9x/roEF4LiJWPKB64jHbNywhrV9UZMEJabVGp2rtB4DD3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fii-na.com; dmarc=pass action=none header.from=fii-na.com;
 dkim=pass header.d=fii-na.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=FII-NA.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AsBy8e5+AmRvS5BgGl/pKHnXNCVIr6c2llD+HoMslHg=;
 b=GKBZPvphscAOEids5E7OuEvrIOrF2kpeMhPZGnk/BkeiMqcJqVDx7HaM1EJ/oGd+CdXubO3UrCOk4Q5p/rwHhJaHl/gPrjTf2eGYrHfVjDXkOjKbdcb9mMvjivbsP3rh+606Ik2lPrvyKt2Pjc2ygarIq/l3/OaTALiRTFsrKnTWTLSvdSciLVOnORMku8vAgMNVJUNaCgqUD2YvCSYWgEPQlUjubVKG07rY+yed+5q8oiC6u4ctpslznHmYNmtoyFmgRQhDmdoJx9P+/6T+mrMkCJ3CO5PrrknCMm7D8aKz6z9yAk1nnNTqVBMXaZKQfJy+dCiyYmSa3syRCcYpDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fii-na.com;
Received: from SA1PR08MB6989.namprd08.prod.outlook.com (2603:10b6:806:1aa::12)
 by MN2PR08MB5792.namprd08.prod.outlook.com (2603:10b6:208:112::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Mon, 28 Feb
 2022 21:55:36 +0000
Received: from SA1PR08MB6989.namprd08.prod.outlook.com
 ([fe80::f169:dfe1:29bb:945d]) by SA1PR08MB6989.namprd08.prod.outlook.com
 ([fe80::f169:dfe1:29bb:945d%4]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 21:55:36 +0000
From: Mustafa Shehabi <mustafa.shehabi@fii-na.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au,
 Benjamin Fair <benjaminfair@google.com>,
 Vivekanand Veeracholan <vveerach@google.com>,
 Lancelot Kao <lancelot.cy.kao@fii-na.com>,
 Mustafa Shehabi <Mustafa.shehabi@fii-na.com>,
 Charles Boyer <charles.boyer@fii-usa.com>,
 Ashwin Murali <ashwin.murali@fii-na.com>
Subject: [PATCH linux dev-5.10] iio:adc: Add TI TLA202x ADCs device driver
Date: Mon, 28 Feb 2022 15:51:44 -0600
Message-Id: <20220228215144.26651-1-mustafa.shehabi@fii-na.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0075.namprd11.prod.outlook.com
 (2603:10b6:806:d2::20) To SA1PR08MB6989.namprd08.prod.outlook.com
 (2603:10b6:806:1aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3df8536c-5dc6-4b20-74f8-08d9fb050d3c
X-MS-TrafficTypeDiagnostic: MN2PR08MB5792:EE_
X-Microsoft-Antispam-PRVS: <MN2PR08MB57923F6346B90577D5AB171ADA019@MN2PR08MB5792.namprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WVCTEKT6G1vdDzoQM5PjSaK58cqNyIxQeR+rTfDAOr8i42ZZMe6CQEoGW7gzFu7fD3wlSSTIFE2NtffxhLkve8ntC5pXnmb01MzNCnSJ8mJyXxaXGX7WhDquSvt9S35a0uzXKk1RNVLD2gesUE8UxLJkXF/2XC0jnxKMD1y0kOI//lz+q//fxcxyfjF6zd/uEj974XteSDgUQEi742GYyq6ttpNQp/lEssVtloOl2uYT28CA9sWCO5DimmP5+x5AohwX/EdE47IPjQy591ub95AO6ircBCxNG73jJCoQ8mUVH25/p0Dlthtis2XItn+1vJAygsw7PghVy/cZBVjXZ3uhvtRjJkq/RdUB995Vs1lKp2TbQefgTtO3JMPeidRos82m+Wtgwn7yjmKqVzPV3Zda/mvZpt0HMOiwG1PxZPrF/NuF1tdRmrvPNQlicCnmi/cO6a2emLgn1GDBUJkON8tMhAn5CK+72FGuvw8pg2AvFgm/WxVlvigQVdSgFkdHHJoyh9p242dICwOMBC7Zdjpp1znOYYdxb0axb1WQUgTsU72Ue1mBnMfXTMI4QctKxrgMciXnJv+YPqibhSItV1kpOylGXQ0JDOFZ5QEFeKLh/HvXHHAGTUjnATvNMv/JkdIdW9Vv1EiNVjC66TwFjbzczW1JoQe3CVlUDhovAN6BqJqKoFNLbYbviFKoDR1WmRF8PkCI3GBZN8Wy0M365fVRY+w0mZx1S/XxGZ5mjC7PEqvCMv+Mm7+HPk6qSgHiFm0BUMghUeKRP3hceWqaVeOr2zQiyUsGmMFMzbGQ6Ks=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR08MB6989.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(36756003)(6512007)(26005)(6486002)(2906002)(1076003)(44832011)(30864003)(186003)(2616005)(38350700002)(38100700002)(83380400001)(54906003)(6506007)(316002)(52116002)(110136005)(6636002)(6666004)(4326008)(86362001)(66476007)(66556008)(66946007)(8676002)(966005)(8936002)(508600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LOlhDebYH8hOqaX+8kwr9WFZwZlrT1uq/n27ExonVqiEqWh6sfpN8zj8Gh4h?=
 =?us-ascii?Q?EWz31xODRmvh3A1ANmeFdYerTDqZBGqVH6ijz+zH+noHEBr+CVMh9CN4B+8P?=
 =?us-ascii?Q?4XfLFy7/WWgCWR1WUOsNoD0wovHchbDEcZaztaAWWiM5oMSy8ucV+PZYDMmE?=
 =?us-ascii?Q?qYKhG9yeBeQ0imJA7NH9xIzz0yreHg2GBMNyzpMiy2+okpWQP9JKQQ875CIY?=
 =?us-ascii?Q?V/YWYp5HVp9lw3pzTRkfJf/DMuu4zzrwkNpNrWEmNoljfNC3cAPjlvGc1HjS?=
 =?us-ascii?Q?Qg5okb2d/aVu1BoaC9r2YXd0a6NiRReZVKnZAgcVMx9ZjdedPxW0UTVWIJAo?=
 =?us-ascii?Q?/M3q9orgPbU7RHK2WD0STJ/Mu8B+bFkL8Xqp24qDLCGpucv2xzlLWGIiBrOg?=
 =?us-ascii?Q?rKU7lt2N1NAYnB5qnBETqnj2kknqqH1NjSQQjseTkdSK71CkxRX5qUt7XVDr?=
 =?us-ascii?Q?2EocNV8PelTjUVjeQxJUKu5L+nuW3jxPSNJvwbCjlvV/jp3OdHWZaPOBe3rT?=
 =?us-ascii?Q?Z0ibf7SFeM8b/Q0gSNQXQ+ZDs74KwLfiKp27gzkYg30dGa5h2qiC9hV5Rv6g?=
 =?us-ascii?Q?NtmApyVjrM0xCSPtjgQT/qg2iEd5Lawov3+6+LOxKeq6yXACao8x40iKzGkL?=
 =?us-ascii?Q?PBz0HbfIfEZVJVx8bkddd9CPT3XmBGZbaQPap8soQX+t+yzk1o6Fr4YxBrLR?=
 =?us-ascii?Q?ZDN2SVLY12qDe4X9V4IRwokEXtEBydIfyeDxkOqQW4lOp7//LhrClcvY8e8m?=
 =?us-ascii?Q?13CdBITSIOlLdzIG2OW8x23bWtjUcQsE2+1a/kwh/izSxJMy0PYEufQ1rbeX?=
 =?us-ascii?Q?aZXpUycHxqQPEnQbFZGhbmHuXKPPX9use4TjPlr861aqZE6ZoDiYUxKxtfRl?=
 =?us-ascii?Q?oUZ2J6fdg1PxdhU0sW6sRKWZ/ocDCYpegUXLq28OAZppvlgyRX7AXywFy5Bv?=
 =?us-ascii?Q?ldxtlwJN8cko/jBovfT/QwCQxf9IvA16n8W2zY2RSk9k7J8Bv8UKvpYI/oOY?=
 =?us-ascii?Q?3iGRSMC0JcK/SYaDH/GObKbZ63q5rPR2Mc7b7D2gMOp3kbEP+BBtLO190Apg?=
 =?us-ascii?Q?e1REVa32yCkiFLG8f7zZzD38rtnbXhwAlDeYW1CF5K7jUsRSq/oaw4WZUbPT?=
 =?us-ascii?Q?PmuC6wm4Rr4g4J5+bOAL1xsQsomEYcU5219wsMr7nR0l6UvT/brYUWtbg8Zz?=
 =?us-ascii?Q?g2BrL43KMZ7oZDHNsJ4qCcdoQLSIvL4R+wRZKAKcv6RWS4bMczJbitZVWUrR?=
 =?us-ascii?Q?VdnP+yw7IehoYoVkw5fnOG0Cd/FGuKA6uQVM+U+VjfC95vsiqAnOXGdZIo7l?=
 =?us-ascii?Q?Xeqy9HuRvxy11UvlBf++t59YMjQv6lvsXupvV0UMQZl7Q69mdMnH9LN9DD4q?=
 =?us-ascii?Q?24u7FZoCFEiSh8bsh+TsDhpGHtE60TatiAitEAcySCxYMGAxGu8TGkrwH+Q1?=
 =?us-ascii?Q?ZuEMB20lA4kHNW3DO6nQHJ6DC/CxnYocU3EQpmY/SGsagLDoSzXY/rQ/xEaQ?=
 =?us-ascii?Q?nacZn3SR//ycmTG1e3w97dNuMgvhBHq9dO+NCJpQhmajx1J3uV2yZn1kYFZZ?=
 =?us-ascii?Q?ZA1LyTb83L4lig5Wa024jPZW5w4J75Lx0gUFb0AL4eS1g1EVb2gDDIigCR5P?=
 =?us-ascii?Q?VcdJBl9M/iYKxuGFyj717PWqe3vGj8HZ89n2b6SDabUKvYMGQI12SV7qXuWz?=
 =?us-ascii?Q?ZIDkUqDuzBI0YJjLIVnnf2QNEbk=3D?=
X-OriginatorOrg: FII-NA.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3df8536c-5dc6-4b20-74f8-08d9fb050d3c
X-MS-Exchange-CrossTenant-AuthSource: SA1PR08MB6989.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 21:55:36.6984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2f78a81d-6abb-4840-a061-3fe5396c72f2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ixUo6aTTcdUSCP1NSr4jWrOPj+RCvICFCQP6W8tEE3OzxzA/l1yMUVV64v4W1YhZ1KRmF/YjVP01ofAKgsOVIhsHotDRtgxeWQQnlDiU5VA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR08MB5792
X-Mailman-Approved-At: Wed, 02 Mar 2022 11:03:24 +1100
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

Basic driver for Texas Instruments TLA202x series ADCs. Input
channels are configurable from the device tree. Input scaling
is supported. Trigger buffer support is not yet implemented.
https://patchwork.kernel.org/project/linux-iio/patch/1553608583-29006-1-git-send-email-ibtsam.haq.0x01@gmail.com/

Datasheets can be found here:
https://www.ti.com/lit/gpn/TLA2024

Signed-off-by: Ibtsam Ul-Haq <ibtsam.haq.0x01@gmail.com>
Signed-off-by: Mustafa Shehabi <mustafa.shehabi@fii-na.com>
---
 .../bindings/iio/adc/ti-tla2024.txt           |  51 ++
 drivers/iio/adc/Kconfig                       |  11 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/ti-tla2024.c                  | 460 ++++++++++++++++++
 4 files changed, 523 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ti-tla2024.txt
 create mode 100644 drivers/iio/adc/ti-tla2024.c

diff --git a/Documentation/devicetree/bindings/iio/adc/ti-tla2024.txt b/Documentation/devicetree/bindings/iio/adc/ti-tla2024.txt
new file mode 100644
index 000000000000..56f996cb9bf0
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/ti-tla2024.txt
@@ -0,0 +1,51 @@
+diff --git a/Documentation/devicetree/bindings/iio/adc/ti-tla2024.txt b/Documentation/devicetree/bindings/iio/adc/ti-tla2024.txt
+new file mode 100644
+index 0000000..a4934df
+--- /dev/null
++++ b/Documentation/devicetree/bindings/iio/adc/ti-tla2024.txt
+@@ -0,0 +1,45 @@
++Texas Instruments' TLA2021/TLA2022/TLA2024 12-bit ADC driver
++
++Required properties:
++
++- compatible: should be one of:
++  "ti,tla2024"
++  "ti,tla2022"
++  "ti,tla2021"
++
++- reg: should contain the I2C Address of the device
++
++Required subnodes:
++
++The ADC channels are configured as subnodes of the ADC.
++The channels can be single-ended or differential, the input pins are
++also set in the subnode.
++
++Possible channels in TLA2024:
++  single: <0>, <1>, <2>, <3>
++  differential: <0 1>, <0 3>, <1 3>, <2 3>
++
++In TLA2021/TLA2022 only the differential channel <0 1> is allowed.
++
++Example:
++
++tla2024_0: adc0@49 {
++	compatible = "ti,tla2024";
++	reg = <0x49>;
++
++	v0@0 {
++		single-channel = <0>;
++	};
++
++	v1@1 {
++		single-channel = <1>;
++	};
++
++	v23@2 {
++		diff-channels = <2 3>;
++	};
++
++	v01@3 {
++		diff-channels = <0 1>;
++	};
++};
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

