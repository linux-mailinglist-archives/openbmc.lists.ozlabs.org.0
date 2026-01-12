Return-Path: <openbmc+bounces-1178-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8462D159C2
	for <lists+openbmc@lfdr.de>; Mon, 12 Jan 2026 23:47:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqnY10915z2yRM;
	Tue, 13 Jan 2026 09:46:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.107.208.113 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768212888;
	cv=pass; b=Chi0LbiVGFtMAclvuowvqvbqYkN1mms5hx8HNjFazRuCOlc4vo9apjCd4xCXFICvL2/6RPL7dnAJJm6IpnPRS0nWZPw8zPL3cUG2nQRmcjJsC3a5RzYTKdOMT4OCCi7AJNw5MaD7gnI+ET/ku4FPC4NH/pFMpRNe7PC43i36+0RbsZYEBZdip6TB8HHI/6vXEarnzp2E2yLYzPSsH5SJDvJjEbd3UmeK5ES3dKJJzcwfnvNYZPgCreG+DHYTdDvpElE2rr/eILCT0zLRekGlcow5YuTp0Fv91IVAVQvkhBbtMHtrptvouLqNiwlw1vNC2LNPQH6eRaADWMiXG0Jezg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768212888; c=relaxed/relaxed;
	bh=f/OdanEruh2+uxeAR8oZ2NbdjZGOPOuLWpiBnlZ1n9c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mKQXRBd6qUVdXXd1UIGWq7FdMCgUrv/6L3hCrfMLGL+H29Dixu+jwS4GoBFUa2Eu/DmPwU/TiEv/9/avawbop5XhgWLPLksVPBmpyOyMmfQtn9ow11f1TTkxYhjhdkJxSe5oCuEfnFctfDXPnZNltEgZEbeLDGPTp7YEr1pC3Z4jBNm7Fqgfen/YIdmE5r+m8c2RTqW5Ei56Vmeetxi483Dr0tOhxf7iO/O8hwVbVrAoBngSDkOLqdIxJy1pSGyJtdpW/USuIol7LwwEbjKG+9TflgwqM01xJBhTFNgGrLVCuLdtlHcK+MjZb74CFZwME1joyzXHRDWiMKZCG+bBtQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=OoEqGFHn; dkim-atps=neutral; spf=pass (client-ip=40.107.208.113; helo=ph0pr06cu001.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=OoEqGFHn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=40.107.208.113; helo=ph0pr06cu001.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org)
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11021113.outbound.protection.outlook.com [40.107.208.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqSsy57TJz304r
	for <openbmc@lists.ozlabs.org>; Mon, 12 Jan 2026 21:14:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XvFzxsdevf8i08Tl397QexQij3PbPIcmvwJLofshjYaehELK8+K2O94XdBIWGB5btXD9ixyQtkFPsKUIK7EhkZ9Oh41WZU8pku4Y89WDyZ+x1H8CKoWAgEvhBWO34YhVqtPPW0GXVghaBk19nfyXJikBy/GrB+0Q0tGdZfv/Eo/NqOrnSJdW+m7bVd7n8kix0FbTLBSqSGZcbTR0dNZa4OZt4ozKZKFj7OSArsFC0oaO26R51Hnk30nqJTF58tlu127oLLo6Nn0O5OQdmdvRvL97ai30KCV28GYpmhh+gjp3jOhS06HeiE2Ydrw5Abav57Hk7OeU1m7GhOiqk8AjQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/OdanEruh2+uxeAR8oZ2NbdjZGOPOuLWpiBnlZ1n9c=;
 b=bGYueWMqUzq9ZNrNDmndImGrhITkJ5RNzQCtWQSfSfyR2vEaO+Gvngv9ZW01Y/jFF0Vq+yFLRWgvJXw9WYDZ5H/fhHTMXVBMNK4jD96KYImcuo8KHdQMAwIPoOyNrte1mkBOWukiWEBkSNTmq3Lnd7+PRbBM/YvpOVOcZbOOhb20TjRz8bzms2jntBdLt3+jXT1DovesKW2h3dLTwfaYarJAk7fulVJN0WhoVPR0XwrS6FcWsq08SJrzv5gTSj/eYY7ZMSSawW/J0MupArSFcYQ9MwGs+ag1+Gla9idSdM3Sw4D1t1aFn5MNI6UnpGfof0GcLH3NVgkGuNqsS6XxJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/OdanEruh2+uxeAR8oZ2NbdjZGOPOuLWpiBnlZ1n9c=;
 b=OoEqGFHnSfD6a0yVJPP+2yoIkGssEXycR6XCbKnYZ3m50HYt2fTIk/OGqCZZgy/Ykojrpso0JdeiyV6Cj2hWhjLwU7gEAbH+c14SlFclHsPuqQhRqkqLt1CetOcMI2AKhQoYgXJSlK1hKCgg5ZtXNb7QqtAH0ETRpnoHqC9+taH8WnOXmKtelZHiR5QQyobVs4Qbqf9vXr6sN7LWgSoK15aBQMfchS2GbQ6SxC+0rudSXrSHrQxueNY/Kar86OTc2qG0jCR8S478EAbmNLLfA68ikdas+WpVpRz0e7QMkebjfp7IHxNs4aAz56TUAncihgSqyMS4zeOhcCCroQ16+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from PH0PR18MB4558.namprd18.prod.outlook.com (2603:10b6:510:ac::13)
 by IA0PPFB6CE6916B.namprd18.prod.outlook.com (2603:10b6:20f:fc04::c36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 10:14:05 +0000
Received: from PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311]) by PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 10:14:05 +0000
Message-ID: <e59565e2-95a9-4a74-82e3-b9a9e9ea5d89@axiado.com>
Date: Mon, 12 Jan 2026 18:13:57 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add Axiado AX3000 eMMC Host Controller Support
To: Krzysztof Kozlowski <krzk@kernel.org>,
 SriNavmani A <srinavmani@axiado.com>,
 Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Michal Simek <michal.simek@amd.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, openbmc@lists.ozlabs.org
References: <20260109-axiado-ax3000-add-emmc-host-driver-support-v2-0-934f1a61f7c0@axiado.com>
 <55a2c060-014f-4077-85a1-15f6f799d263@kernel.org>
Content-Language: en-US
From: Tzu-Hao Wei <twei@axiado.com>
In-Reply-To: <55a2c060-014f-4077-85a1-15f6f799d263@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0028.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::17) To PH0PR18MB4558.namprd18.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH0PR18MB4558:EE_|IA0PPFB6CE6916B:EE_
X-MS-Office365-Filtering-Correlation-Id: c30c2b67-c3a0-4aff-cea3-08de51c350d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|42112799006|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MlVjNFJwaG9aVS92cTR4UVpyajZ2dmVjOU90cm5ENmJobGx4UVpOdzByR3BH?=
 =?utf-8?B?akl3NFp0ckR5Um5MZkxoa0t0ck05KzNGT3JPYnBUNmhUcHAzbVc2NzhyWTBS?=
 =?utf-8?B?dnpncnh6b3B2ZkdxNUM4ODU4eUxERlJIakZ4anVMQ0dvR1h6UXBVWG9Sc3VI?=
 =?utf-8?B?ZG5JZ2ZxbFJBUUhMUzRJMUdNUGJ5eHZZcCtLQW1Ha1VqeVVyVGpmTi9DVzFh?=
 =?utf-8?B?VllUUGc4WFo2RVN1bTlZWHdSYk05NnZvYVBPMmhhSFdTdWVYZ0NpbzRQcVBr?=
 =?utf-8?B?OFdiK1J6S2p0ZTVBRjg4a0hTQUtvbE9mUzhrVGZaa2hBN3lscmVtb1RZYWE0?=
 =?utf-8?B?WVdJUndxUXhIbG9UT2YydzBkV1lLTStpZlYzNDVsdHNOQ1d4OGJwYVF1ZnA4?=
 =?utf-8?B?eWFiOWxmRmhIM084YklDWC8rMzZtcDRiRjZzRGhyd1k1YUNLWDhKTzlrMUxZ?=
 =?utf-8?B?NXdMK2hGL0swTjhrVWJ6U1kyQ1lBU0k2NElPelhEYlZnRWFSUFlZOWRtZDJJ?=
 =?utf-8?B?cnpCZFl2QlM2L1lPYllhSmpvc0xyd0oydzg5eTA1b1dKZ2dkUjdCQXdlcXpK?=
 =?utf-8?B?KzB1N1dQVkdLWUt1VUZwZy9TSXhoZ1ZSNHNBWnNxVWxYekYrMTdjQ1drLzRQ?=
 =?utf-8?B?amdIU1BiTDIvTm41b0JWenBOUWF3aW5vOW12M0xpYVZQM255SmF5MmlsaFVU?=
 =?utf-8?B?L0JlOGdXQ1Y0U2JqcC92TUZJVk5UWFg0UlFFUE9ZWGtCSGpvdjBzRU5KRWFT?=
 =?utf-8?B?c2hJWlNCdzZXTWJPdXMzUHM3ZVlFNTdOcnU1dTlqV2R0UVdaNzRqSUhrR2tJ?=
 =?utf-8?B?VGJJQjBVMkZ3U3RBR1JGakNZY1lITTNNc3RDb3VTcytIWUtrQ1Z2VTkzclNl?=
 =?utf-8?B?RkswOENrNFdZWUIzQlZoUEwzOW5DOXd4bDlSM1JMYzZKQWRKZjBKVGFxQ0d1?=
 =?utf-8?B?em9zaGZ3eHZzcURCVHRoV25ORFI2OXZYMjRlcGZhREJzNEVLeUF3TGQvSThT?=
 =?utf-8?B?cDd6bDA0TWZLUUUwNzE4LzZ5RU5FNVdBVWpEUm40WWtvSGJOT3BpUU9Eckdp?=
 =?utf-8?B?WjNsc3lQZ2x2Rk9YY0pXamwrTUY5VkROZGFJOFZVazZxM291TkNYOTg5ZC9r?=
 =?utf-8?B?ekJxd0FWKzBWdjIyR2dOaWxiRUVWeGdudlNwbnl6Z3VtbkxXdTREV3pNTU9y?=
 =?utf-8?B?anRNMVBvOFJyTGlhZlNRUll2NW9uWlg2RjBYWUlSOEkwb296SW0xSVBRRExs?=
 =?utf-8?B?R3N1bk1ZeG5QQ1dkVTNMMnpCd3BjNUMzem8xT2lqbmt3VXk0dytGZzF2U0RN?=
 =?utf-8?B?V2lHTzhrN2hTaTEvUXdNYjE1Rlc5a3RCMzZINkR6OXFPTkppZzhXcThnVGpp?=
 =?utf-8?B?TkpzMzYxZkpSeEdmSmNFTVB1ZjBDZUkra1V0TXUyd3ZkV2VTbUtJd25lbTdD?=
 =?utf-8?B?d1B5SGNiWUtGeWRYRmxHUUtjOTlWMkkyZmdYd0dMVHc2VjBSVVJQeVgyYk9B?=
 =?utf-8?B?Q0RmRkVQbC9yaWVycVJLaFN5VFRmU0FOZTNHNXVWNEZwakhFbmMxejBFNUNU?=
 =?utf-8?B?ZFB4d3Q0NkVGQ1VpOEFtdzBpVWdwR0hJYWQzMXNjcFRDMzVod3htVGZNNGRP?=
 =?utf-8?B?Y0tmL1ora2FweFR4c1VJNEk5Vlc2dGpBQWhxOWNadXp6YllmRkQvNGhvUzNB?=
 =?utf-8?B?NmJlMkd2Y2pkMGFwZWluZzc2NUNhdnNHNS9xdzgzTFZ3RUpsb0FBS1c4TVds?=
 =?utf-8?B?eG1lQzIwK1E0bjhjRU9nZGdEMWJUSUFQRjVQZDZRTUJGZjd3MWRPVmRxZ1Bt?=
 =?utf-8?B?Y1oyQ1R2OUM3dWtVenpOWGRoV01RRHVVUmRobEY4Zlc3QXBLWVZkMUlZcjNa?=
 =?utf-8?B?OHB0dG1zZ0E3T0RGdDFWNHpaNHlvYWdrZ1JrME90dEZHTmUyNFRteFQvTGJl?=
 =?utf-8?B?UU84ek1DQzdpdU1XTWRhSGRHaVJ1VTI1WmVYMXJjOTlCOWpINGg2djQ0MkFa?=
 =?utf-8?Q?czL0sFgNUqZYtThMxDUuFcLljGwOyw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB4558.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(42112799006)(1800799024)(366016)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2NCWVM5eEZpdUxINjZTSUlrYkhqSVhoSVo3dUorQ1Z0alA0bXprNDlDMFlT?=
 =?utf-8?B?NnN4YzVRd0Y3TG15c1ArYWowSmltWXhsSHBEdDFDRXlvSFk3VEpWWEVOSzlj?=
 =?utf-8?B?YmQ5Rk9JUUszc0tmVGJWMW5rZlJnN0ptdDN5b0JjSEx0cWtMTnNmR0N2QWdQ?=
 =?utf-8?B?R0NoY29oZE1ZSUdsL2Y0Zkw0OU8yZXFZZXp6MFVCTkYrRTRKYW51WjNZY2VY?=
 =?utf-8?B?T25TZzIyZTNJWEdqb2cvb1RqVHo5NXZiaEZoL0Jwa2pEeHo5UFFKQUxGckhy?=
 =?utf-8?B?S1pyNVF1K3AzVFV2eTd6dEJvZUo0NnhoVDJIMVpubjYxUGl1V3lFdUdxMVhP?=
 =?utf-8?B?WTBXdDhzWnlBQVNPUVhSOVRiOW1tYWgyckg0Z0FHUy9yemZkaWYveG9vRjAy?=
 =?utf-8?B?N2Z2OXBmZjJ3dmtWT09qN2FDNVBCVkNxaVdkaGRzUmhVcnl0Y2VLUHI3Tkcy?=
 =?utf-8?B?U1Mva3EvVVJ0eEUxNmpzdVdjWlBJMUVGSjFBMDRta0N6dGxvWFA3TEF1MUZ1?=
 =?utf-8?B?ZzJiUHdZMjNSVG0ybXVUdkRaQlIxbzZWU1JjMG1BVkJ0YXhVek1ZV3R4QlhE?=
 =?utf-8?B?RzlLVmZDK2ZHMWFiQkUvZzY4aVBDSlplcU40aGIyNGJMTU5RQ2tnWTIvZ0NR?=
 =?utf-8?B?THVtOTJ2cmswa1AxU0J4OWdZeGJzV3FHaklTYzUybWR0RnBFcTRqNjRkdEpP?=
 =?utf-8?B?SDZRQnpoQ0paQnlGMGdhaWtObjhadlRIeWEyUnZ0TDkycEZLOUlaT0h2UGFx?=
 =?utf-8?B?OXZuSkUxSVFqV1d4Vk56WCtpT1pUREd0NE9TanJCUW1aZVV3dlNKZWtKYmZm?=
 =?utf-8?B?RFp6T3dqTndOeGtSSVVkcXVMR0xyVVRUUFgvZk4rUWRlK2VOY3lMWVdISVY5?=
 =?utf-8?B?OHdpTWlUbkVlMmovU25ETDhoTmdQNkk2ekFmR0Q4RWdKOG1kcndKTUJ2NGl4?=
 =?utf-8?B?cnl0aE9rcWdYSTlvUGZCZUNOL3p4NnRGWnhyRElzSEdLbU1mOG81clhRdDBv?=
 =?utf-8?B?MWZMQ3FFdnhtV0JXeDhXQ3M2b1J2UURIeWRlT0NnMmIzVzFoNGF3a1NNeHVM?=
 =?utf-8?B?dDdXZmJCZEZVdi9jK29iTGQyc1Fua0EzU3VWU3h2c2lQRVl5QXVqc01aUDZi?=
 =?utf-8?B?dGxIcncydXZRd0YyTmpGTlBNa3JqemhZOHZYa0krNXovSG1MZlFSNlRpUzk1?=
 =?utf-8?B?VGpialJ6cFR5UHZlUk5uT29BTVJhMHBBUEdGY0RIdW9mekEweTN4enZQd3pv?=
 =?utf-8?B?STRlenlhQytabGFMc2VVakxwb3hEWVlxeUh5dlhkWVFHYm1NYXJWa1JyTDBF?=
 =?utf-8?B?UnFHTW5GZlZrN29ORG5FU3FTa3QzZU1vK3lEdDRXU2d6VDFIZG5CekxMS25t?=
 =?utf-8?B?SEprTmpWUGNqanpvNllsandpZVJrRWNRaG9DRzhUUVJQczh3UWg4bVpuL2ts?=
 =?utf-8?B?N0ZNNUNJZjA5R2pIOXcrNnJHbDB0aWh1T0pyRG5iai9NSWVMVWMyejk2UDdk?=
 =?utf-8?B?anVsSU5nQzJ2UTNPZndDakJ6dnhoZlArNk0wSFZ6SVNjSi82bGZIYkNQQkwv?=
 =?utf-8?B?YWtJbUdYTS9sMEpmZ1dBNTJsWUFyTXpuUlBOakRLMlF4Yzk4akovUDd3a2Zm?=
 =?utf-8?B?dHg1M3k2eWlVY1djR1VlY3dmRmNqbGlYNVk1ODNUSkE4TU5VeTQxVlQvRHFa?=
 =?utf-8?B?bHlibUMrZnNKMmtiZXVpSmovVTFpZm1ZbXZFRU0ya3V2MTdXRTF5dkg1am1w?=
 =?utf-8?B?WmRGVnYxRDE0T0xHSVRoT29XRXc3L0EyUmlnZDJMeDY5V28zSEErQ2Q3aU1o?=
 =?utf-8?B?L2VsYzlaNTNnQ2RLSnIzakRJNHBiWWhadUJ1dTBuREFxZUF3VFdyRHdxa0lM?=
 =?utf-8?B?SGs4c2JWZ2dHSFdOUllDaGIyLzM2RkNXQTc1NUthWE16b1JBY1VCRngwdEEy?=
 =?utf-8?B?LzJLNEgwcjlGUFpNNXhxN2c2eVBVclRqZTJvRlQ5V1lVb1hScUtPNDBNUXpV?=
 =?utf-8?B?aUtmclkrc3JsRW9zUWIvbmN6OWF1Wk5QR3RLdTl2MUk5ZU5ObElFS0w3T1VD?=
 =?utf-8?B?WmhLNFptTE5ZU3NEaGhyWGhLenlOWjZyRktBZUI2Y09DSEU0S3pmN05WTkJR?=
 =?utf-8?B?T2dvUWsrbGFZaE1jQnQzVmRnMTJpVFZORVh4OU9pS3prUWJYMENqNUM3MkRI?=
 =?utf-8?B?R2lxVHNhT1VwUzlvN0IrMGtWRjJpVkloa3NKSC9tSVB2ODlpdHowQStOM0Zi?=
 =?utf-8?B?VDVsSmlKdGdYRlVyYTFmU0FzN1dYNzJkKzZpb2RHMUt5VVJRWkFxdk9XWEpq?=
 =?utf-8?B?ZUcxR08rU1Rqem9wUnB6MVBsOVZqUWZ3OW9obkhEcjlEVmxMQXFyUT09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c30c2b67-c3a0-4aff-cea3-08de51c350d7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4558.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 10:14:05.4073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vHjcdVup18TEEuo+A5TGukhWmI/MFR/al9Vt0hmlHyYbrP/MuoyObkwHv6ztZF0x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFB6CE6916B
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 1/12/2026 4:30 PM, Krzysztof Kozlowski wrote:
>> ---
>> base-commit: f10c325a345fef0a688a2bcdfab1540d1c924148
>> change-id: 20251222-axiado-ax3000-add-emmc-host-driver-support-2cc84a8f889a
>> prerequisite-change-id: 20260108-axiado-ax3000-add-emmc-phy-driver-support-d61aead8f622:v1
>> prerequisite-patch-id: 03617f4dadb7ed33653d1e0b3c03e732ed4948c5
>> prerequisite-patch-id: 454a64fb94f3c1b6cf6fb7fbfce97f706933b7e3
>> prerequisite-patch-id: 7961935b88d6c3056b55b4058c1ba878aa00490c
>> prerequisite-patch-id: f87b65e3c93f8f1edf2305784ea3f81a04c4ad58
> 
> Huh, why and how?
> 
> It's impossible to apply this.
> 
> Best regards,
> Krzysztof

Thanks. Those prerequisite lines were included from b4 after adding the deps:
change-id: 20260108-axiado-ax3000-add-emmc-phy-driver-support-d61aead8f622:v1
base-commit: v6.19-rc4
I'll remove them.

Best regards,
TH

