Return-Path: <openbmc+bounces-1370-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RpE1I/xNkmlVswEAu9opvQ
	(envelope-from <openbmc+bounces-1370-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Sun, 15 Feb 2026 23:51:40 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A43CE13FEE1
	for <lists+openbmc@lfdr.de>; Sun, 15 Feb 2026 23:51:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fDh3X5Qtfz2ydj;
	Mon, 16 Feb 2026 09:51:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10d::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770966637;
	cv=pass; b=al1H09oXgUNgphHQYDlQGEQpZtg3JXgaQtbLbUcwk5BtoNQRIy/4VO5hBRGxwa8QJ1QwCHxcz3ICb3mIXmdtW5uu9SoguSBi9oy04cKLWsMpYEKn9TaHbvkxsV9L8m4/Xiac/LEluQJ+IwdiYrfadZ5F+vuA378YsLUuvNvglaG8Cx4Tf4rhGEcxxwSN/jvSbX8PnfZO0+paDI2xmujyDglNydH/VRjVXT90SQoTQoHa7o9N+e56RIUBxPhlLtLqLcA6t0R9wMDsSNE/xq6CSUfKY9mr1jV167cTnTt6dFgZ5CvS8WKYt2n8LiemKacwwHn5f9jgw3B9QAIm9JSM+w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770966637; c=relaxed/relaxed;
	bh=Kh157YwD8qDdTKmsV8NgA8nZzVEsjFa6Wy5o3MfIU/Y=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j6K1V0CXANPQ9MTpfSX+MRS5qsqkuaUa6TAmlGhSbmk7oeAY1thjcyedl8RWROkUsAEOwlqqbmEfmE+ik0ckZvz+z3xvxJO376Zv6LU2nZ6as0hpKCkyho7kd5n2hWPnN3GbUF1TTKN19B2xDdEq4lpv8kLL4xODKraabEXEp160qkLuBhCj6gqqY5PDNP7X0HRgZBOXu0UVsqSOouvhpU3xB7Rcbe2DHKM6vqGDcGNP0mg4wt0sSyDD461V5odMPbi8tlllUGkVgzfszvGugw1sKi/XQiWKPZ6Ky0sOekwbooO2QZE5FttPAh+vfuAANV5kyZtOavYR0SHRwSupfA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=lODyjpKF; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10d::3; helo=sn4pr0501cu005.outbound.protection.outlook.com; envelope-from=kchiu@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=lODyjpKF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=2a01:111:f403:c10d::3; helo=sn4pr0501cu005.outbound.protection.outlook.com; envelope-from=kchiu@axiado.com; receiver=lists.ozlabs.org)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10d::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fC3Gh3DJHz307K
	for <openbmc@lists.ozlabs.org>; Fri, 13 Feb 2026 18:10:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eA0/Qv17J9faRxQowJrERvjWz/8JGgDE6tnbqgGBSju9bQUWKkimfNk/rA9/u0fVfMNy1W0RlKEArpZUyVkYeBZQ108xu3SktJiRWM5OyjgvQ0HRAaxrTWqdnErA5VTwDmP7ORjtWi/RJ7q8TTH7FeRbu70ktSRUqfH5TEsILHP3GHEu3rfEMKWb4ugjl+s8O0CxuPHdSjpfFzwxwEReJtyQOrp1Yr/45mdAWr5sb0r1ntLqM6RcjwkKRrMQyiWL2QX/kljtEoU5S1cMUCgen/CiIfenIQY4+HZBeK9GtpkM/f16pDN0zhs3n0mFcqknWFXU6oCfc/BEzUxpHblQQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kh157YwD8qDdTKmsV8NgA8nZzVEsjFa6Wy5o3MfIU/Y=;
 b=nQqKYmmr//xTH+FR7Igq05lFEMDSL+9yTebUMaWwyqs0wSjPnox/pE93RtBi3PkzflQBjYLiZTG9+ie+s4qmcZtrh4513lxcFoJ0UkhXUXp4cjDXPK5zqIesmZv1QpuFDLgwaMgKCt9kWzjd3NTU5W7IJrvI+E4kUh9Bcd6CsQGZEljCvcN734pyGEjdJTrECITuUyYaiEC7fYkK7O9Fq7IEZVSId1WxyCxgiV97ZHTBQnGQzSJAWsA4+GQJekTXkYbNtdUElLXpAkFqPV0ALHM/y6SPIaawRygZAuUW2Qm+SFQfRmEpzUaYnUcVtIWPsLULwcIBCSZiPfoKkMx75Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kh157YwD8qDdTKmsV8NgA8nZzVEsjFa6Wy5o3MfIU/Y=;
 b=lODyjpKFmCwZoWj/EM5GXkWInCz36MSb2bZrnM0Kdq+wInhOrc111N5Ak0SLQHib0o2HYCJmOX6V3uI9bTRdYcPEGLwhboGDBSmlK5oM0J2FETimmH6n+2AOESj30WauQ16RdiGQ9t3vgNo+TJtaJbVxj+AxkKvsh6vCDwDkLEZVWXcNzH8IRssUs4gihWBhu7gNLFY35Y9P05w0YznQYD0fEPiZI2maG68m3w6gfqQBSNFTXEeCwCCHbh8NE+v1DdLN1CiO6h9DIpHOwS/LpqRe8F4nRD3QZpYn+XlsLXjH4fAb0cZd5wAECfL04u844KYivHm0Gmz3iJ8DL455rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from SJ0PR18MB4479.namprd18.prod.outlook.com (2603:10b6:a03:37f::19)
 by BN9PR18MB4121.namprd18.prod.outlook.com (2603:10b6:408:132::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 07:10:07 +0000
Received: from SJ0PR18MB4479.namprd18.prod.outlook.com
 ([fe80::2bc8:6a5c:b10f:9e21]) by SJ0PR18MB4479.namprd18.prod.outlook.com
 ([fe80::2bc8:6a5c:b10f:9e21%3]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 07:10:07 +0000
From: Kuan-Jui Chiu <kchiu@axiado.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Subject: [PATCH linux dev-6.18 v1 3/3] MAINTAINERS: Add entries for the Axiado SPI DB controller
Date: Thu, 12 Feb 2026 23:09:27 -0800
Message-Id: <20260213070927.1114371-4-kchiu@axiado.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260213070927.1114371-1-kchiu@axiado.com>
References: <20260213070927.1114371-1-kchiu@axiado.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P221CA0018.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::19) To SJ0PR18MB4479.namprd18.prod.outlook.com
 (2603:10b6:a03:37f::19)
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
X-MS-TrafficTypeDiagnostic: SJ0PR18MB4479:EE_|BN9PR18MB4121:EE_
X-MS-Office365-Filtering-Correlation-Id: b9e720c0-b3d2-492f-b1c2-08de6aceeac0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1jAB3qqwsi7eZV33miW6Qw17fNyKqpmrctNnhvdMkA4co+k50vVbuVR5+KLD?=
 =?us-ascii?Q?1Atrk7GMkSuqJUbHDMVzqeZ2qyJR8j4L7dMfhWoFsqLwMeRuUNticwXLsFXw?=
 =?us-ascii?Q?xpEboWpKB3Z3WIBy2U/LRR2/q1431i/7a5XnoAbAmzStPSwqUpgjBnOWjeB1?=
 =?us-ascii?Q?qvOsk90eSVimi+5pqcxPPrAla494H4zTld4qoQCDz3WYW0S8Ip1Img6GaOOx?=
 =?us-ascii?Q?E+Hr4QiI/T56AV0WNYhIZ5BUIEJkiLQCi55js1ZF/R6XLpiWXwEcoGncaCgD?=
 =?us-ascii?Q?JxuyjBKbEwjhuMgnjjyYHFBRsnyFP5t5byPuRxxhniOD19Nb4THpm7oCzUQW?=
 =?us-ascii?Q?mRt/vkZnnQYMdrg0M4+WLAG5CdmO7O44q+qt3b2BhNC1J+aGhYjJLmC0ah/b?=
 =?us-ascii?Q?yf/F0vL7iI5MMR4gwKuWZ2apXu72nCYEmbadFWEqsEp/S6s2RN4iroM+CDbs?=
 =?us-ascii?Q?rhi43vNFIw2nG1Ew3yibUMIy7IVovlSdlJZHdLzP0Es1cXEjsqOV5UAP5ZSn?=
 =?us-ascii?Q?qjeojB9obD6Ueh8us0c1GmPMgEu5ows7HSEtmE/aQLrWc3RYOC3oDWvlq3Iu?=
 =?us-ascii?Q?/Na58oVkfS0mtRvyQrVJaZ2hWAwqptn/kOlGY43q31FuB55TfviDpxOZctsb?=
 =?us-ascii?Q?zEvaoORVOeKT6C7Xr/KIPzbNOaUM89BN2+KmtHhTnDuxGQBRqeIafNGUjYaA?=
 =?us-ascii?Q?kofZ1cwnCXi5STtUzKMEj7TaF/2a26GcBRbyt0vGpmzyIWRREMQyAm6LDYdZ?=
 =?us-ascii?Q?u6LpX/bN3T5RQLE3sOhQa5ZfDMiNshW5eJAKHzDbxandJVWsuaSnjYP2gI2S?=
 =?us-ascii?Q?GRtqk2mLj5ZPHRI6jBRAS8kFQXdx50kWeMqltNi9irp3cPADKeGg/m54fQUM?=
 =?us-ascii?Q?X0kBiu1EbdDDxoUcSN15RrCNXJG9SuFI+Lr1tOhAZZ/f9dOYVXUZtjKYVIXA?=
 =?us-ascii?Q?8t7DFOPHgHtPWGjOIwK9EsWjAjD4bR+ft6G4EpfAOartrD4RFldW6DNz4ASK?=
 =?us-ascii?Q?cvLcr2Qugyao4gVIHJngYj0YNDKlS+wYCkxLK3otF0eQiXMJmvMeW2v08vsT?=
 =?us-ascii?Q?VHXBLv7n6DbBMcNacEmr6K1EP/WCJluSyc6RHUiEUGE0p/URXJTl1NArrGag?=
 =?us-ascii?Q?k5kUGRTUM1DL2lRs3tGRrmIWW34HwAsiNKbxHNYncCXY2DXSrloSzypra7pY?=
 =?us-ascii?Q?BxbxOiWWuOkwsMIjiuk6PBQbXYEqDnOkrojymJt4+5W0LcO1MnakcF2PoFxC?=
 =?us-ascii?Q?BRyyN4jMN4uiDTDAXoxcpaM93siMZ/54KcDvX2PGLTPphjsViZMjtKAKj7Nf?=
 =?us-ascii?Q?JrkDNdV2vFMuUcs9LZdC6KqUkxAs8UVK3Iw9Vo/+E6c3XR+aUbwSqsPkOflh?=
 =?us-ascii?Q?pwqFLXvAJQVu58IfrjZ8zaE//Ns1BZfE7mcHCLFmrlMhr1njhTgbwwpPpLFU?=
 =?us-ascii?Q?zbhVbCsghh9voDKajq+D9XuiaIyrPX7LWGoZ9MIysT4xXP17ivitV4pzKITz?=
 =?us-ascii?Q?I6MrS3Psdr+wiOKKRAC0sn2jMOP9+xvRTmma/Xe+iyj6pNsI2Z9/n37nob+y?=
 =?us-ascii?Q?YU4am4fW46MRd+rhFEtzipAVXnEDJfyxWC9ETsJc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR18MB4479.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d4cXwQd+PiGgtq69oKoeat+OZuiyr1OxAzsl6YD56XVmBKLV0756/z23p+NW?=
 =?us-ascii?Q?ynd97EMgFjpRjCwUpEmTLc7WJT4oY/gIFCebbrFumPDWz1m/hNHk+RRVbEK4?=
 =?us-ascii?Q?dGYnyKr1DAIllJxcRWUzrGqVCgRGNAR4I0HSYnofMCSer30b90vgEFqgYEw7?=
 =?us-ascii?Q?1FeOQvkgOxDi7bPJZ4P9EnYUsXSEgYei6UuzgBz0RgAaSrwQ731/KK1w1RMG?=
 =?us-ascii?Q?TVhANij5pLk8ft6goig9yAUrCsj3sPHmteVNCw8gEajgrbSPWLinT4PZjs15?=
 =?us-ascii?Q?plEPnqRHGzzhxcFCvxVLKNOzH2S3PnnHjvqoImNZmgbFcZG+e5T4okhG4+qa?=
 =?us-ascii?Q?EJ4Erd/q0WBDX6nXs9nnpUwqhnnqHIBa6LSPnXbrosoMZ9G06UbYm8z8H0N4?=
 =?us-ascii?Q?OiQu/T2IgjJsw6X2pnLhL5+OBbqkQ/Gg6/CDQGb3eHIi/3DTJ5tf4Q2oFxIT?=
 =?us-ascii?Q?H1zw8wdBKlJNJk1PuD72bxJCfK/Ay8GvkJ0dYyLkkJbYnv5csm6eTsRDDMDR?=
 =?us-ascii?Q?8bbaA5NWQujd1UjEuArR+vnTW9gkLLdEf8spl1kL61Q7V8qMh8L199yeQoJ0?=
 =?us-ascii?Q?ZoSu3MfDcAarTlNCdlE4Ofbacyu8CfWBPhIVmBwN6VtdgdCaMROxSn+pv3kf?=
 =?us-ascii?Q?f7DbJwGT0LlEG8LsSS1OPJdGck9RTy+zljM6Wpeg+pwI56xz29X8yAwAGIt6?=
 =?us-ascii?Q?E0+4kzs/HLME2Ep4TB4xXHVudpxsE/25A4Hi7QkK5wcbNItHfe2Qp7jtnCXL?=
 =?us-ascii?Q?RCC5UNuPX5ccyONGDyvfwgg56EZvCatMz5DQzSTqe5gHTJNqWiZI+fxUupMf?=
 =?us-ascii?Q?F3EHQN5rjdteOIjknwUfZQZ8kNXS5K19R9oaG7aCE4cohnzkze9qcYuXSCaa?=
 =?us-ascii?Q?Dskm0eADGtiZUWU3Lif10+P4yfQEbKnmEb42uBqAbTDw+pjsgUsb0PUDU5+Q?=
 =?us-ascii?Q?31xydkOfpEk1UjvkB1Ki4gPUjtj74s9PtZruM8I0zx1n+E1mLlIgZ121MC3F?=
 =?us-ascii?Q?ukGILkLEn78XiviGot8UDaYTTlXoZ7a/Cs55KDylAre8qARD/hDB6q5+NdxM?=
 =?us-ascii?Q?ExNJ3vH/P2FVWn5FuNrZBiHdHV65i/kzJ2REyhwc1Egg7BlUO/ePslO+iSfH?=
 =?us-ascii?Q?XonmRp+rToTWCWcVMG22KQaBXPp/wnrjYurNj/NuOF1K+fgktx6k74/Zsfvz?=
 =?us-ascii?Q?+orKOsw4cat2kR2WfPnwoZT+kqeVTjo33SwbsRvcSbKJPQ1vXBx11p29KCQN?=
 =?us-ascii?Q?ICbyF54phgN5Dvvxk77ZTrm20tWo9LGnCl1UcBKWoFf/BcTl6ONoR4boQwFs?=
 =?us-ascii?Q?L17hS4cPBZl+jdJGV9hJ9fsiVeIGdYdLcKbT9EYnTsFswv3L8KOa8Uo39My/?=
 =?us-ascii?Q?6cFunrOrCgIV3UtpGFNePozH4CCz9+ptH6bIfkuIq0Ne0PmaR/u5Th7ceztg?=
 =?us-ascii?Q?quUOuxB9Qv+dU1/Iuhfe9Ra1PvUXtp3B6MpozdclKllwMrZk+rJjRJtIpnFM?=
 =?us-ascii?Q?X+eHm5Y/V5H3K3CHicj9FE9ncPEF9IAWYasrkgJp/641fo7+37ytX7S6mdac?=
 =?us-ascii?Q?ZwygW+ziMMN74bjBn5X0Y9mpA9GQ7V/ohH3wBE2OL9ia0rEDdCAloeKgO3b/?=
 =?us-ascii?Q?mlw4BGNIArxt67cbynvgMPNaeWgso1LuboAf3MIVoAs6fUznib5SxFYMjdhA?=
 =?us-ascii?Q?dNJhHE482Xo4J3WvroQMIvZNt6MZlQwbca2nm+CI698alTJS?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e720c0-b3d2-492f-b1c2-08de6aceeac0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR18MB4479.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 07:10:07.1733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9FcldIYU3soM32sg8sz5t+SB66yLOjpOZP52T1EV7/KvZ8TmOAN33Dhd6ZJqmNTOEuOqo4zRv+omR+qwzmLAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR18MB4121
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.80 / 15.00];
	DATE_IN_PAST(1.00)[63];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[axiado.com:s=selector1];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-1370-lists,openbmc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[axiado.com];
	RCPT_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[kchiu@axiado.com,openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[axiado.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[openbmc];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[axiado.com:mid,axiado.com:dkim,axiado.com:email]
X-Rspamd-Queue-Id: A43CE13FEE1
X-Rspamd-Action: no action

From: Vladimir Moravcevic <vmoravcevic@axiado.com>

Add the MAINTAINERS entries for the Axiado SPI DB controller.

Acked-by: Tzu-Hao Wei <twei@axiado.com>
Co-developed-by: Prasad Bolisetty <pbolisetty@axiado.com>
Signed-off-by: Prasad Bolisetty <pbolisetty@axiado.com>
Signed-off-by: Vladimir Moravcevic <vmoravcevic@axiado.com>
Link: https://patch.msgid.link/20260107-axiado-ax3000-soc-spi-db-controller-driver-v3-3-726e70cf19ad@axiado.com
Signed-off-by: Mark Brown <broonie@kernel.org>
(cherry picked from commit db4371d13f82fb12463fe053f4864980a2af2106)
Signed-off-by: Kuan-Jui Chiu <kchiu@axiado.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9137c8f50057..10b1f6f61afc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4201,6 +4201,17 @@ W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
 F:	drivers/pwm/pwm-axi-pwmgen.c
 
+AXIADO SPI DB DRIVER
+M:	Vladimir Moravcevic <vmoravcevic@axiado.com>
+M:	Tzu-Hao Wei <twei@axiado.com>
+M:	Swark Yang <syang@axiado.com>
+M:	Prasad Bolisetty <pbolisetty@axiado.com>
+L:	linux-spi@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml
+F:	drivers/spi/spi-axiado.c
+F:	drivers/spi/spi-axiado.h
+
 AZ6007 DVB DRIVER
 M:	Mauro Carvalho Chehab <mchehab@kernel.org>
 L:	linux-media@vger.kernel.org
-- 
2.34.1


