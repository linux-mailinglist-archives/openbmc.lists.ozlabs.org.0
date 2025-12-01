Return-Path: <openbmc+bounces-957-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B94CEC9998A
	for <lists+openbmc@lfdr.de>; Tue, 02 Dec 2025 00:34:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dL0bv1HVjz30dt;
	Tue, 02 Dec 2025 10:34:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c110::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764632059;
	cv=pass; b=Bpj30X3bOzGhFEpJhcvP0vmqdY1FBOdXbEv6B77PRAmhsSs0lzUPPzwXJ31/TlJ4I3d8HSIG34DRwzYP5nzYw35VUdy5YjBIcZhXwLuOHtSN5mT6Xy0dqzsiH7IT3T6v/GH6v5mLhxc/wRI3xK0etn2BdGGoWBYnyC8Mmn0ZhKoYQmBzbeN4lJ2ZaynYYQpdRhT9sAdxsNBqhmsfVrlnh6TzXz5QK/2vUZn4u5B68LRW9wUNTu9QaiGmd5+QDFj6k+zWPtqjyWD1EJ22o/0z2V7e/YrPXiBVtrmq3IKvd2Md5AduA2Bd4gkflbL/3/yo3Lv+Aeit08dxGzdBUZFdKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764632059; c=relaxed/relaxed;
	bh=FxVR3Sf3tOJx/q6tdxp1gAzdhV8XDrK6dyLgO/SsVUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lyrFim9ysxiSv8tMYipRuTz8O7DFFGH/l5Gne8OYJ6bgx7SAedWmKCAVu4d7PdEpPySNgM559EN12yuMUWLoIF3AnlNAfNKuh4FKkwosKyN8aOCdfjyXLGwF7h941Z4a1MiZ7Y0UWuoYH5/svnf2hnHOzAdZWE7kELCLr/kOM5nXN1jBDOiE5/uDM8LNGz5LG4UeRjuNFmur6h3E2ggCwatrcnaBTCgferKxJqD/cY06YDlP2QnukmCdyylW4gRrYNg2h5Yn63kj22P4VF2hztfpTlCqQ7mgjFCliMH/1+tVQPoOTx2cgoBWo0kAFPtOrZ/WY7fi+z48e3CJW2oT+g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kN9ac7dS; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c110::1; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kN9ac7dS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c110::1; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c110::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dL0bs41jWz30Vn
	for <openbmc@lists.ozlabs.org>; Tue, 02 Dec 2025 10:34:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xGnVJgxElKVkQS1arQF6w6TCVsd1NPqLFGciOp5F52JtoWrsLD0hWsnKOqmq7QAc7jNB+sE/jBdisYFx7If7svOCenRQHCSYFUMob03j/vPBkHbWd4LPxlKHtaTLBCuK5ME9tJlIUnKnabz6EcsFmcS0QORNihD5NcuRcmz7K6uEScKPp4sAKBhjtJHv9qPF7jK1aFAuBbWSkAZj8Zut2kHSRk7wFjzMbQHM3D96n4Ez7tzsRA786W0XtSJVIQuz8tSplQHyAOD7zJk4PcdjH/RuB1+YpCbUrLyFAYPvCVl8WvOwdx68FkhPt6gbRbZDDj5jMvlsxC24X6HOZ96pQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FxVR3Sf3tOJx/q6tdxp1gAzdhV8XDrK6dyLgO/SsVUk=;
 b=Xh7MV+ImNUkdXNN2XD/dWgBcaU9615Yi8n9N17iMMcJ7ApxtgnkBJHMqMiAf8yXczUzLXiuRl3sbBeqnCYcbqZ9WXhs8WxnuXZ+mXOrbF0Wllx6rAQzLGFoKaDqn0qfTReT7Yk7gbV/GBXo8D4xTQIC2T+ZpzVXJ/TlQcs06XR1QASOKPhZFUHng1kVQKKFEHzJA/Nn5bElEpygm7KDxyQnYwwWbFms7kH1a8evz6H96uV1TFRXO3q8d9D8A4SBUeiwAJD2zhp6GXv4wjNeAVfL1Psqxorg7YND0QdiSyUsfZjZ4EGsRpQ4r9imx+edQc0G5kAqWYilQjHWtJkbv+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FxVR3Sf3tOJx/q6tdxp1gAzdhV8XDrK6dyLgO/SsVUk=;
 b=kN9ac7dS9raqOOrPjRdvF6qq07oe47wiB3B1r9bf2WXAlz6rmVqkWnbg01XvEt3NbSCkgfPbTINE3GlOOF8j4eWxTMVG3lwNPJqhGpl1SyF9TFZ6KZFBSV0KK3PesGqWCt4ASyAn7L/hcJslE2W6zy8422XeYgkRDLlpkxPrR7sfjsyKPOqbtPyxFmI+Hf+r2NOmMXBztoPnIMDL9Ee/JSTEd4kE3kX2mltT00usjT4tWNSLSjJXp5CTJIPhf/8Ba8DcocjlhNTb98Pa5sWNSTzC255ZZoCCKDdgaoblSPSF8N070+q52hoDta+eUjWz8qvHlnyw4Z+URi8eDyZTyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by MN2PR12MB4472.namprd12.prod.outlook.com
 (2603:10b6:208:267::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 23:33:49 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9%6]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 23:33:48 +0000
Date: Mon, 1 Dec 2025 15:33:47 -0800
From: Marc Olberding <molberding@nvidia.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: Re: [PATCH u-boot 1/2] Add a new board for the gigabyte msx4
Message-ID: <aS4l24MfyI7XOUbY@molberding.nvidia.com>
References: <20251121-msx4-v1-0-fc0118b666c1@nvidia.com>
 <20251121-msx4-v1-1-fc0118b666c1@nvidia.com>
 <9e3bee690272f89ea0f25120c95f166065a3d888.camel@codeconstruct.com.au>
 <aSZYRPXSGcHImegq@molberding.nvidia.com>
 <4aca43d2539ce4452a3911f7fc1dbf5abcbe5de4.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4aca43d2539ce4452a3911f7fc1dbf5abcbe5de4.camel@codeconstruct.com.au>
X-ClientProxiedBy: MW4PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:303:8f::31) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PPFDAD84AB72:EE_|MN2PR12MB4472:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f3f9009-314d-4a88-132b-08de313213fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SuAwiKKK6Gm/ymMnGovMschkBg1M/gf+iRUs6nonwoVq6QaHjP5oazIzoCOS?=
 =?us-ascii?Q?iKKGDwAawsBcBZ3HYIE1FvPhCsL8Vg/wCktOjHL9AiQBIVBDaELXVU/oZrEB?=
 =?us-ascii?Q?XeIF28bGmGJgNIGeOmbE42wN+N4ERdZGiRByMIy52/Lck74v6ZkC71BUeIOa?=
 =?us-ascii?Q?fVws0wokDlERfFc1ZKEHoxKhjrWuIgOeDwqz7aM6GmCrxWHaOM9rm10NEdnC?=
 =?us-ascii?Q?w1KgmVe8ZgiUqGG21aGywkk07HMfDrOcKFH0sNiWfWlL1QZdxQeaarcYD/n2?=
 =?us-ascii?Q?Nr7Pl+o1Yxpy8+g+nf8O9zRDGBYrzGw2wd1b1XulDR0qjdWW1pz7saUStzNJ?=
 =?us-ascii?Q?jWjDf0QrD7O0twnoSZDXsec716m/R2qW7mM2o/95PneLODTeSxuE7u5qJfi5?=
 =?us-ascii?Q?jqljm/rfy/Xt1Yy0KBCy3NOcmEjNSzX88UnQytxxsiU343is4FINtp0RDBER?=
 =?us-ascii?Q?A/D9fbAdKhPCPGe8aKKdtjRFUQkqkCTtYP40uyp2Yof5toaj4tecQ7xzLmzF?=
 =?us-ascii?Q?0ITplFfhO3TyTZNXY3KIXsCBRXRwcE1kuGtFKyGomzfoH/3OpyOeh0Pc51mF?=
 =?us-ascii?Q?7lv67+sK75L8Aqog+DkU8Q+QIqRZV17HRssZs0Pvj5QB+A9NwZ8BGhIXx31M?=
 =?us-ascii?Q?ge04cjXKj2AnJu1BX0JEeob9MYpY5Q12yVYQ0Fs8AOw7oouxoeHyasavblpT?=
 =?us-ascii?Q?0eQyZ1jRVRM1k5iC5yOm+P04ioWdX5lmgz60plV43oy6NyXpJzkCwWRte703?=
 =?us-ascii?Q?URRr4+P8Tpro9Z/VHIKbMvsqjbdkNcm7ABI4DBJWTukpVwCu6DI0S3Se6NEI?=
 =?us-ascii?Q?H4rJ8ayEoF3X2OY+5Z6Fs/IFe1yUGlskVrKFEuTEEYej6Zf+6A19I+YszeWS?=
 =?us-ascii?Q?oP6IfcOr6VkiwgsA5OLtfEHQGncBlkMiZvUCnuVlzjvMQtTAvTJqn+ow7Tlj?=
 =?us-ascii?Q?UGTaMZ/WZIF8cthzzOK3zWkCzVON/JIEYdZ1Jrk3WB7pHZ//q1TGg+sF835C?=
 =?us-ascii?Q?phw1B+dVdjChKIHSvDYHHNj1mM9E5bmQ7j+NHceYw8Nf8kmCWcJJIXYtI5O6?=
 =?us-ascii?Q?OzwJZ0U65kVGW0TiksxZvza0FO4tQu9+59QvEIeZ4DXYkR3JI+N6Dz9U+VmN?=
 =?us-ascii?Q?pqYLiNFoO10tYqdtsl/9sR6TEvd9iQ5bqEdIciD+7odjjH74g5aKb/ixM4tW?=
 =?us-ascii?Q?RY2NCHqzpsUSIeloZBGCMH+MvME7ZXcWOrylXpX9EtzfDLjN4z4FvyN+ivBQ?=
 =?us-ascii?Q?0moSdbvI4EPNN56nvnCekSOBxjSYpr4XHcTFbe3+VMBkLQAeAhmdC92FL4Wf?=
 =?us-ascii?Q?87d2CWsoTt9G1vBHK77Qtncw18EU9tUww2OzQGWLRVJoxklfTccfS0lk3R3y?=
 =?us-ascii?Q?QxmxrjRc7kmxn36qnhhprJs+w0/Z+Grzr4FEbYk9DppVV+E4Tm4E1AFrZOqw?=
 =?us-ascii?Q?6whzFJbYSjIX7ZyRrvisgd9cpt3hb6qE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QEMV4jXYsSNBnpZ5Yo06t+kgxA/t5QprIx8b8mGM2QyHRB+GrCQQfUCjOQgR?=
 =?us-ascii?Q?H3V6QTVGBUk7Womyo0Od7AYLWXfUCKI8l++hl5qkx9JcCfBwpYPb94fy2Efa?=
 =?us-ascii?Q?tpzIzHM2DdU/cxQ41KkAGBTadXRqHn0VHVgUjHIcqIs2N0eVRA8qlYGuVgMp?=
 =?us-ascii?Q?hvKXXRlocqJ19KooZS9C9VLeBUvn1PaB2QxUioxe5MpdS+crpVedqbVbAhFw?=
 =?us-ascii?Q?NRs2b9ZXSsIJkjJb8Zc1Zg2OhO9mTTo4ICMgHbPd/0GMNi6JY7CGHr5SQWwI?=
 =?us-ascii?Q?qLzVqWgQMkQL8Dvyc9+ldKaJ3Gx8ycSPW4XG18jn7CHIaJ8zCcd9WRz8wv1K?=
 =?us-ascii?Q?EAxkuNWB+EfgQa1GIQ1htDOp4wE31jvUqlKoO8bIVRqbUrZCyJUycLJSD8BC?=
 =?us-ascii?Q?JVlzh/t3JUknppUkeMbVKU9m6y6TNH5PJ71xTPCcVYsalu2r+Hdz1MnVT3U6?=
 =?us-ascii?Q?3BpAFQxN5yHoMxcohsrEcIOGh/ZFt7gEWcN2L2GND/0+4G5snGmDmTVb/qCJ?=
 =?us-ascii?Q?w3OZznWtPW2NNgfapOUYSgKU94wA4YW7gScCnrg6HHl+a9fRc2ZN/Du2ZKnR?=
 =?us-ascii?Q?1nWVM3U4V8FPVUgyi3oywsTDChjVBs2zLChdrSJZ+ubNgU8u28WEP5dKCZDm?=
 =?us-ascii?Q?07215HWuBcd5pXrFe9CIDT1m3OGIYn1leN17B5yOnqYQ/4z6oYqmfJjdQRV/?=
 =?us-ascii?Q?86g/VjeBPjKOSon/OoVSzMgftn5fzb+RoRDpxDDeYS3tabN2f61fHj792ryJ?=
 =?us-ascii?Q?380GEEe4wDsuVtjy9MvA+jzkMoPCNZkSI2Yo+wmnQVvjKtfBYrYOf6SqIgpV?=
 =?us-ascii?Q?jPDNRnRnZSwrSEc2KxlZsV3v6IK5QBj35LwjikPPjAjf0aC6eRVXqjMQ4h4p?=
 =?us-ascii?Q?J/bwVyv0T9iULqmmDfJNAhPAjm93n5UCKgCzWqaGMU1MB/TZZqLGp1PJY1v4?=
 =?us-ascii?Q?AXD2bDJXxXgoyrzEiTLiQjj6MelzmfA4IybVfrBFiHGp1SJXi22ucNTRab/h?=
 =?us-ascii?Q?unpYes0heYYQbz9uN37UURVtyJvwEtTqtagKqB9WM4K22Z/jok48MDgq0/o+?=
 =?us-ascii?Q?1CUjbmdDV8gOtRH1PLDZwKVz5srH/YV3qRf3PbvTUt5bN/fnEm0Zjocasz2F?=
 =?us-ascii?Q?kowxOjksiGk3I1gilATqP5iF3lQvAMYTIArBVNuAnA5mXxA9hL+wcNESwGd1?=
 =?us-ascii?Q?DTdVJDLtzyI0C/Xz/xKWhEg5a3JpjslMhOfVVTWt8CXZRf0DOm5HEJ+s55ua?=
 =?us-ascii?Q?5y9qKzxQ1fwTOEUgtknJjGNyzaNaynyJdA3TmS6ftVeWd1x4zaR6ZxRhyJ6/?=
 =?us-ascii?Q?GyJMKxUfBI2B9E3vP58gj9zRgXNwMIbDBi3sRKNJffkwiXi622EC+reDENT9?=
 =?us-ascii?Q?BnLdhdyL4SxsmWehvnKTTySTNjXxf+FJkwBcjEuWq9MnhQJcL70fFKF7fiIb?=
 =?us-ascii?Q?pGWNYpHrjP1C0l5YI5a7F+IJG3EGQJxgBzCts9iBv7zQBuG04zJTckybrQ6g?=
 =?us-ascii?Q?sS1mcTJcg30saeLIzLlwJzDqF5V17prk1rxj1GG2WPKDV2hVrpWa8PRXriQz?=
 =?us-ascii?Q?OSDl3bTtUlkVVgou/82xNNBTbXll7VcSXPkzL5v/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f3f9009-314d-4a88-132b-08de313213fc
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 23:33:48.8614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a3V83XR68az+r0E2Ijh3rbvNeCp3g5g+MyZJER6R1fbSE/HZUI3CGYHuFxdUcz8/dX55OTD39k184iYhjRUR3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4472
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Dec 02, 2025 at 09:44:54AM +1030, Andrew Jeffery wrote:
> On Tue, 2025-11-25 at 17:30 -0800, Marc Olberding wrote:
> > On Wed, Nov 26, 2025 at 11:00:33AM +1030, Andrew Jeffery wrote:
> > > On Fri, 2025-11-21 at 16:02 -0800, Marc Olberding wrote:
> > are you okay with something like:
> > ```
> > &fmc {
> > 	status = "okay";
> > 	fmc-wdt2-disable;
> > ....
> > };
> > ```
> > 
> > as the target config? or potentially drop the extra fmc...
> 
> It would be best to prefix it. What do you think of `aspeed,disable-
> watchdog`?

I'm fine with aspeed,disable-watchdog. My only concern is that watchdog
is a little ambiguous for this, but maybe there is value in being
able to reuse the bindings for other things. This is a special watchdog
for the FMC, as opposed to the general purpose watchdogs present elsewhere.

maybe `aspeed,disable-fmc-watchdog` ?

That said, I'm not ready to fight to the grave, whatever you think is reasonable
is fine with me. I'm more interested in having this work and being reusable
for people.

> > 
> > It's functionally the same, and to be honest this code is proliferated across
> > at least 3 board files. I can certainly make a helper function,
> > but I don't have access to test all of the boards. If you're happy with
> > it being "correct by inspection that it does the same thing" and "it builds",
> > I can move these board files over to using the common helper.
> 
> Let's get the code centralised, make the MSX4 using that centralised
> code, and then follow with patches converting the other platforms. Make
> sure to CC maintainers of the other affected platforms where you can,
> and if things are okay by inspection and no-one screams, I'll apply
> them all. Otherwise we can just apply the first couple and quibble over
> what we do about the other platforms in slow-time.
> 
> Andrew

ACK. with the change for the FMC WDT2 to be handled by the driver,
we can actually just reuse the 2600evb board file (which is the default
for openbmc builds as far as I can tell). I can move the evb code over
to using this, test that on the MSX4 and then we can slow roll the rest.

Thanks
Marc

