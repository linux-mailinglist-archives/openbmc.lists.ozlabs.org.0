Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 132BF4C3BE9
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 03:49:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4Z441ZTgz3bVW
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 13:49:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=GLhQtFxy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:feab::729;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=GLhQtFxy; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20729.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::729])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4Ywh3YVSz3bPK
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 13:43:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U9A2Zq4ro3S18gdHGDeLfg5itaDO8mSLtpvXMh7ij6/Qlse7y8lNOzvIwkznxj3kVQIJj0tdJAgNrPkFXb8b/jlg6RDEfX9AU/wVPeg9m1ZJnOeXWz49SpRYafpNXYvNixHt3uW/6wA2aA9gmneJ5oOPaDi1k49UHV82LArC6/DSoEmuA7cSXHdgwPuSB9+iXnthWO43qWxzMizBslSTSfhO2KVGL+p3Q9S8L0Z/AuKd+QaLU5TqDljNb4yDYEY2tp9saQhQ/lxYKkHaOiEbUu0Ft68NR9NaCBpaXWF8PMSY25N2Y1Qtpv8i0ByYV71PmPNt2MBY/wDLFjlSL5JONA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ioetaPfaiZQrlnH8PvT5bXhgqWRsMrKc18AAvCi2gRQ=;
 b=ZjmUV9BP9bus2ADl78n7F8H1ZlUGLmQ/1LL4EuhWRTm/YDeYCuFWyxG9YqT2FSTEfKwpkJ1LjsLRAkLl7mztja+uRAab1I/WIc5rBgT9gA6hoW0DX8kJvfKsLpmYQNXuukdLl+ygwlGVQMr91cI+RI50Ek8CH/Wny41itKL0dF+jXHwKI/rpVS5Rtv0/IeVBDNvcKUaoJM07dafxZwgNF3uqzpMUtoAuSUEc53cXI3exz2UG3EyUVx9j1aHoLfkjlhAEOrqmj5KAALvnSTHs6F/sX9wKqqni6h65yuW/6xtINe4SKOD4ZL9JAN845BjSzWe4HDYlxPAg5tSxrT9MEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ioetaPfaiZQrlnH8PvT5bXhgqWRsMrKc18AAvCi2gRQ=;
 b=GLhQtFxyEj0T80dfxRN046w7s9CtTXyRVm9rhE4kJjKdg+HHUyW44UVAAMrbOzHQxFyiBP/62IR1X/CBbHg0XzLIL9M+Q5RNbtfXo+AlCIW2GkGjwWNrNdYZkbHmiUWyRgfzXQGEay4ue+DdWkTzc7S1JPCEvTdkAAFKCet2/UY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by SI2PR04MB4507.apcprd04.prod.outlook.com (2603:1096:4:122::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Fri, 25 Feb
 2022 02:42:41 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03%4]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 02:42:41 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 10/26] mtd: spi-nor: sst: Use manufacturer
 late_init() to set _write()
Date: Fri, 25 Feb 2022 10:42:05 +0800
Message-Id: <20220225024221.19422-11-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220225024221.19422-1-potin.lai@quantatw.com>
References: <20220225024221.19422-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:202:16::19) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8321c170-8871-48fa-c22f-08d9f8087d3f
X-MS-TrafficTypeDiagnostic: SI2PR04MB4507:EE_
X-Microsoft-Antispam-PRVS: <SI2PR04MB45071D65B305C9D9FD3A1BC38E3E9@SI2PR04MB4507.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /9zPMj/YcOxCnyQf91ccAsnx8/6FUfcq2i0Z5SJsp1BoG4irMHhPCCT0U419cKWXBDEPt4tj19KAZ/Mb6uI8oiB9HyNEEImKGLxVki1MFTEotkWyLxpt8YsRDj9AdOfGRlUtSv34vPimjifqYlp5NuqvT82a/2MWIlOX5iiDZBG1WPIZ5S+2oh2a7NJiw4rxQHxgeA9GtWt1QzX5jfa72nxTaIANAdp46hPgynsmralGM3p/fxQ/M1U9zaIEleHRM8/ht0LJwiELSD7bdwp62Ih7rcXef4Pik4uq9JzWbVGaCg6MV6L2yYaXmPy3Jqqfilk8avl8/kLAfahU/SE/9J9q6f7Mf1j1OLWJFhZIdba+uTXiBuT9xVIswD5Nep7hdTU2cNw5WPPat+77lCHH/nvJA9r113wI4LKiPwUNYdWtcziiBiDGmkiK1T5NPigSL8j5HqwXZPfaShGbYgG+vHoDz/ktfwK1Z837R1zZSHqQ/3KDTBN7TRbCBOdIFJIeD40tmXqIbWEQQg7GOCAYHLI9vYhQIRv4o4alQM9s8krWdcyCCHZfftbxbEZ48qBMbU01frA+kjNTQjbhCiBTwpn2IlwNQtKzT6jeaPMhgRgPDxnIYrXiKgPD5HyEhXoNOlbO1qbIvZPH9Qn6os4A7ju7JaxuQ5IPbLCPjS8hDDX1N5eGtLdsl+sz3LTpT/5OytqPU69t9N22WOnfDfUCsD684oy6L/vbHegnMypRpvgkXPbInBgNbvPWzGMnqWd7Utx/sVh/Iazaak3yKoudFa5fQ0ZIkltEGp0QgnfdQ3Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(26005)(186003)(36756003)(1076003)(6512007)(38100700002)(38350700002)(86362001)(83380400001)(8936002)(4326008)(6486002)(966005)(508600001)(8676002)(54906003)(66476007)(66946007)(66556008)(5660300002)(6506007)(6666004)(52116002)(44832011)(316002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5iN8QSrDUYu/g3REqbdEVjRdXrJSxI2I2h8DgCNVJirZJ/SVI74oT6oqlExy?=
 =?us-ascii?Q?uVCIkqBXIi5VXtTOvQhIpiAd9mwiOBtZWzAZsPbcGSAOlw2+92Mk/n4LDxTE?=
 =?us-ascii?Q?0Hn6O6Kt8fIBHJt+yWH/+1TXeIpI/CGIZ5v3MEoGlFt0HAeGwH/96TamrlE/?=
 =?us-ascii?Q?M57NrX47m00zHtIG3Zyb5MDji8cDmKQPekJrrhNz0uN4GWx76mu3AswKyQkb?=
 =?us-ascii?Q?E7QWfsKf0HReY8ms3l0eOlt4kf/Dro9+1GpN3m1a9pksyyltJBIZr8lzrdbn?=
 =?us-ascii?Q?RnOCZXQDeFoqiBpFmKfwTcy/C8VPTPhzud1aoCHtWFGTYQyTwT1vjAFDvPM9?=
 =?us-ascii?Q?gZvEh9EFDSik4BLlJ+PMiZ0vmi/mEgwM7e1y+8vVUDcXXBo3mScNrXE8bS6t?=
 =?us-ascii?Q?oW/nedQ6CwIk56QpdEub5eKwyEAB6Heia+wTZMbeZomBzINTWANgBiyyt2iT?=
 =?us-ascii?Q?pDcvF9jQhDjpgsoX18rh7+OkkJCaIkSPzgOBcHpKEDLDZ088daIhKqxLh2tN?=
 =?us-ascii?Q?tYzJoeWS6rHoIxfIl5LLJstbG8yBYs1ok2Bz67rZBdRKsFjw/8pl3UdcZcfN?=
 =?us-ascii?Q?kEc2FOacQytTqRlQWA1ZvpNU5Kag4cwHCKEuAEjiH1YAVlV46g0v8y1+j7FI?=
 =?us-ascii?Q?T25QkNCOuEqeCDsENKcc2ZO9/JDrQuUDR2yPqJA6+wQVsxFlV4KH4m2lpJPH?=
 =?us-ascii?Q?Z05JktCufbBQlxJSjDiLLlmZgwDEi2emeJfLJJ5qIDAlNB1PDBCUM9NVEN4n?=
 =?us-ascii?Q?rBHGV1ieWS4G5vytWuiCgV4bu7ymx6QUxsXwbkljZ3BVL7y0mz/bowuKg/Ub?=
 =?us-ascii?Q?onQIBtV8guudtxzj4GGvWJnXgTdi5FfcuyqkjhXfGlvbXodrZcgr9Rnw0dkA?=
 =?us-ascii?Q?gbMjP65sWayBcjKKkNDamECLNNNiOElF1ZERbA2UKRDBXoQsegpFkJ0xKf8y?=
 =?us-ascii?Q?oGBhyTyoQHCMAlG4+dYl+NUm4SxNZ0eFvWbQDjzE2SM1V177s0u530Em1a36?=
 =?us-ascii?Q?JN3Cfsq1wtp+xd6l8Suko3f02tksAB0enNNL5K2JIINaBBn8XUp4TfAHbPee?=
 =?us-ascii?Q?FXHW/km37DOloKdH7PNiA4yG1Mg+nCM3TPGGC96iA3T7tDBGwn1S/cRM1X8Q?=
 =?us-ascii?Q?UIEty8FAchS/2XasyKKUmZBQ3EDTnWB7DN8ReEfEnAxn4qs/oZRDaLwiB5b3?=
 =?us-ascii?Q?COFBPZ6oDh0EA9ETi33DWfHiR8aO1FIGMnuEnUvSXjTJ0kLIoIQSKE1AFzFF?=
 =?us-ascii?Q?dOw9ZMcwplRRjg7Wc1Pbigih0QV/DnYTXfddTt4LI+d7xIUCVR2YVvYhq2Rl?=
 =?us-ascii?Q?O498koH6OszVf4vVGUWT3Pofjva50P2ciP9JXeOvmo897XJk+SdvMAE8/Vme?=
 =?us-ascii?Q?SXXBGrB+2kVpSwJowufvC/jKAnTmCRIOEVQAYlRJanQ8tH4pRappO2gJ0mAc?=
 =?us-ascii?Q?1K6T7mxLFmi6fWLSKd1zMm3HI2Nhbb6mHJ+qWkS6eRcGXFp0uzV9wEa1AEXx?=
 =?us-ascii?Q?ZjvNWaOa9jIN90VKm0h9rd0gWwlMzL8lC3MTtd8QzDTrxPdSLqcO2utLq6p4?=
 =?us-ascii?Q?aFYepFbgWWA+HdwnuQpb+fgIahhefd79CPnK+s3F7LhODrCCg9FHL1G8pJh/?=
 =?us-ascii?Q?+KmeJnTstGSVwVNpHozVnC4=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8321c170-8871-48fa-c22f-08d9f8087d3f
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 02:42:39.5643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FZznLl2HFMUsLS/MS03UEPw3eoEOHEdIA/HWyTZgaa9PWBvPP24iHYQHe0/fYmCC3JVk/58bhWPJXHGC3ahX1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR04MB4507
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
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tudor Ambarus <tudor.ambarus@microchip.com>

Setting the correct nor->mtd._write in a fixup hook was misleading,
since this is not a fixup, just a specific setting for SST, that differs
from the SPI NOR core default init.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Michael Walle <michael@walle.cc>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
Link: https://lore.kernel.org/r/20211029172633.886453-11-tudor.ambarus@microchip.com
---
 drivers/mtd/spi-nor/sst.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 660aabde477a..3593aae0920f 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -177,14 +177,14 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 	return ret;
 }
 
-static void sst_post_sfdp_fixups(struct spi_nor *nor)
+static void sst_late_init(struct spi_nor *nor)
 {
 	if (nor->info->flags & SST_WRITE)
 		nor->mtd._write = sst_write;
 }
 
 static const struct spi_nor_fixups sst_fixups = {
-	.post_sfdp = sst_post_sfdp_fixups,
+	.late_init = sst_late_init,
 };
 
 const struct spi_nor_manufacturer spi_nor_sst = {
-- 
2.17.1

