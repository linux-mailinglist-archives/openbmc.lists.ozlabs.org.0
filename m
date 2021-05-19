Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F62D3888B3
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 09:51:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlQ6c6tvlz306s
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 17:51:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=qUGj5Hg0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.93.111;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=qUGj5Hg0; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2111.outbound.protection.outlook.com [40.107.93.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlQ5j5Gpfz2xvc;
 Wed, 19 May 2021 17:50:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0J8gUImQqdj84aKv32CUgxa0dRV6Mrzd/s1hOlxERbRrIlnUAxMidYcP5KUyW4S+/xJWPs+1sd4J5ckcfz5c7/aOX8pgU9dWvz8tLqtnORRhmozXCCnu9qg8OGMNUjHjrUfzjFfA7c0KYfL3om2tTGWXXg3ui4WO/eO8hJozH3BGfIgpnlsZjKTp3Cz77yzcbWrg3b3TuaXWqFmiH0jpnDzl0K119A584aMwuja4cWGFgzwe1xT/2yHq0ITYtHWEuPr2RhojRYkDIwQ1Dofc6YYXjixW73d5rAliWTnI135rOx4JleF00BLT/M9oASnP57wrE698aXfViXu7xiVOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPvJYCQ34HkZHonaIejkvrkgzZ75z1OPkw/fSHEanIc=;
 b=duxFUUF2Yi8KpoNRCItpj/c548s+jnmOvXzgNHbU8FnnA9TWTiyRoBd3BFWbpnYOU33X0NR1BQrS7hA8yeClmzhTqHIVUCC4MNPBT4yN+NV5TyhIWC9qbBybRaSzLBM90ZVldkzUZg6c7E93O0jZC0zCmLEduAyEVac+WAjF6J4zpuYnqeeMdij/HkY9s2RPLkjPJ4/iEINnHPC0mw0H0LbuKRZl0vBFkbThPMmEbFowkpoAdWry4YM4IR/aGpgT0H+dagqJcTYRah48Og8+9t1h5HpGsM7ptkrjdFnPQIGz+Jg9di1csHcAMqd7gdwaoaSxmHsbstUao6uMT2okwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPvJYCQ34HkZHonaIejkvrkgzZ75z1OPkw/fSHEanIc=;
 b=qUGj5Hg0p8/tKW5K5HSOrk4Of0W9wYsQk2c3v700OiUNspcqv9L+7w4Gse8B+rNVbCYcU7Pta5AiVjNO/upwK91mmEXxmC5YsuqUqS8KmurjzAi/XjmI2k9BHWZ801rCsi+EAD7cAJ/T0kq0buXiVtN4dz4sSB/tBfYbze17kEQ=
Authentication-Results: acm.org; dkim=none (message not signed)
 header.d=none;acm.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW2PR0102MB3451.prod.exchangelabs.com (2603:10b6:302:10::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.28; Wed, 19 May 2021 07:50:21 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 07:50:20 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Wolfram Sang <wsa@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: [PATCH v3 1/7] i2c: i2c-core-smbus: Expose PEC calculate function for
 generic use
Date: Wed, 19 May 2021 14:49:28 +0700
Message-Id: <20210519074934.20712-2-quan@os.amperecomputing.com>
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
 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 07:50:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a869516a-260f-4ffe-5fd7-08d91a9abfad
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3451:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR0102MB3451AFDD0E3D8C7F7A716B14F22B9@MW2PR0102MB3451.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cKJYc003RUYINxsr/3eLWSnIItakq5k34BDw5Px7GOcuMdOV83TumNEFwQpGa0TcK7UjWrlDSBxp3GoVrpqtjN6yqt4SjFL9+D+04eunZYNWuJ6F3pZAYL0f9lKRZVMA4i2gAQfA89yiOJkIExCIstw7BwCLm9KpyZDF/a4RlS70X4bqF4S7QKFqmqbxj0pv+0zgQf0cQLTq50fEQXUW8Y/e528YAnFGsn7Nu3d4BLkZyiX15x8kBrsIfZWl13bcVR25qQ8VxS9Qd3k0n+4FC3uEWafvzrCqGob6qrug1TEH7aTp+GVK3O5Nuo/oxlVpV7191UtFj0JTBPoAXrVefL0IwJNMvbsTieV+5LeQUY+z6GuMFuSt78FRurPYZzAXhYJDdzClmOoYyJZWA4r88U4b74Ja/+ODsrFVvlj+hOPFljDEzT+IE4mbc3tCHaA2oMs9Ib2XM9QCkv5r8jTAyA6hMyoSyBzOTaZND9cjPKmEBWZwAYzYh8WgCJepfXdT8vAla//1g7KYYTlqKlfdHNJ+F3HyG5TISIuujHAtvMMIPxLhdIDphVpWhD8L3nEbo42MkPyPrJMqkNtiwFLX3+oavJUGJkVnaBzznMm1rCQrr+tyV+o1FugCUff1f6y43QeYsG4+QjuUzFOUnuqD8Ar6MzS4P723NiV0HDlbbDDZwvG+u7tiz/8FskmIAGbM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39850400004)(376002)(366004)(396003)(346002)(83380400001)(7416002)(8676002)(2906002)(921005)(6512007)(478600001)(38100700002)(8936002)(186003)(16526019)(38350700002)(52116002)(5660300002)(956004)(2616005)(4326008)(110136005)(54906003)(316002)(66556008)(66476007)(66946007)(6486002)(6506007)(1076003)(26005)(86362001)(6666004)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?augMxzP4NYET6V3Ie45SWy6VlDTdMfbw+bxBL96SVfQsH95A0cx6Mu9Rurv9?=
 =?us-ascii?Q?mqAKT8aYXgDrV3oxnQlxC6RhpAhVzFXLdsQ2C6HedT7OrEsh9PLZKE71nTup?=
 =?us-ascii?Q?Js8GOQ4kPGP+jBSdSHT5benVa8AeaS/L9xOatui8bL2UyVAf9F2nn15sdb1i?=
 =?us-ascii?Q?xucF8qEmZyCEmgp4QoZoRUjnUVL8Z25/2Q2PiovpEpVWNCQcfiHEwRpBEEss?=
 =?us-ascii?Q?OtfntheMtwyiv+RCu2D0ZiEr8LLs0yrOpvJpfgkr2dYzR0VK2lacgW+YRZwH?=
 =?us-ascii?Q?qAqYF2ZoUoslSBJcBFDbA/p1kS13sBxNAXM2G0HNS1zyWRDZpyAQCOTLbSlz?=
 =?us-ascii?Q?bFIJMQeOv9u6NoXwmnXYlgItdMSkuAXuSgml2r+10tCxejLCHUSY29ofnRJU?=
 =?us-ascii?Q?77qf8wI7fdTPmWZcjuqDqkhvcOOOIt76E0cKScAodDY3CdlHYHW/wsfVvuNP?=
 =?us-ascii?Q?e4fAr/ShVt27lsxoUONbN10iqf1Y3bQAFJvp7TuoddHoaNM1jTlN1oYSlHo5?=
 =?us-ascii?Q?WsiqvWTcHowKae+MpWvklhUp0SmxbvuU1NBVZXsf0SNS2ZxycHzmy4P2prAi?=
 =?us-ascii?Q?rfLF7lo7EnllHtRhL0qH6sKPkTUbqfOYKRuiNOrvXEigbmzrg/F515UUpSaW?=
 =?us-ascii?Q?5idTLSausV+vneTBRGSeg5ZC1gHpHMYDKpZtDPorPwRO0xzsuNcbKPxyVNDf?=
 =?us-ascii?Q?BWpOuMUM/c7fpiM6MsP/SW8YyA4lIax0aYMVn0kV/3KJeErPDLTcrXsMwWhG?=
 =?us-ascii?Q?+LIwYCLtKBldfPNN1ygsiFIYbATjCEQV/ZirQTSO/o+KpJlWgpBv6qcQpVzk?=
 =?us-ascii?Q?Xi65oZkIuu4HFKWuoahyvXNn4jOzFC193yCESRuRvDj9VA3sSJHzFvLqc+e8?=
 =?us-ascii?Q?yxcxA4WmLANfPWDiagqVAewwlpdiOS0xn8tGu9SxZ7DZV+LfTO0FAecQTWds?=
 =?us-ascii?Q?r1FmZGUxU1QQxL6pcKXqHjHOgT3IYK/kQDoqCzDJkn6FtGmNmCS+f6K7pwvu?=
 =?us-ascii?Q?sJWBnNv5gmwIe8XHBEq5WfFMAe5Y7ZJrGOgiV9mHJBur4TYjzFMc319TgBsi?=
 =?us-ascii?Q?Wko1DStP+1Aaa3tqe5Af7wV5sLWoXq8nk16W9Igk37LgnjUtAtmFU7Jlij8N?=
 =?us-ascii?Q?w2ujX826yIf0V7ywcRfBgC8l+jO5koRRBS1fTwCehTLPX5AQMXzrjOn0la/W?=
 =?us-ascii?Q?L7uf+CtT20TEUryZEfUYfbkIRzQnPj7A0k8ldmHXqGaP+phim8t0om4vmBz7?=
 =?us-ascii?Q?9K8/HNqBqm6Z4Yq+3ke4bBkFrJR79xRSbIUXCwTs1c/uzFjU697ktipJGK7r?=
 =?us-ascii?Q?WsviIhn+QGudzeIwIyUpUucT?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a869516a-260f-4ffe-5fd7-08d91a9abfad
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 07:50:19.7459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9U89xkakyr5UHQH42/ugrphwgHFWOSkgvU2gmSvHw//47xWwx1ZucJ0jW7FXsUVlC5srfrx7Hra1Zf+linnmBIEO9DeXtTk3bbr6F+pYBdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3451
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

Expose the PEC calculation i2c_smbus_pec() for generic use.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
 drivers/i2c/i2c-core-smbus.c | 12 ++++++++++--
 include/linux/i2c.h          |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index d2d32c0fd8c3..e5b2d1465e7e 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -37,8 +37,15 @@ static u8 crc8(u16 data)
 	return (u8)(data >> 8);
 }
 
-/* Incremental CRC8 over count bytes in the array pointed to by p */
-static u8 i2c_smbus_pec(u8 crc, u8 *p, size_t count)
+/**
+ * i2c_smbus_pec - Incremental CRC8 over the given input data array
+ * @crc: previous return crc8 value
+ * @p: pointer to data buffer.
+ * @count: number of bytes in data buffer.
+ *
+ * Incremental CRC8 over count bytes in the array pointed to by p
+ */
+u8 i2c_smbus_pec(u8 crc, u8 *p, size_t count)
 {
 	int i;
 
@@ -46,6 +53,7 @@ static u8 i2c_smbus_pec(u8 crc, u8 *p, size_t count)
 		crc = crc8((crc ^ p[i]) << 8);
 	return crc;
 }
+EXPORT_SYMBOL(i2c_smbus_pec);
 
 /* Assume a 7-bit address, which is reasonable for SMBus */
 static u8 i2c_smbus_msg_pec(u8 pec, struct i2c_msg *msg)
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index e8f2ac8c9c3d..2494a007dfda 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -147,6 +147,7 @@ s32 __i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 /* Now follow the 'nice' access routines. These also document the calling
    conventions of i2c_smbus_xfer. */
 
+u8 i2c_smbus_pec(u8 crc, u8 *p, size_t count);
 s32 i2c_smbus_read_byte(const struct i2c_client *client);
 s32 i2c_smbus_write_byte(const struct i2c_client *client, u8 value);
 s32 i2c_smbus_read_byte_data(const struct i2c_client *client, u8 command);
-- 
2.28.0

