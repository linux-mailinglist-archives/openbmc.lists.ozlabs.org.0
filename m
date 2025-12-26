Return-Path: <openbmc+bounces-1067-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FC6CE5A7F
	for <lists+openbmc@lfdr.de>; Mon, 29 Dec 2025 02:16:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dfdb13Z2rz2yFx;
	Mon, 29 Dec 2025 12:16:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.93.201.135 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766714326;
	cv=pass; b=JsBBz5ZzwdCYYyjLwu2z9iqi7zMbXFcg9akrnSL4frWKFaV7r3QjPOjs+VWGn5rcVNk8Bon44McYYCRQM+oKDE7T6rdAaeeIdK1IjFx7bCPtJgdfsm2pO5b/sDJn3FaLbNL7PXgEoMcVZxDc3ci5zOOZn3UkNtSo1NK+yYYNahQrprzVDYRDamaTk4E69/0AZC2JzfcqHwlkxl9iBIVvdh3NbAV5w5Dpu8jItYA3aPqr6GfmJ+wcSSTXKjLRoYtfNRhyix0y1SVkPjRax31JzxV8+NaOXkQTiaUKtBp46lGxhh4WJU12IjF0sh6OLO9LOkxHcKdrGhyvBCIibMYZ2A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766714326; c=relaxed/relaxed;
	bh=FlkrVjsYDKmQpESxSUett6C3bjcUNvgbtLKNno3R8f0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b00SAaGQXDueFef8nWUDVC04UR8+voZmO+h2AFuAGwR6/UZViHRc2nhgZQ/U8ZImMnfDfQJgHmpFYTnRfjUtnU/9K/O/n5xkgFO4RD/AZ3YpeG0C4ulSimjFJZgO9DKGGLTANbfZXdjYIGKr4KLNN0E+mpU5f0aAsf1Yk7iRq6eUMpl714AVreeREWq4XHB4p5CzaoWtXeSFbFYIb8nC/FFc/yUP0cb9de2ScM73kvpIW6obSgIZyOLI5mLc1hclUWNRXs7SFACUco4maHjnHkm3OMyYr3wN0Gb18A/ZDLPaZ3IxVvyhls5M0AJo0QO2JirA9uT2VGjUumyGKvzfZg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=HmSWq31c; dkim-atps=neutral; spf=pass (client-ip=40.93.201.135; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=kchiu@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=HmSWq31c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=40.93.201.135; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=kchiu@axiado.com; receiver=lists.ozlabs.org)
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11023135.outbound.protection.outlook.com [40.93.201.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dcpgS5VGsz2xcB
	for <openbmc@lists.ozlabs.org>; Fri, 26 Dec 2025 12:58:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TiRmag2rl6CX3TJ8XZ3TUjMFAqFe6gyOIlmWtjNao71VeEYBSZtzRbMgHaLc6vHuSHbxO2uMMBIRz7j1Lfn1o9g4p7QKosICtGea0f5J+5jhiGAaFSbR9IZVc7fPsGgnS3MYCbJ3Fg9XJyskH0QhOTjbuLrC6wuGyOXoTp7sGCt/LQSOoZ79Ida5WZE9Sj8BlM/Xlb+88rAaci1ZJcin/ZGYNJf42UUR6zRFNq4UO8Km1OAVEFUw2saxUkgcGdEEEmveqNxwgqGsuBaZjRsQ1+Xjh+PLRrRrabzKovZmo0dO1HcQ8dgjcsJKuVSIKv6Mc4JqEOI4hC4866kIviVarg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FlkrVjsYDKmQpESxSUett6C3bjcUNvgbtLKNno3R8f0=;
 b=DcY8WIKFsjZ0WJLgpH1qavDizOS9PlF3AEYlg0+iv1q0XQeuStQ8lqvbzyJ22qNjKIxIJ+WV9m9sSeaRUzCh6k/2h3A5K4c9S8wWbXQa9Chi+i9mY6lYwGIGgkY/DlToJNeWeWy0oP7MOoOSEM+rGPP7ug6CeWhi97nrO/AIIUfqf7V8SfnG7tijy1ztEMwA9RLUoOAaxWw6/AdvfSuqlWswBW7o+YTHTJpUHcYuVeNbxtCLdjMyFN+PgZ38YHN4bicWxlaeWkM4coHmasSAskdBAc6n8+9mF3XY54H9HHFW+xDdROATHphE7ptTvlCDdgT1v516ipx1SVz225ia1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 4.227.125.105) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlkrVjsYDKmQpESxSUett6C3bjcUNvgbtLKNno3R8f0=;
 b=HmSWq31c9WwV1E9y3staDvMN3C1DYx05mLuMiThuQPf0VwflO22THNcHM0CAoJX9CC8FLTIlF89hjkylXNKcDvVTMw0nB8y1r8uPSowQ8uWBNxc/mPVWO74ErbDl9GFSqLHHfqvE8Xw/UGwbrrlR39Sm6K2BmTnBwrIsC4Lag9b+XXgnsE67+4DusGnFDeuKkK1R7nSeLkarXkiWXxfA1RjJ6uZN3FCYPeywQMZWs8xMhvr1vTCjycEi/Pdxl4/u5bgwh0ywHQH5JrwStiaZVYwe6z6S5Nbf24dnY9iP6OwkRrWMkx8cbF4RnZrixB/fMantsqVLA9OOIITwnx5bSA==
Received: from SJ0PR13CA0027.namprd13.prod.outlook.com (2603:10b6:a03:2c0::32)
 by SJ0PR18MB4396.namprd18.prod.outlook.com (2603:10b6:a03:2e5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Fri, 26 Dec
 2025 01:58:04 +0000
Received: from CO1PEPF000044F4.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::e5) by SJ0PR13CA0027.outlook.office365.com
 (2603:10b6:a03:2c0::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.2 via Frontend Transport; Fri,
 26 Dec 2025 01:58:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.227.125.105)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 4.227.125.105 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.227.125.105; helo=axiado.com;
Received: from axiado.com (4.227.125.105) by
 CO1PEPF000044F4.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.9
 via Frontend Transport; Fri, 26 Dec 2025 01:58:03 +0000
From: Kuan-Jui Chiu <kchiu@axiado.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: Harshit Shah <hshah@axiado.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH linux dev-6.12 3/6] dt-bindings: serial: cdns: add Axiado AX3000 UART controller
Date: Thu, 25 Dec 2025 17:57:47 -0800
Message-Id: <20251226015750.377679-3-kchiu@axiado.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251226015750.377679-1-kchiu@axiado.com>
References: <20251226015750.377679-1-kchiu@axiado.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|SJ0PR18MB4396:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9693c112-96b9-4267-1338-08de44223517
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ibr9HrzmiHRSmpk27qJLqsff5GZtQOWCSQI53bumgdvshxb1dYr+Aj4H1iAQ?=
 =?us-ascii?Q?wuXd0AVvAFaln68Pj6oGRgzSYECNoB8h8pHhnWIVdWrh5c9yEXgH6YJBJfqe?=
 =?us-ascii?Q?CJQP3jILrii91COyfvWhvP2mgQ/TVLiP9/AT2GJMYzrGBnv3O9ZtwJgQ3WM3?=
 =?us-ascii?Q?tyfmiGYI9tCzLi4lmRRlTxUxtRdzBo5w3Xyu74EvNN9Fh0g6VBM9CnX9gS0Z?=
 =?us-ascii?Q?YYOZ+DMRVc1Z92xqFQunc7FxpD9DT78E63FJFJ68eweWQ9lbp2NBPbJitr2t?=
 =?us-ascii?Q?zhd1VNX1rRtVcJmbm2iuDGJw/qZY8c96iSgszQD+7qHr066ALr8d5XndAldQ?=
 =?us-ascii?Q?CpcmFo7grZ4ECBMBGJIFleJJGk4LTkG+t3fF8JMatxuZKFS0/FAAbg8biPZH?=
 =?us-ascii?Q?M7bnyf2MBUi3oAwpi/TBColdL0/fxFebmlQD7cUB3m9ZH4Ngeoj3B2JpZ6yZ?=
 =?us-ascii?Q?krlDA+3ypxEOXWh8x2/vR29OYszJvAq/Ai/8X1mb4xyWkYWG5n/TS5Gc7pFU?=
 =?us-ascii?Q?HtRFgZCx4mRNQZ31wVnI/n433e8ZdWvmfnC5km1DU/NnSW7NvwJrY3Ppcus1?=
 =?us-ascii?Q?/5iB03mbLUs4i+vs02OroedzJmeviTvUYDcU3biMwHoHzRmBi35NrdsdNIAK?=
 =?us-ascii?Q?VdwnFdXH5t82VbzjSwAX0KIY2drqu+60znp/s1IAFIGSExQlJ3RIAJMpt3LW?=
 =?us-ascii?Q?DrXbvYjee3Tnrxhajl2dyF54HmzjJ/N/A0e0LMgnWbMzEet4ATRJkQKb9pnp?=
 =?us-ascii?Q?jnDN4tR44RdUEUgLIqFFFU8+5aAeVh3+/33cRQSnVVFQurAyrypvjCd3qDYT?=
 =?us-ascii?Q?EEvhq3P21fstfRSYYNEvAA789xoV9/yQfWMu73MV9BcJLpOpqNpXzT70Kf02?=
 =?us-ascii?Q?DZ/iYD6RYQ3qCW0lKHCKtBKhAT4J2o2RtUUnruSEOmHq6E3E6y+ZWeCF8/8n?=
 =?us-ascii?Q?1cIJeZRYhOiTXQo/3MPT8jY0AmTEKv0TpCrnSIked9NM7T9Md4HP2c9Zoao+?=
 =?us-ascii?Q?ME1sJJ9hiKo3N8vNbxroX40xzwmzpaotK9cq7D1YnnCCRrF306A9FhechMrR?=
 =?us-ascii?Q?bLewMUUNL6xPI33//eRX2SrO1pL/L/Dw/mj9Qfs8lA/su23ZsMpZ8UuK3ZPT?=
 =?us-ascii?Q?SRlktTvEURY8CuxigpVpNpodfVCbVyGc+1aL35fwt/0UrIvv/5CGwpfJO2qy?=
 =?us-ascii?Q?P53ZHZ7DsDV0/yDU3aentDSi2FgqjgPMjBHrt673/w3HC1MHx8hKCtvNa9uq?=
 =?us-ascii?Q?H8mLu+V3gE30WnmS8BDjdZKFnXUFDlurRF3sCdNFh4KKfEgL8Qa31vST+mHd?=
 =?us-ascii?Q?ArevanGUkjB83ZQeS1rXHRiBxOasiOJmN3iYMOwws0Y/SRAfVv6t9eo/L7ph?=
 =?us-ascii?Q?wXPRlJ139MfX/VlBxrX4abNir6H+8RbPJQ3coG0Ok1FPFSkAlfa22MXy7XPT?=
 =?us-ascii?Q?apQtZ9ZGg/6W0yR7YZUeg0y9QwhYjxMlqEAvUB9EC0HZsU5sC26SIZUvgQI1?=
 =?us-ascii?Q?ZE8gCOBVBQYfccCSyWvjD+mQYIObaweMMJ0rEwkUd91NgJJTJ7j4Qz7bGS1E?=
 =?us-ascii?Q?TeAamlHHX/K7FENmaNM=3D?=
X-Forefront-Antispam-Report:
	CIP:4.227.125.105;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2025 01:58:03.9026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9693c112-96b9-4267-1338-08de44223517
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[4.227.125.105];Helo=[axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR18MB4396
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Harshit Shah <hshah@axiado.com>

Add binding for AX3000 UART controller. So far, no changes known,
so it can fallback to default compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Harshit Shah <hshah@axiado.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 Documentation/devicetree/bindings/serial/cdns,uart.yaml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/cdns,uart.yaml b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
index d7f047b0bf24..9d3e5c1d8502 100644
--- a/Documentation/devicetree/bindings/serial/cdns,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
@@ -16,9 +16,10 @@ properties:
         items:
           - const: xlnx,xuartps
           - const: cdns,uart-r1p8
-      - description: UART controller for Zynq Ultrascale+ MPSoC
-        items:
-          - const: xlnx,zynqmp-uart
+      - items:
+          - enum:
+              - axiado,ax3000-uart
+              - xlnx,zynqmp-uart
           - const: cdns,uart-r1p12
 
   reg:
-- 
2.34.1


