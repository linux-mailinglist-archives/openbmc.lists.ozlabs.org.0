Return-Path: <openbmc+bounces-477-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 001D2B2BA24
	for <lists+openbmc@lfdr.de>; Tue, 19 Aug 2025 09:05:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5gZZ222Wz3cnS;
	Tue, 19 Aug 2025 17:05:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2416::621" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755587110;
	cv=pass; b=Oi5KrA9DNaOip0dCuGHxmTOSN2I/tq1zjO+6p6ocLnWROY03qiOPe1UJY1Qwao9+K6yO7OBpb1WcRxPEf3glnaGVdf/RBKjJDAGnv0pamnm+5NhT8vz0AuJAWodW6I6Se5eWZSbzUz2cCke6wisujQzEd2IZ2ylUFLPNNjK1Rmu+h5m7+E1Gm5pnLhrQlfWkbBlZcveJfe51wwbBM0Wfd8dANz+qzYDTCtYVoPZ2tPQFGodO6ljWB7e0Y9H4tmRzI34LE3iRan7BpFb+mPjQahNho/6npOEVKbTkqDCIE5BDF+amgVV3xTEhrEAk2feqSzli4M8Qpio3dxDXp307Dw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755587110; c=relaxed/relaxed;
	bh=LZKxzjOfZbKKH89IxF7XUrb2EDB4qTWK9Fo07KDTedA=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=jdJbkOkxb9Nfv54m8Hvjy2/xzqVxcj32lcyD7eU2O98z8TgUlRdZ2vhET1JZYMEbZIxyNRa0LLcoyDbc24T5weSnNE4uWvqshRXRA/F2BnVUv9Nv+QGfZbOIDdOwjDy728GMy+d77EGef1POzJP9BpQPZo89PA4CU2YY+ftlH7sks3jLcJ2MvlsYdhOG6GMaJSbx/bw+jbiKqEtwbMLk3rMXaa97dpFnGewvm0CdSgXUvVF8f5833KLpqZTehP2fIAecdF7sbWaSn9eUTpTetBTeAZsZm/oqx8VnPJGmA2FZORSNm01WjXe9JaeOna0boYF093uMvd65nqhF2KwfAw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VfBypElh; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2416::621; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=ropai@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VfBypElh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2416::621; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=ropai@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20621.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::621])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c5gZX503zz3cj7
	for <openbmc@lists.ozlabs.org>; Tue, 19 Aug 2025 17:05:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kj+TghtIuYMj+evKaHcmazcgUYDcqew0ynI9fzff+fYu5iZwsNdbf8vg6B5kIoHcbL6boB2JC2hbsMoUA1oqoJWwb+0MRC89uTbG4mepEJFwMgHwYXpW0OYvHslgv+r63/9btu6bp+aYP+Wd6UcNEjTcFiQTVzMDrelS6bcZ2krD39lTwmOUjnEWOqCsxt1J9FNKAffGFvwgDxWdGfcrFEdSxKDUOX58fX9PAnxD7RIiHoy61Go6VeaERdCZCweCBikhFVBqDVwlI0rMLw/kkSMyZ8UTyBwyc0uSIN3ut4mNTHBLCgX3EId+uhgeLKl4qJYdsNSvZ/NodkbGq0E9Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZKxzjOfZbKKH89IxF7XUrb2EDB4qTWK9Fo07KDTedA=;
 b=KM1f+NkMLJhCiiTBFjQ9b3KG/YiTgNwcrtt37bOm1Rxba3m/xEXcvUw0z7RXERPov0rWvbjhcuxSL8vbL9CakSSePNQNF9o/A0Jh3LGXUoRJITn22RVtQFrQW/bfjqefuEvjIgtfIaZ4m7FoLMzqAx9SraGAp5G8bdLWYBzSiQ5rEQ7lbvhQdqblKcc2ZbNTiENdNtwh81dXZ9XBNjRrbYOsmJCQy6yL1Kb2Jd85pZzIUdkhgHMj7O7u/CDIn7FtlyXLg2/BDSxI1knWQxLYrIKdwLj9a+AfokIED4/q/5BCRsCTTBtt0jixYaPrSEZKSxOhLfIUhUm/6RE25gOI6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZKxzjOfZbKKH89IxF7XUrb2EDB4qTWK9Fo07KDTedA=;
 b=VfBypElhvJS2qEZ2rU9G7sReXGARt4k/i/eUvUFm9wEPfag7PSJBBr+QmoV8/i1JpO9RWn1em6VicNViiV5Lwf5++wwqNZQxS/FJbRrp4oq9cUT3K1yHKjHuPBBgj/SbqZwGXuB9LshzqEsMy3s3WcXgJd/OyCgjVN6W9ccq6JIREgD4jcpfyukE+iejF6qnqyDMQ11GwIM5ubDqAvfHvKVVF0LDls81OPTp5AqBLJdyzgSwSK5DqMPb5rgq8n8YFkP2Y+Vec9hdgty/PsWDOPM02OZLpK+XNN97OzXA1SC9MRLi+JvNlXLvnffLp57yqC211WtXs1uBEsDecSPokw==
Received: from IA4PR12MB9835.namprd12.prod.outlook.com (2603:10b6:208:54f::5)
 by PH7PR12MB5925.namprd12.prod.outlook.com (2603:10b6:510:1d8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 07:04:48 +0000
Received: from IA4PR12MB9835.namprd12.prod.outlook.com
 ([fe80::838c:eb24:4e94:ca6a]) by IA4PR12MB9835.namprd12.prod.outlook.com
 ([fe80::838c:eb24:4e94:ca6a%5]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 07:04:48 +0000
From: Rohit Pai <ropai@nvidia.com>
To: "patrick@stwcx.xyz" <patrick@stwcx.xyz>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>
Subject: TOF elections for 2025H2
Thread-Topic: TOF elections for 2025H2
Thread-Index: AQHcENZ4wGSKYYSDD0Kt+slNGwzW2Q==
Date: Tue, 19 Aug 2025 07:04:48 +0000
Message-ID:
 <IA4PR12MB983589C6511C24C3E84E0063CD30A@IA4PR12MB9835.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-reactions: allow
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR12MB9835:EE_|PH7PR12MB5925:EE_
x-ms-office365-filtering-correlation-id: bf2f2424-a376-4876-e8b7-08dddeeeafa4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|8096899003|13003099007|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?utf-8?B?c0FiU0JJbU1OYks1Rm82T2RHUWlqZjlUMHN2dUhDckxpdzJwYmZCVXNscWNR?=
 =?utf-8?B?UmJ0QXREazFDd0pQU0RvZ0VHTE1KYVcvMy85aUNtVmQ4WHZPeHpmY0dIMkwy?=
 =?utf-8?B?WXIzQ204WWVWT1JZYWY3MURiOFZ1OVNxaHN2aE1PdFlaZ0NubVdQbjBXeWhu?=
 =?utf-8?B?djhkczM0VTR6WkNyY1pwTFE2U2VaVjlQT0ZONmhsaGhYb1RDZHBmWitHNmEz?=
 =?utf-8?B?Ris1aTNxUUY1VE44TDBXY0lvenZmdmJidDh6VkhUeTBXaGg5cFdmL2s5UCth?=
 =?utf-8?B?MkpMY1lXeFpyZm5VbFBSR1NhTGdTQkRBYXYrYlI5K08yNTN1d05pdzRQb2I5?=
 =?utf-8?B?L2JPNGR6ODVOd1p4eVQyNnJJc2ZUclYvbmVUK2UvbTJuZGtlNzErRnIxZjYv?=
 =?utf-8?B?a251WUVBR1RyV3U4Zmh3YThjKytJdGJRbjZvUHRQZXBIWEk2M3B3VDB3TmJ4?=
 =?utf-8?B?Q0E4NnV4NUg2RlMrU3Z0N2lhM1JuM1FOckpoYnQ5K2dtbmZzcWNWTEFKb3Rw?=
 =?utf-8?B?U0c5ZVM3UVBVOWppM1BvT2hUN2NRUUlQUzF3RnNWMnRqVlkyTXBkbDFBdzNl?=
 =?utf-8?B?cUdObWJ3RkNZYncyc0FwVEFCTkZUd2JmSko4SGZRRFYrZTdYa09IeXprWU0r?=
 =?utf-8?B?WDErVytxbmZEOWo1RWZMTit5disxZzR4aFhUdHZhQ3BTZ096UWlRbHpxbDkx?=
 =?utf-8?B?MnRzWjVLWk1BZnNqMFkxWXRHT3hLVXVMd0RJWTlmKzB1N1RiWnJJQ3FsWURu?=
 =?utf-8?B?WElmVXQvRVNqTGc3aDFsbkhtUGFPNjFoaWNJR3g4d3QzZVBSL1dTZ3Bob1Zj?=
 =?utf-8?B?ZENuV3hWS3RyT0phbDljNk1CVG1RdHdtLy9wUldpR3g4RXd5MjI1OXJjZkRs?=
 =?utf-8?B?MTdCWnBXQ2hUN0JSa2R4OHhKZkMzaHE5K3dPK3NXWVhyWURjUUhmcXl1Qy9O?=
 =?utf-8?B?SzBQZmQ5dVA0VzcwREZXbFV2cDZaTTU1MzMwdU5Xb2M0YlpydEt3bThKTHVE?=
 =?utf-8?B?dUFpb0VqN0FLeEdWcldBNGRvMllIeW51QXJGQlBld0NzbW93Tk5sb253VVhS?=
 =?utf-8?B?aDhMSjJFS0pDNTY4NEFnSmtTK2JtNGhFTHI2bkxlS0xWYVlQSHdzUFc3d3Uz?=
 =?utf-8?B?ZXQzZWtqaWJCcWgwVXBoeVM2NjFiU3JERDdYYXZteVk2eDVwRkNNSi9jTllZ?=
 =?utf-8?B?L0tCeXI3VE41NTNJcHNWa2hEN1ZZKytwU1JuYytrb0NuTi8wVW9IUFlSb2FX?=
 =?utf-8?B?TUlleUd0TFRhOEFpZ2IrOE5VTzgxUWpkT2JjcXMwQWFadVlmK3dJRzVmN3FY?=
 =?utf-8?B?b01VMW9EWmV6RVp5S0VLUFVUcytTK01ta3J2bjBnQUdtaFU5K3doM2N5aXh3?=
 =?utf-8?B?RHQ0eExFRmp3MlVNMXJCRGZRLzBXQjFBYzZmYXpGeXVEd3Q5MklEQnJuTjhm?=
 =?utf-8?B?YlNhckFQRDFpVmtoQUE4bDM4QXoxbm4rQlpZd0FNQmxEZk52VVN0YlFFYXpP?=
 =?utf-8?B?ZDdPUWlyUGg4VlhuYml5MHdjUWJ0Y0pkWGRkLzZSUTI1UnQ5MEFxSStraG5q?=
 =?utf-8?B?aWlzZW1Eajl5Q3RTR1NnWmMzUEowK09md0VwYnh5QVZoYndkNHIyVGU3aEMz?=
 =?utf-8?B?WGhibTRhckJyU0lxcWxHSnRTaU9KdHdwQ05IT1pUamtLSmJEVnc0TSsrQXlk?=
 =?utf-8?B?VjJ5M2F4b295ZENLK1BUVXkxVEZYTEtnK3VTS1JEUmdvZk83MGkvaGFERE1h?=
 =?utf-8?B?ZUJVbnN0MlE4UWNENTA5Nk1adVFuQ0RYQVE5OFNacDlNSk1sR3pubndaa0VW?=
 =?utf-8?B?NHRpQ1BpdG1rQUNyOVBDRWp4MHRJZlNxcys1UmhwSy8zSWljckt3Yy9uNmpa?=
 =?utf-8?B?R2FnS1JxeUhlZG5aaDVMMXNaLzM3UXFNV2NkeE5teUU3czI5T3dCclkxSUxO?=
 =?utf-8?B?YkJKeWNzd1p1TGZwS0JuZG01dUFtU2pjQnE3NHZiL3d5Sk1kcG5VNU1NQkJN?=
 =?utf-8?Q?8zeY10UtOK6KfTy1m+X6B+Uty5AXnQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR12MB9835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(13003099007)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Wkh0NS96RCtkNk16S3RGeVNmTzFhZk4xZUhDc21ZVFlXV2Q4MTJtSVp5VERE?=
 =?utf-8?B?ajdJVmRRWXB3azJuWTEvQVg2WTYwTTBNOGc5cUkwMjluUzEyTko1YkgxTEpY?=
 =?utf-8?B?NGNUMGJzUCsvOWdqblJYRi9SZTNLa05vODZJQWpXbEZWaFJiRzg1TkVYQnVX?=
 =?utf-8?B?NkFXQm5xNnNVNEszZXgwRTNOaWh6c0R6dkF1Q3FSd0tNam5Wc3FYejlYa1lK?=
 =?utf-8?B?QVYwY1JuS2R1UWpDYndxMFlRb05ZWXcyWFBHbnI1R21CZlNOV1hJNTk1TmFi?=
 =?utf-8?B?SDNZcEZQR3IyeHZRMGpOT1QzcDlFZGIxUmlQd0wvNm9yM1FDOUxSWTkwRytP?=
 =?utf-8?B?SmVrWW5TczY1VVRIaHBzUjR2aHpQbFRUbXFCa0YyL0VjY0pKM1BPMHNJYWNV?=
 =?utf-8?B?TlVQbkUzN2ZKZXg0cWE1TlA2WkZaWVF5Qk9hMDdIUjN2ZXM1V3laU0VDTHJO?=
 =?utf-8?B?RGdkL2htdzFMM0Y4eXROVWNUSkZDaTNsdFNTRXBjZUxNVWtWeDBVaFFBdW5u?=
 =?utf-8?B?UVBOOGc1eU9FcFlnT3RGeU1vY3VhTTNqWUJuQXJwQ1RJRjllTkdGVG9ra2dD?=
 =?utf-8?B?YlkrNzd3ckJod2p2UmJhUGNmUTlld3J0VDNUdnhwSVVURHR3WDV1NlNoOVpa?=
 =?utf-8?B?Z2dPS2hiT2Y1S0V5amZNaGtsNVBubWwvNFlHUHlycHFraEUvUnNsbmRrT1l2?=
 =?utf-8?B?U0VadzhLVUpDTEZIRm5OTjBLNXdCRDdmaVhZbGdDZDlqaWJqZ1c1d2hIRUx2?=
 =?utf-8?B?ZWtUTGZOaExSSk1SVlRPSm1DZCtDMHhCQVZTbSs2Qm1WQTVZV1VXSDZrN3ZW?=
 =?utf-8?B?cmFiODV2VE9MRGEzd0pNVis0Y3c4N21rWjFndVhVenZFN0pWYm4wNTBXd2JK?=
 =?utf-8?B?UGZvRHV5M3FjRGIxOHZFcHdsVUJDMDl0bHNzNWVWNEdaZDdYM1krVDd4U2lS?=
 =?utf-8?B?Q1NtMXR5bXM3K2thWndQcExSSWkzU3l3M0JaN1NpVGUxRThYYW5hVll2M3lN?=
 =?utf-8?B?ZHBQZVZ0MWF6S2R2NUZsK0plR2YxdDhRNFhhMTlCYkNsRStWSFFxZ1dLOVhq?=
 =?utf-8?B?QnpFZzJ6dmtHNDRCNTRTVzArOERPVS8zaUZja1BEdGcxTm0xeUNRNnBheVYv?=
 =?utf-8?B?dmlKYzJ4RVdyb1NaZjk0LzA5YTVHNWZqVTB6Z3I2YWZhM3JmcUdNRDVPYlpr?=
 =?utf-8?B?T0VnV3czYUIweVF6Y3QraHVmb2JiWC9FWVVVeXl0NU5uTEVwNFlqRUNjQjlV?=
 =?utf-8?B?RDNzTnRnU1p0WFkwVzJzQnIvdGJLLyswS2lFVG9hS2FYYUpXQ01oeUIwWXhC?=
 =?utf-8?B?cjlPZG5ZY0RmWnowSHBuVEFXcjBUYWxkd1hMZ0RhR0hzMlRjdjhwZXc2K25n?=
 =?utf-8?B?Vmd4U3ZIVkE3aEpoKzlNRUxLMkpsdnd6ZERIelZUeVN4UlBhLzlLdHlORXBD?=
 =?utf-8?B?NSs1dmMxalFON0FSQ1RVak1aNDY5a2RZTmE0c3h0M2UvTDRhQnZKL3RmOFFr?=
 =?utf-8?B?MmFtSy9ubkR0RVdXTnlxcnNlSFVkVFI2Ni8vVXBkeDc5ZUQ4cHpqMnFlMEow?=
 =?utf-8?B?M1krRW9xN3V1WlR4c1dta2d0U0toN2VPSzlvdVAzeEsxV09hTTAyRVFLdU5X?=
 =?utf-8?B?UWpvWlJSYUZiVEU1NmdHK1c4TG83dHduUm81R0hXMmZXMGVwUFVrMzMrS1Yr?=
 =?utf-8?B?cHA5Vml2cFNESHJpK3lGblcyTEU2RXdXV044RTZlYmNNVkwyLzE0dWgvazAw?=
 =?utf-8?B?bmROaklNYXV5UFFEd0k0Tk43dEtzaWU5bTM4YmFGcHlVQzQzVnZlZVZHWFFp?=
 =?utf-8?B?VStrbDBqTEs3OXBLUklnWHdnRTlxTlg1RFUrMUxxekdpVGgvRGl4OVY5TFQ1?=
 =?utf-8?B?OCtWdnp2YkZ1eXJmZmxIcitjQ0kyR00vd25zd21BWEUrUFUxQk5icDRYaVN2?=
 =?utf-8?B?Y1g2TExZSWVwQU9FQUIwNlIwcExsd2Y2WXRGeEh0eXRxNjA2RGl2dFVlbnE0?=
 =?utf-8?B?M0J3VEZkVkZLV01sckNyRnJFckhjVGVSd1dVaXJGRTlNQVJabFljSFkzT0tH?=
 =?utf-8?B?ZEFjbExjaTFiU0lZV29DTlJFcHVsL0NUY0ZIUGVLdGlnL0FxSDcwTUwya0dp?=
 =?utf-8?Q?XkS/1ndpqjTyMN2ocKIUeA720?=
Content-Type: multipart/alternative;
	boundary="_000_IA4PR12MB983589C6511C24C3E84E0063CD30AIA4PR12MB9835namp_"
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
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR12MB9835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf2f2424-a376-4876-e8b7-08dddeeeafa4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2025 07:04:48.6582
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RpGydts+3zYXKhP/bs73ownkdREFW2GRWYAp7Nzqzacv5PGL2DwzfVIPNeiNXsQxLny6/5+NP7YAxMi2loN9Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5925
X-Spam-Status: No, score=-3.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--_000_IA4PR12MB983589C6511C24C3E84E0063CD30AIA4PR12MB9835namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8gUGF0cmljaywNCg0KQ2FuIHlvdSBwbGVhc2UgY29uZmlybSBpZiB0aGUgbGluayB0byB0
aGUgcm9sbC1jYWxsIGZvciBjdXJyZW50IFRPRiBlbGVjdGlvbiBpcyBjb3JyZWN0IG9uZSBpbiB0
aGUgbWFpbCBiZWxvdz8NClNob3VsZCBpdCBub3QgYmUgdGhlIGxhdGVzdCAyMDI1SDIgcmVzdWx0
cyBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy90b2YtZWxlY3Rpb24vYmxvYi9tYWluLzIwMjVI
Mi9yb2xsY2FsbC5qc29uDQoNClRoYW5rcw0KUm9oaXQgUEFJDQoNCk9uIDE5LzA4LzI1LCAxOjQ4
4oCvQU0sICJQYXRyaWNrIFdpbGxpYW1zIiA8cGF0cmlja0BzdHdjeC54eXo8bWFpbHRvOnBhdHJp
Y2tAc3R3Y3gueHl6Pj4gd3JvdGU6DQpIZWxsbywNCg0KSXQgaXMgdGltZSBhZ2FpbiBmb3IgVE9G
IGVsZWN0aW9ucy4gIFRoZSBjdXJyZW50IHJvbGwtY2FsbCBpcyBhdmFpbGFibGUNCmF0Og0KICAg
IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3RvZi1lbGVjdGlvbi90cmVlL21haW4vMjAyNUgx
DQoNCkZvciB0aGlzIGhhbGYsIHdlIGhhdmUgMyBzZWF0cyB1cCBmb3IgZWxlY3Rpb24uICBDdXJy
ZW50bHkgdGhvc2UgYXJlDQpoZWxkIGJ5IEFuZHJldyBHZWlzc2xlciwgRWQgVGFub3VzLCBhbmQg
TWFub2praXJhbiBFZGEuICBBbGwgMyBhcmUNCmVsaWdpYmxlIGZvciByZS1ub21pbmF0aW9uIC8g
cmUtZWxlY3Rpb24uDQoNCk5vbWluYXRpb25zIGZvciB0aG9zZSAzIHNlYXRzIG1heSBiZSBzZW50
IHRvIHRoZSBtYWlsaW5nIGxpc3QgYnkNCnJlcGx5aW5nIHRvIHRoaXMgZW1haWwuICBPbmx5IHRo
b3NlIGVsaWdpYmxlIHRvIHZvdGUgbWF5IG5vbWluYXRlIG9yIGJlDQpub21pbmF0ZWQuDQoNCk5v
bWluYXRpb25zIGFyZSBkdWUgYnkgU3VuZGF5IEF1Z3VzdCAzMSwgMjAyNS4gIFRoZSBlbGVjdGlv
biwgaWYNCnJlcXVpcmVkLCB3aWxsIGJlIGhlbGQgaW1tZWlkYXRlbHkgYWZ0ZXIgd2l0aCBtb3Jl
IGRldGFpbHMgdG8gZm9sbG93Lg0KDQpBcyB1c3VhbCwgZGlzYWdyZWVtZW50cyB3aXRoIHRoZSBy
b2xsY2FsbCByZXN1bHRzIGNhbiBiZSByYWlzZWQgdG8gdGhlDQpUT0YuDQoNCi0tDQpQYXRyaWNr
IFdpbGxpYW1zDQoNCg0K

--_000_IA4PR12MB983589C6511C24C3E84E0063CD30AIA4PR12MB9835namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6QXB0b3M7DQoJcGFub3NlLTE6MiAx
MSAwIDQgMiAyIDIgMiAyIDQ7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMgKi8NCnAuTXNvTm9ybWFs
LCBsaS5Nc29Ob3JtYWwsIGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBjbTsNCglmb250LXNpemU6
MTIuMHB0Ow0KCWZvbnQtZmFtaWx5OiJBcHRvcyIsc2Fucy1zZXJpZjsNCgltc28tbGlnYXR1cmVz
OnN0YW5kYXJkY29udGV4dHVhbDsNCgltc28tZmFyZWFzdC1sYW5ndWFnZTpFTi1VUzt9DQphOmxp
bmssIHNwYW4uTXNvSHlwZXJsaW5rDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xvcjoj
NDY3ODg2Ow0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0Kc3Bhbi5hcHBsZS1jb252ZXJ0
ZWQtc3BhY2UNCgl7bXNvLXN0eWxlLW5hbWU6YXBwbGUtY29udmVydGVkLXNwYWNlO30NCi5Nc29D
aHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtc2l6ZToxMC4w
cHQ7DQoJbXNvLWxpZ2F0dXJlczpub25lOw0KCW1zby1mYXJlYXN0LWxhbmd1YWdlOkVOLVVTO30N
CkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjYxMi4wcHQgNzkyLjBwdDsNCgltYXJnaW46NzIu
MHB0IDcyLjBwdCA3Mi4wcHQgNzIuMHB0O30NCmRpdi5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3Jk
U2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT4NCjwvaGVhZD4NCjxib2R5IGxhbmc9IkVOLUlOIiBsaW5r
PSIjNDY3ODg2IiB2bGluaz0iIzk2NjA3RCIgc3R5bGU9IndvcmQtd3JhcDpicmVhay13b3JkIj4N
CjxkaXYgY2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBs
YW5nPSJFTi1VUyI+SGVsbG8gUGF0cmljaywgPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+PHNwYW4gbGFuZz0iRU4tVVMiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFu
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVOLVVTIj5DYW4geW91IHBs
ZWFzZSBjb25maXJtIGlmIHRoZSBsaW5rIHRvIHRoZQ0KPC9zcGFuPjxzcGFuIHN0eWxlPSJjb2xv
cjojMjEyMTIxIj5yb2xsLWNhbGw8L3NwYW4+IDxzcGFuIGxhbmc9IkVOLVVTIj5mb3IgY3VycmVu
dCBUT0YgZWxlY3Rpb24gaXMgY29ycmVjdCBvbmUgaW4gdGhlIG1haWwgYmVsb3c/PC9zcGFuPjxz
cGFuIHN0eWxlPSJjb2xvcjojMjEyMTIxIj48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iY29sb3I6IzIxMjEyMSI+U2hvdWxkIGl0IG5vdCBi
ZSB0aGUgbGF0ZXN0IDIwMjVIMiByZXN1bHRzDQo8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20v
b3BlbmJtYy90b2YtZWxlY3Rpb24vYmxvYi9tYWluLzIwMjVIMi9yb2xsY2FsbC5qc29uIj4NCmh0
dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3RvZi1lbGVjdGlvbi9ibG9iL21haW4vMjAyNUgyL3Jv
bGxjYWxsLmpzb248L2E+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0
eWxlPSJjb2xvcjojMjEyMTIxIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iY29sb3I6IzIxMjEyMSI+VGhhbmtzIDxvOnA+PC9v
OnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJjb2xvcjoj
MjEyMTIxIj5Sb2hpdCBQQUkgPC9zcGFuPjxzcGFuIGxhbmc9IkVOLVVTIj48bzpwPjwvbzpwPjwv
c3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1VUyI+PG86cD4m
bmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdp
bi1ib3R0b206MTIuMHB0Ij48c3BhbiBzdHlsZT0iY29sb3I6IzIxMjEyMSI+T24gMTkvMDgvMjUs
IDE6NDg8L3NwYW4+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90O0FyaWFsJnF1b3Q7LHNh
bnMtc2VyaWY7Y29sb3I6IzIxMjEyMSI+4oCvPC9zcGFuPjxzcGFuIHN0eWxlPSJjb2xvcjojMjEy
MTIxIj5BTSwgJnF1b3Q7UGF0cmljayBXaWxsaWFtcyZxdW90OyAmbHQ7PGEgaHJlZj0ibWFpbHRv
OnBhdHJpY2tAc3R3Y3gueHl6Ij48c3BhbiBzdHlsZT0iY29sb3I6cHVycGxlIj5wYXRyaWNrQHN0
d2N4Lnh5ejwvc3Bhbj48L2E+Jmd0Ow0KIHdyb3RlOjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJjb2xvcjojMjEyMTIxIj5IZWxsbyw8bzpw
PjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iY29s
b3I6IzIxMjEyMSI+Jm5ic3A7PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PHNwYW4gc3R5bGU9ImNvbG9yOiMyMTIxMjEiPkl0IGlzIHRpbWUgYWdhaW4gZm9yIFRP
RiBlbGVjdGlvbnMuJm5ic3A7Jm5ic3A7VGhlIGN1cnJlbnQgcm9sbC1jYWxsIGlzIGF2YWlsYWJs
ZTxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxl
PSJjb2xvcjojMjEyMTIxIj5hdDo8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj48c3BhbiBzdHlsZT0iY29sb3I6IzIxMjEyMSI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvdG9mLWVsZWN0aW9uL3RyZWUv
bWFpbi8yMDI1SDEiIHRpdGxlPSJPcmlnaW5hbCBVUkw6Cmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVu
Ym1jL3RvZi1lbGVjdGlvbi90cmVlL21haW4vMjAyNUgxCgpDbGljayB0byBmb2xsb3cgbGluay4i
PjxzcGFuIHN0eWxlPSJjb2xvcjpwdXJwbGUiPmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Rv
Zi1lbGVjdGlvbi90cmVlL21haW4vMjAyNUgxPC9zcGFuPjwvYT48bzpwPjwvbzpwPjwvc3Bhbj48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iY29sb3I6IzIxMjEyMSI+Jm5i
c3A7PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5
bGU9ImNvbG9yOiMyMTIxMjEiPkZvciB0aGlzIGhhbGYsIHdlIGhhdmUgMyBzZWF0cyB1cCBmb3Ig
ZWxlY3Rpb24uJm5ic3A7Jm5ic3A7Q3VycmVudGx5IHRob3NlIGFyZTxvOnA+PC9vOnA+PC9zcGFu
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJjb2xvcjojMjEyMTIxIj5o
ZWxkIGJ5IEFuZHJldyBHZWlzc2xlciwgRWQgVGFub3VzLCBhbmQgTWFub2praXJhbiBFZGEuJm5i
c3A7Jm5ic3A7QWxsIDMgYXJlPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PHNwYW4gc3R5bGU9ImNvbG9yOiMyMTIxMjEiPmVsaWdpYmxlIGZvciByZS1ub21pbmF0
aW9uIC8gcmUtZWxlY3Rpb24uPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PHNwYW4gc3R5bGU9ImNvbG9yOiMyMTIxMjEiPiZuYnNwOzxvOnA+PC9vOnA+PC9zcGFu
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJjb2xvcjojMjEyMTIxIj5O
b21pbmF0aW9ucyBmb3IgdGhvc2UgMyBzZWF0cyBtYXkgYmUgc2VudCB0byB0aGUgbWFpbGluZyBs
aXN0IGJ5PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4g
c3R5bGU9ImNvbG9yOiMyMTIxMjEiPnJlcGx5aW5nIHRvIHRoaXMgZW1haWwuJm5ic3A7Jm5ic3A7
T25seSB0aG9zZSBlbGlnaWJsZSB0byB2b3RlIG1heSBub21pbmF0ZSBvciBiZTxvOnA+PC9vOnA+
PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJjb2xvcjojMjEy
MTIxIj5ub21pbmF0ZWQuPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PHNwYW4gc3R5bGU9ImNvbG9yOiMyMTIxMjEiPiZuYnNwOzxvOnA+PC9vOnA+PC9zcGFuPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJjb2xvcjojMjEyMTIxIj5Ob21p
bmF0aW9ucyBhcmUgZHVlIGJ5IFN1bmRheSBBdWd1c3QgMzEsIDIwMjUuJm5ic3A7Jm5ic3A7VGhl
IGVsZWN0aW9uLCBpZjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxzcGFuIHN0eWxlPSJjb2xvcjojMjEyMTIxIj5yZXF1aXJlZCwgd2lsbCBiZSBoZWxkIGltbWVp
ZGF0ZWx5IGFmdGVyIHdpdGggbW9yZSBkZXRhaWxzIHRvIGZvbGxvdy48bzpwPjwvbzpwPjwvc3Bh
bj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iY29sb3I6IzIxMjEyMSI+
Jm5ic3A7PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4g
c3R5bGU9ImNvbG9yOiMyMTIxMjEiPkFzIHVzdWFsLCBkaXNhZ3JlZW1lbnRzIHdpdGggdGhlIHJv
bGxjYWxsIHJlc3VsdHMgY2FuIGJlIHJhaXNlZCB0byB0aGU8bzpwPjwvbzpwPjwvc3Bhbj48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iY29sb3I6IzIxMjEyMSI+VE9GLjxv
OnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJj
b2xvcjojMjEyMTIxIj4mbmJzcDs8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj48c3BhbiBzdHlsZT0iY29sb3I6IzIxMjEyMSI+LS08c3BhbiBjbGFzcz0iYXBwbGUt
Y29udmVydGVkLXNwYWNlIj4mbmJzcDs8L3NwYW4+PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImNvbG9yOiMyMTIxMjEiPlBhdHJpY2sgV2ls
bGlhbXM8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBz
dHlsZT0iY29sb3I6IzIxMjEyMSI+Jm5ic3A7PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+PHNwYW4gbGFuZz0iRU4tVVMiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFu
PjwvcD4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_IA4PR12MB983589C6511C24C3E84E0063CD30AIA4PR12MB9835namp_--

