Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C6C7A933A
	for <lists+openbmc@lfdr.de>; Thu, 21 Sep 2023 11:43:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=TvNZsaTI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rrr7t3vkgz3cC2
	for <lists+openbmc@lfdr.de>; Thu, 21 Sep 2023 19:43:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=TvNZsaTI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::60c; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2060c.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::60c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rrr7F254rz2ys9
	for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2023 19:43:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O8VxszgygwqeBW6QZTXJ87k4whIPdhZ7p1H5ddeBB1G0OFhBM76CzWE4F5WuMS0f0CCnPDFI43DsI2IP/naN98p85eS8hWDMryd6KzrHUZmYlmJPjTnIUuPSPa5qTAN3DKe40zA/Rl31zJ5z6O1+p/lJTDdCe5scjsHDQVs25fCjdDOQ0ZUorIlQdF09NMvzWkGWkcShr316LzU3T9owQtUDgvHk9ngEb2zLsYgsy7vFE9kjxjdn9eVJDW3FN1/J6/GBkRGdwRTs51R2v5Ss1mYg+8wBBtedH8S9uRYiTyBsf5+Ey8j+oymz2lN5uCtbyHc7JqKQZihZDSaMR8Knfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OsfFq71kX56BNbnvVaivUf4sRYgUXxL9psyw4/9XOmo=;
 b=DMl/1PzPZcik1VjN/NNlfy6SRugx2cNITvLnF2U5+Sich3P1VyltWdpPtXfLKZE0bmAwkQmhW6ofB8TEzpTE7a9VyS+r3Pqb4xLNUmdYhv8Y3bZnIEbsJCF6it2FN7Lv20rbWY/AA0rcSJo8cI2YxgsoQWFYpvUW/rIo68wWurDX6KKb1JwNIH5S+alVfd2aHLmBNuff7jYOPbkThNtPCrQCv4Eg3Yt1BvA/M1OQdroAzuC/LBtaSDs1/z03J3O6r5LbLXlIdj/emPyYnha3yTIxG+Fgr9fjkTErIxewd3OVAvEGe6C0N+HorMWuAU6OWUYigrQi7Vg4NbVeGWqlEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OsfFq71kX56BNbnvVaivUf4sRYgUXxL9psyw4/9XOmo=;
 b=TvNZsaTIYp5ICMstrksmimS6L0FymHo1LWeYDoUA8QrrGjv6yxsphTBRaGjMRO9W/FG/94CId7uv0eUb8pGEnuV8/919f+5Ru6R8CthO67gvGG2WGSqB7on1dwvrOiYRDz5e1avQmUqL1H1q1ETkNXRnIAqbgK1TEU6srTeAhlG/oAYWFDRLsn4AHDoa7lQybMyH9pTWYHEmR2ynQNUjkx+F+1wPLUEYIiir2MbBnt5vu+bAbxKWL9LQUmzWkZUDE9DzgcqpkcYkYrpehS1s7KHxFPfb98WEA6wmY/FCkHC9y5Z+ZJKUNPeVhZ77wjN1kBBdRcz8uaX5BC1GIjPueg==
Received: from SI2P153CA0015.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::21) by
 TY2PR04MB3984.apcprd04.prod.outlook.com (2603:1096:404:8002::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Thu, 21 Sep
 2023 09:43:00 +0000
Received: from HK3PEPF0000021C.apcprd03.prod.outlook.com
 (2603:1096:4:140:cafe::4) by SI2P153CA0015.outlook.office365.com
 (2603:1096:4:140::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.3 via Frontend
 Transport; Thu, 21 Sep 2023 09:43:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021C.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server id 15.20.6792.19 via Frontend Transport; Thu, 21 Sep 2023 09:43:00
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.1 v1 1/2] hwmon: max31790: support to config PWM as TACH
Date: Thu, 21 Sep 2023 17:42:52 +0800
Message-Id: <20230921094253.1309670-2-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230921094253.1309670-1-Delphine_CC_Chiu@wiwynn.com>
References: <20230921094253.1309670-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021C:EE_|TY2PR04MB3984:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f89aba15-150a-4303-6fdf-08dbba8724a5
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	oiEXqnrXgTtgERnYwewwRMOf+vJm5DuBmEBjCQSh+tP8IVUyC680mBY2oiF9siilYngUvyZiejREs5YGFUTmr/ppYbJveo5cE4DEzdzHYyuyqv0gQCll529GzSqtYfjC2XaQqbPV1UGwfwpIEV3vGkgagE5Z778/zQMqKhrh2zfnogD2M4oN4ULB1k4cHsysNwrmOH81BJp5oxD/URu91npX8FLH4CM6eYux5JXvTfahSDV+4Sj4ypudOo45fI9cNoynSwMb5xrRSSdSRZu/XT6WCSZd+fXa0C2Rswe5mSC92J0JZcDAPtrd4iUSzpA0ssNguzGIOmMBoPhlZqciVSI1xRxL5i9IIn/xEbR7yNsRM0tfXTAeatGK82pISIBiLynAAj5r3nQek76dnIt/BEvBl7VvxmFEb05ONnxlkWDmsg6aMoQ4iWnqPZ9+8srTe/LiGXlm6lqEpWHA2YuRpitPlhOO4YLNJw4jcoNx/AD87uCvoXZoVe5wsKgzmeAQOv5XhwyQr2XxBrGXoFraRZZEijGj+TXfLAcdN0LdF6jcsMVJb9Nfkw1Q8FuFzdEySXo9pivaraxuw9KPd/Xe/Pvw0X/Yqnj/a/855Tsw0iEB+sDMQ/nZkmG0dx8IPmFLDla/CMo+v6q3yCSF1H3FvIut/SJO2VziKxp3L5IHOkfCPOAGgTbNvUobFgYyIbKWOzZZ3S24CSwwYOmm+hGCpw==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(346002)(376002)(396003)(136003)(39850400004)(451199024)(82310400011)(186009)(1800799009)(46966006)(36840700001)(40480700001)(2906002)(70206006)(36736006)(70586007)(41300700001)(316002)(4326008)(5660300002)(8676002)(8936002)(336012)(9316004)(86362001)(36756003)(2616005)(47076005)(83380400001)(1076003)(956004)(36860700001)(26005)(107886003)(356005)(81166007)(478600001)(6666004)(6512007)(6506007)(6486002)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 09:43:00.0292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f89aba15-150a-4303-6fdf-08dbba8724a5
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021C.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB3984
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
Cc: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The PWM outputs of max31790 could be used as tachometer inputs by
setting the fan configuration register, but the driver doesn't support
to config the PWM outputs as tachometer inputs currently.

Add a function to get properties of the setting of max31790 to config
PWM outputs as tachometer inputs before initializing max31790.
For example: set `pwm-as-tach = <2 5>` in DTS for max31790 and
the driver will config PWMOUT2 and PWMOUT5 as TACH8 and TACH11.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 drivers/hwmon/max31790.c | 58 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
index 20bf5ffadefe..2a59415e6776 100644
--- a/drivers/hwmon/max31790.c
+++ b/drivers/hwmon/max31790.c
@@ -480,6 +480,60 @@ static const struct hwmon_chip_info max31790_chip_info = {
 	.info = max31790_info,
 };
 
+static int max31790_config_pwm_as_tach(struct device *dev,
+				       struct i2c_client *client)
+{
+	struct device_node *np = dev->of_node;
+	int i, ret, size, channel;
+	u32 pwm_index[NR_CHANNEL] = { 0 };
+	u8 fan_config;
+
+	size = of_property_count_u32_elems(np, "pwm-as-tach");
+
+	if (size > 0 && size <= NR_CHANNEL) {
+		ret = of_property_read_u32_array(np, "pwm-as-tach", pwm_index,
+						 size);
+		if (ret) {
+			dev_err(dev,
+				"Property 'pwm-as-tach' cannot be read.\n");
+			return ret;
+		}
+
+		for (i = 0; i < size; i++) {
+			if (pwm_index[i] == 0 || pwm_index[i] > NR_CHANNEL) {
+				dev_err(dev, "Not support to config PWM %x.\n",
+					pwm_index[i]);
+				return -EOPNOTSUPP;
+			}
+
+			channel = pwm_index[i] - 1;
+			ret = i2c_smbus_read_byte_data(
+				client, MAX31790_REG_FAN_CONFIG(channel));
+			if (ret < 0) {
+				dev_err(dev,
+					"Read fan config for channel %d failed.\n",
+					channel);
+				return ret;
+			}
+			fan_config = ret;
+			fan_config |= (MAX31790_FAN_CFG_CTRL_MON |
+				       MAX31790_FAN_CFG_TACH_INPUT);
+
+			ret = i2c_smbus_write_byte_data(
+				client, MAX31790_REG_FAN_CONFIG(channel),
+				fan_config);
+			if (ret < 0) {
+				dev_err(dev,
+					"Write fan config for channel %d failed.\n",
+					channel);
+				return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+
 static int max31790_init_client(struct i2c_client *client,
 				struct max31790_data *data)
 {
@@ -521,6 +575,10 @@ static int max31790_probe(struct i2c_client *client)
 	data->client = client;
 	mutex_init(&data->update_lock);
 
+	err = max31790_config_pwm_as_tach(dev, client);
+	if (err)
+		dev_crit(dev, "Config PWM as TACH failed.\n");
+
 	/*
 	 * Initialize the max31790 chip
 	 */
-- 
2.25.1

