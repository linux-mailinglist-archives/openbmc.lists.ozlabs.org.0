Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6617B4B40D9
	for <lists+openbmc@lfdr.de>; Mon, 14 Feb 2022 05:30:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JxrqH71xTz3bct
	for <lists+openbmc@lfdr.de>; Mon, 14 Feb 2022 15:30:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=MvcF9ep2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:feab::702;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=MvcF9ep2; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20702.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::702])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jxrpx1S8Hz2x9b
 for <openbmc@lists.ozlabs.org>; Mon, 14 Feb 2022 15:29:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUBaqpFDahQjmumEw8nc53pc1uFz55IBSGa4qSk34juIdNsKn64u8d/phz+LU8uNR5qAGFQZKccYz8S1AMfXc3kYGYkVEnQJtnQqHpfMNkQ9YT+eERzeODiwlSX1Q0/9s8cwfBUZcDRC8lzyD/QJe+hx26dsuvHBe8p7mJMCcD2OLD5RwAgdoFhe5UkJZlotIsYehGLJz/a5Ics+0Ll5qIIBKqIxOGm10upWFWD+xTugQPjm7pUmyC/I3WDTEm1NcJ63hd7l0siUf3BKWAT05zndVRScN7LvMY1M2KTIHAQo7urC8O61DJ7UE6n80UZIdL1QI1EblWcFqYkXN5DgMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwPThxUa4lppSG4WcB365RJn7VMCO8VtnfeYQFpgnHk=;
 b=FdcgRhGa4zHRSXnli0HTBerpibY8/xPCkG3XeHfHOIbI1az+rS51687UU7vTmANQUQtsQQ617kQIapXT8CatjkrC1jBu3kPRm1Ui3ZQoIJkR9X2A+hmHMjYL64xC0HrpE6BMQjX/KNHEfM40YhPhDZ6xN4P77xgML2HChg7RM4wbksxPr+cTStpf7PtLOUrzMchavrfUr3PLpqZtSpYJcjxBBHkv7802rc2clpaDG9UuJuBRfEsO9Z0Qd+11rJzluKt6e162GftihrPfNqjrkQk8zPBEwlCQ+Mo3FVTqra71nPMLXXn4qq3YEJ6pdJ3gkXvJGTF9rR9andnh/O4W+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwPThxUa4lppSG4WcB365RJn7VMCO8VtnfeYQFpgnHk=;
 b=MvcF9ep25JSBQnYjNroW4n8z3C4QI+Zwb/6/NiEKGqGEJbgc/I0W8hajmy4nW3quL42/NKWMcmmzMe5dsZ1+P8RnBZ73cpG2ttTFCB2UWkk36nd3TYiy9KVms0dZyS8NpyS0FxkHgZEfaEx+66V0PbY2sYYjyBSEr1flQLEMazg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by SG2PR04MB5916.apcprd04.prod.outlook.com (2603:1096:4:1db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 04:29:25 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03%4]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 04:29:24 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 v2 00/10] update Facebook Bletchley BMC
Date: Mon, 14 Feb 2022 12:29:02 +0800
Message-Id: <20220214042912.14584-1-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:202:16::20) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9c5ce32-949d-45f3-e1a7-08d9ef729436
X-MS-TrafficTypeDiagnostic: SG2PR04MB5916:EE_
X-Microsoft-Antispam-PRVS: <SG2PR04MB5916BF7E75CB5E41E3A7143D8E339@SG2PR04MB5916.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:590;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pvUsDeMc49np22V9Xj1v++2fa4T8IxLOgEy7KUqIR29WzOmciDGQ5biUZorTChP/Vn7QAxbpFcDZWePQxOu5j8eLhrVg+0ya7o3PmHs/riDTmIE3o4aKZA4zCEXNGyMDFCXBXa14bZjU/OJTWWwjsFVAyy4ftiyghEzLbeQP0kKj6oQwkAT1aKHKofuDV9Z1RM36i2ySpA5JerxCz35ao59buiQk1+HmbDi3kfCWPcfnIDwlYMGo+e62C10mFRG6SpjaYHplcM+13T/t4kfzThjEFM5/a8Rur50bNbkNXVMEIXfQ3GRnGk4GroICCMqdeHCaWhP3aGFTBo++7+bgXErnARIq8oYjjtXianR7sPLHWAKrbrt1/qS+oqp7h2Ge24FNls42XY5PzHq8GUkKsXyf4Bw1RMKuVBBdACJZSWYLkaG25tm0FkIahBBe0rJuV4nJzt+VWiAwu6OKAjKuCy9WQo+0z0hjI3UyscRCNh6tsW2GqXddCr8QYHA2+PhCVANQzsfdbQb2BKdBtV2l94hkTjRAcviD2pkf2IMLlUjR5gBk0z6ZXzaFXSVoCkm6uPwjphkAOCFwIY1o9ufEtym2PksIE5ZL0U/j6xBx9nfyUedEy1EO1rxHsZlV4LeloEf7Pczy5YYnpWpqTBbPTKWRCvQ39kB4GilQI0n/Zc88yD3NNBg1cfe5oJTGm3mwItNycISpTf08ZbAyXITbwI6u682TMqW9h99HooM+6B1Mm2S49ERXBvMnuk0fMUUCkjNNFpfLsKbeoybisb8dOVeuy2OzmR3zJmVh82UroRs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(47680400002)(8676002)(36756003)(66946007)(66556008)(15650500001)(8936002)(5660300002)(83380400001)(66476007)(26005)(2616005)(186003)(1076003)(44832011)(4326008)(316002)(966005)(86362001)(38100700002)(52116002)(6512007)(508600001)(2906002)(107886003)(38350700002)(6506007)(6666004)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iCpu02sR9BRQTnYnrBBNq5GEOWWX92ab/N/x24kuJlWxiQNKX73wC04c1J7b?=
 =?us-ascii?Q?CXRdgK7vSNRFAK3pgAcnKT7jn/90VLdlp7XyTN4lA9mXzHLIxB3A+n5EIAnc?=
 =?us-ascii?Q?oVJsCnmcvXaVj2LBATT8pnaX6lgx7iJWMmHhCQbaTx7eG0+RRxsiD+uGJqL6?=
 =?us-ascii?Q?P/QLbGObXaeGEZUH63RGegBQ3YkhLUsoggsa7SkW+sc3I5VAufnOy1CJEZDv?=
 =?us-ascii?Q?WCf02uEZuXfhwfasDSFNndQNhCcAMiSDz4ZTtjR2MtHQS+rkCt4X+R4/Hhtm?=
 =?us-ascii?Q?bAjjj4KEVqEUphmzmq2iH1Q82oqp8Md4va/qFb+Hm8S7gRtjT7zN2tt8SlUE?=
 =?us-ascii?Q?LlCWA5ne87oijd/p0oP1r0EDj8oqo/sPcfxfpZbOavQ/Gk9ckqFMvnZjtoeV?=
 =?us-ascii?Q?80zrDIpXNtUbtaJhVmarCkH35wxiCU3WU+sB5gz53/75gn9u5Pn2c7zByeYi?=
 =?us-ascii?Q?2IsqPOBZxAz/2XOHQDEFirACZ3PAWZqJXBzj2TUXjIb+rUDVLnIpb9sc5BcZ?=
 =?us-ascii?Q?CEo56VmhNbWgiyZ9Ng3Y05TkJSssJyZ1174eC9KlfJl9wNPtuuWGtwwp13xX?=
 =?us-ascii?Q?LiR9o2KwQp0KG1GpGvihWwJyWgacrT+Lo8ddmWNNNrwLPEVSbshhvRie9gQd?=
 =?us-ascii?Q?Zh2YizHIP/43h5BhgcNk8p7zHZQkgbRwvwGtnClfKdR6CdLEoWRE8U0wwm6m?=
 =?us-ascii?Q?lhCZX5UHngn8Y1uzHycinpAQI42+QDiZLtUbbqMTJ4pGwUMMQ3v2wbF2flfv?=
 =?us-ascii?Q?wiz5L+jGGWoc93ChWRYy224HbdvBCQ6pm9NwtqjI/8cQNREIeWU+G8xqw48H?=
 =?us-ascii?Q?iG4pmhJzyVl3NfXR84mCIGAdHdtyjGTIl35zpwXyKATbuifIU3uDy3wXUUxj?=
 =?us-ascii?Q?xPkjpbeby/PIi9lrwRSfXUnyuTEj2A6d2QuM43QLBVNmLHOCtXUVHGcOr6UX?=
 =?us-ascii?Q?s0bTywOaE1jt8lcU72nDe5cmnpK7Y2ptPRAGWoZZerc8NG3LThevuRxytJpH?=
 =?us-ascii?Q?v0YoIWnd+wAW6+sqaVWPn0pTpIJmEQySdkk3aHjkG4vmmvu1BdlVEPexcGqQ?=
 =?us-ascii?Q?NirH4CTOT82TEqAZv+lBR9UhWIkbeYQG3H0l91IyVSntrEkvGs/VeIn/z137?=
 =?us-ascii?Q?sHInPZxwKgGbgZJD85brpTORRRbLHiWGG1WNQe/lqtX45tqQrxV0pbcoQxVZ?=
 =?us-ascii?Q?Y+WQ66sGEVXifJVUx7kzhTBafGgXS2Ef7/u56gYZz2omh77FnXu5MhvhBoW6?=
 =?us-ascii?Q?DG79odXABGcORBLrVMFl+0uDckQ9xTxhFIBqaNBi6mTaAhaWloVegILFKH+2?=
 =?us-ascii?Q?g2SU9xWJGNmmho8VMUT3auBmCxVUAwRD8qJQeiYuTMIEwyfp3tMHl5XfQGQB?=
 =?us-ascii?Q?aUEF0aIzix7xqMsze/pn2fBJzMsQXeMbdvqF0tPUuWTrZ3Ma/pokkRj6wE6Z?=
 =?us-ascii?Q?QoB9rYoUpTUHPeWhN+YRDB9bGcw8oHUoqdeN8GGelQ8qoOALKBvpG8OmUR89?=
 =?us-ascii?Q?+aqVUU+sFEZ5NHLp1q0h9LbbRyqreqn1NZEguy5BHupJXCeP3dWYwZ2KYisl?=
 =?us-ascii?Q?PFLZkTBYdKI5wBA40Q7shXG9BvMrW3bIvRuwF8/mWTM67Bb52hdWx2d/5g+J?=
 =?us-ascii?Q?AnYcZiBJRs0Xsd9p9ciUE+k=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c5ce32-949d-45f3-e1a7-08d9ef729436
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 04:29:24.5008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AkVjaVQLjxZAdlbuISt27Pk0yYZytcp6Jspm0MrlKQqSozmOw8QUzLVdxqrF9OFJDALR8W2Ip4bx4d9B8qpRQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB5916
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
Cc: Potin Lai <potin.lai@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch series update Facebook Bletchley BMC devicetree base on EVT HW
schematioc design, and rebase SLED numbering to 1-based for OpenBMC
multi-host.

- GPIO:
  - adding more gpio line names
  - include interrupt line in io expander for gpio interrupt monitoring

- SPI flash:
  - adding dual flash BSM module support
  - switch to spi2-gpio on spi2 due to unstable signal issue

- Hwmon Sensors:
  - adding INA230 sensors for monitoring
  - fix ADM1278 shunt-resistor

- MDIO Bus: enable mido3 bus

- RTC: switch to external battery-backed rtc

- OpenBMC: 1-based SLED numbering


LINK: [v1] https://lore.kernel.org/all/20220211014347.24841-1-potin.lai@quantatw.com/


Changes v1 --> v2:
- update the details of new added gpio line names in commit message
- add battery-backed rtc information in comment and commit message

Potin Lai (10):
  arch: arm: dts: bletchley: switch sled numbering to 1-based
  arch: arm: dts: bletchley: separate leds into multiple groups
  arch: arm: dts: bletchley: update gpio-line-names
  arch: arm: dts: bletchley: update fmc configurations
  arch: arm: dts: bletchley: switch to spi-gpio for spi2
  arch: arm: dts: bletchley: add interrupt support for sled io expander
  arch: arm: dts: bletchley: add shunt-resistor for ADM1278
  arch: arm: dts: bletchley: add INA230 sensor on each sled
  arch: arm: dts: bletchley: enable mdio3 bus
  arch: arm: dts: bletchley: cleanup redundant nodes

 .../dts/aspeed-bmc-facebook-bletchley.dts     | 303 +++++++++++-------
 1 file changed, 194 insertions(+), 109 deletions(-)

-- 
2.17.1

