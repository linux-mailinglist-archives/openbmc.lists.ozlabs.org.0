Return-Path: <openbmc+bounces-1091-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B0ECF60EA
	for <lists+openbmc@lfdr.de>; Tue, 06 Jan 2026 01:05:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlWf16Mxbz2yFh;
	Tue, 06 Jan 2026 11:05:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.93.195.5 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767657945;
	cv=pass; b=fO1icopaFVYwtMAioiEhQLecW2A2KRdLC/lx6iH4hSnMFjnhr/ROQvWUYv4nN4/unq8LU1XnQzCbVD1zrbduDRSobKIRZz5rlkaU1soU1BgSYavCGocwnN5i6YHW1WLfI8bEBlu4S2MCRFiiMclyxQE/S6JucnNGr97Jcf5EOL47DbQBvB8pGlni96ZOwpaS6ZZaBHSs0YK+VvvrZ7ZJSAuSgWtOHQPctkcO+2rIPcxCSryQV6MPiveAUh7WErxaWA3f1USeFNNCK7Chl75xSMb7nj1npBfJMKsjr/tKnEy3wWEo3nHkERi90b2I+KEaQt440WxdH/7728wR2WiTuA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767657945; c=relaxed/relaxed;
	bh=tuokmgpKHTcrPf8T8n48LxGz1u2OYCflJDnNN694hdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=M7FeovtkXQqUpS/1twqN+XUZV2yrh4WEhXH7YiqNc3d8bb5lz2gNvhjms+LsTO0KtFwRLs/ZDRGhBuFJCYp0Y5nvP3LbxpXSRYWAL0BBiIjC9ux+PV33CJVB/UZkaw9io7tdnahmTQcYVNMm6MMVy3OSpaVEvva2EDKARzFbLnXaR/ELDDB3vjkilzLrpJSKUWv4FwxEa6dNpDltMQxXLvpXcg2acpjFTs1Dq1Hy/2c7kOzIVHMtUGWuw0+kSub7S7S2YGdAu3jCTH+dTv8b2O8VxvADkQNyP26PIqE3u0+FhvSpKqAs/EdjC8wu9Fvfb6iAdeyg7mewlvXwDuPDSw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FLswEbz1; dkim-atps=neutral; spf=pass (client-ip=40.93.195.5; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FLswEbz1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.93.195.5; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012005.outbound.protection.outlook.com [40.93.195.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlWf05BKBz2xqr
	for <openbmc@lists.ozlabs.org>; Tue, 06 Jan 2026 11:05:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MhqrTdwLUw1x5dxu8TUur9TEjiI2kaRhgQC2e6YtKEYXTLZ2+tnKtVLbbhR8ZfNLwse3iiz1qguvzcv5LDqJXItpBQP1i5Nq2he3sPYESSDAfRdu4oFVPZd9xbMyyBqXF3WVXlKaaX8Ba3IvIfu+7ux5kCOIF1Tbbzv1+D54rFQB9pxI1lVSb49BgmpZhX8dOQkISAbw0qn70Hdotsa8sw7AC9WV4fwenj4aLLHo6mS2FyOgXO29X5vkJJF32oosEEeepzTJ1LLbRf04Zv5vJ4sTvGRlG8OOhb/UfyciU0IcrXjXrHCNhgNWBiqohA0IhZviV6O8Un/PgVvcBjmDLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tuokmgpKHTcrPf8T8n48LxGz1u2OYCflJDnNN694hdY=;
 b=yrTAHlcpjqPUL3vK6FDlgOFxh+Di+h9vQjm+FkX6eOoboAA658vnlzjci4un2ZPkejbF49ZMaWOeoJ+isHEaj4zQXyUuKtzgPBv8a+HV0b9+sojj3TO5buMXh2KM4DmGSwTyoUAsCHJbra+EmBH9gtSda7oEOxWrKk8X3nE9g9rOJFYQSSh/3pIiNwxFwwQH53yi+xH8Dho6nj5hrgHN2HO29B//wAVUW4uvyfursf3FbgArbfBGD6WjQx0tw52pFLfFCGuatVWj67lR0Y6a5hf5Evqs0ZBqoS/CQFI3qPdN4PBEPLxws2UYSI7LZcBag9msTjezQd/ziqsX/gPUyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tuokmgpKHTcrPf8T8n48LxGz1u2OYCflJDnNN694hdY=;
 b=FLswEbz1NKRp5/029oOcsdQ8uON9hkEsTQex0cyO13oRZMaiK43O7PJO8zIE8YXXOMgoe5Uk62WkZS2hEuu8oxJNOqOZ+Pr6V2uxcXit5dpP/NFFe3wNcGp0KUief8KO24j0BdrXFHa21xKZZrOV/S52XMJa33PbMPn9sR8DNoAlxjlOiy1RIoLcOuTOISoWT7xSh9tUIsui1iPzCNIS+g2m2Bg27Lks7X97SEHO8jES13Fx/KrWmJmqxLjbu/n8Jgw4s0W2VBl3gJ5HzxCdLHbXEop1K4KCQiGZoT+xdR45QT87HMiwzISCzs7j9EEnII1na05Q42kH/iO0bC9bJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by MN6PR12MB8472.namprd12.prod.outlook.com
 (2603:10b6:208:46c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 00:05:02 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9%6]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 00:05:02 +0000
Date: Mon, 5 Jan 2026 16:05:00 -0800
From: Marc Olberding <molberding@nvidia.com>
To: =?utf-8?B?0JjQstCw0L0g0JzQuNGF0LDQudC70L7Qsg==?= <fr0st61te@gmail.com>
Cc: andrew@codeconstruct.com.au, joel@jms.id.au, openbmc@lists.ozlabs.org,
	eajames@linux.ibm.com
Subject: Re: [PATCH u-boot v2 1/2] drivers: spi: Add support for disabling
 FMC_WDT2 for aspeed
Message-ID: <aVxRrM14yN3YZ6Xo@molberding.nvidia.com>
References: <20251202-msx4-v2-0-a605d448bd02@nvidia.com>
 <20251202-msx4-v2-1-a605d448bd02@nvidia.com>
 <CAKkNK0JOPAyw8HA0XnD836d115p5YBbo=uBD9eXXvByzCv92Yg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKkNK0JOPAyw8HA0XnD836d115p5YBbo=uBD9eXXvByzCv92Yg@mail.gmail.com>
X-ClientProxiedBy: MW4PR03CA0188.namprd03.prod.outlook.com
 (2603:10b6:303:b8::13) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CH1PPFDAD84AB72:EE_|MN6PR12MB8472:EE_
X-MS-Office365-Filtering-Correlation-Id: f82bf684-e54e-4148-3e97-08de4cb73cdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SXNYNnBNZmZrSUNoZG5ib2dxRnVDdXhFRXgvZlhmQVVVRDNUOFRIWUlhMEtx?=
 =?utf-8?B?TTZ0WjJ2c2VObGVZa3NYejAxdDZ2c2MvZmdSVlFpaCtPMk1hMnBVQmpzcVdI?=
 =?utf-8?B?RTI0SlZ1NEtZV1pjWk1kc2dSQ2VPZ1krTzdvQlMrL0cwa3lDUGVKanpGdkpl?=
 =?utf-8?B?K0Raell0RlVBS2VNZmczMkJtVmFoMFE0bkhMcjZ1MzdVK1hWZ3prb2d5MFZ0?=
 =?utf-8?B?R284Zjh0ZnAyQk83aWpMK1BtUU5jdGpkSUJVK0V0c3NZejhHL2phU0ZqVkRZ?=
 =?utf-8?B?ZGhYTWIvSHpKTU43bkljMnRxWkVKclJrSFhEYWRTZFdoLzNQellVUEttWnNG?=
 =?utf-8?B?b3dTd092VFEvb1MrdUlJVm1ycGo5VFpOM0VaMTlOaU1QdmUzTEdwa2FnUDky?=
 =?utf-8?B?K2FvemVDSlVVazlmRkdCbkt5QUxxcjlSaVQ3Vis5RjhIbk5vQ01yOE9VNXR2?=
 =?utf-8?B?TTdFbmJicWxXcEo4cnZ5alBxczE4ZCs5MXdIUHZvSXphSk00aXFGRjROWWJE?=
 =?utf-8?B?Q2pEL3BCSFYwM2NDTUE3Q1dHU054VXRGd3ZyeEg4c3Y0Q0ZBMzNjWGdUZFdz?=
 =?utf-8?B?UkNBM3ZMbW02YzBFV2NrSXM0WGVYZ3VvWHZRZlFwRGJLaTM3VFRNTTNoSi8z?=
 =?utf-8?B?K0lhK2x6azZueWlPV1ZZRGx2K2l3a1NVeXZwYVlkUFRDUk40OXgvOC9ReDVR?=
 =?utf-8?B?NkVwd2tUQkxUTnhkWW50Z3hDMmZGOS8vMDI5RnJ2c2x1cC9zc3VldVFoOTBP?=
 =?utf-8?B?YnQxaUJsL0FXZjUxd3VJem9vZHZJT0RpclBhb0NPaHZ4RnRUY2JNM1VLaXpW?=
 =?utf-8?B?aSszdXNmYmxQVmFpeXR2N2ZkNFBidGJ0aE5tV1ZLVWZRUjVzWXlqZDhYZlVM?=
 =?utf-8?B?S2dJaUtwOFFUcStEaFE3b1NSaHY1UTFHdFpXRnA1bklFNDdaakRvRFo3VFl3?=
 =?utf-8?B?cEk2MXZtbTBOcFh6RVBBSnRndWtsSzBVOE5pd2I0WXVEcDIvUXAramRtcndr?=
 =?utf-8?B?Und6OTJNKzM4MVNkNlhRbUFYNzNYL2Z5NEhkYnptdE5WV1ZrNkp0ZlVkczFT?=
 =?utf-8?B?S3ZYWjN3dGJkN1hFSFNVVHVqVklBbTgxRitVMFF5RUJBUSs5cmh2b0lHQ21Y?=
 =?utf-8?B?M3JBZkFZWGpYV09vMis5d2wyWklWaVFFZ3Jyd25yaW8vTDNWVHdjQnlWMjZu?=
 =?utf-8?B?UXNta0FWcG0rVkh0d21KL1NNeWhLb2c0aWpwWSsrTGFlVHErZ1h5eTZGdGRz?=
 =?utf-8?B?NzhiSGVLZ2tyQXJTOGhwajZLeVN1SGlPUXpjUHVmdXoxL1Z2cFdNRWRITlJC?=
 =?utf-8?B?cEN4NUJ3ckxjZlZ1S2NNWktNTnBaT3liREVxZmUxOVg0M3FNUkR2c21XR2dv?=
 =?utf-8?B?L1NpTlRKc2hIM1BZUjJmNGVIY1JGMWdNUzF5L1puN0JKWnpvTHhua1RVZ1hm?=
 =?utf-8?B?YUR0a1JIVkY2WjNUL2krVFJjd2s1RjRNcGdyTmJTaGxWWnZNL3Z2TzNaRy9r?=
 =?utf-8?B?V200akRUbWExem5HK09IeXBtdDB4Si81enZBTkJtOU1qZ0prN25UbUhxTndl?=
 =?utf-8?B?dHJIaHk1SjRZL2tDZEFscXppVlg3UkxWS3l4VTdlZHErQy81STR5aUNuZzFw?=
 =?utf-8?B?YzNBamI0em5vM2xXQjU4d2UySCt2MXkyUEpMdG12QUlkY0FpVnZhRDJqdTAx?=
 =?utf-8?B?NjhyNHphUk1iY2ZFWThNTVRreC9wdHNOT2NVa1RKbDdueUpldkxzVlhSVWFV?=
 =?utf-8?B?b1pYZ1ZSdGl5NWo5djl1Ty9TNEZiTUozNjFlNkM2Ykc5QWVCMEFOem5nUzNU?=
 =?utf-8?B?QnF6cEozOEJNeTBuWkxlSWxtNWJtQ1g3SVo1ekZySGFwUjk2MGYvY3RlTU9F?=
 =?utf-8?B?Z1JoUkxqV2RkZitVdW4zN1FBSHhtZVJJWXZzaHFMZFdiTWRGenpjZjdwOU80?=
 =?utf-8?Q?kQOspxH/fBd5499KIDeVp5fnSY1onmoC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGw4NndNYzRIMHJrOEdSaUMrem5NOG1JajViRS9MeGp1RXU5SUFVTVlBdlp5?=
 =?utf-8?B?UldqNGx2ekpqbGVIc3lOTWlBVUxkdjhVTUN4Sm8rK09pNUtqQmdOWnVOcjNO?=
 =?utf-8?B?MGpIMlIzdG1Dd2xnc0JtY1FQQ08weE1Hay9LYk44K1VrTVFSakYxRHkyTUd3?=
 =?utf-8?B?Wml0V1lLUlY2SkRQWUJwUEhNMlQzay85ZmphMFZIMFVZNWVDVVRqTU02UXRx?=
 =?utf-8?B?QlRmQXZvbmdCL200aU5YbTdQK3RObFliUEM0OFRWOXNCT2Z3ZWZDYjUzMTNL?=
 =?utf-8?B?dnMxeURZdVZYOUlqODdrdms0V0RpK1VRVzFrOU5nY3MwV1hJaExYZzNKR0sx?=
 =?utf-8?B?MGYzRWQ0RDRsTTRXcEs2QTZJYkxSdnRZVFY4NE1Gb2M1d0ZjQWxlcTJENlI1?=
 =?utf-8?B?Tzh1clZwNzdKS2RlcEVzSVF2N1NtVjBlMnR2T2ZOWCtBeGU1SkpLamhBN3Yv?=
 =?utf-8?B?Y050MnEwSWxaRnJHempVSkpReG5LNUxubHhwaUQvWHRyeGptMG9kUFlkeHpV?=
 =?utf-8?B?aEthejVRamVYdjJ5dTBrUE0zS0FySGF6RmdyS3Y1QjArN2VtSzJPL2hrZjBW?=
 =?utf-8?B?SWlJSE50dVkvc1RRSkJhdDVsMTRCcFNlNFA4NUpQOFlaQVY0ZzFFWWExQ3Yy?=
 =?utf-8?B?UG1JdlRWM1phWHFiRjNHem50VjRSZHBYWDB3bmpjNjN5KzhZay9tK2JnTXAr?=
 =?utf-8?B?MXZMZU9jcTd1R3NYdEErVktVYnBFWHk2OUJUZk5OU2ZjcUhkRG9QTG0vUkU1?=
 =?utf-8?B?T0t6elkyTEdDeFpKc253bFUvOTQxTVJtclo0MXdKYW1XWURqSTZWdjFvbUNO?=
 =?utf-8?B?dWd6U1ZwemQyazhjNTVEOE1KQUszWm9OWlBBL2VGZlBJT0Z5bTdWL3RieTNF?=
 =?utf-8?B?b1BaeWZQbnpYUUtxSjg4SG9BSjZ0QW9YZDZRUlRJMXdyRW9RMnZOR3krN3Zx?=
 =?utf-8?B?RWJtM2o5MWJEZmdEVWwyS2ZDWjZNRTAwTEtJb1craVBnV2tSS29CdXIzdEFs?=
 =?utf-8?B?NTFYZjBSZUNQWWdCa3pDVzU3R01GNlE1bitNenJsNDl3dmFRNTR5eEZJazdE?=
 =?utf-8?B?M25zTEFad0VvVkF1QllCQ1dtZHREUDBzS3VmcytLUE1IOVBrNk44Z2ZQaHVr?=
 =?utf-8?B?dkhSNEM2NVJKZnZoaWhTR2NzdzZvbE9RT3RPWElDZFVTMTlSUkh2OHJTVmdH?=
 =?utf-8?B?dm1NR2pXS0x3SDQ0RWRFeGZvVndGek1FdHQxQ0krUUJUMldSVGtaQ09zblI4?=
 =?utf-8?B?aG9pc2Z0TThZYjk3V0twTEp2VlU0cUpyZnZoV1JsQjY5L0J2elNlN1RPSWJS?=
 =?utf-8?B?OElWZ0dhWWNSWnk3c2JHRnRQTkhGSDRPUHB6RVRwRXFTckFrN2ZFWmI4V0dL?=
 =?utf-8?B?S1NScnRTNktNK1JzdjR1cHJsSUN2N1kreC81UWxpUWNoZ3dzbldtR2VKNTFp?=
 =?utf-8?B?VUJuSi9md3lFYllLRlpPS0pGMmIxNlViNTlaTTdNOE85R0M2bWpmQUdTOVdZ?=
 =?utf-8?B?MDFIc1ArVHVnWGc0UlhrQUR2KzR4NXZXSlZPaW9tS1JOQnpkNml2MmFpTHgy?=
 =?utf-8?B?NVdveVJpa0lwUFg2TG9mdUlMMVh1S2J0T01aZ3ErTWVYMitNdzZsbUROMlA5?=
 =?utf-8?B?cXFaZ3U1SXdabDE3b21UbjlOOEZSc3lEeU5Bd05nY0FGRHE3cG5OU3o1cGUv?=
 =?utf-8?B?bEgwYktUUXRCYkxTbC9JdDFZQTRnclZRQkU4NDk5aWxmalg4QkIwUXNiV0F2?=
 =?utf-8?B?UjZtL1RmcE1FalkwQnRnQWIvWUl1ZGdDZytKS3NBdmhKblpWbjU4ZGFTUVla?=
 =?utf-8?B?WnJsa1BMbDNkNjNBRTI4M1VyVlhrdy84N1IrR0phektWbnlCS2Q1SkZKSEs2?=
 =?utf-8?B?Ync5RkluRitKVXVhbFlMZEdKcXJhcmJJcFpzbitzVDdYMGhmeGs2bFNaRXdp?=
 =?utf-8?B?VkZjajV6R1RibDY0SmlhZEdUaEswZXJldGlIcXpOUnhxQldJelFmdkUrTEdO?=
 =?utf-8?B?VWt5TVpsOUswaUFCVzUvTFdQSDdHbmQrKzJjZXVVdlJsUWVVc1NRenJTMlBU?=
 =?utf-8?B?OXoyS0tLSFpqcjRTY3Q0ZjI3ZEVqTUZGRlRiNFROeTVqS2lYTitVaWwvdmtr?=
 =?utf-8?B?ZG9qSjlyeXp3R2lKc1VsVjVEVlNvc2xUckJoOEQ4SVZjSlUxRUM3K3lnbHVY?=
 =?utf-8?B?aVV3OXhMVEdVNUJZL2x3enZocWd0U1dTTG90TUZ1UUNvVUJwa2hpQ3Q5aFBp?=
 =?utf-8?B?SEF3cFJOTFJBTHNZNW00WTFsWGJPcGh1Z2tyWU5NRGgzUUo2RXBvbHdjU280?=
 =?utf-8?B?YXdIR3V3YXlZd1A1My8zQXpZak9Pakx5MGR1WFEyUUFGNlVGQmxFdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f82bf684-e54e-4148-3e97-08de4cb73cdf
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 00:05:01.9379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T3at6jKJylXpUSDxaRlQPw+qAIwGbOezvW9UvCQEI+H39Q1mNgxn2aM6J2WdcwNgJ8b8w+R2p04wTlPks36aLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8472
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Jan 03, 2026 at 12:24:07AM +0300, Иван Михайлов wrote:
> On Wed, Dec 3, 2025 at 2:53 AM Marc Olberding <molberding@nvidia.com> wrote:
> >
> > Adds support for disabling the ast2600 FMC_WDT2 through
> > a device tree entry in the fmc node.
> > Set `aspeed,watchdog-disable` in your device tree to have
> > the driver disable it.
> 
> Marc, FMC_WDT2 doesn't disable watchdog, it controls ABR mode.
> Watchdog with or without ABR still in operational mode.
> So, maybe aspeed,abr-disable?
> 
> Below namings probably should be corrected.
We aren't disabling ABR mode with this change, right? That's only
done through hardware straps or OTP changes. All this is doing is clearing bit 0
of FMC64, which per the datasheet disables the watchdog. The idea here is
to just allow boot to progress normally, without the watchdog. For ping pong update,
userspace can flash the alternative SPI and re-enable the watchdog timer on complete,
and the BMC will boot from the new image upon reset. Let me know if I'm misunderstanding
your comment.

As far as the name itself, that came from Andrew the maintainer. I'll defer to Andrew
on what he wants. Andrew, any thoughts here?

> > 2.34.1
> >
> 
> This patch go through the standard upstream process or just openbmc u-boot?
> Do you have plans to do any changes around the linux kernel with
> fmc_wdt2 + spi part?
> 
> Thanks.

Looking at the state of downstream versus upstream, it will require (relatively minimal)
porting between the two as there are a number of differences in the upstream u-boot compared to downstream.

I'll defer to andrew on how he wants me to do this, but it will effectively be two different
patches.

As far as the linux-kernel changes, for the platform I'm targetting this for, I don't
plan on needing the functionality in userspace + kernel.

Thanks
Marc

