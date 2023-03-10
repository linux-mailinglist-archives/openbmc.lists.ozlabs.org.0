Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AF26B38DA
	for <lists+openbmc@lfdr.de>; Fri, 10 Mar 2023 09:36:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXzsY6Ydmz3chJ
	for <lists+openbmc@lfdr.de>; Fri, 10 Mar 2023 19:36:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Y7u+zcz6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e8a::705; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Y7u+zcz6;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20705.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::705])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXzrw3fkzz3cBF
	for <openbmc@lists.ozlabs.org>; Fri, 10 Mar 2023 19:35:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fqCJ6NP7ra/4ZiaTaSBWadn3r17VaNkU9CHTZqo3NcxK81f0pnSKp0ZLMQ0v/R/7Au8JGU5x8FvFB5UjrFKC6MWSOl9vPdZ9SbppDIcVdjSBJh1woNJ59XGrytTJBhhxkIpaPoUgvYvm0frDS/6fayymrPn5aPay4qEnQ6zk8wEYhtcZqPArzsaIpUlPKfq2PNejmRFiRGsuZhDwrmOQaHNaX1hZwUoc04yi+s7D3NyGyDKeX4KsmHAuepv0VpMbXNj4jOfS8PaPWGJHcez8hvYk9DoHhFSDhEZS/16pvjmHrWcOS2rBfzItnq9ou0zvxqMCrfrBwLRIEpXChxQR1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iD8NFs1zDxZyBtLA/afxwbUoMFXo/dKOemehX2Pp+0o=;
 b=LhvGkP68pRZHzjSxHU6bqkzGLzdgCxqeAyhortKB+MmgIvpXPnG7anIQi8iqt1+uYxVWmLa2Igoc9diUV7Da7MfS+Zg7xRn2UFX1aIppSJTJVECv/DmjuLZ3EL9u6W+Bp/qcaWAe13N4MFKa9fy+BrC+9JKqWEYXv+2iBQq9SHXmgYlN9Hy0ln8aWR6sdXmjvCDGLxtnlBVlSF1s1GuT39DYnzS7jLJJDlUcgmgkMWpIofRHnsNfg8JbdQnocKwzGXYplsYmmYxgUM3Znyh+S8RNB2r6t5In+gNdKRKlNA5hElMhTKTdmGwiGjc0pXsAHUpNxtxxTJeb7rLI5CgtyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iD8NFs1zDxZyBtLA/afxwbUoMFXo/dKOemehX2Pp+0o=;
 b=Y7u+zcz6GCyBqapx2TypFUBRK27BnzDopgn24D3LDOYHX+C8IlGBNNLL4Rz3beAsi8aqEW9igXr/DcyenuQ7effD2mU/f4c1xc2TaTnyuZGr//YnT5zvUrgRlqT+uVMXtCCgaZXIBSSHo7wGTjkYmFcqZNspQN5IhuWiYKSJXkg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 MN2PR01MB5917.prod.exchangelabs.com (2603:10b6:208:194::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.19; Fri, 10 Mar 2023 08:35:03 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::ff57:42f9:7d6d:de10]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::ff57:42f9:7d6d:de10%3]) with mapi id 15.20.6134.028; Fri, 10 Mar 2023
 08:35:03 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Quan Nguyen <quan@os.amperecomputing.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH v3 0/2] Add DIMM 2x refresh event and failure syndrome
Date: Fri, 10 Mar 2023 15:34:14 +0700
Message-Id: <20230310083416.3670980-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::16) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|MN2PR01MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: d7e3c361-bb22-43de-5a94-08db214257bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	DhDtH5BtXZyqeJeAAbWcHZ266+6fFd+htLwmWM6CIAX4Yw4jc8Ydjb4T+orbZRQnB3kAWcaBBmEgWyip/DIs32T0sKYfnbPRwdfP3LQg6PKla2n5KyZl8F+6ZXMowIxPgdTfc6LqlVv3SqkCWzAEHsvcyfiwP8ewM41K9vak35vxZ3GEJQyEdOFjFZ64T0ZdittW4HCQy7B8yTfYvNhVIiiaSx4Ndz3Zrk5HFbOo/MsoO93S/9dBtqL3fU1qWDCKLh9KIy1dT4IJHxvAvLpNsMwF5RG90dyh95gFflJOHXFJpZEKc2JH2E9gk0YVORZB59xguI/+22zyEKdA5tjvh+p0ITJHys3S98M4z69UWqb7/Sd/ahrFjp7fq79ZVOFQjtlAPGVbxX25u9CCrZVc1CJ8upNupqqfgQFQOjS1BKoGSV878wIoeP8duY1OCwvQAeOfqzZZ5rJV5jxwYiYE+nR3QxoYGq76TfRnLGfyVF1+vOl9F40goKwO1Y+6BGk9echFu/gAvxt3+EKd/fEy+CXkbF9hMN5azwJrGmWjgMrnDF5arQzsbWSU8sXRo6PjDYg9w3rNwj39EDQscNhcg0nMpBn2NKLJvuD3wgoSJxFivolqzjW/6kmiuDrXxMBoIbwDWw8ZxE0Zr4ret4iwoJhCTEaB63+PnbqqAFHFT4w54442vI+nqEaPsfMMTuXf
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(136003)(366004)(396003)(39850400004)(451199018)(54906003)(110136005)(6506007)(38350700002)(38100700002)(86362001)(1076003)(2616005)(6512007)(26005)(107886003)(83380400001)(6666004)(186003)(316002)(52116002)(966005)(5660300002)(478600001)(6486002)(41300700001)(4744005)(66556008)(8936002)(2906002)(4326008)(8676002)(66946007)(66476007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?GPDByYQ+zif2EXkdTW8BdUfsYtvBNY9Dqz6KkshzzCB0nF3iz1zbWeFNFSK6?=
 =?us-ascii?Q?/UstjawuCP3YKKVrzT6hmBfB5RYJhQOIl+Ynwa7Xd12ieJx9qI+bn7SsvRYC?=
 =?us-ascii?Q?qxso+aoBNaTDwAVadBb57i7vAIZtOaQ+3/nU80zvnOIT5U0RB3LRN8YBtRRs?=
 =?us-ascii?Q?7cBgPkZYuQQ38GqxAuX4MSYR32clxVa3AIi/Rr109Vrn4L+ItmQFQU1vzh9s?=
 =?us-ascii?Q?+U2/b3PKECpSiX56uXv+LujHSeyv2qcFiLxwkcCcXYD+oCmZ6ZWM8ZDTSQvl?=
 =?us-ascii?Q?LcN2SOGmu27DgdSYzq49994SUzRHY7vBjF6QWq6PtemuFYAcZSxmn1RtnBAX?=
 =?us-ascii?Q?NI/CPwAFCmTRXkgVOBSVVTnl0QnCR2a9+gwh4bHKlAC930fjUaseaL4vlJXC?=
 =?us-ascii?Q?vA5xmYC6ODR/iFzWQK+hXD+WB+PLWkisKujy29rPcDGuAzATa57+QGh3U2L2?=
 =?us-ascii?Q?j58b6/M2urZsZobEZydPIQFCX1T9NfEnnCbFAJhnF4yOkOMqDGNHiiMS6R51?=
 =?us-ascii?Q?/vL3p0UJjqQzuslAQYSEsaTL2gQ1mkIlaFy6q1G1n8+R+z6mCNZ8oh9ItCpA?=
 =?us-ascii?Q?7/F9Ytmvoh5rwEm9aumX3+OE1TKkHmxFAr+i9R5akaoi+s0XNkIX8Hga+QkX?=
 =?us-ascii?Q?7vrFqF/zLnadyd9kLqDGYOa4/ljcLJKqGfIurdL3sAp02Oxxg+yEZoL6y6TN?=
 =?us-ascii?Q?e/7tYqocVuh2mkU2naEcHY+0iR2FSR5UsQWhP6GH7eUKxzpQUJfE4wBFMDbW?=
 =?us-ascii?Q?GaVdYXHhUNFJOwrVDZAsVG6nfZwPNb7YtO7Ab1ebhNhbVl8G7CTAMA9E6rLh?=
 =?us-ascii?Q?1fIG5WQ2uId7iYNOPXBKSa+93D8J5RHK3csiHS5CcFyEOv4KRE7mJnArfdPw?=
 =?us-ascii?Q?IXbWHO9rDZXYjyi/mQ0an7PZfnjnomW6voZPUflmsPi1eHLNlCSTTd8ESZQI?=
 =?us-ascii?Q?C3NxpU2+wcYZ6BLVuJyw8gQMDSz+AeR3M5yl0ZDOIYb4m6PNVObvWHdAchvM?=
 =?us-ascii?Q?dclnDQi+yMHe/810qRX7vmPwsjEn//D4IRJ1DeS5Vwm35aHE2FOrbK6wC1Wt?=
 =?us-ascii?Q?ZTEBOorgfemoggSl07MsZY5wVqpNnrCqDMhyEzhj60Bpzx3yyl1RZiwigDzz?=
 =?us-ascii?Q?6EUNcOx9AOgsl86knQnigx8Hg+TyzTfmXaoqXYu/KU6u44ZiJA9g8mee2eEA?=
 =?us-ascii?Q?a3Sz0tmkL7iJUyde21ZCVdVm2VrlVtKI/Y8NH+DSUKTI3cI3KSR5z4kBaNfs?=
 =?us-ascii?Q?crl6K1xtu4cY6PY4qKhSpekoSG3xq07Fvwt5KR5469Ih5J1xIV5uNpp/BydP?=
 =?us-ascii?Q?9LsgTQHSy1J6yshjaNQ4yzOfdYGv0gpl3G3VEgAXb5QZU2svlfr+v3M4jqzk?=
 =?us-ascii?Q?M8p/LsshGBQcf/8SVL/bzFEy6zzstez4x4Xq9TvHKd8OYfQxsPwLQd3pkw0+?=
 =?us-ascii?Q?8OCyEvMN8Qn2sEMEKuqKlNyqmHa7yON/s0zjOe0JOj9oNjvLNH1AVJ7r5mWz?=
 =?us-ascii?Q?UKI8bprA/6JSEm9Uc0yATcnXTon4bHITHSjlhVOgwG+k/6DZEBMKnuWVKAEA?=
 =?us-ascii?Q?Qhj7J5nDRyCyTGKEmoKVu9ELGxs93rMRJaqt3LPhc3fKzkSk5/Z824uK3nEl?=
 =?us-ascii?Q?8m2kvI9kuQM8LMuvuQRPPJI=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e3c361-bb22-43de-5a94-08db214257bc
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 08:35:03.1263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wJHbRo2UUU4dUs4zUAcVa4NGwxkksEPM/Tn8hWyjzV2zAT0q9EaKXUgOgztWoG79BV0K21+S8JxkENKwyxuaP9IJZq2GREicpreN8FEtc/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR01MB5917
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
Cc: Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Adds event_dimm_2x_refresh sysfs to report doubling of DIMM refresh
rate on high temperature condition and event_dimm[0-15]_syndrome sysfs
to report the DDR failure syndrome to BMC when DIMM training failed.

Discussion for v2:
https://lore.kernel.org/lkml/20230228092010.1863419-1-quan@os.amperecomputing.com/

v3:
  + Corrected kernel version to 6.4                       [Greg]

v2:
  + Change "to initialized" to "to initialize"            [Paul]
  + Corrected kernel version to 6.3                  [Greg,Paul]
  + Corrected variables type to 'unsigned int"            [Paul]

Quan Nguyen (2):
  misc: smpro-errmon: Add DIMM 2x Refresh rate event
  misc: smpro-errmon: Add dimm training failure syndrome

 .../sysfs-bus-platform-devices-ampere-smpro   | 19 ++++-
 drivers/misc/smpro-errmon.c                   | 82 +++++++++++++++++++
 2 files changed, 98 insertions(+), 3 deletions(-)

-- 
2.35.1

