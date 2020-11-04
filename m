Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 547192A6FB2
	for <lists+openbmc@lfdr.de>; Wed,  4 Nov 2020 22:34:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRKfK3PFXzDqfv
	for <lists+openbmc@lfdr.de>; Thu,  5 Nov 2020 08:34:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fii-usa.com (client-ip=40.107.236.69;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=lancelot.kao@fii-usa.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fii-usa.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=FIIcorp.onmicrosoft.com
 header.i=@FIIcorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-FIIcorp-onmicrosoft-com header.b=MjAxL895; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2069.outbound.protection.outlook.com [40.107.236.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRKcv5sb4zDqcc
 for <openbmc@lists.ozlabs.org>; Thu,  5 Nov 2020 08:32:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKVJxDamqx3lWCPNFZ9P64jLRwwNJFtD/MYmBQge5QLLA6p5PqmC8HgsVe78ukhW8l6/KN7WL837Eja8p7ma2sEHeT/a2nR/GvMBwpMhGaY97xHa1tuPAKoaLRrpLkTO+h+Nrf9nhuM9//zwhBUmk+Bql7KoqUD324B3BgeW/SyK93YdVkm4G+ocGyGvR7k5pZo0A19fGDX/TOti9ea9Z7kr3L/n6uFDGe+9Z5GpWeovLbYZg/t5ND6aZl+cKYzZMc4v329yBth7Ml7Y0FS5nn+vgia7rvp8gxeIJkyRMKB1fyyaTIv+obciw5frvmQs1JXl2aYHEarMVwq8uAH30Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Dqy4dUB0fx3wthbNLcN1dTwlTAR0JaZOcgeUPtBwtQ=;
 b=JI3em0QWT/12c6Xm3hUoNdi6r02PqNf9+BDl3ZfeaCwAUXJt6aA6MB/01LGRJc9XyfGlLr/bB++l/aMmMeGDK9MfC5gjA9NbzWExb3Z7nrFuegtqeqQV5pC5NQzG8vBnCR5mjapfTz5W91lveoSw2IkzuWiTOWknEDrogU3dUY1hG9OkcThoSfXYhnskjQkJQngSO/rvPX+nDB4cYmfzMgyEYx796lCZ0A0NQe1S3+58XOR7mtFyjSeMcRB6MNl1/H8cct5XJOwuk5iCiOyd8qxEo/6b2teJ1HRDDaU2StwxC6Npg8du1D+l2irLIf6KCX8US6lezNYH+AZIDz0UtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fii-usa.com; dmarc=pass action=none header.from=fii-usa.com;
 dkim=pass header.d=fii-usa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=FIIcorp.onmicrosoft.com; s=selector1-FIIcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Dqy4dUB0fx3wthbNLcN1dTwlTAR0JaZOcgeUPtBwtQ=;
 b=MjAxL8958dXPd5Tum+3mqgkBOxW9G1Ys1O6yIjIeO7EAqChQpokFGkzaEKQJ+LLpq7CNLm4RM+gnbTdxlKoaMYzyxoOqYYeWTsIhmf2jRGzKad5NYIUKE8C+xhNdnKSbp1R5IU1ix0gzP9zNmEnMgrDRadv0KOpB+5IUKFrFwnDOwqmQzfnFEFQ3OOAPxekaZm2p8TI8Fmi37+puYEtWxXSQ9yIgFAlHbMCpaqfmp9KD0jOeoaLr7L5TYq8csm2OrjJzoLKAj+j24lQxRCA6VlwL8F7Kq73abUy1FAz+F85oLjcoQ+5wpGjg3I9r0gu+01MHQJBigWFNrT6VrApASQ==
Authentication-Results: fii-usa.com; dkim=none (message not signed)
 header.d=none;fii-usa.com; dmarc=none action=none header.from=fii-usa.com;
Received: from DM6PR08MB4890.namprd08.prod.outlook.com (2603:10b6:5:43::18) by
 DM6PR08MB6203.namprd08.prod.outlook.com (2603:10b6:5:1e3::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18; Wed, 4 Nov 2020 21:32:40 +0000
Received: from DM6PR08MB4890.namprd08.prod.outlook.com
 ([fe80::1033:6c33:3328:bd4a]) by DM6PR08MB4890.namprd08.prod.outlook.com
 ([fe80::1033:6c33:3328:bd4a%3]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 21:32:40 +0000
From: Lancelot Kao <lancelot.kao@fii-usa.com>
To: lancelot.kao@fii-usa.com, Joel Stanley <joel@jms.id.au>,
 openbmc@lists.ozlabs.org, Benjamin Fair <benjaminfair@google.com>,
 Vivekanand Veeracholan <vveerach@google.com>
Subject: [PATCH linux dev-5.8]     Fii Kudo project device tree file
Date: Wed,  4 Nov 2020 15:32:32 -0600
Message-Id: <20201104213232.14846-1-lancelot.kao@fii-usa.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [216.63.87.86]
X-ClientProxiedBy: DM5PR06CA0080.namprd06.prod.outlook.com (2603:10b6:3:4::18)
 To DM6PR08MB4890.namprd08.prod.outlook.com
 (2603:10b6:5:43::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from OpenSystem.houston.foxconn.com (216.63.87.86) by
 DM5PR06CA0080.namprd06.prod.outlook.com (2603:10b6:3:4::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Wed, 4 Nov 2020 21:32:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 779d96ba-9485-43d5-7168-08d881092823
X-MS-TrafficTypeDiagnostic: DM6PR08MB6203:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR08MB62038341F88CD2AF883DDEE1C0EF0@DM6PR08MB6203.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:411;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W3C21wZ+1x+UY8YHVDVzZrAIlJZHb9C1QxTBqkmD03onNsXr1DSkwSQYhd9CR4P3qFcm24NOmu+PALH+o8bqPBgcq49PBiAyxfvf+V8fCvZZq5jmgcZNqt+fOKeNH9J6/5lJm1StfYhLt+2Wcxpc81IPCuqLDqOPHZNpbB9zV10/NQ5+9Q1yOIQZPQv6+MFSL3Vn0rILnX67G0fmxuIhbuoyFovPPGBZuH3HayMRSwHVdN0eKzmM46j5Rx6ob015HYH1WlvoUYt5UMxx0btkjgRyYMfUJwZicQ9lLJjj3CEptoT8zaF4hEJD1aY5ajCV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR08MB4890.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(136003)(376002)(396003)(346002)(6506007)(5660300002)(478600001)(956004)(110136005)(83380400001)(316002)(30864003)(8676002)(2616005)(8936002)(2906002)(26005)(66946007)(6666004)(44832011)(1076003)(52116002)(66476007)(86362001)(36756003)(66556008)(6512007)(6486002)(16526019)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: I1RZMRMIB8X5C1s4lWcfa/vtAbYNvCg2ULUDfjACuWpDMQFkFprvmhRUckuQ59+U4wlzimjveamgTw9vA2h1oKmrjyw4bi0xrsq5Oksh2kaK24lt011qtvlIJbb9GzER/kPFFG+dOFCClpBuPg3bL/cRnIpH40Rlw3rxO/6X19knKw7q9fnYVrvTngRBulnc2P6u+9ZY3JU8/ZcTS/Ok4Cm/Pwi1hH8K0QL+cLFhMpN5qQAkVs3n1mW7/9W0vd0CLgHeHrsOlw9ogTGahkKAFNeLZke4C/bpLKqnPcD+Wekreb8ap3krc7ubEq3F4JYdhE91W7elVxXjNCaEZRZ9MxsJ7Df+BWCt5uz0slwOAbAKjeHNKtHBIskIAX7nFCE2qrKyqxznBKw3JPCTeGRDSfPMiQnOO4TGyPPTTsXg8hgWswr0VxbQyUnIcD8fiI3O2wK35XQrVWfbJEFpY5qqehkUZAE8zZ4vjJXDZz5IGRCGpgKAelg1rfo0IHM/Ly6oo/ZEeKq45bcEgtYr3TK4LXyHRieydFxa5O11Xy7WmCaQSb7om6OyGM0sxL52L4lwaOorJ4M1qqvxI7VuPsKEwMVTjmtrZ1nJx/Dg3S1J7DquieKG0p5ks/5KPacC3jn8N0skn9Be/koSdB2+M3C5Pw==
X-OriginatorOrg: fii-usa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 779d96ba-9485-43d5-7168-08d881092823
X-MS-Exchange-CrossTenant-AuthSource: DM6PR08MB4890.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 21:32:40.4893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2f78a81d-6abb-4840-a061-3fe5396c72f2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jN8aSLr7eAdEpQ5VCpZjIBEfjrua7v7ikmgp051WVAx4/BFiNF/dMYDzGW3gyoFzWzHp5GfUJVRVa4M+0oUBE5vnMi3d8Ixkr7rigpMf424=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB6203
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

    1. Add Fii kudo project device tree dts and dtsi
    files to the upstream.

    Signed-off-by: Lancelot Kao <lancelot.kao@fii-usa.com>
    Signed-off-by: Mohaimen alsmarai <Mohaimen.alsamarai@fii-na.com>
---
 .../boot/dts/nuvoton-npcm730-kudo-gpio.dtsi   | 288 ++++++++
 arch/arm/boot/dts/nuvoton-npcm730-kudo.dts    | 676 ++++++++++++++++++
 2 files changed, 964 insertions(+)
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm730-kudo-gpio.dtsi
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm730-kudo.dts

diff --git a/arch/arm/boot/dts/nuvoton-npcm730-kudo-gpio.dtsi b/arch/arm/boot/dts/nuvoton-npcm730-kudo-gpio.dtsi
new file mode 100644
index 000000000000..0dc888dac73b
--- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-npcm730-kudo-gpio.dtsi
@@ -0,0 +1,288 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2020 Fii USA Inc. Brandon Ong <Brandon.Ong@fii-na.com>
+
+
+/ {
+	pinctrl: pinctrl@f0800000 {
+		gpio61oh_pins: gpio61oh-pins {
+			pins = "GPO61/nDTR1_BOUT1/STRAP6";
+			bias-disable;
+			output-high;
+		};
+		gpio62oh_pins: gpio62oh-pins {
+			pins = "GPO62/nRTST1/STRAP5";
+			bias-disable;
+			output-high;
+		};
+		gpio161ol_pins: gpio161ol-pins {
+			pins = "GPIO161/nLFRAME/nESPICS";
+			bias-disable;
+			output-low;
+		};
+		gpio163i_pins: gpio163i-pins {
+			pins = "GPIO163/LCLK/ESPICLK";
+			bias-disable;
+			input-enable;
+		};
+		gpio167ol_pins: gpio167ol-pins {
+			pins = "GPIO167/LAD3/ESPI_IO3";
+			bias-disable;
+			output-low;
+		};
+		gpio95i_pins: gpio95i-pins {
+			pins = "GPIO95/nLRESET/nESPIRST";
+			bias-disable;
+			input-enable;
+		};
+		gpio65ol_pins: gpio65ol-pins {
+			pins = "GPIO65/FANIN1";
+			bias-disable;
+			output-low;
+		};
+		gpio66oh_pins: gpio66oh-pins {
+			pins = "GPIO66/FANIN2";
+			bias-disable;
+			output-high;
+		};
+		gpio67oh_pins: gpio67oh-pins {
+			pins = "GPIO67/FANIN3";
+			bias-disable;
+			output-high;
+		};
+		gpio68ol_pins: gpio68ol-pins {
+			pins = "GPIO68/FANIN4";
+			bias-disable;
+			output-low;
+		};
+		gpio69i_pins: gpio69i-pins {
+			pins = "GPIO69/FANIN5";
+			bias-disable;
+			input-enable;
+		};
+		gpio70ol_pins: gpio70ol-pins {
+			pins = "GPIO70/FANIN6";
+			bias-disable;
+			output-low;
+		};
+		gpio71i_pins: gpio71i-pins {
+			pins = "GPIO71/FANIN7";
+			bias-disable;
+			input-enable;
+		};
+		gpio72i_pins: gpio72i-pins {
+			pins = "GPIO72/FANIN8";
+			bias-disable;
+			input-enable;
+		};
+		gpio73i_pins: gpio73i-pins {
+			pins = "GPIO73/FANIN9";
+			bias-disable;
+			input-enable;
+		};
+		gpio74i_pins: gpio74i-pins {
+			pins = "GPIO74/FANIN10";
+			bias-disable;
+			input-enable;
+		};
+		gpio75i_pins: gpio75i-pins {
+			pins = "GPIO75/FANIN11";
+			bias-disable;
+			input-enable;
+		};
+		gpio76i_pins: gpio76i-pins {
+			pins = "GPIO76/FANIN12";
+			bias-disable;
+			input-enable;
+		};
+		gpio77i_pins: gpio77i-pins {
+			pins = "GPIO77/FANIN13";
+			bias-disable;
+			input-enable;
+		};
+		gpio78i_pins: gpio78i-pins {
+			pins = "GPIO78/FANIN14";
+			bias-disable;
+			input-enable;
+		};
+		gpio79ol_pins: gpio79ol-pins {
+			pins = "GPIO79/FANIN15";
+			bias-disable;
+			output-low;
+		};
+		gpio80oh_pins: gpio80oh-pins {
+			pins = "GPIO80/PWM0";
+			bias-disable;
+			output-high;
+		};
+		gpio81i_pins: gpio81i-pins {
+			pins = "GPIO81/PWM1";
+			bias-disable;
+			input-enable;
+		};
+		gpio82i_pins: gpio82i-pins {
+			pins = "GPIO82/PWM2";
+			bias-disable;
+			input-enable;
+		};
+		gpio83i_pins: gpio83i-pins {
+			pins = "GPIO83/PWM3";
+			bias-disable;
+			input-enable;
+		};
+		gpio144i_pins: gpio144i-pins {
+			pins = "GPIO144/PWM4";
+			bias-disable;
+			input-enable;
+		};
+		gpio145i_pins: gpio145i-pins {
+			pins = "GPIO145/PWM5";
+			bias-disable;
+			input-enable;
+		};
+		gpio146i_pins: gpio146i-pins {
+			pins = "GPIO146/PWM6";
+			bias-disable;
+			input-enable;
+		};
+		gpio147oh_pins: gpio147oh-pins {
+			pins = "GPIO147/PWM7";
+			bias-disable;
+			output-high;
+		};
+		gpio168ol_pins: gpio168ol-pins {
+			pins = "GPIO168/nCLKRUN/nESPIALERT";
+			bias-disable;
+			output-low;
+		};
+		gpio169oh_pins: gpio169oh-pins {
+			pins = "GPIO169/nSCIPME";
+			bias-disable;
+			output-high;
+		};
+		gpio170ol_pins: gpio170ol-pins {
+			pins = "GPIO170/nSMI";
+			bias-disable;
+			output-low;
+		};
+		gpio218oh_pins: gpio218oh-pins {
+			pins = "GPIO218/nWDO1";
+			bias-disable;
+			output-high;
+		};
+		gpio37i_pins: gpio37i-pins {
+			pins = "GPIO37/SMB3CSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio38i_pins: gpio38i-pins {
+			pins = "GPIO38/SMB3CSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio39i_pins: gpio39i-pins {
+			pins = "GPIO39/SMB3BSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio40i_pins: gpio40i-pins {
+			pins = "GPIO40/SMB3BSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio121i_pins: gpio121i-pins {
+			pins = "GPIO121/SMB2CSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio122i_pins: gpio122i-pins {
+			pins = "GPIO122/SMB2BSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio123i_pins: gpio123i-pins {
+			pins = "GPIO123/SMB2BSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio124i_pins: gpio124i-pins {
+			pins = "GPIO124/SMB1CSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio125i_pins: gpio125i-pins {
+			pins = "GPIO125/SMB1CSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio126i_pins: gpio126i-pins {
+			pins = "GPIO126/SMB1BSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio127i_pins: gpio127i-pins {
+			pins = "GPIO127/SMB1BSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio136i_pins: gpio136i-pins {
+			pins = "GPIO136/SD1DT0";
+			bias-disable;
+			input-enable;
+		};
+		gpio137oh_pins: gpio137oh-pins {
+			pins = "GPIO137/SD1DT1";
+			bias-disable;
+			output-high;
+		};
+		gpio138i_pins: gpio138i-pins {
+			pins = "GPIO138/SD1DT2";
+			bias-disable;
+			input-enable;
+		};
+		gpio139i_pins: gpio139i-pins {
+			pins = "GPIO139/SD1DT3";
+			bias-disable;
+			input-enable;
+		};
+		gpio140i_pins: gpio140i-pins {
+			pins = "GPIO140/SD1CLK";
+			bias-disable;
+			input-enable;
+		};
+		gpio141i_pins: gpio141i-pins {
+			pins = "GPIO141/SD1WP";
+			bias-disable;
+			input-enable;
+		};
+		gpio190oh_pins: gpio190oh-pins {
+			pins = "GPIO190/nPRD_SMI";
+			bias-disable;
+			output-high;
+		};
+		gpio191oh_pins: gpio191oh-pins {
+			pins = "GPIO191";
+			bias-disable;
+			output-high;
+		};
+		gpio195ol_pins: gpio195ol-pins {
+			pins = "GPIO195/SMB0BSDA";
+			bias-disable;
+			output-low;
+		};
+		gpio196ol_pins: gpio196ol-pins {
+			pins = "GPIO196/SMB0CSCL";
+			bias-disable;
+			output-low;
+		};
+		gpio199i_pins: gpio199i-pins {
+			pins = "GPIO199/SMB0DSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio202ol_pins: gpio202ol-pins {
+			pins = "GPIO202/SMB0CSDA";
+			bias-disable;
+			output-low;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts b/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts
new file mode 100644
index 000000000000..76e0860763b0
--- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts
@@ -0,0 +1,676 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2020 Fii USA Inc. Mustatfa Shehabi <Mustafa.Shehabi@fii-na.com>
+
+/dts-v1/;
+#include "nuvoton-npcm730.dtsi"
+#include "nuvoton-npcm730-kudo-gpio.dtsi"
+
+/ {
+	model = "Fii Kudo Board (Device Tree v00.01)";
+	compatible = "nuvoton,npcm730";
+
+	aliases {
+		ethernet0 = &emc0;
+		ethernet1 = &gmac0;
+		serial0 = &serial0;
+		serial1 = &serial1;
+		serial2 = &serial2;
+		serial3 = &serial3;
+		udc0 = &udc0;
+		udc1 = &udc1;
+		udc2 = &udc2;
+		udc3 = &udc3;
+		udc4 = &udc4;
+		udc5 = &udc5;
+		udc6 = &udc6;
+		udc7 = &udc7;
+		udc8 = &udc8;
+		udc9 = &udc9;
+		emmc0 = &sdhci0;
+		vdma = &vdma;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
+		i2c7 = &i2c7;
+		i2c8 = &i2c8;
+		i2c9 = &i2c9;
+		i2c10 = &i2c10;
+		i2c11 = &i2c11;
+		i2c12 = &i2c12;
+		i2c13 = &i2c13;
+		spi0 = &spi0;
+		spi1 = &spi1;
+		fiu0 = &fiu0;
+		fiu1 = &fiu3;
+	};
+
+	chosen {
+		stdout-path = &serial3;
+	};
+
+	memory {
+		reg = <0 0x40000000>;
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
+			<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>;
+	};
+
+	jtag_master {
+		compatible = "nuvoton,npcm750-jtag-master";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		dev-num = <0>; /* /dev/jtag0 */
+		mode = "pspi"; /* pspi or gpio */
+
+		pspi-controller = <2>; /* pspi2 */
+		reg = <0xf0201000 0x1000>;
+		interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&clk NPCM7XX_CLK_APB5>;
+
+		jtag-gpios = <&gpio0 19 GPIO_ACTIVE_HIGH>, /* TCK */
+				<&gpio0 18 GPIO_ACTIVE_HIGH>, /* TDI */
+				<&gpio0 17 GPIO_ACTIVE_HIGH>, /* TDO */
+				<&gpio0 16 GPIO_ACTIVE_HIGH>; /* TMS */
+		status = "okay";
+	};
+
+	ahb {
+		gmac0: eth@f0802000 {
+			phy-mode = "rgmii-id";
+			snps,eee-force-disable;
+			status = "okay";
+		};
+
+		emc0: eth@f0825000 {
+			status = "okay";
+		};
+
+		ehci1: usb@f0806000 {
+			status = "okay";
+		};
+
+		ohci1: ohci@f0807000 {
+			status = "okay";
+		};
+
+		udc0: udc@f0830000 {
+			status = "okay";
+		};
+
+		udc1: udc@f0831000 {
+			status = "okay";
+		};
+
+		udc2: udc@f0832000 {
+			status = "okay";
+		};
+
+		udc3: udc@f0833000 {
+			status = "okay";
+		};
+
+		udc4: udc@f0834000 {
+			status = "okay";
+		};
+
+		udc5: udc@f0835000 {
+			status = "okay";
+		};
+
+		udc6: udc@f0836000 {
+			status = "okay";
+		};
+
+		udc7: udc@f0837000 {
+			status = "okay";
+		};
+
+		udc8: udc@f0838000 {
+			status = "okay";
+		};
+
+		udc9: udc@f0839000 {
+			status = "okay";
+		};
+
+		aes: aes@f0858000 {
+			status = "okay";
+		};
+
+		sha: sha@f085a000 {
+			status = "okay";
+		};
+
+		fiu0: spi@fb000000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi0cs1_pins>;
+			status = "okay";
+			spi-nor@0 {
+				compatible = "jedec,spi-nor";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				reg = <0>;
+				spi-max-frequency = <5000000>;
+				spi-rx-bus-width = <2>;
+				partitions@80000000 {
+					compatible = "fixed-partitions";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					bmc@0{
+						label = "bmc";
+						reg = <0x000000 0x2000000>;
+					};
+					u-boot@0 {
+						label = "u-boot";
+						reg = <0x0000000 0xC0000>;
+						read-only;
+					};
+					u-boot-env@100000{
+						label = "u-boot-env";
+						reg = <0x00100000 0x40000>;
+					};
+					kernel@200000 {
+						label = "kernel";
+						reg = <0x0200000 0x600000>;
+					};
+					rofs@800000 {
+						label = "rofs";
+						reg = <0x800000 0x3500000>;
+					};
+					rwfs@1d00000 {
+						label = "rwfs";
+						reg = <0x3d00000 0x300000>;
+					};
+				};
+			};
+			spi-nor@1 {
+				compatible = "jedec,spi-nor";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				reg = <1>;
+				spi-max-frequency = <5000000>;
+				spi-rx-bus-width = <2>;
+				partitions@88000000 {
+					compatible = "fixed-partitions";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					spare1@0 {
+						label = "spi0-cs1-spare1";
+						reg = <0x0 0x800000>;
+					};
+					spare2@800000 {
+						label = "spi0-cs1-spare2";
+						reg = <0x800000 0x0>;
+					};
+				};
+			};
+		};
+
+		fiu3: spi@c0000000 {
+			pinctrl-0 = <&spi3_pins>;
+			status = "okay";
+			spi-nor@0 {
+				compatible = "jedec,spi-nor";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				reg = <0>;
+				spi-max-frequency = <5000000>;
+				spi-rx-bus-width = <2>;
+				partitions@A0000000 {
+					compatible = "fixed-partitions";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					system1@0 {
+						label = "bios";
+						reg = <0x0 0x0>;
+					};
+					system2@800000 {
+						label = "spi3-system2";
+						reg = <0x800000 0x0>;
+					};
+				};
+			};
+		};
+
+		sdhci0: sdhci@f0842000 {
+			status = "okay";
+		};
+
+		vdma: vdma@e0800000 {
+			status = "okay";
+		};
+
+		pcimbox: pcimbox@f0848000 {
+			status = "okay";
+		};
+
+		vcd: vcd@f0810000 {
+			status = "okay";
+		};
+
+		ece: ece@f0820000 {
+			status = "okay";
+		};
+
+		apb {
+
+			watchdog1: watchdog@901C {
+				status = "okay";
+			};
+
+			rng: rng@b000 {
+				status = "okay";
+			};
+
+			serial0: serial@1000 {
+				status = "okay";
+			};
+
+			serial1: serial@2000 {
+				status = "okay";
+			};
+
+			serial2: serial@3000 {
+				status = "okay";
+			};
+
+			serial3: serial@4000 {
+				status = "okay";
+			};
+
+			adc: adc@c000 {
+				#io-channel-cells = <1>;
+				status = "okay";
+			};
+
+			otp:otp@189000 {
+				status = "okay";
+			};
+
+			i2c0: i2c@80000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "disabled";
+			};
+
+			i2c1: i2c@81000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+
+				i2c-switch@75 {
+					compatible = "nxp,pca9548";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x75>;
+					i2c-mux-idle-disconnect;
+
+					i2c@2 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <2>;
+
+						max31790@58 {// Fan 
+							compatible = "maxim,max31790";
+							reg = <0x58>;
+						};
+					};
+
+					i2c@3 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <3>;
+
+						max31790@58 { // Fan 
+							compatible = "maxim,max31790";
+							reg = <0x58>;
+						};
+					};
+
+					i2c-bus@4 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <4>;
+
+						lm75@5c {//INLET1_T
+							compatible = "ti,lm75";
+							reg = <0x5c>;
+						};
+					};
+
+					i2c-bus@5 {//OUTLET1_T
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <5>;
+
+						lm75@5c {
+							compatible = "ti,lm75";
+							reg = <0x5c>;
+						};
+					};
+
+					i2c-bus@6 {//OUTLET2_T
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <6>;
+
+						lm75@5c {
+							compatible = "ti,lm75";
+							reg = <0x5c>;
+						};
+					};
+
+					i2c-bus@7 {//OUTLET3_T
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <7>;
+
+						lm75@5c {
+							compatible = "ti,lm75";
+							reg = <0x5c>;
+						};
+					};
+				};
+				i2c-switch@77 {
+					compatible = "nxp,pca9548";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x77>;
+					i2c-mux-idle-disconnect;
+
+					i2c-bus@2 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <2>;
+
+						pmbus@74 { // STB-T
+							compatible = "pmbus";
+							reg = <0x74>;
+						};
+					};
+				};
+			};
+
+			i2c2: i2c@82000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+				
+				smpro@4f {
+					compatible = "ampere,smpro";
+					reg = <0x4f>;
+				};
+
+				smpro@4e {
+					compatible = "ampere,smpro";
+					reg = <0x4e>;
+				};
+			};
+
+			i2c3: i2c@83000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c4: i2c@84000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+
+				i2c-switch@77 {
+					compatible = "nxp,pca9548";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x77>;
+					i2c-mux-idle-disconnect;
+
+					i2c-bus@0 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <0>;
+
+						adm1266@40 { // ADC sensors
+							compatible = "adi,adm1266";
+							reg = <0x40>;
+						};
+					};
+
+					i2c-bus@1 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <1>;
+
+						adm1266@41 { // ADC sensors
+							compatible = "adi,adm1266";
+							reg = <0x41>;
+						};
+					};
+				};
+			};
+
+			i2c5: i2c@85000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c6: i2c@86000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c7: i2c@87000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c8: i2c@88000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c9: i2c@89000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c10: i2c@8a000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c11: i2c@8b000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c12: i2c@8c000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+
+				ssif-bmc@10 {
+					compatible = "ssif-bmc";
+					reg = <0x10>;
+					status = "okay";
+				};
+			};
+
+			i2c13: i2c@8d000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+
+				i2c-switch@77 {
+					compatible = "nxp,pca9548";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x77>;
+					i2c-mux-idle-disconnect;
+
+					i2c-bus@3 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <3>;
+
+						lm75@28 {//M2_ZONE_T
+							compatible = "ti,lm75";
+							reg = <0x28>;
+						};
+					};
+
+					i2c-bus@4 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <4>;
+
+						lm75@29 {//BATT_ZONE_T
+							compatible = "ti,lm75";
+							reg = <0x29>;
+						};
+					};
+
+					i2c-bus@5 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <5>;
+
+						lm75@28 {//NBM1_ZONE_T
+							compatible = "ti,lm75";
+							reg = <0x28>;
+						};
+					};
+					i2c-bus@6 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <6>;
+
+						lm75@29 {//NBM2_ZONE_T
+							compatible = "ti,lm75";
+							reg = <0x29>;
+						};
+					};
+				};
+			};
+
+			spi0: spi@200000 {
+				cs-gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
+				status = "okay";
+			};
+
+			spi1: spi@201000 {
+				status = "disabled";
+			};
+		};
+	};
+
+	pinctrl: pinctrl@f0800000 {
+		pinctrl-names = "default";
+		pinctrl-0 = <
+				&gpio61oh_pins
+				&gpio62oh_pins
+				&gpio161ol_pins
+				&gpio163i_pins
+				&gpio167ol_pins
+				&gpio95i_pins
+				&gpio65ol_pins
+				&gpio66oh_pins
+				&gpio67oh_pins
+				&gpio68ol_pins
+				&gpio69i_pins
+				&gpio70ol_pins
+				&gpio71i_pins
+				&gpio72i_pins
+				&gpio73i_pins
+				&gpio74i_pins
+				&gpio75i_pins
+				&gpio76i_pins
+				&gpio77i_pins
+				&gpio78i_pins
+				&gpio79ol_pins
+				&gpio80oh_pins
+				&gpio81i_pins
+				&gpio82i_pins
+				&gpio83i_pins
+				&gpio144i_pins
+				&gpio145i_pins
+				&gpio146i_pins
+				&gpio147oh_pins
+				&gpio168ol_pins
+				&gpio169oh_pins
+				&gpio170ol_pins
+				&gpio218oh_pins
+				&gpio37i_pins
+				&gpio38i_pins
+				&gpio39i_pins
+				&gpio40i_pins
+				&gpio121i_pins
+				&gpio122i_pins
+				&gpio123i_pins
+				&gpio124i_pins
+				&gpio125i_pins
+				&gpio126i_pins
+				&gpio127i_pins
+				&gpio136i_pins
+				&gpio137oh_pins
+				&gpio138i_pins
+				&gpio139i_pins
+				&gpio140i_pins
+				&gpio141i_pins
+				&gpio190oh_pins
+				&gpio191oh_pins
+				&gpio195ol_pins
+				&gpio196ol_pins
+				&gpio199i_pins
+				&gpio202ol_pins
+				>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		heartbeat {
+		label = "heartbeat";
+			gpios = <&gpio0 14 1>;
+		};
+	};
+
+};
+
+&gcr {
+	serial_port_mux: mux-controller {
+	compatible = "mmio-mux";
+	#mux-control-cells = <1>;
+
+	mux-reg-masks = <0x38 0x07>;
+	idle-states = <6>;
+	};
+};
-- 
2.17.1

