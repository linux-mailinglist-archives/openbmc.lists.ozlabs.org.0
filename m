Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1CD3888BC
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 09:53:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlQ8n5yNXz3bnS
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 17:53:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=AXy/CmkE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.100.122;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=AXy/CmkE; 
 dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2122.outbound.protection.outlook.com [40.107.100.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlQ5p0xFmz2xvc;
 Wed, 19 May 2021 17:50:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FPhr7e3zmtVVcw6QJXZiMftQUWOCry1TuCeqXL4QkheTlqpB4nehIAiSdxsE/3wNvUSco4W7T5I67ZPMpIq8N5C4KfkzdkVuyFvnlp9TPGiBvvc2xjEKk6Z0gtk6wuwnNJ7C6qCJzgX0C4PGBVBM8SMgTAzfMEymExMJ2gGGJT/TXL5olGE88bMHvWRN4RWzJvNGcSUkVSENwEvvA35o/YsnzpnrV15/D9hsJ2AublELT7BGhC/aIrSra8XOYWx8o5vu4YBNWmQBzk7LJy6cXnTBtvtSYQlgXF2AjuxDN+XhStzdbyheDRtW9RaPBY3KhOVkFZUwCvhDchtM7uRuyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PqBAtez2bYEYPVr1UA+6yYTcfsTkQ8Jef38beg1HuNw=;
 b=OszkteslzvFbttq7oXJLoKUFrAWBbB9IQtT4aRuLplZ2NUE9y1OnoMtac6rgRytMp4Kx7MGSHng+TCEzRUHaN0nfFguGm9M6Y60Xvq1uRwi9q+St1ZxodOPsSw1Kkd48ic9VhquP4RmrTRVcek1IZYpnvct+TGp4x4sHvqh7DKr0MWL6NWgtthl1sD5GseOspIBIBTP5QUOf+f+ok8Am8fRZIDs6QwjDWX0AD1aghq7Y5YoRkaTH9gfFVmNZ5nP/liaqqsnJbfkf6cL7F/XedxRZNg6k6fZSZeUTyZ0uOSYBSPRohxJqQLkaUq7/qJlib/yLKYw7sVtXPWzoC4+6bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PqBAtez2bYEYPVr1UA+6yYTcfsTkQ8Jef38beg1HuNw=;
 b=AXy/CmkEHESFFrRqk7UHuNZydzz+6M90JEu6uNHLauF/+fboFqePZoyK//rA2pkmJ8gBblqVXy7bSpB0xcaYoVHQHoEOAEqvwMcynuZT8QHgS5MVaaC6J9dzaToz9j79sCZRXGjh+Z4tUSg/aaKIuejhKa8BKXPRO2B5zPV4/8c=
Authentication-Results: acm.org; dkim=none (message not signed)
 header.d=none;acm.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 CO1PR01MB6743.prod.exchangelabs.com (2603:10b6:303:d5::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.26; Wed, 19 May 2021 07:50:37 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 07:50:37 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Wolfram Sang <wsa@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: [PATCH v3 5/7] i2c: aspeed: Add aspeed_set_slave_busy()
Date: Wed, 19 May 2021 14:49:32 +0700
Message-Id: <20210519074934.20712-6-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210519074934.20712-1-quan@os.amperecomputing.com>
References: <20210519074934.20712-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK2PR04CA0081.apcprd04.prod.outlook.com
 (2603:1096:202:15::25) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HK2PR04CA0081.apcprd04.prod.outlook.com (2603:1096:202:15::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 07:50:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f34fae3-c945-4d1c-e4f8-08d91a9aca06
X-MS-TrafficTypeDiagnostic: CO1PR01MB6743:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR01MB6743475DC8715299D202A201F22B9@CO1PR01MB6743.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 95jn109+m3nocENwElxyrjFodaRMaJicDBnx+WxHCrXfLGUeiSgxZxcNPgHlYRI2Zmw2NlSzhEzS20Ke+0gwF+PM50Dvru8fMVKl2diI+Eb41Pknhf10OVSFlJ3c+4S/K8wlxtnNbOv+80hh34ALoGJXU4ef/hS2w3EOO67Kb+PyWwCNxMSxhJoilNpk872cBIwI+RmEsKzGj9aqNu44nwpWvMJ3IiFmyEAQlPLRnwvL9DsBG+Z4G701Gt2HS3U678QpGMpNqo9FClYKAhubBUdIFXHpr2e8hAinEDJE+wfDAXFiSnh2OMpe/eWApeySGU6AqUSYns4E+UNDOIIg5PpOFAkH/mvcTc8yY/q54aSOFteNzj1L9hkION52U31iT5XhJmX8mgNjQvf1LCY0QaaKxDHDwO7RFEyf7B0051tkItdQUwPcfl+enRtuGhvQkpKDgFQc/pkHJtNf7gS6eM36KZ6LrRG+rwjHWq3n8nFbXvHel237JrX8yq3ueQgmjTizQ3/tcJb+Ls5fwhN9x3lDPK0xybhvv5Xh2xCJ97f+RkL4vRMC0wYlm8zx3GF0hazXYeqoAJaUkKbfh+0s5gm1vggFWKpNmHtYbcZ1AsUteQQze0jh64rtEr8CG90P7vqlMmbIHLkhScf/jIx0pxx4D/gJQcWpI++ItUINymo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39850400004)(376002)(136003)(346002)(396003)(478600001)(66946007)(66476007)(8676002)(8936002)(956004)(921005)(66556008)(52116002)(6506007)(2616005)(6512007)(5660300002)(86362001)(4326008)(38100700002)(1076003)(38350700002)(7416002)(316002)(83380400001)(186003)(2906002)(110136005)(54906003)(6486002)(16526019)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?wf/tLFUZ8IECaMNchEzq6ikeZPCoXVSce7cpTgRoTH1XX0sEjfmm68uXdXZ+?=
 =?us-ascii?Q?wQbQAn3lyefXZM0JNPZf92bcaG+xWUd8/J3LJf22GCy2HlmlkhQ0UD/nJ7Sh?=
 =?us-ascii?Q?7RsJBjud9cU+E+q87MHqu/uz4ihxBo16HNp00mafJYUf1bFG7sz947s/5D75?=
 =?us-ascii?Q?Mtqy5We5HY0UMV0KHSGKMR6zZgXkqcLgDdOsqPBNKQ9UEqzt3IThyW9gn6jv?=
 =?us-ascii?Q?hHfHF3vG1MLpIgWOKN5wcOKD6vVW6Mhxr7bSgQw6pGIENMQSjJIenN6/NNC3?=
 =?us-ascii?Q?MRk8X2t5quoH6i5zsggSrMPjNZWn8eCOaiKi1af/ftyBJnDC8eRQzNN1Vbca?=
 =?us-ascii?Q?bipICm8ordWPW9UTgD9Wac1h8PjyFOz4VRwGMdl/Xz1pdziK23Gh5opDAuDC?=
 =?us-ascii?Q?NFUdbg5/oOhcO1TLU+/iq9L0aITjAgLN+5mPTRzgbLBGigtgqxU6yOoYeHPh?=
 =?us-ascii?Q?TifejIcup8DTRwok9+HnDFcWSRj6U4zXoBvraAqXgKubBZvlRFYrJkGhJFPu?=
 =?us-ascii?Q?Ezl69MM9nEDmf3zmULm8Vbm1uRl/h6BAH5ZRTnzsmrdMtzQANLm3V15U6u2A?=
 =?us-ascii?Q?L1TF97kJKzjJzuyC/oyx4q3N9SmAoulRb40heQmCi5ZCFcXzlyNZMdJ/asrL?=
 =?us-ascii?Q?4v7zwqnH5tIElbxDrpY2se9H0y6xYD/BZ/UbWBbczch2yAJMWyge9jmtDuyp?=
 =?us-ascii?Q?gM15V/BY7tGfL0w7PrhiHxGoTkMxKWRDl0400s32bq3QfuoNEWboE+c9OT7Q?=
 =?us-ascii?Q?UI9ZyfslskUeAQhU3tM6sQwleFy2THIAhkDy2p7vK3hst9i2H4lAsrIylA8f?=
 =?us-ascii?Q?go7kTas9aV5yjfpamNpqT1GVWvTy3H6U+nEEKJ1Eb2JJmz+g+MCBbi5sxjet?=
 =?us-ascii?Q?E/5bocc9U+dUmQQ0+pmfOiofu4zSePO5hWqUor3mjQRSEfhDr3ZAUtrIUu9s?=
 =?us-ascii?Q?iAylBl0eueekLMpsHW2PZTSfNcAGZtl5Bblq/EF5G/78xtEtIi8Dw+HfheAI?=
 =?us-ascii?Q?bYgKkNje86rROOswDTKxUbDIvxYa/CG1rohrOI9OvEPQ5/OWKz4eBuczsWcX?=
 =?us-ascii?Q?YlvwUSGu1cDdIG6HTnYHhyonqQ9wdrgz1l4SKRXcHubK/nrgL6mUJlwMJ5c9?=
 =?us-ascii?Q?B7WHqBqDPdGQp4fQ2mCZxocD63hG/Rt01cfwVHXEeVDOdWPit6LGRTA0BSdi?=
 =?us-ascii?Q?YXMRFDdFIj8/XSEUXunEqUHYjcf2cJqH9J/9jD5erdx7ZzbiUDNTGg8iKIqF?=
 =?us-ascii?Q?rO3EhW+r7gVouUI20I5rJDZX9JR/oxEJdl/oxgCktmu5p4swoQzcgRg/lqh/?=
 =?us-ascii?Q?Fw4236bTgoE65Ve9K9vtaHv5?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f34fae3-c945-4d1c-e4f8-08d91a9aca06
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 07:50:36.9439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ls50jwrku7MN6VDAh2fBVqEr5u3Z0GVgx/IOzpQiv0IUP5IwjI6mmYyWv3//P7bjrnD/RpAknDDkCPOngNHJEtMkhX5oLsVV8k7wOliULsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR01MB6743
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
Cc: Open Source Submission <patches@amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Slave i2c device on AST2500 received a lot of slave irq while it is
busy processing the response. To handle this case, adds and exports
aspeed_set_slave_busy() for controller to temporary stop slave irq
while slave is handling the response, and re-enable them again when
the response is ready.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
v3:
  + First introduce in v3 [Quan]

 drivers/i2c/busses/i2c-aspeed.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index b2e9c8f0ddf7..9926d04831a2 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -944,6 +944,26 @@ static int aspeed_i2c_init(struct aspeed_i2c_bus *bus,
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+void aspeed_set_slave_busy(struct i2c_adapter *adap, bool busy)
+{
+	struct aspeed_i2c_bus *bus = i2c_get_adapdata(adap);
+	unsigned long current_mask, flags;
+
+	spin_lock_irqsave(&bus->lock, flags);
+
+	current_mask = readl(bus->base + ASPEED_I2C_INTR_CTRL_REG);
+	if (busy)
+		current_mask &= ~(ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_SLAVE_MATCH);
+	else
+		current_mask |= ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_SLAVE_MATCH;
+	writel(current_mask, bus->base + ASPEED_I2C_INTR_CTRL_REG);
+
+	spin_unlock_irqrestore(&bus->lock, flags);
+}
+EXPORT_SYMBOL_GPL(aspeed_set_slave_busy);
+#endif
+
 static int aspeed_i2c_reset(struct aspeed_i2c_bus *bus)
 {
 	struct platform_device *pdev = to_platform_device(bus->dev);
-- 
2.28.0

