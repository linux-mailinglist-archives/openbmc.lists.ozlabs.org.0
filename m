Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 680205E9B71
	for <lists+openbmc@lfdr.de>; Mon, 26 Sep 2022 10:01:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbZvx0TzGz3cjP
	for <lists+openbmc@lfdr.de>; Mon, 26 Sep 2022 18:01:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=QCAtxJbi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.244.104; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=QCAtxJbi;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2104.outbound.protection.outlook.com [40.107.244.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbZsk11mFz3cBV;
	Mon, 26 Sep 2022 17:59:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=avI0ADVugepXj0VNtwaUC2qyuWJLucu4nVPacMWKBB0ERVzehFLZ4rbGXmz6Wj7PwJgaBdPBw4l4zuT9sbcN29m23T06/VqA5crOv0Uv7oi4jMoJNiZo3BKr8UH8S298fq4ErtbPXfcO1sH8nklppfhT5Em5WipLcRxEPCQrxS2pGu5cTE0LtF6P5FEsAnRF7WXbaRU5nay6ZRR7GzB9FDcf5xfnE07XxedAt1ZPHbMSubt6eW7ILZTKoH2HU6JMyA622IqI7pPYeofINhOfEy+0SdMMMvt0/BEUocqRzjLBahf6XIs13Y/0FbrCs7bL8O4m6rdp/85IIXhsZQswIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCwbIKbOejDnWd7eDKdVJq0kU7dX1fn953qF3fHzOG0=;
 b=QENCdsgKLA7d6fp6uDiSU+l6NO60mBtrASgBQGFxybR0HZu+TRC4afH0Zon9QemDHbOIShR8U7+3lAo33UkW8HB8/uf4117Om7ghy2UDOwwArd+bSbzuBtDf+CsWgc98RyRiQP3feSzw1gTVWsjSqJLBprqaV6ppFpmVBSyZ7Me0ULUccKZzm9X2Q8IMBWW063iMnhSPRYyCl5kKOMjJsra+N+x39CRzWtBROmuftgLFnbcFmEPD2urqtZMKeM6oNhwNkQsG/2cUDsniLKfnZoi9E1Ucpc6IVPJ9WBUG2P3ms0FEP0Kioja7ONrw0QOTLXWbP+4TrSxR+X4DdjEZyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCwbIKbOejDnWd7eDKdVJq0kU7dX1fn953qF3fHzOG0=;
 b=QCAtxJbiDHJENTTJlScVIvem48ysB0iNNmqVccdHCs3vaq0wdrqIHF+ZiGDeiKjDE7n9/L6IRPT1+fLxZ5b/Y12PWF3KsAkUXuVZo/T06pz+ub8Mmg4KZjdVr20TwI/h6bZZIYRDw52qYeHGRWZ5CpPqXuvtKqVYNoVLwD+GYQU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BL0PR01MB5235.prod.exchangelabs.com (2603:10b6:208:31::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.20; Mon, 26 Sep 2022 07:59:21 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0%3]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 07:59:21 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: openbmc@lists.ozlabs.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH v3 RESEND 1/2] dt-bindings: arm: aspeed: document Ampere Mt.Mitchell BMC compatibles
Date: Mon, 26 Sep 2022 14:58:47 +0700
Message-Id: <20220926075848.206918-2-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220926075848.206918-1-quan@os.amperecomputing.com>
References: <20220926075848.206918-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::29)
 To SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7282:EE_|BL0PR01MB5235:EE_
X-MS-Office365-Filtering-Correlation-Id: 71d730fd-5d48-49e9-0365-08da9f9504d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Q9ZCwohCGT+4r3CpHUMgkPA9K1i9WkOK9Bt0rXc87b2inpZC1BjERCUEmxbhYC2aKtEbU07q3NmDLlm2feQ9bF6mYt2QytjKPxh7WYyvsv8/lX/n4M2D5CaloDkt8UYE85B4cVShiROpYFtVBFBciw4oNDfW0FBN8HIla5Rb1pqY498YqljD+IqDO4FdpIVHpdi8etD5mt0/S02DfkWyirnVAbOt50HAQ3qyL1vmhtKxjTyFxCG+pqxx75SSfobR/vgRtV9Zx/KVrU6NIU0revv3tebBDDTXJCm4JGJ7aGD/w8LvlL54Uq5GIonrdZn/WVeD10WZ30jikvrUPOGRwOhdgqCmVT14iI32dUGd4n0iNgv2Jmw8R8BukhktpD6grcTG9Zbski9NC6Czq2jx9+RZKjcoWEES2vJxcX/ECRX5NlQK96ZlylnRJTD3QQhbeUwDNlVvoNNyte3fklQPo0E+3legwyu4tt4UaGJaI+LfEIgcDm5dgEw6pj0oxETOfRzXdt2CYp3C4uTZ2eA2GDZwC0Dc0cT9UkupGi7BdY8bgmJW6OZP4DbrDy+0w8u+ABDdVJmLTmqOSLRdsN8xCwNH860kuLm1CsQnSRDMvSRoHjWgmKL6fg/xGxxl48e0pR3DjvUKxBFIVVLiA1xHVMPipitQ6ype91yc2GWKI4wroj5QuBWphnOchIG4TZ/SqAgBjKdoUQaLzdcObjGIjXGLpZ4FJEg+eKKBL3PkrbEbZYaCgeq6oZ3J6SE8QROk6TBBc+bhHpFDjzu8topHinOtybLCQOwUIqYIPYLAShs=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39840400004)(376002)(396003)(366004)(136003)(451199015)(7416002)(4744005)(26005)(6512007)(5660300002)(6506007)(8936002)(52116002)(41300700001)(6666004)(38350700002)(83380400001)(2616005)(1076003)(186003)(2906002)(921005)(54906003)(110136005)(38100700002)(86362001)(4326008)(66946007)(8676002)(6486002)(316002)(66556008)(478600001)(66476007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?kiGcou/qEgLN8cnofePbmBfQJ/VIkW+XVbkneQ7OVjD8BbrQIPk541HofOdA?=
 =?us-ascii?Q?ylP3pR9Z81v6m9E8zhawzOJZeGzn3M495cHB+FreqE3/rMnA+YMk3km3zJD4?=
 =?us-ascii?Q?RNzh3PqgpnNQzzCUb3o6iQq1BHqXjo6rEUEpOnxsqEOTs7iShw7yj8XtJiXo?=
 =?us-ascii?Q?qKGqTG3wCdp5Uc4bYr3FVJ+HU8Ajz2eoCbuGgWLJm2Y+5ai1ftByug3ei5iT?=
 =?us-ascii?Q?4WETtO9xO7uvNNljlrKclh7hGM9V1Bke3oslj4YNwZ2vBrgyi/VkADEOWeak?=
 =?us-ascii?Q?8tAojNmOs22W0mIxPWk4f+cB4EXiiYuP/hP0NbvYluDVZ/TSZbhgC62iBK5o?=
 =?us-ascii?Q?K5ZCiIY0TUEMHLEgqqvBjSXmWpwSvpkMfvydHTEgZLie0BkQPAQ89AFFNN/e?=
 =?us-ascii?Q?JcPPl6riEBUeWrkI/vdkldCUPZVd4MXPnZ/xdxWMYjOiMRsp9UVIvMt4hGiC?=
 =?us-ascii?Q?9w7mzjzHbEWORdpaeIYku9sbDRMhJRbepHMzLN/QJ8BYb03OWXz+7+emiNeQ?=
 =?us-ascii?Q?ZTYQ/1GZ2aH0ctnC1NOSVfrEbIBwWCH2FU2B23eFeEGAjjT8zm7UZggPhbPh?=
 =?us-ascii?Q?SPGVrwGD4qP/toliZRaLVuG4iC0Gv0MfLl5giBx5zjyw8CIFdrRDJwMyNjq+?=
 =?us-ascii?Q?Qo+38/+LONm8EtKwdMQJQ/ZykBUjOr/OOq8LXHPGu319nbCwvrRidJ7kGKxP?=
 =?us-ascii?Q?jVuWDN02QGtifV8eXC9BW6gIWgVhm+IanJboKkmPBl+h6ATj5uF0vtaAdzma?=
 =?us-ascii?Q?RguwYLyqFRGm/XjkbF+Brg8P2XaD8JXMkk5QALJ0ca8WfTsMTTvWqJcizQdX?=
 =?us-ascii?Q?rzbOoyVFayrii98I+o1hc7RHi1b1ieLlE570rAcNMxyATpHzfvja13E7uzFk?=
 =?us-ascii?Q?f2/nkaZDmIAdUmjA5lz6IOKeJGLzlIEzPGGp+Lx0Ao85bc5kYgfeToSSrM1P?=
 =?us-ascii?Q?vyiio/46iVw/vjggAuGqMalqOjdonNfyINHvClJJ6CC1sfUJRptC9rDKcEXi?=
 =?us-ascii?Q?8nD9+Dzv7rb993WAQBA9FfKWt7eTjAnaZ8pgLCLEgq98ZG9r2rbPVhWED4oq?=
 =?us-ascii?Q?OGuIeBIVOGo2dVgG97ZxR3TLRAKkjHAMApR+9+/+/RtdT+w6LkvJssYM7pQh?=
 =?us-ascii?Q?GmFHyB5D3XAEriQLw45avLet9bb9YQW1cdQWLgwdgRa3vtUMrF5XMTdOaUgy?=
 =?us-ascii?Q?QksiLdyidE9rLNnFs8EObdVV3LsqKZNk6R+jNMJlW7NFTWM6Q5MCrubYPiYc?=
 =?us-ascii?Q?lrMy6JjRh1EGK7o0GBuo7KoR1nAXuL1B/CgnWiCCKmmeQ8Xf3OmTFx4oqcuA?=
 =?us-ascii?Q?QhhuGa1CDIgi5k5umMJBeSxzeq3ZgS0Zvxr3TKzYmt6Y40CSgfUK6btErAZ9?=
 =?us-ascii?Q?1h8yFUPjhcRY2cxYHTqzLB9Z3KxRMlYFZgpIVpunPmxvoFfvpmFwi0l3hDLx?=
 =?us-ascii?Q?iF9iEDCUPZFwt56glyhbLUDREtviRpdRuiVl2jeUt9QFcmuW7xtj6D1ty0ec?=
 =?us-ascii?Q?lRc0vuy79Tk5RD15Qx6RLpoSKfMoY05/awpIeYOzUYr8PI4uizyIKyVPOKaJ?=
 =?us-ascii?Q?5ioTOCQRo4530L//HvBjJdyogRMW4x6/2awNiTvdg8KdQJCrtcUvl9L6QdaQ?=
 =?us-ascii?Q?01JqCYcwhns1ygYSbpd/9pU=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71d730fd-5d48-49e9-0365-08da9f9504d0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 07:59:21.0081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MKHp1V7nnhICTTw/ZM9IJTfr2vgZIipcTauOUts0ydZGzblAqB1n78R0/uT2p+gTcUF2offo7k4EPkxUPG/FNsKB5bcHGBePmdPGAXxwugA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB5235
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, thang@os.amperecomputing.com, Quan Nguyen <quan@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Document Ampere Mt.Mitchell BMC board compatible.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v3:
  + Fixed the alphabetical order                              [Krzysztof]

v2:
  + Introduce in v2 to add Ampere Mt. Mitchell BMC compatible [Krzysztof]

 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 1895ce9de461..59811e4a084c 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -69,6 +69,7 @@ properties:
       - description: AST2600 based boards
         items:
           - enum:
+              - ampere,mtmitchell-bmc
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
               - facebook,bletchley-bmc
-- 
2.35.1

