Return-Path: <openbmc+bounces-395-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3CCB0E6B2
	for <lists+openbmc@lfdr.de>; Wed, 23 Jul 2025 00:48:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bmsrT0Zskz2xgp;
	Wed, 23 Jul 2025 08:48:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c40f::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753162234;
	cv=pass; b=D7WTVYSxDcaE8pB0oCkvrTAdESnNjH4ICiMoUNt3DbyY8L0PnBhuS9nKEkY45D3J+VLBLDfgBMkdGy1K8tzozxTB2WORa97P6YRn7nOuVpa00SVO5TGHzEbNw2HEKT6n4rfrHf9vANyHCJrghJ7lR7BW49fuMNHeZ8DBsUtV4JgAEt8ij8yV9DQrh2vRbjb3/0SXDihOnmGDBhfvBM33yiF5F1c/06k7UF9yXBnhT5iHMmMDqVIqbNTf0N/VRzKb90KqDUcduSgFP3U2yCJt/9GbSOppTcoD03FWN+VBN2omEd2S7EPhIbAVmVL4bkvb/ipJjDUfV1QbKKT8Sf+41A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753162234; c=relaxed/relaxed;
	bh=nfwOWGtBPTwXPum0toKv42azmtvawkn4PnIXRnVwLyE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZjsjO0Mi899oF1PkrsHgquDk3UJoyanYHBV5EsTpNT75MT/5EG+uB1xZ+segd+FIXShsz6OUnmwjnjt12RKSkeokyC/pvUeAcm9XtSLf7Fua1ExoHVBs41p8m//OVMnVKS/1iEsgBYx/vYJyp9HLHeavA8WNJMRSNvpa1AGP1gjvcGGFQrcNzi26jEUSG+ydlcyaDz5gOBkQa9+pJ+IS1x7EeQwJXvEqHysgTVtRJbxOmo+2pb4gq82/IDIbID8LMOxqhdwAhoLkVaKA0FNHfm5RzeNaL3XwCmErVHEGwBgDjSGb9Wy8Y62w+82ILlk2Gcz3O/d6prc8G2XvlPf4aQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=2a01:111:f403:c40f::7; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c40f::7; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c40f::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bmQp265d0z3bgX
	for <openbmc@lists.ozlabs.org>; Tue, 22 Jul 2025 15:29:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UttJ3wUBXboixDJ92werW7UE3v+WY1sw35DaDiWotQvjVloQxuoaUl2MEaM99Vb16zbkEw1PaWug6FA/WYW3+G6fNivxT6+3E8JnCvr4Ga5TFS4m4oeg0XVrckjAMDpIfsJtddcu0GR5MTofZZEI/TmbBbH6Ai7RAEj69uiFy4nRG3C1QeFroJwz2duDLvG5a9Hd+lrD4ZVud1XfVWHlQtuDhtbhi33uIfZYy13KzQZdTVEdfhWaGRvaAVmtVMe1kWWv1S8jbqBsYYS0/hlSEqavx6ft0iHIZppukY1ToXaJYU2crhO8FazNdP5H14rcX+GbSHHYAoMrvDl4l1LB0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfwOWGtBPTwXPum0toKv42azmtvawkn4PnIXRnVwLyE=;
 b=gsomdR8YXplodM32SInvUTolDOpjomCxGeHQ2I/qFeFHlxG/GBeWEpO4zsCm3wCR4eyL7c19KsO7OUisLfyzSN+ZyC/2gw+POp84MSfKOVgw+pZNueftfB2iU/rDQM+9QrZqe+Qrgf7Yvzwt0gtBVBGW+9Oejn9RY4fC+aDwTKRtAmCyHp0lpUDizztDKOE9kZ5HCJG08o5X/MKwW+NDVgKOmMT6wiaoZxGMMySztTviILBtB31DeYxJntp+a3r3nwtzoqCWYIDFWAm2pDV5T5uwH40ciACenOCyQ+q8x+Ox3T9g5CaChwNoUuD5nDKDH6oC0B0elxHBIHMnVexVRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfwOWGtBPTwXPum0toKv42azmtvawkn4PnIXRnVwLyE=;
 b=YjBQruUAXRL/UGeMJXfX5FAOJb8+JhUoHUFLlJ8bZDA6usRDFBnvIXOUtvuMjcwq+QDf+Yp8Ekn1BNcME2Jw6pCv9lXjcU9W3h5DBg7Ca8mGN1PGc3yaZp4X83UOnh666Tc3FVh+Ca1TdBswp0bJxpoOz2gtyAPboquB/cdwoEAhZhKz5TCYBPXqY7NXppJrQ6ejInw6YDkTE8+r6yT/CDbVdxiCB2NUCuN02GV+vAHt3mKfgklGFj7JtMB9g3C14m+7ZcgOh+UpeQ7sf/tsGtUMAlZi2WAy56XwpnoStSNI5uEoiXTxqMhYhJg8iTvQRHebDFomDiHT4v28UswFeQ==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by SEYPR06MB8067.apcprd06.prod.outlook.com (2603:1096:101:2dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 05:29:04 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%7]) with mapi id 15.20.8943.028; Tue, 22 Jul 2025
 05:29:03 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "bhelgaas@google.com" <bhelgaas@google.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, BMC-SW <BMC-SW@aspeedtech.com>
Subject: [PATCH v2 03/10] dt-bindings: PCI: Add ASPEED PCIe RC support
Thread-Topic: [PATCH v2 03/10] dt-bindings: PCI: Add ASPEED PCIe RC support
Thread-Index: AQHb+smJ4A6F7+Uu40Oh+NzeT7dm5Q==
Date: Tue, 22 Jul 2025 05:29:03 +0000
Message-ID:
 <SEYPR06MB5134F7C1CEA391249D0E1AB79D5CA@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20250715034320.2553837-1-jacky_chou@aspeedtech.com>
 <20250715034320.2553837-4-jacky_chou@aspeedtech.com>
 <20250716-watchful-enigmatic-condor-0fc6b3@krzk-bin>
 <SEYPR06MB5134F8732785F280CB4339309D5DA@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <61ced029-987e-4484-9a0a-7c911518ffd8@kernel.org>
In-Reply-To: <61ced029-987e-4484-9a0a-7c911518ffd8@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|SEYPR06MB8067:EE_
x-ms-office365-filtering-correlation-id: 0497dfc1-6201-439e-ab81-08ddc8e0abda
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Undqc1JDL00wa0pMcTdVeVVRYVlpVWZaMi94QU5oQkE0cmNNanNRRE1JaSt6?=
 =?utf-8?B?WUtTVEh4YXdDMVJCQ2Q0SUdpcHczWFdiSEQ4SEJzZlFtNmtCTDdBbXBORUd1?=
 =?utf-8?B?MDFwbittand1ajJRQThKUlkwbTFwaU5VQ3pHWU85aFI0VmRxa3Jscm5kSWhF?=
 =?utf-8?B?bmNIZHl5RnBOVW1MMTVwV0pURG43UDc2ZEdhL3JTdngyTWZhMVQwaHFabkky?=
 =?utf-8?B?QmdUT05LTkQxU2JPU3E4QXFZRkx3Yk5lYlQwNVdhNzNhbGtsMk1QcTFiT3lo?=
 =?utf-8?B?MTJvVTIvbjE2UzRpbnU4Uy9MckkrMmV3bkk4bUIybEQvOTBOVmFVWmhmMlNX?=
 =?utf-8?B?dTZJUy9Cd1Bod2Q3Yk45U0h5bmluU1ZQQXdJbkp1NlNiclhNUHJSVk5KL01h?=
 =?utf-8?B?ZkZ3SC92YlloVzE2SFBIeHhLOFE0Y1FWYnl5ZjNKakZYRjFNSENoTGRscFpR?=
 =?utf-8?B?SkFhVEU5bVJXK2NkVTduMkFNRkJYdm1NenUxdll4L0cxNkNwVVAvRGNydDBN?=
 =?utf-8?B?MXc2b0V6UUFUTVcxNkVXV1FQc3pBN3NxTWh5Q0dwd3Q2djNoMTJsVVEvRi96?=
 =?utf-8?B?R1Z3WkRXTXF4K1JJRWc2ZElSUXRqaGVZcWRld0xzRllKMXFnOEFBQXhDRnVz?=
 =?utf-8?B?WVY5bEd1QkRSN1U4bFdXUzNJTllsYkJwakdWYnFtTytwVStZTWR4TytGVVNs?=
 =?utf-8?B?WHBocVJwZ3QvZk10K3N6NEhwRnVEaHlsaGN5QnR2YmIyKysrbHhqOThjNGpu?=
 =?utf-8?B?dk1MbmtIVmFXMzBpa29CMHUybkJBTi8yaEdMdzB0empCK1FFMXkwdm9IZitB?=
 =?utf-8?B?SUpkMXVXb2V2WEJvQ2RkUjd5OURXNjFpV2c5NzZLdGdjTUY4cVBCWmtKUEJJ?=
 =?utf-8?B?allQdWRIVHRCQUg4WnRabjExVnpGMmR6ZE1hT2dPT0h4ZXdnYlRkMm5tQVlT?=
 =?utf-8?B?WlI1ZXRLSDlwaTBjREV4K3ZwdERvbzIvMjJkZFFsN0ROb25OM0doOGFDcWxJ?=
 =?utf-8?B?QWx1cHB5UnNDbGVTOGcyM2pHdWxrdEZpV2pyc1pXWmRUOWZUZzJRLzZLZmlU?=
 =?utf-8?B?dHRDQklzTGlmTkdraUwvQXlxQTMwdzBqSWovM0dJWTZ2dUtKNlUvR3F3Wk1q?=
 =?utf-8?B?VFNFYlF4N1JOL0ovV2lhdjM3aUVnU3lGVHRzbkFSVDFiMUROZ1hIT3JPOW1u?=
 =?utf-8?B?dXErT05kU1JaVlVQUWJTdXhndGVqWkJiQ2IzUTJ3QTJWS0ZxZFRLVHpQWHhq?=
 =?utf-8?B?L3hsNVVFVkMyU1ZDb1dBczRmRFB3Z3lsOUJzS011VjlHckFmeXFmd1BSVHBF?=
 =?utf-8?B?bFFLR2hadG9ZL0t0ZGwrTmw0aS80eFRxM3V5dUJKd2V0Y1MxWWlQVkEvb1dp?=
 =?utf-8?B?emhBUkhLaU5UWnZhbFBFMTN4dEtydStyL0RVTE56cmtiM3I3M0NSNndCOTNs?=
 =?utf-8?B?eVBObDVnWE1HeE9tOW9uK0V5Y1VGN3ZDZGdXR1lUZjd1em5tMG9wekFRTFB6?=
 =?utf-8?B?WnNIQnNsREFYUEhrcWNleDNWdXR5SEVHdW5Nb1l4V0xwbSt0U0FDL3RSUFda?=
 =?utf-8?B?c2FSWVZGNHNNN0JxS0JsY0k2cDRvSGMyWTFWQmthS2VyWXNhdVFPTEUvcndU?=
 =?utf-8?B?UUZhcHpETW82ajdUdUMzWWFCQWJrR0F3MHQxdEEwN2JWVWVONnlNVVBTMm5Q?=
 =?utf-8?B?bkkvenVlMzNFZTJ1QXBCOFNhck8zZHU5WGtlcCt5OTRJdGZqN1EyVTNKVGYx?=
 =?utf-8?B?UTNTUTVoSHZqUWlQQllQVnFpMzFwR0xDSEhsOU92NEU3REpJSUpOOGRNUldS?=
 =?utf-8?B?cEp1dC9XblhRMEkvNVJnVnlWU1VHa2p4UkNyeENyNlFpVjJJS0Z0bVUzSmVr?=
 =?utf-8?B?M3o5TTRkNWpkYWR5bGZIcEExNzJlZjUvVE1BMUZrNXZzOTE5ci9tZnpSa2la?=
 =?utf-8?B?T2F2aC9LODEzUVhic2xCUFcvL2pKSFVhRy9YejYxbG00STNhb2NwYmNXZTkw?=
 =?utf-8?B?by9lU1pOdU5nPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?czUwZUdhSm5rd2NKODVPQS9sOTZhY2dUNzVQa1FZc2JqNnVrdzZ1eDFRc0Nz?=
 =?utf-8?B?VGxSU3BFWWRRY29ZSzRLQXQ1VDJvOXRod01GMjZDZll3S0JKSEpDS1ZMK0NP?=
 =?utf-8?B?Sk9zbHc5SlB4eTM5N01KWWhOSGFwWXQrWExLU1lpK2Z5VHdaYzFzQkxWd3ZV?=
 =?utf-8?B?b3E5K3JQdVlQTWdoQkhvRldjUVVuNVRYMnI4Sjk0a2RpWnArOEU1SWpEeHZh?=
 =?utf-8?B?a1NLNGFySDE1a0RLMXFGa2VqVW5sT1J2a0lvS3lhNWNMLzN5MzhQTUM0MnVi?=
 =?utf-8?B?OENPRTlzUHhsRm9PQURBV3NwVHJlbGNQcFltdWg4YXRyN1RRc0pVbFV4V2FJ?=
 =?utf-8?B?NFdtNTJocmlDYVZIS2QvUzJsdS9OdThpQitTcHJrQVVESFdMK2FFTTZXMVVS?=
 =?utf-8?B?UGlDNjJYa29PZ1dQVmx0R2VObUZBU2NkeG1zVWhDcGU3YTI5bytBWkFweWNY?=
 =?utf-8?B?OTdnSVU2Y0poRTdVRVNET0hGN25EUG9jNlAyUmp5eG5jV0xDakc0ZHIzZDlL?=
 =?utf-8?B?dmxidXV2S3BxV2JvQmgxZW5MR3VoSUJjK1VnSWt4UXdSVFNsTWxpWVZsRG5j?=
 =?utf-8?B?VFhMdU5YbForeDBGbTJ4K1U4SUJwZHFlYTIyVjBGNDdmSUk2cjFPZlhyMkI5?=
 =?utf-8?B?MU5qK2lEZmk5bldhZG9vSVErODN6NHVXTnBicE1waTYvVVZDZUljOUEzQ2NZ?=
 =?utf-8?B?N0JpVDQ4ay9HUUhSalhwK0JrV2pVWTFQM3Z2VXFJSFBTYkhwVHlVZGszd0ZI?=
 =?utf-8?B?Yis3OEdOenpodStWdVFkNWlMaE9pYWppSzdWVjEvcngwTWNFT3lFNEsrSFpl?=
 =?utf-8?B?NlR2K1VrakgwMC9zeDI4dk51NlAwcEtBc1pBbnJJbk1DUEk3YWJyMUc4N21r?=
 =?utf-8?B?bnRmaHMzNkloaC9OYi9uVFFRdllyM1ozRE1JM1hwb1pJdGZOSjkyV1hyZGJH?=
 =?utf-8?B?NCt0VWpjS3ArVlJSeDdlUDc3T3dVSDFIMzRDQjRDbHg1TUk5dENoQ3FXdVRE?=
 =?utf-8?B?b3Z0dDVJM3NhMDgwdHFKTTJ6NFA2VmdhbVFaVXd3cDcwd09xMXFUa0d5UjJk?=
 =?utf-8?B?YzR6bU02eHhXMmZWa2hqbmRvU2Q1Y3NIYi9VZElWK2plaFVjU1B5cTh2MkJV?=
 =?utf-8?B?bFZaZktpV1AyenozMXMvRCt2bFRwb2RmY0Rxang4L1BuMDNGeWZtbkhwRVlX?=
 =?utf-8?B?WEdQb1VmZDlvZEQ1RUFLYTk2VksxRUZBQURuUW1tbDRNVFE5RE0xWlFMcjZ3?=
 =?utf-8?B?YUtnRzVUMTMrNmNmK2gwVWlFRDVqeUN2QzNydnNTTG9WWVZpVkZ3Nlo0Wklu?=
 =?utf-8?B?UFc4SWxQNUVPWTJDd3dyZjhPZVpBZHJKdkZIcWZHL09ib05YTzhMb3ZJM21h?=
 =?utf-8?B?Z09oR0E5bHliRVJZYjd6c2RWdGQzL1lrNjUwbFQ0bjRCV2cxdWpLYk1PRXJm?=
 =?utf-8?B?Wi8wdmVNS1Q0Mmp1MERtOE1PZVpPVDhlSVpCNzFrZEZ5a1R2aXJEUGp0R0Zu?=
 =?utf-8?B?ZDNRejE1Mno3YXJPb2FvcG9CbU4rNGpNd01zeUMxdktxTDNybW8xSTdTZFor?=
 =?utf-8?B?VkZ5dGNNS1hwY2ppalhhbEVCSE5qdkZMWlgzUmdiQzhZZis3dXZHSVhzZmVI?=
 =?utf-8?B?ZnZ0ZjBFSnAzYmdYNS9MZXFZb01idERhTGp0TmpJVDR4aGVONmZJREFwT2VJ?=
 =?utf-8?B?M0lXSm10bVY5cnp4Q1R4dUdLQ3JHUFExcStJVHZFbitJbElVbG5aYS9HeWE0?=
 =?utf-8?B?VTVGYWhIRDdFckRsc1VLUmFNc25uaDlPOEdpY0hUNVJOaFp4UjVNb216ZUdo?=
 =?utf-8?B?dXd5SHg1N2JTYk4ySWVBUmw5ZitPeEJDUFo4cFR4SEkwdlJ1dFJyWGQxWk91?=
 =?utf-8?B?V2IzUStla0QwbWNlWmlxei9LS3lMVHEyMkxad0VobnhZV1FmUXZpckV0d3cw?=
 =?utf-8?B?QUkzV05lYkZpaWJsSE1ZS1JXRFp1ZzFFcVpscW9XQkZTQ0tnanhBdmhkd3J3?=
 =?utf-8?B?cmRiYUNZY0tZTm1xOHFPTmtiM0NtZE5jTXhXcFFLd0N0M05HY1F2R0Q4MEtU?=
 =?utf-8?B?VzJpM2FmRHFDaHk1V3FBcXJ4SmJyU1hhYnJ0UDFIMkdhK2dCUVhuY211SHkr?=
 =?utf-8?Q?EprOpVBkrWIONoiy13nyhC3hf?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0497dfc1-6201-439e-ab81-08ddc8e0abda
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2025 05:29:03.7631
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l8sTpw/rnmDH6e4PjHs5G7H+0OYWBpQeyteuldbRfwoLIEMjmc+qCzqKcquPZavGKsHGOTucVpqDCgHfarawV0tJB2vjTwPosr8JLQyN//0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB8067
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiA+Pj4gK3BhdHRlcm5Qcm9wZXJ0aWVzOg0KPiA+Pj4gKyAgIl5wY2llQFswLTlhLWYsXSskIjoN
Cj4gPj4NCj4gPj4gV2h5IGRvIHlvdSBuZWVkIGl0PyBBbHNvLCBvcmRlciB0aGluZ3MgYWNjb3Jk
aW5nIHRvIGV4YW1wbGUgc2NoZW1hLg0KPiA+Pg0KPiA+DQo+ID4gVGhhbmtzIGZvciB5b3VyIHF1
ZXN0aW9uLg0KPiA+DQo+ID4gSW4gdGhlIHYxIGRpc2N1c3Npb24sIGFub3RoZXIgcmV2aWV3ZXIg
c3VnZ2VzdGVkIHRoYXQgd2Ugc2hvdWxkDQo+ID4gc3VwcG9ydCBhIG11bHRpLXBvcnQgc3RydWN0
dXJlIGZvciB0aGUgUENJZSByb290IGNvbXBsZXgsIHdoZXJlIGVhY2gNCj4gPiBwb3J0IGlzIHJl
cHJlc2VudGVkIGFzIGEgY2hpbGQgbm9kZSAoZS5nLiwgcGNpZUAuLi4pLg0KPiA+IFRoYXQncyB3
aHkgcGF0dGVyblByb3BlcnRpZXMgd2FzIGFkZGVkIGhlcmUg4oCUIHRvIGV4cGxpY2l0bHkgYWxs
b3cgc3VjaA0KPiA+IHN1Ym5vZGVzIGFuZCB2YWxpZGF0ZSB0aGVtIHByb3Blcmx5Lg0KPiANCj4g
QW5kIHNjaGVtYSBkb2VzIG5vdCBhbGxvdyBpdCBhbHJlYWR5Pw0KPiANCg0KQWdyZWVkLA0KSSB3
aWxsIHJlbW92ZSBpdCBpbiBuZXh0IHZlcnNpb24uDQoNClRoYW5rcywNCkphY2t5DQoNCg==

