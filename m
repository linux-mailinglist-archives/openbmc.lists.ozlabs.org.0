Return-Path: <openbmc+bounces-664-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CD3B87282
	for <lists+openbmc@lfdr.de>; Thu, 18 Sep 2025 23:36:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSTS50zlcz3cZ0;
	Fri, 19 Sep 2025 07:34:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::9" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758231285;
	cv=pass; b=co9v62vPjMVgpZ2jzzrDeKnp2QT+moegxrZ8xNSkVQjCqcyUGDiYSiXCnG8ibg7Ygkuw3NpiVmEkZAjDQ4MyVRkQWfz9xz1auU3uDqUy5O3g7BTuaRCSmztqcN56KsakceUreCRMzh7XOhyWLGPiX6yDOhtDzIcdCFK3D1z94h8XGJF2UU8O1nz5SKBb3JMdwYJtXE0lRz7rvSblZFNF5Pw3AK8ht46U2skEE+PqhvqaGe2K2IydO6BbiYEkYtHbsNXx1D3WJqEniStlT/mdsutO/aQLXjjKLTsUkxCncdco4SkNjaJnhGyo+hklvceY3hjXPbCltLF6HvBC4CZ3Ng==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758231285; c=relaxed/relaxed;
	bh=+TtSn6F8QH+F6P9SUzVZdhPWJYheU7trbtKqFDSBBZk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=EJLIDxoS41iE0wENB15Dtam29dP2/hYMOmW1X0a3KLz6PB9mUMwIKJ0+P/S9oFK8I+rU1JIVCHorjI5dgSIyxbB/cLtv/7ejj02bxSFQDlf4Cr+GJKzEKs473ivWyNvzFdWrSksktEjAlGVfEmll/9eYohjSET0UsiQZXP6VLH11J7yaRwnS5+GNnUpLwn4I9tcRvePdsngxyZsdKpOSDqcY/Glo6Xb5ZSuYoMGQ44NPKkMpydYrl6WpKL5aUbMZoS4QH6SxQYCB65uLmnu0oODWuqa6hKZTmrt0s/9lP8QJehh5cGKIsBGSPyTwBFWdXsfXYFmbubgeg3dXyRI1fA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=J3BnW42l; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=J3BnW42l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazlp170110009.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSTS442yTz3cZM
	for <openbmc@lists.ozlabs.org>; Fri, 19 Sep 2025 07:34:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cip2tROVN2QPpWWSTaNm73gezV17aVQr8UtxkzVw2kebd+zpykkS8jADuWkuXpt/DR5auc7LrOZ26IGIBE5sD9/MqaZMN6neebnxqfzt5D9IF1OL65o9EXpOdK7jg6f7xuL8R0oBTxQjZMTxYuJbODyD0qhVpYr6SAJEgm24zBj1Q30NHoV7CwJX/L+OGzSxvdSWOL7O0drRwf3nCebKQDQtDlJouVWaQKsbzGoaALT4w+CimXVLUYC8dWxShLgyvBVeJvae9bXnj2F7E91jQEYBRMD5daXgNPLONxaytcViJfhKawOFlJTa34tt9IfRrlmVXk/giNG0do84stfcrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TtSn6F8QH+F6P9SUzVZdhPWJYheU7trbtKqFDSBBZk=;
 b=BdMJqpM+akLbdrExf2d6VbS6MK5olUO6wKH2wqEqRN18YxQ5WPmoSGZnJrLDjoSDftYGFQqKcILOnxZy21B0G33AIL6j5b7UsNzRHkIzA++9+Sz0NywtiPoqDzNp2XvIjbXz4ueCFVO2xwYioZkbA/kgQz9loeWIhCJfd/jkHDvA9JTDa7erq9AcIIhgqlrFbojM1K8eroO80G6un1c1OxSwxH84QoU8MT5Lx3GvAZboEeJxs8o2Xe1RVD5F6UC2ruSVODRo/VC7nQ8MaV0cJz9yXDENMFhfloOoSwMfEJmFISyXRMUHYwah43xeeT11IovJcnE/Z5M7ZCtOwX8K8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TtSn6F8QH+F6P9SUzVZdhPWJYheU7trbtKqFDSBBZk=;
 b=J3BnW42l9vvTn+aXEBSMPHzz65z2v2L647w2krqjVEnru/+8kxZ2OZvZpG6ntWT+n3KWzWQX8MBP7onlvmNM2VYmbmgitlVg9NTbV6Hd6ofIU36oS6lPpcNk9zaS2J4K1MibkbiSw24dMZgZ7x/Zeo1+lnhwBYm3MBnrpqtZ1IJ4bIFKpiG4Z7pwfQF6rRFxJ3h9/BAIV9F7ruRULShyGHd5mc2bMb2uB4IfwnJ+8aD9oUAaS7qe4PtqofkgD4nQlTnfWXqjnlo7cPBR3RjcF3EMYNbuKrH6qF7f6vXLE8puzTe/FKXTsE9yVlYDcdC/1Z5H7KlbGpg7zs9ekUm46g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by SA3PR12MB8024.namprd12.prod.outlook.com
 (2603:10b6:806:312::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Thu, 18 Sep
 2025 21:34:25 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::9de5:7299:4ee9:21e8]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::9de5:7299:4ee9:21e8%4]) with mapi id 15.20.9115.020; Thu, 18 Sep 2025
 21:34:25 +0000
From: Marc Olberding <molberding@nvidia.com>
Date: Thu, 18 Sep 2025 14:33:54 -0700
Subject: [PATCH linux dev-6.12 08/14] net: mctp: test: add sock test
 infrastructure
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-mctp_gateway_routing-v1-8-8fdedda742c3@nvidia.com>
References: <20250918-mctp_gateway_routing-v1-0-8fdedda742c3@nvidia.com>
In-Reply-To: <20250918-mctp_gateway_routing-v1-0-8fdedda742c3@nvidia.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au
Cc: andrew@codeconstruct.com.au
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758231250; l=2052;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=fNzn1pq3BV04VOoZo5BYXlNlyK8uI1GDH3uHOmPmPj4=;
 b=vZO+MO+LLb1+nBH9D+lQYnjnTvT0uMhjoeq2bC77+4SCtZJi//5HiZki/a+qrFk0dqbRaXBp+
 B7vvHImW1zZBwKC9Ff6eHpWEoMYLJ4/NUMbjUlcJt090xXmlUMad29n
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW2PR16CA0050.namprd16.prod.outlook.com
 (2603:10b6:907:1::27) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CH1PPFDAD84AB72:EE_|SA3PR12MB8024:EE_
X-MS-Office365-Filtering-Correlation-Id: ff3d6792-b8b8-4245-b474-08ddf6fb23d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UktuWFhlSGltN1JjdFFKSUhVU1VaMXEyU0MvemhhRjhySEZvb1JRZ3FpRUpG?=
 =?utf-8?B?WlJWTFZWYjk0Ylh5ZTVwOUpZcDNRSmc3ZE0vY3Z1Z3BHcGNIQ1pHWHVtZ3F1?=
 =?utf-8?B?emQ1MTlPTERleFBoanMyZGxPektBSkhKMHQ4dmJkTXZwNXFoclJKdFNNM3hT?=
 =?utf-8?B?R1hwbVdJUjFkdGIwdm4vVmdpNGhKRDNHeUxHb3Fnc0luclVVRDJJRnRCczlp?=
 =?utf-8?B?cUhjcFdsYkhiaTBPejQ0MlZJdHBrZE52dmliTVgxb3k5Slc2ZXRDdVF6cWhI?=
 =?utf-8?B?cjloVEVoSUthTUxMSUdNZVEyaDNaVTBNbWttZ2E3aGJRVHNsNUdENndoZEF0?=
 =?utf-8?B?dTE3MGpqczRHejliQzB2NzJPRzRpeU5nTVRUczlzQmNCdk1WQjhxOXFrdCti?=
 =?utf-8?B?ZjR1V0JRVStyUndvTzFIZXhBeUpQRWpHeEFFZWNac3J2eWhsenhuM2hjMk9S?=
 =?utf-8?B?dTlTNEo1N0tDMnQwdDdWb0Y1T3c4MmVGb210dkszc3ppMHY3U2s3SVZoNkpo?=
 =?utf-8?B?ZGJvazUwdElPZkRmdW4zNEs0cUR0U3VSTUdwd2Q2ZlY1Kzl2WE5wZEFic21U?=
 =?utf-8?B?VUJ1QVcvOGZia0NHRW5zb3BhSFpnRUdUcjJibFpJSVRBQlNIZklaZ01QL2hM?=
 =?utf-8?B?SkNwMGIrcUlUQ1ZiVkwybWNrSFV5WlJreG43dTFZVWdjR1FDNVpPbGRxNXBn?=
 =?utf-8?B?UzZ3ejFTWWY4YThvQVZOT3JhbUVDZnMyMnBqdHE5OStFUkdhL05QUUlSVmNQ?=
 =?utf-8?B?c2ZXRnJCQWh2dFMxRGhJeGZrZ0RtM2VwT1l0WjU2RHVnUTVROVBZTTUyZmxT?=
 =?utf-8?B?OTl1VHR1TG5UaHJWelBBLy84eEVDRjVha013N1NUdy9TUWpueVN5eHZFb1ZQ?=
 =?utf-8?B?VkdNYnBPUVFxcDNDaW9SWkMwNm0zcmhxMWYyVW9Bam40OXMrVmVTSTdWV2dX?=
 =?utf-8?B?VW11anFIbjN5UWVSVVhxZU5PeldaUWo5WStNN1R0MHQwOVphb2liMWNoNjg2?=
 =?utf-8?B?OUhmcFNzVVhVdUFxVVhrMXgzUkhhZE10YzcxZ0YrTjM2NEF2bmRSc2pJZkpQ?=
 =?utf-8?B?R3NMTS9vWlZzSDBuK3N1K3JXaVBTOXFER2dKU1RsQ3hJS3BVTFZ5akV3N2Vv?=
 =?utf-8?B?WmN6SkhhakNZbmg0NEJKcXBicy9kMW9kRjNsZHR2NExzaHhEbXMrMGFBa1Iy?=
 =?utf-8?B?aDg2UTduM3kvc3QrWmtSb0RmYk9lT1ZNVkpuQlhYemNwT1cwdytpelorbUdw?=
 =?utf-8?B?aDFjMlBBcysrZGppMS96VDYwR1dwcTFaQmpna2MxNWR5NEhUMzFEVlNxM1J1?=
 =?utf-8?B?TmNEU2pmUFRUbDZJMEZhb1BpaEh6UzJUaEo2NkdQTGhZZTlWSnVTY1VlRXFq?=
 =?utf-8?B?TlJaMllHN2RXZGExb1dtYTZmM1NzSjR1eWtpWk5SSDBtVnhjYjN6VGUwNk53?=
 =?utf-8?B?bGdMK1pxeGtOOE1LRE03NmNhWFlCUGZVUDJDKzlLRnZ5a0VQTFVEK2drZ2dG?=
 =?utf-8?B?dU9ZVStGV2Q1K1htRnJHUlRBMVZhS3pXWU5VVnRXemwvbGU0VUI1dm8yamFo?=
 =?utf-8?B?WmRMOE5Mek9uQUs3amRQeXQ5K2ZEVkljZ0IveWVGcXVSc1R4UkNKUDM0V0VP?=
 =?utf-8?B?SVZtOGo3TDNKa3FsbDNmQjhVR1FCcENicFRYK2hNMm1jN0hQRC9GTGN0bGdO?=
 =?utf-8?B?WlV1bGVlaDYxVjR6akIvd013WUwvbDlqcXFONE1ZeFNJWnhrY2ZTaHljQ3BO?=
 =?utf-8?B?WjlJSjI4clE5OVlGY2NGS0NBVVg0RkF6SWtvWXUvdFhwajZVYklhNm45Mmhw?=
 =?utf-8?B?NE8yL05nU3V4aDdUK0phQmREc1ZON3VJU2syRHdBMmlpUHlSMlMxcXp2akl4?=
 =?utf-8?B?bmw0Zm9XRHU1TEY3Zys0WG1xMVVaYlVIOFhCd0Q4ZHZsTlpyTVhvNzlxaXFU?=
 =?utf-8?Q?mPMXGg/Os1s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0ZtVVhiTHNtYU01L3kvc0thOFVqaTdkaXE1UWhGb1lHRmpKUCsyVnptQ0lE?=
 =?utf-8?B?SzcrMzdoVnpNUEpJT09FQ21uZXJEYTVESjdEcXdES1RKcm9VY2p6Z3NXNk5V?=
 =?utf-8?B?anBSdGhxWllGNlZSMXJyd2crS0dlRlBhS0ZvMHdSOFBZRzlvT0c4QUFNaUNs?=
 =?utf-8?B?U1J4eFlxRUQycy9WbElZazhPZW9sYzlFSjQzWjd5TjBPUFcxV3d0OUc2Z09D?=
 =?utf-8?B?MTJaZ3grVDhVamRqcXdiaE12VkhrU0RMTjk4RW1WWktUWGMxUlpIalFwYnd3?=
 =?utf-8?B?K2tFang1TTVnT083bnlTZlZvd1p1RDQ4cDl2R1R5NjlSd1hwMnZCU0NUcEs5?=
 =?utf-8?B?dTF3VHM3N0laV2lGRkk4TGR2MVljTVVSdUl6cDc4cU1tZVFWd215eVhua3hJ?=
 =?utf-8?B?SzdnQnpoM2Z6ZCszY3RlVzRxdU1IS3grRlJXN1RsRERGTUl3OHovUWVmMmdz?=
 =?utf-8?B?bnBycVhRa0ZPR0p3ZVNHUXNvb0ZBMnl0SzY0Z0pSa2s0L1Q2dXFQdUs3L0o3?=
 =?utf-8?B?dnFURU1DMDlrbmxMRmNQbDIySGRDcWV4UGszU1BSMFNTSTFINCswYXZMVDBi?=
 =?utf-8?B?TmpOelZodkJmdHpGaE96K25BVDdkanEyYkpZTDV6Ym9vYjUvNjhmSnZGaHNO?=
 =?utf-8?B?ays4V21oenlJbzBrUmhDQThiTFFuUWVkUXFWY0VPNmRBd1FNRnNPWWRNRlpX?=
 =?utf-8?B?MlpwUmNDMUQ2UVZzM1FyL3gwbjVId1lhQ0RPb2Q1clMxNmkwd3RpSzFtUzRy?=
 =?utf-8?B?Q3pGenB3T1JwZTlCWk1zcEE2VGdiek5kZlRNcTNJWGkrODdXcHU1WmNNUE9F?=
 =?utf-8?B?VmVMU1gzWE90d3cySHBDWjI5ZGpUQjI4S3g3TG1acVRlcXYrT01FcTJUSSsx?=
 =?utf-8?B?MmpNWFVra094bU4vZmlyWE5JOVMxdkxvc09oWVprSnYwc1kxTjdadm9YOUFM?=
 =?utf-8?B?SmQ4Ym8zNnVsWEdsOWlPdWk1YmR4Yzd4NStGNUMxaFNiV1Q0a1VYMDRscWJ4?=
 =?utf-8?B?cGZVV3BRYVJ1L21tRVdEb2VHZSswcXlYaVZzR2JoVGQwRUZnTVJXLzVuVERT?=
 =?utf-8?B?cHZRU09wZE8wK3lBQU5kbCtPOVRLcDVUeUt2N05jdW5abzM0dFFqcVZ2VVYv?=
 =?utf-8?B?S0xLSEhuYXZpMVVBZ2R5dXZkZUJqK2RjeDZ5VFo3Y01YK21XOWVyVDhNdVFG?=
 =?utf-8?B?cTJqQjI3MFY3K3R2NlVJZ01KSTlEMjJlSTBvMG5RbGIweFZiS0J1VFpRM0ZL?=
 =?utf-8?B?d2xWQTZYaGM5RnBsS1Q5RGdFTjN6MmI1WXBCTmFFMDU4eUtJa09pUzR1OERQ?=
 =?utf-8?B?cWg4V1Z4WENYeUVGVDlkMlBBbHJYN3ZaUXBXT0x4VEMvaDRRcVBSb2JRMzBj?=
 =?utf-8?B?QVU2SjA5SVZodkFqRVUwZ2Q0UXlIL3M5STBYTldpWU5aRDQ0ck13R3o5UnJY?=
 =?utf-8?B?ZmN0L0VtL09mTmFIdm9MTDNNWXcwb0V5R2Nkcmw5YWxwWXBvWnp3VHRYbEh5?=
 =?utf-8?B?Y0J3R2o1ZSs3YlBDeml6ZHFDTmRwWkNNM2dUM3JTSmJ0bGxuRWI0ZmNSSkVD?=
 =?utf-8?B?ekM0c254VmxFQVpIdnUzMnhscGhwY3VWWkZMeExFam9nRzc1T2JnWk9ZaDdP?=
 =?utf-8?B?RGtDQ3pXNnJiVGNOaGRVYXc5SkN0alNFamVrVHpsQldSZUtBOTdZR0RWbk5T?=
 =?utf-8?B?MXpzZC9qQzlTYnM0NnBoZzFobzAvWGNzaW03NGxDVndlZUYzeUNvckpRcDNF?=
 =?utf-8?B?Qk5zUjFKMGxwaXBDSHVjOERMRTdPcDFNUVFXa05WbWg5MGZNdmMrN1JMYzRo?=
 =?utf-8?B?WDFtTm1SUTRwSUp6MEt5RitSMm5ldEV5RDhUMHZvNHEvT0x6ZnZZZUtMd1lH?=
 =?utf-8?B?REgvUHNDazhyc3FyYlR1VVk5WEFNanpnZGxPMENlalRnSWN2NlFDbHZZMVZs?=
 =?utf-8?B?VDBXN0FhcG4wQ2VmZlI0U3V5UUxISlRTZXFQOHZhNndHNGkwb05YRDh2dlBz?=
 =?utf-8?B?Wm5KTmRrWHRYMEtnNEpLRmlCVDBkRmh1cnlhd0xKU0R3dWk1UUpYbEl6VDE5?=
 =?utf-8?B?ckdrN1hvV1FTSWswN29VYnpMNWdhNlZCMnphNE11djhiOG81dk9pMkkvc3VC?=
 =?utf-8?Q?/z/3hXN8mc2m/fYNnQnIwUly+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff3d6792-b8b8-4245-b474-08ddf6fb23d5
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 21:34:25.6561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0CKtJW3f2SRe34tTzeghHBcrtEiy36FQKS/JE2ULwjmU7QdGNBRmSxFZnQLEtWX36+QENViFDaebsa3WclR/Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8024
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Jeremy Kerr <jk@codeconstruct.com.au>

Add a new test object, for use with the af_mctp socket code. This is
intially empty, but we'll start populating actual tests in an upcoming
change.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
Link: https://patch.msgid.link/20250702-dev-forwarding-v5-8-1468191da8a4@codeconstruct.com.au
Signed-off-by: Paolo Abeni <pabeni@redhat.com>

(cherry picked from commit 19396179a0f1f912b22c051afb468482b0d9466f)
---
 net/mctp/af_mctp.c         |  4 ++++
 net/mctp/test/route-test.c |  2 +-
 net/mctp/test/sock-test.c  | 16 ++++++++++++++++
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/net/mctp/af_mctp.c b/net/mctp/af_mctp.c
index 19193c3915e6ac0afc8c0686f443c442afd03a3a..956472f0cd712983e46cabc55acebb9b97507b5e 100644
--- a/net/mctp/af_mctp.c
+++ b/net/mctp/af_mctp.c
@@ -795,3 +795,7 @@ MODULE_DESCRIPTION("MCTP core");
 MODULE_AUTHOR("Jeremy Kerr <jk@codeconstruct.com.au>");
 
 MODULE_ALIAS_NETPROTO(PF_MCTP);
+
+#if IS_ENABLED(CONFIG_MCTP_TEST)
+#include "test/sock-test.c"
+#endif
diff --git a/net/mctp/test/route-test.c b/net/mctp/test/route-test.c
index bbee22d33d6d3bb89cc61a0e010b8c4f07c68eae..36dd5e9ba27a0cfc6247ff321e884a9e128ee535 100644
--- a/net/mctp/test/route-test.c
+++ b/net/mctp/test/route-test.c
@@ -1204,7 +1204,7 @@ static struct kunit_case mctp_test_cases[] = {
 };
 
 static struct kunit_suite mctp_test_suite = {
-	.name = "mctp",
+	.name = "mctp-route",
 	.test_cases = mctp_test_cases,
 };
 
diff --git a/net/mctp/test/sock-test.c b/net/mctp/test/sock-test.c
new file mode 100644
index 0000000000000000000000000000000000000000..abaad82b4e256bead6c0a6ab0698bfa4f75f8473
--- /dev/null
+++ b/net/mctp/test/sock-test.c
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <kunit/test.h>
+
+#include "utils.h"
+
+static struct kunit_case mctp_test_cases[] = {
+	{}
+};
+
+static struct kunit_suite mctp_test_suite = {
+	.name = "mctp-sock",
+	.test_cases = mctp_test_cases,
+};
+
+kunit_test_suite(mctp_test_suite);

-- 
2.34.1


