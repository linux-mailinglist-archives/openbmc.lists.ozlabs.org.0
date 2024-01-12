Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5CA82B92D
	for <lists+openbmc@lfdr.de>; Fri, 12 Jan 2024 02:38:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=YnHLHr+Q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TB41y6ZCRz3dGl
	for <lists+openbmc@lfdr.de>; Fri, 12 Jan 2024 12:38:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=YnHLHr+Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::60b; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2060b.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TB40Q3h4yz2yN3
	for <openbmc@lists.ozlabs.org>; Fri, 12 Jan 2024 12:37:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ioLfNuWYmiUe9j8SX9H0OfoKR7IuuXnGZvhwarF/MRi1mTb9qDRzugEXCKMmSxwSsvP7JKlYiutoiGTtskNvwOCG2nYcak2YfX/8YbdYKhxnbNIIMvsY72KV8t+bvYpCILj44m3V07Ny9UhzTunTyhSLEOHhW1woYo7Iwrs9oPlAu2hKLQJeJqqNkQfo5rBiFil+SzFq8Flz6S/IAzJmO03NEy9de83zhAkD3B6sgRoEMkDrCGn5hyNgENw37HbXGu9g1VmTS5JyR4foahY7GbH7P/Eb4QaRZRYevsx9DnMAogl4jya2fbLGzhoc+bV1FmayCUbem/NSPkTO8Ih8+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9YqZIRGoRVACVywGFiyLdn9lIdFN6xflG5CyzuX0wo=;
 b=TGPRphPyw7ff/zJwXximWhVcXnhVb5fbf0fchqsfgpA3NMMrpSYmj+u65S5mKXVw4Y/cw6c4bQ18YtTCJR6yM38PuidYJAcM+7Pf+tFDEBYYyQSA6z7vD7cmiv30cZaScbgwdNb/igABEXbWUE1HaUVsu/HwWlj3vK70RWccAubBKngQSxbFeCdCnn3zJqQf+JHsLsPae5Ur0GGMvCm8duUgKAwBLwbhmJqs9fejtPVsuznLEIlJV/n6/Qjks8ovEWpSrKGylnfR30LfGjryzhcJDnVbjfwa35H/+qTi9XDxArk0gt3miSlc/IX66qj8qvxwvy98boiFeFcJGlw3/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K9YqZIRGoRVACVywGFiyLdn9lIdFN6xflG5CyzuX0wo=;
 b=YnHLHr+QrjfC8DL9kxlHUC5DSDSLUOilaHVQZ0jS7pd+bxg6O1Z4yF36GnlCQsuMot601xV/QhAZuSPiq/LxGfn9oIZbv59BIHH13w3AkHFMSuj8dx1zCspzo7Qx6g1OtnbhRggJhZjNc7EN3tuHxWeHhSeYzZpwgSTT6f2wBPpMGVfeZqAxWt36v1fnsFr/cZrMu71zlVkhkiMlWkvWfC3f6r0hmt/OUqa54yufRJjsSfvLi0o8WNH7Sc6YjdXeCDG0T+D3rcqRvamyZ5jQWuf+UhPseBQ0JStJK6llSstUayNDzpW2IJTJ2ToqT22n0KSZcLq7Xp0QlWG2X0px5w==
Received: from SI2PR04CA0008.apcprd04.prod.outlook.com (2603:1096:4:197::20)
 by SEYPR04MB7476.apcprd04.prod.outlook.com (2603:1096:101:1db::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Fri, 12 Jan
 2024 01:37:03 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:4:197:cafe::7d) by SI2PR04CA0008.outlook.office365.com
 (2603:1096:4:197::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19 via Frontend
 Transport; Fri, 12 Jan 2024 01:37:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.7181.14 via Frontend Transport; Fri, 12 Jan 2024 01:37:01
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH v1 1/2] dt-bindings: arm: nuvoton: add Facebook Yosemite 4 board
Date: Fri, 12 Jan 2024 09:36:51 +0800
Message-Id: <20240112013654.1424451-2-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240112013654.1424451-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240112013654.1424451-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|SEYPR04MB7476:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: efb2525c-58a0-4c5e-c8b8-08dc130ef9de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	kmtlmsFvAnbDexBN8iBmWmFvR8IQny8W06C/9r8UYi3ukj12PI/VC/qrk4N8g9EwUGcuS7T+kTNDBfKRnRmGU0a7Hhoa1TBY5eO0x5hmxludtKqt5xl6yzN2Ax6RqXimPB1HpfyFNZCVfDlWZqP/EvIJdp04SfoWi7DI1M8alRX4Ngp5nZWaHYSF4CKi62SCLHC66udfaxulnEIjDpN1D3shgz++EaYYxJOeC+JDG4P3jupPkOEIiJiutGUYKh3UT7g0q9v1X+M11/IXeb+NMq9MyM/3sTWS5woJxDUpze1uIj8YiEUuiTRGi70x2uB4Qneb9fAiUD6pw//SDTCCTXIVaDjaOqqecLHzMPug0cL/keL64W15l42seFxwwtSFn/B5sHjHX5KBjDzMOEjLJyZgi/G0VM+pwgozH0xzZ5Y+PNrGOwTzj1qGnAkrnOQGKP8tKw5wiGQoOZx4rAo67hRBV7NEvZpMlWiVYWbg0m7tQLKMMTgzBi+uCdBUVcVpqczt5MvvZ5Iut9xoINvs2J1WSEeDOP1BlMTBjWITWvH3+3ra1FQTiPmsfZ6ZiEspkTOJ3OloHSDTEgTbBrI4NzimGJy0sqHAMqyX2pApQQ+QR4aJMtk2fQ7YqJpentxNyCrNJgiTQCAFHTJTpnPw1GHgvwL0WGG0e3bSzwpgz094VZGfjOaiGRX6PMXFmIeHuBER7IC7ybs2hTTDDld/DNycz0LFFdli3q3y9w5lHIA=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(346002)(376002)(136003)(396003)(39860400002)(47680400002)(230922051799003)(1800799012)(451199024)(186009)(82310400011)(64100799003)(46966006)(36840700001)(6506007)(6512007)(336012)(2616005)(82740400003)(36860700001)(47076005)(26005)(956004)(8676002)(8936002)(4326008)(4744005)(7416002)(478600001)(6486002)(36736006)(5660300002)(316002)(6666004)(2906002)(110136005)(1076003)(41300700001)(921011)(70586007)(70206006)(81166007)(9316004)(86362001)(356005)(36756003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 01:37:01.9552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efb2525c-58a0-4c5e-c8b8-08dc130ef9de
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB7476
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Document the new compatibles used on Facebook Yosemite 4.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 Documentation/devicetree/bindings/arm/nuvoton/nuvoton,npcm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/nuvoton/nuvoton,npcm.yaml b/Documentation/devicetree/bindings/arm/nuvoton/nuvoton,npcm.yaml
index d386744c8815..f0168b9de622 100644
--- a/Documentation/devicetree/bindings/arm/nuvoton/nuvoton,npcm.yaml
+++ b/Documentation/devicetree/bindings/arm/nuvoton/nuvoton,npcm.yaml
@@ -30,6 +30,7 @@ properties:
       - description: NPCM845 based boards
         items:
           - enum:
+              - facebook,yosemite4-n-bmc
               - nuvoton,npcm845-evb         # NPCM845 evaluation board
           - const: nuvoton,npcm845
 
-- 
2.25.1

