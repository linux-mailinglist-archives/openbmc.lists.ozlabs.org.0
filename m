Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFBB4CB68E
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 06:45:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8Khg026Jz30JX
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 16:45:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=OIp2BqfN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:febc::713;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=OIp2BqfN; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on0713.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::713])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8KgP3D4Sz2yQH
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2022 16:44:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2yjLg4scvSGI+9e5QYLa2G0RF8hyM3D09cy2q/6sxkLkVIOBYqp4JpnXWmcFC3/9KXulDbytIJmHCSvtG42dj/VaquUHY3vL8iJhtON3T0dlMGHqTctu5nqrFDet3MSzvmuo1HdIwq7btYm9fJANDBWhCL3KDUjRKqSql6DUgLMtMu+mTmc1H/usczmtRKYY+1/FeZm38e/5aYDjyCiOqr4RskoCvA/Yx/cxwXJDa96x77kSAQ9DSJPBxpfzYqvezP9V/FOtTK8GVs3m1sCd1yrg1uSfM72rQ0VvUHqiLIA5Bppo0D86LVI/3iqFBbyo9X9gTKLrBwYYPVII+8pog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xp/OTIs6e+lq8jiPAfPJPe45bO9st3FKn4tdsET8gCY=;
 b=Bdyf6xJS4EdXngP6F7DhSSZ81q1MeB0K8Utg5yPLYHiMfkYzbPH6JZqzJwqZ1pW8GxIkMtaBQUxuc2LyCB7fpaLB1VFSqHyOqvXwbnW2g4Qj7N76Yr5dV7hFpt9k0xVs/LkxWmxA+nvy37hswLzoCZKRkVhCVsaRozBjG5N49/JwIB87cuX9EEpOiR8agfA3+DiCzecDLZDJC3vX3kDz1bgGb6EkWagXKYZMCwGDtkg9T5GrLiFi1/Wr77vNa2n1mLctDLNcJJBx28SBkbimDB09iludX6aaznfhOS/I8iNepmH1Urf5PnsSYcoio9vqL58kfbLptYJ/0QkmU59AZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xp/OTIs6e+lq8jiPAfPJPe45bO9st3FKn4tdsET8gCY=;
 b=OIp2BqfNHUyEPVGt74ynbtubOyXi7XgQg/t6wyp3ILAHGUlQum6xTddWOyQvaaSMRUH7LrCxcaT9whtVbr4jinaYOtoiHkl3y+TzBoXCZasMDyqe9X8SbhfGtYt0wzIC7kiyBTd2WY89r3M6or4P7eyzzfvrQPCgZR6FOFJcz9U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by SI2PR04MB4505.apcprd04.prod.outlook.com (2603:1096:4:120::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 05:44:10 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::b57e:962a:3820:eab]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::b57e:962a:3820:eab%3]) with mapi id 15.20.5017.027; Thu, 3 Mar 2022
 05:44:10 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 1/2] hwmon: (adm1275) Allow setting sample
 averaging
Date: Thu,  3 Mar 2022 13:43:55 +0800
Message-Id: <20220303054356.14369-2-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220303054356.14369-1-potin.lai@quantatw.com>
References: <20220303054356.14369-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0147.apcprd02.prod.outlook.com
 (2603:1096:202:16::31) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55dc73bd-3105-4e88-8c8b-08d9fcd8d6c1
X-MS-TrafficTypeDiagnostic: SI2PR04MB4505:EE_
X-Microsoft-Antispam-PRVS: <SI2PR04MB4505CE11FCB62BE1C4AFC0078E049@SI2PR04MB4505.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e1d53aljoS8mPxrAxKdRb3z98HZeHHoQvz/1Cs6i4t/4v8CvpOPTfyGLOI6/44Bg49HR1z8Zi09qULKRl6R3LT3hwddxteFVRdPWPeQd5Yyfa1KUlSjwo+QyxJ/arBvpBh5nWr/4Skax9rSl/X/lUZ/nlVl/xgdx5jIh3+xuDH23i+RHdpfoYB3Qwr+H6NfG/UwQNVK19c2v4ToaLoaYbXp6y+vr5h0Z5bbNRivgxIdUXsiz1XyfkFV3R4t3Y0td7qu1dvg8pliCbNufiKQQ3NC81HsnWRlscpcBBdCW9x+R/aEHPKMptmErUNjN9+87R1TEM9fPQiMYq1cznaLpMY702s2gjFVFjJkvRbNUdpD00WR/rlWrQgr9bkLAibsHBaPX7lsFBFCY6UbbQczVhX4Uyk9iQ2CeQUDhkiqJ3MrkDKBHA/shezElC1NFqLE3KorQQihtGb62Gf/TLpBOO2Sli023uDW3NHeeuEE3XriZLCeJTdhDSqRUNz/k9rUgfAULbHBT6/hkS7w9N8s4pqU4J8UkkQY3VYnQ13yl5HwDZwLzwkd+05bXaXVuCPuNBwtN25iaVr6Fexmx+v05+nDU44oaaJdZaQuxLScbriQKP2Z6CEEmglbDM5YPsXuzThcAc18K8cQvV1sjNrWQJoqvZ6RtlsSxiAw+NjVvf4lRIEgKEYJdqsnQUvYuchWlRcuWY9R20FlpINY4Z2AgijkMfhsY23weDH/Fi3AdgjwvxehfeB6dIP2YiPfPF4uMmn6FX8PU1YjQKQT158ychLHWdWdChoLqHscrdhdhGtA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(316002)(6486002)(6506007)(1076003)(6666004)(966005)(83380400001)(6512007)(508600001)(52116002)(2616005)(44832011)(8936002)(5660300002)(2906002)(66556008)(66946007)(66476007)(26005)(38100700002)(38350700002)(186003)(36756003)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uOMgMOoglCj8iucw/V4hEiDstDn2jcbg9A/0h4IWKj+OsaBVdETAvSoDgmxS?=
 =?us-ascii?Q?lE7TB/MDvVz+NCweKBur6fgwCMXln0pz2rCBanXrk67Xr8Gsf5qwgfB4UwW3?=
 =?us-ascii?Q?5cussFXAN7Xz8pse6oDUXzo+XofYWQ9PLGNY/ksxQx67NK9iGTOlnQT3HDa5?=
 =?us-ascii?Q?r6E5t1FJsRLbZ52N/B/Rj0e/vO/SRBx923/oGm9rEQ+65PtcTfm+LhChfkI4?=
 =?us-ascii?Q?HPMIYVpVNFVWfMiwybrheKinx2a5GdvjPUMRVlOt9A6doP7ZTQQT5lUtEUvL?=
 =?us-ascii?Q?iq+/AKqAHIRs1etj5/fH2A5kCSDDFlvQCqugRPTLLcmWo20nwTnOrt3EOqRB?=
 =?us-ascii?Q?IoFerbWCyJpSbj9HC44hFLfoDJS8TsYeRpncSXzMGGZ9r5nX1XurmTcL7rS2?=
 =?us-ascii?Q?QsjmIEsH50m89/g/iuNLSIpbREmt3quVXKpiDqOMliLxBHnZrApzcL5UVubA?=
 =?us-ascii?Q?szJR8KN2lPnvZr9VcDyt6SUVKVPMXVh+0ggBaIWHkzvSomN25WAtC4bwLtY6?=
 =?us-ascii?Q?Hr4ayV0aXqJ0QKam/ZSaj6+S5Gb01EYAiVoJsy0/tiUax3LtGpf3H0hudsJo?=
 =?us-ascii?Q?KTSl4vLCFVlghdQ/O2C2Yx8zbc1jrtIL6HIWe5qEctsNouGLRJcdKuUJNOv6?=
 =?us-ascii?Q?KUEMQ0wWUS8tywiwJbo5i8dJfABxXQJCm5MYscPifXzV/u+Ws2oR8P2DsWDi?=
 =?us-ascii?Q?ssS9TAdeYInLvzsW1k2srj7jsTezX1WiBVnwvzilQmglN7B407MvBD1WXJxV?=
 =?us-ascii?Q?yiz/aHQBfEgFZcJ26EWtyCQ0KInAaY+MRxYC+S5e5q2tz0aFFHGS+b4w78mg?=
 =?us-ascii?Q?DMH0uQ0c0BUnaG8M4rWhlBSVS9AFvjFvhy7IRbPFVNzEDP0OVdK0t80K0Ufq?=
 =?us-ascii?Q?1IBR1xZUQ5WwHJ2RjC7hRKBbBBX3C4Ekn94c2Y5ftETGjP7Rqg9Dc5gykTmk?=
 =?us-ascii?Q?71tGI3GuH8isslve7yKf760LVdUkc0B146YQjmEL12sgSqWgDezIL1XYyNZr?=
 =?us-ascii?Q?81O30N7Rjw/SKIQUNiIAma3XHBs1rzIRZjvvHvY3DsnNvYwJ0kDonNiPKVOO?=
 =?us-ascii?Q?ukMazY/kDZhgKb1mO1VyQHA6KXD90w1R4+Dh8v17gQM/cuXXvvy9tIarWHg9?=
 =?us-ascii?Q?/p80QiKcCJfuEe9fB+TwwYCc2jGgCAMRU1IKFCfaprau9xD6ROdU3c8icDKW?=
 =?us-ascii?Q?Z98y5JjdZWh6JneLzW89XqKJD2ywJym00I4vQgu0+pmXXgrJwtuqHfl0YTDp?=
 =?us-ascii?Q?Hdl5m0tXOhsJB1L0pA6e6qQU5l/mwviw1ICMyIEn3XxLen3APEktYdM9eN3p?=
 =?us-ascii?Q?vTiJK/oQ5+8z/UxESE5o+67YvwZ2CFT1jOHjtLeSNRh9ABIRffIEfKlkdSHR?=
 =?us-ascii?Q?ZgBSVgp+X3uV4yS8XMZnF8ZRVxfLdiul1LHkgCmau9qWht5hU7GF6mkFJrV5?=
 =?us-ascii?Q?NkAIPFWsPcbYmpS6Q10lVCAj83u1vLGxxryT4iSx1mBvkGLID8IeZbV8ATDT?=
 =?us-ascii?Q?zBX/sq+YH7IS9soVfYct88cvsJE6tUQwYeUnTIpbKFvL9w2/ky5tx7oRv2NM?=
 =?us-ascii?Q?jPA1PRzUpYA8HJhtgrPxg8Ox4ffNDWsoIAX+T266c/aIi5+dj2urfijEwFG+?=
 =?us-ascii?Q?KNy3vqQX/xRHAYSyA++i6/c=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55dc73bd-3105-4e88-8c8b-08d9fcd8d6c1
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 05:44:09.7342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LKABTfc/Awhfkmh5yds6hbGLuJdAcDEj0tbY/d6YvxFZ6Gqc0mJxCNQvNae5F0+JHA7RPfJej90x++O7mKWrvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR04MB4505
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

