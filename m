Return-Path: <openbmc+bounces-1065-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B594CE5A79
	for <lists+openbmc@lfdr.de>; Mon, 29 Dec 2025 02:16:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dfdZz6Rgbz2yFc;
	Mon, 29 Dec 2025 12:16:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.93.194.119 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766714327;
	cv=pass; b=P6DTGVtKmG0+t9C+3iUgT1zr5bhlgB1onWwfE+cSSqjsoBiUfYht5NEXsIWHhzHW+uV4FaQkOzA76ASzIu/FTP8bNRVlxnQaHHVOZze2kOhp81PQ/p9Vf6z1zueelYl7/PFDhQiVAK0eB4A4m9L4pMC+1rXtSyKZtyRbfATf6VPFgF+VGMS9zHK35499/C7GxpfJQSzq+DTQWDQjHcYciwshVNq0q2yEv3jtqCNdasc8lwvW43907v+KIMbNQ56+wpOYegEC0CpKQEGwwhv7ElogR8L/JuBsBzdPzm3IcPkDQdb/smXSfCmojFu0DJn+/CtbHTeKdEfqymGkZLRulw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766714327; c=relaxed/relaxed;
	bh=sKGel//sojsmXo4goX9GaY1Y9Do+Dw3gYmmVJiIydn8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZvmmOYINS2++/CI8jEOGULdIEPi+v4aPS65fNJ8ihEuHZ3HCN6a+RhYmpSMEg3DMK9B69Bvj6Xr7OvvoTCvHQBoH/dSdIZ8ZBjiu544wfqLMAsMkm6dxYm+pFs0Dxz2wy4Qby/l6YxYc81aTELRuMZaut5jcUiUcPl/dUNjl+gFbmeQuLe3IuiwFVio7fn/Ldrrh3cmmZoymwUtmlpxroFOHRSNMDtmqFgUzOh4ljt+JbfRXjYCkciXDYvlZFi7ZIT1YjL3FPOscfKSm9AfZB+9GjQLkwOByPga1J2DDRTYeAwwG+msnb2cYQZaQnKwZIermp5ICtFI37f9TOcHnYg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=mpeouQu3; dkim-atps=neutral; spf=pass (client-ip=40.93.194.119; helo=sn4pr0501cu005.outbound.protection.outlook.com; envelope-from=kchiu@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=mpeouQu3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=40.93.194.119; helo=sn4pr0501cu005.outbound.protection.outlook.com; envelope-from=kchiu@axiado.com; receiver=lists.ozlabs.org)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11021119.outbound.protection.outlook.com [40.93.194.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dcpgT5pQBz2yFQ
	for <openbmc@lists.ozlabs.org>; Fri, 26 Dec 2025 12:58:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DDL5mjOfOyKmwNWR1b2aTqIMqJ3SSXnZPXfmLFj9ViHXCfTKWxC0u0tlvIm5vGGqeY9IwWUCr2xH+pZWV4Cg0asHA/52R2b+w7bnE7whweXoJb+QjrpZOeiSg54r+QcYKaRh1ODGiY14ChJuXODk5vdNQyoos0jI2stfZZEcKBJf8vxUInhp9VW4yIG3OFszYcN0RPkxnQYBd5we4NNp5OruLUlym4haoI3Q6AL6CbUfRLzeiSnhNMQMrjQtCD2V2jb26supDcR13RQGdgWoreAILl3MfY6xzskwV9XabDBOxGBEKxTg+hOw5s/45yziPlQPqoCvD/FWrwdazjKfww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKGel//sojsmXo4goX9GaY1Y9Do+Dw3gYmmVJiIydn8=;
 b=yoyQeCDKiI2VmBOePnES+j7LpCUquzbgJfrIjt4wHGlmvAya8SLp+khXuugDR8H0moFXLTEdO0j0usFb13yQv95m2/Bjm1sZ9r/ZkCcsJgj5XXoDjZ/zzkC2zEL7fFhP8CoS5RpqSJOt4CGKgOhIlLOuyUhbZ9MlgyvoApiAfIaiPwhanot6iV/3eLg0e9IyNmOtKPzFm6P1f+4mX32RYgTZoDwN4W8RZjUTWzxHM24IKa7RSbtRNy8gRB9qt4av1L649ocxTqYXLIxiU56/DWUBAmtsFNKGeRcp0LAZAIyIVsp5cLSyZa+u5AlTRVCslYiCRjkCPXQvhk+UjXNLbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 4.227.125.105) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKGel//sojsmXo4goX9GaY1Y9Do+Dw3gYmmVJiIydn8=;
 b=mpeouQu3pKnX3VK/SETa69bieB9heEtsEmu9YkZyUzxoizzm4K80TUPHjYeyZf9tXzrAa7hbU0C4CQARBJ59oY9OOvyt73Z41pLKReF9yFEPHFve0ypdjPGij07yxBRUXxjqTJiZ8ki2n5Mgd8/xnesTWlg0nIXUr2bYekGJusl36GEopQ8lelAMxCyz+lNzQqy1iI+wyAWPINVMvRPAIDCv+7dn9M7MVnuUMz9Aft8CQ/fg7sniPRqtFPnTZwC5dol1UBNuk5sETuMtvYkHza6Xrs6or6k8YBznGKnrR8aCZypcjVrcHWCVA+y3CBN70rAAefMVzz+BjXi0JKUsFA==
Received: from SJ0PR13CA0008.namprd13.prod.outlook.com (2603:10b6:a03:2c0::13)
 by PH0PR18MB4735.namprd18.prod.outlook.com (2603:10b6:510:ce::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Fri, 26 Dec
 2025 01:58:05 +0000
Received: from CO1PEPF000044F4.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::5c) by SJ0PR13CA0008.outlook.office365.com
 (2603:10b6:a03:2c0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.2 via Frontend Transport; Fri,
 26 Dec 2025 01:58:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.227.125.105)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 4.227.125.105 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.227.125.105; helo=axiado.com;
Received: from axiado.com (4.227.125.105) by
 CO1PEPF000044F4.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.9
 via Frontend Transport; Fri, 26 Dec 2025 01:58:04 +0000
From: Kuan-Jui Chiu <kchiu@axiado.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: Harshit Shah <hshah@axiado.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH linux dev-6.12 4/6] dt-bindings: i3c: cdns: add Axiado AX3000 I3C controller
Date: Thu, 25 Dec 2025 17:57:48 -0800
Message-Id: <20251226015750.377679-4-kchiu@axiado.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|PH0PR18MB4735:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 59e71be4-67dd-43ad-0a76-08de442235ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zbP3ZdePJhdLidYaaASIiL5cefm4HRPpnUvdeZ2dAhZEokJt7gdCJ2SCUGL4?=
 =?us-ascii?Q?Z5gumUuvM1FBuJont2R4Qj5ZjPPsGXP6SEu/PzHAQ8fEhs69LsyKRyq7lKdq?=
 =?us-ascii?Q?jMO4nrjEhsR3sXi2p4//+LYMlgU9EbzOzqyWHkRXa9lJfd9W3R2PMJ8LyDqs?=
 =?us-ascii?Q?6a+jfq/fOmjwsESSaQ+PHfYnj5S9cDrmyKxo+U/o28TVGVOrIFxy9Bj90wo4?=
 =?us-ascii?Q?niFJ6/C44mBKlnmTd+QFAUcyhObUE4Ba3CeKQQ4jU5d1h/VBacQGuDKNg6Y7?=
 =?us-ascii?Q?4jIanFXlsFJLhjZp8O3GSrDYcymTh0By3/o08yijAGtXQhZAV1elCCEFITr6?=
 =?us-ascii?Q?GwKi0qeuMNLAJGGzBzSL0DnWSINSY0o3PI3xqM5yRS3FwDWtor3EV7jROz+z?=
 =?us-ascii?Q?9byJnHXjQVOhSGlJ8hszJAAECfUr/3Ik7C53gSEQj9JLYOVOdjJUu5DVfrJ5?=
 =?us-ascii?Q?KRULh44qGYq+uIZuKRrxgMM9hAnpDp+kFOUF5RNxC2UZBsImsprOlp3Xqfwh?=
 =?us-ascii?Q?KWAPMAuNp68903Uv+wIqQeofofzjU+/Ytv9h3J1prhT6sv9eWDUOomVKeVqO?=
 =?us-ascii?Q?rx7mO8zucGn9pPSuOQcuYqx/SabVPs9cZkbBYRJWu4Xwwy+6KuO5rzCzC3wd?=
 =?us-ascii?Q?f4awxQ/6g40ZP86OtkjO2mj6ounPt/YS1Y9al9A/qUmJcV8Aa6Ra3y0Kh5uX?=
 =?us-ascii?Q?GHE/8ZE/OEWvuc6OOgJkZVeIO3f5SrmIQf6q2PytpxdkikG/IEUZlFcPFVZf?=
 =?us-ascii?Q?VCpVNMr9IQAPsKYAW8LVoVLQifGFq2kPW/LsUPD1VmJRJfp61wMQd7TjHkxd?=
 =?us-ascii?Q?zqoRJBD5WSW9MTDyLhe0h3hzH5aH5swx8LxrpGRLOTNzftjn9VFqlyRaWbYy?=
 =?us-ascii?Q?exFjoPqBF80oVXyPAMsve3qa83/f+cUCu79qVZsPlg83dVv9ii8sVvqK6eEC?=
 =?us-ascii?Q?OXXD0nktmp62cSeFq98v4ULhPS0Qo0BcUn+ywnLFFCu8cOXsT1JCOEp9Lm+f?=
 =?us-ascii?Q?ckjxKWiSt2bQWbZddSo/mjo4aw6l6tCwgyzr4UbREPBtriBsuaNp8H+0PuXI?=
 =?us-ascii?Q?oTfrTHJ9hfzYcL6ylfD8kU22PSs+6ddK4oQhdyBQ9ixmz6ha3wCs6DIZvwO3?=
 =?us-ascii?Q?96FIzDbu08LtaY9KEvoP1jOPfW3oP13rh6WifzVzGDK2PUbKJfks4Owi1GGh?=
 =?us-ascii?Q?dlkveTvzp9LFWdHQeQCTBIMnEKKVR5GRWgwywXxrXD3yk/pkjOo3+nLjfTGr?=
 =?us-ascii?Q?z9YMcI7vGI/qn6ZBq6WmWdIE87ZZDFweir50AUXlTaUCcH9vo7WXBvJV/S10?=
 =?us-ascii?Q?9vtCyNll836w6eCh/gj2w6ZoGSdGDtc0pBjqCqzMAmIw7Qmbc4hKWS2ConHG?=
 =?us-ascii?Q?Fg3XYfhrfcKHp6R5QuASeRfmU7cV3qG7EHKzrZ/MJBbQ6aWCCNJMWs21rsLO?=
 =?us-ascii?Q?ooLpRSAvKPsiTGh50yKarc3v03CLm4SjJHLtLhFviDkWAKMQJghzUkFPPENl?=
 =?us-ascii?Q?2reeySD9raCQu0L79CvuOicETRIylyj0nygKMfaVXtxM6z7gCF2dEF9b2kBl?=
 =?us-ascii?Q?fzpsCCTlXRFOIPZYHJ0=3D?=
X-Forefront-Antispam-Report:
	CIP:4.227.125.105;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2025 01:58:04.8632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59e71be4-67dd-43ad-0a76-08de442235ac
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[4.227.125.105];Helo=[axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR18MB4735
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Harshit Shah <hshah@axiado.com>

Add binding for AX3000 I3C controller. So far, no changes known,
so it can fallback to default compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Harshit Shah <hshah@axiado.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
index cad6d53d0e2e..6fa3078074d0 100644
--- a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
@@ -14,7 +14,12 @@ allOf:
 
 properties:
   compatible:
-    const: cdns,i3c-master
+    oneOf:
+      - const: cdns,i3c-master
+      - items:
+          - enum:
+              - axiado,ax3000-i3c
+          - const: cdns,i3c-master
 
   reg:
     maxItems: 1
-- 
2.34.1


