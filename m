Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7ED9A1F55
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2024 12:03:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XTk1W5qxvz3cLg
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2024 21:03:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c000::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729159404;
	cv=pass; b=E/qSbR6PNQY3cH3B1xAnn5aGTuqsA4t7N0KWj2h1WH+H2QeZQL4oHlJUGpxtkXqUNhBOCaohqDM9cfrfWg2exlaWp6EoZOYfEd9lgYINRv1pdGZVA+1WFg91d4es/azIXr4SqVD10k7CBnQmMau30mguGvYjTs5EokUSanhGhEKSpEudiXyK4uwBzk6cgIBDHcmVgohbl4cqnk/b7n61/5UhJxTtGAENeS5LlrfUP+MFm4qDbDDI9up4evgXm4KZ9KL2jYQQEU/UkJ3ioLGlxEug+DKuQjOrxCYPCQzNxTa2CM0Y95RbTCAgp2Bu11QFZ1YeDnhf3LNPj963sp7cTA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729159404; c=relaxed/relaxed;
	bh=WldjMlLYp06/mB1HIo0fB3PKDfut6ZTw5dXOSiPaaaQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lLgNzBk8GFHWBFYAJBidm+7Qfq7AmVnXD2xXUyTtFHJaR4a7lBtVzYTwlHJcn/zUZsnQmlHaaY3wqJRHW060GIOB+1Y2Y6IMZiBiaIQZzhc439fMrbirvv+atmfLu/JiDI3uSmKC8kzqilLUXAD9vhrHPoTMlJsIgud/S2du0k9JR5kEdUYCGjDGr8Yb+NqXZyadX3LQYTuFDgjFBpo98+mQT+1/u8YXUyufFnl+LqUYAuV87srCtT7v9dJ7ceLYtvspt2MiYsXr8u/HgA1I+F0JvCVA/YTrwODCH7VmYaATMph30UP0tsZN1sQz/IN0fI8VXzReNLwKWJPUINPlNQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com; dkim=fail header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=S7rxglX1 reason="key not found in DNS"; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c000::3; helo=sj2pr03cu002.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org) smtp.mailfrom=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=S7rxglX1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:c000::3; helo=sj2pr03cu002.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from SJ2PR03CU002.outbound.protection.outlook.com (mail-westusazlp170130003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c000::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XTk1R2vWNz3bcP;
	Thu, 17 Oct 2024 21:03:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YBU3L8WBI+l3kBdnJhlcbCnS9ZuytAtgEbWztgE5LUxzYtrEmhaXlm/ZR6NBtOkJBalPGZ8Sz+CM30/Q9I40fWFM5O0ACwx3bYwvjpcE7cBwsQgmIwqCx//zktSUYyBVt2Id4Ca6zPDTxzIf+vav7Yax9xZlvXAkeNYsgHW9q/FwpG5EGKDwIY8dhNRHlxIhzOEgnPjIpIeCxqzSoWX5pLA9BZRSTkpEM2fePOto8HdboCsf9LmdgJFgDnVf83R5L/TN4f25fdZy0o6zvfxpKD21+dVl9W4CvViirQlNXRq7prhSBQ9gbLR6J9sMfhD6LbfX1CBjn22t7r9Z2dUAeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WldjMlLYp06/mB1HIo0fB3PKDfut6ZTw5dXOSiPaaaQ=;
 b=mVeUgK2TwQRhtY3eipochHfmMhwsLVa+XyN4TPTFlLU6L705kdAPCUtd07UaHM4OGEnThU24ycS3g2eQyJk/R+9DuUnf6C1/zVEmzGNFscam5ifsGX+pGJO/qEwpMFnHda9wjnfUWqjE+Qx75ZFu8gnvMs0eF9N85/LbggZ7ChsFfizLMots0LGKnWHSnPVljfmZMIPphLP4susNk9uTfvORuVgKBO4dU6NnBEdGXxC27kzcyaccWPTKbkZ43fCNLbGSUBuNTfW3XGFLbVC6TrpRQa8W+AdZBU0OQp/5eaN30v4lafy8XJj6Yw08cmVYNIndfWnyMetsKXpz+ej5AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WldjMlLYp06/mB1HIo0fB3PKDfut6ZTw5dXOSiPaaaQ=;
 b=S7rxglX1oA4lPS9RKDVgrS1irNpZjYWo6gVIXMFKy2i9ECCm2iCUA5cSPQ3i5P9TTtRImWWMhw0pFcShcUrHHQ2x/c3ZqPYXJtUgYXcnKLh2iqV8Zru3hDul7myRtfm1Jg2ChNNrXrRUNcSQQnIjg7Chj7peyNI9SwtBomSLutM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 SA1PR01MB7261.prod.exchangelabs.com (2603:10b6:806:1f0::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.34; Thu, 17 Oct 2024 10:02:52 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7982.033; Thu, 17 Oct 2024
 10:02:52 +0000
Message-ID: <b16b82d7-60e1-428d-bc7a-8a236ebb98ca@amperemail.onmicrosoft.com>
Date: Thu, 17 Oct 2024 17:02:41 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: aspeed: Add device tree for Ampere's Mt.
 Jefferson BMC
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Chanh Nguyen <chanh@os.amperecomputing.com>
References: <20241014105031.1963079-1-chanh@os.amperecomputing.com>
 <172891445289.1127319.4114892374425336022.robh@kernel.org>
 <b5919d904c9f06a618a54d49bc895c3081a511e4.camel@codeconstruct.com.au>
 <e8e31fb4-4a9f-4ea9-be4d-9ba29d824cc5@amperemail.onmicrosoft.com>
 <7555c528c90e6151f54d0e17c278527f95fac184.camel@codeconstruct.com.au>
 <c42be4ea-9902-4fac-8b1e-afc38fe04bad@amperemail.onmicrosoft.com>
 <f833ef3b873d0e71581dd138f046b19fa3fdeaf2.camel@codeconstruct.com.au>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <f833ef3b873d0e71581dd138f046b19fa3fdeaf2.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|SA1PR01MB7261:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fa203fb-cec4-4079-afc0-08dcee92dd0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?S21RakdmbVZabEdxem1kWGlPSlZwNkRNb3RRa3BXWlo0WHNuL3p4bG9VSUxn?=
 =?utf-8?B?MUM3ZWdSdUhKMndnOHdBQnlQZUlZQlpsc1kyVXZRWC9UdTZ2QnFFMWxnUDlQ?=
 =?utf-8?B?dFEzM3FqdUZ6MEVYcHN6UVQ0N2FXTGZJYlN4UXhENnE5RzgvQS9HSmNibjhV?=
 =?utf-8?B?NmV1c0ZUbXVCTTcvQUJOMTR3cUk2amwyMGhMcW0ybzVNTnhuMGJTYXpUTHNE?=
 =?utf-8?B?SXE1Wm9QdkczYWNZODdoakFRTjVwYWZHeEpKY3BJS2hYbnFlK1laalZXTjky?=
 =?utf-8?B?bUpvTGxoOHVrVmpwMXlHcGpDMXN5UGhmd2g3TTluM09UeU5jK3pYZE5XVWwy?=
 =?utf-8?B?T1lockRjZXh2RVVJN3d2Q3NJWDkvWUQrUDl4NXRMV1RmRzNMK0hhT2Y2cDJh?=
 =?utf-8?B?c3B4TkNZY2VhNUFYNlVKRHZQRmRudVZoT25oa3UxK29IRGhsYVFKRUFJOVdG?=
 =?utf-8?B?L2M1UmgyUEtHeHVCdDZJclJpSExpc2VJV1B2SlpYMWo0bE80TWllM1ZqZnZG?=
 =?utf-8?B?M1Yvb1VFWnJ6TWt6aXdmdlRIVU1TbDRrS09WZkE2eEF5ME53OTZteDgyRDdz?=
 =?utf-8?B?VGhwZ2lkSWcrcmxIWnFkVkNwZVlIWVRReGU5RmFIUWFhK0djMnlYdUJ6WkVj?=
 =?utf-8?B?UlNLZXhIUmN2ek1Pd2VkclZxUE1EbFVpNDdERmVGNHlJK3RnZVVFbTZiM29Y?=
 =?utf-8?B?L3U0anoxQVVCam5IMFRWZDJSL25jL0h3SkJoVUpjQVFsZVZtUzVJT3Nubm5U?=
 =?utf-8?B?T1BqaTBURlFhdnArQzZFdGdSSDZCVHlqK3d6a3NvN3RPY2hEQkZFcXljQ2RB?=
 =?utf-8?B?UTNhZzNKY0VqcEQ3eVkwUWdzNVVrcE9wdUZSbnZyV2NqaUNsczl1TlRPQTNy?=
 =?utf-8?B?MXZ0MFU5dmtBS0RXSUJNakdCV202bWVHTWJKbzVsMzNBR0c4T3h5MjBSSXMr?=
 =?utf-8?B?TWFBRTBIam16TG9NRWNnb25rTHgreTljakdiVG5IN21venRSMytxMVBtY3h6?=
 =?utf-8?B?MEsvK0xYR0xrelZXcjh2eFFjanFwK3VndEJYd3JlWUhTWklUVVBMdGw3U2Nh?=
 =?utf-8?B?SmpZZWRwS3JvNEl3aTBkaGRQdFB0aCtpTzNHWVU3UmNiZFBpOFBqUUlqeEhu?=
 =?utf-8?B?UmhoWGRLN3ZCSUZnMEYzRkdEcXBqZXJKU29YRm1TcnIwcCthOWNWcGg4Y0ZH?=
 =?utf-8?B?Ym9jTkREOCtJb1pLbzdWeEFiZXg4UGwzTE9ETGFyaFloNXF1VWI1cnNnZ0dW?=
 =?utf-8?B?UExjckRCSW5uZ1ErU29Ic3hqUGZMeS9xSmpYZ1QvZzJwZU1WU0hFZ1hBaDBJ?=
 =?utf-8?B?K1FabGtOZzFsa01uKy9SY0o3QU8xeEF3djBUcGVCVk9SVFI5eG9iZTFUNXdj?=
 =?utf-8?B?K3pCcTdSTy8rTVhvRkRJYUxvVkdPdytQK1VjdE1JY1BkSmwrR2dRaGxPdU9W?=
 =?utf-8?B?dHlTQ2E5WGs0bWtxTjNDSUpIZWdtTm1nYXBjUk5QWXV3cFRRMDI2eWVYRjNJ?=
 =?utf-8?B?WDZIUlFVTnNJOFB4dEdoWHZ2cklsV2ZOeFczT0gvajhMZXJydHlLSVhVS1Ix?=
 =?utf-8?B?NEp3ZmRDUjNXY2xleHZBMTFoZXQ0TEk5Mmk4ZmJ0OW1TbDUwWXRmeVdTUVlp?=
 =?utf-8?B?cEhzbmdObVVDSXp3cEdJc21MWkRKU0tCWXlTUHR3UUVhd3lBTVROMjIrSnFi?=
 =?utf-8?B?bmVtaDlaRHdXTUlRdVZoUnI4dVRLcHVHbzduUzVTcUM2MWZMNm5xdzZOZXIw?=
 =?utf-8?Q?hfD42DQJ8TuULF7IHM+4Z4aN0GhWFqUKP2vcw/n?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?ZWxaTmpycGcrcFhSTVc2TE05SE8yUWx6S2luclVTMUYyVTJkWDc3VEhEZXJp?=
 =?utf-8?B?UUZPVitaUXpsdHdBQThJZTVJaS9NWm1ONEdNUzZEbnk3TytoMU04MFdLU0Ja?=
 =?utf-8?B?MExseUNMSThnRU1BRmVSbkhqZ0pYQ05iV2JQTFZHUTlSL25udU5hR1BSOWFq?=
 =?utf-8?B?UmRkME1hMWhnVTFubWNmMXk1TDRvdnM3bVc0ellQV2VkcWN2a3ZHQVFYMVFL?=
 =?utf-8?B?dm9EZHRvcmxxRnFaV1FCK2hOelMwTWE2ZTJRcllJeUZ0UzUvQTVVQVVaeDZv?=
 =?utf-8?B?M1EvM2dDeS9EaVJsZnBQUGYrdGlRcWRlNHhNWkJ5allqY3hjVWFCVDlDbTJV?=
 =?utf-8?B?RXNSWThBRjUydGVqVDVZdi94RnEwU2JJVDM2NUJ0T05MMHE4cUxCK1FVMXEv?=
 =?utf-8?B?YnMvWGYvQkZTVE96bVN3Q3Q2L0IxYWVCaWVmd3Z3Q3B1M3B4OEdxOXJma2Ro?=
 =?utf-8?B?bjltNFR2QUF5dXY1MStoSi9uZVVlazJkV0RrOUpuZzdWZTk5ZTVUMlhNdXAx?=
 =?utf-8?B?ZkZ4VjMyQWVxVGUxa0c3dkRESlRUYmlsbVA5aE41bVhZMUtBaXR0YmRsYWtD?=
 =?utf-8?B?anl5OVRGNVB3a1Z6YVNUZUs0N3ZuUGxYalVFclZXamhYT2Z1QnZyaUVYV1lY?=
 =?utf-8?B?TmpjUCtkdjc1Y3IvUEUxRDJ5SU5FSVRtaHU3cS9UblF0VDBCL2dvdHl6SUhs?=
 =?utf-8?B?L29MWFEwUFAxUXFrTjBPNVAyYmI1K3FuMWtlUmFqcC9NWktiTy91b3lFQXZC?=
 =?utf-8?B?YkpsczBoRWtsZXVHQUM5QVlyaFZiQjVFQ0UxbHhjcjVmNlk2V1lGRm11Z3Bh?=
 =?utf-8?B?NitjUjJJeW9Nc2t6bnFIMlFvY1I5SEpkMTNOSk0zY1ZZbGpFaFl1ZkN4eFl4?=
 =?utf-8?B?SU1QeGxUdmttRVdRTnJIRzkxZGQ5UC85c3orOFFqakE0bzlCMFhBMDJKaytT?=
 =?utf-8?B?SjdZbDhHdkM0TEdUeVkwTVcxdzdtNUlLaG1vRGVvOW9zMWU0UnBrbSszaWRr?=
 =?utf-8?B?dEZjSzJGZFNDY1VNZkZSZDNrck4zN2haL2JDVlF3T2JHS2cwaGNmVVZsTW9O?=
 =?utf-8?B?K1k1eXA1WlVDdGNtQVRuSndEZDBjcWhHMDAzeHZ4S1VkODRNV1Nheng5dXpO?=
 =?utf-8?B?Q2YwQmpqZkNFNmU2cyt6V2V3SkFweXphZVZaVjVrQ21uVGMxQ0xYeGhlcSsr?=
 =?utf-8?B?V0ZEeW1nWTdNeENvUnZEczFSQTV1K2NnL1E0cjZrYWZLbXY1Tm5za1IwZ1NZ?=
 =?utf-8?B?a1ZmOU9CK1RwVnFNRTkwSFNyTmF3a3lWbnRhSGFWeDFNdXJGK0F1ZzlsQW5I?=
 =?utf-8?B?dTNYQmFhUWZvZkpnMGxMOU42SmtOMWh0R1BPUGVEdHVUZWpqb3N4Mi95MjNh?=
 =?utf-8?B?dzEzaEN2bkNsek5RTjZXaDdFNVdEN1Iyc21iL25ENXlONnk1TXZQZkVhNEVr?=
 =?utf-8?B?bzk4cnBOUHNxVEpzV20rRzNRNHM5ZXVIeFA3MCt4bm0vL1VlMXRJTDRwLytP?=
 =?utf-8?B?RDhmeXhidC9JS1lRT2FGRUY0dDE3bnlwdE9qVVordXVlakZUTC9ReWRZYUVp?=
 =?utf-8?B?RDFMQUErWnlmSkJETEVHcDZLZFRqd0w4dmNFeFRjZ3E1V0RVdTJQMW5xY0dh?=
 =?utf-8?B?bXFjVmxrSDlkdUpPTXhrODRTaDZtWHRlUU5mbThYMEdSL2dtYTgwcEdwbVBs?=
 =?utf-8?B?VXhHYzdxUVU0QmNpMitTVnZNeERDYy9Db2RaVlRLRGtaZEhTTXJQZksrVUVn?=
 =?utf-8?B?MUJNSlRmdjRpK21jVjUvRENzdGJaTFJBOGVwdUFEd1hSMkpxNXRWT0JTeU1l?=
 =?utf-8?B?WnhyQ3BNOGpQWVdHSjFKQXpXd29hOGJDWDBva2w0U0ZpdW9YMEhzbDRzLzRJ?=
 =?utf-8?B?ekRQZ2RJdEdKNnV4OEMvUERURWsxZEh2MkNJVmUxWmpaWXhhaTFzbU9JNlha?=
 =?utf-8?B?NVVGcnVRQjcwRk1TNW5rQzF2Uy9vMHpJRXhGRllvOUJ4R2NPb2NJdHJvZHJQ?=
 =?utf-8?B?Zm1FSVAyOWk5OWFXV2hSN1dUYVRDTGFXd2c3RjhocStnaGpmTHVGNzh2V3hp?=
 =?utf-8?B?UGRlWDZjRjJLdXpFZUNkQk1JMkhBanRpbGhwS1JpYjNoUEw4R29YZFR6OTRa?=
 =?utf-8?B?eDlJNzJrSnNINXBubEpuNmtCbml2K1VsRXV6c1EwWFo1aWxxckpMcmkxNnFq?=
 =?utf-8?Q?OJULH4ra2qkrzCV0vkrqD3w=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa203fb-cec4-4079-afc0-08dcee92dd0c
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 10:02:52.4906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OsLjFj4A1EnkxNajxOpJ3XjlCRRbHCI+ScErIzNgL5l9kDaXjG2+WIGgp2n4jJOn99MlAiEIrWvx0T+H7NmV9A3uz9Jjjw9zXxq6ONIE5NZcE1paRoYIgSwabvBKvENh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB7261
X-Spam-Status: No, score=0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
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
Cc: "Rob Herring \(Arm\)" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Khanh Pham <khpham@amperecomputing.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Open Source Submission <patches@amperecomputing.com>, linux-arm-kernel@lists.infradead.org, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 17/10/2024 07:08, Andrew Jeffery wrote:
> [EXTERNAL EMAIL NOTICE: This email originated from an external sender. Please be mindful of safe email handling and proprietary information protection practices.]
> 
> 
> Hi Chanh,
> 
> On Wed, 2024-10-16 at 17:26 +0700, Chanh Nguyen wrote:
>>
>> On 16/10/2024 12:07, Andrew Jeffery wrote:
>>> You can also find discussions where other maintainers (Guenter, hwmon
>>> maintainer; Krzysztof, devicetree maintainer) have asked that "pmbus"
>>> not be used as a compatible:
>>>
>>> https://lore.kernel.org/all/f76798ea-6edd-4888-8057-c09aaed88f25@roeck-us.net/
>>>
>>
>> Hi Andrew,
>> I checked the discussion at
>> https://lore.kernel.org/all/f76798ea-6edd-4888-8057-c09aaed88f25@roeck-us.net/
>> . It seems the maintainers don't want to use the "pmbus" compatible for
>> specific devices. The maintaners require an explicitly compatible from
>> device list in drivers/hwmon/pmbus/pmbus.c .
>>
> 
> There are two problems:
> 
> 1. Describing your _hardware_ (not drivers) in the devicetree
> 2. Binding a driver to your device
> 
> You ultimately care about both 1 and 2 as you want Linux to do
> something useful with the device, but for the purpose of this patch
> adding the devicetree, 1 is what matters and 2 is not really a part of
> the considerations.
> 
> What needs to be the case is that the devicetree describes the device
> via an appropriate compatible string for the device (manufacturer and
> part number). Prior to that, the compatible string for the device needs
> to be documented in a devicetree binding. This may be the trivial-
> devices binding if there are no extra properties that need to be
> described, or you may need to write your own binding document for the
> device if it's more complex and one doesn't yet exist.
> 
> So whatever is in pmbus.c needs to be fixed later on if your device is
> not yet supported by it, but that's a separate problem (2) to the
> problem you have here (1).
> 
> Who is the manufacturer and what is the part number?
> 
> 
> Andrew

Thank Andrew for your explanation! I'm so happy to receive comments from 
you.

I'll remove the PSU node with "pmbus" compatible in the patch v2. We'll 
discuss more to have a suitable PSU node later.

I'm preparing the patch v2. Summary, I need to update as the below list.
1. Add Mt. Jefferson board compatible binding as Krzysztof pointed.
2. Remove the PSU node with "pmbus" compatible.

If you have any other comments on patch v1 please don't hesitate to 
point out; I'll update that in patch v2.

Regards,
Chanh
