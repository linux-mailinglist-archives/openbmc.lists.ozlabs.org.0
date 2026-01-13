Return-Path: <openbmc+bounces-1180-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2958AD16BB0
	for <lists+openbmc@lfdr.de>; Tue, 13 Jan 2026 06:46:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqysd69nkz2yDk;
	Tue, 13 Jan 2026 16:46:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.43.133 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768275562;
	cv=pass; b=Hn0Ztw4SPY5JO8bJZKTgfineM5+G35ZRAaRt965S4EJi7XWAvRrD6XHFhpmJ/ERdaTPgT/Xc/72wxtGhP5TxlfQvN7/cQ4H9hooIg0J3wSnzsTlfzFs5KWCExKPKEvN3IiAPFr/G5MfLGLhe68105JcbjvkEuN5b96nK9p4OQP678IihyGYOO4m0G2Sm4ade1e5pps8v53xA6WDThdsdOMJ6yivmE0jHMs2uDv8qv5XBQ4Umb4/N1WRIPQFYrs6ZXsiTUCpEc8tZ2Xd1GxA9DSdJHkVMVlcXTnqTxHy9pTOO+I52cIXkQ5g3pzj3sJwbt73k2ScjZTkG8qiklJmubw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768275562; c=relaxed/relaxed;
	bh=mkn174s9Gi7/x7kveHTMV+IY0L+Fse2qkREHmFR4lEs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=N6CKdzv63POrwiYN+FsfXb2kvwlLPtXHOsfXUGhVAPFWft9RtAND4+Upn4OcrDkT9ESLhC8aKbfKCabywe9DQYFUkKbQLmh4CmmSW6TcniRB1eqxqYfu7XGUPjxaCtlCXjS9XpqMPFdS29riJ84w0YPEMEksqwuiuuYd4a3EIvjlERHi84m/4Om8A7okE0AhjRKSR4u7MyBC330PnwfAkLq2dtCIiwCHTUEdCQhsQdmX/SAuriTujPjFvQRMMylntuYDdSyLiYX4ADKCYqzP0gJzU7I+yVum18/Zc24Uf0DCC0YPlpu9tZS+Nc91IRlC43YwWn9fAvIu5CUPVwQrrA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=fp1coUA1; dkim-atps=neutral; spf=pass (client-ip=52.101.43.133; helo=sj2pr03cu001.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=fp1coUA1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=52.101.43.133; helo=sj2pr03cu001.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11022133.outbound.protection.outlook.com [52.101.43.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqw3F1VPyz2xFn
	for <openbmc@lists.ozlabs.org>; Tue, 13 Jan 2026 14:39:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cxWwPCoYqrh4+pTTxPki3meXcHZdT2nlPPvGTtSxeTZQEitEF55Qwn+gBR6ffpQ71QW99HyOA4ny8j5BrpwAqyfjroxS0TSh5URHwTKauaTnKWz1OqlMrIi5+odeVoSAxtYZYL3UMoTAi1OEfN4iHpKqcQyapMo8dTmQJyoG9CTnvmHo38vweEt96lVcntPsRZMayKJYNQeQHj5tiHcE122AnZdD823OHTp98Epv4nbEY2W4dnekwCFTv74KFh1uSxq9YRHh/d2BOY6puHLeZxc/frMXPjmowlUaxgYC7szHPCzaTlXGilSiuiQkv7gjxblEKhiGOmQKBbSgkvgHKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mkn174s9Gi7/x7kveHTMV+IY0L+Fse2qkREHmFR4lEs=;
 b=Ij5CV+xEpIxkvTvBVHydNZlyIEq5EKLG63AcbZbqpOqOc38p1gFT7k2Z38QW3qbhhobUO36Uiqj+ipqQ/xjRKbdJywHV9GnfEKkwHcpgijySxdXUdC2n4M3km9X4r62cbYuKQUQm+Cyi2hob0pvF0ujHlQprcDCxv+N964T96JIJq0qiX8pOPh3bHQ0/L48sSh/KRQmttJnTOyyrrMayRNSMsiennVEzwcWaHGOHOl5jFyFNY7kA4VUN8La6EsO7K58UpmLxrfPxlMw9KotM0LO2sTM7ocn0TcAXgMxUuTa9fxdiD4li3fFm30xThHd/zf6eLdWziMb4QesFFFDVew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mkn174s9Gi7/x7kveHTMV+IY0L+Fse2qkREHmFR4lEs=;
 b=fp1coUA17X0wmlGKD6w5lZuhyJjBu/olaF4amSnl6PWIV5LcS4ATkrVPac7rJLlfyCexo2mVm3ioy4RCMJ1TnsB8m8zgO2PZekvfqTYUZ5/aobKmJTi6TdlJ7AeqeVhgZ31MU31mxA9pvBfXITWFLikMlyHspxncyGbU+D4SJI5rl7ZXRR1kT9T4tB0BNsQfn1JzhkX4BhinbLGwN1qG/482FpbjHL9Q/rDxe9UQr9o62j1gR2w+RA8JzbA/HUznbGBFN8AaQMRs4gs2Q3caXLZDxbAbi24gNGsJ6X/DallYOV8aBrXBBnsf86mnJYmGSh8na+qYJLQ5xGuTIbPpZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from PH0PR18MB4558.namprd18.prod.outlook.com (2603:10b6:510:ac::13)
 by PH0PR18MB4005.namprd18.prod.outlook.com (2603:10b6:510:2d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 03:38:40 +0000
Received: from PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311]) by PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 03:38:40 +0000
Message-ID: <0642a1b1-bdb8-4c04-bfa2-1253044e4b77@axiado.com>
Date: Tue, 13 Jan 2026 11:38:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] MAINTAINERS: Add Axiado AX3000 eMMC PHY driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: SriNavmani A <srinavmani@axiado.com>,
 Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
References: <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-0-dd43459dbfea@axiado.com>
 <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-3-dd43459dbfea@axiado.com>
 <20260111-watchful-pigeon-of-brotherhood-6ada05@quoll>
Content-Language: en-US
From: Tzu-Hao Wei <twei@axiado.com>
In-Reply-To: <20260111-watchful-pigeon-of-brotherhood-6ada05@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR2101CA0010.namprd21.prod.outlook.com
 (2603:10b6:805:106::20) To PH0PR18MB4558.namprd18.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH0PR18MB4558:EE_|PH0PR18MB4005:EE_
X-MS-Office365-Filtering-Correlation-Id: 8da3fc17-b22e-4d34-72a5-08de52553e2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|42112799006|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OVdsNzI4dmpQY2R0bzdxU2hQTFNvYWYwejJ6RlBSOXJPU2N4Z0IzdnYwdDZ2?=
 =?utf-8?B?NG1IbjY5TjBYRitXaUszZjgyb1Zhd1U4YjJpN3JFZUhVK2JvYVVWeDBQZ3pk?=
 =?utf-8?B?bUxEeFd0K0NvblQ3RGNBSDNlZDkyeEJ5MWVnTmdoYmF5ZForMEt6bCs0a1Zh?=
 =?utf-8?B?ZHFGcDR6S2hHemxxY2xnQXhpREx1YUxJUEJJVzUxbDhERXRQWE10MVlHTVk2?=
 =?utf-8?B?RE96T292OGlMWm1UZ3ZBUVRvRUhkVGxWVlNLdDZwVjlnRWNiOFZoaXdhUzUz?=
 =?utf-8?B?eEgza0VPcUN0OVgzdXFaL3Q1NlU0OTlCdDg1eThwanUyS0Nuc2g5dmdwVmg3?=
 =?utf-8?B?WmsyNldkdFVxckVwSGlPUW9CQlUySUM5QnluV01BRnlTM0k3MUJlSzB4Ykxz?=
 =?utf-8?B?UDl1dHIzeGlMejNGQ2lBSUlkZStJQ3ZkL2RUNldCdnpMdTRleEFqU2NrcXFE?=
 =?utf-8?B?N3lGSG5kWkcvNVkrZGxGeUFacUVOZGhuSDNRd09lRTBJWVRZTjIzVXNJM0NC?=
 =?utf-8?B?S1JodDNSdUlYMlhYZEdRTVNueWhlVTFjdWN2cnFIMnlPRTM1ZlNkNDhiNEtN?=
 =?utf-8?B?QnVLdDQ3cFNtWmdTaDZ2Q0JiNHlPeFJvWFdYNXBxQm45b3A1ejJNaC91N3d3?=
 =?utf-8?B?MjdLRjFkSWYzMS9Jc2c1VUs4SUMwMFU0MzN1SGRoSmFVS1MyYXdtYnVoaTli?=
 =?utf-8?B?OHpFQUhFeElnOWZPSGx5RHJ2eW1pWFBzb2tqbWZicVg3TFk0MU4vaFJWYk1Z?=
 =?utf-8?B?VC9ZalJyWWpJMUJoY0RIR2FJcFk3SnpOejNZZ2pNd3M5NjlXbitKN2RQbVZO?=
 =?utf-8?B?N2pIckZHaTFlQUhCbmFici9pYUJRbnlDOVhyelJJOXlYbjFtQzhzdG00WGtC?=
 =?utf-8?B?QllLS0RBVUlCQjcybEh2RG4yZmdYeG5zRVJtRmQ1OStDdGJuYTBiWUUwK1VW?=
 =?utf-8?B?TDVYQWVPc1ZncloxM2JBcHcvZmhBZjhOdzJwamNhVlArRDhwelhzczI1d0dE?=
 =?utf-8?B?VG95aHpuRGdNU2xieUNQbEFJTVRubTh0dzhwOTVBZkVuT3k1dFdGb21tLzd0?=
 =?utf-8?B?MlhxNTExbFBXbXFMM1Y3c0IrUE8rVmtsczJYVEE5aFBKVDFDMVNWVkNEamh3?=
 =?utf-8?B?WG5wYjByRHplWmlzT004Nm9EbFRSRjI4VjlIVlZsS1YvZEt4SUtPbU1LM3NR?=
 =?utf-8?B?c3huL3IvY1QxWnlZeGFhWEFuMXVtSlZWYml1LzR0NnJ0OE9ScDJIaXFuY1lY?=
 =?utf-8?B?SVRIR1greTNOUEppUWNSSkNJTCtkVWp3WVprRm5OaDVBN1Z4dkhTTmJkUlFF?=
 =?utf-8?B?SkEra05YNG1ibm1ScEZFNkNpbjlwcnRRL1FZNS92S0lvdmZabU5BVms3bGMx?=
 =?utf-8?B?RkFBMUxlcjlQYlN1b1FBcVcreU5CSTVJOUxXYWxSNHV3a2hlbnNDRUFXT1lY?=
 =?utf-8?B?cHJrdnZidnV4WUJxWkpCY0Y4SWJOZEtxMjNPYmlhN1g2d0gvTXhlVHM4aVZQ?=
 =?utf-8?B?OTRsL3BJTTE1d0ZMOTI0UTVGdGo1Rzd5MlJrZ2tESWJRWFVmeEZndEtJSnNq?=
 =?utf-8?B?bGJEbWVoNFdkRlBQdXZxaUtFY2FSNXVFSklpS1NjTEtMS0Y4bFE1K3dLU0VS?=
 =?utf-8?B?OHdsbTJDeENvWkdBT2Z6THgvUXdVQWo0SVpYMGNhazdLZzE2SmtwdWRVQWtI?=
 =?utf-8?B?azc4RUxDaGovbDdaMHB2ZDZ2amxaQUhDMmdwSnhLR3FiN0JuUVZTYURUVWp0?=
 =?utf-8?B?bzd6cTdldFJBZi9hL0VJVVAzT3ZOM3RxOTN0NnZTMTZER2Yva0NHYnZNYUNl?=
 =?utf-8?B?SXFMSk5xMFRSN20vaEx5eFQrN0s3MEovdFBlWkZ5MERRRFBDN0kvN0JpakFp?=
 =?utf-8?B?aUZCREROcHFLcUkvSHc1WUo3NlZveDh5dEtndCtBWWpCY2g3Q210L2h4NlRJ?=
 =?utf-8?B?QWY4UkJ5SVFtN0FQTEtSRWhkQU9jZmUwc1VJWGE3TmIzckJIZ1AwbXpKbk1q?=
 =?utf-8?B?bHNsMXR4OC93PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB4558.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(42112799006)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zzd1Z3A0dmdxVjZMM3Y3NjRjZm1TN1FFL1VPdG5nM1NvdFBSQ0h4K0Y1c3Zm?=
 =?utf-8?B?eWwySyt1cE9pTFdrczY3UU1VTFdJMW5UOEw5ZTRBdVFNSnJEMk5iUnNlNTBW?=
 =?utf-8?B?WUd2YTh1WTIvT2dsZ1RmTEhXdk1VdmJaWTRmS0oxYzBTVS9tM3lBWVlMa1I0?=
 =?utf-8?B?WjBhUlVkVGhzaTBVeEVFM1A5ZXpqNmFNeGFlZVlDdnFFZUtiMkpoUkR4VTZk?=
 =?utf-8?B?ZDF6c3lXaG5aNnpmUEJyb3RHc04za0EvRHEyenJoYVl6N2prb1BaZFE2b2R0?=
 =?utf-8?B?QTB5c3VmOEt6RGFBTzlieVZRNG8wUnFUV3g4Y1hVejNxMll4RGduZkVpTGFC?=
 =?utf-8?B?ZFRVNjNmUkJRakRYSVJKeURMaXB1K0dlbXpVWVc1eXZxYk01N0lXRk5OUVMx?=
 =?utf-8?B?Ri96WVJ1MkR1SU1aU1J2aVJHSGFMa1JnTndBUU04RzNaYk5sVVFUZ3ozNk1v?=
 =?utf-8?B?SWlKbWtkMWx3WmtnbnFGenNIUG8rOGk2blM3SmRUdzhtekRxY1NPLzNzRWNG?=
 =?utf-8?B?bnBvZW4xUWpUUWxra3FWeldlODFQeWwxL2Z5cytJbWpvTVNBaUVNcGcxMEpO?=
 =?utf-8?B?ZGdSRmYwdE50SG1xNEpPK00xc3hGZ04wYlRMcU03dkZQdHg4ZkJSbUR4TnJI?=
 =?utf-8?B?WWkzNzBSSm1yK3hpZXZzRXRNNkIzVC96eEI0U3VtNHVkQi9VQVIzdGF4QW9J?=
 =?utf-8?B?YlM0Kzk0ejNMa3BBSXBqcDNLM1BsRnRuNk92L2h2UFlKbm0yejJmdSt2dVVy?=
 =?utf-8?B?R01xVGhMd056b3VqMm4zdDhaSm44RzJvV3ZvSVQzVHRPbW45OFR3aGNhbFZR?=
 =?utf-8?B?Wm5GYllDRy9zVHkwYno4S2ZrU1lDeXFyZXBGemtRTEQ2UWdHTXQ0dGFRTjdl?=
 =?utf-8?B?aEd3RjVremhDQUJqK1BlYWVHY2xlV2FyN1hHb0FMb3VGcXdsZzlDb0h1Z3A5?=
 =?utf-8?B?OUhTSFJoRU9jWjdGWUpSbjA4RGJNRC9DL0prdzBwZ05WZFZReUFjMThxUGVB?=
 =?utf-8?B?VjFqKzVka3g4RXF2MkwrTGdXVGtCSWpja0FFWE1LNW9ZSFo2Q29yK1FGRENq?=
 =?utf-8?B?amJnYnc1dkhlb2ozdEJPMHhhV2xPNm1qV3grRmJCd0hydEFmMlJQM0w4VVhB?=
 =?utf-8?B?MmI1c05LaFVrTGZTOHB5aHhpaG9zMnkrL3c0bmhZUmFWNUhjdUFVbmF5S0VL?=
 =?utf-8?B?bDJjUGFIWmM5anpuamZiMlc3UU5oQlA0cWNaRmxDWmVMck5ObktrcGhWWmlw?=
 =?utf-8?B?Y2ZDRjNMUWQ1bWhNNUIwUmxZRWplQTd3TEN3aXBEMWkzdndMZzJxZThublBU?=
 =?utf-8?B?WitpWkVNV0JtVzFmYVM1K2RMUG9qanVseWQ5WWNxYXRRR1BiY0VmSlg2Qmsr?=
 =?utf-8?B?dVlsYWRzdzFqQjUzaG9DaWVJTWRoaWxxWEtON0JEMnJKZS9rVlpOY3p5WGZH?=
 =?utf-8?B?dmZtUnZXWWJkQ0EwaDR0SE9CVXNUK2NPeUluOXBEUnUrS1JGK0lkTVZzQytj?=
 =?utf-8?B?Z3JFa3hmVGV6dDlhRXpsaVh2ZlpYMy9jZEpyVUpKQTVNZHVTcUVKZlhpTmtr?=
 =?utf-8?B?c1hwaXFDL2h3TnVrSHRYeUVJSHMrWmRreHJxenVjOUo5SkIzckxKck1ZRXZL?=
 =?utf-8?B?Zi9IS1Fzclh4NUVFNFg3eVlyYU52NHBaZ0VJcmdFOFJTN2pHMk54RVBoTTll?=
 =?utf-8?B?M0tNOWgzY2o4R0t0em5jV3BNRkJmNlQxRWhHYUtyZzhyZktmaWUwOXFRaHlS?=
 =?utf-8?B?ampNYjFRVUhoQjZSMFBtM1dFSDBQaFFxMlBWdWhESzUvaDdqaEZlS3daYlJm?=
 =?utf-8?B?MXRpanhvVzhLeUlMdGM2WG40LzJUL3hxSWlsQmJPZlRLeG5scmxGdThrSUMz?=
 =?utf-8?B?UGluMGkzSUt3eTU5bUs2d3I3czVKUis3YTFSUUVIcnlpRHBWTUVzUk9pbDUz?=
 =?utf-8?B?a2QwZCtSRjlKSDkrS2p3MVpnNDdwdzJVTlFOQlRBeStUWFdYcXlNNkljU3B4?=
 =?utf-8?B?SDVIOHg3dTVRUWJmbGRpK3ZoRWhBYjc1U04vcUhpbXVkYk1NeUZpa0xzWTNJ?=
 =?utf-8?B?ZDNUckVLUDBYWDdwYzZ4RWNlNW5OK2JpbkdqL3Rid1ZOb3U2MS9jN3F3enVH?=
 =?utf-8?B?M0d0TE5XTXRGV3MrZXhZMXdOSmFPVmhlWEJ3dmVvUUZIWUFsSWgwcE9QSGtO?=
 =?utf-8?B?SGdxMSs3aDVNWDNtV2htMDdjWnExZkprbWFxb050dzlILzNkT0p6SGFYL3V3?=
 =?utf-8?B?NmlRb0w3cExjSkUxcVhCbm53MDlKb0VlZm1FdGN4R2U0bzhrcnluWGY4T3I5?=
 =?utf-8?B?RXB0cjV3Y0c1VzhvVzJjS3MzSUhhK3orNlFiLzB0dzJtUEdsK0Vzdz09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da3fc17-b22e-4d34-72a5-08de52553e2f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4558.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 03:38:40.4053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ZPz6BE6KO19WWR5Kv0QCph9I52KlIkTLJLPvqG+FSoS7fKC0X3riaSvvhLjIE7i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR18MB4005
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 1/11/2026 6:40 PM, Krzysztof Kozlowski wrote:
>>
>> +AXIADO EMMC PHY DRIVER
>> +M:   SriNavmani A <srinavmani@axiado.com>
> 
> No activity:
> https://lore.kernel.org/all/?q=f%3Asrinavmani%40axiado.com
> 
>> +M:   Tzu-Hao Wei <twei@axiado.com>
>> +M:   Prasad Bolisetty <pbolisetty@axiado.com>
> 
> No reviews:
> https://lore.kernel.org/all/?q=f%3Apbolisetty%40axiado.com
> 
> Are these maintainers going to actually maintain code? At least Prasad
> should provide proper review now.
> 
I'll ask them to Ack/Review the patches. 

>> +L:   linux-phy@lists.infradead.org (moderated for non-subscribers)
>> +S:   Maintained
>> +F:   Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.yaml
> 
>> +F:   drivers/phy/axiado/Kconfig
>> +F:   drivers/phy/axiado/phy-axiado-emmc.c
> 
> If you are a maintainer of Kconfig you imply you maintain everything, so
> simply entire directory...
> 
Yes, we will maintain everything in drivers/phy/axiado/

Best regards,
TH

