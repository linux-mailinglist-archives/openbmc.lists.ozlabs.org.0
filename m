Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6990A34CFDD
	for <lists+openbmc@lfdr.de>; Mon, 29 Mar 2021 14:18:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8BSq2fT5z30Bv
	for <lists+openbmc@lfdr.de>; Mon, 29 Mar 2021 23:18:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=XXvaSaY7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.236.103;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=XXvaSaY7; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2103.outbound.protection.outlook.com [40.107.236.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8BSW4MMWz2yYt;
 Mon, 29 Mar 2021 23:18:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWZXsf3B1TkmHgd/nOF4SvBSDZn5qzRSpXg0vpNHRjz58iOjByRbFHPXOhf+Zg+9XNy0UVyz/cq1z8yV1gJUrM9TrvdBRyOVkJe7wJ4HN2ibqbFckoDRjNyOPXBSVC6tCwvQgb1o4j5Nf+0KcGxTqGShrrL5OOR3TPNPArmrpTD0mPo+TkbloA7k13pSx8M6pV/e9rq+4ugY9sk3QiBNZZSJHf3LXwmd8kG73Kj8LG4V3axS3aEw0kMe8IQQXISMwBQ7aoRD/pwDH3Ux/az8z6jCGnmQmzmBS+lZ7VrRJ6w7G/A3O9EZfbak+VELnOBoilBK5ZM8QqsqhXCRyv4+uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtlvKtuM6MihIyIrL118Lis3UII/LxYHW7mF9vKD0s4=;
 b=gd6AmOdGptqx/3u/RNf4pUXUpyJCdd3YG/nb2CNxk4dyF99hP43Dwh9Ro3loQu6Y67qHbG3JU6N7e13n9B3c2Koun+np94Hu31W2kQXvUTf9Womv7tgrPLiEDexcrnRktns0y6JxAR8C+d2jiahrKJScgC0pvFw5Ad8m/4qORiTuJmZNNO6+ecb7BOPWxFXVE5Atnk3439/UYZZ/lIQyPVDSLaBrXRZ3ANABY+gADTSjnhffhp1Y6Av+roWKpNlHqCrJyKuU1kg8qxmLWFaQME9TL9dr608MZqeiRh1maAy7jcKFlZHaildwBP/3TH98PayKJQYXI3EB5b2AVS37Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtlvKtuM6MihIyIrL118Lis3UII/LxYHW7mF9vKD0s4=;
 b=XXvaSaY7hDemsKwk9P9O9wexQtEhjaJOuVxcS/AgRs21aK1zhyMPRwhR0U1ofk5WNClNZY0IOT3cZaKxrsAngfuzzp12/kvASmQgq7A2cqKBPTfW7zxKmVTZb+R10wlBPlffc4MNSvkfREjWqOR6iTgNsHT88OBVr9v/Fg5eeUM=
Authentication-Results: acm.org; dkim=none (message not signed)
 header.d=none;acm.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 CO1PR01MB6679.prod.exchangelabs.com (2603:10b6:303:f5::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24; Mon, 29 Mar 2021 12:18:27 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 12:18:27 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Wolfram Sang <wsa@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: [PATCH v1 0/3] Add Aspeed SSIF BMC driver
Date: Mon, 29 Mar 2021 19:17:56 +0700
Message-Id: <20210329121759.5644-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HKAPR03CA0027.apcprd03.prod.outlook.com
 (2603:1096:203:c9::14) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HKAPR03CA0027.apcprd03.prod.outlook.com (2603:1096:203:c9::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.14 via Frontend Transport; Mon, 29 Mar 2021 12:18:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf4e0d4f-aaff-4f36-01b7-08d8f2acc161
X-MS-TrafficTypeDiagnostic: CO1PR01MB6679:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR01MB6679A2EDCACA9DEF44AF718DF27E9@CO1PR01MB6679.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vlAYpnhoP+gmls5g5TTzopFlitPpsr6AVddphIyip0NKRFkGPp0rmZln2NBgkeMwo8btnW9AoklOBUWsIVqf89HGnAYOOISM+6aS9uCgo/HH4ryrzkcwAoA53qlEq6ptbzYtvDTCavpaed6HhMm/PhJWK0hUW4HRgsWwWYA4nHLyg2pMC9tr+rVkBbiZWaZu0J4Bbv0sO2Xd5OxM7dyhodUkAKBeey/4QzRMj7/NPhkvLkmyc52Af1HcokoINxXRUuNMHPVyH7XhLLC2j+GrVNXoemq4GBxafRq0XNSx+rfUnI1lTz4CLqGXXCUaxPGvlt90y9ryj6zB9g7+XXIVxTnTHi6ZISeowZ1jAs7mCuclK1FV/az94WFt2iZl17SfL67zITeaXDfayyVBDgRgc8jyR6XIUTxe2YPdY2csYP5z1EV8eeCBdQOyW+a2mp8OsqITji4xfqbawvE5Szllc6Jm2XBGGTys7tjf9W+rk3k5p/BFu/99lg46owsOyQ9fsJaEC1gBHqJRVhf1Ho+Odzes2leULsp4WX/DLM/VtOV+uGA99Au+tyDrbHmOBEenw5hfup3tAqPXgIcdqlL3M8H07Gvs7aYslIgyxEDLgYlBXTIajx8ICnoppLSmEA8G5WMciBbA2yz6O1I/42PCHhivRcV2GIA4J4GUvYJBNNwaIAOZLyUbXlZFvYcMrpHN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(39840400004)(396003)(346002)(136003)(921005)(52116002)(6506007)(66556008)(4326008)(6486002)(16526019)(54906003)(2906002)(107886003)(956004)(6512007)(110136005)(86362001)(8676002)(38100700001)(8936002)(1076003)(66476007)(4744005)(5660300002)(2616005)(83380400001)(7416002)(316002)(26005)(478600001)(66946007)(6666004)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?0LxMkCgRvM+j4C/uL8S76ov5MPaLDiXiwpcmJOiXK4K6J+5HgxYT/tDYQUG1?=
 =?us-ascii?Q?lZE1udVuxxLlqrlsL+B52ssE7eYMdQb+nb0nefkpgM2DnAtdoDdzTck9uGvb?=
 =?us-ascii?Q?ejTguYq+TdOFOKWmxNQrpVLguDHPd7ack/U5l9zKakbig6wNIPKxoWKFhbyk?=
 =?us-ascii?Q?1T2E3YEN9HgBxoTDyZYH1zUb5t+3ty/WXgVYJu+yss9I0m0DGxR+LoXcNfNW?=
 =?us-ascii?Q?h8ovDRUnaZn1A7Ok/cPPEx5clZl3sBglx7tEjTJtp/ZJ3co6N7L/E/jdpEJl?=
 =?us-ascii?Q?GSOR9SFSJcttPn2s+Sc8eJib9/kKS8VjfyLdjkQPKclDXfAfmcsaVSz5+hbH?=
 =?us-ascii?Q?1+vP+r5oVDac1VwojaszpRucsRfeo/+EB3zHZROsytFg7JEEmHQTHIbzKquP?=
 =?us-ascii?Q?T1imfaQXBEbzekNZCmejfzdDAqwENILH60klVAW2oyqZ/KIlZmAQEqdq0NFA?=
 =?us-ascii?Q?HvWYSAGD71XtwjfpMzifJ3geh6r+ZwyWSjeiqrnOviQB5lihn9JdliUiTimj?=
 =?us-ascii?Q?dgMZtQcijdytXXeYpCgkYhFheHiHzfDTollmW9fJR11D0W+JPBnJ4+ux7TK+?=
 =?us-ascii?Q?oGVzztjR7MC1wSmPRPRRIDIlSFikXosT402zyXchBesFdMizUOvhgLxK0b62?=
 =?us-ascii?Q?5FfSvpoJgcypYQao/1IbFX7UONzezXTQAAMRe/0gc9WySc7M4qeYMiajtBKj?=
 =?us-ascii?Q?NnHEq9nTAQLrQ/GeFigGbt/LXIk50ULnnV7AQGHZXGyXTZDajbjDFDDP3qEB?=
 =?us-ascii?Q?v6cID+1oOQjeRJwIiPULJKKCo8zEnSM02gzGcHr6bM3Ptk5Byo5TFWm32def?=
 =?us-ascii?Q?bkEFOQJcgzvZjqpZ5w/VbVPLPwkXdNAEQfrY6pIysCN9w5eycSB8HOi86eq6?=
 =?us-ascii?Q?RHwgN3etN2blR951/sohyU1gUVd8XsRF3eHMxM8MFqRjiS8MnznPED83oOdV?=
 =?us-ascii?Q?q6Dw5tYeGmOj292efB6TrHKtUz89ZA5rtF3vBgRTErZt2B99x9ILIaYSa0w2?=
 =?us-ascii?Q?Wwv5rJ/zje4VsjXWpNKM2pazxjuM9nrDgCZ3gt8aDlQiWWy5FRuwKWtsbV6e?=
 =?us-ascii?Q?f0K/jkK7XlBgYA+1ZSPgiZ2ptQ+aJC9+wfLaF+7Na25m7Y97GRShzaYtbQmZ?=
 =?us-ascii?Q?Y+7sghQOIL5xeuxUbO4ZSYFOURqp0bAqtMv6ciZJK66ZywmSeER+F6QioOmj?=
 =?us-ascii?Q?XdBo1EsP4qC0CfCEFl5xn4rivVw4yAYQfz5WLgB+Q15N4kRA32ymD09D1CIl?=
 =?us-ascii?Q?sBdTlWXDQfujuBcpxMMNzIn0JBOsXsgGw7tNRmNuDVRsjblNYizMw0abTJlI?=
 =?us-ascii?Q?9ispAOpnLoieVhzd2klDDIYx?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf4e0d4f-aaff-4f36-01b7-08d8f2acc161
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 12:18:27.0019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TvL4rIkVFEQTekNgQnNHdaqBuSI6mPzXaU0hl81ke+2wY0U4UQzy7GLzjjumYOXhhSWCLybwWrOoxkV60m9LOKHVcOJKVEmpsJmMh2pTyjw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR01MB6679
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

This series add support for the Aspeed specific SSIF BMC driver which
is to perform in-band IPMI communication with the host in management
(BMC) side.

Quan Nguyen (3):
  i2c: i2c-core-smbus: Expose PEC calculate function for generic use
  drivers: char: ipmi: Add Aspeed SSIF BMC driver
  bindings: ipmi: Add binding for Aspeed SSIF BMC driver

 .../bindings/ipmi/aspeed-ssif-bmc.txt         |  18 +
 drivers/char/ipmi/Kconfig                     |  22 +
 drivers/char/ipmi/Makefile                    |   2 +
 drivers/char/ipmi/ssif_bmc.c                  | 645 ++++++++++++++++++
 drivers/char/ipmi/ssif_bmc.h                  |  92 +++
 drivers/char/ipmi/ssif_bmc_aspeed.c           | 132 ++++
 drivers/i2c/i2c-core-smbus.c                  |  12 +-
 include/linux/i2c.h                           |   1 +
 8 files changed, 922 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.txt
 create mode 100644 drivers/char/ipmi/ssif_bmc.c
 create mode 100644 drivers/char/ipmi/ssif_bmc.h
 create mode 100644 drivers/char/ipmi/ssif_bmc_aspeed.c

-- 
2.28.0

