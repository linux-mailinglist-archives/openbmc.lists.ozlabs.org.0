Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4967367B2
	for <lists+openbmc@lfdr.de>; Tue, 20 Jun 2023 11:28:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=dNmI2UtR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlhBX0PJvz30h5
	for <lists+openbmc@lfdr.de>; Tue, 20 Jun 2023 19:28:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=dNmI2UtR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e89::711; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20711.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::711])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qlh8l2Y5Pz30dn;
	Tue, 20 Jun 2023 19:26:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDlo8jNED5sibNxU3sgJ3ZK+4DDRTwTjz2To8+IieEWgN4JwZ1NVIVtqcpyJloMY4A0+pYbTHRkrbpfyzL0Ae7DIProe2Ip0PC8VFSlM8ZugpHthgwBZExXs/oFJ0RPZVmAcL9skUAGk0OzLWrn0BLB00ePJOsXBajr1hwzEoyzRdB9JW4H4fj05eijHmy2Pr7a18aojKlHzfK7WGzUKAhXVp8IRcIyj170iGznMbLqHZSnUF3R6MwYDADIxtJylLEPxmYuTfF7k6XyH7Wh0Zr6nt8In6D53PHh5AaJiJMDANeH81iUcC+oqSlCz+Y2rOLPxG4ARP7+U0l5GWnColg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKfaAcl4q3UFkYb1UDNyKx50AjvCFmrQZ/JC97/xY3U=;
 b=eOXTZXpeKnSnWXm/znELfSnX8Seg1Gs5t1/0zVAan83FRWGyAawsxwSirLunbiR2KIftogY2J2dCEuslIlom3Hi/uCXs7ZDlDieaBNfsuNg4XYlO3PkQM4w6M7+ArtrwsolXTfYIlF4LUT3bR7l7kn4OInhJBTOKyEVs3EDR+q3zxyWMXZr9Zw9G/iS5u+m8s+kAMZI8rIzozQRYNEU8qHtDaGpRfAADQFdBnmCk/+3F9AFp5aMTG59AlDOYel2C7fY1xQV2ZFFZ3rymQLrpmlEdFMuSb8GduYW7TocJPsFG6i/NNblSs13CfZkFw088cyOi0EZowJ9VLPeFMYS8UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bKfaAcl4q3UFkYb1UDNyKx50AjvCFmrQZ/JC97/xY3U=;
 b=dNmI2UtR8sEXKiJ9lmnrX2DFqOKGv5HohGavLCPoyNGO7MISQnKXXb7ZuiXDPZvcllqjV5DAydVJOTuEPaY0oHEHtSFv3HcBJjid8oqJT0w7NVGv/qHlvbzUI+Kog7EImO68OXyz9nCRyUz79IdDp/KUjsB3xXR00EsnMQ85ITs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from DS0PR01MB8010.prod.exchangelabs.com (2603:10b6:8:151::19) by
 IA0PR01MB8237.prod.exchangelabs.com (2603:10b6:208:48d::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.35; Tue, 20 Jun 2023 09:26:11 +0000
Received: from DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::e439:70c2:7d19:45e]) by DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::e439:70c2:7d19:45e%6]) with mapi id 15.20.6521.020; Tue, 20 Jun 2023
 09:26:11 +0000
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
Subject: [PATCH v3 1/3] ARM: dts: aspeed: mtmitchell: Enable the BMC UART8 and UART9
Date: Tue, 20 Jun 2023 16:25:35 +0700
Message-Id: <20230620092537.20007-2-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230620092537.20007-1-chanh@os.amperecomputing.com>
References: <20230620092537.20007-1-chanh@os.amperecomputing.com>
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:195::11) To DS0PR01MB8010.prod.exchangelabs.com
 (2603:10b6:8:151::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR01MB8010:EE_|IA0PR01MB8237:EE_
X-MS-Office365-Filtering-Correlation-Id: 32063807-f278-4a91-492a-08db7170629e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	n+ww1PX54hrbzNClutuNk6YwiVwti3YFNdx2p2ztDAW28DmNtnikWOEcsRAPciJuYU/fFVY+4LM05L94cCVjoECYYaKjOMWPayokkSo5M9ZBpAP4ZjKDY4lnImYN7hIfVVw/1UKXDmhmk4iRto4goHF4pm3CGM1GyVOB8OBAEYa1SzGgxBWnIhOFG1sYNgx4F3fFbSlnflvcVlDcqvIdtCJBOqEMhJ/AK2DCtkRi2KB5OfS3j9ps5ONhp27dxs5+DYvDn32ahmy1wEt/uuGaVJYtWNRgiG3JUjI+eSbu/i3bXPbOMiDa0K5oV7TTUeroacnhSZlSQ+b/KDSAym5w3GAdaVwhySQHDg0g8tpeOlLG9/P+JWK0TB6id9W6nHhNx9dKzF/tqg25fCzgr5QHKTIgln6KwQjcJ1+BUHZDuQulOAfQTyAC3BtW260JduxGwFopa+Bw9cxZJAvktQbUfLczywSwJpvQ7QsfGtdqcsOXCNFZGsXFuOP0KllWQ5RjvGEDmIMyFoS5rAm6V7qsDAn3u0CNpkQyQ/n5m8br4JS4vR7At5ugdL5WujQM+/J5lQvMqtYneht+HISg9vU3wDyMFmQi6iyeS0bsc1cA42l1WFq97d+dCPB9y0OJcHpF
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR01MB8010.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199021)(6666004)(6486002)(478600001)(107886003)(1076003)(6506007)(52116002)(5660300002)(86362001)(4744005)(2906002)(110136005)(8676002)(41300700001)(8936002)(66476007)(66556008)(66946007)(316002)(2616005)(38100700002)(38350700002)(4326008)(26005)(6512007)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?P5QiEwR9Js7EFtjRGU3rdNSRTm/EfHrMn/ndQCVPVPe2BDGNnAElZpUiAI3H?=
 =?us-ascii?Q?xKpc9gGPiBdVxu+eaIv4lMYjimZmTN7IIMmdRGp2KjQCK88meGf7LetBmY3l?=
 =?us-ascii?Q?l5rGuNas9tZlpyzmzhIm3BVKgMVM/fGfNgcKMeJSpUvwWQD6WMojwVmDDeLu?=
 =?us-ascii?Q?BTiCV/cjhgM0fYz92UoRwpp8t+MA3lCub6xB/rm1yVC9V+hsRGLCpp562t5F?=
 =?us-ascii?Q?mTj6CjiQ9MA2d/BWWBl3H7TlV4ewttjMwfayytCppK7puYtpNXrw4sx5qM/9?=
 =?us-ascii?Q?Dj8E/yc0jxUZkbIdKxneD7Pm7V8jQkJbinSxbzjF28aw5SQr8FzVwePiKXKj?=
 =?us-ascii?Q?EhnCPIUuBtP55hP1n0jaSGJm4XgI2rj2ZiQ8QsUElJa2COu+ZUl9DkY6sLDN?=
 =?us-ascii?Q?g44ud2yalAE8HEKwPh1sBwKhlySH9LkcdcjFiFA+tixtMCKQIq6XJhkgEK/u?=
 =?us-ascii?Q?yx1hgQnEavFVaHopdnkgKvSSA+zr3ls5QGqwV7ndmpNm+6wH8gQNjGUuvLS6?=
 =?us-ascii?Q?104J0nRM/+j/ClWk6Y5dovTYFIDaac1rl9s0kBcWFJDoLlNHarpiZtuUOT1y?=
 =?us-ascii?Q?2K9QStTTjdAy8+lLmJrDae1/xsy4NYxDNOk/dqi8Pq+vZOpkwBrOcVlCehfZ?=
 =?us-ascii?Q?9+ZT5luYmrJsdjQUSBPjTh9uGzIRVsf+OZX6bgLUFL1d/cnVlxroDLOUS5+v?=
 =?us-ascii?Q?pt8VDv2t4oTsVGnv50lgOlg1rC7TLQguN0TzE1K9E+UezJTN8bwPoSra3Ld/?=
 =?us-ascii?Q?i+ASvuLeO4KsPDj2KMCTuHd93ge59abTEwoqdgiBBYQHdkQRQ80WTtxBS+ql?=
 =?us-ascii?Q?H94ppChXCx2DBy5oZTCszfxlBUIob6V2zXaOYe1/beAehJRXZqEcnv5kbDrG?=
 =?us-ascii?Q?6ya9Kn8qqxDFO+53FKnIgE1eIIN7at1cjo3JGZXHxbRjA540zcsYo54iK6aQ?=
 =?us-ascii?Q?xTis626iRGtqBhUh7k6dtpSdL0elbHwSzA5u+O/jv+HsDGX+557GoPYE2w4e?=
 =?us-ascii?Q?GxFPV1wT4pRK0mBzTw5eQbt1xhURpEqt3PG1y/Xrs2WzyZo6zE73ZMm+Ci4F?=
 =?us-ascii?Q?nXuXRC4Az72hduzRgVEL6nfleBc14gKHaDw8rwvdhWni+12IuUEBOTQQ3Ly0?=
 =?us-ascii?Q?iDHzvvvoLaFgc/rmUrJ6H1orIzAUIOBN21atT08F+OPsYb2dEZk8jtIeUNUa?=
 =?us-ascii?Q?84SIMnUj/Z8ydtWdpVjE8t6Uvl2eXUkymO4Of5AXcZBFSY49PS5VT/oAg2sL?=
 =?us-ascii?Q?aY7xHq4yNKKn82RngOsQFNQ999hCKIqZZPXEVwgwDTId5itQKCSbqSPHadf0?=
 =?us-ascii?Q?dY2Y3Yl+RQ67CHs+b3RTxOUSH4tJJnSj0VY06EiME4Gk5ANK+pJUy+YGvNDx?=
 =?us-ascii?Q?KJ94dW/SvupM9hl2LsTkiTVKaQotkA2xWLWOf7zNCCIsFCr1iUar7PKyiCbb?=
 =?us-ascii?Q?BbCkZuqZTOB5SEdHtV2FHs9fVFMAGifT0J720uWKlwTTzcxnj7GV6oC2m7aw?=
 =?us-ascii?Q?0UavFzLL4I+BJctEQsPL99o0NlRbOIvCRpx8LmnmJZl68d5P/W03Imfo50Tx?=
 =?us-ascii?Q?akHVx0A03IdhzGDedtINzjuPiQsAHrSR/9fLuMwcEsG8DG+fBkbTwJHdjFhL?=
 =?us-ascii?Q?Xlm8roNCL3PnYqOr+As9bG0=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32063807-f278-4a91-492a-08db7170629e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR01MB8010.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 09:26:11.1188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N0oin7SUiodjVsbNNozkPTiPYjwGWWw6uBdfny7VDAOEmwgXDFbnonNJYcwkHiHtalbrbX4pfMG6Wixq5lZshbtN9Yek0wAfaRnQrhRw9vcosamh4OxkWtFdc4OeSVd4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR01MB8237
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

The BMC UART8 and UART9 were connected to the Secpro and Mpro console
of socket S1 on the Mt.Mitchell system.

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
Changes in v3:
  - None
Changes in v2:
  - None
---
 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
index 1e0e88465254..e79f56208b89 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
@@ -9,6 +9,10 @@
 / {
 	model = "Ampere Mt.Mitchell BMC";
 	compatible = "ampere,mtmitchell-bmc", "aspeed,ast2600";
+	aliases {
+		serial7 = &uart8;
+		serial8 = &uart9;
+	};
 
 	chosen {
 		stdout-path = &uart5;
@@ -307,6 +311,14 @@
 	status = "okay";
 };
 
+&uart8 {
+	status = "okay";
+};
+
+&uart9 {
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 
-- 
2.17.1

