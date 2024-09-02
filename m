Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB15A967D79
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2024 03:46:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wxs6Y2Q15z3cNP
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2024 11:46:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::722" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725241564;
	cv=pass; b=g4a3JWdD0kw6cT3uYTEvcaxOMTdvGpYmh6gr1FEyGetMYT86tYxeW7KlzSBM3e4ZKndhWWUOg+Tf2ESUONyaOIHp5QBJCQ7C0y+98kD58kx/Go7WDV+XnowIj/mPZLMT3Hsfl5Wivaxa7fzOEYGIULHGhGR/909epZfnlw3E9lF5LXjihmjCbYfo+Xp233C3gpMpcwdlxfDPuT8gZuWVA6NShFLk1Fiq+Hzw8q4xDjuCx45pT4nHjgwfuSqS9csyE3zx57ntdMO5OQZtET52OofIf1SoVg4Mo4UFJm34d7xgJ4jxknSp8y5OBPAgV5MqPwbDlxdEW0BTNS3IMbraZA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725241564; c=relaxed/relaxed;
	bh=yUGOZoIiEupq/QP9xh7TQ5Q1+1P7LIPsSvHTZkNHGK4=;
	h=ARC-Message-Signature:ARC-Authentication-Results:DKIM-Signature:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:
	 Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-C
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=2a01:111:f400:feae::722; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::722; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20722.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::722])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wxs6271F2z2xHl;
	Mon,  2 Sep 2024 11:45:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vWsqxAhF9MM8XhIbK40YAOZGqgT6+eYLqEmSLFp/iKOFlyI4K1oU95FRkyNle8OWf/yX89GhpHIMbAbLohcZoE/veAFJDy4wo0itybCiv6b2WmoHm6SE1yOWVa8LB5Y7gHYPsiOLVziAjyjYlEcHtVNsdPP1SAg6mOMJLwvgGzOTl31ty5KvZcI/+PwK2chYZnfLjAQDiNvDGBTEOqroUgeI38u4VP598sCv8+p1cIelHGVPT33TqVoFbPsmMvulebqp1U7W2BgiW0UD7NIRZbVU5kDiCusSHgcqromgAdN0uzqax9oGsNyzkIeC4iL/dyucyGqakpu3A3vQHxkq5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUGOZoIiEupq/QP9xh7TQ5Q1+1P7LIPsSvHTZkNHGK4=;
 b=OUg4aLIQ6uoWDgyXmnzL3FArvX2gzc44iw/dOO115pmecdB7DVRyAMbHnMoh3QgrM+XHgJ3B7Rr+Z8bHdV+kSZHao6eMT0Atu76PYCMsfqynvNhU54UCi9xvO6/kQWAhGogOcnXoawCjPiDhgK0xm9lgvsdN7t0MJ6s6moeta7bJHlbY/e+3A7V/skHyAvls4k/sEAb5eABkNMDzpnbvueShOrdYdOygc8aLUJ4dqwI5jewIrCByTUwnQanoWd3AGwhJJecOQyFBJvBxJkvxszAlmZb9azGf+AibjIRMEptFU2EQ9EkL0zYWpq1zeEHXwYn8nqS9k8ha51XkU6AgNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUGOZoIiEupq/QP9xh7TQ5Q1+1P7LIPsSvHTZkNHGK4=;
 b=FUPA+wlJPJa2IQV5bKfc40E5E3WSxX6E8CNzUIIsYBTICsEVXfGum9fDvgCoY/O3xacixJOGbF4aC2WwSY6+Cf4BWn/8fU314IEJUIn+0OBR8MUp0xufaZNyTasD4VIYvGay2N0l0IesGUW/YZbAKFGNyFBJn0iH4OYXYinnZqHrQ5wWc+fsHvvS+WMyBJxsjxFWHo9WM4ViRUGakya0JIuxGMyPlRFCixXe4MzRVi/ApsGA1y5y0WMyP6hpmQH8/LD27QcBBdg56iGpxCja6FGWtkY5EB8EbjOHXXTJJ2LLSuv5CHmEdGH+qw1UbV5hhpWh448eG5My1V3lY70kKA==
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com (2603:1096:400:45f::6)
 by TYZPR06MB5484.apcprd06.prod.outlook.com (2603:1096:400:289::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Mon, 2 Sep
 2024 01:44:55 +0000
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::72b8:dce5:355b:e84b]) by TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::72b8:dce5:355b:e84b%4]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 01:44:55 +0000
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"eajames@linux.ibm.com" <eajames@linux.ibm.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au"
	<andrew@aj.id.au>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"pmenzel@molgen.mpg.de" <pmenzel@molgen.mpg.de>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>
Subject: RE: [PATCH v6 1/2] dt-bindings: media: convert aspeed-video.txt to
 dt-schema
Thread-Topic: [PATCH v6 1/2] dt-bindings: media: convert aspeed-video.txt to
 dt-schema
Thread-Index: AQHa+ejb4LDf1KKIuUSSZ8BsLCYoHbJDruOQ
Date: Mon, 2 Sep 2024 01:44:55 +0000
Message-ID:  <TYZPR06MB65685EF88A548AEC26A54EC8F1922@TYZPR06MB6568.apcprd06.prod.outlook.com>
References: <20240829064508.3706672-1-jammy_huang@aspeedtech.com>
 <20240829064508.3706672-2-jammy_huang@aspeedtech.com>
 <8ce757a9-ea4c-4dd2-8aaa-e04f21eb3f63@kernel.org>
In-Reply-To: <8ce757a9-ea4c-4dd2-8aaa-e04f21eb3f63@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6568:EE_|TYZPR06MB5484:EE_
x-ms-office365-filtering-correlation-id: 13887bdf-ba3e-4530-1f39-08dccaf0d86d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018|921020;
x-microsoft-antispam-message-info:  =?big5?B?QWJsN2R3N01XV2VwalF3aEtjS05TT1hFNjhCQU52Q2ZkOWtMVDlNVkk0SndlMHQv?=
 =?big5?B?VHdseEwvQWNSUHpXOVYrbzgxYU14M3JYNnVTa2k1eldYNGdxT250eFdrTVI2NVYy?=
 =?big5?B?T0hncGFGVkpYcnlEUkhlc1kxU2k3WUFSbUhMcmdzbGJ0SFRlNUxHYkpnR2xyaks0?=
 =?big5?B?T2VGZlJkcXJLVkJpNjZ4TjRMMGdBcDlSS3ZWNVBhYTZvMEJ0SG05YVl0UVplbGRB?=
 =?big5?B?dmpadGpvSXplemFxNHNIcGJ2dzJmdGV4cVRRUDJIUEdjTzZ0TDFuMGowSHhISEVT?=
 =?big5?B?ZkVIcGFiaUJrOXVQQ1Z3eHgvSkJJVHhLbTJ6VnZQaUJtV1YrL0FZYjlabDllZFA5?=
 =?big5?B?STNMSHB6eVFnRFAvYmJkT0NYbWxMZzJ3QlRxZW9EbWtwWjRhbVRtSzdmSGNycXE4?=
 =?big5?B?RmhRRHFtMjlRc0VMM083SGxDeE9OUGdqczlCdnc4TmQ2d2hnTCs0NXFmUHJhTjkw?=
 =?big5?B?ZlI3SzV6anJTNlpXdmNBQ000MWdyMG1vdUlRU2ozRi9uVkRPNEg4aVhuYWJlVXl3?=
 =?big5?B?VjJXb2owdnd6NW5qRktjOVkwNVlxS3dQQ3Y3d3NiZ3Rjd1d5S25UZWlnU0xsbWFI?=
 =?big5?B?VE1SSG9HdHMwTUFnb0Y2MjBVMWV5dkw1QnNGZDFWbHErcCs0aUk5dTN0bTlrcXo2?=
 =?big5?B?Z3Z6WjlJVjF2NUZMRXV0ekNmd0F2d0UvTHNQSlZmcnVVa1djYkdjMnJrZnlnUGNG?=
 =?big5?B?cm5Xc21UT1ZPL2NYVnV5Q2Rtbm1vWUhvV2NmSDg0TnNZVGdYR0lDTmMreE1IUFAz?=
 =?big5?B?YnhGSGgvWENPZ29nMVNqcWhncm41Y1VBTmRaMVpBM0J5S1d1dnBScHhUUjBhVW9L?=
 =?big5?B?M2hMWXpSajdsVmRjNmI0U0hMb01lV0g4Ty9oM1lwTXRBVHNwSnVnWHRXdksrNnRu?=
 =?big5?B?cVR3K0xHL0dNRkoyZFA3YUE5MEhPZE1zSVRHRE1UNTZtN28rendFQ2xhcEJnRDJ3?=
 =?big5?B?WGhERFcxMG5LU3RENS9tQ2g4cHl1bjEyL3gyT2JGL25OMm9wVThXNUpiWjVmeFMr?=
 =?big5?B?MFRaSXZkR0l0OWJURGFMZmpvR2Z5T1ZVS1NUUVNkZTdZUm16YVdvZ3NXTld3Q2h3?=
 =?big5?B?K1dwckFnTUlGOVNla0ZnczdacmJYTkkvd01CYXNFejA3SGZUYXB3TlpVZURwWi9T?=
 =?big5?B?SlcxRk5Kc05ORVMvaXhNSHVUeUJlbFBaOEkzZFZnSCt0ZkNuY29CVlVWa0lFa21F?=
 =?big5?B?UHRYMFM1UDZNU21qVUJUSnJ5NUNBaVk0bjFJeVpxTTk1MjNGVUxwSDd0Tm1kQ1lX?=
 =?big5?B?U0l4dkRFNTJLSXI2V1NZNnRVNkFaeUN2dzFDdnl0V0xNb0hpbDFWaWpSeEc1NXQ0?=
 =?big5?B?TzlzZVlTN25jSlNtT2o5S1hEb0xDdFRVZUlUcVB0ZldIVFVwTFNSbVNaTGdLNWEr?=
 =?big5?B?anV1SVFaUStFZGhhaU9laGIrb0taSTNPQW50dEJHelRFcW56MWJrS1FVNWx1cEFB?=
 =?big5?B?SDhrbzFOVzJMWGExZkgyYlZ1aXlPZlYybW13cFIrU3FRRmNtazhwTnhMaWtSN0U1?=
 =?big5?B?WjdIQjBtczVEZjlpYktHMjdZc292MTR4SGY3SFRjMFJiUGx4VGtLY0svM2xMOXJp?=
 =?big5?B?Q01TNnBUYldEQzdZSHdHZU9BZ1IxdEVHUTVqT2J3bDIrWU40NFpQajhncnJYNEdq?=
 =?big5?B?RHRoNFVLSVltb3VsbVpKN09CUlIzSXVmdFcrWUVyUTZJWlpWKy9sYzdHUVB3TzdJ?=
 =?big5?B?QTNoY0FtZ1Z4MG1JMENncnloV3I3ZFVJNmpuZVE5VmplMDZ0dGhaNXVuYVBpVzl2?=
 =?big5?B?Q0RjS2dLVGV3MXh3NFBmaDF1dDgya2tpYng1Um8rOWpWTVpRTXJURVJHSk9xVFl3?=
 =?big5?Q?9RCkXkDWopI=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6568.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?big5?B?RlRoN2l2eEtLUmRMZzVTamxZU2Q1RWFORjlIeFJUV2kyM3gwVkpzQlN0NkJ6Vysv?=
 =?big5?B?VEYwMHJGNTRiTkp1YlM5Y0dXczhXUS91YW43RHdqNVhSTmJjeGl6eFMxMzJHak5V?=
 =?big5?B?V1B5cjdSNFA2bUpuSVVRV2hFV2QwZ2hGcDRzeTdlMytZL2ZJd3JJd0JEbk5SYWRK?=
 =?big5?B?R3lJN3N4WFNsMXJLMEREWkxFdnoxc2VudkExNDRRSExnL3BtQVlJZE41cjBNQnJD?=
 =?big5?B?LzhCNmROc3luOHJwVmVWcHNXRGtxaGsxUFFnMG9KU1U4ZlZreDNIT0IrM1ZTSk00?=
 =?big5?B?bStQbVIvTCtVUlFXZWFwZllqNnJxSmF0TWxRSE5TdlQ4MGdRblB0UVNOOHlrc2Nk?=
 =?big5?B?bkQ1Qjd4YlFldXd0SlpjWkgzT3VKbnRMS3kwdFlXRDF2Z1JjaWFQVHZLWm0xYVAv?=
 =?big5?B?OHh3aW15cHhEMzF6V0k0SkVLa25yUmgyVm5CSUhBZndUTW9JN0s5bG5aaWowWmxr?=
 =?big5?B?ZDhmdmJxMHdoSnNRQ253QU9EYmNEbzdDSlB5RFBXdy9RMHU2L1VmZy9SMlhCazVy?=
 =?big5?B?ODRzMzlzUkRYTFdJeDYySUlrZVgwSzJOWFhTTVBNaGRmQjF2UHN5Rzc2b3IyQUM2?=
 =?big5?B?dkUwTlRCeXBZQkd2UjhXQlZsQ04wRWVaaC8xZkFldEwzRUtQdW13QjJHUzlMZUdh?=
 =?big5?B?M21kUkhhSWhlVlRwNEtjODlPSVBYL2FybWYxYTErWnM2eWdaZ3NVSlVnckdPOGdh?=
 =?big5?B?L1czN1dRZHlBNUhvTUJSTjRzU2FFSE1PV01iNGpsL2Y3OEdHSm9ZS2pIUUpRMGho?=
 =?big5?B?VEZ5NU4zRmd2THhQS3pXMmhhRmcrMWRpczNPQzdtU2ZRbjQ2c2E5VkxkUGlaQXlW?=
 =?big5?B?OTN4UXNXTHdoOGZvbzFnTVdLZE8yK1RsNDl2NUJ0NTVQZ2pBcjZhVGhKZzF6bkRk?=
 =?big5?B?SmR4SnhhZy8xSDRzSFk1NkV0bG9mT1g4SzNuRUhkNS9lMWJWbVN5c2hPMzJWSHQ1?=
 =?big5?B?QUQ3THBJaTFFdXA4cCt5VHI3UTRtTUNmZE9DZHIwQjdvbmNHdjV6T2VGVVlsdnBq?=
 =?big5?B?b2NNdlY2eVNrd3NrVWFKeUYzTWpIZE1sZmEzQllDYmwzRVM2aWEvUjhVRmYrV3lr?=
 =?big5?B?MnUyRUVvTjByVDZIaHJOUXd6TjVwK1FlQmVjTzlYaEo2OWp5K3NOU3hiU3d3bjVn?=
 =?big5?B?MXZwWTZBaDNSejRJTUdrQVFVaUNuaWZUVEU2MXJpcWZHVUZLU2JwVThxdGxGK0dt?=
 =?big5?B?M2h2TU9La2FGVGxoTXZNQy84a0VPZ2k3dkFNYWVFY0NzY2YrNkhIOTlVRDV3d2RY?=
 =?big5?B?b1EzcC9rY0x5MHd0MG9hWHF2T2VERHBpRk50TzdIbnQwWTNaYnJxODNCWFMrTDBz?=
 =?big5?B?d1dKVER1UWd3c3Fmd0dtR3JFekVjdjV1VzNkZm40amV3RTBNY1M1V0VEeDRrL2k5?=
 =?big5?B?bjVOa0JMdW9JSjI2OHo5eVlTOFVaKy9SSk5jZm5IbWx2Z1NOV1gxOTFOb2pYRFFr?=
 =?big5?B?UmdremYweVJHNXZvb1JJbUtYRHYzMUIySVNhQUxhU0ZjeHhCOENIY21Gd3hnQWZJ?=
 =?big5?B?ZXpBWUxRRzloWjRVY0RkbVZxQ0t1bCtPMG5HLzRDaEVuNE42UXNGSGVzcjI4Ymx1?=
 =?big5?B?Tm9KWEloUXh6dkVSUHM0MzFUZDRNT0FSVkVKMDNTRFhQaG1pMUFEbGgyeXZJd2Ja?=
 =?big5?B?cGZnMy9Ra2JjRHNHcEJJYWRSamNkbGROZW5CNWdKNG1neGlxUjRQRkhBdlJUMXI3?=
 =?big5?B?ZUVjUHR5LzBXVUp2K0xkaFRmWEhsUlBxVHZKak80Y1VNaHlXaDUrYnFjdnl2Y1c4?=
 =?big5?B?YzA5bzFoZ3RMZTBDK2hhUWlyZW1DVnk3b0ZBM2ZzK3NET1JhMzVXNSt5eFNHNnVC?=
 =?big5?B?Y05iVUVpdWNVOVpxdElpdUpIc29qa1QvVU1qSFp5NXNFNXc4UkpWTjBOUXdITGVi?=
 =?big5?B?Z1VlNUVwTE1QZUJTbTJZSnFjSm1mMXBwV0ViRjFmVGJuRmNGekp3enlweXJ5RUZo?=
 =?big5?B?QXp6N1ppSERPbHUybERaSzNSU2IwOUwvUTE5ZHF2UVNMTFB3VDk5SU1OejZwU21k?=
 =?big5?B?K0taZndDcWd0Rm9YNzZUN1FOOWVtN3p5SSsvdnR6eHVabnNhSHc9PQ==?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6568.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13887bdf-ba3e-4530-1f39-08dccaf0d86d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2024 01:44:55.1706
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8YI56EIi/iuz3/7K1ldOnoxDpZDQzrW6K0m9kdMlrcUu/zujcUq1/xs6nleIaKX3YtMlSCio6GLkIN4p4s3+pcXPq/vEj+SB4bIIXilbou8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5484
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgS3J6eXN6dG9mLA0KDQoNCk9uIDIwMjQvOC8yOSCkVaTIIDAzOjU2LCBLcnp5c3p0b2YgS296
bG93c2tpIHdyb3RlOg0KPiANCj4gT24gMjkvMDgvMjAyNCAwODo0NSwgSmFtbXkgSHVhbmcgd3Jv
dGU6DQo+ID4gQ29udmVydCB0aGUgQVNQRUVEIFNvQ3MgdmlkZW8gdHh0IGJpbmRpbmdzIHRvIGR0
LXNjaGVtYS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEphbW15IEh1YW5nIDxqYW1teV9odWFu
Z0Bhc3BlZWR0ZWNoLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdzL21lZGlhL2FzcGVl
ZCx2aWRlby1lbmdpbmUueWFtbCAgIHwgNzgNCj4gKysrKysrKysrKysrKysrKysrKw0KPiA+ICAu
Li4vYmluZGluZ3MvbWVkaWEvYXNwZWVkLXZpZGVvLnR4dCAgICAgICAgICAgfCAzMyAtLS0tLS0t
LQ0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDc4IGluc2VydGlvbnMoKyksIDMzIGRlbGV0aW9ucygt
KSAgY3JlYXRlIG1vZGUNCj4gPiAxMDA2NDQNCj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWVkaWEvYXNwZWVkLHZpZGVvLWVuZ2luZS55YW1sDQo+ID4gIGRlbGV0ZSBtb2Rl
IDEwMDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9hc3Bl
ZWQtdmlkZW8udHh0DQo+IA0KPiBGaXggdGhlIHBhdGhzIGluIGtlcm5lbCAoZ2l0IGdyZXApLg0K
U29ycnksIEkgZG9uJ3Qga25vdyBleGFjdGx5IGhvdyB0byBmaXggdGhhdC4NCkRvIHlvdSBtZWFu
IEkgbmVlZCB0byBjaGFuZ2UgdGhlIGZpbGUgbmFtZSBmcm9tICdkcml2ZXJzL21lZGlhL3BsYXRm
b3JtL2FzcGVlZC9hc3BlZWQtdmlkZW8uYycNCnRvICcgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9h
c3BlZWQvYXNwZWVkLXZpZGVvLWVuZ2luZS5jJz8/Pw0KDQo+IA0KPiAuLi4NCj4gDQo+ID4gKw0K
PiA+ICsgIHJlc2V0czoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICsgIGludGVy
cnVwdHM6DQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiArICBtZW1vcnktcmVnaW9u
Og0KPiA+ICsgICAgZGVzY3JpcHRpb246IHwNCj4gPiArICAgICAgUGhhbmRsZSB0byBhIG1lbW9y
eSByZWdpb24gdG8gYWxsb2NhdGUgZnJvbSwgYXMgZGVmaW5lZCBpbg0KPiA+ICsNCj4gPiArDQo+
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZXNlcnZlZC1tZW1vcnkvcmVzZXJ2
ZWQtbWVtb3J5LnR4DQo+ID4gKyB0DQo+IA0KPiBVc2VsZXNzIGRlc2NyaXB0aW9uLCBjb21wbGV0
ZWx5IHJlZHVuZGFudC4gUGxlYXNlIHNheSBzb21ldGhpbmcgdXNlZnVsIGFib3V0DQo+IHRoaXMg
cGFydGljdWxhciBtZW1vcnkgcmVnaW9uIGFuZCBpdHMgdXNhZ2UuDQo+IA0KPiBNaXNzaW5nIG1h
eEl0ZW1zLg0KT0ssIG1vcmUgaW5mb3JtYXRpb24gd2lsbCBiZSBhZGRlZCBmb3IgdGhlIHVzYWdl
IG9mICdtZW1vcnktcmVnaW9uJyBpbiBBU1BFRUQgVkUuDQo+IA0KPiA+ICsNCj4gPiArICBhc3Bl
ZWQsc2N1Og0KPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMv
cGhhbmRsZQ0KPiA+ICsgICAgZGVzY3JpcHRpb246IHwNCj4gPiArICAgICAgU3BlY2lmaWVzIHRo
ZSBzY3Ugbm9kZSB0aGF0IGlzIG5lZWRlZCBpZiB2aWRlbyB3YW50cyB0byBjYXB0dXJlDQo+ID4g
KyAgICAgIGZyb20gc291cmNlcyBvdGhlciB0aGFuIEhvc3QgVkdBLg0KPiA+ICsNCj4gPiArICBh
c3BlZWQsZ2Z4Og0KPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlv
bnMvcGhhbmRsZQ0KPiA+ICsgICAgZGVzY3JpcHRpb246IHwNCj4gPiArICAgICAgU3BlY2lmaWVz
IHRoZSBTb2MgRGlzcGxheShnZngpIG5vZGUgdGhhdCBuZWVkcyB0byBiZSBxdWVyaWVkIHRvIGdl
dA0KPiA+ICsgICAgICByZWxhdGVkIGluZm9ybWF0aW9uIGlmIHZpZGVvIHdhbnRzIHRvIHVzZSBn
ZnggYXMgY2FwdHVyZSBzb3VyY2UuDQo+IA0KPiBUaGVzZSB0d28gd2VyZSBub3QgaW4gdGhlIGJp
bmRpbmcuIE1lbnRpb24gaW4gdGhlIGNvbW1pdCBtc2cgYW55IGNoYW5nZXMNCj4gZnJvbSBwdXJl
IGNvbnZlcnNpb24gd2l0aCByYXRpb25hbGUgV0hZIHlvdSBhcmUgY2hhbmdpbmcgdGhlIGJpbmRp
bmcuDQpPSywgSSB3aWxsIHNwbGl0IHRoZSBwYXRjaC4NCg0KPiANCj4gPiArDQo+ID4gK3JlcXVp
cmVkOg0KPiA+ICsgIC0gY29tcGF0aWJsZQ0KPiA+ICsgIC0gcmVnDQo+ID4gKyAgLSBjbG9ja3MN
Cj4gPiArICAtIGNsb2NrLW5hbWVzDQo+ID4gKyAgLSBpbnRlcnJ1cHRzDQo+ID4gKw0KPiA+ICth
ZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YN
Cg0KQmVzdCByZWdhcmRzLA0KSmFtbXkNCg==
