Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3BA50F912
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 11:44:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KncRQ3pgxz2yWn
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 19:44:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=ahLsByvp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:704b::728;
 helo=apc01-tyz-obe.outbound.protection.outlook.com;
 envelope-from=howard_chiu@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=ahLsByvp; 
 dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20728.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::728])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KncQp5ffJz2yKQ
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 19:44:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cl4+XbITlFBXrEiiShgBxeI6QUUS0/iUGPtNtwAOdrmcCxW9HDaGtONBuJbrQAQe+eDE6yvCDcrVWL/JZ1LlXGp/jPVhzNOH89s5EJ/earQOGrujQM8250Wn9naBXwSSftMgFs+tAT1ukllHOsYuImnfXNWVJF9Vu5F0izKiH/qxmcQNcuhqMSCpsUFdchAPsDV9XaicW+lFMfE3m8flfK8Pt4n4Mz+69U47o8W/q9KN+TzLB8jHj32FY1AWlaB0A/VZg1Fi5lv/Wg67O1pDomJbmTvTQAGslPOBPRJbFKtV2uLaFky6docQbDbl4oCYVT5LXXgYn4kMt/1rSI14Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=scJhAtxgZcvjwiU1xLnMX6lmL7h1Jt/jAn+zMXPAe70=;
 b=HbzCVzHk8F9jUL4nYNKqZOIfcPC6vfEHAW4OU40IN7EMyPAwgmQErDBr8LCSsxswjmnizPt0bPOB89RB2x2fJJxCNTK5tv4YOqzng7DzsbvW1LnD31ueo4xgvNYAuEP/hli7rqlKhxcJE3VBEmZT4pgoPvo3LGW8v+iuK+jNB8YyWjsP/gNGjknQYX4G2r/V3xLpaiaWT23J8l8tbPhvVo2ZZnq23W/Oo0RhG2h7hH0V6svDCqdtgx2KbSZ84d30j+m8sk9+/RDCI5PjZ2216MYuNkfb0HP8zoJfp9HtdCqpqWJ8Juz/A29YMMOA1g0BolGtb4opF69zjVqIZWH3jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=scJhAtxgZcvjwiU1xLnMX6lmL7h1Jt/jAn+zMXPAe70=;
 b=ahLsByvpDRQMrJt3RxCPPfBhxGzUY/9nkQfUBbTyCy7Lpc2xiXFWhgR6a/9eQAg9HDwFbgXC1Ni5BkaJy/PI/WQ/135PCBJcJUPApx25MIfseQsAOGEdgfiIsDcep2hWJes9byVSF2ul0iP3HHaSPjaPh7wJMldys/Mz0R41tG7SIMU8Mq/slDMJLvQ156gjFBKcfsugAg3GsSDOgRZo84RZgiFkP0Buh93IIqZmvT5qyiP9Mak03zdGq4pJt0wDNLSsDZSwKxjaF0qJBk1R+6yaMhu2SwYZe+y6Lurlxtw+8EaUhgKQQhU2NSpqToL55TzkraCbyTTZN7NwebP+nA==
Received: from SG2PR06MB2315.apcprd06.prod.outlook.com (2603:1096:4:b::19) by
 SL2PR06MB3131.apcprd06.prod.outlook.com (2603:1096:100:31::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14; Tue, 26 Apr 2022 09:43:33 +0000
Received: from SG2PR06MB2315.apcprd06.prod.outlook.com
 ([fe80::152b:b69a:a1da:f9ba]) by SG2PR06MB2315.apcprd06.prod.outlook.com
 ([fe80::152b:b69a:a1da:f9ba%7]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 09:43:32 +0000
From: Howard Chiu <howard_chiu@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc] configs: aspeed: Add SPL FIT
 image loading support
Thread-Topic: [PATCH u-boot v2019.04-aspeed-openbmc] configs: aspeed: Add SPL
 FIT image loading support
Thread-Index: AdhZS9Re5KF3nVCRQ++HsIG7JY9BGg==
Date: Tue, 26 Apr 2022 09:43:32 +0000
Message-ID: <SG2PR06MB2315D4EDA1E2C782AE5334B8E6FB9@SG2PR06MB2315.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b46442a-7506-410d-0e6f-08da27693a12
x-ms-traffictypediagnostic: SL2PR06MB3131:EE_
x-microsoft-antispam-prvs: <SL2PR06MB3131DD420146F93721AD9094E6FB9@SL2PR06MB3131.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OTmjXB8raprO+wUsqHFP5sU06R4tXPk598NqTR9jo2ssHN1kaO0fxFDMaRBESEBN2WHn1o43W6zWlEfYc8T5rn6wWIojGzf+ayv0++8LVkHlIkk/lmlWda/2D8cMYogpuYtLT3Ncz+4LHa2g5OPWhVrHfssOnvNu73/2yeW5rRWvODBGZrYjnZNnEiv0wIA6pNPP0liRuviKp4DNas+QbYuIHSaOu4PyBKXfxTYMkeyPA0QqaLpVUckI72TLGFrtxUncaJPf1oqicfS4rjhUlAWKdTxQvENlJBiF23Km12xrkm4KmlpTbQEoat62DvyzqFU/L+Ooz9MGpbGH+emmH8v45iq2t5MtlDHkUyIzAtBWwjQ26d3Y7QF/zHJFazqg+8eQPDCpcW6NOl+BzoPqpPmNPNynzNO7ORsuLwKYUyxdSXRVjAfApEORnEISQWNuYBei1rMUwWvV7OJp0vaLkMZWbb94aKckM/N5zFCBcYWsxM1rSU2I/Nw/JagugMU1s27anPgeZI/n6BVYOe7cMVuli8asUM5gjR0pf2hD3WDbZnD6mcROYOquiXDQU4X6LsdT2ZTn5p2yPPpQY8yIz/FAJ/USpXpngdzMF8SFFas32jprZrHtypj5Upk7OC7L9xY6Ps0Wq5p/3FYv+ziS3m5zfDQI/+PtyqgTrUbvmd9vasC+Lg5r60EXh71wzlhYmDAd2qUcASYGsgPP6lYOvw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB2315.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(136003)(39840400004)(346002)(376002)(396003)(83380400001)(8676002)(76116006)(4326008)(52536014)(66946007)(66556008)(66476007)(66446008)(64756008)(186003)(2906002)(26005)(71200400001)(9686003)(110136005)(6506007)(316002)(508600001)(86362001)(8936002)(122000001)(107886003)(55016003)(38070700005)(38100700002)(33656002)(7696005)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nQB+ydzRzHzsMuYLWkoiN3dvVr7PMlKSPVnRsalG5EfvzNWbJvMrNTQ4oE7X?=
 =?us-ascii?Q?oG7L2AGDXTiYuMdpu4yBNiCK1lHtgsAo8vVCtAwcKbpJ+eNxsf6mHDJtypfJ?=
 =?us-ascii?Q?Ei9jVzhdxZuF3YwBF5g0PiPAapSZY2F+Tx0sbjaGev2XAhMPziRJZqyQ0z2e?=
 =?us-ascii?Q?G4N91W2M5tX5bSvm1GkMaOfavWacD6yWILUpZi+zix7O9Dea8v4d7P61Mw0z?=
 =?us-ascii?Q?C69Aag4w08aOYUG5AjHRC7tvo+Qq/mfM2cPyPl7w4gKPPcotLmBu5T5C0gdP?=
 =?us-ascii?Q?JIkLFaNdQ8XO8l38mf9HkVk7qJRqnKMY1bKe4y7imEOzb0z+TAD2iM3z0SyH?=
 =?us-ascii?Q?CRtqn2SSC0NVRlPpfn98GWLBaJFSVDjDsR6raT469/b0oiKUJONjKEZTI9Qo?=
 =?us-ascii?Q?NsLG730uru5jpgwbjxtKOF2YVLddysSwe4MpqatBLT8AdX6QzsAlj8Jv+1WY?=
 =?us-ascii?Q?p1QEDTTWeMgevGQlEtQcfSTdfaVPThHfZo0H1bmzr+Sn+oP/Tv2BDqKEzsgR?=
 =?us-ascii?Q?1xxd1rEShgXfFAFI6KVMZiWK7ArsTcnfTXit7Shkd5sLfjRADmQnVumHfggC?=
 =?us-ascii?Q?hWEBs5uGWN9UJjGAvgggHvGUQUZ79jxb1IBjsejItVArb/wceecX+yFTfpdf?=
 =?us-ascii?Q?5IUzNP0Inm++B+7EkEqhpVkHEkyyfvhbfI9sHxPHHpFCxw6jDB2P95hl77A9?=
 =?us-ascii?Q?v0CL/foWbuJsmIwzLWEUdU5eoaxEbdQK8+VXcMOp76mbzQu8o4oGmB6Jpv7F?=
 =?us-ascii?Q?JMVze3WPkyolrniqjCZEKdVuICkGOM2SVDo049YgXz+7p8EOoFYdLmXl/+IN?=
 =?us-ascii?Q?/Z3qAFORIZz5QZSfQ3aQwyuW1ngpcLZM8gPiBVn3qCsN2L4tdLkj9i49Pjt0?=
 =?us-ascii?Q?2FmrqPuZsJAEWdc7GB6iPAl3SgOX8Iydi/MCvw1zyNP+QvXhYswzIKi68BFQ?=
 =?us-ascii?Q?cxGXDNnYcXdixvpYuIBWiZiHyeut32wUbocj7QWd2UqvD2tws4p1cYzBupmZ?=
 =?us-ascii?Q?YaPn7ZPK+gPhAcbR52l8hcx0vgK5VEkU1MfblfMmHm0Ag/xjUUO16dGaRjpH?=
 =?us-ascii?Q?dxu2BmXtzQzZO9B5958aLyUTpSjTmpLmTjbheVeCj+jMXydhNO6FEeDUPcMW?=
 =?us-ascii?Q?9WxtYS2aqIaSyFdN87C7Syk4mpLOeSPlT1wbAfqnSnWkxTMHksTI/m88oHb+?=
 =?us-ascii?Q?xLAlgXIW/dZOCipT9KEigSqNAo3C80oXpFMr22g1XPA/ZVN9RIa5Gwfgvr/J?=
 =?us-ascii?Q?4ARohGtrjM8199txwb9KoqVQenTL6p+pJnGEWlWKDEKwHKMffySyN9JcZ8x7?=
 =?us-ascii?Q?EU4IyfDR3AyorJ+axUSEEBHyPEtJmwjCn9nJ0H/Je+3xg30W2/Kn3HGlxkRD?=
 =?us-ascii?Q?Yi5wMRc52UKJaFSHowj2pQb3mRPcCZU5m0OfLxOmS0qrmhxUK0plblJsNVqs?=
 =?us-ascii?Q?v8XwKgJFnoPLyQRwaDuPe4laxvviHA0S/MF5ALYq4K/6EqcaxKRWEyPrIGT9?=
 =?us-ascii?Q?ZVcFGL3bJFs2mxiGz2fJizI15Vz6bwQXYB+uInD9txdqUro65NGhFdnc49Mi?=
 =?us-ascii?Q?Qg4LkLN3h1GAFeXwVbDYblOOzCZNDZQtSrnSPUcJf9Lz4ehaPiBSmSOPjKhF?=
 =?us-ascii?Q?kDzvUEroFMh/Uf0N9C65bndr/o+GmZU+hrUTMBd2io2QHPuNjwVAVsEdHg9s?=
 =?us-ascii?Q?+th4QZm9GKR/ehgnqpfuCZCcM2rDLL/Eb5m6fqvC87zKOSQXB0MjZHV/USaY?=
 =?us-ascii?Q?rU2mS3ectUIj8qm2lrPl6k92JMqEvM4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB2315.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b46442a-7506-410d-0e6f-08da27693a12
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2022 09:43:32.5501 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j5m3qTulctrQ99WavCT5/yPadBQybN9d7zxkTIPJpEGA3+IN8h3skcZBlCLMgN7X/2GXwVnsDkXLB4KVtPcAC1uvLR3cJvBVrz9veteP0v0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR06MB3131
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
Cc: Troy Lee <troy_lee@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

1. Disable ASPEED_LOADERS to instead use generic FIT image bootflow
2. Enable SPL_LOAD_FIT and FIT hash/signature verification
3. Enable SHA family support
4. Enable HACE/ACRY crypto engine

Tested with AST2600-A3 EVB=20

Signed-off-by: Howard Chiu <howard_chiu@aspeedtech.com>
---
 configs/ast2600_openbmc_spl_defconfig | 30 +++++++++++++++------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/configs/ast2600_openbmc_spl_defconfig b/configs/ast2600_openbm=
c_spl_defconfig
index 98aa3f160e..9025401e0c 100644
--- a/configs/ast2600_openbmc_spl_defconfig
+++ b/configs/ast2600_openbmc_spl_defconfig
@@ -8,17 +8,7 @@ CONFIG_SPL_LDSCRIPT=3D"arch/$(ARCH)/mach-aspeed/ast2600/u-=
boot-spl.lds"
 CONFIG_ARCH_ASPEED=3Dy
 CONFIG_SYS_TEXT_BASE=3D0x10000
 CONFIG_ASPEED_AST2600=3Dy
-CONFIG_ASPEED_UBOOT_SPI_BASE=3D0x10000
-CONFIG_ASPEED_UBOOT_SPI_SIZE=3D0xe0000
-CONFIG_ASPEED_UBOOT_MMC_BASE=3D0x000000
-CONFIG_ASPEED_UBOOT_MMC_SIZE=3D0x700
-CONFIG_ASPEED_UBOOT_UART_SIZE=3D0xe0000
-CONFIG_ASPEED_UBOOT_DRAM_BASE=3D0x81000000
-CONFIG_ASPEED_KERNEL_FIT_SPI_BASE=3D0x20100000
-CONFIG_ASPEED_KERNEL_FIT_SPI_SIZE=3D0x1000000
-CONFIG_ASPEED_KERNEL_FIT_MMC_BASE=3D0x800
-CONFIG_ASPEED_KERNEL_FIT_MMC_SIZE=3D0x8000
-CONFIG_ASPEED_KERNEL_FIT_DRAM_BASE=3D0x83000000
+# CONFIG_ASPEED_LOADERS is not set
 CONFIG_TARGET_EVB_AST2600A1=3Dy
 CONFIG_SPL_LIBCOMMON_SUPPORT=3Dy
 CONFIG_SPL_LIBGENERIC_SUPPORT=3Dy
@@ -34,19 +24,30 @@ CONFIG_ARMV7_BOOT_SEC_DEFAULT=3Dy
 CONFIG_ARMV7_PSCI_NR_CPUS=3D2
 CONFIG_NR_DRAM_BANKS=3D1
 CONFIG_FIT=3Dy
+CONFIG_FIT_ENABLE_SHA384_SUPPORT=3Dy
+CONFIG_FIT_ENABLE_SHA512_SUPPORT=3Dy
+CONFIG_FIT_SIGNATURE=3Dy
+CONFIG_SPL_FIT_SIGNATURE=3Dy
+CONFIG_SPL_LOAD_FIT=3Dy
+CONFIG_IMAGE_FORMAT_LEGACY=3Dy
 CONFIG_USE_BOOTARGS=3Dy
 CONFIG_BOOTARGS=3D"console=3DttyS4,115200n8 root=3D/dev/ram rw"
 CONFIG_USE_BOOTCOMMAND=3Dy
-CONFIG_BOOTCOMMAND=3D"bootm 20100000"
+CONFIG_BOOTCOMMAND=3D"run bootspi"
 CONFIG_SYS_CONSOLE_ENV_OVERWRITE=3Dy
 CONFIG_DISPLAY_BOARDINFO_LATE=3Dy
 CONFIG_ARCH_EARLY_INIT_R=3Dy
 CONFIG_BOARD_EARLY_INIT_F=3Dy
-# CONFIG_SPL_RAW_IMAGE_SUPPORT is not set
+CONFIG_SPL_BOARD_INIT=3Dy
 # CONFIG_SPL_LEGACY_IMAGE_SUPPORT is not set
 CONFIG_SPL_SYS_MALLOC_SIMPLE=3Dy
 CONFIG_SPL_STACK_R=3Dy
 CONFIG_SPL_SEPARATE_BSS=3Dy
+CONFIG_SPL_SHA1_SUPPORT=3Dy
+CONFIG_SPL_SHA256_SUPPORT=3Dy
+CONFIG_SPL_SHA384_SUPPORT=3Dy
+CONFIG_SPL_SHA512_SUPPORT=3Dy
+CONFIG_SPL_FIT_IMAGE_TINY=3Dy
 CONFIG_SPL_DM_RESET=3Dy
 CONFIG_SPL_RAM_SUPPORT=3Dy
 CONFIG_SPL_RAM_DEVICE=3Dy
@@ -95,6 +96,8 @@ CONFIG_SYSCON=3Dy
 CONFIG_SPL_OF_TRANSLATE=3Dy
 CONFIG_CLK=3Dy
 CONFIG_SPL_CLK=3Dy
+CONFIG_ASPEED_HACE=3Dy
+CONFIG_ASPEED_ACRY=3Dy
 CONFIG_DM_GPIO=3Dy
 CONFIG_ASPEED_GPIO=3Dy
 CONFIG_DM_I2C=3Dy
@@ -132,4 +135,5 @@ CONFIG_WDT=3Dy
 CONFIG_USE_TINY_PRINTF=3Dy
 CONFIG_TPM=3Dy
 CONFIG_SPL_TPM=3Dy
+CONFIG_SPL_TINY_MEMSET=3Dy
 # CONFIG_EFI_LOADER is not set
--=20
2.25.1

