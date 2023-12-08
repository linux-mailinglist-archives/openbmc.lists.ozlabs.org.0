Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F26F809A6C
	for <lists+openbmc@lfdr.de>; Fri,  8 Dec 2023 04:33:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=gZVuvMGJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmcD34Sq6z3cbw
	for <lists+openbmc@lfdr.de>; Fri,  8 Dec 2023 14:33:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=gZVuvMGJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e8d::710; helo=nam04-bn8-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on20710.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8d::710])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmcCJ70RLz2ytN;
	Fri,  8 Dec 2023 14:32:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqE0mp5M5tXq36mV/G9bswn9WAnp6dW4FGpD3mOx/wzPglpH09xhmPB4a+wlCj89D28HuV91KEr9nxIEEDcxoHWu5XBQ6U6UCOCILY90ltmDx7R0tNLVDO7yq4+Z7RVaP9VkKIOvPTzgfThvIrF/oFC+3Fu1KavJYAGW2euIEiVGAcQvnWmn5GHgWGL077v2fHRAVIxVO+WV9CoewvAnbGiEMpNT+qcSw6RPaeamql6WLC69WE+wQaG2WV9MOfzwAGKkWjcApbqXMZq/oDsau35DyGbrYIRH2kwT5KRdg+lW6EeBhpkSNNZ0IBkrDNT+jX5lP2EnE7ed369uuAKyeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bajVwD4ZdB8aHc53zXPQvLjOm7ZP5I+zY7TytJ7jANY=;
 b=X9VPOnCTTF8hFjuzd8PvsX62qd7l7YOXcGaJPwBEMIBBWCIGD/qz/evz81VGMjISEiQ5icmRZBbuarEUwmnuOJ1EbRWNxH05Su+E005oUqt3QiO/0UNGO0/Di/sX2YrzVjNEWjtLxNE1794zxiN1u8XGjwswkObBrIi4BR+V/zGbXtBCOJdjM5bysqOkdp9RbuU99QXOBElZX/k6jgolfQLKAuxWwMxroZP0Dov+2xeQtfP9X/MKK3so37A5TeHlCBn8Nbe0aKEHMOrYgOOzmwhYr9VSh1orZvYjBRrh1TqCxalHPnTnbYo6PEnbO9lnj3teTkFDUTxoU820OT41UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bajVwD4ZdB8aHc53zXPQvLjOm7ZP5I+zY7TytJ7jANY=;
 b=gZVuvMGJ+WsNomkHO/cvWuHU8Ox4KNF9zAQ267wpUe2oBDMFUNXGZqW4GWrfeEtngYDosLjkXgNOSV0GLG6ZNaqmU81Gnp5crCidem5ABYFthCmpmBZxF6iYVDVfXJ/wA6sWFORqeRHQiRQVyroBKfsGCf5U8IR8blgHjMPINlo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 DS7PR01MB7784.prod.exchangelabs.com (2603:10b6:8:7f::22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.27; Fri, 8 Dec 2023 03:32:03 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68%3]) with mapi id 15.20.7068.028; Fri, 8 Dec 2023
 03:32:03 +0000
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
Subject: [PATCH v3 0/2] i2c: aspeed: Late ack Tx done irqs and handle coalesced start with stop conditions
Date: Fri,  8 Dec 2023 10:31:40 +0700
Message-Id: <20231208033142.1673232-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::26)
 To SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|DS7PR01MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: be53e5db-e957-4c65-4f3f-08dbf79e3ed8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	18Pn6TKD6ak7Zhp+wWSSQ6OU40KmzlFjG/niXRfh/vkarDdKMKuHfNOW58dq2ZG9/vSeRM9OfY/Aa3lUpnlxC1dlB2I5h7Z2b8VxWBItFddUEjbgB+CYhaIUgOIpLGv+dxTYMRmoODnyqaow4DMg309cwX6n41a1vZBJ0Awsq/i38D9qVqyE/1DdLokzoHlwXGWEJWwX7LYWHdOqLUmkRpa/KX+mYYCiVsvCsp7NOwZvvFDQEdnFgxuncGXmNOz0ZLQYfCS/4ahSsuBdBJhN9MflQ+7jqT5/aDt1V1OuDborvJa45vJuGaio7KQG18312rxjwwBEsx56DgJTYRNyeh2wcVkcImNKmEH70thq37erqe5e/rpFDncZWk3wA8qbsT2NKTxX1EOTj/kal4OKkIIg83FaIMaebnEspkXzlNroego9wWjRlOgUUodyKfLYwfM4j+YJMX5I3/1TSLRstGwYp1decqUg37RkDuO9edg9Aeq13rOBtGgJXUlTPpB1s8LsXRb1vvFKXmLEMNGVo10HIUH113kAl7NnxVChVA2EAJekhdEHH5J2QK3i9yKfs5Sp5mKuN/FDf8FAoUqyypQP30RLv1V6Z8xcunqrPBpW00y0JZgZ9a21y/QaAjFXniWuYeXjw9LP5bTKwYzduVO5vCOY9S6Y5ZKlFfgnMOA=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(39850400004)(136003)(396003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(38100700002)(41300700001)(7416002)(5660300002)(2906002)(8676002)(38350700005)(316002)(4326008)(921008)(1076003)(110136005)(478600001)(6512007)(6666004)(6506007)(52116002)(2616005)(66476007)(86362001)(66556008)(54906003)(26005)(66946007)(107886003)(8936002)(83380400001)(966005)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?X1xR5eN0pHZh1uAhSSyXy0A5LWj7k4hl7WRijPJlme6viubNkPgymyHLtvbC?=
 =?us-ascii?Q?Ur9x/9tVF7PuE3UfM39W8HnmJPAaAcOiTLx0+mB7Vx1zSYqT6bsh8x+lqOtA?=
 =?us-ascii?Q?UjojgQ6djk36tFulp0FlgAmHiI4ayDXNPMUmCXhsBW5kewOzFS+1O/rrp9Kk?=
 =?us-ascii?Q?pti3ct6cVGG7SYAmrePej5ZzExMfqvMXFn+Kluw501cny8ukfvkOw758zte6?=
 =?us-ascii?Q?hfXO2xgYCLCBBj2jbseuDpnDpxrhfPwsyc3HXbsdVWj+TK4ymuf5TdqGo9El?=
 =?us-ascii?Q?o4xX/dR9L3B4ZFCBEigbB6sWPHUjZvRym/3DPbwKS98yF013k/oK6+VvizHn?=
 =?us-ascii?Q?Iw2nu/W96UPsAY8cic0Ke/TwbsOkJK2yyKbDg9xE9aISK+hH3JbYrDDiy+TV?=
 =?us-ascii?Q?vElGtPPXE+y7Uj7OFXv/DL2dBrgIntORT+yB86sgKIeIsVoHsxIydfJNP48v?=
 =?us-ascii?Q?tju6spFWhns61icoZcoX0dY7xHeIiP68CMFPRXuAlYoUKPn4tYmI2Ng4ALcb?=
 =?us-ascii?Q?jLC0cX+LKTQVqf9Oxy61sfd13AU5lgNPmQol0i3AwfyWa7g3DI4M79cQhA5J?=
 =?us-ascii?Q?loZCOItp1AsTHTlW7VEHLrxOOgSZCDHK0QbhpQ0v8FYNM7AhI1HB4QUKW/nl?=
 =?us-ascii?Q?Ptagz0d4TvCnPRxn9TCtESUaV7HHPRTzXkVXbybf6KwnoWSt4VrATRTG3xJx?=
 =?us-ascii?Q?dlX77/ESgdMjV2UTG3EtIHClwuGonSWz16o4FyOcpasKib8tYy7tWtKRJiul?=
 =?us-ascii?Q?9VNPITtIPnGrCa+0M1Zj3Jho12x5K0ga1WsSHhDuUPH1EL7HD4yUEIa0TLkQ?=
 =?us-ascii?Q?VN+XD8RyUkDL5NPtPZmLL61SeMmJlsRTjOrbCx80Lw8DYvjYtmy7OVqJIBXD?=
 =?us-ascii?Q?vwmK9/3gtShffMm61zekUtpscxO00vDSn8o/16kho70jN9tKjjerl3pwWhPn?=
 =?us-ascii?Q?Q4icBy8Fq+LvpfqhyI/hUlJ2c2Aye20Lr1uOdl/559TsHmUucNfnwVOL0YdN?=
 =?us-ascii?Q?QoDXkllQ15ywZEnG5ppgeMESqPOvIcay7A047sXd14lBpnkDbJc22Rfv6DyO?=
 =?us-ascii?Q?XoleG35HnCPIIFLWV1tGl5BTZaJ9NAlNuP1WaiwKOrBJ2gTCD5GsCbp7G4bj?=
 =?us-ascii?Q?6b2TG/DnfggrHG+nntSztjJoasHAiuVRsLfXH+F6Qe6Jj5sWIRr3VHQgiwwv?=
 =?us-ascii?Q?JNuQjuws/f00lwmS00qBZgMP+48nLM/kQ84BZvI00KzPut31cyAMYEfbrBoi?=
 =?us-ascii?Q?vLazwEqYg7hCu6ZuUAqldEH1AZr0GeNGQsWZot3fSUKygVu3I5V/Esbms14D?=
 =?us-ascii?Q?m0yLgJiqgDWvp7EJdQQ6tC73t84A9SHIsfIiCh742ol+D44mgi/j9OCGlQy9?=
 =?us-ascii?Q?fRfgJ4az3YByOLbmnjXZPmkpdfOcJOmxsrGO3SPNXZg2ZcMiRaHjnnzrqi22?=
 =?us-ascii?Q?lBLB7hYiFJRpxdrkd7o7PV49T0VUbxjJ/q9BjDFiXlXm/ufWvtaVqZPKANS6?=
 =?us-ascii?Q?Qb65RO5wKX8ga5WXf8rnLmJr+WvviBC28jxzUN2YQ4rV3g+nddu7xicVpk8a?=
 =?us-ascii?Q?Thy3tihiN8ai1bh5YxdecgB+4J9JHiFh2z3G4BHjbnViC4AKi+kqLUX6AqMu?=
 =?us-ascii?Q?pMKa/jr2s1/Gj3AqEj7fGr0=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be53e5db-e957-4c65-4f3f-08dbf79e3ed8
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 03:32:03.7359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: reYVh9vf0Ut9jJckx0NRMM/OP1S08MqYWorP4HMiT7wpxEoxRDltJ1p3rckgmPjzGA10Im3YF/bb4XOA+aFV9m8/p47GGX+ECkVbWfVkVs0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR01MB7784
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
Cc: Cosmo Chou <chou.cosmo@gmail.com>, Open Source Submission <patches@amperecomputing.com>, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This series consists of two patches to handle the below issues observed
when testing with slave mode:
  + The coalesced stop condition with the start conditions
  + Early ack'ed of Tx done (ACK and NAK) causing "Unexpected Ack on
  read request".

This series was verified with ast2500 and ast2600.

The prior discussion could be found at:
https://lore.kernel.org/all/20231128075236.2724038-1-quan@os.amperecomputing.com/

v3:
  + Fix the unconditional write when ack the irqs              [Andrew]
  + Handle the coalesced stop condition with the
start conditions                                               [Andrew]
  + Refactor the code to enhance code readability                [Quan]
  + Revised commit message                                       [Quan]

v2:
  + Split these patches to separate series                       [Joel]
  + Added the Fixes lines                                        [Joel]
  + Fixed multiline comment                                      [Joel]
  + Refactor irq clearing code                          [Joel, Guenter]
  + Revised commit message                                 [Joel, Quan]

v1:
  + These patches are first introduced from this disscusstion
https://lore.kernel.org/all/20210519074934.20712-1-quan@os.amperecomputing.com/

Quan Nguyen (2):
  i2c: aspeed: Handle the coalesced stop conditions with the start
    conditions.
  i2c: aspeed: Acknowledge Tx done with and without ACK irq late

 drivers/i2c/busses/i2c-aspeed.c | 68 +++++++++++++++++++++------------
 1 file changed, 44 insertions(+), 24 deletions(-)

-- 
2.35.1

