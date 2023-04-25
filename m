Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 375206EDC05
	for <lists+openbmc@lfdr.de>; Tue, 25 Apr 2023 09:01:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5Cb412q7z3bh3
	for <lists+openbmc@lfdr.de>; Tue, 25 Apr 2023 17:01:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=S9JB08nQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eb2::72f; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=S9JB08nQ;
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2072f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eb2::72f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5CWy5vrHz3cd6;
	Tue, 25 Apr 2023 16:58:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cRSbrfw6/7RRmj0iQZ9XcLDzslilP9Y/LSjluV+VZXXX5expmO4/8oXCQUkpU8YagBgkdBjKQce+RyrAclFlNJxLWW9EKYcEETIHD9bJC6B3hWEkRu20/kWFS2BAfKc/2TnYSFxOlHbEd41kC6B8JrOpbM5UpwLl38/ZWYyocI/beCyKrjDFcoycJSDcD1YwC5WwX63z3s0ZX0VzIlPTBJOpCSvUqyRYLQp3lOq7PTnz18qSRA9gcvFfocR9TQhFwrTZBK/YfIdrawZ/6hPnNVgEKoBpF/LhlRdvFFvSFRBTXb5wgoYuFvSIZ5sRmkxPmW4rLGNkjZ33VI8w77Dbjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BsgOiHHpxY+wnoEyDLlsEeEqiFxUKcTKV9FoEc/l4Cg=;
 b=V64IJ9iAx0wsvh8k0fRzj27DOZDn8XvyCY6NjDgbBZ7UHYDR7/V2gE5Oo2pyzM4OoyoXNL905xUTz5i0WiVEX/sfyWRCs1V8oNfQzopc/Oumme4nAse/7D34/93vVM/5g44aQT3hdWJa0J3IckmmoapVwbCRvC8C9vULVuAuPGOB1ZM5WmjzbQ1tmYG59eG/OZWvNPyJ9PIMloFcKZHkm89zFwpfc1ZH4MUUH02K9AJXRGWmT9N2y1S2QOVcsZ5RSqRnUPxGBXPmZKLBcLAV+y2ColmNZboH+7iTMpCr3KYjigYefRz4zxLzyfWhaMivVqHYa2Fogxh/Zz98d0dxTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BsgOiHHpxY+wnoEyDLlsEeEqiFxUKcTKV9FoEc/l4Cg=;
 b=S9JB08nQcuEwdSRZAMC+h9KukVBVAIM1OEl+B+cqDSvQiyQZ4Qt6Rgb9djB9e40ijEUyVstH9ADw9r+gR1Aonrut5Qu0JEDRqo5IKW/nNEk+bq9JKDhdTTpJVB0EkJCUQrtPQd5IduvX1HZs3+aQvVeb9MfroO62L5ET5pOiiIk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BYAPR01MB4966.prod.exchangelabs.com (2603:10b6:a03:7e::28) by
 PH0PR01MB6504.prod.exchangelabs.com (2603:10b6:510:b::14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.19; Tue, 25 Apr 2023 06:58:20 +0000
Received: from BYAPR01MB4966.prod.exchangelabs.com
 ([fe80::46c3:3b44:d2f8:4c3]) by BYAPR01MB4966.prod.exchangelabs.com
 ([fe80::46c3:3b44:d2f8:4c3%4]) with mapi id 15.20.6340.019; Tue, 25 Apr 2023
 06:58:20 +0000
From: Chanh Nguyen <chanh@os.amperecomputing.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] ARM: dts: aspeed: mtmitchell: Update ADC sensors for Mt.Mitchell DVT systems
Date: Tue, 25 Apr 2023 13:57:14 +0700
Message-Id: <20230425065715.21871-4-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230425065715.21871-1-chanh@os.amperecomputing.com>
References: <20230425065715.21871-1-chanh@os.amperecomputing.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:54::15) To BYAPR01MB4966.prod.exchangelabs.com
 (2603:10b6:a03:7e::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR01MB4966:EE_|PH0PR01MB6504:EE_
X-MS-Office365-Filtering-Correlation-Id: 71389a6c-9b86-48b0-556f-08db455a73fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	IY/blidp4dHgGVRHuXR31zK0h3btv6JguWs9Wm1rSauaC02MKZdNqthG/qXX/BBIFPHQVAFrcvkJ7qk2fL/CExHZ5seX1CkBwTDgpx+oVhynA60IcyfW08fCaue+dzu5PdIF7lIDdRN3xNpgL5fc0J6SAyjUjBA0gvKTau7GoUtetU4UAwDWvgfumZUR+OlyrS30KyFP/Rxv1Bsp1nGELU1CtpKjDvNmiHI4dSCueguM3RnmNKQYMHVGO3Fv1WwCAHVx6zoYFnMOA4IjEUslHVf4eiYkCGUBZz2f/CDZFTeKPBgotwpnUF4mb2cU7nWnCH2KXBY3QPKlPVf/6qf5CVj1BOL2MC1L7moVM3mdLoDlFOLRd7XvS+yEgLwFsCsUnPSfv/5CglxlB67igPjSEx50de6pkCN/UHqCBbdaFoMzZBx6yGVxgU5pl9jJdW/AC4nGW9P89hQ2ECCIzS19Ofj7rppYxzfW3aXfuM3UrZKDVhn+zT/XRqgqoEaWS2GrmhbjJ0XPfKq1NorWKZrPnSXr1FhVdjKJNCXyMNeUo9VyUlZhrtmTfJOF0C7KZcIduNvlSH6+czP07dE4D/gJ9W5FQoqXmutcbiyJBGuSPoO5VaS7lKop2IhS118Y47lrk9CfzvlFmPV+vCCF4S6a/gPFD7p1CszQbTId+AwVCxY=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR01MB4966.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(346002)(39850400004)(376002)(136003)(451199021)(107886003)(6506007)(1076003)(26005)(6512007)(2616005)(83380400001)(186003)(38350700002)(38100700002)(66946007)(478600001)(86362001)(66556008)(66476007)(8676002)(8936002)(110136005)(5660300002)(52116002)(6486002)(41300700001)(2906002)(4326008)(6666004)(316002)(414714003)(473944003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?9lVV2IM0xIXJgWE8ZkwMaHPajx+Pkj+c1dPWO/kvm/oN55OhpqebLuuwcvsn?=
 =?us-ascii?Q?P0nzkAYnGzGovMt4Bq2EnFQu6ZYgnvZDpwD+CEXI6AjSQlMCfEdJVRWtHncs?=
 =?us-ascii?Q?cLncYnFG0I+dV1ycFlvR40MX9a0ZO5oS8VYvzKIAEoqJIHdLyY+UUQ9fLDr/?=
 =?us-ascii?Q?VhgNg7j4U1yEHKTXK4CWFft04keAM0VZJNcacPKEykubNhhdxr2/hYPFQz9+?=
 =?us-ascii?Q?agptnpuXPyBSbvDaCzbNXNRZ6/hU00VjW5/X1bvNdNFhc9xbfvHcfuT6oE2e?=
 =?us-ascii?Q?vJ5IGtCI7cQ5Pd3m+9u/XsDTDJetFCA9WZ9hhYFHbtAbts34P5Vk4BgUf4+5?=
 =?us-ascii?Q?dSBLQ3i54cS5aB9NPA+Tai6uKlfgGhNW0yZ+T9cu6enXIVX7K/1HUpf+NDwB?=
 =?us-ascii?Q?Ca8XKyIjhTlFEDRFiP8yBk0K8c9BC73+QO7BBLZ9I8v6URjfQIZab+w3O+Up?=
 =?us-ascii?Q?uBRAzR7YuBjiC3nc/yYMip1FakZ7nzHeCdOUaz96056Uv/hCVBZ+xpcA0HgQ?=
 =?us-ascii?Q?sxpGQStSVSVtNlzCG7F6gpzEbZ7oILNHEXWjRViIHqRRgascZXdJtx90aB7u?=
 =?us-ascii?Q?xm1muSugLBMifF3cmTdzfib+Z9roa0RdD6LepP1bPkjY6V3XV3vspismPXYZ?=
 =?us-ascii?Q?BsTjf14FMl5MfS+g7y+Th18nNqPL6WfUJE9aYRU0pIzkX+jg2TXo0pz/+EAK?=
 =?us-ascii?Q?E9FupA+A6lfVG+GrV5LgHT/nAjafiawLdu3px0/3FbSH/N3diFcNeUFUilU+?=
 =?us-ascii?Q?dugyajhdt4dHCvcBnLa6+p3A39TRxUYv43ixVwluJln/VbNG3/p+7CB0GQRW?=
 =?us-ascii?Q?ud3lYkcic/krBi6yJBXkMEFHnjfJVZaDX3fG4bj7ktKqwWcPYt56p1bseoZ/?=
 =?us-ascii?Q?3IuWxKfMH1/Ve37srXOfimb9F/kAos+ZM+gJNh1CrIzhSyjgUdDf5hD7qJud?=
 =?us-ascii?Q?rpG/aJ9Mb6p3PIN2VC0dV5T6w5c0pvDrDhWfAO78KLVLQiQUiPFopMyjvuLw?=
 =?us-ascii?Q?Mp0PcXs9smH0gy/lfsGeGQjGBK7FpjWTIBJSyavOgu2oYP/tkmz8YWahJjCZ?=
 =?us-ascii?Q?F/86NIlGl8dNdY+7Czj6bS1I33GtvNVdWa2YJni7/IO/Rull6+gg0Rx8ubuo?=
 =?us-ascii?Q?L3Pdz/+keIEYhfPrkbE2xiJ7mCrCxnWZie7YOvNolEoKdLymJqje9G4byOkP?=
 =?us-ascii?Q?BwiNiJue0hb9qVsYf5KmNiibR1AC/N3TUBoKNLT8WsNqfz8hzNX6oaG03lxR?=
 =?us-ascii?Q?x37a8koE3gY46+DxONhSRqqdchqYjPXkU7oKBQaKiC8F/sutfBP16ccfFY8p?=
 =?us-ascii?Q?V/TzZD5Pf+ZIoZuPtu7kXrvX5fkCM02VN8o+mbnoJxeYmdxGY12ilmu+2EVY?=
 =?us-ascii?Q?E9HY2UgVI6Yc1k5mnfW42ydciT8TUBQPwzxFW05aIQhV9CnUQmHiA/XA//jV?=
 =?us-ascii?Q?Ddrn+axT8AhES3jjri7YGob97WDRa6r4O3XLyY1HZMH0CWRyrNm607l7DWMg?=
 =?us-ascii?Q?OeVpOBBBC8s5a2hJGEWcYumO/2TOHzNtxRP1GuLoW3/w9QzgFhcVBtcKPJMS?=
 =?us-ascii?Q?9U43r5fxlzxQf+2EtrI82cwsyQ1uPNmJs3xQuKjsS6jMpLqwgi9m/6mEpKGC?=
 =?us-ascii?Q?2TGuywvXxBXQt28WdpDsdBQ=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71389a6c-9b86-48b0-556f-08db455a73fa
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4966.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 06:58:20.0007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LUFupQPoaRRFKQOy/B7swy9DvnNEHPDHF97/mb/CTH56fOZPE0FfnYvOvBcMOyzFhtDhq0ccKfyF3vtBxyKrTbKXWguaX+oGcdnYZoIKi9ybTGOWRo289N8pRXRBPGJC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB6504
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
Cc: Chanh Nguyen <chanh@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Change to use I2C ADC controller (ltc2497) for Mt.Mitchell DVT and
later hardware.

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
 .../boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 107 +++++++++++-------
 1 file changed, 66 insertions(+), 41 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
index 6455cf80da0e..0b5ea8620063 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
@@ -65,174 +65,192 @@
 
 	adc0mux: adc0mux {
 		compatible = "io-channel-mux";
-		io-channels = <&adc0 0>;
+		io-channels = <&adc_i2c_0 0>;
 		#io-channel-cells = <1>;
 		io-channel-names = "parent";
 		mux-controls = <&gpioI5mux>;
+		settle-time-us = <10000>;
 		channels = "s0", "s1";
 	};
 
 	adc1mux: adc1mux {
 		compatible = "io-channel-mux";
-		io-channels = <&adc0 1>;
+		io-channels = <&adc_i2c_0 1>;
 		#io-channel-cells = <1>;
 		io-channel-names = "parent";
 		mux-controls = <&gpioI5mux>;
+		settle-time-us = <10000>;
 		channels = "s0", "s1";
 	};
 
 	adc2mux: adc2mux {
 		compatible = "io-channel-mux";
-		io-channels = <&adc0 2>;
+		io-channels = <&adc_i2c_0 2>;
 		#io-channel-cells = <1>;
 		io-channel-names = "parent";
 		mux-controls = <&gpioI5mux>;
+		settle-time-us = <10000>;
 		channels = "s0", "s1";
 	};
 
 	adc3mux: adc3mux {
 		compatible = "io-channel-mux";
-		io-channels = <&adc0 3>;
+		io-channels = <&adc_i2c_0 3>;
 		#io-channel-cells = <1>;
 		io-channel-names = "parent";
 		mux-controls = <&gpioI5mux>;
+		settle-time-us = <10000>;
 		channels = "s0", "s1";
 	};
 
 	adc4mux: adc4mux {
 		compatible = "io-channel-mux";
-		io-channels = <&adc0 4>;
+		io-channels = <&adc_i2c_0 4>;
 		#io-channel-cells = <1>;
 		io-channel-names = "parent";
 		mux-controls = <&gpioI5mux>;
+		settle-time-us = <10000>;
 		channels = "s0", "s1";
 	};
 
 	adc5mux: adc5mux {
 		compatible = "io-channel-mux";
-		io-channels = <&adc0 5>;
+		io-channels = <&adc_i2c_0 5>;
 		#io-channel-cells = <1>;
 		io-channel-names = "parent";
 		mux-controls = <&gpioI5mux>;
+		settle-time-us = <10000>;
 		channels = "s0", "s1";
 	};
 
 	adc6mux: adc6mux {
 		compatible = "io-channel-mux";
-		io-channels = <&adc0 6>;
+		io-channels = <&adc_i2c_0 6>;
 		#io-channel-cells = <1>;
 		io-channel-names = "parent";
 		mux-controls = <&gpioI5mux>;
+		settle-time-us = <10000>;
 		channels = "s0", "s1";
 	};
 
 	adc7mux: adc7mux {
 		compatible = "io-channel-mux";
-		io-channels = <&adc0 7>;
+		io-channels = <&adc_i2c_0 7>;
 		#io-channel-cells = <1>;
 		io-channel-names = "parent";
 		mux-controls = <&gpioI5mux>;
+		settle-time-us = <10000>;
 		channels = "s0", "s1";
 	};
 
 	adc8mux: adc8mux {
 		compatible = "io-channel-mux";
-		io-channels = <&adc1 0>;
+		io-channels = <&adc_i2c_0 8>;
 		#io-channel-cells = <1>;
 		io-channel-names = "parent";
 		mux-controls = <&gpioI5mux>;
+		settle-time-us = <10000>;
 		channels = "s0", "s1";
 	};
 
 	adc9mux: adc9mux {
 		compatible = "io-channel-mux";
-		io-channels = <&adc1 1>;
+		io-channels = <&adc_i2c_0 9>;
 		#io-channel-cells = <1>;
 		io-channel-names = "parent";
 		mux-controls = <&gpioI5mux>;
+		settle-time-us = <10000>;
 		channels = "s0", "s1";
 	};
 
 	adc10mux: adc10mux {
 		compatible = "io-channel-mux";
-		io-channels = <&adc1 2>;
+		io-channels = <&adc_i2c_0 10>;
 		#io-channel-cells = <1>;
 		io-channel-names = "parent";
 		mux-controls = <&gpioI5mux>;
+		settle-time-us = <10000>;
 		channels = "s0", "s1";
 	};
 
 	adc11mux: adc11mux {
 		compatible = "io-channel-mux";
-		io-channels = <&adc1 3>;
+		io-channels = <&adc_i2c_0 11>;
 		#io-channel-cells = <1>;
 		io-channel-names = "parent";
 		mux-controls = <&gpioI5mux>;
+		settle-time-us = <10000>;
 		channels = "s0", "s1";
 	};
 
 	adc12mux: adc12mux {
 		compatible = "io-channel-mux";
-		io-channels = <&adc1 4>;
+		io-channels = <&adc_i2c_0 12>;
 		#io-channel-cells = <1>;
 		io-channel-names = "parent";
 		mux-controls = <&gpioI5mux>;
+		settle-time-us = <10000>;
 		channels = "s0", "s1";
 	};
 
 	adc13mux: adc13mux {
 		compatible = "io-channel-mux";
-		io-channels = <&adc1 5>;
+		io-channels = <&adc_i2c_0 13>;
 		#io-channel-cells = <1>;
 		io-channel-names = "parent";
 		mux-controls = <&gpioI5mux>;
+		settle-time-us = <10000>;
 		channels = "s0", "s1";
 	};
 
 	adc14mux: adc14mux {
 		compatible = "io-channel-mux";
-		io-channels = <&adc1 6>;
+		io-channels = <&adc_i2c_0 14>;
 		#io-channel-cells = <1>;
 		io-channel-names = "parent";
 		mux-controls = <&gpioI5mux>;
+		settle-time-us = <10000>;
 		channels = "s0", "s1";
 	};
 
 	adc15mux: adc15mux {
 		compatible = "io-channel-mux";
-		io-channels = <&adc1 7>;
+		io-channels = <&adc_i2c_0 15>;
 		#io-channel-cells = <1>;
 		io-channel-names = "parent";
 		mux-controls = <&gpioI5mux>;
+		settle-time-us = <10000>;
 		channels = "s0", "s1";
 	};
 
 	iio-hwmon {
 		compatible = "iio-hwmon";
-		io-channels = <&adc0mux 0>, <&adc0mux 1>,
-			<&adc1mux 0>, <&adc1mux 1>,
-			<&adc2mux 0>, <&adc2mux 1>,
-			<&adc3mux 0>, <&adc3mux 1>,
-			<&adc4mux 0>, <&adc4mux 1>,
-			<&adc5mux 0>, <&adc5mux 1>,
-			<&adc6mux 0>, <&adc6mux 1>,
-			<&adc7mux 0>, <&adc7mux 1>,
-			<&adc8mux 0>, <&adc8mux 1>,
-			<&adc9mux 0>, <&adc9mux 1>,
-			<&adc10mux 0>, <&adc10mux 1>,
-			<&adc11mux 0>, <&adc11mux 1>,
-			<&adc12mux 0>, <&adc12mux 1>,
-			<&adc13mux 0>, <&adc13mux 1>,
-			<&adc14mux 0>, <&adc14mux 1>,
-			<&adc15mux 0>, <&adc15mux 1>,
-			<&adc_i2c 0>, <&adc_i2c 1>,
-			<&adc_i2c 2>, <&adc_i2c 3>,
-			<&adc_i2c 4>, <&adc_i2c 5>,
-			<&adc_i2c 6>, <&adc_i2c 7>,
-			<&adc_i2c 8>, <&adc_i2c 9>,
-			<&adc_i2c 10>, <&adc_i2c 11>,
-			<&adc_i2c 12>, <&adc_i2c 13>,
-			<&adc_i2c 14>, <&adc_i2c 15>;
+		io-channels =	<&adc0mux 0>, <&adc0mux 1>,
+				<&adc1mux 0>, <&adc1mux 1>,
+				<&adc2mux 0>, <&adc2mux 1>,
+				<&adc3mux 0>, <&adc3mux 1>,
+				<&adc4mux 0>, <&adc4mux 1>,
+				<&adc5mux 0>, <&adc5mux 1>,
+				<&adc6mux 0>, <&adc6mux 1>,
+				<&adc7mux 0>, <&adc7mux 1>,
+				<&adc8mux 0>, <&adc8mux 1>,
+				<&adc9mux 0>, <&adc9mux 1>,
+				<&adc10mux 0>, <&adc10mux 1>,
+				<&adc11mux 0>, <&adc11mux 1>,
+				<&adc12mux 0>, <&adc12mux 1>,
+				<&adc13mux 0>, <&adc13mux 1>,
+				<&adc14mux 0>, <&adc14mux 1>,
+				<&adc15mux 0>, <&adc15mux 1>,
+				<&adc_i2c_1 0>, <&adc_i2c_1 1>,
+				<&adc_i2c_1 2>, <&adc_i2c_1 3>,
+				<&adc_i2c_1 4>, <&adc_i2c_1 5>,
+				<&adc_i2c_1 6>, <&adc_i2c_1 7>,
+				<&adc_i2c_1 8>, <&adc_i2c_1 9>,
+				<&adc_i2c_1 10>, <&adc_i2c_1 11>,
+				<&adc_i2c_1 12>, <&adc_i2c_1 13>,
+				<&adc_i2c_1 14>, <&adc_i2c_1 15>,
+				<&adc0 0>, <&adc0 1>,
+				<&adc0 2>;
 	};
 };
 
@@ -353,7 +371,14 @@
 &i2c4 {
 	status = "okay";
 
-	adc_i2c: adc@16 {
+	adc_i2c_0: adc@14 {
+		compatible = "lltc,ltc2497";
+		reg = <0x14>;
+		vref-supply = <&voltage_mon_reg>;
+		#io-channel-cells = <1>;
+	 };
+
+	adc_i2c_1: adc@16 {
 		compatible = "lltc,ltc2497";
 		reg = <0x16>;
 		vref-supply = <&voltage_mon_reg>;
-- 
2.17.1

