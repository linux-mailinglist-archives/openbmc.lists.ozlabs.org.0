Return-Path: <openbmc+bounces-941-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD878C87B41
	for <lists+openbmc@lfdr.de>; Wed, 26 Nov 2025 02:31:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dGMTT5kStz2xQs;
	Wed, 26 Nov 2025 12:31:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c001::2" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764120669;
	cv=pass; b=Jn7whVqL/+5HkhG429gfQZUUBYu1Vz/JtZTcO2fLQvEGxK/DOpfT6UzlQt+SelddwFhyzh3Yh/TTWnBX+IR0lKzKVF8QwQ0IDmE9NhLnjyRfdUBcX61x3G6aIcXRh9nCk5YbYEF4SH8wPvzr1qAR5yT3rftuhwxbeSTVqbPavD5NG8YCE+AipBEYxlS+WTTzE6Vhbt7aWLDCR95yvqcMz0kJ3OovfGUJZmMy5tukLEsMXkp/yTLsUq8KWYvzTZymCkmZVSqjbar8bI7I4IGm6Z5avEG36TGQQxwZ42v6MwnKZMpgWO+O4en/5jzL5qWdt5OugI5BFkii4LppDXa0ag==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764120669; c=relaxed/relaxed;
	bh=uvkGiGqg/sselFLC3Y5IQixC/CXAhB/NE40eGjorVNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jxXZwgKqEuN2GI614pVtV3bB/Gtg6O7zIjolqr6g603yGjNNVUEv4Ftte+wKAJhjMqDoeY3ht2XlFrt/5sM0LM7FVeNLHZw5WhySsGw/vNi+qzQkPnX9nxyy1YBwVQ3kGU6TJnUa6PuoFgXC/iTcqEXNoz3W0pDQ6lhTwRxhNC3v20ntT4/1fSJhFzmklbDnKNFhHGPcU4ed+q9lZZfwdKyKj5YhzVhM7b/ym9qEcBPQsm+bWLAlJ4F6IGwjLl2tER1U00Oh7JaQNGH8xQuL6lEW2UeHiMZmYdmRtrlmPJdTTX6USTzrJ/Vlk9S8qhr14Gv3S3NINoUHfLIneCmNNg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LF6Mu4a7; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c001::2; helo=sj2pr03cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LF6Mu4a7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c001::2; helo=sj2pr03cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazlp170120002.outbound.protection.outlook.com [IPv6:2a01:111:f403:c001::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dGMTS3T1Sz2xPy
	for <openbmc@lists.ozlabs.org>; Wed, 26 Nov 2025 12:31:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=guakl+Sba4+2T0LMcHgOc1YhCkC3OzWKJrI5r4Rhzv7dFcfN8c41in+uze0zKJW2avbp4gq1SVaFGQQrX7gl6rm33yCPqRgLJzNuc2IaTiEHzYFjDi1vnBszO+SFASZhobO3x2c2A2oEdJ2ktoPqqCtmoVqplw8XL4y1lICkAD3QxmQc4OIIgG3lA7JEaYgUhsc9afCvSztaLK5CKjDKLM/ZDYf9kcTANtcNSMZOygfCI2M54dJdn/m4UNG/h1RJ8LA7KiFjEfas4ZOi2ZpkdkSKI0pCMmsmCkUIs8Zxmd3PYcRiP8G7Uzosd2zXpGBclCJk9FepS0wG1BG6Icdj9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uvkGiGqg/sselFLC3Y5IQixC/CXAhB/NE40eGjorVNY=;
 b=w0mRvQ5Roa6hupgazk9NIrh1QmbrXuk2Yzr/H8LX6aMAmKyiY+44JLGuqAX4gFzhwx1NLgC/cWnLy5av6ep/7Q/2Z3oV1G/M/Z5SKF26GXtKupkWiHBbJpnP3AjndYPM8Igu0IXXipSYeYsOouSBZNxik1jq7nR4k7n2QY0gtAB/w9DwHAu8GRJzxOwkA/dikMjSMLK+fuUxOnBmikFENrORM5Fs+VUGeC9leG6iruzB1kpMduOzJ2dL7MjME8GjoUOlFbir10haKXxDdj3rA/rda2WhttJgkt6v90+eY2ge5wPbS9M7NwhZYVXf+8005f4OkXsyDQYZl9+Fj3m6/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uvkGiGqg/sselFLC3Y5IQixC/CXAhB/NE40eGjorVNY=;
 b=LF6Mu4a7vf6/DRonMhPDqQFWstw7QO592hMffqlUpu9refl+dpiHs0sBdHmbGm/mcPUi2XjpJGCxU2w99G99rj6cx5/OaLytpOcsPL3X2tvBuE/WayCkKH8jlXCB6kAzbZ55M3n9FDevnjFfmZ9ZIqsQlYs7ygbiYPGcSLxbIg4kKyIStkcX6q86KEIb0W3hMmjOLVaRJeyW1tM9/lgLidYgdrmHLpbmCyrIE8uCAv3IDCNAkDZCPg9G5MqCqLimgxLXTxJ8cyg+m9SDsdUzPFWT9/4AqFA6TZUSyJTcGLc2HhbFagTp519pADBjdP0QctPq9RaNbzHdC3mB1zH2LQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by SA1PR12MB7038.namprd12.prod.outlook.com
 (2603:10b6:806:24d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 01:30:45 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9%6]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 01:30:45 +0000
Date: Tue, 25 Nov 2025 17:30:44 -0800
From: Marc Olberding <molberding@nvidia.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: Re: [PATCH u-boot 1/2] Add a new board for the gigabyte msx4
Message-ID: <aSZYRPXSGcHImegq@molberding.nvidia.com>
References: <20251121-msx4-v1-0-fc0118b666c1@nvidia.com>
 <20251121-msx4-v1-1-fc0118b666c1@nvidia.com>
 <9e3bee690272f89ea0f25120c95f166065a3d888.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e3bee690272f89ea0f25120c95f166065a3d888.camel@codeconstruct.com.au>
X-ClientProxiedBy: MW4PR04CA0188.namprd04.prod.outlook.com
 (2603:10b6:303:86::13) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CH1PPFDAD84AB72:EE_|SA1PR12MB7038:EE_
X-MS-Office365-Filtering-Correlation-Id: 54e2d661-0b61-432b-7c4d-08de2c8b6bb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sk7xoEGLLF/1+ApC5f/iIRSL1ywIux/JpwtvvgKyEJkFimPjtyZcbpwmD5NM?=
 =?us-ascii?Q?lLp5NxZxZPEutaGexlyj0MOifyfROkSOBQi84Sdbj6v0h6KDREktMDS8Yeuv?=
 =?us-ascii?Q?l3y/nyFQvMig72/SMYapga4broB6Wh6XjbeZs9nTxb0t+SeupfzIh7wByC5i?=
 =?us-ascii?Q?YPbVTYhCaYHc+17yqT6KFTbi6484Ti7hYzaxiNeSfUuYhy18h9CeopFVvf6O?=
 =?us-ascii?Q?BiF2PoeUWvdNNe9oxP+qX8YCv1Tf9EZaRH4jmI09kNghn/35X7yOKHPcOvqc?=
 =?us-ascii?Q?xPP3npntumUnHhaGZdXQFhRyX2yPKd6pZeGR0zAWSQgJkGvkum6BA+KF1xXA?=
 =?us-ascii?Q?IRusiVTeWfb36syb6zhOeTZV3UKddFcbxMzHpql2xAx6GPDEATPMR5JCToJg?=
 =?us-ascii?Q?BuH49RayM6YSBhlq3mB9cShLGFuaUzW6bnENL5i1eLI00ri+IREC0p3O7Zou?=
 =?us-ascii?Q?82mzTZKFQc7ev+2NPmIYJMV64XYxrSjMQWSyDM+M3K+qhdSkpU1Sl/a1W2cZ?=
 =?us-ascii?Q?bI5mErIiGBHUkCmhBB7FTd2yUGP+wRVlqmPZQ8Dn3whykCrMdnr476NHJI1h?=
 =?us-ascii?Q?8skR2CaP+ghxgpuHLZVmibaH4pbMog1VWJLd1OoJ/QGkMomz5zv4q12NsjeM?=
 =?us-ascii?Q?xtHBm/ysS9m+Cb3BPSxcS894fVLRK2MAw89a6Ogpan2BZxFjMRrtqnq52J/W?=
 =?us-ascii?Q?tJ2Np5s9xn4QMivISvTeX3MCJ1Ygjp7WXojCCX61uKnWrkzRjCu+1CKlXy9B?=
 =?us-ascii?Q?ckKipL/xcrKiU4CiUxvUmK4OLPKg5fylGFd1pV8IhATO7YfXP2fMtpqU89gp?=
 =?us-ascii?Q?h3syFOegv89R9tt/+pWZaBcw5lIf1UfcFa0E2k94TPd6oaLNkTQMOUcNPXCw?=
 =?us-ascii?Q?4dFeHePKNw43XBssrzCYjAfeFJuSFPtVeu5JxrfbrhuzVIbHjQL33ROWntUU?=
 =?us-ascii?Q?WjKrbRzVQIW9PnB6jTcKVVQhxyi6dS3tXpXgYF12ara3Pyvr7YpkLwyhsKoY?=
 =?us-ascii?Q?vfJ+hO1ZfN8nBaQ2totjHcMpmexRWnmOMQOUpPRVzRZl2/S/NtKoSbi5VWgZ?=
 =?us-ascii?Q?vlA//lWfrcNkyz6BYuYAeHtqDhRlDnAWDQOlSt424Gu3myIMT+j62reQ7J39?=
 =?us-ascii?Q?QlHZkdZI7xpjcUflFXLvKTZZ8xdSXr/bnn9JgMRR7FTjDSesL9mRq1A9FaOa?=
 =?us-ascii?Q?/9Nc/TZ/p294453gtllxRqDj39P/tz4euDkimo7hXIWut7Eu/x50vReyVLSb?=
 =?us-ascii?Q?0pwg78+wwesmT0Aw2T9NRUUVd2L8Ed6KuS/PeZFGD1CVOtl9LNII/OaSCeXl?=
 =?us-ascii?Q?RsdTe5M6SVpTeJjVZ1kxEf0v7yRbO6kP6XG+yPeEDFSfs92bfFOzEw3rdgGS?=
 =?us-ascii?Q?6PzjNqzohRF2sQJ1bHZ6VK2mTguCB53DoCm7TkRPHtHnggw8NVg2Om96hurw?=
 =?us-ascii?Q?yMxJZ5K67Hq9d0VLRRIpzqk5ho525VCG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?brrfoqSEBxQ5cVDbG/ap/DVZYn44Um1mOpgPHNnb+DEruKvlnOKWVuYZJ4na?=
 =?us-ascii?Q?TiCxL0SaOGnQuF0EchR0N3P8YUcOsmE9cD73JSKtywugWmzacc5tLT6jZsqb?=
 =?us-ascii?Q?zczCAAyVMzLn+cD7KjqJYFyeNXHXG0vHX9rLPRcbw+KtXMqyScUMaAHQhMvY?=
 =?us-ascii?Q?5YieJlXKmxeJixmTiZBxxjRemvienOAYFwhGVgm+XMja12kkkaWGfXmra0rT?=
 =?us-ascii?Q?J7Ij//7LIaYxIkMGE1jP8hHpzS7OCXPRaBLD1xKvLH9MKxZRR2hnniw9n9EP?=
 =?us-ascii?Q?zyXrQHqVMu2YsXPKHkQAhu5q2Mgn7CGsGZ1iF0NcgOWPcwWBwb1BIeWWzuj+?=
 =?us-ascii?Q?6CgeeEQNJVV0Mw68ElYxsWGXY6w8UdouE0QNJy3k8j+FIZFYcnmW+KkUFFKj?=
 =?us-ascii?Q?uX8p14kZ2M2mdfwbb2umqoJbYWWd7WY5Kq201h6kmQScfugVzo3ogBn7RIw0?=
 =?us-ascii?Q?6Ejv0+0dh1qiJH4oRNzRAww6ou41xXrGkwwLeQL9NBRI5g1r7rd9bwc27/X/?=
 =?us-ascii?Q?lrDUtf84H3iDCgNj4B7O5kibkCJxNMC62Mnn/hpKYfXM7U4oe4jy6QXk2k31?=
 =?us-ascii?Q?fHQFOOyyp+zbZkVUKMSiN+Z2kQtVKVXq/R7iZYEiIeGJTgYjxRR/+6A4hoi8?=
 =?us-ascii?Q?Sd0LGB6JDjqLV1reUVR17IhS58ANtRX5T/sEbYnlsZZrH69buUo9ZBkCtKeL?=
 =?us-ascii?Q?ENvKTw7uUKyr7IgEHgIFfJWWdT0suwE8lzEircNsXp6b0souVgsKdHJ8BT9u?=
 =?us-ascii?Q?0Nwb4oGitbZZ4aJ2Z7vFYK8JnuUaMPfWUvWIgJ0S5H5sNf8D41Oglaz8suFs?=
 =?us-ascii?Q?+y2Rj5g7YYMfCaf/3ViKKKg7VOYsNuIloVfF6KIjTfo2mzFztT4TwA6yjU4v?=
 =?us-ascii?Q?rpsDiHpFUQH+cOx8M1xHKe5WHemjRoTgWe8aAdOLJ239saxcskG6GZUEa2lH?=
 =?us-ascii?Q?H6hSFg1o5AOSHiKeW2dhYq9nwRvet1Wm3cbXJbn7EabxniYTgG/2q4JbMuBz?=
 =?us-ascii?Q?rvOPwHIMMkcQ/1REAn+2t5DH3h6xvr/8ewxZAzgjg8ygxJTSludHbPYl9vO/?=
 =?us-ascii?Q?bL31nsUVe+S5i5rtkNfbSnnelJceuh5mEuTuTtWqnIkhbuepU7Blj3ry0msl?=
 =?us-ascii?Q?2u1MJ175Xf0pcR9Ds2YPJy4KZl8/F6mI5KYWZRKWveBVkyr5by++mH4mG5/U?=
 =?us-ascii?Q?JT71DEXoXT5Mhz6K2ei12YLX7qvfnwUWbB7RONeeYDHF2riMANeif2c2ytc1?=
 =?us-ascii?Q?Fl3MOud27C/1ooafe1PQKke6v9I8EWS9rqRU//dnZMPOYEC0EIoAW+3QoyCZ?=
 =?us-ascii?Q?ri3HVCygglivJqOMGbFx3JKnGuBMgb7aIOZfHXeHbyCYO4QfuehGb8nusx6t?=
 =?us-ascii?Q?4Vth0MiudXH5Ueq2WlpNQBGIZ6IW4ytPcMifNWARY7EVbuTAiLQFuuhDKeyx?=
 =?us-ascii?Q?GXdvotSPcN4wHSjp/ZBo6fVyxPpibdeGpgNV6tJmqQk9XPSj8ffr2t2ZLsnk?=
 =?us-ascii?Q?wSD+51r9zCFz5G2UsteJhDV05oL4zt7HIiYA96R2UhO/v5V7AH+37+k+gHwy?=
 =?us-ascii?Q?HDI2/gO0kkMsMeZTXRq3/ZF4Boj7110FwamjEw35?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54e2d661-0b61-432b-7c4d-08de2c8b6bb1
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 01:30:45.4439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hXuRz04zUdEkawrLyxeZuPGYk+UQFX9ANibkBQkv1Rd+nSLlR0yD9RDMgEQPxCWxOemkTgKcbm1Fis8QOP45uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7038
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Nov 26, 2025 at 11:00:33AM +1030, Andrew Jeffery wrote:
> On Fri, 2025-11-21 at 16:02 -0800, Marc Olberding wrote:
> > +}
> 
> Can we rather add support to the SPI driver, and disable it via a
> devicetree property?
> 
> That way the option is available to other platforms and minimises the
> spread of board file code.

I think that's reasonable, and I can put up a patchset for that.

are you okay with something like:
```
&fmc {
	status = "okay";
	fmc-wdt2-disable;
....
};
```

as the target config? or potentially drop the extra fmc...

For what its worth, WDT2 is actually disabled in the platform.S for the 2600
but its disabled by an #if 0 preproc directive. I think dealing with this in the driver
is a good idea and relatively low lift. In the response to the cover letter I had asked
for any ideas without reading this email :). I'll get this patch set up, thanks for the
feedback. 
> 
> What is the behavioural difference to what's in
> board/aspeed/ast2600_intel/intel.c? It's a little annoying to tell
> because intel.c uses macro symbols for the register offsets where
> you've open-coded the values here.
> 
> Can we try to make the implementation common?
> 
> Andrew

It's functionally the same, and to be honest this code is proliferated across
at least 3 board files. I can certainly make a helper function,
but I don't have access to test all of the boards. If you're happy with
it being "correct by inspection that it does the same thing" and "it builds",
I can move these board files over to using the common helper.

Thanks
Marc

