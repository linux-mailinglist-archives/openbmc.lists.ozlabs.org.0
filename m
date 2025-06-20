Return-Path: <openbmc+bounces-266-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4350AE26F1
	for <lists+openbmc@lfdr.de>; Sat, 21 Jun 2025 04:06:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bPHkw5lnxz30T8;
	Sat, 21 Jun 2025 12:06:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c406::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750408207;
	cv=pass; b=aXCE5R6GEsjgap58k1cu+ycO9lDHiNoqF+RKrtqHcGypSxn84YYhIt/Q2IDSc9aWuYwW7DUynsd4vUVO4S+UhnFXE8xX6NdN0HHyPuB+mkAzpJdOawHzeOP/1aKqQpPoXDgcLW3IeTFmAZCnRiuEnNk+HcbaAKAvb46+I6nq5e1wSnbUZCJlnMLABHTnKOMFFvdNaRXXu6iyq8iFkg0qSDz4VX8I2AsNXieK0qJx90ZnsGDtahf3/wsLjs64fS4TElWmPGuaRKShaPOLv6TeOpilhVoDTdYUeKbOCIE2WeB+/PEl1YdcuzTF+yrf2biJJaGGez9IEon0GQNOTzc6CA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750408207; c=relaxed/relaxed;
	bh=ci0Ia/ekTCSb1AOKFUc09tZXco26CUk0l4fO+I8DYig=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kCwMTy5Sje0tS2FD/CmSzZhTg7TIGy/8GHYsev0wnj6BBKuPhE6L51bWmRsNhE/TzKgsJMNjV/LhYzleWfd28oPHG/vTKb/EZwkFaE4I/8bG7fpCVYwxXQwCxiV/QC/nDfT/Y5LuQC9lZ5fe7W1sOERi6fecfpG2Mab9OygDrocNGCxe8/RDHfy2t3hq/V/2ggTw/xDJIcmwyhm4eowqlPKjBPFefrfrGqBTrsdOQQpCzDin9rxRPNx4FObHZ1bqk6rWCmv2kavSqmxbS8PFnMhyVlUiUsSoFFaAu2Yv4PllJIK/E9EsCUFX1Xm2kmRsLyKwJTg1xMdOMTsJ5Eprkw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=bR6iTzLa; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=bR6iTzLa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c406::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNrJF5ypJz2yF1;
	Fri, 20 Jun 2025 18:30:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ropHfulSFwv+Kjmxv3Z1O14H0VHv8Jt+CzfocW4piSceHxu0VbBp+wKqaNmoftQx++hVREwu9uEXerCsDLZA/2yJJlCbUFsJV/5RHCAtqki4CJqBVCTYFglEdQLsCzovfp6RyLP5RFbPpO1RM3/U5fg/vVQVUsnSgSAMF1lcsMNJXLeCKwRtd9MktY351LEOMAdsNfRT28Rt2ysVT7Wo0tjfH7Ll4ybpcg1l9b0t1U6DW9Nb0+2Pxi/IdToq37WXcMGJ2XPoDmaeWhxzKSHJKZii6btrQK8wn8pImOU7Ok00yvD21h9okLH7ADtKH1WVoGXzxfntwyYyxCddmBcwlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ci0Ia/ekTCSb1AOKFUc09tZXco26CUk0l4fO+I8DYig=;
 b=FSD9l6eXRckxe9we6sp50Txuj5KsuUPU1cP4CPILWXB49tiqfTSxi6BVPlGnjToWLz9xi5QA65kJeJ4MSLPkvN6k9lVjSS0aluUiSMQcd9TRV23HFaE8R9imfnzWTjzin//TM4CWPQrfTy2XhYRzcsmYm6zY+Uj/H2CIUQ1dSEmgqHikK14oaqCmM9UfrWA/GgpALusEezLIaA89yQckvuuTnYj/CYUZrb1FR7j3cEsKqKv0n8+dujdk83iCQVRBFnO0lLQD1B9YjET12hrg02Ge9x9lz7JTwxga8dkZoEuKJbqRGHLaL3/MI5eoOKajmTaty6r0zwXMjMGLFOMKkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ci0Ia/ekTCSb1AOKFUc09tZXco26CUk0l4fO+I8DYig=;
 b=bR6iTzLaVauiSTsWssT8TRFa/1IGmgD1RrORFnc82Bhx52bGuzBSEG2X8wFlI7uCpuFvgVNcp/daXd2FMViotQLT+VH4UGGhZII9vAAful9uEQk4rQ2cQXm6YliABbXDQTHVJ3m4uNb29biWU1DdTW2zNBTWlAEzHIFzCuHW8wDBliW5uvsWW21Mj8gV0LXIRnYxq/UH6Max1cfz9495WTbyiiTtg5Y9TsewOOn77HFxu7G7fK3LwsywCjZGJjni0iiL+ZekTsaqVEK1z/lO84GhkoOvyd8yOOxRIGoppmhlASeeTTSnkDvEqoahhfV/1F0kFMb0RQaECRVNKPMvGw==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by JH0PR06MB7083.apcprd06.prod.outlook.com (2603:1096:990:6e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 08:29:41 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%5]) with mapi id 15.20.8835.027; Fri, 20 Jun 2025
 08:29:41 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>, "mani@kernel.org"
	<mani@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "vkoul@kernel.org" <vkoul@kernel.org>,
	"kishon@kernel.org" <kishon@kernel.org>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
CC: "elbadrym@google.com" <elbadrym@google.com>, "romlem@google.com"
	<romlem@google.com>, "anhphan@google.com" <anhphan@google.com>,
	"wak@google.com" <wak@google.com>, "yuxiaozhang@google.com"
	<yuxiaozhang@google.com>, BMC-SW <BMC-SW@aspeedtech.com>
Subject:
 =?utf-8?B?5Zue6KaGOiBbUEFUQ0ggMS83XSBkdC1iaW5kaW5nczogcGh5OiBBZGQgZG9j?=
 =?utf-8?Q?ument_for_ASPEED_PCIe_PHY?=
Thread-Topic: [PATCH 1/7] dt-bindings: phy: Add document for ASPEED PCIe PHY
Thread-Index: AQHb3BN3poZHqaPRJEuwtTAqS+UGirQA13KAgAro7zA=
Date: Fri, 20 Jun 2025 08:29:41 +0000
Message-ID:
 <SEYPR06MB5134E409B225B6B1C934A10F9D7CA@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20250613033001.3153637-1-jacky_chou@aspeedtech.com>
 <20250613033001.3153637-2-jacky_chou@aspeedtech.com>
 <36cb3578-1efb-4d2e-b50a-47e6dfd3bdd0@kernel.org>
In-Reply-To: <36cb3578-1efb-4d2e-b50a-47e6dfd3bdd0@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|JH0PR06MB7083:EE_
x-ms-office365-filtering-correlation-id: 75ef7024-46c5-4636-1ef2-08ddafd49a79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TWR2ai9KQVFOWFl0Ylc1cldPcmpncmlxNm9Rb1NxbkZIdENzaEVaaFNCUFlx?=
 =?utf-8?B?QWxXSXJieU9NSEdlckplR2I3NGN5b29Ec0VkQXRzbStvUXFZWENoZk1VSWZp?=
 =?utf-8?B?ZUVUa29oU1RUY1RVMk1MR0tueTFidjUxUTRudUxWTlhRRitteGNtTFZ3dmpy?=
 =?utf-8?B?cnQ3U3JGamkvSXVBdm5SUWpxWmppWnh4QlpYak9RNThZazY1ZTZieHNGSWhi?=
 =?utf-8?B?SE1vWmtHcmVpc2xyVmxMMjF0RFdnRHVMajVTOUwvUEE2OE5SK0Jsem8vbUJm?=
 =?utf-8?B?SVpSVWoyajJ4VEdnTUUzQUtYdXpOYzJ5L0QwREdhM205V2VIR3pHZTI4V0wy?=
 =?utf-8?B?ZGlYRDdkaXh1b1JqWm5BMk1wN0RUczFXMzR5WkVTc0hsdGhZQ1g3dGhaV2pY?=
 =?utf-8?B?R1l5Y3pybkZTb1ZQaUhhWE10QVhtM0NRTVEyeHJ2MjdrZGN4N3M0TlNkOWha?=
 =?utf-8?B?ZU1lUDRwRmsvYktxVDVHaUNIbWU1VE5sRmpVbWFWUXhvdG5selBva2xrc0k5?=
 =?utf-8?B?R29oZG5pa3Awa25PR2ZIbFRjbm52d3IrQjNEZ29JdDhtcy9UVlZ6eXBxckd4?=
 =?utf-8?B?NkVYL28yaGJoRW45dlVVbGQrYmhPZEFpK1EwTzZkeks0WVRTYTkvVnJEMlRG?=
 =?utf-8?B?R0JMa0sxUjhRVFZSQnlzanUwc1dsdVpWbGY0alhER2FKekZvOWd4ZTJsUXhG?=
 =?utf-8?B?bTc5TDNTa0xSN0pUcjJjdlEyMzlpNGlrMS9kMzZzVDJoNTB3NlpHeVZwYWRL?=
 =?utf-8?B?cEFmZ2cvOFN5ZnZFUHBiSURocXlZS0ZabzVmOFFzWmltdVF3eDBFbWEvWEY3?=
 =?utf-8?B?S3hqRVF1VDVudjE2WkluK1hNWFhKSUVxRlRYZkRWbTYwbWhRZTA5TlVoVFNG?=
 =?utf-8?B?cDlwZGR6Yi9aS0pnY2dWelhxb0hKRVBPajh2ZHZuWTIxWis2eUQ3RmJ5UXlq?=
 =?utf-8?B?TFdBVEN4TkhhOE5sWTg3OTlibTNJRW5yeThnRGp6bHlEU0djc25FUmdtVXpl?=
 =?utf-8?B?aFVKRFhwZFEycHRqclN1U0ppVWtsZ1dzZXhEelhUR2QzVGVlZ2pUTFpSamJh?=
 =?utf-8?B?ODV1MndOSys3UmdUYmFmdFhCVk5GalBpWDBhSmhDMGExZzhQUnIyQWYxK3dI?=
 =?utf-8?B?bDAvN1RzYWlEcEpMVWsyb3pHSW5FbmhFb3VNM1BtNStHY1ZmeFRzT295Mk8z?=
 =?utf-8?B?QzRYdnExUnJhLytPTWwyVUg5YjFvM1JMZWFSejEvUUJuTVU0ZStnQWJHQmgx?=
 =?utf-8?B?dmdUaGtkVmY3VXgyRDFoNHI1dlZ1RnBvYVNuV2l1NURtWDIxRUpEc041N1I0?=
 =?utf-8?B?UExQYlJremdjUzhlYi8vdlVoeVA3SmE1OW9jancyUFRCS2luOXlneFVNS1Za?=
 =?utf-8?B?RWdBMGg1aVJ5T293SEdtTWJFNzMvQjBTSUVnbWk3TVl1azBNRzRMUVJkSExy?=
 =?utf-8?B?NVNqN1ZmSjRYdnBaK1VrT001d2hlM0d5RDZkVDd2NGduRjJqaU5NZTdoVTJB?=
 =?utf-8?B?R1V4bUlUYTJ5Q2djc3FsWjJqUU9lRWF1cU5YMkliTy9jc0hpbXJTWkRTcEpm?=
 =?utf-8?B?a3RiV1BmTjFWTnZ3T2NVWEhEQWIzbExqeHl1NUZsWjBLWGhSN1RrUmxrUDZW?=
 =?utf-8?B?ZzhLMis4S3RXQ0JlZ3Y0OGJmeG8yUmlqRE5vZTVYQUY5VFlTVzVxb0w1dVRn?=
 =?utf-8?B?Qy9OVk8vUTQ1WmdTYVYxQXhLTlVUeWp4aXY5N3hpV3pDYmVYVGdET3JJT1Mw?=
 =?utf-8?B?cmZMUExBZ0JkZHJiNHhsMllEbUowSmE0TjlteGtGZUlhRXhiaTVybGMxcmt1?=
 =?utf-8?B?NFZUUGs3TEdualp2bFowd2VJdGdZNFpOVXpEMzlRamNEcTVJa0J4anRlTVRt?=
 =?utf-8?B?cHNseHZvbDRETG9SZC9lcThDZVMzWHJBelNwT0IxdDlsUmFLMlFnZS8wT0x0?=
 =?utf-8?B?OTJzMmx5b2J0MG44NndjOVR0Z2hFbTZxTnpqS1JlUWxGSzROdzArM1J3ODlW?=
 =?utf-8?B?UEVWYm9iZ1R3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MVVPN0FiZ3V5TFpKN0QxZ3MzakpydGhmSGxvYjQ4Wm1uNk9QQys0UThsZ0la?=
 =?utf-8?B?eDZHMkpoYVF1dEYyeW50UnJ6dmhkM1AveUc0RnE2d1lQQ1p3R3FwSGI0OVhq?=
 =?utf-8?B?bDJRWkdFMTdXeVZWc3hldFBIUkNBRFcrSkFIZ3RJMFpPT3hEam9lT3pGcWhH?=
 =?utf-8?B?cDcrU1dMcDliS2drd0o5dGtLemFaZ0ZzcXIzOGRvNCtoU3RjbVEvdHQxMDdP?=
 =?utf-8?B?NjFFbGJ1b3lqWnlSbVlHOGhsSW1td1hRaDVhNTRqcndneEkzb041VDhHaW5J?=
 =?utf-8?B?NWxqcGxudzI2U1hDT2tnam1pRHpKSXp4ZXZobmNYTFN0STJDUE83dlNwTWkz?=
 =?utf-8?B?L3d1UjhKL3dndzVBc0loMTA5R2NidWRhUzZHS2tmN1dBdS9ybjFxZFM5RkZk?=
 =?utf-8?B?bG83aUdOSGx3R2F5Ylh5aThLNlZkOUhqK1VTcE1lZEhORm9sbmxyK1Fqc0lC?=
 =?utf-8?B?ZURBM2FRMHZMRVJNY3VxeEVpaytJMmFLbkp0a1VwTUZoM00yN1hpZ3FRdGpJ?=
 =?utf-8?B?ZWtxdG00L2NXZVJVVnZ2azJtZFJ3MnQvVk9IcDE0em42L0sxQ292RFBud1RO?=
 =?utf-8?B?NEhhbk1mdFA1WUNCeDFiRVZ3cmRjTi9qajVjWTVHc3c0WTB1TFJXVGYwVTZ3?=
 =?utf-8?B?Ym9DZCtzV3RYVFpNRzNWR2hzcWswNDNtc0RNYmx1RUY5OW54djQ2UG1XVkox?=
 =?utf-8?B?TXJsUnQ2Y2UvQjJDd2VzZGFHeVRyVkNWZUF1Vm80WktNdm85VXdJOGo4cmVi?=
 =?utf-8?B?bTJDYXo1cDJKY0VyV0ZLNnFIb01tRkNrVHU2MFU4aHY5L1VKT2ltTWVidndL?=
 =?utf-8?B?YmVsYW5QQkVGdW9BK3RMcThjVDBpNVFrbkFmdmlTQmpSdXcvMFRXYTE3ZmV6?=
 =?utf-8?B?RVdyS3ZwdEhheENGQkltVGc4YllwRkl0Z1pvUzd2WGZ1YmphY1E0RE1TTTVu?=
 =?utf-8?B?Mks0SEZSWGd3dUtLNnVrSFhKM0drZ3pTNHdlK2lvV21DVm9GUngrblhISEZr?=
 =?utf-8?B?V0djVUFNbmxwWnhwVEZMSDR2NXcrRGZXa3NWWWxXMW50dCtVWk9WdjVZSVIv?=
 =?utf-8?B?K1V5S01wZUtjODZPSHBCZDJYR3h4WjBLU2xZZUpzWDliMVFxOEQrdFB3cC95?=
 =?utf-8?B?VFFhL2NKWStrV3NyRm1oRnJwZ2hRVmYxdDUvZ3MyMDU1c2Z3Syt6b3FMNVZH?=
 =?utf-8?B?STVPVDd4NCtUYll6c2drTEhiZ2gyRktzcUZRUTM1N09ZWG5oWFIrREJLMWt6?=
 =?utf-8?B?Y0k1NjJ0RkhtT3FNS1c0cmJySWdPVEU3RExSM1hNbzJ1NTJoVENPTFJYeG9D?=
 =?utf-8?B?ZmprMk1PenZFNW9xZmFZQkpyZjhLcDE2VG4zU1dIVU5LWmY3VjNEUnVNTnlX?=
 =?utf-8?B?bGljbFpwUzMxK24zSFk1ai9RWjRHOWdma2sxbC8vSnJvcjExNFpUeFFaNlh6?=
 =?utf-8?B?VzR2dE04YlJmanI1MS9sYTVvckhZSDFtOVdweEw3MHh4SjcrYjBJMzNUK0Rw?=
 =?utf-8?B?WldjWUt1K1k2NHJCVFNobGNERGpQaURMZnZhbFRReEc5bXlqWnVrdnpPdFlv?=
 =?utf-8?B?dVBvaGlNSWxBdmRXTVRvS21CUEhKV3E2UjFKWUJHdGNkTWl2QUFPTGdBa3BE?=
 =?utf-8?B?M09xdVEvaUxhbjkrL2xVMHBrWXNtNGh2UlZHVHZDd2JVd0lPbTkxT2xIWmxt?=
 =?utf-8?B?bENpSG8vRVhtQlN2U2kxSm1nRGNpY2tXSlpXSUd4UHA3TWJVTnRFdXFUUUxw?=
 =?utf-8?B?bTQ3cW1HTVE1R0sxb3hPUDhDTk1xbkd1R3ZwT3dYVUEzMjFFNjZ6SU9TVU9U?=
 =?utf-8?B?WEVDN01rN2hZUFdrZEdQSzl5Y0pWdEd0b1JKYTBIb2M3SFB3aTdDWXRxaEhv?=
 =?utf-8?B?NHA1bXBRTDAraGJBa0tKSGU2VnhqVzlCUko4L1FUdTVKZXdDdzhrRXBPcUxK?=
 =?utf-8?B?SGZLYjVDeUtUUmpNdURJVlowN0s1Z04vSndyK2N4UjNhV3BtR0VSNE10MlNa?=
 =?utf-8?B?UFFvUkhJVElFSGgxQjJPWXdVajd3UGNTQlVqaW1DelFSTUYvUFV3TWMvcWFx?=
 =?utf-8?B?Um4rQ3BsL1ZyOG5xOVU1UVFhQlN5bHlmelFpUnlBOFlGeDZJbGtpdFFzT2Fu?=
 =?utf-8?Q?VfyaNx7sKhfsdodNORsKStvmu?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5134.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ef7024-46c5-4636-1ef2-08ddafd49a79
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2025 08:29:41.5758
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: luRmARQte5dK6ctHIELX54SGR3jR/xtlzPORQuMOGo2nghsT9XeteS9h17ACFYPV81HabYiQkyB/0WFOwCAlM7Ca/gD1+ZNJw0vu5/PCs84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7083
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiANCj4gRmlsZW5hbWUgYmFzZWRvbiBjb21wYXRpYmxlDQo+IA0KPiBBIG5pdCwgc3ViamVjdDog
ZHJvcCBzZWNvbmQvbGFzdCwgcmVkdW5kYW50ICJkb2N1bWVudCBmb3IiLiBUaGUgImR0LWJpbmRp
bmdzIg0KPiBwcmVmaXggaXMgYWxyZWFkeSBzdGF0aW5nIHRoYXQgdGhlc2UgYXJlIGRvY3VtZW50
cy4NCj4gU2VlIGFsc286DQo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2Ljct
cmM4L3NvdXJjZS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluDQo+IGRpbmdzL3N1Ym1pdHRp
bmctcGF0Y2hlcy5yc3QjTDE4DQoNCkFncmVlZC4NCg0KPiANCj4gPiAgTUFJTlRBSU5FUlMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTAgKysrKysNCj4gPiAgMiBmaWxlcyBj
aGFuZ2VkLCA0OCBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvYXNwZWVkLXBjaWUtcGh5LnlhbWwN
Cj4gPg0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9waHkvYXNwZWVkLXBjaWUtcGh5LnlhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9waHkvYXNwZWVkLXBjaWUtcGh5LnlhbWwNCj4gPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uNzYyYmY3YjBhZWRjDQo+ID4gLS0tIC9k
ZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkv
YXNwZWVkLXBjaWUtcGh5LnlhbWwNCj4gPiBAQCAtMCwwICsxLDM4IEBADQo+ID4gKyMgU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKSAlWUFNTCAx
LjINCj4gPiArLS0tDQo+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcGh5
L2FzcGVlZC1wY2llLXBoeS55YW1sIw0KPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5v
cmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4gPiArDQo+ID4gK3RpdGxlOiBBU1BFRUQgUENJ
ZSBQSFkNCj4gPiArDQo+ID4gK21haW50YWluZXJzOg0KPiA+ICsgIC0gSmFja3kgQ2hvdSA8amFj
a3lfY2hvdUBhc3BlZWR0ZWNoLmNvbT4NCj4gPiArDQo+ID4gK2Rlc2NyaXB0aW9uOiB8DQo+IA0K
PiBEbyBub3QgbmVlZCAnfCcgdW5sZXNzIHlvdSBuZWVkIHRvIHByZXNlcnZlIGZvcm1hdHRpbmcu
DQoNCkFncmVlZC4NCg0KPiANCj4gPiArICBUaGUgQVNQRUVEIFBDSWUgUEhZIHByb3ZpZGVzIHRo
ZSBwaHlzaWNhbCBsYXllciBpbnRlcmZhY2UgZm9yIFBDSWUNCj4gPiArIGNvbnRyb2xsZXJzIGlu
IHRoZSBTb0MuIFRoaXMgbm9kZSByZXByZXNlbnRzIHRoZSByZWdpc3RlciBibG9jayBmb3INCj4g
PiArIHRoZSBQQ0llICBQSFksIHdoaWNoIGlzIHR5cGljYWxseSBhY2Nlc3NlZCBieSBQQ0llIFJv
b3QgQ29tcGxleCBvcg0KPiA+ICsgRW5kcG9pbnQgZHJpdmVycyAgdmlhIHN5c2Nvbi4NCj4gPiAr
DQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4gKyAgY29tcGF0aWJsZToNCj4gPiArICAgIGVudW06DQo+
ID4gKyAgICAgIC0gYXNwZWVkLGFzdDI2MDAtcGNpZS1waHkNCj4gPiArICAgICAgLSBhc3BlZWQs
YXN0MjcwMC1wY2llLXBoeQ0KPiA+ICsNCj4gPiArICByZWc6DQo+ID4gKyAgICBtYXhJdGVtczog
MQ0KPiA+ICsNCj4gDQo+IE5vIHBoeSBjZWxscz8gSG93IGlzIHRoaXMgYSBwaHkgZXhhY3RseT8N
Cj4gDQo+IE5vIHJlc291cmNlcz8gVGhpcyBsb29rcyBqdXN0IGluY29tcGxldGUuDQoNClRoZXJl
IGlzIG5vIHJlc291cmNlLg0KSSB3aWxsIGFkZCB0aGUgZm9sbG93aW5nIGRlc2NyaXB0aW9uIGlu
IG5leHQgdmVyc2lvbi4NCg0KIiNwaHktY2VsbHMiOg0KICAgIGNvbnN0OiAwDQoNCj4gDQo+ID4g
K3JlcXVpcmVkOg0KPiA+ICsgIC0gY29tcGF0aWJsZQ0KPiA+ICsgIC0gcmVnDQo+IA0KPiA+ICsN
Cj4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKw0KPiA+ICtleGFtcGxlczoN
Cj4gPiArICAtIHwNCj4gPiArICAgIHBjaWUtcGh5QDFlNmVkMjAwIHsNCj4gPiArICAgICAgY29t
cGF0aWJsZSA9ICJhc3BlZWQsYXN0MjYwMC1wY2llLXBoeSI7DQo+ID4gKyAgICAgIHJlZyA9IDww
eDFlNmVkMjAwIDB4MTAwPjsNCj4gPiArICAgIH07DQo+ID4gZGlmZiAtLWdpdCBhL01BSU5UQUlO
RVJTIGIvTUFJTlRBSU5FUlMgaW5kZXgNCj4gPiBhNWE2NTA4MTJjMTYuLjY4MTE1NDQzNjA3ZCAx
MDA2NDQNCj4gPiAtLS0gYS9NQUlOVEFJTkVSUw0KPiA+ICsrKyBiL01BSU5UQUlORVJTDQo+ID4g
QEAgLTM2OTYsNiArMzY5NiwxNiBAQCBTOglNYWludGFpbmVkDQo+ID4gIEY6DQo+IAlEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvYXNwZWVkLHZpZGVvLWVuZ2luZS55YW1s
DQo+ID4gIEY6CWRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYXNwZWVkLw0KPiA+DQo+ID4gK0FTUEVF
RCBQQ0lFIENPTlRST0xMRVIgRFJJVkVSDQo+ID4gK006CUphY2t5IENob3UgPGphY2t5X2Nob3VA
YXNwZWVkdGVjaC5jb20+DQo+ID4gK0w6CWxpbnV4LWFzcGVlZEBsaXN0cy5vemxhYnMub3JnICht
b2RlcmF0ZWQgZm9yIG5vbi1zdWJzY3JpYmVycykNCj4gPiArTDoJbGludXgtcGNpQHZnZXIua2Vy
bmVsLm9yZw0KPiA+ICtTOglNYWludGFpbmVkDQo+ID4gK0Y6CURvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9wY2kvYXNwZWVkLXBjaWUtY2ZnLnlhbWwNCj4gPiArRjoJRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9hc3BlZWQtcGNpZS55YW1sDQo+ID4gK0Y6CURv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvYXNwZWVkLXBjaWUtcGh5LnlhbWwN
Cj4gPiArRjoJZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLWFzcGVlZC5jDQo+IA0KPiBUaGVy
ZSBpcyBubyBzdWNoIGZpbGUuLi4gYWN0dWFsbHkgbWFueSBhYm92ZSBkbyBub3QgZXhpc3QuDQoN
Ckkgd2lsbCBzZXBhcmF0ZSBNQUlOVEFJTkVSUyBmcm9tIHRoaXMgcGF0Y2ggdG8gYSBzaW5nbGUg
cGF0Y2ggYXR0YWNoZWQgDQp0aGUgZW5kIG9mIHNlcmllcyBpbiBuZXh0IHZlcnNpb24uDQoNClRo
YW5rcywNCkphY2t5DQoNCg==

