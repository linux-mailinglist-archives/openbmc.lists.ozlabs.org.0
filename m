Return-Path: <openbmc+bounces-1038-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E529CC5AE2
	for <lists+openbmc@lfdr.de>; Wed, 17 Dec 2025 02:15:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWG841g2rz2yFp;
	Wed, 17 Dec 2025 12:15:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=52.101.52.63
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765934148;
	cv=fail; b=jrQcOD4IqHb6MtFXwnG6Weq2CJZkDW9eoxljRbdH780EMwS3JNMVLds3o9D3eAV1mVT5jXWFfKfW9SPX2W2LD21/0Ds77B8NgHTRGEZZ8Ldx10OPK8WSm81nnNXdK+dgw8P5AdzB1gtB5/4FdkDs90DomWbjhFmobOo1yXSAvEMsYHyPG5+Pg+BNHB+DwwH1xv/oQ5fYcpvnJFp+yZAoOfi9OyCiQbGT7Bnp3x3UE2FWb3+VSsmuGWZ7dPJwc/sXNtINOi232/E4/UsN08gq3SKXKfi3+qpMqglScT1bt1O/U085M/YZVvILr3IedzDFYtZYSOGtjvVOZUGx6bqoqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765934148; c=relaxed/relaxed;
	bh=cU+8JLKmd6MASzEswg+7Pc3NEr7imAC8ywfcIKaqjm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Dfy48EBoFZ07vInBi+efNmEUdCDncQYmGipp8v4IuHq69LH1ubt9IxjMUSi1xoCXaGGPHw5dGdxPVa1RxuXa9e74j6MT8GIaEZB/iv1jtZJQzhgghJuEbruG9z9byrMxB9ggor9Uu7FCxwvsBjvPFHu0UQFZhtsd3W0mwk7Cf5SXiyZZjyFCMwZKhlWuyVBobc4xET/lVOCBCUpONdrC64Z9Mulxtx2LWKcukzcPuWCi2suXyx+7AoWYmr0kV6HoXRkjL4WoTLnEypijvEruqHl53mZPk7/Pi+XbH4ZldCCHq3qBUHrpJ9IO83qwBXLEEgnB5BrALGbziRbcIdBKKw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=fail (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=V4UM6XpM reason="signature verification failed"; dkim-atps=neutral; spf=pass (client-ip=52.101.52.63; helo=bl2pr02cu003.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=V4UM6XpM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=52.101.52.63; helo=bl2pr02cu003.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011063.outbound.protection.outlook.com [52.101.52.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWG824sfDz2xpm
	for <openbmc@lists.ozlabs.org>; Wed, 17 Dec 2025 12:15:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QNc1xdIA/gj0AqUwQOgc8hrODWyYHPlxywyxleyv5XejIOrJ0cRqugis8ivz1uFwobijX5d913NLTNnMchKad7zDl/zi9D5shiV0RLlUBJkWRGoLRHVhiiUebsZq/GV8cfk746Af5PoaSclmftlkXBq4z9gEWwMsnVxGa5PXUMjBudEin80D/TzC5ylAfDjuYEG6P+ML7druLJssY4HEAk+DxSyW42bp4sLv4DLfNQBP9OhHtlA8c98Ygb5NLAiuobqLqnGdG9L4jqGgemkd9NMqS4ExYMBLxe/cRg9WmT9h4Igdj3avrMcCQL8lZo7Pn0jFOlFBp6ZSYAXTQaV1qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XnF2eoShc2OQaZYfvnq3PH0VSBavvDDSee7zVuYVeUc=;
 b=Cf0S0uyzMdVfh01EC0IzUlCEP4DUx1/RUZce0zC8yi051Qd6xrKJZ4cT7GLtqDslwAAZWX8M5X/Ecn3BN5OKuG7JFiKROe0gVY8UpW1W6bLgx3Nec3Pe5JacyLsO38thJLpJXnB2bjYL6c/hpvXcgksJKrmz8UJivhilXsawotNYWsB+XDVuq7IE2rag2AeLaYvg6ZTm3MN2Iccg2zvRL0PL4RppAIfJmcCQOw/CPJNFKrBLDAUYiu2qRNcqGBHOQgCzJRCSpFNvzfmTOzd0nKyHve+vqNJjIuYTbFozXgR0TOOw56lKI9BPnMPt8qxc8Mmwrp3O9oxK3gaNd6W6bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XnF2eoShc2OQaZYfvnq3PH0VSBavvDDSee7zVuYVeUc=;
 b=V4UM6XpM4OEzp8+kdScEa0FMxCoEhaNBqqCW0frxC9osYw0kb9dK0gl0Fi2Z5v+MGpQy5NANPZ3M38RuHbe3qQ/a6Hq6cRnVJM4m7iC1jwz3sQW2cLtcUZeA/7jxXCPz8y7t92Xs94RZFal2KJqVm+Y2ZsKZsco7inzBAzy3TGCtNLeNgZPJrEqB9JWfJZrTSxajaTBXoFzEH8V01o6j8p628z1ewrLoH81YTklp45zwl4bc9F+pb69W25kYH1S7xJfXwhhZvm4NYfjI7hOO9k3iF3v1Zt5bJpBkvOTLQTRAuBHVa/HnzUr5mlyNqIUac3KgUMF7zURybqz0enq4GQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by CH8PR12MB9743.namprd12.prod.outlook.com
 (2603:10b6:610:27a::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 01:15:06 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9%6]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 01:15:06 +0000
Date: Tue, 16 Dec 2025 17:15:01 -0800
From: Marc Olberding <molberding@nvidia.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: joel@jms.id.au, openbmc@lists.ozlabs.org, eajames@linux.ibm.com
Subject: Re: [PATCH u-boot v2 1/2] drivers: spi: Add support for disabling
 FMC_WDT2 for aspeed
Message-ID: <aUIEFWIUWoMlbEMC@molberding.nvidia.com>
References: <20251202-msx4-v2-0-a605d448bd02@nvidia.com>
 <20251202-msx4-v2-1-a605d448bd02@nvidia.com>
 <cc4141d2b1636c99c8f25b378f34ca214289a51a.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cc4141d2b1636c99c8f25b378f34ca214289a51a.camel@codeconstruct.com.au>
X-ClientProxiedBy: MW4PR03CA0353.namprd03.prod.outlook.com
 (2603:10b6:303:dc::28) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CH1PPFDAD84AB72:EE_|CH8PR12MB9743:EE_
X-MS-Office365-Filtering-Correlation-Id: 55ce5398-32d3-42d5-b059-08de3d09b663
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?25g4dmiKylwApE1ngEckHXUNHq/x7kjMNQ3vBv29Zm9WkTd1NuoVjyLsn/?=
 =?iso-8859-1?Q?OIVsMLf54kpmb9+OE4qa2a4wGAlh0Vs2izYnY0YDyzZupntN+hF25qXpWB?=
 =?iso-8859-1?Q?pJ/qEddbGNnRWi+Zs19Tu8gsjqUh0NtP3WfryhNoJjMBEh57cS44G8Qd85?=
 =?iso-8859-1?Q?txmvY6+lm5UAmkkB3JNuji5qU6LAIyfvnF+1lDaIIWU2nFpvnpLvxhXhO3?=
 =?iso-8859-1?Q?OFD/KWeW2TXgp+lltlG9sWzSHApeuEOIDmqTuY/z3lbidGqJCcGOJ7JRAG?=
 =?iso-8859-1?Q?T5zwfVe6+H3VnDJyYivEoDAA+eArd7Bdmm3dA+RYxtaKjSMT+u45qNvTk5?=
 =?iso-8859-1?Q?k7esmtOrBLAHyQTDgdlj1EoVVKnPUZPB/fWc6x0B44SPowaEdy4DEf/Xko?=
 =?iso-8859-1?Q?WuGF/5kXH81M8AlJHR5AkN2eaOK0b9+Bu2W9L/88nrx7hHwh0DQrCRAElx?=
 =?iso-8859-1?Q?bpNyD7znmRtiQbyK9Qy/vM/uyEfDhelVHSwVolBRMXw6zHxkwvLnC2dYpS?=
 =?iso-8859-1?Q?dkBJFBadko/W2+gnc6PVExjsA2H6cd0o35BTpk7tbw6aCikaQ4aNG04+TM?=
 =?iso-8859-1?Q?fYoYgSDBvHWyHAiVDzlKsYqWIF3T7uLeBBhNwX/4JzzpZgN9SUQRDYLFLz?=
 =?iso-8859-1?Q?/aZOHrVLnuJ1opcMAcBOoBD93KFIDrhYpV9h3qYzXt9vly4jDWk031yBOV?=
 =?iso-8859-1?Q?+qo5qF0qRLegd6dN1BkcMRJAxufq3tDsAlpKF+vyWfUuuqgNARK4MOizGy?=
 =?iso-8859-1?Q?+5EVt9KfeMYkFOBweB2Ue/Xan8ES8Kt4fnhoeeUO6mngvDgSv6YreG+dWM?=
 =?iso-8859-1?Q?yfXsubBajUu/XVr4PMvX5rAUrfhUQ/kZU+i+1OC5N0HZbKJwPZf09gT/DE?=
 =?iso-8859-1?Q?29BN/WyGAA+cmFC9YDdIaXIwyL17PNn04+agQovL77uB+YPzFj20cjq5fm?=
 =?iso-8859-1?Q?AfWkVDSFfIVuqT58D2sn1i/UyObxESKGNdeqJBN44VIrerzYbmcQndeMj+?=
 =?iso-8859-1?Q?DlWAOiwRzzS1goSMSQnqj1Gg4cOHQ9qRxxfhmhUmD46xJnhdx2O5toBkwh?=
 =?iso-8859-1?Q?Ec+7Su/a3aBvtsmnGpPQywOA8HqImlAb5JtnwIBp/AMcK/3BfRjbRMSi4K?=
 =?iso-8859-1?Q?u93hSIOd87bqROnXFs/EIsv0rnR3gclWxomO08PUcJHDvlAK2WbOlXUZu6?=
 =?iso-8859-1?Q?31HmqjfFyY7ik3+5mPaivl7f6RKYsPiQCSdy5WvdW5+A3ATMaX+DvVTh6c?=
 =?iso-8859-1?Q?xa9aOWjcJyGttgwOxuxGOIQbT1JgfOEUHv4NEbrtPI14zOFCNG7Ay/NeVm?=
 =?iso-8859-1?Q?PlWj4gGRG6eXUiH3F+B5IAKHDBSduSgeR2+toz4NCUk+NC0Q4e3tnV0hIL?=
 =?iso-8859-1?Q?DwyXkZXbGeEEe+EH9yQFxYNImLLEkckrH9xysLg8Zfg4nzflaiHRhlEYOa?=
 =?iso-8859-1?Q?TFDvfg7/WFthFykoTdReoj5kurwdAa3CT+l4Iam8MgE8fCm52ssfPsd3SS?=
 =?iso-8859-1?Q?6ZTu7RbmeduDxunzqkUAXd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?IbPbNOm7peVwQNB2fm63wLQRHWLsSOcWkEBSTf73kaAVbE6O06juYofr/o?=
 =?iso-8859-1?Q?A1h/opzK2V0smRPnxMTeuuNt3YH6ROdAELgCZuB6+LAsJd9MO3n0vt15kF?=
 =?iso-8859-1?Q?Dk8ocFuDi4EFD/PFr2DloY3nhrQ58d37E76bYpIR9RLqzFMt4jc8+pEliQ?=
 =?iso-8859-1?Q?L6vITLBXmc7EolRvdrCqmxr4vUIDc4avU3jz72GnhhCdjh2vUmR5OFKqjX?=
 =?iso-8859-1?Q?v2Yh6ie3pQ7yITAfzyzTPCBrVPNDT6yRf+pKN0p5uMTv1t+hoSTbl4TpOg?=
 =?iso-8859-1?Q?goV4F5orK8CByW1dwl8XJQuXaixhX8S+iNHdEc6bn8tnba4bUBfvzr17OC?=
 =?iso-8859-1?Q?ms0W7YHIHOARekf8b3niEU2gJPs43Q5WBice9LIR+8bKnq3URVEjykzU8Q?=
 =?iso-8859-1?Q?8jSJeLId5AnANpU49Vm6VUm4CfTrrtKY4Ow89juXkAE2IzbkLuQvTpUsXX?=
 =?iso-8859-1?Q?Fl+9Jx3taTLjk2Ie+74DICFm0ZhpQk5Y298Evzydijxfh6LJVOg0uVVcXs?=
 =?iso-8859-1?Q?d4MJpI8oMqq6U1AV7DYAWxDq1sFnEJ0lHrxwQr33JX7HBALnWFrPw0Fzgy?=
 =?iso-8859-1?Q?2+4lTp2ZQXjdYdmTSr/X0EfOUZ9c4X6Ii1EkR5y4U3WrFZTFdrYeffu9qc?=
 =?iso-8859-1?Q?oWnjodfXq0egckcsL56l5KLOeDcmFXuPQytw8m9Rq2aJiNM0FGYRRNnk8Y?=
 =?iso-8859-1?Q?qhojD09XCokXhHXg6R5yg0IiMI7swRo5deubyoVNP4RTfYcUQeXGp3JGUM?=
 =?iso-8859-1?Q?ztzJ4B04BEK+0LzFNWi5U1e4RV+Zwmk7lyKqLrF9L5EiTjXqP1AuekrYdS?=
 =?iso-8859-1?Q?08KEm2E58V9Fl42WUq0xygGfHKVk9X3AZCyFIJOjDz+pUZqbhi5kAgNiG0?=
 =?iso-8859-1?Q?Y3tMH4h+w4niiCoyt/bhH1cE28H2JvaVN/VlCsHs/aLRPtug3BdpMQW5Tz?=
 =?iso-8859-1?Q?2wA9d3R7T60MlpnG+s8gZ4K3ZJ7Y1cNRu1rvUyC1tjgNLltyHnJYxFbkyM?=
 =?iso-8859-1?Q?eprIC/mvtsy5Q+GDeE27rwldqgoyzncfD1+2JrU1437bnYoh7uMBIdmQH8?=
 =?iso-8859-1?Q?EqCZ4AQNVTxCrosfVrFx73xULAg15qIk64Y3uZ0dtcEmCvTOiZ5I9R35Xu?=
 =?iso-8859-1?Q?DpWKDqVvgXPlpQUNepCTqlx70CXRxZAj+0zzX0q4P3qrfn0ETLeDHl8uzm?=
 =?iso-8859-1?Q?ZBEiOGvdWRpZxta1y+lOqE642uqw4nLDCJiMMVFYB3WMlQli0eeacpb/Qb?=
 =?iso-8859-1?Q?fibRI5JAaRP/2+e5Abv4YFufDfsqnwDViNIcOfJV2KEM+Ierkce4ASOs/n?=
 =?iso-8859-1?Q?zQ7loUQ+0Dm2YTLC92V3ox7nYakwpwFbqhoduxfDqpFbKe7GxuHoJMXecf?=
 =?iso-8859-1?Q?sV01n7xEHxBFxkU5txOe5zYNXRCMMtEOqopnvNfh0eZWHdonE/BbAFhx0N?=
 =?iso-8859-1?Q?ClVrnx5WocNWO5MbzlQItT7Gr6TM8qDo8zIv0zf2EhJqhzQdJPHWDNvOS6?=
 =?iso-8859-1?Q?vexx6UDO8XlAB1aNuBL26Y7bfgM8iJqyCOlo/Lx2j01E7QOF/DYMpn6sxg?=
 =?iso-8859-1?Q?jLl5eWAqFt2pEMBblt13xBeBstFOnexumqmfOn/8MyYKp/K5ku/bACmuDj?=
 =?iso-8859-1?Q?nOVsfCJNKXihW3s5hWnEj3jYDDsOzGYM4Z?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55ce5398-32d3-42d5-b059-08de3d09b663
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 01:15:06.0128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HcGoWYOxbJMZflMXcTZgJ9Bh5jFGdcn1eTkYJe1Nh8bzdlbH8xVwCxsec09Qx/G+yIabROfxVSsoibpIXZZ/eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9743
X-Spam-Status: No, score=0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Dec 17, 2025 at 09:53:33AM +1030, Andrew Jeffery wrote:
> On Tue, 2025-12-02 at 15:52 -0800, Marc Olberding wrote:
> > Adds support for disabling the ast2600 FMC_WDT2 through
> > a device tree entry in the fmc node.
> > Set `aspeed,watchdog-disable` in your device tree to have
> > the driver disable it.
> > 
> > Signed-off-by: Marc Olberding <molberding@nvidia.com>
> > ---
> >  drivers/spi/aspeed_spi.c | 19 +++++++++++++++----
> >  1 file changed, 15 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/spi/aspeed_spi.c b/drivers/spi/aspeed_spi.c
> > index 54520122f1c48c8b2052b4b1e47445a9b990d25e..de954e477aa15e6d1be042a2aee47f5a501178da 100644
> > --- a/drivers/spi/aspeed_spi.c
> > +++ b/drivers/spi/aspeed_spi.c
> > @@ -30,14 +30,16 @@ struct aspeed_spi_regs {
> >  					/* 0x30 .. 0x38 Segment Address */
> >  	u32 _reserved1[5];		/* .. */
> >  	u32 soft_rst_cmd_ctrl;	/* 0x50 Auto Soft-Reset Command Control */
> > -	u32 _reserved2[11];		/* .. */
> > +	u32 _reserved2[4];		/* .. */
> > +	u32 wdt2_ctrl;			/* 0x64 FMC_WDT2 control */
> > +	u32 _reserved3[6];		/* .. */
> 
> Ugh (passing commentary, not your fault).
> 
Yeah this sucks, if you have a better idea, let me know.

> >  	/*
> >  	 * Set safe default settings for each device. These will be
> >  	 * tuned after the SPI flash devices are probed.
> > @@ -1907,6 +1914,10 @@ static int aspeed_spi_probe(struct udevice *bus)
> >  	 * SPI controllers
> >  	 */
> >  	priv->is_fmc = dev_get_driver_data(bus);
> > +	if (device_is_compatible(bus, "aspeed,ast2600-fmc") &&
> > +	    dev_read_bool(bus, "aspeed,watchdog-disable"))
> > +		priv->disable_wdt = true;
> 
> We're not setting it to false, just declaring it above, which means if
> this branch isn't taken then its value is undefined.
> 
> Perhaps initialise it to false by default.

Ah, I figured that priv would've been callocd by the driver framework
before being passed to probe.
I'll change this to 
priv->disable_wdt = <boolean expression>

in the next rev. Thanks.

> > +
> 
> Unnecessary new-line?
> 
> >  
> >  	ret = aspeed_spi_controller_init(priv);
> >  	if (ret)
ack, will fix.

Thanks for the review.

