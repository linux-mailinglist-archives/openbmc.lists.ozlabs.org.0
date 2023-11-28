Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEFD7FB34F
	for <lists+openbmc@lfdr.de>; Tue, 28 Nov 2023 08:54:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=DXE7yREA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SfZVk6S0vz3cLk
	for <lists+openbmc@lfdr.de>; Tue, 28 Nov 2023 18:54:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=DXE7yREA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe5a::71e; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2071e.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::71e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SfZSy2Dhwz3bPM;
	Tue, 28 Nov 2023 18:53:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lkDe0qi8+3zEViVLYAUCIBabUHSGVyMCY4USRzZprnCJuCGztDNg1I5ixTM6J94WGoEHw60S5ippQPYu+tR7BUjUpzWIraOJylAzRFgEUq/1pjZqM1yIF9N2XRSqrsWT9RGwRqWmWd5egTSuvUdv+CxOw6ndFn5G+PbwTgoSDQqndfjZsJMX0a/JmIHnsPwqU5yIODXn7D6H+N5+IQXaLXe1pwByphGI5T4DLm1gljmauyrzQq8exHl7K/Xhc7IgV2N7KWPqy1XwX5kYXYGbEOxFtzi7H4nJSAQ+E0KSATRURHWt2kOwMguIey4TvWiCfjqTCIHNJNsMdTOLN1JdOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2jqkmQeBWRe1MOsuI0Th9cPqnwGyzjyv0fBjRd58i8=;
 b=HmleX7csArypFDGhO5tvZqV8Icvk09MLQ4R5voFlxx77VZJtU4eJV+hpxfP5s52HSpqnWK8hl2yrZdlYu26MsBtnKMONIqfns3Ix/aw0FUFh2eJpkvFbVsZGVywbrdN4TuTwZOU/tS9kuUxl20H/yW+hj++ny7qj8FLz/04XD1fzTePfzYVAEf7xzRnpSAo9fgcQq7Atka4+ll3DWKIfdK7oaEvXIYscE7MRzZkXpO4oEd0TG5Q8slFywft1A2jNYR3ACmoso5UIghUNK9J/cbMqXW2und0f5QMC1ws99K4AsZudNjVuBnrR9O+dTlKg2On5JflDc1NfohC5U+UiGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2jqkmQeBWRe1MOsuI0Th9cPqnwGyzjyv0fBjRd58i8=;
 b=DXE7yREA/Sivo6aDgEU/68t9SiuXqFxkKzRvzNM8fnlQH3DAd5EgFjEpF9PqLeASdkaU9hPAhj72XSRyTf7x6RmmPHW2DLJyBTx+JU46EGpXMl3tYQnsYQTslauPK3zizxSoCixvSgMj4jN2op6A6t+zqVXWpJROrziFNLIL1XA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 PH0PR01MB7895.prod.exchangelabs.com (2603:10b6:510:28a::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.29; Tue, 28 Nov 2023 07:53:03 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68%3]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 07:53:03 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Wolfram Sang <wsa@kernel.org>,
	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 RESEND 1/2] i2c: aspeed: Fix unhandled Tx done with NAK
Date: Tue, 28 Nov 2023 14:52:35 +0700
Message-Id: <20231128075236.2724038-2-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20231128075236.2724038-1-quan@os.amperecomputing.com>
References: <20231128075236.2724038-1-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0032.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::23) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|PH0PR01MB7895:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eadd8e9-0c1a-4f35-3126-08dbefe70cad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ys36CIJi5Rxwl9e2oZ81Sx/WdByDMAYoDifWC77Y3jIu82R1pcDxutOhy8mKReGD2mRFKsXxWYK+3HbwvZT818VVhryh12CfR+Y6CzqQ9eyQPDw1xWGXdP4sAIibOrLlF4y2cG17Ok9QgN6qT+y02NORC3mcns5Hy9Hijo7fOT22WKBdEOn+k7i4hkOfB3xOrPqAf+IA9IHr3+PCvD+ywlABpEtAzy8HLhe6b6QTpH7zsZFeVEuZzlweMCDGbymhwt7loDqWe1auSOD4Ad0eiDI+NxCkUuPijNsiMVnoWyCuLhINLqS5UVHGZxku1A5zdp+ea+2+usOthNc9yy8LdciOikoq3Sygm0inmIrCFo9JzocoC9ypnFzP5Lgt3clwHFXZtWdgphC+d8wF2HbqLH15/SDBCAD23TNBy9QBk1y6KG52yu2fJl7zsE8P0B98o4TK9zIlijBK3ihC57dy2aquBN5Eqm1sIP1ozgOxezHeHc5wBBlmUi9xU5sJE7OBIHkTaHGauSlM+JyRhM36UZYCK9qDRMebsMvi2gqxAAkbN/yb9kVf5Wt1wxA/zstWpcq86N4+PSsN8djgHhepcSFPSlmlgDzw9zwYwLrYEJU+KhtE4rWISDA8/B7EFNKp
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(136003)(366004)(39850400004)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(4326008)(41300700001)(8936002)(2906002)(8676002)(6512007)(2616005)(6506007)(52116002)(86362001)(107886003)(316002)(66556008)(66476007)(921008)(66946007)(38350700005)(7416002)(54906003)(5660300002)(1076003)(478600001)(6666004)(26005)(6486002)(110136005)(966005)(83380400001)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?eWtuSUEvUmVrVmhKRFIzL25zM0F5LzlQUk1lWGtXVit5MDF1K1dScitMam9T?=
 =?utf-8?B?eUk1VWUrdUdoaFdMYXV3SHZaVDJZUkk2TFJPQXRIbmFxZENhY2dJTHdLNk8z?=
 =?utf-8?B?aUZrTkNlZEpmV1czN1BYSlJyRXh5M0x3TUNiVENpS04rYnIxSWJOcHU2R1h5?=
 =?utf-8?B?UmZTY1NIR2g4ZkNpNm5WS3R3eXk2cURPRlVkaFFQVVgyUjc0OGZuQlk0MUh1?=
 =?utf-8?B?Uzg1SkJISDUzM25WRnN0WWFzWFJWa3NsQjJoNGdYNlhBUk85RjViQUJ3bVdO?=
 =?utf-8?B?M2p2Ym5idUY3b2hYWTR0dUtlSzBYNnJlRDQwU2NDQXRZVmpwdEtyLzl2aWho?=
 =?utf-8?B?TTMyTGJXblhlbWE0bnI1WlFhcitQWTJVN0N4aE1jMkEvWm9oL3M1SndEUGRG?=
 =?utf-8?B?RU5LblliNkp6S1dVaXFpK0JXQ2pRcUVlRUc3UjlBUzBWYkthbk1lcGRBYitv?=
 =?utf-8?B?SnlXeE1iMTQxb3dOTFp5WUlCNkV2b1pEQ1hFR3ZhNVhtMldHVy96ZUpMTStL?=
 =?utf-8?B?dTVsSTF2S3oxMGU0UlZkbzBSckxnT2QxMFJRSWwzRmF5RWpubGhqYkZIbUlD?=
 =?utf-8?B?QXhHSTZKcDJDbWVnVHZORXpjSHpxSDZ3bjlnVkFtTis5Wi9sTHpzK0xNcjVk?=
 =?utf-8?B?b212V3FCT0J5bjBDMzh4RjQwTGZhNzU4VkN1VXZidnlsOGx2MnVnSVZ0NC9j?=
 =?utf-8?B?SXpPbSttUVhvK1RCVjdIc0VwRDhLYys2Q291SlFGMjRWMmdHZnJvaSttWXNn?=
 =?utf-8?B?bXhyQ05OR1FITGNRVkhnN3EzeUhPeldVV1lBV1MrOXRMTmVYNlNvQW9OUXBF?=
 =?utf-8?B?K3NLTS80ZStkNW5DdEVjMTYwd2U3TjZIUnZtQ0hzSVI3QzZvQTRia2ZFdkpl?=
 =?utf-8?B?Z3VjMFI4Z09PWWlYb21udGRVZ1E5TG1kUFVrMGx2VU9mQm5Bdk1XYlhCWVd3?=
 =?utf-8?B?Qm83Wlp6dVd3Y0FtMW5EMkRrY29tMnRiTnFkeDlWcXBMRTRXYjh6N0s5M0Ra?=
 =?utf-8?B?bGJ6RVpaVDJKQVFNTWFEQnFYQlZ6S2Y0Nmh2eXpvMlB3RzFWUDZYZzZYRXBV?=
 =?utf-8?B?aXpOd0lqcXIwTEVwelhmbGw2amNvQnNOeG9PUlBLMllyRk11c0pZSDRuRHNT?=
 =?utf-8?B?dHR4cER1TnBQMTZnUDZLWFRybUtpMDN1cjhLSGNyMERVRXFmMnRxcEtKOWdY?=
 =?utf-8?B?WFR2VU92djdFVlNqbExvWFlJQ1p0N21lRnlRcEY4ZFhFbU5uK2ZPN0l0SUw3?=
 =?utf-8?B?YWhENS9JZkpVWTkrVmxJdUhscnRicEdYN3B5SGxxL3VaNmJPZ1RmWS9Zbkd3?=
 =?utf-8?B?T1ltMGIrOVJsZFIwU20zZ2lXQlJRUFRqa1JtdU1wWkJkdXRsTDEvZFlIRnhN?=
 =?utf-8?B?N29UMWlwVWs2cjM5ODZyZTFXZGdFR0NPanBPUW9Sd2ZVOFNYUWowcFNudzkx?=
 =?utf-8?B?bDlkakc5VStQVmtBc1BVdGkwZ1VBcDJMbW5sU2VlMW9uTm04NjJtMVZOWE1J?=
 =?utf-8?B?WjVaT2RsNlhIUUQ0eEFQaVFjWUpDTFFSeDFNNEk1NUdZL0ZpSlI4SEpKMXBp?=
 =?utf-8?B?ZktWVS9PZmJVRytvd2h0T245WmR0T1YwMWdnWk56Y2ZzTUdNRUV4eFBJZ2pI?=
 =?utf-8?B?THRHczducUNuczVHWXJ2RGRtTWhWWkh3TVF2ZFFjNUNKLzVrWUJ5NUJrSk0w?=
 =?utf-8?B?NXphOTY0bERFZ2tXVXJBcGNjV3k1SFZIVHl0WWxXalpFNGJ0c21oTW1mN2xs?=
 =?utf-8?B?cFg5dnQyTlJhaVdXQzkyYjRIQ01RN0oxSHNlWVVydGxwblVHT3RpZVVGeEpR?=
 =?utf-8?B?Z1BkZ0luQ1RSaEx6dTRsVFRHUURITWxzalpBQmtidFJONmw1YVFYa3RLVWsx?=
 =?utf-8?B?eWxjelA0KzRTdGZuQzVuUnAwN242STIvdVNjTXNoYlYyUER2RlMyMVFzd2NS?=
 =?utf-8?B?cmEwbkVmNHBEMG4yZEtuUUpzb2VqamxjT25lMGpFZnpvdnMzQVZlcGJNUHRx?=
 =?utf-8?B?YndBZXdXdkdpZWZLV3JNcXBra0srVjZxNk5jSzlycUVxV1VUZnplSXlhYVRG?=
 =?utf-8?B?bWpMVDRSSGtDTTVJNEJTeHZxWnI1RUZiTlV2dHZpZXNJMGJmbHRhdFA1Q0NF?=
 =?utf-8?B?S3RoclJOQndyUDRkSGVUNFViRWIwcHpJeEVyUmxGUm43c1l1Wkt3Y0UxN3J3?=
 =?utf-8?Q?I8TIMMK3KwbHsQ+WZlMS9EU=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eadd8e9-0c1a-4f35-3126-08dbefe70cad
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 07:53:03.5932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CkUj1KW4UY4MD1YJegZzUY40UghVetA4cYtb5V6sna9uiXItDO1/XREnh5i+YhRfkgAeOL7ilNKIvJlKq17y0N4FJQBldZmugUirGgRLUkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB7895
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
Cc: Cosmo Chou <chou.cosmo@gmail.com>, Open Source Submission <patches@amperecomputing.com>, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Under normal conditions, after the last byte is sent by the Slave, the
TX_NAK interrupt is raised.  However, it is also observed that
sometimes the Master issues the next transaction too quickly while the
Slave IRQ handler is not yet invoked and the TX_NAK interrupt for the
last byte of the previous READ_PROCESSED state has not been ack’ed.
This TX_NAK interrupt is then raised together with SLAVE_MATCH interrupt
and RX_DONE interrupt of the next coming transaction from Master. The
Slave IRQ handler currently handles the SLAVE_MATCH and RX_DONE, but
ignores the TX_NAK, causing complaints such as
"aspeed-i2c-bus 1e78a040.i2c-bus: irq handled != irq. Expected
0x00000086, but was 0x00000084"

This commit adds code to handle this case by emitting a SLAVE_STOP event
for the TX_NAK before processing the RX_DONE for the coming transaction
from the Master.

Fixes: f9eb91350bb2 ("i2c: aspeed: added slave support for Aspeed I2C driver")
Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
v2:
  + Split to separate series [Joel]
  + Added the Fixes line [Joel]
  + Revised commit message [Quan]

v1:
  + First introduced in
https://lore.kernel.org/all/20210519074934.20712-1-quan@os.amperecomputing.com/
---
 drivers/i2c/busses/i2c-aspeed.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 28e2a5fc4528..79476b46285b 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -253,6 +253,11 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 
 	/* Slave was requested, restart state machine. */
 	if (irq_status & ASPEED_I2CD_INTR_SLAVE_MATCH) {
+		if (irq_status & ASPEED_I2CD_INTR_TX_NAK &&
+		    bus->slave_state == ASPEED_I2C_SLAVE_READ_PROCESSED) {
+			irq_handled |= ASPEED_I2CD_INTR_TX_NAK;
+			i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
+		}
 		irq_handled |= ASPEED_I2CD_INTR_SLAVE_MATCH;
 		bus->slave_state = ASPEED_I2C_SLAVE_START;
 	}
-- 
2.35.1

