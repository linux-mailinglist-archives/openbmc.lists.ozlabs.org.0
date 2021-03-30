Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF9D34E9F9
	for <lists+openbmc@lfdr.de>; Tue, 30 Mar 2021 16:11:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8rwb2qV1z3bxn
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 01:11:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Xp4E2zia;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.243.101;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=Xp4E2zia; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2101.outbound.protection.outlook.com [40.107.243.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8rvq4Mh4z3bqW;
 Wed, 31 Mar 2021 01:11:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HYT4U+S5AB+znlKPZrDJ7LJgZRKqAecWenwgnO6z4e7h11nR9eksYr+snKW50YTnxmkbW2AOLAqq50tLZAvxwU6e//fhyv1ZnwZk4Oira/BL6DrzvDGj4wkch5fFNGgdgBRYtgBTH8UCCVoD4bIedMhDywtTZupxlMC6FmG1SsI1gjfLVW8L7y/jjNmAca9vAvADw8W1nUln2CU/pBJPXuFv5yrotMHRfM7aDnGxMaRsWBxN0Z3wttz6jrPMKF/sWDzN+FU/iIkkT9ugL5PatIh7RNZBBhZtd7Nw6YgrrDbCFLxl2k3zeDNdgTs9Re8wAFAthHSnkCMoq1KvtZ8d8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ObTdeZ8zsjlufq5/WNaeZ0cI2o4TsSWrRB99EetYum4=;
 b=VCJ45QZ0aULI8qYvE1ia+CUPu2lUH0iCmW4JQBXd4nFSEwBZc3dRtnf9IWj+gDC4P39lICmvOgPuGwvTCmgDP/2QfM0VTgI/fw1jGtknIZHKPdXb5FLlZrLph73tBZqLFtmmOq9O3euUqlKd9iwo34Uw86NsgGSlcFa9+pX5M0XVTFth3tmjaaa0SXNDyJUmXyZyT/oUlOFMepxEqlbOLd7IEFx6fKaZtA5ihq1wnBKsjOMJYl2ZpjcJZO+JerExA+8VU780z/BAiC0eDdIJBoy/E58zWJCLAe3MkQMW9J0WNlKDRINcQ27Y9ZniNBkGwzr8iTibGJd6H055pesdXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ObTdeZ8zsjlufq5/WNaeZ0cI2o4TsSWrRB99EetYum4=;
 b=Xp4E2zia66KuqUhiWJTWj5inSM3+AubRLqrbVDWcYiBkQ03WKQ/iaXupUC0appSoPfCXXYun0Untz3eTPDLPvpSB7UMCqPnfJ7/r1vGnp+rvfrFpWbGX7RCSgXbYIXDqFhHyHXz8gV5uQkGzOXb9mXYC5AoBZmDjes8/vCjAyrc=
Authentication-Results: acm.org; dkim=none (message not signed)
 header.d=none;acm.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW4PR01MB6338.prod.exchangelabs.com (2603:10b6:303:7b::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.30; Tue, 30 Mar 2021 14:10:54 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 14:10:54 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Wolfram Sang <wsa@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: [PATCH v2 1/3] i2c: i2c-core-smbus: Expose PEC calculate function for
 generic use
Date: Tue, 30 Mar 2021 21:10:27 +0700
Message-Id: <20210330141029.20412-2-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210330141029.20412-1-quan@os.amperecomputing.com>
References: <20210330141029.20412-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK0PR03CA0120.apcprd03.prod.outlook.com
 (2603:1096:203:b0::36) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HK0PR03CA0120.apcprd03.prod.outlook.com (2603:1096:203:b0::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.29 via Frontend Transport; Tue, 30 Mar 2021 14:10:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0915a22f-cb1c-4fc6-b4cf-08d8f385a1c7
X-MS-TrafficTypeDiagnostic: MW4PR01MB6338:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW4PR01MB63387E44D15A48DD708E073DF27D9@MW4PR01MB6338.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ibtCF2jG/bRJ/vMV+HgnOaljgF2gjiXfDRxM1lb0rnTxGqEWVlkRCtJUMjXf+VxUiIuPtU5qKKebeLcsu3B7ZCDGSR3EYXOOLwQzopBlNoE7YeP3F2ZgJ63dciKse++HjjsJr0UDYiSgAgG6ag5Kze95dMB/APadYwrBmu3k9M2fRgg+9a9NTQArDvplfaUnnLkfaMinBbDrNie9fgEG2bCfWGOogYbf3bxx+uhObsTzlBVSyh4hh0ckbjp59V0NI7ZC42GMea4oWCPYfo5fqkYYH9tG3EuhSOdrJgJbrfiro1HxZTC7TYtpq+ed41S1ffH4skya7TAoczm7XQ82LkN2Zw9Ja7pAJxk8+NnQUzVdz2o3RzX87c2zYZOrwsr2nMZ4Nsn8EiPqydsljl2/YWyqtEDCNwEb/juhgv4fxg0x+r+la7EEnZD+oUj0NY+V/X7ZmiKFtiTfBIdHj4tsWD0nQUdfuCH5sLXYteL7DejwTKVOC6PjOy1AXs7DZw62KQTidDDGpOAqmZne6xuHirUia9FMSyIEPt6K26jZy5tthoW3yVvCKle/GJBAO0Kvn93sCzZwgTE2d5kYGoennoye/V/+qCoKRFwAx/yLRbpSD9lvbf9/R5iKSQDDIZYhyhMWaQ1k91LHbIYp05a5l+mgMWj4/vY6NmBbpdpzPt+TnawKcIYrqeA0y1BlqjDmuI4+8iWWmLoFGzLDS6uUww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(5660300002)(2906002)(956004)(186003)(16526019)(6512007)(66556008)(66476007)(6666004)(921005)(107886003)(52116002)(8676002)(7416002)(8936002)(86362001)(38100700001)(66946007)(110136005)(6506007)(83380400001)(498600001)(6486002)(4326008)(1076003)(26005)(54906003)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?CBHYV2yQ0q92bfTkMZg8G7STuaJM1Ob5oWxTRvT/+C20yDdxtfx6HKr3p6tL?=
 =?us-ascii?Q?H+5Oa6VnMYdMdmV+W+JImj4LGXgU+7Bg69O+GslEeiPqqe/Kb8SBUbnS3Rpz?=
 =?us-ascii?Q?btvElmsDdwmNUP8ONFbA7rmtow6wESC/MKrouR3ODMzj98nlc27dAMoVCj/M?=
 =?us-ascii?Q?CfSg37aere70tOltfgh1mGGZhNBangZNTuXoD4z0GV0xT73O7qf191OgjUPb?=
 =?us-ascii?Q?OLaQcN3KNDNCH4oNBQ5/eqjNdBlnyfgMp4/e/3rM6rxiNYfLYPfAoZ3qk0F2?=
 =?us-ascii?Q?E9i1cTVEKC+rKuzJsodepGAfXjxhQK0Mv+Yh/Sl2QiLWeJbAdCPAaQ/zS9rv?=
 =?us-ascii?Q?vm2wqYLizbNtyfF9hRQlpz8iRRRUFyo+xgQ9j2JZecrkiviG0jj1G+rSRZ2i?=
 =?us-ascii?Q?WMz85R2bfFCpMPSF81zjKXndQ9GTlPQmprZBjC7SRYVXkW/WBlTqUeuJ5xNA?=
 =?us-ascii?Q?FSxxIP2dhHE7eTDnBf1Tjr5wSxZX/0a0eidJE2UQmQXdUTZaNfPKYNeRLuK9?=
 =?us-ascii?Q?2QuVqMXLmh95O1wnLXZAysEIcmAua8h7YQtZBDTYMdzF/KIv2fn/IUDOhMw+?=
 =?us-ascii?Q?jEPUHymEAFNt4iAlNVOlxaWxDNHUYCJX6bejZzggs5dhmNhk6I81f4eKrgle?=
 =?us-ascii?Q?qRWpgaZxZ4nVw2/gSGI4Plj/GJM0hJzHCgjKZvVTuYgOrLHKZ0lHotI9xM/w?=
 =?us-ascii?Q?DH8v+YpFhukjCNBIWMfT3h9dQPCfyiewee0EX1DkgCuemzTyk0BLgu/j7QjX?=
 =?us-ascii?Q?5NHek8tjXzOYKPlVwnjiUGXSbFbU/pfq+Oi5BMxm/ulSIpTM0NCH8FPHW7Go?=
 =?us-ascii?Q?A8j2sy1pIgSFZrso3pcL2JB2bWZkPxGxNZncuoKxDilSxwhTFxRCKctmxNhv?=
 =?us-ascii?Q?2QAhMTuIy0f0phLsTloSYzAgTow0X3vJEd/NOUlfm+SRSAUDZTgTEWpsftxa?=
 =?us-ascii?Q?vV5pmfU0nA4Hv7OFZABMzW6m1NPLjO+TrXVXPf59jKi7pUNnc2RikNoVREaq?=
 =?us-ascii?Q?ZHAGgwfd4R0Hwepuo7ECdtdSDCWO8A40IRQSahXLIIkFWYxrzUINdid6qg3Q?=
 =?us-ascii?Q?ZXCdL+CS4ZTGLssAN5y5VvX9RgdZPNL5Jcw4jRYyFJSVpDtgZKXcI3b8tLNj?=
 =?us-ascii?Q?/5Gok92Vp4/kRtDI0j2xZn2oh2Bc95v85cSBoQf6a2RxSzsoMsbkQIajoN2T?=
 =?us-ascii?Q?+s4SrYktxS7JZoLXI+evMN0WLLLBjkI/Xf0hJZIcq/XO1ELWO8cFv4OVUHj8?=
 =?us-ascii?Q?eDlyRqDDgOdVI1CXiefH1t3vvoy349tMFEGiQnjhDTFGdVHkhYdOqvcZPPFq?=
 =?us-ascii?Q?ZNkQlzuyvi6ECELkm9DRkiJA?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0915a22f-cb1c-4fc6-b4cf-08d8f385a1c7
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 14:10:54.7752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VTiLY/qwMIT9qKH9qr1dkXfld33hyHg/9hK7w5koBwss2FybuIkd24Ib2GOa9pRq2cyC9UNB893r3HJHYktgr2XPwgEfntBP6VllJlx7aMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6338
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
Cc: openbmc@lists.ozlabs.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Open Source Submission <patches@amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>
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
index 56622658b215..0d75e5bcdde6 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -144,6 +144,7 @@ s32 __i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 /* Now follow the 'nice' access routines. These also document the calling
    conventions of i2c_smbus_xfer. */
 
+u8 i2c_smbus_pec(u8 crc, u8 *p, size_t count);
 s32 i2c_smbus_read_byte(const struct i2c_client *client);
 s32 i2c_smbus_write_byte(const struct i2c_client *client, u8 value);
 s32 i2c_smbus_read_byte_data(const struct i2c_client *client, u8 command);
-- 
2.28.0

