Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F1C7B9A90
	for <lists+openbmc@lfdr.de>; Thu,  5 Oct 2023 06:00:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=OWqtLMkh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1Hrw3y1gz3vZh
	for <lists+openbmc@lfdr.de>; Thu,  5 Oct 2023 15:00:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=OWqtLMkh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe59::712; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20712.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::712])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1HmR3j3Hz3cB1;
	Thu,  5 Oct 2023 14:56:23 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PmEEYbVrBB07E1gsXJYsMz/7eBKO6puT7/1d8YfpUkMlvyIiFbXrCGYN9tCkZQ6LAnC26zDdE3iOHOkmJKiT/BsyT0tZPafFboAs3mqB5m5CErYgw2RgYvOoTK1BH4uoA/IRR7h07WdBz9cFCOHE/bDfLoeFMKgwDhjz+zSSS1gqMl7BJqqUsaRbzt5XS2nBIFoRpdzoTjLwo2pJT8gi8oEh1Z4wxD/6QOeCxphTmfUCwHJQjZjrA7D+dSfcr3NIdNnt+0N3aqb0hF2cDej3AtgXpGpp16ePJfNiaw6G0ytDYockW908EPeNSokRlhaKAvqObH9UjSl/ZA4cEfEkvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQlkll1XHdS/lfjSn/s2lwfzg+GRMLhdRpTCZobU+h8=;
 b=RiErNRnOwdMzgfsrg7L9WmXFl3ff2ZSzfm1ImDQsvO/vprL6D1V21V8zr2Qv6oLRn2oIVHnu9vzb9oALdVIIBJ6GzmQcQXszP7x39kY3UJs0rLh0C2MMmPheW+XYdEPavYcN+yuWWnqT9v/joTcm3KKx8y0Q7q88DasozbegCUyz0yZA+VX3EvTqkQLr+ZzIBPofheM9Cx52xUtcZMSt0LQ0ZnSr/wHgGdcDGxM1sBm89YooPaRU9JdfOErduSWH9IKjI7VqVGZFktW2o9X9v5ZF2yuNrAZ9g/eI5TYKR3bLoCC1l0GYyyC0DDe2rTFq897/E07zlNdMmXBIAIJz5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQlkll1XHdS/lfjSn/s2lwfzg+GRMLhdRpTCZobU+h8=;
 b=OWqtLMkhkfP7n1OetKOP/K0fLMHbg33C2EoNDvHvwsXVCvfM8DCZkn78rX8ZdzqQXPLgqgji6AMYULM6jWeodgdgQOzZJD0DoyzlPALc2hwolcOnvFYAbrnOM/BtzOhLEDLXO8mikldKemVqgeuZU/wYK34J45rAfFySJrX+ajc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from DS0PR01MB8010.prod.exchangelabs.com (2603:10b6:8:151::19) by
 BL1PR01MB7649.prod.exchangelabs.com (2603:10b6:208:394::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.25; Thu, 5 Oct 2023 03:56:20 +0000
Received: from DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::6a3d:61d7:133b:9eb9]) by DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::6a3d:61d7:133b:9eb9%4]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 03:56:20 +0000
From: Chanh Nguyen <chanh@os.amperecomputing.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] ARM: dts: aspeed: mtjade: Add the gpio-hog
Date: Thu,  5 Oct 2023 10:55:21 +0700
Message-Id: <20231005035525.19036-4-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231005035525.19036-1-chanh@os.amperecomputing.com>
References: <20231005035525.19036-1-chanh@os.amperecomputing.com>
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::28)
 To DS0PR01MB8010.prod.exchangelabs.com (2603:10b6:8:151::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR01MB8010:EE_|BL1PR01MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 63210672-c8ff-482c-c0b3-08dbc5570891
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	66gsp6hGaWWGSN0vqjQg/WnCjoJ460EwwTsCr2aV4Hk1vuJ4fpxKNh8sUNw8UFlck9CXN6NX9LHASiM4NZQlVsdBcvytzOk25kayRBiuu6jbqluiLNFvU5GqwRzTTrsStXnBuprbDRdzzwVo6QWTyPaFSsfaDOh7P85uUAx/6T8eQNnuut25i9aGkDJxpXSuREh/QjvK78cpJDKtlDWVpD+bmYKbsCKImAJ8EDEsDQyDdYBNzvUcZWHqL98r+NKc+ftdL9H0nR9KT8WQ43CW8qtI0Uu1I4ZPZRMWveH6nX8NZ3l0Tje9JFzXPadh6LpfpZFe0+EvzC5+vTWxiFh77BOixjcW1Jou6IZcmWEAMt7IiVNBiPNWUkZ8ku8YIwMJOy41xax1dJEIMMFjBfCjlFX3toypXBFPxe1x9TwGY3LnKtvFM1wI74x35lrp/QMcxxgHvXK8xr3GT9iEQltDEh4XOEJBpfpiHoFKV0Cyl0Ksst+fJ/bM2vUEdApaoQ4XmnhrQApBg71MWwnLpVYVtiXuPD5heOUYbYNP14S7IrbCtmKW1I8VSLbtI2H5wpPsHcRzHgIlW05uaJnPWkihRUQjbpJdF4bLO7nneReBaLhiCzuKAVrJJBLEsfC9NILe1EBh926yvtilSFY0m7zq5g==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR01MB8010.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39850400004)(396003)(346002)(366004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(38350700002)(38100700002)(478600001)(83380400001)(6512007)(921005)(6486002)(6506007)(52116002)(7416002)(86362001)(8676002)(4326008)(8936002)(5660300002)(26005)(316002)(41300700001)(66946007)(66556008)(66476007)(2906002)(4744005)(110136005)(1076003)(107886003)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?AnZHZ+3KOf4dUqKkGuT+wkK26fc1bC+OOCYyYtapu7jhg6Uz4ii5Ha/15j/W?=
 =?us-ascii?Q?I9Lb3t1L3drdRc6t31PzwWT0e09Qp/2bdhSlNp04+1DW1/oDOiTWTfLySWPf?=
 =?us-ascii?Q?tShGq0HFf6tUhTiDN9zzY0J2FaBR77UDZ88ac1lueFmCXQdlGUAIwrFDlhHN?=
 =?us-ascii?Q?fdA7vLJBC3l8aN/5yh42V/YpEUJgSmYA69f6ta5Pk9YA0uyCtXezmqr5jaIE?=
 =?us-ascii?Q?9U+VAM9pORU1g3ugyxqJVw9T2acrooEx76kvEod7e114BZORB9cY1UgWHPOb?=
 =?us-ascii?Q?JrtjE+pe12/gtQnuZKwj9+kCBHZoXUkqbjDnOyaIla6WN4qgBL8USO/mnibR?=
 =?us-ascii?Q?e3imm4VLvayyzdOKLCXO6xkktBISRWfTyzVK93R/Y69UU1EtkdpIE/dctRmk?=
 =?us-ascii?Q?M4cFYWj7eLaw58miF/CDEI0zL+5Gp+5nPxe2BGBvDBQyvttdw4a1hy9T2fAo?=
 =?us-ascii?Q?mfU6UHX6F6dFN6gnY8l13AbHZlOIyMOKindX/hD8rdPeXL2fOUL7r78g3pVt?=
 =?us-ascii?Q?hsfJzarcqnHbnYix1N3ZCGLeKjv66ixabuZwa8RhDAhIoXmsVGonNaa5UpiT?=
 =?us-ascii?Q?i305e1TJvvJc6xHAlCbCuJNbRJp8QFuzmBfRdJFG99hTb690ym7GidtxMk7s?=
 =?us-ascii?Q?7wF4uf1HfLzf9dqlD+E+tirEdkbwlaiYC4BkWbVyZlAhPcRK8OKwKG2LmsZ0?=
 =?us-ascii?Q?fmvB+lURu6Al7CwChoFAMCGWuPjjTI8HyjEsREtw8ow5+rFyGw4uisTW0rGG?=
 =?us-ascii?Q?CvPG2X2vRnAlIDvjkA5jI0pj6+du/N1GCCV2FcTj+lFjPuHwGa7ZiOrvXHPv?=
 =?us-ascii?Q?nOA8AolAdYXUb52sEyY31E//7GCrhk9DT1s1UVt2mroxnB/AVtvnbcC/fMrg?=
 =?us-ascii?Q?UIEaO5Wrnl+2hM/uQDtVpqr0ze7oCUcEIECMVft5cQFeovlU7TdWxmHU5lxm?=
 =?us-ascii?Q?hGviPaYQXtUyH1Xt4MxIHfqYNho1zuyk1Bml+oCEbiHZ8jy2s7+JKN2QlM72?=
 =?us-ascii?Q?+AS8Q5yNA/aq4CIYXUpiJ6PVrfyQdFun3Ap8CM7Td0FadGnQfKq7tpyKxOlm?=
 =?us-ascii?Q?/nKCYRNEak8Mrj3Qf7lSYQyCvZbTKBJ+LRG4Z+lG7EZUbaE7UnwmSsqkqZvH?=
 =?us-ascii?Q?9+mazZknGfZBlZpyekbjHjytRlJhN9iD1Xo0GrAb1YwOk1RUy9HQpQnY1vK5?=
 =?us-ascii?Q?hZqB1cyl1Vu5wwNplQLcbLAE1AKSUnOdhipc/GCSNqcTxX8en0adNKfyV0Fx?=
 =?us-ascii?Q?Iww1bMtHljo0G4WS2UQoX/rDOYBocCz98c5W6AhDgcKEqPA7UC59ozAQQ5L5?=
 =?us-ascii?Q?8rmz4/q/DI9RcvoIoGPzCgfYbubqWvzC/s0juYlmPBBrSNciKbC1aopCOmnp?=
 =?us-ascii?Q?IMFyawo+HMybreKBpCq5DaEMDxTmzXHmkUUDX7aOXDLapjXvxuHBLqqMpHk8?=
 =?us-ascii?Q?lX2mWbbJcSFkJgFCSR/4aYf/61zaIQz+DcProif5ADGWoHouEvikIjkwm/OE?=
 =?us-ascii?Q?qk1VCgt/ElVgK7pV+xDOhKjUwZRdI4oOKmoWDgKKb5cSKN66CjW68A72NZgy?=
 =?us-ascii?Q?LRXCv3Tz3Yd2+ZG/aXLG+XWE97toVEH6NbfABbTj9pVh2OaA3r68GPOndg6I?=
 =?us-ascii?Q?uXeBccS35q4RZPLIY1w8USo=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63210672-c8ff-482c-c0b3-08dbc5570891
X-MS-Exchange-CrossTenant-AuthSource: DS0PR01MB8010.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 03:56:20.2896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ih9D3Rj4yUBpoG0jym5G+V8WoCbBkB85+R3ddkKZpClbHyGuZBNPODf+lqHfdvSe6SkuoviFz+xN9ATlcg34HjB7rWB8fT57LSHyBsQTvM35/3+/CsaqfwdqB8fDvfyK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR01MB7649
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

Add the GPIOR5 as a gpio-hog with output high so that can
power the OCP card once the BMC booting.

Add the GPIOAC5 as a gpio-hog with output high to notice
the BMC state.

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
 .../boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts
index c87be433bdd0..8ab5f301f926 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts
@@ -805,4 +805,18 @@
 		output-high;
 		line-name = "i2c4-o-en";
 	};
+
+	ocp-aux-pwren-hog {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(R, 3) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "ocp-aux-pwren";
+	};
+
+	bmc-ready {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(AC, 5) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "bmc-ready";
+	};
 };
-- 
2.17.1

