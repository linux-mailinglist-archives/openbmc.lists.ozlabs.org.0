Return-Path: <openbmc+bounces-1333-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NvUKgsQiWnG1wQAu9opvQ
	(envelope-from <openbmc+bounces-1333-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Sun, 08 Feb 2026 23:36:59 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DBA10A7A3
	for <lists+openbmc@lfdr.de>; Sun, 08 Feb 2026 23:36:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8N3P140Lz30Sv;
	Mon, 09 Feb 2026 09:36:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770366169;
	cv=pass; b=O9kjJgbfbFk0YJ1HW+HKu5LfuufGaITYEOWoAOTmqHL+cNWOyl3s3QK4NAsMpZeMalAWVDMJ5Bp9iK0r8LoA0evMCU9vujxuHwa599wi3KBaTikUiP9HsT3oftrJ8RDGeptBguejBP2Jk5H4QxRiN0vbOfg1Nx8BxNOdW+t1p6uJMlAJnKvOgnAqIx8lXDN42/RXzl5XSCJqZw4M44CLQcrhU3njOWoNQSMJm+cMU0MhKZjECz5M43EvkKF2SrMNbstHb9Qy/+J2DfDtjQD5K7KXpxt62hF3WsAVRk0wdmCc5dz6WQTBwE9i6dSXC68bdtAyVxTGuGKt150oaFcRiw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770366169; c=relaxed/relaxed;
	bh=DQbeyUpcxHP0UttbckzSvqDGia0H3PNtqqBpsfm0zQc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=JkMV81d9g70PeH+T04zYwOo0giSyJ/5uU8INuNXGM0lrcPr2abkelpPReqdc42vMFgw1GX3JMVzYMoEe7Rphk+KxPaxcgsnsfZEN74DFkT1wKRAq36H9vu76OCWwb/TlraBA95uHd528voMV5FnB9WPorsgqQv69ubfdWinCdD2cdSzd8fSjLHlnzkZSUWv3H+UW8o3oZ/mmSOC0Xwb/pZngyVX7ffYLW47TAM7cNYRHN0YBOWMS1HezqdTugAD9jMSo0G3Z/anVKnL9tE+rV3W131hO2TDNs3ZD6x/n8m7YP1xMYD/hIFkCcuuMCYwXzzUwU2MELBZfEE4jlmJGZA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=TDL1nCZ0; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=TDL1nCZ0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org)
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6nCF2NG3z30hP
	for <openbmc@lists.ozlabs.org>; Fri, 06 Feb 2026 19:22:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LMmtoUs+IsCHEYYyY9VEHd8LNC9bni38s+fC+ygBylouBUTdv2px978yg+qyr3Cr/E5Np5zML74+k1paGohq0AE6q/fL+R5gomxjU31Z+2fqRAJy6rW818Eqnmrps+s4UtjH9R3wRCqh1Dr12FENGll/2afoxFJRl5/IAbXIZbPeJ8kVvTB2pRZBvdd8fAz84zTTz6uiIzhNKoHnfTEugIRtgnmwu+CzmEe72n0wFmDyBhSzIfRUiZQvC5aPHwMp0KHQrDVA6RM+WU/cV6MNS+n4IDwnroLgL5aPXvdUuavQIXGmP/+R9+wiIh/mnPiG6J75fVnD8xlj4RgBt9aFuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQbeyUpcxHP0UttbckzSvqDGia0H3PNtqqBpsfm0zQc=;
 b=k70qYvBKKc1sncq3F5WO+UtyiV3Bpvh0GD2HYBc2Mv3eRXTPfc3rXjXKGPqtteH8t2/gM4/LIvRkTNBRzly0ZRckx4vJt+DE/xeH+3j6fQJ66h5IdwJjV4xk09/N27PGXDCW1bxpz2NOBVK5uBYLytNMEcJfkh+0KglksYVilPrJHb0ScsKonJqNxwMSWxedjOjzKh8Aj9eezInqkpM4JvVvpysWlqfrxTLcoF8t59O14DFab+lEhBKJC2qwLXBx8fdoNO4QzDXHt0xg8OBIwEuMBRlBMyxoqAOjEiDMUpm+RHthXdGu5bn/fWUou+MbYZE+K7GQ2jjLW+Haqvc3qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQbeyUpcxHP0UttbckzSvqDGia0H3PNtqqBpsfm0zQc=;
 b=TDL1nCZ04QqK+rft+jjbEkj6BU9vmXbMcjlI92hx19cWW41O/YFyHVfaCJx/oRNiKUmIjEMuErpti/M9PS9hU7sluK7QcKP8IWYs8Sbag8e/M72WMd3hi5kLQepnnUIBKR5EWm+Fbx6TnPbz9L7p5s35XMOJPwmsTJVDfCGLUMHrdzrJ+RHCeKY/P1vWIF3mSlV3OPPBYhxK8FvWCT0lJvIswf2Xby534KfeUOa43aZMJa6yMo6ewO1+SwbZ99bNtIax6FDruTAlDMFg6EgwL79UzdmicSH/g2Ouf2B8UjusgWV35GrFyqxZaMGGxW+NLTy3gbJT8hIPAP3ZfqGA3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from PH0PR18MB4558.namprd18.prod.outlook.com (2603:10b6:510:ac::13)
 by DM6PR18MB3667.namprd18.prod.outlook.com (2603:10b6:5:2ae::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 08:22:21 +0000
Received: from PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311]) by PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 08:22:21 +0000
From: Tzu-Hao Wei <twei@axiado.com>
Date: Fri, 06 Feb 2026 16:22:11 +0800
Subject: [PATCH v2 4/4] arm64: dts: axiado: Add eMMC PHY node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-axiado-ax3000-add-emmc-phy-driver-support-v2-4-a2f59e97a92d@axiado.com>
References: <20260206-axiado-ax3000-add-emmc-phy-driver-support-v2-0-a2f59e97a92d@axiado.com>
In-Reply-To: <20260206-axiado-ax3000-add-emmc-phy-driver-support-v2-0-a2f59e97a92d@axiado.com>
To: SriNavmani A <srinavmani@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Tzu-Hao Wei <twei@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=893; i=twei@axiado.com;
 h=from:subject:message-id; bh=ifJe6BWD6fxFLW7464vvxiIMU26jLX4+q7GsF1xfii8=;
 b=owEB7QES/pANAwAKAXgQMF3EWvHXAcsmYgBphaS6rE3FTeTnt6/4TRu1ugJ6vNikbc6Wy5sV0
 BDSF9j/9Z6JAbMEAAEKAB0WIQSZyWINOowtFmDvdYF4EDBdxFrx1wUCaYWkugAKCRB4EDBdxFrx
 1wkcDACjf2EzTt6pu8lijQ7XNiS09OG5SrmnUHdAEnE1mE6fI7h84y+wTLM7XFX6WZJVcG0PMyD
 9TjjqKrB93AxuoC7IFh/wcYFiPw+0F9aAVMIxdAs7SqVspTQSo3+VIyRvlrDorHSZEkttRMN7Le
 ykwhBjxhOSyYNw+DykR4taObdtwLmIBfnGF9SLODWTIRf/fConrUm3mWZbXrD6TzDHLjifC4I0S
 GO1NUnN34PkAg00ZbBcpIACufFffPRCl/yoQXDGV+lHTSjxU9d+HL6guGoDqQV77VI+e6aoxuKF
 eFU53aDrP4qdtg5GLBf2zbHVzNdIEfWdEAejTgSS/NUvXsIOdv4SaYzQfN9wq3wpZgDyGDLJXsz
 r6iGcndxE79Ee12UynRuYjHOeo522b78PYky17pvx3h9uvX0mtqkvlAQQUAHzafF7V1IkGo/M/q
 +398YK3NaGte0beJkPqOOusapiI2X3v6wOL0XJdkfLPDrL29rJZ+XzqfOLSzEx74kHmSs=
X-Developer-Key: i=twei@axiado.com; a=openpgp;
 fpr=99C9620D3A8C2D1660EF75817810305DC45AF1D7
X-ClientProxiedBy: PH7PR17CA0044.namprd17.prod.outlook.com
 (2603:10b6:510:323::15) To PH0PR18MB4558.namprd18.prod.outlook.com
 (2603:10b6:510:ac::13)
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
X-MS-TrafficTypeDiagnostic: PH0PR18MB4558:EE_|DM6PR18MB3667:EE_
X-MS-Office365-Filtering-Correlation-Id: b42a5e24-8374-4dc9-26dd-08de6558d901
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|42112799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rk9KNnBLOG0wd3IxMm9rOWxVS3R1Y1l4Q3ZYcDhYVGxTUmVMZGdCa2UzdXBz?=
 =?utf-8?B?VlV2bk42SlYzTk1IcHBoNGliN2QxYkZaZkxJVy9HMEJPMkd2UmY3UVMxOEZ6?=
 =?utf-8?B?VFN2S0M2dG1lcnIxc1hKNFk5V3NGZzUvYXV6dEhCSXNGektsM2p0NG5pRmpV?=
 =?utf-8?B?MGgwVG5WaDhPWnZ2bFNORlMvMXFPVWthWGcyd3lEMGUxUkpaNU00VGQySXdM?=
 =?utf-8?B?TExZTnQ1N1JHRERGeTVxV3JQL2RHeDAwVmVVeXRxT3FxN3MxL1h5RkF0SWph?=
 =?utf-8?B?RmVIY0xIaWxHNHZOcS9QQUQvYzhuN2s0ODJnaklHSm5ibW9PM0kwNUdwc0N1?=
 =?utf-8?B?ZFZneUJ0dUUxNHptelVHaXd1c3ZCbitUUUdiZWNGMkhSZ1o0UkNrYUxaV09F?=
 =?utf-8?B?MnhSeHppU0lYcWlYdStsbEpYTVJzQzRrYm1TekhvbzllOHNGRVdrWCtiMkJq?=
 =?utf-8?B?Q0wwVDRzR1liWHNhYUlyYjBadWdyR04ycEVuRXJ4VE9pa1NWQnFaWHp2RDZJ?=
 =?utf-8?B?VWlpd084eWZsRExvTkVSQlhYWkx4VDE1TDNJcFh6RUY4RG0xV3ZxenZYdndR?=
 =?utf-8?B?L2xuNDlyNzFVYk51K0sxcmVOTEgyRVpReEtzZjF2emtiQ3gxZ3BsMDk0aWQ3?=
 =?utf-8?B?eUJKbzBtSWZMRDRmNlF1KzY0NkhicWVqa0lyakplcjFsRGJ4SitIMDV1OUVX?=
 =?utf-8?B?VEUwK1FvWXVXV0hXUUxLNjI2dEowQmlkdTMwNk9mQnFGTlNnR3R0M2U0OUJr?=
 =?utf-8?B?TE5BL2FZLzdpTE54bG9abzZWL2MxT2I0d01xKzErRi9uQm01T3ZVSG9YMGdM?=
 =?utf-8?B?cGF2YXQ3UllRODJCZllmUExFMitRU3VuU1BvWktHY3M2Ty9kaUJnMUhoV2M5?=
 =?utf-8?B?R3BiaTN6bkdSZ09rQmNhMUMyc3RXR0lSeWp0djA5WWlDK0l5WFpHZWdpQ3hv?=
 =?utf-8?B?RUM2VldKeXdXK0RPSG5ZRERUbFVrN0lUZFExM1l2TWEzeEcyQ3kzZ254WFpw?=
 =?utf-8?B?eHpPcXZxK1FtOVBZQXF2MnpRK1FVc3VZMjNRd3lsRHl2Tms2dDdOYzJnVXBl?=
 =?utf-8?B?Y0lBK3MxTTFHTzZEdUx3czFnQTN1aEthU0FBdEJXaFR6aGp6SWtLU0tjcHM3?=
 =?utf-8?B?cjFIS1hwdCsxKzR1MWduODMwa3RydWhqanJ4TGpOREkxWEZ5dExiK2k0ZmlN?=
 =?utf-8?B?bWpTYzQ2MHNYaUN6SldDRk15MCt3WFJSVi9nODJFR2tXQWtyZW41QkxOTFBs?=
 =?utf-8?B?L1lrY1ZCTXQyZjdwTTRrbjdyck9OM0tNdUF3ejg3T3Z3OGhwNk1FRWIxU1hR?=
 =?utf-8?B?YkN1eXdsWlo1YnorSCt4Uys5clFEZWZkSG53azdCUmx2cGtHRVluWjV6dUQx?=
 =?utf-8?B?bmw5QVEwWGhHVXQ5dTk2WWRBd2paTWFiSXR6Q1pnLzJ1WVVTRDhlZ29mK2c1?=
 =?utf-8?B?ZFFrS01XSzBiMG1SL1JqL1o3OWhLMVFObjZXZXdYOWVZMnRXMnpiRVRTQkty?=
 =?utf-8?B?THJxSmV5TmFLOU9PU3NKT1pRRGkvcUtmN3lUb0NLeWFtWHZHVERMZE83Wnd0?=
 =?utf-8?B?S0EwTGlrajloYWtHRzMxdzhqMGNGNHFBUm9VUDlsdHF5aFdwNmNsOVhvZXV2?=
 =?utf-8?B?elM5WkEyYlhLODRtUnhhMXFraHV4MHFPbzNrandZZGpuMDIyOEJmQnNBVk5x?=
 =?utf-8?B?eTNVcmdKMlJNd2dNd0pmM2lpSnAyMDZDbHV0YWUvQnBBRWpjVnJEWDFKdHhI?=
 =?utf-8?B?TkhtS0lZSHI0ZkdUNllTSFd5VDRyaTZOMVFKT3VyaE53c1U1QzlmUUw5S2ZW?=
 =?utf-8?B?RGVUMGU2dHJtN3gyeGN3U2h0Ukl4THBZVExKenJnd2RYUnRpL1ZLNzJHRUFW?=
 =?utf-8?B?a0RpQlRpNS9pOWtUaXpkK2NoOG1sdEU5eVJSM01DbW1HcFlCM3NxdzVmTHZF?=
 =?utf-8?B?QWowZzlQaVNqamVhQlZGVDM0Z2d0NjVSNnRZakZZZHc5aGtZL1puNlFIbVdv?=
 =?utf-8?B?WEFDRnR0UCtobUNiQWpDSmgwRHg3UlNVTkFGVFU0Zmp4OEc4WEpIZHBVVDZC?=
 =?utf-8?B?MEtFU05jMHhjNDFLbnpaY2JUMUpWeDZESnBNc3NyYmxVa0FVdzFvOGZsNlp2?=
 =?utf-8?B?ajZhMTFBL0JHZDJ5TFZqUFljSWQwS3RlUTJoRzZJdlFhQ3lIMTlQWVpVOXFR?=
 =?utf-8?Q?yKNdoMbptZMWMb4tUJ2+OYo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB4558.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(42112799006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFE0SFoxc29Ja0d6MXUxWWtYNjUrTFRwdkNlcEduUFFlRzB5bGNHTjkzaUlD?=
 =?utf-8?B?VUFlRnVlS012OHBEVmxKSzB3L0VKSnBYSzl2djBiMnpBV25PeGxOK1dRaU1Y?=
 =?utf-8?B?KzQzd3FhZkY4SHE0Q1UreGNDOFpEQ3RQbk5yTmo4VTg1N3pTbmtmMGFBVFhh?=
 =?utf-8?B?OTlRMnZFK1MxQjFpeUxuaWcvbndYTnFYSGFVQTNMekEzbFE4YjdEOXQ5MmZV?=
 =?utf-8?B?ZWEweXhOZ05GUUExK2xybEFLMVduSnFUUzZSNnQzdUpqNGVNSjg0blFRMzRk?=
 =?utf-8?B?TVB6NmlIQzc0WDMvUG5ieTZLYTdtOUo5QzZoZm1rWElYbjFlZGFLVEFTUmJl?=
 =?utf-8?B?cHZOd3RqS3VlUGc3bnNxSTErVndQQmtaR2M0K3NpdjcvNWpJa0wzNXBZem84?=
 =?utf-8?B?Mno2Tm9sREU4aFlSTHBXOHgvTW9nWXMwaXRKY3RGZDBQSnRSejg0R0NtQ1FF?=
 =?utf-8?B?SmNlajVmTGM1Snk5Snh1L3J2Q0xpNVEzQXNhUVVVMjA2SlpvVmtyYlJaSDJo?=
 =?utf-8?B?OTF3TU9jQWZ4WElXZGVWRmpQVXpOK3prVHpma01PYUxvaE9wR3BtM1h0NkRt?=
 =?utf-8?B?UHRORklQTVFIUzRSckJTL1djN0I5M0J6blZuSnhtMk40dmJ2TWowK0srL0h3?=
 =?utf-8?B?eEFtOHk1cG5JVFZkSU9YaVJlcWdwWVFib1NCUkZDMkZtWVhBMExRR1UxN0VI?=
 =?utf-8?B?TUZneElDU0NuemRYWmFYL29yd3FyOFFEK2IxZjVmaXZyUTZYVFFGS1V4QUdC?=
 =?utf-8?B?K0lURFhOY1lQNzFGVmFHdENHN0dVMHNRTHExbGdGL0FBN2xvOTJLU1VKSTNR?=
 =?utf-8?B?aXM0eXBGZmxLb0VnUFZMRUVueCtxTHAyTk0rSXlOcmpCTkdkSnN1WU9yYnMx?=
 =?utf-8?B?dVFFSWU3dkpwSFlDd2tyUE8zekFLRXZaTDFRTTMwTUxlU250cUp1Y1piZjhQ?=
 =?utf-8?B?N2o4UHpIZisrck9YdWV0a0M2VnlHSGc1NUM3RC9kSDZDa3l4dkt0aXN5R2t4?=
 =?utf-8?B?RWgzbE0weCttUWh1Mi83aVhsYUdueHMrYUZJeGEzYlBSaVVNNlNyZ2Z2K0JI?=
 =?utf-8?B?bGVNcDVHREVieDRPRGRoeHpQd3N5WE90REZOTUNWcHRrNnRRYUVJSk5Qd01o?=
 =?utf-8?B?dllMTi9uS2RHKzc0ZHU1aGF1MHJ6YjVqcUtzYk9FSk9Fdis0eXlkakF2cnB4?=
 =?utf-8?B?VVI2blo4K0VkVXZORHdDNzJDZDhWVlViVmhTekdiemJTUjZmOERhbXBNYVk1?=
 =?utf-8?B?MGNKWHVYeVROaDFobGdCeWlLaWVlZ2Z0aTFVNlNMRWozcllkWGFJK1QzNUVT?=
 =?utf-8?B?WndDOFB3UitYRVVUN0xTUkRIbDk2Yjlya3BGZEIzeU81NFJkWVFreEpCaWNP?=
 =?utf-8?B?VlZiVmQ1eWhOMGkwZFNMUW51ZFJVOVFPSFNucjVoamF2dzNXNDdpQVVrQjJ3?=
 =?utf-8?B?R1RXUm5GNlJsWUpxcVZndjE5dEVmNUw5TkJxWjZmTDhjWi9MbnBGQmgvN1hs?=
 =?utf-8?B?VXU3UzB0ZWx5SzBwOFYzcjdyZnpPdGYxSXpPSHExTi9LakNVRURPUDVncWd2?=
 =?utf-8?B?dzRNNTU2aUVzTFhVMG9ONmFiaW12V29qZm5ZSHlESnFRaC9BREhoYnZnak51?=
 =?utf-8?B?V2dqNWxJalI2aXNzUDRBRGJBQ3ZvWHhQN0g0Y3RzNVVMcTMwRDFMdSs0TWs1?=
 =?utf-8?B?R3JtbVBsT3k2YWhCTktiRTd3ZUNIbEQyYVhid2ZEVEVCc25lMUZibE5OS252?=
 =?utf-8?B?Sll2T3EvenZFZ3d0Zm8rYjJpSkFtcElCSG5hWDZpM3lycnNQWTdsRUZGUmdq?=
 =?utf-8?B?ekVnQXV3aGQ0SmlqTjJqMTdiT2lNM3hnV1FGQi9KRU54QVB4YkRTZUdwOC8z?=
 =?utf-8?B?U2xLbVJSbSt3UEdlMDk1TTRBakZnaG1IVUpiTDVoempKMkVtV0RBcTdMb2lJ?=
 =?utf-8?B?MmkxZjVzcGhXOHlIc0ZGSS9heHkvaFk4R09keFFyQ0EwdXV1OVpUOFN5SmlS?=
 =?utf-8?B?ZkpJdnk1aUJsb21jUWVuNmx5OWp1TzJWd0VqcnB3STVCaDZySzlENWlUalc4?=
 =?utf-8?B?NHBjL2tqNEZINXhEUTNOVEhhWnRwZU5LODljYVY3b1J4SmQ0YjVsRTV0Y3Az?=
 =?utf-8?B?TThESXErWDJlMUYvQlBlU2lxSEVLSnNJSk1lTzNiUDdaRmZkQlpEUGxIVk1m?=
 =?utf-8?B?dHc2RjVjTnNUZ1h0UWNvNVRaU21hcFkvdCtlb29wVlRZbFQ1dXRKNithelJX?=
 =?utf-8?B?VDYxdEN3QjdESDRrOFgyVDFyNHlLWGlyZE51anBneTNQdGYvdm1DV2tDMkN0?=
 =?utf-8?Q?2ow00uHD+zkenoTItf?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b42a5e24-8374-4dc9-26dd-08de6558d901
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4558.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 08:22:20.6203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WzOm2k9C7htcZxu9XBb2Zg+YDiMiRZ90I7/PCvlVbhXER/Z3uf+YRs01V3D3m0zJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3667
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.80 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[62];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	R_DKIM_ALLOW(-0.20)[axiado.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-1333-lists,openbmc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[axiado.com];
	FORGED_SENDER(0.00)[twei@axiado.com,openbmc@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:srinavmani@axiado.com,m:pbolisetty@axiado.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:twei@axiado.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	DBL_PROHIBIT(0.00)[4.204.166.96:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[twei@axiado.com,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[axiado.com:+];
	NEURAL_HAM(-0.00)[-0.922];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[openbmc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,axiado.com:email,axiado.com:dkim,axiado.com:mid,80801c00:email]
X-Rspamd-Queue-Id: B8DBA10A7A3
X-Rspamd-Action: no action

From: SriNavmani A <srinavmani@axiado.com>

Add the eMMC PHY device tree node to the AX3000 SoC DTSI.
AX3000 has one eMMC PHY interface.

Signed-off-by: SriNavmani A <srinavmani@axiado.com>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
---
 arch/arm64/boot/dts/axiado/ax3000.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/axiado/ax3000.dtsi b/arch/arm64/boot/dts/axiado/ax3000.dtsi
index 792f52e0c7dd42cbc54b0eb47e25b0fbf1a706b8..ccc8088bd8258cfb666268b14a3b0716a9ca69f4 100644
--- a/arch/arm64/boot/dts/axiado/ax3000.dtsi
+++ b/arch/arm64/boot/dts/axiado/ax3000.dtsi
@@ -507,6 +507,13 @@ uart3: serial@80520800 {
 			clocks = <&refclk &refclk>;
 			status = "disabled";
 		};
+
+		emmc_phy: phy@80801c00 {
+			compatible = "axiado,ax3000-emmc-phy";
+			reg = <0x0 0x80801c00 0x0 0x1000>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
 	};
 
 	timer {

-- 
2.34.1


