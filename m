Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3F57DEB89
	for <lists+openbmc@lfdr.de>; Thu,  2 Nov 2023 04:41:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=QcidcmnM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLV6h2Yx6z3cRl
	for <lists+openbmc@lfdr.de>; Thu,  2 Nov 2023 14:41:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=QcidcmnM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::61b; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2061b.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::61b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLV405Bjqz3cBH
	for <openbmc@lists.ozlabs.org>; Thu,  2 Nov 2023 14:39:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f9SduXOSvYj9IcnaKFHoftxcJVSBdoFZPCBaC/Y7FMCGFFkqCmr4WQVaK1JUpm9d9E3Pun363Hr3mt4Zi9eVBRn6cZjtxT4tzA3oncQWOD9s2ZJvSJsVZbgDu/lZXYzFFS+eGAB1vNud9Y2WDQ1e2STg1d8+0/fFWjv4TQJTavLJIsjGsUV2jeAdrHAW7z4+l3uHTmKLV3lZC7oMYT/rQ30+5t7NXw9U5x1SwyauEeXBb2bj8GCCSpxD94Dj8ISCT0E993llgC68OkOKqHcq7lPK8hPaxbOA9y8DPEASZ6ZK+Y2Ty0mIQ6NRaYRAUHX4dsPai7I4fzmvt8K8jQPy+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RE0Cr8SKYUNobX4lN9yreYfkeYD53klnk59YxgpJZ+c=;
 b=Psvq/3Kx7r4ELAkvJou37crLfuh3eInAlmVoOOPI6pinMVFwjhli+TpH3Qo1YfOJJVevxBrwqzfsFbbJLTRiY62o5mMjNN+vMEbOklybrkJR89IGHoyWulkEJhhEF/g6Kp4KRZL6v/SNOFfP73sufDRZdC+v8z3ApmSgbklc9AFHu20ha2YtsYev5oJb1uCe78/aDvWjA+utdJTeiedf8pyfOpC41BrOsYmCPAGN5HovVEOsBZrImicVbRlkybNjUoioBYcT4mq/kViriYnFKCmxbhPxG9AHclr9DIwbv5GX8aIJrZqeZn6jhjOAtJe9eeppsu/r0TenQf9yULAmmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RE0Cr8SKYUNobX4lN9yreYfkeYD53klnk59YxgpJZ+c=;
 b=QcidcmnMDpj+gEjNK+UITkaFJ8dDskAZF/S6El3qFhIriZ/zGyKzH2DXKzPUQCs7qA4KWq1IS5rYaLPp9ss3g3aBeXNcd1FbSV0bHBQljfbbwtWQokPFAf/uub4+fCuetj2XL9HcXxJqBKl65Pck2gMDfDlk4bpOU/BDQUfQ/6EFjxvRiaIv2z3OnKqfGm6NwK6VawjUtuNZoA4WKQkz1EWCMi5ryPNjHcaAFt+5siZqzB0EwZOHXv0L2Ev35YQWXQ55mdzA+dOuWN6Cm3T7lWxqMpYJr/Dxwhy16X8DU21N/fpdO3/rY0Uix2GMJ2LUCY4EDsz/HSLWlAnJR3IxBQ==
Received: from PS2PR01CA0049.apcprd01.prod.exchangelabs.com
 (2603:1096:300:57::13) by TYSPR04MB7160.apcprd04.prod.outlook.com
 (2603:1096:400:472::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Thu, 2 Nov
 2023 03:39:05 +0000
Received: from HK2PEPF00006FB1.apcprd02.prod.outlook.com
 (2603:1096:300:57:cafe::67) by PS2PR01CA0049.outlook.office365.com
 (2603:1096:300:57::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Thu, 2 Nov 2023 03:39:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB1.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server id 15.20.6838.22 via Frontend Transport; Thu, 2 Nov 2023 03:39:03
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.5 v4 0/3] hwmon: max31790: support to config PWM as TACH
Date: Thu,  2 Nov 2023 11:38:59 +0800
Message-Id: <20231102033902.3884466-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB1:EE_|TYSPR04MB7160:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 98da041e-acfe-44c5-ab97-08dbdb554282
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ZmkoD2UrZBsOxwQje5zsSsDA5vK7xP/Odcpuhiut5NqdK7OvmadMh4oppuOAJWvvAZand9aFtjLCHskIE0A7r7/oYtzMd6xAf8Hz2RYOMPkCdGnVC1CGljYOmVx6ZBntK1ahwFB+CyXhKmjVh/hDE0ePbSIUaDOsW/DluvT4IW1akDH2nqbftU0WVhkLKLBzSiHwr59Gz2ozGxrxtK/t4baz4KVhhfSecPA27swWGuaf1Oq7Op1gIb2R1SP5A8ApZe78ZlR1e1iGmCDPHbKbuvQZYYvAp2MCpukxXVTKYPlnq1ecELc9qxtvLD0N8Nd5ZOP2gMvQdST+dm4bct9vq4Dz/xEYogQrB1xbnGgL8nz4E8CqDkUlyZoRInN+oZ3ZLopUZD2KvLNhxTlTL+Bh2xPNiUhJ90khbFNjDbprn3tl+LYpdpGxoLLVH4n4KGblBoNHbdHz3QgqEFEy6SVg9RgPqiF18e+wuW0jszkjHqckrMd029xfY7qTp804q5weBMPPziPkSjU9/juKd0GMardkaYgMM0SPwqBz572YNggr1EQX72sUxX7S+/UP5ywrBsiquENVkJAuFo/vPd1OGgfKqK7IjyJF2LhDjeBP4BUZAaNkKJSMJFRy8OIdTgnTzDQCta5WHvo5CC78btysXr+AJBtw5n/tOOWS1ySxZ2celDcXvf3ockEeyNueGGCE579KfCsugQXQRzIv3SAQAg==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199024)(64100799003)(1800799009)(186009)(82310400011)(36840700001)(46966006)(2906002)(70586007)(316002)(36736006)(4744005)(83380400001)(478600001)(4326008)(6486002)(8676002)(8936002)(5660300002)(70206006)(40480700001)(6666004)(6506007)(6512007)(41300700001)(107886003)(2616005)(956004)(1076003)(26005)(36860700001)(9316004)(336012)(82740400003)(86362001)(36756003)(81166007)(356005)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 03:39:03.6526
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98da041e-acfe-44c5-ab97-08dbdb554282
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB1.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB7160
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

Support to config PWM as TACH in MAX31790 driver.
Add binding document for MAX31790 driver.
Add fanN_enable for all fans

---
Changelog:
v4 - Add fanN_enable for all fans.
v3 - Use 'sensor-type' in 'channel' node to config pwm as tach.
   - Changed the status in MAINTAINERS to 'Maintained'.
v2 - Remove unnecessary parentheses.
   - Add more error handling.
   - Change the type of "pwm-as-tach" from u8 to u32 to match binding
     document.
   - Add dt-bindings for the MAXIM MAX31790.
v1 - Support to config PWM as TACH

Delphine CC Chiu (3):
  hwmon: max31790: support to config PWM as TACH
  dt-bindings: hwmon: add MAX31790
  hwmon: max31790: add fanN_enable for all fans

 .../bindings/hwmon/maxim,max31790.yaml        |  89 +++++++++++
 Documentation/hwmon/max31790.rst              |   2 +-
 MAINTAINERS                                   |   6 +
 drivers/hwmon/max31790.c                      | 140 ++++++++++++++----
 4 files changed, 210 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml

-- 
2.25.1

