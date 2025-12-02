Return-Path: <openbmc+bounces-965-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7203C9D603
	for <lists+openbmc@lfdr.de>; Wed, 03 Dec 2025 00:54:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dLczd605gz2xqf;
	Wed, 03 Dec 2025 10:53:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c107::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764719613;
	cv=pass; b=JkkixbiU7kZMf8bNl70ECiaCX/y+1FuquXzoQY9DSEFizUVj77eSOIW6EZEIhRv1YTVWrRChOAMFbL3OQ8QrklONOtNes13soV/GJ+EvmnPChwqFYgyiZ1Cs3J87TsuMIzVC8H8eszNts6ngZ0mrFv0qZ85Gf8Qivr7toIEwpfpg/dr4Jf3RGcK7we2FUjFI64OIN8h8VX5k9pH4xq0hPlOYicp5uot6dw69Mf+srfhuMFxCAj2P22tKwHvc1gH1ElzgrKeimSc/iGa0ZsWKXDXgsWR5fx4miiKAurjoKH7qp7/TPkOMnDzqxdA7VJDtLuqZUaX0bBAOUN4sztqngA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764719613; c=relaxed/relaxed;
	bh=N3STt57BjIl2GQ9EtKM55/Doo3ksOQBgJvQ/3vCutJs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=YB+BIJUKj82GCKN/PZEcSYrn2DIbrJYQggadAjaMqEp7OmyjQ9xtuMeQF14vDaqNs+cQ+N4IZNy9KfnEKlZe3X1/2QzDu4+jNGppdDnNYiir6N3VI5Mp2BT6BCk49bwRcjcDgmna3YTP1kFDIg2GaPny+LHFXmezMgTZwQAMgBpYv8Ub3bvrsRnGLHvfrUu8/oHvx1cq3Iap0YiLJsKsd9j/yuZ0c1FCZNFWnNXRlhKAbOOXek8gagrQXVWNh3XT6EPFP+K6opzdRPxp68EWmRjzolQMU5HCIApKkfhEnYtjXvUv6tgkr9OYuE9pD10L8/Y9qsEwQLIS7M7Ol0TlHg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ORlVgxnI; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c107::3; helo=ph0pr06cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ORlVgxnI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c107::3; helo=ph0pr06cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c107::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dLczc6sSqz2y5T
	for <openbmc@lists.ozlabs.org>; Wed, 03 Dec 2025 10:53:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eO2BBZDo5JxN4zvVkqgSlgP703kinAw8UmOFSZmcAvkXTjfVKwZ4DJboYk+uCWnHV0FpJWjdbBIrsXamVqzqA10vRsc+qLAJQdWZRfoiasviGAFuH22T0yTmlmaOhhK2Uvk8RzcVrOijj6mhJp3P90wwmbApi5OJqiaJmZZqbpZE5Wksr/uXtCnEsw2j2v9j11sSLDb4t75LRICUh1TA2iU2/Hn09dVoHfy5tSSkSCDtsiJlSMkrEBfM30/Yu6E3XGKEXxTGviwi+qxJ7lC7NnqgwPVB8TekkKCI9m2QsmJ/QSGL7f6zOTpmIGwPppTklythV6Fv682m3KkJDRV4Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3STt57BjIl2GQ9EtKM55/Doo3ksOQBgJvQ/3vCutJs=;
 b=CR3RNXj6jOsHQG4FZqM/NK2d++BOMuOWHEBdTiwg6jUPAaALAdK1LbgKDP2rzt8GwWN53xi2Oe8WXcRcRKcJY8M7I/vX6xBUbrNjt4WPZYPMLA15UQVtRevGj03MmK6cv0akmpbsHgsuUdDQw28qU9JJx1woANfnqBOiMt+mhKV3mUqk13UVNOyPDzENjdKg8SQy/hzKz5fh0VKOsjrSgv5008A29E0awdCp8abvza5AE5HyjdJKUoi8kY0RrNODYOfHnCj5o6c9wE7+OBNt8DrS4rorgOOgwYYHi2YkE7RNhrBeBbkthQhpI/iKOFYwvK5DghYxgTIi5DfPd2wrJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3STt57BjIl2GQ9EtKM55/Doo3ksOQBgJvQ/3vCutJs=;
 b=ORlVgxnIereIG3OalnTtmN2OKLi5WJ8iEo+lhlRmqOJkGUrlzZmT4zPcXeo7FDDwZk/vak70p2rkU0FpULlIHTp36AFM6KDryIuxAoCF/IOs5IGfOBsPnyJc9h9p2ZOZdSrzk/8Gvn+iWkC5lcI9DDCkd0TjDincaX3A8GnQGDrImMzmQ9RShAyxjKKnz30ZZ9SUfmP45JzzHHceVyCySLyLesG1MAyPNUSFzXy00dtlOYAVCKeTavv+j6ZPnWFpK3vZWkUaDpizXVw5iFJo/bkSfrPWMaVVQFDojqGEYuymBemVUK4oof29HOhUEhvzEg1nR/hyQ3XljcGjVbjfew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by DM6PR12MB4370.namprd12.prod.outlook.com
 (2603:10b6:5:2aa::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 23:53:09 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9%6]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 23:53:08 +0000
From: Marc Olberding <molberding@nvidia.com>
Date: Tue, 02 Dec 2025 15:52:41 -0800
Subject: [PATCH u-boot v2 2/2] arch: arm: dts: Add dts for the nvidia msx4
 board
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-msx4-v2-2-a605d448bd02@nvidia.com>
References: <20251202-msx4-v2-0-a605d448bd02@nvidia.com>
In-Reply-To: <20251202-msx4-v2-0-a605d448bd02@nvidia.com>
To: andrew@codeconstruct.com.au, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, eajames@linux.ibm.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764719583; l=2871;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=gaGnnDGRcLw9ZYGVU91iLS38XIVnopkkDhkU7X3imdc=;
 b=X1pPB7ShSPMy7UkC54/YMnyDqOVt+t1pTD6iEzS7onqtboPi4oVAeCrE3k503ruE5bHv5xZYM
 4Dis4z1tYFCCxDQKD7p+tTyXyFZyEziymkyRrJ8fb5V8ggPGvx866GZ
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW4PR03CA0175.namprd03.prod.outlook.com
 (2603:10b6:303:8d::30) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CH1PPFDAD84AB72:EE_|DM6PR12MB4370:EE_
X-MS-Office365-Filtering-Correlation-Id: 753c3556-c1fe-4cff-c828-08de31fdf19b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TXhXVGxSYVZoZkFUeTJidklaTXhPbEZ3TnF0RGZId2x5enRqMkVWUzN5dndt?=
 =?utf-8?B?L29BazhHdGFaYVp6VFl3cnNGWHdzZmwrZ2RJdFR0VzNZQjdCcDlUbWd1Nm1p?=
 =?utf-8?B?elY2WWhCVGxHaFdRd2lsVDJVQk1KaytkS3FnQWk1YUhMU285VG5QSldySW9V?=
 =?utf-8?B?TzhYWmVZQ1ZXa1BTeFZ6cEhIeUx0OEYrWGJRQTEremlVTDlzYjZ1NzJKWnFo?=
 =?utf-8?B?NnVzSFFwb0w0N1Q4THBiaERTNUdRWkwzN2RjZWNhdzE2dFVjdmZIYVF6NFJX?=
 =?utf-8?B?cy90YU1nNUNwL3UvU1UrSVIxTXp2VFlnc0F2cTAzOGxLOFpUU2FwODNsVHpR?=
 =?utf-8?B?NGF0SEVudFFSbXNZL0JBMHFVc0RwcVd5dExCcUl6MEZ4eWRiMVBXamR6RW9N?=
 =?utf-8?B?c0lzeHJValduN2xpekxqZStWUFBUYUFMLy9lQnkwcVFLTUkwYVBmUzFYZGpx?=
 =?utf-8?B?YlVscUNtdjlXNUczMTJkVjROUWJSOEoxU3dIVjdTaEVVTlh1VTlIc0ZCWlQ0?=
 =?utf-8?B?U3Z0L0lRSWpHeHY5cXVsUGd4eUxDY05lN2NBaVlTL3pxU1FaWWd4SGJZRlF6?=
 =?utf-8?B?b0tLNjlLNUJwSzc5YjZXenZ2RmJjSjI2UjJhcWVVOW5qM3RPQmUwdTVqdWJs?=
 =?utf-8?B?b0pTM0g3Q0RxVkR2emZyKzJNRUVwU3dSblBsZjZvemNzUjBEQWRMZS9mMDN6?=
 =?utf-8?B?NnNCK2pCbEpLNktVSHRiMzIzTm5HT2FCTnl5cUsrQ3RsV2tXOXdSSFpvRDE1?=
 =?utf-8?B?L015NTRDbnJFWHJpL2wrcVZ1TE1kd2w0OVp3ejd4SzNwcDNMVmpMWmE0SHZW?=
 =?utf-8?B?eXl5ZU5XYno4Y2dCM1pQQVNtazMyQ1ZVMVBsUHQxNzNFc3RSTWJieHZDUlpO?=
 =?utf-8?B?eFA5SkgrS0drcE9BT3oyY2poVUM1WHJ2eC8zNFg5Q2xQckRSMjRMNlZMSVVP?=
 =?utf-8?B?emVILzJqVVI1STZSL1A1ZkpNT0dJaGRZTEZkQWpyRVJCb0RlcTNYdUtsYngr?=
 =?utf-8?B?eWFzWTZXTjRmVGE2cWJVRE4wTTU1SEJ6SHEweERZWTNkUE9VQS8zY1plcmpB?=
 =?utf-8?B?MGJEajlhVm1ySjl6cWFKR0tnR3NkdDBpUTFPOG9Ud1JhRFpwZ08xb3VURnIv?=
 =?utf-8?B?SWFTdUlTRWJLRVUwOUdaTjJzOFhWNmYzOGI5WHBBZUhHdWFQQTB1Z0NLL3dI?=
 =?utf-8?B?Z3JSK01MR24vTm1FM09oZStiVXlzM1F6VTM2aTFwaDAyRW1ERUMrUFpmaC8w?=
 =?utf-8?B?UHBobTFvZEsvZXdwOVRxVWw2emFBTW5JWUZ2LzZjQ0ZZaDY2ZmN3QUhLVUR6?=
 =?utf-8?B?emx5dnFlc3dMWVZ5cG95ZXQ0aWNTN0pWTnl5ZHUvNXRGOTROUmYzb203b1c4?=
 =?utf-8?B?em1RYmFrYkY3NEwwdkQ2RDZrU2I5MFJPbUZHRlJiN3lWaDFBQ0Z5TlBPMGpa?=
 =?utf-8?B?UjdaeEJvcHltczMwbTU4NjN5bFdlYkNYbkpQTkpzekVwaVpSTVJabnhVUU52?=
 =?utf-8?B?LzZldUFnSjM0a0dDUkN4dXRsbXF4ZGNXZkF0QkhobFVXemJFN01pMWhENUhC?=
 =?utf-8?B?VlprU3dWRHVkVUh1WFJMR01pWU5ZYlNVYVBqVlhOZ1Y1a1JjaCswZFd5Z2Nu?=
 =?utf-8?B?Y01vV2thMXROZUlMdC9YRW1VbHdiWTV2Q1QyY0Y5aEFWRmlOaGp5VU9zUmJz?=
 =?utf-8?B?K21UZE4yRkJXbGQvZW9GaUhiRG1YcExtT1lLYnl0U3dlbHd5bkVQTHZhMGdO?=
 =?utf-8?B?czFhRC9OSmh4VWVid0plcGpKcWVycXRJWjBXSVRZRHFSNHJTUnlmc0FsaDRm?=
 =?utf-8?B?M2J6QmJ3STVidG5XZk5rYVZZaEM3ZmxDMkUrakhnME00Y3RRRGdZYTFMcWdW?=
 =?utf-8?B?dTRTY3VmQWsvQzlQVmY3SXhSM1hJZVJQbkRDOTBEUTFBV3FqZ2VUeDhrT3l6?=
 =?utf-8?Q?ZPTabVYmZMo4kTw2sXeFVuMnaBh4FASB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDlaVEhLZEp2ejRJWDJEN1luc1NTajBFOVhpM0J2RW9MRUl6UkFSdi9MQTBh?=
 =?utf-8?B?V25KV2U3aEJwZHF4QWlBdllIS2NJTkU2REhtcFNXZTEvWUkralFBSi9mV2VH?=
 =?utf-8?B?bzhHaEdaY1dIRTlqZnlHdlJZQzJaUWZrTmNyeVhvdG42YmxnVXdkRUFOZmhE?=
 =?utf-8?B?a2RIeXN5L04rem94S09jcEx0ZGpzSTg4MFFwL2V3T2tjVW5QSUxhVkw4dkFT?=
 =?utf-8?B?eFpobUo3N3d0M1V1alRaK3BzNHQ5dlB5c0FrYVg0cHJhUjBqd1JrcnN0MCs4?=
 =?utf-8?B?UnBTS3BxRkdCenhKWTJmZ3JBeFRGZk0vT1RRb0J6Nm5URnBSKzBJeHByNHZx?=
 =?utf-8?B?RFZRUkFEOFMrRG1wdUFZYklSdWxBbmdraG9IamU0Q3ZVMnZvQ01JbXBabk9Z?=
 =?utf-8?B?RXl2UTU5RGFBV2hJKzVDdTRrMm5hRDA0NlNVVXYydXVoV1dGUGYyVUpMZjRu?=
 =?utf-8?B?ZjZMZUlDaCtBSFlGTGh1c3ZzL3pWQ0ZNNFVHOGY5ckxBRVdrZWErbzVvYWVP?=
 =?utf-8?B?eGRadlNJUkdrR1V4cnJzS0w3d3ArUGRNZkNnTlNhNXR2U1pXMU5MR1c2OVlr?=
 =?utf-8?B?cUtiUHBaUnFZa0tBVXlKWjQ0b3Z5bG5odGZiVzhkdGxJajJuSmYxWUI1Z0hH?=
 =?utf-8?B?U21SRzVkU0lQc1pxaGdoeUt0NWhEbWw5M2ZQMndnRXl5VzJKUWhFc2wyL2Rl?=
 =?utf-8?B?K1c5a01Xcm1mZy8rQ1FSVE1OVGFjbHhJcGNXNHRnL2ROWWZUd2EwakRXbVA3?=
 =?utf-8?B?cXoxWlhQMU94SHJHVmNkYkEyU3ZJZXhjSHdrZDNwalRoUHptT0Y4NnVuVDFk?=
 =?utf-8?B?NVN3eXpGa2JpM2YvNzhLaUdGcmFrb1oycUdvN3ZQbEs4K0hFd2g5VzVZRk96?=
 =?utf-8?B?NGxGN2lUdlVDb0VhOFJ6N2g5dTVOZ0V2WUQxUHY0bHlab0NESGdWZVlERlZF?=
 =?utf-8?B?OVVyQWZHSzl4YmlvSnZmVVZzcEFlYTZOa0ZXRkFaUXpFUHFGOFRzR0QrMVFG?=
 =?utf-8?B?RUdzZ0dEQWQ2b3BnbHIzcHc1aC9PSmFjOEtwbFFCM1NHajErQTg4MVdpbTBM?=
 =?utf-8?B?TXU0TldwaXRUeUdGYnh0MFgrNUdheGtwOGw3ZzNBM3k5eVpEd3o2U09nM01K?=
 =?utf-8?B?OVhDR0JIUWw3eStITGFBeTZiU2RXVWdxQTc0SDRMd3p2eDdKNjU1aG8xTnUw?=
 =?utf-8?B?M1RqanljMnhWWlBNYW96ekJQV0RJY295WXBDR3lXeVRqUHhsam9NN2t1ajB4?=
 =?utf-8?B?SlBUUVk2UDE1WE91cDlvRzNJclFKN2M3TVNVaXFNZ1JFbVBweHk3Q05VWnV6?=
 =?utf-8?B?Tmt1Ri9yVzhwWjZzNjFPdU56aGNpS0tUaTdPOW13NG56bzF2Z0NENENkSU51?=
 =?utf-8?B?N0kxYU8xbEp6UXdtVW5lR01MU3hUcEQ5OG1saFJYN3BUa1lvUWFJRkIzbUUz?=
 =?utf-8?B?MXlrVW1hd0U5Sm1HYkE3R2ttSHYrTkp4WGw4NzVwbG1LS3EwMGIxTk9VNzdu?=
 =?utf-8?B?TWlMM3RwWDR1c0JJZUJNRlRmSzczTUtJcGhVUnhyamFFRzF1QTkwOUpRa0Ev?=
 =?utf-8?B?Q0VYdDJIcjBKMjlRTDJza0hFdUhXQU5JUXd2VFFLOWNKaUJaNzd4U1lZTW0r?=
 =?utf-8?B?NTFTK0RoVnRmdGowdCtIWGhlS2xUL0JFV3hZTzVVV3pzUDNlMnpEaFM5S244?=
 =?utf-8?B?VGpMenUvTDF5S1NTN2JqTmFCR3ZHcGpJMVRkV3JUUjBYWERLdTRleGEzVnk4?=
 =?utf-8?B?K2oyM25UbGZxOEcrZ3BlWmtHQUVoWnFVUCtoYjJoK2xLSW1CR1YzREdha0hF?=
 =?utf-8?B?Nk1najF0NkMyQzhOWC90K2lvdmhaNkU4Z1kvckRBRG4wUm9maEVJajYweFp0?=
 =?utf-8?B?MlFYcnFDN0dYOWNLOXFsZmRBd1k3M3V6M3lnSG9raFo0OURPRmZUVlJIZkNB?=
 =?utf-8?B?dGFTdUdhcXpYdzh2NjFZSHlRTDlaV3ZNem1mZHRRNXo2dk9mNE83SE5GZVNK?=
 =?utf-8?B?VnBvVVR0VEdvWkdyM3NCQ0pCQjY1dldNUnVHTWJoL1FoRE8zclV2a0F0bTRh?=
 =?utf-8?B?Nk9xeFRMbUYyb2xPZlpSc1BFa1JZVVp5R1VTdnFiclhuV3VySzR3RzlNZndj?=
 =?utf-8?Q?cXyAKDMbNQ7kHRWtQXox40qjX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 753c3556-c1fe-4cff-c828-08de31fdf19b
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 23:53:08.4798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lcX5DRqzY4H2k5YjH0Eu6l5M9zn/xy8i3ECJquvTeBC6gmG0W6kzZYEjGsMiwEqkBGg38VSORZfCfMsrfKEENA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4370
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Adds a dts for the nvidia msx4 board, a granite rapids based motherboard

Signed-off-by: Marc Olberding <molberding@nvidia.com>
---
 arch/arm/dts/Makefile                    |   1 +
 arch/arm/dts/ast2600-msx4-bmc-nvidia.dts | 112 +++++++++++++++++++++++++++++++
 2 files changed, 113 insertions(+)

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index dbb2fafc4f4c13302a02875cd678477ab95334cb..aebc5b60abc6b267669650be098315f5d5715074 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -689,6 +689,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2600-facebook.dtb \
 	ast2600-fpga.dtb \
 	ast2600-gb200nvl-bmc-nvidia.dtb \
+        ast2600-msx4-bmc-nvidia.dtb \
 	ast2600-greatlakes.dtb \
 	ast2600-intel.dtb \
 	ast2600-intel.dtb \
diff --git a/arch/arm/dts/ast2600-msx4-bmc-nvidia.dts b/arch/arm/dts/ast2600-msx4-bmc-nvidia.dts
new file mode 100644
index 0000000000000000000000000000000000000000..3f5146c65dec3ec569cd46745a13be5466f7218c
--- /dev/null
+++ b/arch/arm/dts/ast2600-msx4-bmc-nvidia.dts
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0+
+/dts-v1/;
+
+#include "ast2600-u-boot.dtsi"
+
+/ {
+	model = "AST2600 MSX4 BMC";
+	compatible = "aspeed,ast2600-msx4", "aspeed,ast2600";
+
+	memory {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+	};
+
+	aliases {
+		spi0 = &fmc;
+		ethernet0 = &mac0;
+	};
+
+	cpus {
+		cpu@0 {
+			clock-frequency = <800000000>;
+		};
+		cpu@1 {
+			clock-frequency = <800000000>;
+		};
+	};
+};
+
+&display_port {
+	status = "okay";
+};
+
+&fmc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fmcquad_default>;
+	aspeed,watchdog-disable;
+	status = "okay";
+
+	flash@0 {
+		status = "okay";
+		spi-max-frequency = <10000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+
+	flash@1 {
+		status = "okay";
+		spi-max-frequency = <10000000>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <1>;
+	};
+};
+
+&hace {
+	status = "okay";
+};
+
+&mac0 {
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy3>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1_default>;
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mdio4_default>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ethphy3: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <2>;
+	};
+};
+
+&scu {
+	mac0-clk-delay = <0x1d 0x0a
+			  0x1d 0x0a
+			  0x1d 0x0a>;
+};
+
+&sdrammc {
+	clock-frequency = <400000000>;
+	aspeed,ecc-enabled;
+	aspeed,ecc-size-mb = <0>;
+};
+
+&uart5 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&wdt1 {
+	status = "okay";
+};
+
+&wdt2 {
+	status = "okay";
+};
+
+&wdt3 {
+	status = "okay";
+};

-- 
2.34.1


