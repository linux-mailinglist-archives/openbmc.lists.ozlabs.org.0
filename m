Return-Path: <openbmc+bounces-1171-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC5CD15986
	for <lists+openbmc@lfdr.de>; Mon, 12 Jan 2026 23:41:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqnRG1NX4z2yFl;
	Tue, 13 Jan 2026 09:41:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.56.100 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768213684;
	cv=pass; b=gbDsIE1JDNW6WQGZH5aRoCFHbBMZIzwxgqLbpxt5JHFiXIbDlLwlRYzguVoCVOPNqZL2ZmAEm+PiJaV4lQpkKUjA1u3w/JgOmace6p518A8DktBCaU2tsjD8ghwfXgBDwX/h3xaa0fVREyohA9DyDmyNdxVsPx6yJzjRpajEQ9RJmEw5YJWuZs4skv4fy7YnYcoSV4L/aX2wYcL7NgNWhyeaj1j1QCy0hsuI7exLfWEOojCb1Eu/ewDj63DwPdkH7kabHZ6I9e/xXN/RNvzCZKJiZuUAE4TJrFwWDuwKGM9TDLwcx0YVREKUD5LZCNP3hqCvqdwtbPfj3ZEpLJSgog==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768213684; c=relaxed/relaxed;
	bh=x+0vFAm2zfkgukYdOmLlsIQIr5+UVTGfM4D2lbTdmac=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kdwWJFUGtNhCOMW6YvHF00T55PpETQUWiGxSm+cLYbBVZJpt1I4NooSKx7ndeFB53TQqtMZvWs7Kxx3vYXbPxnUB0Zz7PkYp5rLh5WjgXZvX4nRUM4t3cR9kJhMzDs1bKiFWRPysOUEMLkm/UV/lYPDc+JGC2CQUKR6k1mbuek7Bu+9yMrtaCWiAEx/2Em5D0qM2aC3BGNhD3cjTGkyX0LvjmHMRvOhJ75kDLsZXHSEvkH7y/DA/b3bWPKefs+H402GrM7jeDwfagEEK2ak6nL9xJyjuWmSk+iu0u6mr07RNPyt43X/1MpH5Cxu8MTcENrcBKvE/Z9If90mnqUL5lQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=l+cMXAx3; dkim-atps=neutral; spf=pass (client-ip=52.101.56.100; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=l+cMXAx3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=52.101.56.100; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org)
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11020100.outbound.protection.outlook.com [52.101.56.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqT9H2pVLz2ynn
	for <openbmc@lists.ozlabs.org>; Mon, 12 Jan 2026 21:28:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=apUTcnfcMbUxrTYhvc+tIG477DyoQRSvVL+deHR3zn0xl64yMw09bedIjOldivvC1qUmBpbbumEUzxjFd3GZytFYHavK5I1Xp67Qgv46OtD29Yfv4Fj4Kt5NTJHsdSmfQullDxQJ0ZkCaTaOSrsFdzGLs6FFEceS6IBcvEqBAv+pXYsrA177kCuTyCn0fChqm8MR2xnhSgXIYS0mqoW+dOjZpQSodVHbHLoeftP0qdreS/PhSkFfpQ4qxfgSulSzValEAKfQdz1pb/qJ9bSWyW5PRf5VF6t3Ke1qfDnOocVf2BKudO/LnKAcFJejcL50zcXqAs+ebR6MxpGJ6IuQaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+0vFAm2zfkgukYdOmLlsIQIr5+UVTGfM4D2lbTdmac=;
 b=FJsOh6RLOESatohlVfNq73xcNxrFSbSfDfZlwi8LzYKO6cDNcTBU3EiMUFJH/KazdxGbO8z5/3t4EmXFg/WdHvXW5OYTNbDhwNlcjrPLqACMS+DAUieZ4HkvyraU7DGgwwN1StXWIAjV/497hKSgwXYOm15qIo91HKcj1VmLKoNXOB8bN3lwM5M/qKe7kksIknK3JSWYV0Iq04VWlrKCB98gzhHoQG7ApYqFfpCxQL35ky7cyZ58hDIzPcrxLi5Fi1ZCImHzeQ2I3/QUCzQLUjS6G5LE4UkNkhgyuZ35w4+a38WwSnmtWA6899NNIqN2HdiT+Hc49GUahZjiKTbRqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+0vFAm2zfkgukYdOmLlsIQIr5+UVTGfM4D2lbTdmac=;
 b=l+cMXAx3Tg3xa/Dm8Msr9rdyFABVEnuc+S3bxxYveZB3DGv6DKFHwTfWXINmPi+wAoMN34p3ts7Qd5CD0meULgdZ2JBZoeeA/8VBOXgrx6y+wh8SGp3gyFTALvprD/5j8Vd3/gPkEHWRlJqmqoI0kZ0v/3RyDxAVIFe3ePR6lKImSsbxkju4WmeVAsB5JsQujMih9tn2Prknh8p7GZOjHVTAPPAH2EwKjfOGfTYDPJTiBRvgMSQ2f//yYhZEuKKaCwur7mQf/r4q7hiX1X87m2QHTkKH4SxLNu4PucCWgZdjtuMqI4meTJST9O6RP9mlaGDHhpXkfxPppGqKygIs3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from PH0PR18MB4558.namprd18.prod.outlook.com (2603:10b6:510:ac::13)
 by LV3PR18MB5722.namprd18.prod.outlook.com (2603:10b6:408:1ac::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 10:27:22 +0000
Received: from PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311]) by PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 10:27:22 +0000
Message-ID: <3a8c3091-f8b3-406c-b4e3-431336b08825@axiado.com>
Date: Mon, 12 Jan 2026 18:27:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: phy: axiado,ax3000-emmc-phy: add Axiado
 eMMC PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: SriNavmani A <srinavmani@axiado.com>,
 Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
References: <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-0-dd43459dbfea@axiado.com>
 <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-1-dd43459dbfea@axiado.com>
 <20260111-camouflaged-shiny-wrasse-796dbd@quoll>
 <041acb02-13de-4efe-a7d0-630390fb2940@kernel.org>
Content-Language: en-US
From: Tzu-Hao Wei <twei@axiado.com>
In-Reply-To: <041acb02-13de-4efe-a7d0-630390fb2940@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0154.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::27) To PH0PR18MB4558.namprd18.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH0PR18MB4558:EE_|LV3PR18MB5722:EE_
X-MS-Office365-Filtering-Correlation-Id: 153207db-eb9f-4956-2f17-08de51c52c0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|42112799006|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Kyt6Tm44UERKcjNBcDMvVnJkYkdvYWNweHJQN1kxN3k2SENRaFcwVzF0WlFM?=
 =?utf-8?B?ZVdqMndON0pCNmlqWnJvZ3NESUs0K0MreG1IemhsSUMvVkxpU1VMTjJMTHVS?=
 =?utf-8?B?eE15bVkxeVVnNFNZNFBMaHpvZkNZaXlJRHFQNkpzY0l4bitYaURzblFPZGUy?=
 =?utf-8?B?T1ozR3RPa2FVTWVhZkVVM0g2UlErU0d3Nzg3OTNvZGRZMVE0akpJRG5NWnpV?=
 =?utf-8?B?ang3MFpVVkJ1KzRKVTdqenYzZzR1U2RyWHVYVW1SdDVkZE44TEhRaENtcm9B?=
 =?utf-8?B?WUc3NWUxLzlWdVU2ekxNNjJVc3IwODBZM3E0dmdab3BvOUZYVjRRU2ZoQkVp?=
 =?utf-8?B?c2hOaUl3T3hKbUVHS3ptbUk4QnRzcmNwVGl5RW14cVlURnFnQmEvOGtZZlZw?=
 =?utf-8?B?NDFDL1BoeWtMdkJjdVNqZGEwTWFpSmFqblo0S1d2alVKNWVoN3VCRE01UWlR?=
 =?utf-8?B?dGpheXppSUpWWWZXQTJjYW4zWURyczk1RVdFRkp5NHYyMTJSTUJYTWJiMlJU?=
 =?utf-8?B?NGhvbS8vUExZREZRbzZOMkVUY1V2djZRZVBOeXk1YjFHemZFdU5XbURta3RI?=
 =?utf-8?B?V3plNGpIcFNpRWRYV2JBMGNEN1YvTkpBYnVjU0xZWlFqYlNpVFlxVkl1Z3Bs?=
 =?utf-8?B?T1lpVDMreTRGa3l6R1doL3YwejRqU1pNSjZOQldVaTlmQVhsZXZ5Qm1LNHZo?=
 =?utf-8?B?RzVWS1U3VDBpVWE2RmVWL25Uanc0MTdGd2hEN3Bkd3I3Q2JBS0RMdEpRY0oz?=
 =?utf-8?B?WEJObkNtYUVKNDdrTmNzaVN5Z0w1U0QzMk5QSEl0bmpuMFJNdGdIZmZHY0Nz?=
 =?utf-8?B?TFdjQm5TRnAwUVVXWXBycGJqaHRveGhkOTlvTTJ4RE9Pd0kzUEtPelVFUVN2?=
 =?utf-8?B?TUV1WVRRU3dxUTNIUy9wbUprZmUvL1lCZkMrbGQ0enpkNHJURlpVb1d1MXpP?=
 =?utf-8?B?RnhITUJjL2dWdVJDajFabUNxQ3NpU3dBTm9GRWZQSzdkcExQNk1SVWo0MjBD?=
 =?utf-8?B?TmRwTjlqcmJFY001YWQ5b0p5Y1hzNUZuM1ErbnZ2MmxURU1CM2NKUXdoQWYy?=
 =?utf-8?B?RUZOMkFDaTNndnllZzExcTFrNEl2QXEwM3Q5a0s1dWpCc25QLzFPL2FXa2k5?=
 =?utf-8?B?OVdQSWp3ZU01ZHlnS1pSZnN0ZlZWQmgxanNmMnVRZGVxandROGlKR2cxaEpl?=
 =?utf-8?B?emZaUXBMbGd5ZzJuQk8ra3YzVFhWUzZLUWlDZ0FQeGN3ZWw4SCtQNEVaaUV4?=
 =?utf-8?B?ZHgwM3dUL2J2UUVNRWtlU2JKR1l2ZzU2eEJFQzIzYy9WOG1sTGlqZHFSMVp4?=
 =?utf-8?B?U0pYREl1TWkrVzNVWTgvRElQdU9LTXVxQ3JmUDk4aFpSdXg1dUp4ZGtESDdy?=
 =?utf-8?B?TGR3Z3poaDlIbEFSN1Fka0lHVzZsUDhGaVhoTnN3L1ZLN2JSbEZteU5vZi9Q?=
 =?utf-8?B?cXRSSm4zZm1TQ0lFUGhwZ2xYeEdNM2QxRkNSQnNzRTVLVkdlMkFkQ21tSEY0?=
 =?utf-8?B?em5jYVBlSEE5ZlFyWTJLTDY5bTQ0QnpVRkNVK0U0WFB1QzYvbFdQVEcyRCtI?=
 =?utf-8?B?QlczNlluaWFsa05oa2gxWWM3b3k0OWRzU2YzRHdYSnppeFhIZFZQNjJIOUls?=
 =?utf-8?B?L2sySlJpQUx2VEpJdENnTy9oWWNRS3VXRTl2em9Mb0QrNG1MVjBxd0pqdCtQ?=
 =?utf-8?B?T0dtQVdkc1dvYjFkT1E5d3oyOUVMa0xDUERNVjJSSGVhZUdKL3pNck5tTVBB?=
 =?utf-8?B?RkVwWi8rUlpFeXdaTTZ4My9tNlJDdmFVZlIycEZvSXA2NFp5NjB5M0JLOUdp?=
 =?utf-8?B?dUg5Tlg0T2RHeWltaFg1aEJRZUUrakVhVEVZZlJPdkxuN2Y3dVVDZi9yTFJs?=
 =?utf-8?B?aHFEcFJFMjdxcE9JN1grWG4xMGNJakErcGNvYW5oSTB1Rnp1T1oveVNLaWdu?=
 =?utf-8?Q?SnBsuqk7w8tkjcnF2j1K+NxoevYIm3Gu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB4558.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(42112799006)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWc4dHZUQmlSMkxTTWdVUloycjl3eC83a25LRVU4SnRUMmVydkVrYk8yYllv?=
 =?utf-8?B?MTA5WXpWYWFVSHcyQ3ZDZFFOWGNHMzNhR0NadHhGRGJUT2VvNzV6dnJHQUZy?=
 =?utf-8?B?Z2pFVkFLb25nVGtCcm53aGh1dHNMMzdUeFUzcW1yeEVNeHlwRW8xUEF5ajdP?=
 =?utf-8?B?S092YzhEZlVGTjBkVHJCK2tvcm1OTDQrTWVrUmFjanVkQnhKU3lHNnRtZm5t?=
 =?utf-8?B?N2F2VksrL1lGb1lMUWxhMHRJRWFDVU5ueTJPYWd3eEVURVoxeDNIUE5Oc1Bm?=
 =?utf-8?B?c3FYWW8xQVZqV1JXSXZuWFVUY2hIWmNyQ2t6d3NVOVVXUHgrQWE0eXBZSFgv?=
 =?utf-8?B?bDRyblRKR25iQ3NVZ1pseWsybVhFTEQrZGZLZnZjVW1mOHJUSHRSNTNWMEVY?=
 =?utf-8?B?TWxFVnA4ZkhqeGxhWk92S29CbHdWQ2FDWm05aExQQkdaVm9qQW9telhIRXRq?=
 =?utf-8?B?WXZxU2RUTlkyVDZDQ1E1UTNneTVGQUZUS1BkS2dpVVZ5Z01XZVJMSnFSQ3Uv?=
 =?utf-8?B?L1R5MXl6eXR3OUNmYVovN2NHQ2oySDNFUTJ5aVFXYVo2WXlXbWhkamo5Wklx?=
 =?utf-8?B?WmhienZMTTN6WHBxZmpLeFczTEJ2TlBQUENmdVdVVW5OLzlua2MxdzljOEFZ?=
 =?utf-8?B?T29XaVJJR2lJZmJITlN3eVMxMmMwUWU3ZnJoODc4RXo3enFNUTJwNHZUam9S?=
 =?utf-8?B?Tzg4MVY0U0NvdnFnZXVKMXhoaW5uWG8wRXRMOXRza1FoaGFlSXJ5YUNBZG9q?=
 =?utf-8?B?RkZGZTFTYlpkYlg4RndXaUhpaXYwb0hqOWVkY3huNFkzREd2RHdmSWQvQ3A2?=
 =?utf-8?B?S0d0Z2F6V2FVSDZldkRUV2Rra3hacmJpM2d5TTRzT3hIWllSbVB5UUN1Njk3?=
 =?utf-8?B?MkFlTGpLbGMrdDgvNnlRMWdrUjBvYmRwUGlOa3h3TGlMOHV3NFFvMWpRZ0d4?=
 =?utf-8?B?RDZURnF0M1pvaGxNWCt5STV6MnlHTWdxbzB6NlVKM08xTkxodEhYT3Y0Nmp3?=
 =?utf-8?B?dE05cmRYQ3B2Q01OOE5RTnlCYmNwOWVWS2pCQTEvTW1oUUVZdi91ZWNIOWMy?=
 =?utf-8?B?MW5pZnN4bUJOZ3BPSFJMWEpYQ0U3T2pPV0hsc0g0RkdLbjRhS2RaOFlnQ2Jp?=
 =?utf-8?B?dis0UFl6amlZSzAvWG9EcEZoMGUzYVp2UHA0ek9PQ0hZTlRZTTZlTklCeWVx?=
 =?utf-8?B?VEZSYmNoQnoxcGhLM09tRjduZ3JJSEZvaXg4aWdYWVhOK1V5T0JBcjVQN0pp?=
 =?utf-8?B?ZUlJRUdmbkVuWlJQWXpRZy9TM3ZKbGJacmt1SGxJeGh2eWV1ZVViOHFIaDVU?=
 =?utf-8?B?NjM3dEp0V0RZS3pEK3VaM1V3b0FHQkpyVTUwREkwS2pJUU5FZWRqb29QOHNL?=
 =?utf-8?B?R2VhZm5HUXBYZTBMM3FUMG82WFJVdE53WnVnWW9hNi9VeE5sWHJYb3BEZmI4?=
 =?utf-8?B?ZS8rSjRJZVFILzdodGNCblcwRWQ3c29CQUsyK1pyeGxEbEFONnNreVMzTSsw?=
 =?utf-8?B?cWczR3FiL3pZMHc4STBOR0g4WDdtZU1uRWlRUnovVFpNeldOdkYzeUZpSlVB?=
 =?utf-8?B?aU93eGx1dVNQbElaSDJhVTEyTzdSbUFpaUc5U2J4N3dvM1VuZzVrSzhqaXR4?=
 =?utf-8?B?NjErcndxTzBQVlVTQVhGWkxQbWFnMEUxTnlpbVVqWFRpZzJXanVHZ2dnWUd5?=
 =?utf-8?B?d1dVZXp3QnpCMTBXRkZQSUdtd1JJN2NKVm5xZlpKR3dOaG9JTnFLWUhuTURH?=
 =?utf-8?B?K2FYY3oycXJUNmJlbk5SeHArZ3ZvZ1FtN2FiVW1jTWU5ODhRdmVkcXFnbjhF?=
 =?utf-8?B?Z1hXcFM1bWRnTEJTWTROcTNUK1paQkJScjNVQkxDZE04Nm5xZVo2Qjhkekpo?=
 =?utf-8?B?QlB6bUFvR2tPQzd5MmdwQnR3VlM1NFM5VEc4K0IxR3E3NVBadlo0S3o4WW4w?=
 =?utf-8?B?T0k0Sk1rNU5NdFpBQzB2c3hzYUZ2ZU1lTUNpeE1wVnp1RkpUOWpOR3J2bnBo?=
 =?utf-8?B?ditnWVdGZGNMUVdUdVl4b29IYy9yU0ZVTS9aKy9wSG9rM2xCRDhPVE1TdWtn?=
 =?utf-8?B?Nk5EUkh3MVJJK3dLRmp4UHNXOEpHc2c0TEM1SmlLMjZOOE1iRXpHRzhXNjZ2?=
 =?utf-8?B?LzZIMVVHRUJ6dllZVWJienEveURvOWgxTDh5VkJPbVltZEwrMy9yR3VJZ3ZS?=
 =?utf-8?B?b29EQ1V3MjlxZkd0eVNKSnh3aVVvdU5GeXp3MkNlTDI3Vi81OG1EOEUzaXZR?=
 =?utf-8?B?dnFYcmV0djdFWDZ1R01HZUdsTkkrVGpscnRHbmMvaEk5dnZZbDZoNlc5aGJJ?=
 =?utf-8?B?WWsvQ0ZGV2YyV05OVE5TZ2xSbVkyQ0xXK0xNckp2QnR5UUkrem9idz09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 153207db-eb9f-4956-2f17-08de51c52c0d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4558.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 10:27:22.6119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xcCGTmRcPxasZgFU6T+t55Uf5Hr6A3XErzKFrcfmkls7wTZx+Kl9+2azUGTbAJBI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR18MB5722
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 1/12/2026 4:34 PM, Krzysztof Kozlowski wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
>> You did not bother to test your code...
> 
> And this is not even v1, but v2 and you completely ignored that part.
> 
> So did you implement any previous feedback?
> 
> Best regards,
> Krzysztof

Sorry for the confusion.

All of your previous feedback was implemented. I missed one YAML change
when preparing the resend, which made it look like the feedback was
ignored.

My original intent was:
- resend the eMMC host series as v2 with the PHY driver removed, and
- submit the eMMC PHY as a separate v1 thread.

However, due to the mistake above, this was not communicated clearly and
the versioning caused confusion.

I understand this is frustrating. I will resend with correct versioning,
explicitly list the addressed feedback, and include clear testing details
to avoid any ambiguity.

Thanks for your patience.

Best regards,
TH

