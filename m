Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A4999C7B5
	for <lists+openbmc@lfdr.de>; Mon, 14 Oct 2024 12:55:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRvK96b9vz3cV6
	for <lists+openbmc@lfdr.de>; Mon, 14 Oct 2024 21:55:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c112::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728903338;
	cv=pass; b=C23dxhGQ2aTw2RQx0OwBuiTOQngDD8lSDKzdp4vPFPgUEToAT6PO3pUV/S1VxNeY+bBy4eWiZ57Uc4oM2tWE26XTgFmiYbVdE/YBMxV/rsDOtftLjP71LeMOSV++TYUTnM2frjlSK2uy8s/vFMf2TXXDzIe7hBK9WvBiRqErfhD8qh9N5NuEPEbaUn49uhZ7ukV7Tcf0JYgLMrxVZXnHB/xy2nLY8kycsGlNRE0SzwXF2lKux3fGtCJE976z0Q6pdc49oOPWf68SWLec2MYwZe771m3V8frdkj6gGcBuVchM0xPpMgu8cVhHDpfyPAUuLOOEdl+Dpc9pboo6Ks5w1g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728903338; c=relaxed/relaxed;
	bh=83OhEODN4BYGJh7cQPpiR42xNuQ7HkJPx57/nEi38zk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LzotlQB6O9sK9csrL54J7WrxjzosO3zEpc0rN3BNKx85I9wf+P7N4VR0Nf187MOADVjuNXeKr1ZpPDVUNMjPr57kDE1V/E58+duCR+WQl3wZTnxjY+VHfo1bXA90kMe48kzkWKSDvivuAjimBKGzLAA3URt4p/5YfKI2DSwo9XNSP2xxtJQybJn5k3/zKAq92xqt0iF3nZfrkiwiWajgTLrj1O8dhbmsmv0GCLj9Elh1LRYDWNHzARtpvHM4dASf9rl8B0iJCuLeoUpZMCHFyEZOhAEOlBDJ6vgM7JCve9P1L1jZnB9HVaRJj5IsHuJtEeeYRwSlqsab31DvKjUP0Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com; dkim=fail header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=6wbFLRz+ reason="key not found in DNS"; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c112::3; helo=cy4pr02cu008.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org) smtp.mailfrom=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=6wbFLRz+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:c112::3; helo=cy4pr02cu008.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from CY4PR02CU008.outbound.protection.outlook.com (mail-westcentralusazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c112::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRvK55pRkz3bn8;
	Mon, 14 Oct 2024 21:55:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JdfOIs+pWHWyGwLfu4T6fFuWeYrPyQySp9oj9CWgBwZV/Mlp3n+SpCLyIW5Ez/Qpe2+fyJIyPbb+Ntw5FdMbPmlJjacAOjBFjhv1zRXPz42P6dp9G7GX7xXYUnLVdbCzr7Llbseq+SymKNzY8y3kbXHgxjLZQKPeIJS4N2LL5PwwXOkcT8+izJ9B02LgQyT0s/Sk63khAd8QWO8dJPsHmaXfyB5XleX3aHSKIpGXzszs/Tk54+jCI3OT0xAgpRz1isAtlnAUj/r2QYhN/j7p2Ey3jvkOXbNNbjjI/Pn6pZmGeDOvG29rg4R1bCnLvdX3n66e4+xyPi9WHkIiRY8+Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83OhEODN4BYGJh7cQPpiR42xNuQ7HkJPx57/nEi38zk=;
 b=KMMh4+wC/HmYdAGVyfYWYnoJFnaXHLfbJv5adAmCFiSLBvumQ92Chh9IYX/iPfOOr2VBRV2kaHxJ2P/ah+/q6RTqBZGNydWjWy4Nx/hdF3IlirZGNIcpOCvgzFcevLbkZ+HPw/0Y81HyfXNDVteYcb0L1WUo7nR28H9XofiDBlzTd9UeqCLW+vUj+puTa5tT4xaEClnN/lo22N39pYdzfiOktEqPgfL8caum98gNTZZjHm6RzizZ0Gr0vH6WaoX/730HT3w9qcgi0R28VzckYTusJWB9hcy9+ECkC16GpbvZilntm6nK7wKmUfm24D4DUk+Uwhagw/uKepNso92C1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83OhEODN4BYGJh7cQPpiR42xNuQ7HkJPx57/nEi38zk=;
 b=6wbFLRz+Gead5hnhYG6B6JRZBUmcWn8r7Q2un3fUiEURMfsTLErHZuVn3hYi1192vpn0I5U2vsJb+HRbqDihSZ9NnOlrjtyCYaOhxRmKhZLtQPDwXKLPefK4WpBf1vXvIgWNlT2KJdhBrOuqCFc1LOOj+HgMCWTpNp5n7Zx0BME=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 PH7PR01MB7752.prod.exchangelabs.com (2603:10b6:510:1db::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.34; Mon, 14 Oct 2024 10:55:13 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7982.033; Mon, 14 Oct 2024
 10:55:13 +0000
Message-ID: <ea9e34ec-c557-4616-a95e-7b20229db03a@amperemail.onmicrosoft.com>
Date: Mon, 14 Oct 2024 17:54:57 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: aspeed: Add device tree for Ampere's Mt.
 Jefferson BMC
To: Chanh Nguyen <chanh@os.amperecomputing.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Open Source Submission <patches@amperecomputing.com>
References: <20241014105031.1963079-1-chanh@os.amperecomputing.com>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <20241014105031.1963079-1-chanh@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CYZPR19CA0008.namprd19.prod.outlook.com
 (2603:10b6:930:8e::15) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|PH7PR01MB7752:EE_
X-MS-Office365-Filtering-Correlation-Id: a6135350-73d9-4e57-b7b6-08dcec3eadc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?L2JHMkdsNTRHRmVYN1BIU3ZxMXpod0JlcWpaOGRmRHJzMTlXUGNVeWg5YnpI?=
 =?utf-8?B?VzRRblpnU3JZUEJ5LzUrSjJqRkdXQjBQRGVKMGc3dXIxaFYyT2N1QThoWlVZ?=
 =?utf-8?B?SzBJWGRMUU1OZkYvUnFIWjVNUzFycFQxdzZtZVVXRlNFYU1ZMEVRWERFKzg4?=
 =?utf-8?B?elFXSTdoekljWFFXakR2eUw2cHQ0a3owUXRTWENzUGEyV0VCVytxbTdDNEZh?=
 =?utf-8?B?dzdSamdTUHZYeXEzWENybkNvRzc3UDBVUkpPNGN1ZjQ1YTFIbnEyWXREaTJa?=
 =?utf-8?B?Y2xUYmtTS3lNak9VdStVYWJPdGxiMFJVRmZhNlB5eXprcFIxSWprOWNrS08z?=
 =?utf-8?B?QVlINTVwWVQ4MkNQRm1rT0JCOG9hYWIxK3pVcDRFMW5Dd1BsekZDb25KZmdM?=
 =?utf-8?B?V3c4WEZhUFRKUlpxNnBEaWJmV1g2NFlkb201U0JsVHNCMXJMNGNmc2xZQkdX?=
 =?utf-8?B?OFNDdHhPVytLbjZqVjEvaVNSbjVoR09RZDk3NmtWZG9QUTV5T2QwSXdDWTI4?=
 =?utf-8?B?L003ZmNaRkd0ZVNxc29TV0JGMGRFYnQ4TFltUGdmbFhYNjVVNnNjNkwzekZV?=
 =?utf-8?B?K3BmUUhhYUNDcVk3S3VRTG03Mmx3Y2d3WnpVSWVZWmNIbGpYWVJuNlNCNnpV?=
 =?utf-8?B?T0FSRzVPOTFDSW43MmplYk9yRUhhMCtQR3NPb29ON1h0T0JjbnhwcmVUTk5V?=
 =?utf-8?B?RjBjSTdiQ2E2dEpoMTJXWXIzOUZYZFhsL0VBakFuRjZIalZ5U2RQRDgvdFFD?=
 =?utf-8?B?UDgvVUxMV1doZFMxbTNBZE1xSGdBNGhKcVJZa1NpbGlaWmJIdFJLSUM4ZGZs?=
 =?utf-8?B?QTRmWktwc2c2cDRLRjR6TTRIOTZQNmdwa2NPM25OQmt3QXpkSjlubjkwQVdP?=
 =?utf-8?B?eTFmSXA2WjNLd21JRk53bXBxY3dLQWNpOVNob2dvWEJOMjNYcEhNaFpEZGE3?=
 =?utf-8?B?NlhuT0dmSTczT0ZOMXpTdVFBM1RJUElJUEZtRTNnOVlRS3hWSGVxVXRldkFr?=
 =?utf-8?B?eXN5WTNOVm4wTnJNNG1YdFI1ME4xRGFiOStkWlBrY0FXdzBpeUMyR2dSOFFz?=
 =?utf-8?B?NTBwZzYrT29vc2NKZG10bGpZSVBXRVFURGRTa2k0Q0FScUI3OEpsSFZnKzhL?=
 =?utf-8?B?aHFJcS9rdGlQWjM3WUNzOGxpZ3V6OTlGSkxNQnVkTUQ1OTJEOEdRbHZRNFhI?=
 =?utf-8?B?Nzl0blFlZVo3TE9aN2h6Q2ROcEpERlpTL2JxcC9GUDgxd3dnY0ZaRzB6S2sz?=
 =?utf-8?B?V3NGRDZkc3FDbEFPR0s4MHV2cytxblV5dW91dWhJOE0wazRqbGszZS9YUzU4?=
 =?utf-8?B?LzFvbU9LalUwNncwenlKNElXYUpuVHFIMUcvWGpiWTIxclFNZmZZdmZBYkF0?=
 =?utf-8?B?dkFCcHN5THNQeG1QY3ZaWFJHUlI1dmcvTlVyL2VhYWxPMlgwa3lYU0JZU0pU?=
 =?utf-8?B?Vm1kOEpvNE1vc2toVzh1OERubUpqTG5MNEtwaDl3enovazFJajVHdUF4VmhR?=
 =?utf-8?B?NHRQakhRWHlxdmlwaE5ERTgyb1krT3hsMTIrQ1A4QXZuUzJodlpoSm5TbU9J?=
 =?utf-8?B?cjIwQUg3aDBVZWgya1FiVUNOSGZoazBNSnBOTWlBZTRJMnZuOEFsZGg0RHNW?=
 =?utf-8?B?ZTJFWmc4Q0syQlNKK3hjSXk2SEVKbVh0ZXlvK3J0TVNQWFZkaFdTWDZjc1cx?=
 =?utf-8?B?NmtJbGVwMnNVWU9mbERGVHNrK0lvODljTk5Ua0ZJbzlUUWR1R014OWorV1Rt?=
 =?utf-8?Q?D2wuyjt/V0O7W8Ij5JPXvSMym6ziFarsn4bqFXP?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?TW01V0NleTVDWXgwd0lWRWcyVllwbTdnbXp6akZJZzVWdkxuNi96aXlHTjJv?=
 =?utf-8?B?VzE0VWpJZmVFL2pUTkI5elFmL2Z3eEYrU1A1Q1UyL1d2WmFjTktWdlVKSU5Q?=
 =?utf-8?B?UnJtVkNMU3RFd0U5QlZHS1I5Z3NHTE1TT2o3NmkrSkc1OHZldkprYTNkeVpS?=
 =?utf-8?B?Ni9oVWlXVjJNN3ZsVGRGampITXZKWWo1amduV0lzQnpPTS8wRlFKbURYbUtI?=
 =?utf-8?B?Qm0rTTBCd2U4UlcxOFpYaVlrR0hLYUo0K3h1RTYvRFBlc2VNYmdVMko3UHA5?=
 =?utf-8?B?OGx4WXBDcUpzK3VkTUFXU3JhVXRjQlBqR3BINzZwc2dWZkF2MnBjM3VJTGU0?=
 =?utf-8?B?TDZMMkpiL3Z1K3RCaytQYnRGREdoc3BIY3dSdjdtckFNT0p4eEUvaks2Umh2?=
 =?utf-8?B?UU42cGlmYkxYZEs0OVkzQ01IYTFDYkdpS0V3dEd3eThVY0syZ3A5UG5nYWdh?=
 =?utf-8?B?SGZYaG5TZUZQcURFYUd5S0dDU2NxUnR6ZVNnN25oYSsvQnl3OGlON0xxTEJG?=
 =?utf-8?B?NTdTTk14dXk4SmQveTVZdzFJcFM3VGsyN3ZweHc1M2o2bzVRY0VsN0V6R1R2?=
 =?utf-8?B?Y2IyVUVsalVWNlUvOHZEVUFjODNHazhsYUNmWTQrSWZyam9DYUtYT0NZQmQz?=
 =?utf-8?B?OElmVFpRTmVLbmFKSTJ1UGF0K3V2QitCa3kxcFhxbmxiQnR1NlNJOVVJWXJ4?=
 =?utf-8?B?QVBVNHJWTUp1RUI2Wm5nSFNtbitUdEhLSzJEZTBURVRqb1B3R1ArMUpSeHZ4?=
 =?utf-8?B?WFlOeURrUlhJVzhldmpldEFhZk9aN0IwS2I3NkRaRTFBZ3oxS1Rmc3c0Rm1F?=
 =?utf-8?B?Z2Nyb21aRlRyTTF3ZUNQWjhIcDJGay9jemg4VEozOVdlR3lpUWo5VzIrUGNM?=
 =?utf-8?B?aS9OMjB6Wm1nT3VqaEpZaThrWUQya3J2cGk5V1RGQk5acmdmY3owSXEvK3Yw?=
 =?utf-8?B?WHpuRmxmaldjbVVuc0hpaEk0Z1FOOERvUVVuWThZL1ZHbFpMcXJtbUZ0eEtL?=
 =?utf-8?B?dml2eE5TdFI5MTNUUUZXNW42c3ZoYlRSTmU1SjljazZYSkp2WjJGdStROWRq?=
 =?utf-8?B?Q0xUOWxVNUlBVWkzb1VNa3VKSWJtVFN0azd6b25xTHFyTDNlL2NGZ05vMUR3?=
 =?utf-8?B?UjBwRWJ3dVFmUW9XVCs4NDUyRVJQalRTWkduTy95bzZHS01BM1RncmVTUmRr?=
 =?utf-8?B?VEwyR0tOdWJsRnZuYWowTFlXYjZqK2JUeW11SE9PaFFhSkNodllERGZJZXJY?=
 =?utf-8?B?bU12K01WbEZzNkV2Sk1MTGsrb3N1Z1FBRTErVTdiaEVQdFpjV29STlZqSkhr?=
 =?utf-8?B?Z3E1c3Q2WjVZZjl1RHVtNkh1ZW5zaHNiY2x5RUpXNS9LME1WS2oweGlsL215?=
 =?utf-8?B?VXNYa1ZhMnIxZHlLUFpIWTJIODBmejNudW1abUtZdlo3T1dTVkZ2Y0NIMU5G?=
 =?utf-8?B?Mmdzc2FDcmRYcTNXUThWaFB6UUhZUTFUU3ZTZWVTQkNsU1ZSZmlnTmErWTYy?=
 =?utf-8?B?bFkzOGVmeXlhaWExQUdkK3dPY3FrWFN5ZDFNaTB5STVKS0VMcFZQV3dWWWlq?=
 =?utf-8?B?eENxY0dQWXBKcFUxRld0R3BKWTZuUG1WaGE0eWtkZXZENXhMSVAxSDlSQTBM?=
 =?utf-8?B?TGFJRnhGeVlMZXNLaG5JL2J6elJLT2QxeGlmRXluZTFyTnQxbm5LVDdYS1dC?=
 =?utf-8?B?UEtkbkJEejRYaHdKODB2Um5USzM5Zzg1aXRQWEpZZHNEWDk0aUdaQU9ZY1Az?=
 =?utf-8?B?aC9YdGdQa21tZDR5WDlTdWM3dENyMnpHbTZtQ2Voa1gzeVkxVkpGZWUvM056?=
 =?utf-8?B?Si83T0NIbXJvMjU5c3ZHbzdCalEvTDV4SlE4TFVSNGhkQU0wdEVzMmR0Q21V?=
 =?utf-8?B?NXpzZzRGcEdUekZMNWtrMGdrL01ZVnhQUDhtemgzb2lnekNXa29TVHFIbmht?=
 =?utf-8?B?K3N2bDR5Z09iRG9mOWQ5b2ZTOWM3OHpVUjRMdm1sQ0RQWnBpSTJobnpFeHAy?=
 =?utf-8?B?c3JtbXlJRTV2T2hsU3FzbGJocHg2a29Pam5mOVlkZmFpN2dhbzdBZ0lHalNO?=
 =?utf-8?B?SkxoM1FVRWpwVDE1eEZHQkZPZXV1bWxmaENNai9lekcvRmdIRjFEMFBab3Qz?=
 =?utf-8?B?US8yK25HZkdjRVowMExQN2M3VVdibFVLVGF6cnRaa0doSllON0dlZVpOSzQz?=
 =?utf-8?Q?Zw+M9OZVnrupIDCJnnOR1aM=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6135350-73d9-4e57-b7b6-08dcec3eadc9
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 10:55:12.9169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OECK2dBgSec5jYSQutRm5GshuOMrfw4+wt7KK9iLDJxtinVGXbUHAHRi9WloJZBWeahUfw0AKC9FwOq/Ts0tA9VducDtJExVYnqig3c7KJ+JVQX7c8CaxDPvZ0kX0QFZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR01MB7752
X-Spam-Status: No, score=0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,
	SPF_PASS,WEIRD_QUOTING autolearn=disabled version=4.0.0
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
Cc: Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Khanh Pham <khpham@amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi @Andrew, I just upstreamed the patch 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/Documentation/devicetree/bindings/trivial-devices.yaml?id=3d973b98d2744cfced1f06167c83e2cc2d7b63d5 
  to linux-next branch,  I think we also need to pick it up to 
https://github.com/openbmc/linux/tree/dev-6.6, which will help pass the 
"onnn,adt7462" compatible warning log from the dt_binding_check tool.

On 14/10/2024 17:50, Chanh Nguyen wrote:
> The Mt. Jefferson BMC is an ASPEED AST2600-based BMC for the Mt. Jefferson
> hardware reference platform with AmpereOne(TM)M processor.
> 
> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> ---
>   arch/arm/boot/dts/aspeed/Makefile             |   1 +
>   .../aspeed/aspeed-bmc-ampere-mtjefferson.dts  | 646 ++++++++++++++++++
>   2 files changed, 647 insertions(+)
>   create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts
> 
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
> index c4f064e4b073..b1fb0853a789 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>   	aspeed-bmc-amd-daytonax.dtb \
>   	aspeed-bmc-amd-ethanolx.dtb \
>   	aspeed-bmc-ampere-mtjade.dtb \
> +	aspeed-bmc-ampere-mtjefferson.dtb \
>   	aspeed-bmc-ampere-mtmitchell.dtb \
>   	aspeed-bmc-arm-stardragon4800-rep2.dtb \
>   	aspeed-bmc-asrock-e3c246d4i.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts
> new file mode 100644
> index 000000000000..f24111ab9e65
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts
> @@ -0,0 +1,646 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright 2024 Ampere Computing LLC.
> +
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/i2c/i2c.h>
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +	model = "Ampere Mt. Jefferson BMC";
> +	compatible = "ampere,mtjefferson-bmc", "aspeed,ast2600";
> +
> +	aliases {
> +		i2c20 = &i2c4_bus70_chn0;
> +		i2c22 = &i2c4_bus70_chn2;
> +		i2c24 = &i2c2_bus70_chn0;
> +
> +		/*
> +		 *  I2C OCP alias port
> +		 */
> +		i2c30 = &ocpslot;
> +
> +		/*
> +		 *  I2C NVMe alias port
> +		 */
> +		i2c48 = &nvmeslot_0;
> +		i2c49 = &nvmeslot_1;
> +		i2c50 = &nvmeslot_2;
> +		i2c51 = &nvmeslot_3;
> +		i2c52 = &nvmeslot_4;
> +		i2c53 = &nvmeslot_5;
> +		i2c54 = &nvmeslot_6;
> +		i2c55 = &nvmeslot_7;
> +		i2c56 = &nvmeslot_8;
> +		i2c57 = &nvmeslot_9;
> +		i2c58 = &nvmeslot_10;
> +		i2c59 = &nvmeslot_11;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart5;
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x80000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		gfx_memory: framebuffer {
> +			size = <0x01000000>;
> +			alignment = <0x01000000>;
> +			compatible = "shared-dma-pool";
> +			reusable;
> +		};
> +
> +		video_engine_memory: video {
> +			size = <0x04000000>;
> +			alignment = <0x01000000>;
> +			compatible = "shared-dma-pool";
> +			reusable;
> +		};
> +
> +		vga_memory: region@bf000000 {
> +			no-map;
> +			compatible = "shared-dma-pool";
> +			reg = <0xbf000000 0x01000000>;  /* 16M */
> +		};
> +	};
> +
> +	voltage_mon_reg: voltage-mon-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "ltc2497_reg";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		led-bmc-ready {
> +			gpios = <&gpio0 ASPEED_GPIO(W, 5) (GPIO_ACTIVE_HIGH | GPIO_TRANSITORY)>;
> +		};
> +
> +		led-sw-heartbeat {
> +			gpios = <&gpio0 ASPEED_GPIO(N, 3) GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		led-identify {
> +			gpios = <&gpio0 ASPEED_GPIO(S, 3) GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		led-fault {
> +			gpios = <&gpio0 ASPEED_GPIO(P, 4) GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +
> +	iio-hwmon {
> +		compatible = "iio-hwmon";
> +		io-channels =   <&adc0 0>, <&adc0 1>, <&adc0 2>,
> +				<&adc_i2c_2 0>, <&adc_i2c_2 1>,
> +				<&adc_i2c_2 2>, <&adc_i2c_2 3>,
> +				<&adc_i2c_2 4>, <&adc_i2c_2 5>,
> +				<&adc_i2c_2 6>, <&adc_i2c_2 7>,
> +				<&adc_i2c_2 8>, <&adc_i2c_2 9>,
> +				<&adc_i2c_2 10>, <&adc_i2c_2 11>,
> +				<&adc_i2c_2 12>, <&adc_i2c_2 13>,
> +				<&adc_i2c_2 14>, <&adc_i2c_2 15>,
> +				<&adc_i2c_0 0>, <&adc_i2c_0 1>,
> +				<&adc_i2c_0 2>, <&adc_i2c_0 3>,
> +				<&adc_i2c_0 4>, <&adc_i2c_0 5>,
> +				<&adc_i2c_0 6>, <&adc_i2c_0 7>,
> +				<&adc_i2c_0 8>, <&adc_i2c_0 9>,
> +				<&adc_i2c_0 10>, <&adc_i2c_0 11>,
> +				<&adc_i2c_0 12>;
> +	};
> +};
> +
> +&mdio0 {
> +	status = "okay";
> +
> +	ethphy0: ethernet-phy@0 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0>;
> +	};
> +};
> +
> +&mac0 {
> +	status = "okay";
> +
> +	phy-mode = "rgmii";
> +	phy-handle = <&ethphy0>;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii1_default>;
> +};
> +
> +&mac3 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rmii4_default>;
> +	clock-names = "MACCLK", "RCLK";
> +	use-ncsi;
> +};
> +
> +&fmc {
> +	status = "okay";
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "bmc";
> +		spi-max-frequency = <50000000>;
> +#include "openbmc-flash-layout-64.dtsi"
> +	};
> +
> +	flash@1 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "alt-bmc";
> +		spi-max-frequency = <50000000>;
> +#include "openbmc-flash-layout-64-alt.dtsi"
> +	};
> +};
> +
> +&spi1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_spi1_default>;
> +
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "pnor";
> +		spi-max-frequency = <20000000>;
> +	};
> +};
> +
> +&uart1 {
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	status = "okay";
> +	i2c-mux@70 {
> +		compatible = "nxp,pca9548";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0x70>;
> +		i2c-mux-idle-disconnect;
> +
> +		i2c2_bus70_chn0: i2c@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x0>;
> +			psu@58 {
> +				compatible = "pmbus";
> +				reg = <0x58>;
> +			};
> +
> +			psu@59 {
> +				compatible = "pmbus";
> +				reg = <0x59>;
> +			};
> +		};
> +	};
> +};
> +
> +&i2c3 {
> +	status = "okay";
> +	bus-frequency = <1000000>;
> +	multi-master;
> +	mctp-controller;
> +
> +	mctp@10 {
> +		compatible = "mctp-i2c-controller";
> +		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +	};
> +};
> +
> +&i2c4 {
> +	status = "okay";
> +	eeprom@50 {
> +		compatible = "atmel,24c64";
> +		reg = <0x50>;
> +		pagesize = <32>;
> +	};
> +
> +	i2c-mux@70 {
> +		compatible = "nxp,pca9545";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0x70>;
> +		i2c-mux-idle-disconnect;
> +
> +		i2c4_bus70_chn0: i2c@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x0>;
> +
> +			eeprom@52 {
> +				compatible = "atmel,24c256";
> +				reg = <0x52>;
> +				pagesize = <32>;
> +			};
> +			temperature-sensor@48 {
> +				compatible = "ti,tmp75";
> +				reg = <0x48>;
> +			};
> +			temperature-sensor@49 {
> +				compatible = "ti,tmp75";
> +				reg = <0x49>;
> +			};
> +			temperature-sensor@4a{
> +				compatible = "ti,tmp75";
> +				reg = <0x4a>;
> +			};
> +			temperature-sensor@4b {
> +				compatible = "ti,tmp464";
> +				reg = <0x4b>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				channel@0 {
> +					reg = <0x0>;
> +					status = "disabled";
> +				};
> +				channel@1 {
> +					reg = <0x1>;
> +					status = "disabled";
> +				};
> +				channel@2 {
> +					reg = <0x2>;
> +					status = "disabled";
> +				};
> +				channel@3 {
> +					reg = <0x3>;
> +					status = "disabled";
> +				};
> +				channel@4 {
> +					reg = <0x4>;
> +				};
> +			};
> +			temperature-sensor@4d {
> +				compatible = "ti,tmp75";
> +				reg = <0x4d>;
> +			};
> +			temperature-sensor@4e {
> +				compatible = "ti,tmp75";
> +				reg = <0x4e>;
> +			};
> +			temperature-sensor@4f {
> +				compatible = "ti,tmp75";
> +				reg = <0x4f>;
> +			};
> +			temperature-sensor@28 {
> +				compatible = "nuvoton,nct7802";
> +				reg = <0x28>;
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				channel@1 { /* RTD1 */
> +					reg = <1>;
> +					sensor-type = "temperature";
> +					temperature-mode = "thermistor";
> +				};
> +			};
> +			adc_i2c_0: adc@14 {
> +				compatible = "lltc,ltc2497";
> +				reg = <0x14>;
> +				vref-supply = <&voltage_mon_reg>;
> +				#io-channel-cells = <1>;
> +			};
> +		};
> +
> +		i2c4_bus70_chn2: i2c@2 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x2>;
> +
> +			adc_i2c_2: adc@14 {
> +				compatible = "lltc,ltc2497";
> +				reg = <0x14>;
> +				vref-supply = <&voltage_mon_reg>;
> +				#io-channel-cells = <1>;
> +			};
> +		};
> +	};
> +};
> +
> +&i2c5 {
> +	status = "okay";
> +	i2c-mux@70 {
> +		compatible = "nxp,pca9548";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0x70>;
> +		i2c-mux-idle-disconnect;
> +
> +		i2c@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x0>;
> +
> +			i2c-mux@71 {
> +				compatible = "nxp,pca9548";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				reg = <0x71>;
> +				i2c-mux-idle-disconnect;
> +
> +				nvmeslot_8: i2c@0 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <0x0>;
> +				};
> +				nvmeslot_9: i2c@1 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <0x1>;
> +				};
> +				nvmeslot_10: i2c@2 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <0x2>;
> +				};
> +				nvmeslot_11: i2c@3 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <0x3>;
> +				};
> +			};
> +
> +			i2c-mux@72 {
> +				compatible = "nxp,pca9548";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				reg = <0x72>;
> +				i2c-mux-idle-disconnect;
> +
> +				nvmeslot_4: i2c@4 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <0x4>;
> +				};
> +				nvmeslot_5: i2c@5 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <0x5>;
> +				};
> +				nvmeslot_6: i2c@6 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <0x6>;
> +				};
> +				nvmeslot_7: i2c@7 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <0x7>;
> +				};
> +			};
> +
> +			i2c-mux@74 {
> +				compatible = "nxp,pca9548";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				reg = <0x74>;
> +				i2c-mux-idle-disconnect;
> +
> +				ocpslot: i2c@0 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <0x0>;
> +
> +					ocpslot_temp: temperature-sensor@1f {
> +						compatible = "ti,tmp421";
> +						reg = <0x1f>;
> +						#address-cells = <1>;
> +						#size-cells = <0>;
> +
> +						channel@0 {
> +							reg = <0x0>;
> +							status = "disabled";
> +						};
> +						channel@1 {
> +							reg = <0x1>;
> +						};
> +					};
> +				};
> +
> +				nvmeslot_0: i2c@4 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <0x4>;
> +				};
> +				nvmeslot_1: i2c@5 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <0x5>;
> +				};
> +				nvmeslot_2: i2c@6 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <0x6>;
> +				};
> +				nvmeslot_3: i2c@7 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <0x7>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&i2c6 {
> +	status = "okay";
> +
> +	rtc@51 {
> +		compatible = "nxp,pcf8563";
> +		reg = <0x51>;
> +	};
> +};
> +
> +&i2c7 {
> +	status = "okay";
> +
> +	temperature-sensor@4f {
> +		compatible = "ti,tmp75";
> +		reg = <0x4f>;
> +	};
> +};
> +
> +&i2c8 {
> +	status = "okay";
> +
> +	fan-controller@5c {
> +		compatible = "onnn,adt7462";
> +		reg = <0x5c>;
> +	};
> +};
> +
> +&i2c9 {
> +	status = "okay";
> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c02";
> +		reg = <0x50>;
> +	};
> +
> +	eeprom@52 {
> +		compatible = "atmel,24c02";
> +		reg = <0x52>;
> +	};
> +
> +	temperature-sensor@18 {
> +		compatible = "jedec,jc-42.4-temp";
> +		reg = <0x18>;
> +	};
> +
> +	temperature-sensor@1a {
> +		compatible = "jedec,jc-42.4-temp";
> +		reg = <0x1a>;
> +	};
> +};
> +
> +&i2c10 {
> +	status = "okay";
> +};
> +
> +&i2c11 {
> +	status = "okay";
> +	ssif-bmc@10 {
> +		compatible = "ssif-bmc";
> +		reg = <0x10>;
> +	};
> +};
> +
> +&i2c14 {
> +	status = "okay";
> +	eeprom@50 {
> +		compatible = "atmel,24c64";
> +		reg = <0x50>;
> +		pagesize = <32>;
> +	};
> +
> +	bmc_ast2600_cpu: temperature-sensor@48 {
> +		compatible = "ti,tmp75";
> +		reg = <0x48>;
> +	};
> +};
> +
> +&i2c15 {
> +	status = "okay";
> +	gpio_expander1: gpio-expander@22 {
> +		compatible = "nxp,pca9535";
> +		reg = <0x22>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		gpio-line-names =
> +			"presence-ocp1","presence-ocp2",
> +			"","",
> +			"","",
> +			"","",
> +			"","",
> +			"","",
> +			"","",
> +			"","";
> +	};
> +};
> +
> +&adc0 {
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
> +		&pinctrl_adc2_default>;
> +};
> +
> +&vhub {
> +	status = "okay";
> +};
> +
> +&video {
> +	status = "okay";
> +	memory-region = <&video_engine_memory>;
> +};
> +
> +&gpio0 {
> +	gpio-line-names =
> +	/*A0-A7*/	"","","","","cpu-type-detect","i2c2-reset-n","i2c6-reset-n","i2c5-reset-n",
> +	/*B0-B7*/	"","","","","host0-sysreset-n","host0-pmin-n","fru-rd-complete",
> +			"chassis-id-sel",
> +	/*C0-C7*/	"s0-vrd-fault-n","","bmc-debug-mode","","cpld-3v3-irq-n","","vrd-sel",
> +			"spd-sel",
> +	/*D0-D7*/	"presence-ps0","presence-ps1","hsc-12vmain-alt2-n","ext-high-temp-n",
> +			"","","","",
> +	/*E0-E7*/	"eth-phy-rst-n","eth-phy-int-n","","","","","","",
> +	/*F0-F7*/	"s0-pcp-oc-warn-n","","power-chassis-control",
> +			"cpu-bios-recover","s0-heartbeat","hs-scout-proc-hot","s0-vr-hot-n","",
> +	/*G0-G7*/	"","","hsc-12vmain-alt1-n","","","bp-cpld-program-en","led-fp-sta-gr",
> +			"led-fp-sta-amb",
> +	/*H0-H7*/	"jtag-program-sel","jtag-cmpl2","wd-disable-n","power-chassis-good","","",
> +			"","",
> +	/*I0-I7*/	"","","","","","","power-button","rtc-battery-voltage-read-enable",
> +	/*J0-J7*/	"","","","","","","","",
> +	/*K0-K7*/	"","","","","","","","",
> +	/*L0-L7*/	"","","","","reset-button","","","",
> +	/*M0-M7*/	"nmi-n","s0-ddr-save","soc-spi-nor-access","presence-cpu0","s0-rtc-lock",
> +			"","","",
> +	/*N0-N7*/	"hpm-fw-recovery","hpm-stby-rst-n","jtag-sel-s0","led-sw-hb",
> +			"jtag-dbgr-prsnt-n","","","",
> +	/*O0-O7*/	"","","","","","","","",
> +	/*P0-P7*/	"ps0-ac-loss-n","ps1-ac-loss-n","","","led-fault","user-mode","jtag-srst-n",
> +			"led-bmc-hb",
> +	/*Q0-Q7*/	"","","","","","","","",
> +	/*R0-R7*/	"","","","","","","","",
> +	/*S0-S7*/	"","","identify-button","led-identify","","spi-nor-access","host0-ready","",
> +	/*T0-T7*/	"","","","","","","","",
> +	/*U0-U7*/	"","","","","","","","",
> +	/*V0-V7*/	"s0-hightemp-n","s0-fault-alert","s0-sys-auth-failure-n",
> +			"host0-reboot-ack-n","s0-fw-boot-ok","host0-shd-req-n",
> +			"host0-shd-ack-n","s0-overtemp-n",
> +	/*W0-W7*/	"ocp-aux-pwren","ocp-main-pwren","ocp-pgood","",
> +			"bmc-ok","bmc-ready","spi0-program-sel","spi0-backup-sel",
> +	/*X0-X7*/	"","","","","","","","",
> +	/*Y0-Y7*/	"","","","vrd-prg-en-n","","","","host0-special-boot",
> +	/*Z0-Z7*/	"","ps0-pgood","ps1-pgood","","","","","";
> +
> +	ocp-aux-pwren-hog {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(W, 0) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "ocp-aux-pwren";
> +	};
> +
> +};
> +
> +&gpio1 {
> +	gpio-line-names =
> +	/*18A0-18A7*/	"","","","","","","","",
> +	/*18B0-18B7*/	"","","","","s0-soc-pgood","vga-ft-press-n","emmc-rst-n","s01-uart1-sel",
> +	/*18C0-18C7*/	"uart1-mode0","uart1-mode1","uart2-mode0","uart2-mode1",
> +			"","","","",
> +	/*18D0-18D7*/	"","","","","","","","",
> +	/*18E0-18E3*/	"","","","";
> +};

