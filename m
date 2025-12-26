Return-Path: <openbmc+bounces-1068-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E29BACE5A85
	for <lists+openbmc@lfdr.de>; Mon, 29 Dec 2025 02:16:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dfdb13YGgz2yFw;
	Mon, 29 Dec 2025 12:16:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.93.194.101 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766714328;
	cv=pass; b=andJkeF493SPYSW+Dwg/B4sJZZ0lE3YEiHug1lDH3nKoeiZm/EyLixRJLwVJNOxB8mCJ7NbRtizQZ9AofhEim3KvElAur1VMOoAs2oBDNToTB0B5cOkZGaMr7QapwJDTwOTu/gP0ZsiP8si1KsCyKsVt90VXf8S8up3INBsMPX64IsrqcfbxHXtnprRKxZ62XY5qZz2rytpKXKcZWlOx/ojEinw5ioWuPqj0M9bH1IUs0CiVv/+YU+CuwOq8vZIZWRaD/3jpdzO4Io3C+7KosTx1kbDhwwTPGkN6zxv9nqD1z+gLftjlZ/ISLtSjAgvbTqn0DBJCVZcjefVP4y8Ddw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766714328; c=relaxed/relaxed;
	bh=2BJ44Nf6XreAbZSc/2cBmElH00ElSz8dXuO7uORewlk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Eti6sLoanE2dFI/e37/vXN3gCA4Am34kmzLwMOj7sBa5T55+DAirKZAl85WOyRcEad1wQc4acp03ghOFjRQHZhgJVVg5c2qUBrATMMk9QzS0jTS8Izqmcz7ojpzbmGoFvHIGqVljBokhWhdaxjZEIVroJe0jBfMh+7PjGyGjGO2G7X/lhA14P6KwkrDjGPp1Romeq0vWHnxYwbvldGvyL62eHf8AE0RQ/rpv9GSbNpQ2CyQ+YX8II0g7IuW8KAUF/lKxonYndYNwnU4i7TzmTYNQ55GjwACGjLs6v03jbGYE/kLicEWo6tKuTbc0ecMhJ/YEXVpKAJzwSBAL5uLsOg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=GfikQeGn; dkim-atps=neutral; spf=pass (client-ip=40.93.194.101; helo=sn4pr0501cu005.outbound.protection.outlook.com; envelope-from=kchiu@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=GfikQeGn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=40.93.194.101; helo=sn4pr0501cu005.outbound.protection.outlook.com; envelope-from=kchiu@axiado.com; receiver=lists.ozlabs.org)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11021101.outbound.protection.outlook.com [40.93.194.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dcpgX2fnHz2xFn
	for <openbmc@lists.ozlabs.org>; Fri, 26 Dec 2025 12:58:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h1G+z8yu5++wQ+yXAI96XJfmyASpKcG+QnSZ3hbW1qF5ytJVZpR9jjXRbuZoAAzTFiZUUyojBLU0CiCSvHE8EcpkB4rPvUSUGIXlM3B0A2cvBl2QTRW1mX7yAKr+aP9qT7bL2AUDvw2BxjtVGy5n+vMlR6pr0tCHU8BGyxg30KrkPF0u+e5lYpr4jR7K6U8g8qxF4unkJPwSnTFDu00WzqftODCd1IqwV7cv7deAg+mqBds9vJZTCQVlt5u5FKi4DPW95lW07Gr4ozohBtJH0bgwRhihqKK4/ScbFxGHgZkqkoCxWbPFhI4j0mhCIcfgtZiHAUVPrmmdIBBMjZ2MSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2BJ44Nf6XreAbZSc/2cBmElH00ElSz8dXuO7uORewlk=;
 b=ly9ICplUJ2vNxqv6HHbmhkgiGUymZVhtJhKnf+x1xJ6mLNUCTdgBu60OElOrDwkaMAlMbDxoSyQLavQ4E3Uu5SQOwxs29Yc9VIVtR5LnWe++Byd4yi6ZEMQWlbSbcGX71Way7JQKQqK4HKzBaAopEej8A/U7KpAC/ZEZQKtTWKKYHFczaF5MhRkz+DkWDysTkyVugfCIoiuwJwGSfmHu6/8LMqSf1D3KumQqcCnm9SaozLBvz5052aLRH3HPNBS28zq+yVATIsYO8oArwUFi0wRV8SgjPg+OOz8uom4bPOI80SdbTbjvLAO9aaix0IOpcGLrTfjMsvVeE1NJOR4a5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 4.227.125.105) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BJ44Nf6XreAbZSc/2cBmElH00ElSz8dXuO7uORewlk=;
 b=GfikQeGnogWFHDQQi5OSvpRahdVDMuKblHi7jfQXpk0ETenEIJ/uLhlzsl6HZ05p5KHVC7sDD9DGezdQ3aUSfSfpwaFBmlV1ZYvxWoYNN2GQQA7det2vQuJOJRx94RLWS8mg6v4XBlquD14/TDYw8cGfhF5esDW6M1NUzgcvWntc5LlMQqDWqH42u5zDQpbzx49bSYTu2+S2waIHVXvKVKi1BcoDhV/DKN0wRRBMbtuBS5T5eL1/HD1BRC0PKn+oCO+hG9JpE5A83Ge6pKZR/etbSTv8OgWILdfc+xB+1xrp9JO22nThOSPYNDwt9fpI+mCLIhecKcVp8fypyDOyiQ==
Received: from SJ0PR13CA0017.namprd13.prod.outlook.com (2603:10b6:a03:2c0::22)
 by CO6PR18MB3793.namprd18.prod.outlook.com (2603:10b6:5:345::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Fri, 26 Dec
 2025 01:58:07 +0000
Received: from CO1PEPF000044F4.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::5d) by SJ0PR13CA0017.outlook.office365.com
 (2603:10b6:a03:2c0::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.2 via Frontend Transport; Fri,
 26 Dec 2025 01:58:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.227.125.105)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 4.227.125.105 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.227.125.105; helo=axiado.com;
Received: from axiado.com (4.227.125.105) by
 CO1PEPF000044F4.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.9
 via Frontend Transport; Fri, 26 Dec 2025 01:58:07 +0000
From: Kuan-Jui Chiu <kchiu@axiado.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: Harshit Shah <hshah@axiado.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH linux dev-6.12 6/6] arm64: dts: axiado: Add missing UART aliases
Date: Thu, 25 Dec 2025 17:57:50 -0800
Message-Id: <20251226015750.377679-6-kchiu@axiado.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|CO6PR18MB3793:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8842eb5f-6e95-4121-bd0e-08de4422370e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?78jJdIyVHD4JTJXuolTzVJ0eh8J4eO3+y2pGsciVTrhGQBoGm20a9HEChY43?=
 =?us-ascii?Q?VOoKwAX3+NU73JQP5Oh6NQrN32iU3SRv0HxHKeeiXxgjIB/Fl3fheLV7ANIO?=
 =?us-ascii?Q?XwkYwi0EzsYHOEqLoBM6t1GNmvRSfIbDt6WtcE8pdyYR47ZxaQl3V10nRl/t?=
 =?us-ascii?Q?5W55mcueZM0DHamSFM9ekKmOZjRZqGjcbi5lDcIiENJrHkdLJjZ0w9Juv6kZ?=
 =?us-ascii?Q?mWbN+b+IMntuU3QyU0cbCGY4z8qWflg04inqFxFCH++dKwWa3AVVnUWUG4YG?=
 =?us-ascii?Q?yonSmwl/b5BBF2JHWjOVO/4jrEBm1cpuN1XMGcSA8D3srU8t5EKvTMd3BCDM?=
 =?us-ascii?Q?jCT+NsbpcPuMTd6/tefYXcx9MARQoLotDamKJZrCEB04+efJ5nqJ8Svpg1E0?=
 =?us-ascii?Q?LWs96ut70rEvTBRaem36JD3kJW3Z1bP/yYUGCmokGBxgbk1u4DbL00ilKZI7?=
 =?us-ascii?Q?gf1hvBL2IlhWloZZFTVKgfbDGKw+FeqbqXTbTPCNCFP+n0W9+EW1ctG8C+WH?=
 =?us-ascii?Q?9P+2PXjjOViFqpd4Icl2W0n6mgWsmga06rFrH+fE9OJ//KMd/wVJX7XLLGMX?=
 =?us-ascii?Q?Yym+sDi/Qw+hQdZVY13VAXQ5L6nZgSAL/rKQYGJb9kHE1JG/2slyWrhyIA0O?=
 =?us-ascii?Q?K1YFXSQDyzfXAdHpMgJaK95D7q/2A1FdtoEpxcDfAkLSGmQHdCNOPkOoJhRw?=
 =?us-ascii?Q?jZW0GIJ0mW3Dc+l3RPKsmcxTQiVHOvNJSaDLdS3wJJjtrfkyxTHDscSqGr2O?=
 =?us-ascii?Q?OzSN6YzNUZDasgEFwIsx73P09eXElZy34edRATTbQDMvoCZBV5fWLHGQqKbp?=
 =?us-ascii?Q?q1Yju971MyKmuwqC67SS7z2aAGU2mzb2Zqaz2k7RTgOSEhXSSccsL0kh4N46?=
 =?us-ascii?Q?5/gkEHdNA73c/hiyMFsnOMP5/X3lpnM1X1uqa+Y8KZZ+VrBh5PgkbRmT7wo0?=
 =?us-ascii?Q?8pkeLnESxJEy47vgxmarb0Af0Mz2E1XzWopLbZa2xTIEWUMceuZ7nhauNH5h?=
 =?us-ascii?Q?NNbrCvdcvJzEPZEju/fH0ZXATmBEhQyWG1Bm4QKRGfnzt2nYsuhMY44ngViS?=
 =?us-ascii?Q?MyB8lrCE3oEjLug4JTr8Ps3YEQP8eUXxHDgvgQRFww9kSxrNNc7fG1WAobMZ?=
 =?us-ascii?Q?9q/zdujHFQAN4z2L2nCUabjjHbct/3KfsuuwTZQJXeTduhjsA92s7lKRSc2m?=
 =?us-ascii?Q?WdReKHK+y+KZPTPScpViGzCBr9+BZXDXKFgEF9gOsCvosmKbCdNpMRVB80vJ?=
 =?us-ascii?Q?ETZmGv64tTOoFwvtYlF9gqb4MGzBos2EsC9q4iWt7jaZb8I0jdyAaZrCwDa6?=
 =?us-ascii?Q?Re4sUG30HIV7ZXb1Y4VIXE3txZG5s0mbmvJViZFoEhO6c2EEOaJ/XeWz/n3y?=
 =?us-ascii?Q?JzhpNIxl3NGioR+fDQeObSqr1zJvuJociaOAb6al0VdGlOBa9xXtvINQYoSS?=
 =?us-ascii?Q?3E99c01VY5vPtTqbz0w9rp8gDKO0kqKzaaUA5viQJ76RR6tWVJcprczxIlTq?=
 =?us-ascii?Q?gK105WOB7fFcJSY/xwjjOgfvLBPvFfgZ2s0PgcBSC0B8APrAU0n2T4cwGmmp?=
 =?us-ascii?Q?W8NWU3lhhIQ45mruvbg=3D?=
X-Forefront-Antispam-Report:
	CIP:4.227.125.105;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2025 01:58:07.2045
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8842eb5f-6e95-4121-bd0e-08de4422370e
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[4.227.125.105];Helo=[axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR18MB3793
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Harshit Shah <hshah@axiado.com>

Axiado AX3000 EVK has total of 4 UART ports. Add missing alias for uart0,
uart1, uart2.

This fixes the probe failures on the remaining UARTs.

Fixes: 1f7055779001 ("arm64: dts: axiado: Add initial support for AX3000 SoC and eval board")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Harshit Shah <hshah@axiado.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/boot/dts/axiado/ax3000-evk.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/axiado/ax3000-evk.dts b/arch/arm64/boot/dts/axiado/ax3000-evk.dts
index 92101c5b534b..b86e96962557 100644
--- a/arch/arm64/boot/dts/axiado/ax3000-evk.dts
+++ b/arch/arm64/boot/dts/axiado/ax3000-evk.dts
@@ -14,6 +14,9 @@ / {
 	#size-cells = <2>;
 
 	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
 		serial3 = &uart3;
 	};
 
-- 
2.34.1


