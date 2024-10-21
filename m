Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 030E89A5EC9
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2024 10:38:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XX7x9469gz3c4r
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2024 19:38:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10d::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729499881;
	cv=pass; b=UBnetOY0zoBUluli042wpZajjgBwHUk5Yo3Sn9gAvKEL3W7lImWtlMMjZm4sECsPJRKB6e5DX85c6cEenO2VUJf3Y+pk1QINUtEfdyFVGy651qIrSXpnBFAbLsYTTUTTNgJlcNT0RQ9o5KJcZLd2GFrS2Ww1Un/jKWGSc/aamfVuTWHaRVVA+UjC5txsaUSu4SdIpUooZeDISaB+iCezxn3elpbmSHtURIrMvf49idQB1CabI4qY/WC3M76TqUn4rINyxY6taAAkuI5/71eh0gbaGDBSnln4zCSuzWNEw9pFtrD8XmXq6uNjWO/qssK9SpMmu6u0SfCJUaFUtX3NnQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729499881; c=relaxed/relaxed;
	bh=f287ZD9BPMTRzYup5wYBnv+G9/lmk8/s7J/1DMvLV6w=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=dedNAocUGOet6Dp/7RQttIZTzsgpR8qUY5PelL8BVgSczYi+4wdtog3OtaLtWPWK5Je+tsvAUmkdNYrUqgFLtUj9+wfatShRyvEA1PK5y7GzJqkw+uRIaBneQj/tbHpdasPxrAlagJneBbz/BAPyTi+nvx1BPkouflOqRx3NpBj8fzH6TeGlXUd8diHzMq+JM1UdwG6CZikk6TUTTALcruOwQkbOdxfPsN+dOn760QB9J1EfLXEVrQBaZLRBY2KeZk2e3hOU2R0A90xeJVdf6MSB2627gan30944qx5RV/HZUmzlGjOJh3zSCdDiu4HmSMObrvK/yWheAiIKWGMCGg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=RSvGwFm9; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10d::1; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org) smtp.mailfrom=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=RSvGwFm9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:c10d::1; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazlp170120001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10d::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XX7x25fQLz2xrJ;
	Mon, 21 Oct 2024 19:37:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B0g0ZF4UsfYrdBKEjHMqilJZdzDpoGMpFZb8z/MMyF3GRECKp0n68BUt4CPCXqcDIzynRphzD9j9Lv1ec4TYfWZQQZaJAu2/0nSNWyTquvISsYk6ywTNjugEhXmYOjNsZScOyfujZK8GcvCj0JFQDLY+/9cOc0mciF2PT1D6oCXAz/SnNbrgLxSMKCRlrucgELir4SSnFbpRxsfso6xWlCK8s7mOPkrrw2vUTbO+Cjk8vvfxp7G2Xv9jCNkoPx0tFDkcbC8KoT9TY9pzSBHERREnqM8XMlSY/WYYHN0Y4HaZS+2t3xV6EBZiaPBhj6z8Jgb5Ig6Q3DqUF98fWV+twA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f287ZD9BPMTRzYup5wYBnv+G9/lmk8/s7J/1DMvLV6w=;
 b=wFkeXgRtHokT2dJXMns0xdbE1pLxhgIUat5sNw5F8yzbJQtHJKTbXcw00JZkKrJw1RSpTla/zE1twh/RH5lYqg0P5trZ23qpMFsVeMm3nihnvKIx8UXJDaz/o61xy52bat3pNtDltjuoz+OtTJIztaX88h0kq8zalorzDtd9vT33WHt9/pvBgIqtbYNVU7iaaYpYBKcMUzFNSPcPh/ZBAY436ufjN+zm7z/OMmTQhNaKJaYZpXnhtp2WwfvCtLqme28mR0GTnjxKWQZW0GVbXAaT2gBEQv1Jt/POYsFUSDuNYbKatR4n8SCfqYm8OQCHL/t+vR9I/a2aRsClnOZfrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f287ZD9BPMTRzYup5wYBnv+G9/lmk8/s7J/1DMvLV6w=;
 b=RSvGwFm9JeSpT01wxJG5xuOFmdxFyzYUSEh6JexN4Q1UJ05yd969lzAfZpaKi6IHDPTULPuBbbI6dwUFiqEtuCW/9iRIL/ly0beZUnvfP5eEoUMsYEJjJA0ApQUypao+ap7+jTKXj/UZ1AKDXb1RGoQ3o1aPo80M1V+w5zQeC4E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 SJ2PR01MB8049.prod.exchangelabs.com (2603:10b6:a03:4ce::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.20; Mon, 21 Oct 2024 08:37:29 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7982.033; Mon, 21 Oct 2024
 08:37:28 +0000
From: Chanh Nguyen <chanh@os.amperecomputing.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH v2 0/2] Add device tree for Ampere's Mt. Jefferson BMC
Date: Mon, 21 Oct 2024 08:37:00 +0000
Message-ID: <20241021083702.9734-1-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0181.apcprd06.prod.outlook.com (2603:1096:4:1::13)
 To BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|SJ2PR01MB8049:EE_
X-MS-Office365-Filtering-Correlation-Id: 97756adc-4bc0-4eaf-2cfb-08dcf1ab98a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?3VR3Yl60wGKo4JzoR05WvnW1P/sCTzetfyIOUG2K73mdjz+kLRj9sDzXhSWs?=
 =?us-ascii?Q?xGVbYDFAXPiBEhHO28/bb7NBa45hZmE/lwH7JSVCFp/2S1Z1B+MCSDmdkFEJ?=
 =?us-ascii?Q?APlT16P5oURMCBJ2NGhuwmF7MtoiNgZY5+YasDHlcqA+EqtO1tUms2Ql8GYk?=
 =?us-ascii?Q?LmzWJnk858vp4H9meerdHJFWD3mghn2sO0cCbkAGs7Jh6uiNUgWzOns0M6+t?=
 =?us-ascii?Q?WVNY37pkqAwzTK+sUEP+t40a1KPIAa3hRNUZdQ4bm1cpC2j1hqdANggGLp7z?=
 =?us-ascii?Q?W5RtDHnr7uIMW0eTi/+lX9x/dO/bbg4mcQVOTuzjzVzMkXbonabBqpF8VO5I?=
 =?us-ascii?Q?kblF9dK4M2D600f0k+HMrDCqI7LzDfq/C90AKALDqK80YVnKCMrewSJcvWrV?=
 =?us-ascii?Q?aNNcomkjJ1b0+7u5PZVEoiclzdzPDa/RviSGEkPYgfmnWHWLsXYtk8pKAw3k?=
 =?us-ascii?Q?tJ+CA9paqyh05pnjDfC0EFD1eL7HIsCu9HMgu+df8uSwwPgS7Kn0pGndSqna?=
 =?us-ascii?Q?SV5K8vBhWqW4AJGrUXa8GFMeCW6195kzFVYRghGibdERau8dJ6WAkfqPr3ts?=
 =?us-ascii?Q?XqRXk5KS2avAHXamtLmrZJU28uD58CA4V5wq03lMMzrxnKI/eIZhR3DLa6oi?=
 =?us-ascii?Q?c0HjEi03UAh8jba9cdeMGt65r3YM6wRuRMc4aRWBFW4XItTWFXF2H8ypfeZG?=
 =?us-ascii?Q?3ri4v+AiSKmH/CiCbcUvYddAJxJP5/TdkDTVWu2EbYw4k4wmrPj5EgEENH6/?=
 =?us-ascii?Q?PTaxhhGukPU44ctsiRZoGNfOrWKMQVhDN+ikFF/MVz3JdO8HEaeZYKJWgiFr?=
 =?us-ascii?Q?ME5ZL2rsDJ6JG9iFdHL5FL+2eCbOGG3qU64XK6FdALojaQvZbFJxI1lJZtwe?=
 =?us-ascii?Q?BIA8hrHOIHjcx3xjWyn9+b7BB38V3UvUvq0zIL+aCCJjDjyurbpv4SHfTwLT?=
 =?us-ascii?Q?CVOQSdevCQn1BqTrWrg7SAEXi5CcPodkytX27vEY9PULweyHuJMVCGZi8izZ?=
 =?us-ascii?Q?anQzom6ceWwID30BkzSl1pdcK3Rba8iDBjoL7gyMl5/srBM3PBxEg/DCOsHi?=
 =?us-ascii?Q?pJVZcUH8cr6zh5SOdwMdLBjNekYjeJnBk3HiEPrj0o7rhBPkoSJddujw3WqA?=
 =?us-ascii?Q?Z/kD1FCB90q4Pre6e0AvUtaFctU2Z9REvzRy/44Y4SSrv4Y4bOU8Ywv+F6SA?=
 =?us-ascii?Q?uAR6llkoURqGBmsPOicVyA/HI+WohSA+kYQwlspZ0ye3t8k7LhC6D56PiaZ3?=
 =?us-ascii?Q?+Me8tBDbhY1nfgD3LJF6NhnC/FhFp1EJaT4lhua6B6GzF3VPgMLE//bG+oOA?=
 =?us-ascii?Q?LhE+/JJfENZlQ8Egy9KNa2WFx5O7NwfqvBuBdft0bAUhhL6/lhgiTMtbKTZo?=
 =?us-ascii?Q?Zsth176ykSbHPwkSDS/uhdgRLp22?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ALZTWfBBUV3Mbp5+gyWIktyIvsRc9N9f4MUVkTbzjDEVdNfujto1YoyzghVF?=
 =?us-ascii?Q?fvNfEPPEDeAsDBaE3y8Dm0MWq0WW5lmrs8dvKlhBym+OyjcmdhahspZbdGms?=
 =?us-ascii?Q?fmUAphkrcaz8DDL2xtRV7VP0fZKzmETBokGqJJ+gxiGeNsfE8kzw4M9FefSf?=
 =?us-ascii?Q?m7Yq0UClrmR/drPJMjVayd93feNDGXD7RxIVCHodPptOsKA7WYfWKDnyj6tQ?=
 =?us-ascii?Q?rNB0kg69jBl5Njtub4ipIORejjFtNtoFfBUJ2nJISt6AjBjMTVaAeKGLL6sL?=
 =?us-ascii?Q?L8Wvt6MFdos16JTW/GW1Dhp1k6wYadpo0A6nvi4qoZTGkqZ/DiFr5y60CmJY?=
 =?us-ascii?Q?fCvaNjlsQe1EzkpwdVIX+sIy71bZxK12TbPdzMLzO/70Bpkrlh8rZr8U6f5Y?=
 =?us-ascii?Q?zz2duiUO6T0hefXuchgwOWsClE7xCvXt2lu7baRsKtPWpN5ydO7HusY0YUah?=
 =?us-ascii?Q?zsoRbd3Z6qlg1Xps2TECh2EBuGGp/2jXRlN+irQvTonSae4KCvGjja3VQwxu?=
 =?us-ascii?Q?gYc+MhSoGLCPZMxYqkoQm+Eey4s9skMAAFwv29xItN9l2RwVxEQbDEmIdiyP?=
 =?us-ascii?Q?GygdfTjN7E/u8VVh48lCz1Mdm7ojOsdTtBEUjS02SVUGhyJFYdWQ3etEmLNe?=
 =?us-ascii?Q?3M074MGcbS47A99c+2V5r0qiDpdyJAwGYCMAORXxVKYYrWWdoTaAD+0NpSuw?=
 =?us-ascii?Q?HFOBZIqMmotdSJbwPK41xtZ4xgsMZEx1/IzEfluilqJC5SfIZpD8p2tmWEQV?=
 =?us-ascii?Q?iAitCyHXyFiFrxtkCZ1XNKlh6Ul79ZZE8IU/lK2pAqCHPC3l4byoLhfGCcac?=
 =?us-ascii?Q?5/2LKilmhPbcfXCKTOUU7Q8jkRymFh07TQqtdkOLp9xpwXhVjP8VgWNfnd5O?=
 =?us-ascii?Q?K9JimK8qC15odMFbCnZL6vZddpJVE5+JEh5TUWDM2SbUs3ZlhS32vrxT9S6U?=
 =?us-ascii?Q?DXtvBI3YMd2vyGc5viP145EWo/FuEvXHlP9358woDC9Ta3jjAk6GraTRKTGw?=
 =?us-ascii?Q?yxT+mkGjxT2LU/r9GfXol3PArsO6WalwThTZIYfQfZgpfM/LrImEPSz2AwDV?=
 =?us-ascii?Q?BZ0wjxYgXcX7/3rCp90atsRSjKIq5AVqu+7ztDu3lXSJstT24mgdCqr/dyf1?=
 =?us-ascii?Q?0/kegnSordezt3bCZY93ittpUFHSQxkrqQw3xDnir6xizeX2GncjAcy/EG1d?=
 =?us-ascii?Q?bVtvKj+f1NurLBr0P80xX6Y+Cn7vHDGNI6OQjz5s26g3kYWI2nwDqDKYWtoU?=
 =?us-ascii?Q?JSzkc3JdLLwFPahJt7SH008jtpuNilPtPXunPgxlK7PQMZ4W3xpc8owef/1/?=
 =?us-ascii?Q?bXFxOr8Ix7dWO7K6eqidgbxUF9Z5TmKZx0lJENXM7K+Fe3UhTRDPo+N4xdOu?=
 =?us-ascii?Q?jcqXRSxgeQhKjF3yOF8kX1cItUMxcjZnRxRjJbtL/YaDCPWS7aeQIVW1BCT7?=
 =?us-ascii?Q?LGhLf44vgydlIEhFNUWO2zGbNZqwlgXKGSjkBqto6UfOVNxLVWbDo0qLUESW?=
 =?us-ascii?Q?l+ezXJi+2vkKPvYUybk3dtMuJ57+XXV3jMmBar6JUpzLBzZj5Fb0MMLZhMfI?=
 =?us-ascii?Q?0lPapJFmJXi5g0VIftXoK/kICWh3oPhP9T9ukczE91WjoL35w28FxuzQoqYH?=
 =?us-ascii?Q?yPMoKrHWEAVsZsAsktgF9Uk=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97756adc-4bc0-4eaf-2cfb-08dcf1ab98a9
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 08:37:28.7931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PHh1ew+SZDp4bcqNe43zVUJu4oMjV/954tyaEPSwCKJ7MhNGkNPwDYHpcsBv6Tj3EW+VmLrgFbx/gcLjuN1Gw8R4A0gfBVkjcr0uudpXseu+3X11uoVLYjfdTXKLEA20
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR01MB8049
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: Chanh Nguyen <chanh@os.amperecomputing.com>, Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Khanh Pham <khpham@amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The Mt. Jefferson BMC is an ASPEED AST2600-based BMC for the Mt. Jefferson
hardware reference platform with AmpereOne(TM)M processor.

These patches add a device-tree and binding for the Ampere's Mt. Jefferson
BMC board.

Changes in v2:
 - Document Mt. Jefferson board compatible                      [Krzysztof]
 - Remove the PSU node with pmbus compatible                       [Andrew]
 - Remove clock-names property in mac3 node                        [Andrew]

Chanh Nguyen (2):
  dt-bindings: arm: aspeed: add Mt. Jefferson board
  ARM: dts: aspeed: Add device tree for Ampere's Mt. Jefferson BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../aspeed/aspeed-bmc-ampere-mtjefferson.dts  | 622 ++++++++++++++++++
 3 files changed, 624 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts

-- 
2.43.0

