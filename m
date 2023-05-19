Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8064570922D
	for <lists+openbmc@lfdr.de>; Fri, 19 May 2023 10:53:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QN0wz2nTJz3fFf
	for <lists+openbmc@lfdr.de>; Fri, 19 May 2023 18:53:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=qdUhKPGm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e83::704; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=qdUhKPGm;
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on20704.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e83::704])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QN0wL2ZBHz3f40;
	Fri, 19 May 2023 18:52:32 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d23hSXGBiwoOIXmrHTrm7m4omHIAcFSR1kGvItkcK365SWNKHhHrtlEh6D9SOWEZUJ/5ny4Tqcs3DB/Zdqy/R2+k/lkyj9HTWrc1jEEiAmM3D0RuF2yRZPjb3fwsqOJT1wMyb2EzSZktsaKyR6/jl5HjH4JO4gqXq1k9tAkC5iemtpCOrnaTmUW7VrujCfziFpduCbK7czrSwf+ht0xfBeHRjjkKgTBt286it5IW05zo8STyMdz0/T5/mBfEyl6GUp0Q4q41qdh0DYlPa2eXgLnZCSEiFbCp0csoXhkVI9hjbzRwAT1TpT4HQnH7rkn9NK1VlQkAOrBlZNHo5/a70g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V51wmeO8qLumojVFynqsw4Q3l2en+UXpIDIKhy5dErE=;
 b=CZvcC65TR719hIXD2vwUkX5lFXj+i62nD41g5JiTVtrmvxhdNNXICFebicwY2ZWfs7XJtHt7SK1k0zWPYkgoAE4zKZfEsHhTrAVUSqp4w/BA5j4urrvQ6KmVGezytQCh0bzypSo6hcfNASBmsPZtKyy1CClBJ3O8oANngIsN6fesfcl0n5sdkd6J0mwsppCgkYYkxBnWNFcv1UncOapn7pMicVZTdpsg+cJcs4InMtk1tVap50UlY7obbU6r9zWtGBC1oBXjO5IDEIeuBZ8C/aYAXCjD2702YB/8TC1jJwCMY3IVP0FJqd7kp34RYeL2qe/CPMQaH7i8iZJFiHFwnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V51wmeO8qLumojVFynqsw4Q3l2en+UXpIDIKhy5dErE=;
 b=qdUhKPGm73mPyXyBAWe4AMhCDL27h5KL4uR5aOdK4k311jV37x7ghT0Xe80LxQTwj4C6WDL0Jyo5hDXyQVew9U2jth4YQd2HufOFE7VQ7H09G8EbWP2PQVS84S6J5CavjIMH2tZAISpY3wiMY/WPhYIvtZE+n6zpN6XzzCKyPPg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from DS0PR01MB8010.prod.exchangelabs.com (2603:10b6:8:151::19) by
 BN6PR01MB2675.prod.exchangelabs.com (2603:10b6:404:ce::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.21; Fri, 19 May 2023 08:52:25 +0000
Received: from DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::e439:70c2:7d19:45e]) by DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::e439:70c2:7d19:45e%6]) with mapi id 15.20.6411.019; Fri, 19 May 2023
 08:52:25 +0000
From: Chanh Nguyen <chanh@os.amperecomputing.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Update the device tree for Ampere's Mt.Mitchell BMC
Date: Fri, 19 May 2023 15:51:57 +0700
Message-Id: <20230519085200.22020-1-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0004.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::23) To DS0PR01MB8010.prod.exchangelabs.com
 (2603:10b6:8:151::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR01MB8010:EE_|BN6PR01MB2675:EE_
X-MS-Office365-Filtering-Correlation-Id: 251414a3-52b6-4f36-e9b6-08db58465dbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	/+oauv97iMolcVc3nYV+bYm2RK5jku4PFLecqLsve66qADlAQZ78NDm+sGabg9hTeyXWnWKyCNvyJiWHSQmcgjtcpXsBUPNBJjKJEWwizqstfDI3OLAgLlhVM0z7ehvKtx3IjmuhjrVVhZLpawE43AqaaJUe0xcksJRNp/Pi6vPxgPzhZXnL3fWaxBnpAb+L/UIcQjqj5xxYUjF3RrWALXvvV3EhZesP9W5ct8/aKZraRUdmcDmaOMYQh8eyv/nO0ilzgV6cnduxTOEwSedHaXvENO98A5aHzn4RsmmRdnuFXiLR3IvtHGvGTF/0FWAj438jzpiv6m6rneFBM1H1sNdu9vQqrWsBn3qwH0XjXyGvIHIOIXxW7kriaJ2CZrr+zuHA9YF3j16FjrfKXkEPslDxiiabY403RNh5o5Y1bzeOtaArcmbcIgNgscWzQqVSQFL/u3j+UhFkbpVxV2tfnr9PS7FQsk53Z6okphOj9QlZjMbXcWaEw5/q6kVpzEFTLMs78i83R5aeIPZiNqL3KMy8V0D37AXYh1CWhh3oyYhcFW/9FnlcAOcbPZl3gzDvoxWSAIcpWc/lZ6kJFaYqmtQBmtqdXp1qgJhcc5W75WthLFCZsnhuhNzNomkR49U/
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR01MB8010.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39850400004)(136003)(346002)(376002)(451199021)(86362001)(19627235002)(110136005)(316002)(4326008)(66556008)(66476007)(66946007)(52116002)(478600001)(6666004)(6486002)(8936002)(8676002)(41300700001)(5660300002)(15650500001)(4744005)(2906002)(38100700002)(38350700002)(2616005)(26005)(107886003)(186003)(1076003)(6506007)(83380400001)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?GGJHjyNbmln8me+tgPq2emzOyKJe6ieazDO1AVZYO07EEvMGZEkNP+jA4pZc?=
 =?us-ascii?Q?AprIzfJ4BENlSpp+3iyoiFY6OiqJbOJ747/epU4qfzt5UU7tA95Nv6MSMCsK?=
 =?us-ascii?Q?i074V2wH3FcRkPk2H4ofDjFyvfq3AHN2f/auXwpAHDKFvi5SQIDGLYIMFvAk?=
 =?us-ascii?Q?AVDW65niwQG9yPOC9TzKpJlIceklMXwbnn2Vb97P2BhDFoEZG38FYP0ll8ev?=
 =?us-ascii?Q?3KeQE3ucHXBWGOl1voHajzfOHchBOhUyK1JLjj73TgHSYoouVKRlAfqzRJA1?=
 =?us-ascii?Q?YRSajCWgVfMF6DF3Rzp+rcSTnnLOoEAx/EvbH6Dx1LF3Ot9bXugNTotQzCvl?=
 =?us-ascii?Q?UAQnee+my0xudCWC1/Tg19Gw8AJ8S9lYncb4j/Ox44PKH9HfEVbG/jKkqYLF?=
 =?us-ascii?Q?XJFbHI6CfYhwHYVclFjogKg/lrO3WwoYfipvcAcmPbADyVduUS/PGbt3Re5h?=
 =?us-ascii?Q?iMgoBmpSr5yWu41n/1vpMCmNEpVLQJ1K80LKebznHsAvjgQuYkk5hzXChsfp?=
 =?us-ascii?Q?mK7lE8Hw69mzgz5l8fV2vLsBZ+Yd7irC6rxIFPZuNjcuUCuoWDM4hLJfftcb?=
 =?us-ascii?Q?feBdls9S1aqInJbBZ39T/C5HOZIVwMqS0B1tzPC+GgOUQi7cT3HAj3E3whEe?=
 =?us-ascii?Q?1+iHJH6ZXnFUVT3T0LVcmt5T9rOs9Pw64h1vkeKjdxzjzl9GsZZ5XVfidfyx?=
 =?us-ascii?Q?NnyWYA7Rsgw8jsJeE37rKuspUME29HXT+GOOyiUKR522a6HK51eEkrNygnHM?=
 =?us-ascii?Q?zY4WvIGjZHCIsUfGKGte6B6IdaAUxl9gKvaVU3nQPxFg5Rt1xmZa3RPG1XV7?=
 =?us-ascii?Q?7aUcE9DEiRBrtRm1YKMAb6j+eDf+E2YZ65RY4O8s4vQvXEA7gZdbOSC1TQ05?=
 =?us-ascii?Q?WT0KQjtqPMWALh4RQrk+cYKYawvxU0ZnrZU6Ke1vZbDZuNsQAWKS9MUHmy4u?=
 =?us-ascii?Q?Xiu1vh3qYjeNgyZvcGeCvUBLT7lK4WXQ/ghfhNNKVRNEJZB+tQK5vPDJFuU3?=
 =?us-ascii?Q?ZjouBstnQTEyTJ1vcmC8CJ2TMZhflQIhIULHYHuH7Aof0klEanCw/RqxA7j0?=
 =?us-ascii?Q?6Vm2zG05gRmG6QngikcwkhnGuADoKGlrcdNV43g00ksD7mMHCFaiKs0S+GNT?=
 =?us-ascii?Q?D1l4sf45rx78+RdvYNJpBT0Q/gd+jcTtn28dyqbvC0PbIChmugetgg6RTVTL?=
 =?us-ascii?Q?4M02Dqj9iyt1vWGNRUoT9I3L//ndcneTQfc5udQUCr/bhL/6P4iZp8gotPwA?=
 =?us-ascii?Q?fEqbfagbL1mJhzPolpkgWspgx8lSUDVpL6twxpdS8WXMURtx8C0tizYcKp3U?=
 =?us-ascii?Q?5e5BO6plLqbdqkiGnOYPW5TJtsIyAZnyGQ+jEAW8voRvKbxi2JEFh5xBiuWp?=
 =?us-ascii?Q?lFhh6fQrKd2Vp0aJBq2mZAXZ3iWWBiT3qkujdwR6DedVba5uDWvjFZbyjqDV?=
 =?us-ascii?Q?CjZFR/oKBFncWxdwl+K6nVNq8Q6wBHW2n3juEu3nkyapE8DkvHv71QQ03Yw2?=
 =?us-ascii?Q?ln3w0GSahzBsqbT7RD1vhFZf3ufTfWmEgpXWs1pS7QX5zWED+ujKpQNPLysU?=
 =?us-ascii?Q?vvSnwyBW4JtVAjAZF9OynQeE3np7x2D1SPaXfcj46Qmh/fYdXI9IoU6IFdDC?=
 =?us-ascii?Q?akjl8iUSTnn20m1IDTZxQEQ=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 251414a3-52b6-4f36-e9b6-08db58465dbf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR01MB8010.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 08:52:25.2955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bxmBzmZiPdc6la6Kcoc5jmBB+l1y2FAZt0JJnmIEf855xKI73opn2duLd8MN8VSyVUaFvSH+e0UjXdrXHy5d+tEUXO4PKc8Vhnfdv4tYQfD4oFyvijsqpSmTHhhF0k7m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR01MB2675
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
Cc: Chanh Nguyen <chanh@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Updates the device tree to support some features on Ampere's
Mt.Mitchell BMC.

v2:
  - Drop 0002-ARM-dts-aspeed-mtmitchell-Add-I2C-Fan.patch because
    "maxim,max31790" is undocumented.                 [Krzysztof]
  - Update reg for mctp node.                         [Andrew]

Chanh Nguyen (3):
  ARM: dts: aspeed: mtmitchell: Enable the BMC UART8 and UART9
  ARM: dts: aspeed: mtmitchell: Update ADC sensors for Mt.Mitchell DVT
    systems
  ARM: dts: aspeed: mtmitchell: Add MCTP

 .../boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 126 ++++++++++++------
 1 file changed, 85 insertions(+), 41 deletions(-)

-- 
2.17.1

