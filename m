Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D009504E50
	for <lists+openbmc@lfdr.de>; Mon, 18 Apr 2022 11:20:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KhhGm3Wbmz3bWf
	for <lists+openbmc@lfdr.de>; Mon, 18 Apr 2022 19:20:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=uH6lcLtx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f403:704b::71f;
 helo=apc01-tyz-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=uH6lcLtx; 
 dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2071f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::71f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KhhFS6n2Cz2xSN
 for <openbmc@lists.ozlabs.org>; Mon, 18 Apr 2022 19:18:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LQWzVeRuW+4xPEgh3h2X6RBxMFFp1paOCk/4uO4Xp60GWOXS8+vdtXHEnZodiuMTrJjK/ac7/8UiLG5WbPq9qK8PntObY2xQtt2Sub3tA9YbyeXwop406HJKZmqs5GLNWRnWZ0VY7LLbsZ5iy6yfEyIAMI3TKXhjKO4MzCS76CcC7YZnXIJ6KmbRF/1WTIcFKbOaRwdpUqGX3Mb6kq5AHyAOdQAiOhb5gUwC79iEBJ/vfSABovDifS8GJ2JJjvSoj+PjuYqz1/dAtgXY/caDBfAafCrFgMk0q6AgMTi328s4NPtDXSTgj5kWWnF3Ux5rPjer8OQiBTsiKNwD++wQDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xp/OTIs6e+lq8jiPAfPJPe45bO9st3FKn4tdsET8gCY=;
 b=dn6C96CzRxNh1Ct6D3BB939pI1leURQFkdoj5h4LGJjSxVkjVigIpIfu5DTRT2lMxsBEoDPmERUS8AUp3Jvpqk2zUnADjET1BM4dp6C4/Uh5IfzpMSRDr2XmEMuiBc1lwctSgG0/ZM06g7uJCvAqU8vVYJJwwe9eE7D6SusuGqDAD+eVyfeYSqTd8AClzSGYZN0gg6pN/RMlpNA5py/aU++QIiUql+ljQ7B6D9Lhln+TiMjd+WC2SZSeGVK4ZR3uc9rThtcisa2DzhPmHzSk6XKf5Uc5b2//+bLJnO+dysvzwRkR5xQ9+G88d0n0iuqnl71QJ7TowlFfR5+3n2jNyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xp/OTIs6e+lq8jiPAfPJPe45bO9st3FKn4tdsET8gCY=;
 b=uH6lcLtxAp743plen4T8rmHyyklNOT6CY/WA1HdWkCX9t8LRuGiybdGmUTz8pMmnk0XfcEdfha/5Vfy7Y1ZKvWIZyEv4zyhRU5GE6bmRWueVklL4inGvXiWDmewXo0rpgDu3uOOtkD0CgjIF+8WeUaFOdDwlwx2vQ3IJAuFI4Zs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by PUZPR04MB5229.apcprd04.prod.outlook.com (2603:1096:301:bc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Mon, 18 Apr
 2022 09:18:25 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::1109:2541:660f:1489]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::1109:2541:660f:1489%6]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 09:18:25 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 RESEND 1/2] hwmon: (adm1275) Allow setting
 sample averaging
Date: Mon, 18 Apr 2022 17:17:27 +0800
Message-Id: <20220418091728.23051-2-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220418091728.23051-1-potin.lai@quantatw.com>
References: <20220418091728.23051-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0142.apcprd02.prod.outlook.com
 (2603:1096:202:16::26) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc3ad1d5-4c98-4f55-c2cc-08da211c63d8
X-MS-TrafficTypeDiagnostic: PUZPR04MB5229:EE_
X-Microsoft-Antispam-PRVS: <PUZPR04MB5229E74A0CD7E46CAA8AFB868EF39@PUZPR04MB5229.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hUjYIuz77QFFr45nT1fxqH8sfy8eoJ3PHXfXABtWw6Yr3DM4HZoDnX84sP6KBuViCrzFxcLg5k2p3msr9XRXQFNY1Tooswtu0CWHF4BxjnAEPF6CpIzF1uGkh8MAaT6HV6KFKbWxQdGGgN0eA58syJCCKCyRr6XReRSKckvUAtJQzig5uuRVzJv//SI+IFDLaWo+hK61exQ8ebv1c5qxeILAcObc387H3y2vQ4QEyF5LfjE/eJi82OAbNwSMPJD/ngtg/47Whqa6CnYCL+lek+MF9tw+qTrGgtfBeONNKZs8VYfgGt0nA+4Xv2PISHgww0x3PLr1l7thYjqEZ0fpQ41pdFxfzLTV9N8dfBKhGOdkasaCOAimPAvx8O/uc6fxkbAt6nh+MRldr0U/lyRqyFysou0qkmTtUJ1D9YjIG/yGmyisOFXY4rs/bYtLIMoaBS9sc5fCopSqHKaLEyOqaREpDhZqF46oB65AS5PHlZRgvOc0xSGZbQhdVA/xA2cCMKyUK4kmTzN5eb6Wfn8ugYDD1wYPcRTod1k7zrTFoHNPBrG9TQEIy7iGybyGOp1IM/ENLPX/tvgcFMrA+pc10jQoM2a7x+36C1TcN3wmp1ul/44BfgJHPmbVnzrLoNpVvAJicXPy4hVHvRCMki1iwGkKY5bQivIQLNUDlULonFTf9/DhBLtNq5eJMMuRtpghuWCoXzd4uppnyGGW+qn0NwhR7yWg8mlFURVo7AuV6g1vS5thE+Hx5PZh54HWHmHJSg1BseitXllEfTltIPCA2NIhicD9pBVr2rfvswkf4GQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(83380400001)(66946007)(66556008)(86362001)(966005)(66476007)(6512007)(6506007)(316002)(36756003)(2906002)(38100700002)(38350700002)(8676002)(6486002)(8936002)(44832011)(52116002)(508600001)(186003)(26005)(2616005)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZSGK4w5tLnn4SmIG+8/sVP/uEZXoCXbQ/4QsoDyjrnAVnGky/26Nz+ZOWUl6?=
 =?us-ascii?Q?RIQ9M6V7gGB/dKlkpwtvcX5NoSvuI2AVoFw2A5ovjKuF89yrf64HjW5kn7WO?=
 =?us-ascii?Q?0wT0ACOWUHJ9bENDR/zY58Nv9LoJ9wBRFVdSEiooVzix5wz6zPSjx8nT6XUh?=
 =?us-ascii?Q?am9szGSbvW5vmOvfUTspvXIe59U+cxoOCfeFLaksxOmGfXF3Q+nrRGunZvI8?=
 =?us-ascii?Q?wNcjIjWGdxKrLX0KuoxdRkCnKUboSC1hS9mF4IKcvcUX1BqPZ2NNrlhzMCQK?=
 =?us-ascii?Q?0EbGu8bp2meSG3c9U9SY4a5QjkLJZwW2nZP5atE3KTXeAW2kfhd4w4+yJs+f?=
 =?us-ascii?Q?57F2+pwQf+YMKUw+2nlEbxWFgj7ci8iRQEpCmtqQbvyo3ZpfjuymvgCJHWTD?=
 =?us-ascii?Q?tBXT68SmkskLdA9q584cG+w5V0VmnD8gPJGF2pNCmbHPia6RVjbekvKZcINm?=
 =?us-ascii?Q?+uprHDU07HrLF0mlU8D7pdMjI5/yZLTQjoIHn8r/pIeUKLTaM1JhidiZACym?=
 =?us-ascii?Q?PBJqd/R+2ExtHno4kQ2OwEV64UOrm1Lz5fXpxMCyz48tG+bBNpPsxUt0O3SZ?=
 =?us-ascii?Q?fMJ8eWQrNxVKjdFYGA6fnfkwhI3m/D5KTylS0Srsa6/zfqqlurX+pGNqQq4P?=
 =?us-ascii?Q?lar5hnv4DgR3DBDqO12UaMvhdhbPiRDDdtRH6NrpaKdcg8g+C6Yh7rqwkIKv?=
 =?us-ascii?Q?xtmTWnRssAUzmCy376/zo9PB7JSg0S0hIsRYir5dmbCINyhwS7dWP7HR1mQB?=
 =?us-ascii?Q?TKEBlpkUOpNsbAULwUxfX+ncurKc1vy7qaUsBRUXZYjMGu0STM42sVAxeL+v?=
 =?us-ascii?Q?AkUYV8+CW6vJ0Gn2wdCKC9gSOqMV8CCnfZNPVWrnP4sgIh1079KWlD4PonKn?=
 =?us-ascii?Q?sLehWFzLIA3w0UiYdTLHGVd9wD/oClYsnlOc9ZnQ96fbLNVbHDX94CGTZqve?=
 =?us-ascii?Q?Yw71dHbGOkFNJBthVwUETFFuV+BqZb2nyVOCE6C1o2MnmPdAcIiR5yph8lfa?=
 =?us-ascii?Q?PULBTcWR+tt80/VfsRcGBk9qFLk3a6uuJ4E+Z9L6JIDHZX2SKavE1zlE/Xi5?=
 =?us-ascii?Q?ocVQwvyHlo+PjPGc0rjE4F8i7a+s+J7U3BEJtP+Fd2bCP/2T0+xlqMxn57ut?=
 =?us-ascii?Q?kW81Gcoa4Gr7DLIpANtmKbw8oakpoWhyxcZ5txZ+0wP/Gf2SwNC/uDLveLkU?=
 =?us-ascii?Q?lEAOJnZzhMFycVPaachJKYN7DmKh8Q3CBgQYAJ7BBSnd5O0w99SYVcWxYrTu?=
 =?us-ascii?Q?7Kft+HuNQlmEvfAwBXeACMHIYewiTU9vl9Lyfoeb+NgogWgn6VTilqXCg0V5?=
 =?us-ascii?Q?SgHvSKxL00rgxwfohr6NLg1cnGR8vKaBpyobVh1yBe7b2u4Ra3DLSUB5X/7I?=
 =?us-ascii?Q?iCU6thVs6IIFAWwFYC8GWWQ5rfopPsWnwtLAIjkGdwiPcnpbydNKAv7WPBmm?=
 =?us-ascii?Q?+0MDsh+pvE6xGSZ8+jLcEPkdSZiHvjKMv14hnkRvOxRAa8YxKuvzPmqezNpo?=
 =?us-ascii?Q?qa5Rp5EkrvNPkA3vnByEa1Uzg2FhJOawMEHikt4RV8M/MvHIQoRAKSqpX1DK?=
 =?us-ascii?Q?5fnw81RHgwTg6OHKiD34syUMFgKNxBUKRWPGUudDTR0n9yP/sqgjiftrsA45?=
 =?us-ascii?Q?Zs4J6zkA4WA8yOzk86BfRT9r34aWhn01MZRMH7QZmhh1HaWoluBVTF62AYpp?=
 =?us-ascii?Q?B/WvtmugYAkZ0PC/b/ylEtw6yyf8mHpiqWuqFwzmV3GqT9ciEAnts8BXcqOt?=
 =?us-ascii?Q?tkr/s8je2AXnI4L5F60dLhH1qU8PCOQ=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc3ad1d5-4c98-4f55-c2cc-08da211c63d8
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 09:18:24.6016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZU0I20U1qjVbwaNIOmc+V5aALRM2HJeDNskNn4nyISup0Gs1VT4EXrATJHSQAOB7p5iUrBuV0PSnA3gbL+KflQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB5229
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

Current driver assume PWR_AVG and VI_AVG as 1 by default, and user needs
to set sample averaging via sysfs manually.

This patch parses the properties "adi,power-sample-average" and
"adi,volt-curr-sample-average" from device tree, and setting sample
averaging during probe. Input value must be one of value in the
list [1, 2, 4, 8, 16, 32, 64, 128].

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
Link: https://lore.kernel.org/r/20220302123817.27025-2-potin.lai@quantatw.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/adm1275.c | 40 ++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index d311e0557401..3b07bfb43e93 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -475,6 +475,7 @@ static int adm1275_probe(struct i2c_client *client)
 	int vindex = -1, voindex = -1, cindex = -1, pindex = -1;
 	int tindex = -1;
 	u32 shunt;
+	u32 avg;
 
 	if (!i2c_check_functionality(client->adapter,
 				     I2C_FUNC_SMBUS_READ_BYTE_DATA
@@ -687,7 +688,7 @@ static int adm1275_probe(struct i2c_client *client)
 		if ((config & (ADM1278_VOUT_EN | ADM1278_TEMP1_EN)) !=
 		    (ADM1278_VOUT_EN | ADM1278_TEMP1_EN)) {
 			config |= ADM1278_VOUT_EN | ADM1278_TEMP1_EN;
-			ret = i2c_smbus_write_byte_data(client,
+			ret = i2c_smbus_write_word_data(client,
 							ADM1275_PMON_CONFIG,
 							config);
 			if (ret < 0) {
@@ -756,6 +757,43 @@ static int adm1275_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
+	if (data->have_power_sampling &&
+	    of_property_read_u32(client->dev.of_node,
+				 "adi,power-sample-average", &avg) == 0) {
+		if (!avg || avg > ADM1275_SAMPLES_AVG_MAX ||
+		    BIT(__fls(avg)) != avg) {
+			dev_err(&client->dev,
+				"Invalid number of power samples");
+			return -EINVAL;
+		}
+		ret = adm1275_write_pmon_config(data, client, true,
+						ilog2(avg));
+		if (ret < 0) {
+			dev_err(&client->dev,
+				"Setting power sample averaging failed with error %d",
+				ret);
+			return ret;
+		}
+	}
+
+	if (of_property_read_u32(client->dev.of_node,
+				"adi,volt-curr-sample-average", &avg) == 0) {
+		if (!avg || avg > ADM1275_SAMPLES_AVG_MAX ||
+		    BIT(__fls(avg)) != avg) {
+			dev_err(&client->dev,
+				"Invalid number of voltage/current samples");
+			return -EINVAL;
+		}
+		ret = adm1275_write_pmon_config(data, client, false,
+						ilog2(avg));
+		if (ret < 0) {
+			dev_err(&client->dev,
+				"Setting voltage and current sample averaging failed with error %d",
+				ret);
+			return ret;
+		}
+	}
+
 	if (voindex < 0)
 		voindex = vindex;
 	if (vindex >= 0) {
-- 
2.17.1

