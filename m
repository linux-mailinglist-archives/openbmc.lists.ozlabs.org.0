Return-Path: <openbmc+bounces-1181-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1177D16DAF
	for <lists+openbmc@lfdr.de>; Tue, 13 Jan 2026 07:36:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqzzH6mgwz2xKx;
	Tue, 13 Jan 2026 17:36:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.61.127 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768285039;
	cv=pass; b=HYRlZeH28af7vNcBcCaAhV1G9vsPGPOS+j56xpXBa+8QubPLwi3k0YK5IsbMyyNbDWtq4S86V//4xg+Na5OlAjlwyES+KyBXA0wnlr1Ylfmk7vAHB+pb0mbWa08Aut4s8IbRt7T9n/zjRK8ns2Wu4G1k+rhjKorGL81Wj07A/x6jwK/xy9uGeLBc7bl9wLmjS0+KrHFxW8EQAXhdCSBoCCT754cJ1/8bFz00zUfSRiTk+KnPqAIgXa0+rkE+CTktTRG+ZT+1DdmAZBMGty4VI59HDrcqFEgi79I6CKBUBXswHzTlQzS3OC4c7j2Z3rAAP/CAmybfyrXcg8ZS00FZBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768285039; c=relaxed/relaxed;
	bh=phGumB0fXNKg/vG/b9eCNwoHdsii9lN0Q6641xjEtXE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YrG4oexZJOcHuotzFr5sszNbY6F+mQ5UWr+F+x8UXyGZgKRCkAa9p3bKayZKz0dvfzRewme/RW8Pl5vKPFKblh51/fFRAj7sbnZU6xeR4nFQEuZfQA5hU9DIclfglmuf5qQTsLZnxxdyLkM6BpnZeMpzFt4g0xZnQlqViM2uuUXC4HojLDDUrcWe/S76ZxM1TAglM9SQpvzYu71BRhKfTxQ22slXMWM4QYbMHI4mg8S7oL7G2a9C+wUsaVlIzr3eCgCRtfaRD++4EabCQ8lvOjZX5raCidgqlRUyO4Jou/XQGvwR3szqGbjKO0mOTE3+M0r1Lg/dO53wNQH5n8p6Ng==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=W0v2szke; dkim-atps=neutral; spf=pass (client-ip=52.101.61.127; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=W0v2szke;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=52.101.61.127; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org)
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11020127.outbound.protection.outlook.com [52.101.61.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqzYQ3nYcz2xHP
	for <openbmc@lists.ozlabs.org>; Tue, 13 Jan 2026 17:17:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ha0lvNIV2wm47aX0lHbqEUCz5CnANn5Ow+iLWqgYQ3vtcLaThy8NnjG9xExoAhC2YKh3Pa2SRtbpzQuGqhnWwXsm/evVdykIRLpdypfRxJfCpjUnOIc4jNVE0mxvTZm26IXkva9RVTa71z+/o5jeH6jzOxyJ7ezHEYUV06zEjok8X0ylHaQAGyE1UxbntjMkdiokyRH/ZcWbXKom5ZO2YB+aXbKZPgEw3uLhX0V7/CkORgY8L0FYRmUq72xASfCohTkRSKWkXQ/znpSDPlI4O6Lt2IaFr61M9iif888O8F+udE47W4f+I0BZLAU2K0LN3aUmfD7HBbXCYFNIV39oSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=phGumB0fXNKg/vG/b9eCNwoHdsii9lN0Q6641xjEtXE=;
 b=e8MHWsAt66jvQBcR2ov2n/6TpB0+ws/bqQjb+8vhM25CT1IfV8ZlwdqYEkHR7aFD9T+5XEmMlgMpUa+3E7ZSxXAhsBOZxE/qUb3oJbPPAY5ldR5HSVHAOtgoqwpn2pQWlHz6Up169mXHoTaVgoIbPRI12ZGhuG8KkTyTlnXFkywCRJto0tAGdAMP1Q3lqT953G0wMWIDGXVq1hKj0jJUZKavouDxGhgQpFh9VhZXYKaiWhzmnmsbZfUSPSp3JWWy3AFiWYjFuYo1pX/aTY9Nmp29vQ+5qsELl/WkHpUksZxcdu11PuuSlzXXt8FSrWy0V+9EuYJqYbKNxhxH6RgKVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phGumB0fXNKg/vG/b9eCNwoHdsii9lN0Q6641xjEtXE=;
 b=W0v2szkeH3+48ucAVkxUxIgMCEHRtfQRzBlbyacuG0SONteY37Dkr/WoX/DTdKCGLTcfd5noAKSBM3JiVsJRPa/a+wY7eou04hF4HAfGltK4hF2dkpdB5pm9S50E1we2+DSwg90wrsRyCYeMfLeG5SoEfbo0vihghrGCWK11dFk3DJXOiaeiixGukzhAGIljS/PhyYmRfrHz+H9bSFou3jBe2bIu84kGCKygmSA8Z/a3q5bWYVAVT9PxkfD8RoV4ClskRvbbbzmThDxGOSNX7m7PIiE3j+YFgQn9FQ9UtzqB6syMLfWbkSKTOCDX+lVFMV4Q8oykEfBkgqHTtX5cyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from PH0PR18MB4558.namprd18.prod.outlook.com (2603:10b6:510:ac::13)
 by BN9PR18MB4345.namprd18.prod.outlook.com (2603:10b6:408:11e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 06:16:33 +0000
Received: from PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311]) by PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 06:16:33 +0000
Message-ID: <495b408a-2fd6-4b79-a0fe-9e055fffb59c@axiado.com>
Date: Tue, 13 Jan 2026 14:16:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add eMMC PHY support for Axiado AX3000 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>,
 SriNavmani A <srinavmani@axiado.com>,
 Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
References: <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-0-dd43459dbfea@axiado.com>
 <85c3fe42-22a1-4b8d-85a6-f7541d8c942e@kernel.org>
Content-Language: en-US
From: Tzu-Hao Wei <twei@axiado.com>
In-Reply-To: <85c3fe42-22a1-4b8d-85a6-f7541d8c942e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR2101CA0018.namprd21.prod.outlook.com
 (2603:10b6:805:106::28) To PH0PR18MB4558.namprd18.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH0PR18MB4558:EE_|BN9PR18MB4345:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b12a80f-ae0b-42c9-30ac-08de526b4c86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|42112799006|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dVY3NWhMNG5mK1FGdC8rVHZpQ1RmMWpXTmVJazV2S3VlVTF0bThqdWtWditK?=
 =?utf-8?B?bTVnSWpsNXAzYkpZOHo0TmtocGhhL0FickNCdVRhNFRJdnBnNHRyM2E0R1pr?=
 =?utf-8?B?UEFya1BlSUV6cW9zZHJ4dDQwSm53WXUzUHJDT2RjMnlILzFDbGF6UGdZN01D?=
 =?utf-8?B?RU91ZFBYRG9LdHE4aTk2OFUxNUMrZXZwRERRZDBxaVFOaGY5a2NQSnI0b0My?=
 =?utf-8?B?SzRQT1VRbWNCaGZ0VW5MQk4xSDFDSXJ4bFBBMGFUeGI1WWFvdUxVK0FodlVz?=
 =?utf-8?B?TUloVDRmeXliREdFK1ArZzRrTkl0RGNqOThTUVZqeTh0d0ZqZ2VVWlZTQ3di?=
 =?utf-8?B?QzJLZDl1V1NYYkhjVFRiMHZLWWdwNjZ1ekUweXVEZGNIWXU1RHUrdHNJcGE1?=
 =?utf-8?B?Mm0vWkpGYzZwWUJ5MG1TcWU2R0xVT3hjc3lkTGZGK1FJUFFpOXZjS1I2c1Rh?=
 =?utf-8?B?SDFlSzNxdUpBdDEwZjJCbkxWVTJQSHhMS3l1RXZHK0JlaXBkZzc5V2RkR1NR?=
 =?utf-8?B?dFdpT2V1ellITnB1ZG1aY3pBbk1rTVZ0RC9ZSGF3Mk1JQ2dORnUyUzdhbHha?=
 =?utf-8?B?SEdMYmdsRVlzeVM4L3JML3hnbHllbHdFZCtBVWxId2dzckxneGFqMzIxS1hF?=
 =?utf-8?B?Wm9QM3lsTk1iZkdrT2ZBWUZkQUpqb1pqTHlzcnZsdXVFZG5RMjdnOWY0ckRx?=
 =?utf-8?B?ejRKVDZMQ2F2bURCNjdGaWlkdEVQem9yTG5odTArZGN0TzI4M2RkQzh1aVdj?=
 =?utf-8?B?TDNjTmVlNU1uTSt5SjBwNVVUWklZdVhXOWxBdnJ0OGJBeHFCV1Y3SEJHdVVQ?=
 =?utf-8?B?WFByTmpIM0cvUFFiclQyeXU1WWJ5Vk02VmJQYW95bjZEOXUzVkFtWFFpbGFY?=
 =?utf-8?B?amhXQ3M5dms4VWhIblNxeUcwZnlOVjhURis2YXZiTlF2Z3dlcGtOV3ZLZG9I?=
 =?utf-8?B?ZVVEQWxrdjkwQ0lCdHduR2pzY3RLc2t4WkRQMS9PZSthbjduSmdGNlVJY1U2?=
 =?utf-8?B?aFZ1Skd3cUJHVjVSaFBwQSswUURiOVJSeCt0emQ0Sk5DTjgwSUdWSE1pdSty?=
 =?utf-8?B?cmhHanhJMy9MQ05jNGY3TlE5OGVxSVB3STF5amhTUjJoNldEU2xVanhXd2JW?=
 =?utf-8?B?YWR6T1dLUk1xUXAwR3V0NUpZS20xNVczVWV4NlVzWit5OThOY0d2cFVGTURZ?=
 =?utf-8?B?VG5GR3hzdzY0aGhQRTFWZGlUeXc3ZWVvdWJQSEVzQ2NWa2J4dVBiSnY2TzZq?=
 =?utf-8?B?OVYwczN4SEl3dlhlWTdEVTk5ME1NbkFCZUJBQWlqS2ZGaUdJK1NIRkYyenVi?=
 =?utf-8?B?Z1dwOTNpMlZIVHhQNHJnYXpERlNEUmtQVnBGNmhsaUJ1a0ZCcmhPTDl6TDVJ?=
 =?utf-8?B?MEtMMEVmUFA5UHlzV08reXpNQ2kxSWtTdkhsVFdhZU9EOHZTaWdKREk1ODhv?=
 =?utf-8?B?eENMOGpMejhibkpZQUtmS0ZGcWllSjNCNWIwbUVrenVXaVVhQWFVb2RXMzlO?=
 =?utf-8?B?UythZCt4REE2MTB1VHJHOWovWUJFbUdHNnVzK29PSDc0M0pKai9IUlhpQ1J4?=
 =?utf-8?B?SktadmtNUzhTQTJpZzFpZWRHMEk0cFB4RG1NRzhIcGhBdVU4NGtjR1ZKbVVx?=
 =?utf-8?B?UkhONklZODlFbEdSSy9IZXYzVVlCcDhVcWcyT2lpa0dhSkVpbytRR1hjNVFE?=
 =?utf-8?B?cUNUc0V6akNhSE5aUE1HRVdzYUMvL3NkU2o5VTc5U2UvRWNsWTVnNWJpRTBJ?=
 =?utf-8?B?dlV4Yyt0cGpBK2gyOUI4K0p0eHR5ekFGK3NUeXB5WHhEN0cvZnhDRllZcnpT?=
 =?utf-8?B?QmZ5eGRLdHljWHNDOEN0ZkplUHdnOTJNU2Y5cThnbDlxSUQyNHRPS2Z2ZzJM?=
 =?utf-8?B?VXFNTzlnQXlYbmpTbjhVU2ZwdHAvRFhBelpEeHlMcnRjOWRQWjl5dGcxVzI3?=
 =?utf-8?B?ZXpYV2M5V0MrWU51QURTbWloNnFvUXYrYVIzSjQzUXUrbGpPWDVBdWZaajFa?=
 =?utf-8?B?YjRuNDJlamVnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB4558.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(376014)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmdqRU9oVHNETHdjQ1o2L21xSGF1S1VHMG14bEY5dTBGMzVwRlRpVlg1NlAw?=
 =?utf-8?B?djh0OXM5dGNUZFhQZnRFVHMvNWtZZ2lvSi93TFc0cGtnRDNvR1loOHQvQUVX?=
 =?utf-8?B?a01LVHBjL2pORXVFS3VyZnk2ME9UelRXSTVTbmszZWJLL0VRWUI1MWVOL050?=
 =?utf-8?B?S0hMSGtzd2c4QWxvTzZSUUhoWXRjUkFnRHNsOWlNeFpYUkgwRHJNNjUxSVI0?=
 =?utf-8?B?dm4ySUJnR3pQTkxuSktHZFZETi9Ia1BobmM5eU5aU09LRFdqcjEvb3dlN2N1?=
 =?utf-8?B?WVo4YjNMdUVDenJwM3lKR2N4RUkzM0RLVFluWXliOTdaVXl0Y2JSbWdidnNB?=
 =?utf-8?B?QU1XVWhSOHRBWWpBOGlWRFhIUTE5YlZrL01tSGI5RDc5VEpETnNiM0xMZDdQ?=
 =?utf-8?B?cmtvUnV3cGpYWHhNR0VCUkVubTNsV2drNHpscDFCSjFmUFlWZ0s2Q3dHU0Zy?=
 =?utf-8?B?aXhTaFJnSDIyY2xONmMwWXhiVXRSZTZzQlZaOUZQM0xhVUJQem9Bc1FHdEk3?=
 =?utf-8?B?VHcxRUdnRDA1UW5pbThlTFBlTURpcVkybGtUdjFQOGNBSFoxNzNzVnMvM3dl?=
 =?utf-8?B?Qk8wNEtSbEhOS2JocWVKeCs4TlZFbEp6OTFib05nbEhsRlRObnVsMmw0NDdy?=
 =?utf-8?B?dFl4emFPMTh3WCtmcUpGNERwbHRWSGRKSlNXRGpZNFdFWHhyaUlGNDRLb0sz?=
 =?utf-8?B?aXVYdTRVTllvTzJ3R0xIOGJsdTV0cXNsVGp4eVdOc0lDQ25FTVNWcE8vc2pj?=
 =?utf-8?B?TnpBd214RkdRT1R4REpmanZ2dGc4UkpHa29ZazJkRjBGMXk5Wko4STFpWWdU?=
 =?utf-8?B?R1ZYZTJ0MENuNVlGb25sZ3dSUld5bUxFWEQzdlF0TVk3dWwyNm9qKzlKTHZL?=
 =?utf-8?B?UHVmWE9pZjlRYXBqU0trbzh5OXVoMGhPVzNVcytWb3VKYzlTNlZSN2sydVQ2?=
 =?utf-8?B?WUVDTEtvUGpwcTcwaThzUGtjcFoxaWdTYkp3OVdvRXo5aTdqbHZxc2Zmb2Jl?=
 =?utf-8?B?SHIwU3VTT0tVa092ZXh2RDBxRTJ2RGpkRk5CSmMzS0lmSDIwcHp5cHhXL0lt?=
 =?utf-8?B?TGVUNUlucHNoWkJyTVhSV1NTUGFENzFycjlMb3B4amk1NXlJMW4vMGNQOUkv?=
 =?utf-8?B?aFJLaEVxcllxM1BnY3Z3YTFTSGNBWEV0VVdkRy90NytHSVBJSmNCMHhaZXdx?=
 =?utf-8?B?OW13S1JwVnNLNE41NmZCbGNMNHprQTloOHJyOCtyVzQ2OHp0SzVpRmxORjZ0?=
 =?utf-8?B?K2xFTWY4RjFDbUo3ZXhURGFONlNWZHpSTktDWUVyQ2Q1eHRpa1FpaFMycCtZ?=
 =?utf-8?B?Y2hnV1dzc1lNZ2hJdHV6YlIxU05OK3JYY1BpVy9HRjBnVlBMZVJRWHJPOWND?=
 =?utf-8?B?bE5ZWGlYZVhkWVdNOHBWQUhYcVhWT054YmE0UnY3U29JWlUyR04ra3hPRGNt?=
 =?utf-8?B?MFIwdGs3a085OEF3SlJ1TkJpY3VJVFBKQXVJT1prMGkyd0RrcE9jelViclBx?=
 =?utf-8?B?anRMUmJGUU0xaDV2WSs4T2VOQmYwL1FoWS96c1prN1YxWG11M3Rnb0syeGpL?=
 =?utf-8?B?amVWTVZyUyttY01HdmwxMGxib1VjNWZCYy9TcElaZW94ejFtSEt3SjVsSENM?=
 =?utf-8?B?OTFYWHBiSUNobEVMc3BRWWROYVliYTBuZG13R3RvenlibnArZ2xsTXZGNTln?=
 =?utf-8?B?K0Vvb0RjdkxkMXM2Zjh3ZEJDSmFDaG9hKzdvNmJ3NnhnOFY0RUszd3hqT2xK?=
 =?utf-8?B?ZHh6YW1TOExOT0ZIeTBBMVZVakZGa2xwL2lsem9NTlk0U0FuQVVWT2R5R0Vq?=
 =?utf-8?B?eTJoRW1xUkp1MkNkeWc5Y1NrakRzNmM4dTQ2K082OHg5QWt1a1YvUGR3dEZW?=
 =?utf-8?B?OERmbndTNzVxWjl0bEs4VnZJNllPVGJFTFYwemJaaUtjOFlLQ25rTWRmbDlO?=
 =?utf-8?B?WVUyYVhhVTJpK1hoNkZ6b3hGdUFrczY4STlTdkZUWU5keWRQVGNiRWErdWN4?=
 =?utf-8?B?Z2F6TWdHcnNDN2RKSE5LSWZXbUMyM1o0T1MwRkt0RFoyT0dPQXVMTUFQNVhO?=
 =?utf-8?B?TUMzTkhkRHFZbVlaQ09mSklBQVNJZUgxQjgyWWtoNkY3K084TXYzSTNCT09z?=
 =?utf-8?B?c0tkenNBZ3V1TFk1MnpqZXdlNjZ0MnduZjF6RXdVL1M1c2p6N3NmUlRqUFZ6?=
 =?utf-8?B?SC9OcVJTY1ZDbTczcE1QdGRUWEJWUm4vMStiTjhDVE1nd2N1ODJhRXQ0cVVw?=
 =?utf-8?B?ZVM3VU4vWTRRcXFRTDdaekFVbVpOV0wxWFdaemtxY2lxeSt0M2Z0VlB1dHNS?=
 =?utf-8?B?S2dHOWIzcmN1cEh3c2RnUS8ycjUvbm1va3NBRWZxS0kwbFhCeUdBdz09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b12a80f-ae0b-42c9-30ac-08de526b4c86
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4558.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 06:16:33.3676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Y7pFTs6uPKI0R3JA/9rMDb2TnDYEKUB2QLwbGPwZ4Fwl7bc/zZ1c80Hfxjt7Kxc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR18MB4345
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 1/12/2026 4:32 PM, Krzysztof Kozlowski wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> On 09/01/2026 10:43, Tzu-Hao Wei wrote:
>> Axiado AX3000 SoC contains Arasan PHY which provides the interface to the
>> HS200 eMMC controller.
>>
>> This series includes:
>> 1. Add bindings for Axiado AX3000 eMMC PHY
>> 2. Add Axiado AX3000 eMMC phy driver
>> 3. Update MAINTAINERS for the new driver
>> 4. Update Axiado AX3000 device tree
>>
>> Changes: (The previous version was mixed with Host driver, so I separate
>> the PHY driver as a new thread)
>> - Fix property order in required section to match properties section
>> - Fixed example to use lowercase hex and proper node naming
>> - Removed wrapper functions, use readl/writel directly
>> - Replaced manual polling loops with read_poll_timeout macro
>> - Used devm_platform_ioremap_resource instead of separate calls
>> - Removed unnecessary of_match_node check
>> - Used dev_err_probe for error reporting
>> - Added proper Kconfig dependencies (ARCH_AXIADO || COMPILE_TEST)
>> - Fixed various coding style issues
>> - Link to previous patches: https://lore.kernel.org/all/20251222-axiado-ax3000-add-emmc-host-driver-support-v1-0-5457d0ebcdb4@axiado.com/
>>
> 
> So v2. Always version your patches correctly.
> 
> Best regards,
> Krzysztof
Hi Krzysztof,

Understood, thanks for clarifying.

Although the PHY patches were split into a separate thread from the
previous combined host+phy series, they are a continuation of the same
work and therefore should follow the existing versioning.

Just to confirm before resending: I will submit the next eMMC PHY series
as v2. Please let me know if this is not correct.

Best regards,
TH

