Return-Path: <openbmc+bounces-1337-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCqSCToQiWnG1wQAu9opvQ
	(envelope-from <openbmc+bounces-1337-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Sun, 08 Feb 2026 23:37:46 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A10B10A7C4
	for <lists+openbmc@lfdr.de>; Sun, 08 Feb 2026 23:37:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8N3p5Jnkz2xqk;
	Mon, 09 Feb 2026 09:36:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770366167;
	cv=pass; b=jDjCSbYjAywcl1ETZon+uA0iqiDMDhqFiJr43hU5ciunQTSbQJMoQPxaF3Js/3rDejD1/V00o1ApbqbNeUfZRvzUvWudv/U61lDVorjZyXZHUawngwLrcOkuWU0fXvj709tpVaOLmt7JciF1B48F/1lgr8187V89jFhERjRPRFqsNzLK8I1Y1UlBTNpejUYsXnjkmhlbwNC3oFS+J3SjBHkLs/iZKID32F+9DyWJYJIVo/1KUm4OmXWCQx02uLpc0mrSt2LEggFK+cHsQOGcF4KXwmCGniwV19mEXelxXxi/cdudICKa8KfkRY+Nmq9P/YKfVxK2IHPiRDxLDntwWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770366167; c=relaxed/relaxed;
	bh=yQaUVtsV5eZKPc/Ggg63SLB17LC3PhULQJu28QTXL94=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=KOey2GPqxHx6mnUCiFUidlqKRDJ3XWEsR12CpuOROn4q/fz2UdoiLbEwgryynIUTVdqButbOovMO0aOVq+CAKVerRN7hXbDcnVmseUIbfZzCninmgI35wMcDeTxUat9EjrGzQ/mQRmByGJ3hbEhOl418qCc5lw3xZMFaGuEf6Z/29tqFQWwXE47huksVLSWl/ivOryYpH+FFd4mTVFiYlX4ch43MajMlA9PiHuBnwB0A6Y4KO9AIn2+6torwTvajuhAlu7TXdvy02JkY+spoZaFlTtCs/IS0vR4JZOvE6AM5EcbI2y9UHb8GlOuHvn10EKduOcdI2z0yW26ZWHzpNA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=bz/EGjWm; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=bz/EGjWm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org)
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6nCC0DKVz30M0
	for <openbmc@lists.ozlabs.org>; Fri, 06 Feb 2026 19:22:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y3FPu4oh+yGr/EfTL7Vrt7QADxT7xOLlApIlnuDGhJE1nDYuRf+mI09kzcBYK+QBat0bc4sQNzYw2JGrKIe2iclghrZjloepi6WuD8IE3XBM6uIp+Ccd4uSXHVhQQYV9frsrJSYUbbVzIGDw1WnN61ALR4h8kklCLk1gv2fo8hVjz7EQrndAHSeDoZuOVvzLJev5pMDPeEXWGxNggPe0IP06KWSuoaTROsWPwFGHl3VgIVp6ved9zFKXI+e0PFr2nDUfrK+oTc+/cMX8AK4EQh6MKRVGRjDumcjpyhLh+j5jJ6NaDnt6rSv6m/heSXmKHiV6HVoSvM//nzxyEEjHhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQaUVtsV5eZKPc/Ggg63SLB17LC3PhULQJu28QTXL94=;
 b=yHWq2hcf8F7ope8+OfbXZKysq33ndP83cLDQN6hy0HAw43jvXDgyowL6kMtFGfR/vJnGkbVkpIwsPLrBw8Jl3Mpp1VWMiNZp5K88Q7jLwdcB59XYe9JdsJ8HNkFe0Gzdyn+FsXjtZJUnZD23p27jk/v0DtF8qUiewDkrfX8XKwOFgb1gWvSWJzaXuKwMSoeG4qEATmcXGOVpZYmV4Ed94EU8PNnUVey8InlYTWMIDnNa9iuzSudqzJJUV5ArHOydD8zI4VQq3uRrnEM4xuLnr/YhtIs7rduXD3eaUv+mv57Jej8OwkGLEidjMGpptnSh8HDGFqjQruxPKu2ZQfjFmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQaUVtsV5eZKPc/Ggg63SLB17LC3PhULQJu28QTXL94=;
 b=bz/EGjWmeNBN1p2q25rUAWSKOfLTBKPdwkMaylbkNFkpweQh1obnbOr5/iNDiCSgigNS8wQnSehgrAvyG0KNX8ONJ5SVMQyb68+iwT/svj+6W4igiInVlawzli/fhpv+jbOV4bDZNjJlAVbAWyW54JqpDP9vsoowbXlkHrPYJA8SVkhMkJOqH8UJAWwMwVotw5qGRmIH4HDOgmnOad9q1AZz43OCfiZXQdN6aWCMVMdfPXen2PofXZ6olFjMg8sn/Fv+6b3nvJ2MpYrwF3iHwaqyvivh/fbsrT7XjOyWdcZvvZk+xglxNzgThcKAeignop8kdX8hqM3flEZx+S4ckg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from PH0PR18MB4558.namprd18.prod.outlook.com (2603:10b6:510:ac::13)
 by DM6PR18MB3667.namprd18.prod.outlook.com (2603:10b6:5:2ae::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 08:22:20 +0000
Received: from PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311]) by PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 08:22:20 +0000
From: Tzu-Hao Wei <twei@axiado.com>
Date: Fri, 06 Feb 2026 16:22:09 +0800
Subject: [PATCH v2 2/4] phy: axiado: add Axiado eMMC PHY driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-axiado-ax3000-add-emmc-phy-driver-support-v2-2-a2f59e97a92d@axiado.com>
References: <20260206-axiado-ax3000-add-emmc-phy-driver-support-v2-0-a2f59e97a92d@axiado.com>
In-Reply-To: <20260206-axiado-ax3000-add-emmc-phy-driver-support-v2-0-a2f59e97a92d@axiado.com>
To: SriNavmani A <srinavmani@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Tzu-Hao Wei <twei@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9234; i=twei@axiado.com;
 h=from:subject:message-id; bh=XTDIF1da24JB5QFFJCOouIbpzH8ph5S2EmF/RAzCbeQ=;
 b=owEB7QES/pANAwAKAXgQMF3EWvHXAcsmYgBphaS5oIwXbgXd6c66r7J12ZIKxpG7oPionERk7
 bzW4XCg6g2JAbMEAAEKAB0WIQSZyWINOowtFmDvdYF4EDBdxFrx1wUCaYWkuQAKCRB4EDBdxFrx
 1wI+C/9nbebu7Y3iM2AdL1gsMbxDGHt3yAHvEbodabmM637ABzqSfh/3DT+PSPo5aHpid9pXf2F
 flqWGLA8eS94X5LgI3jlCOE9WpSNBjgTV+5+RoJLVHDyu78Myfkvgd7KcsQJD/YK/T3utr3DYML
 nZs3Rcchk+A0mp9g2+hPn4bm15eESC+eEEzCK4TGZNjaUyshs8JlLfl85OVy3BNsBcMCscfpwML
 vjAQyr1TJfBUrwv4UGWP07dU/1FZK+J1TBllQXjO+BzH9Bxamz0BtJgAc+x2+iVry9MSOcvamrc
 S3cwYx/4CT6HjcTofbNoJPFG4issEj1TpWRMtXex76UIMClMILYlJEMERSQK4bwRGWmSy8bLgwS
 ujSuPm1Qgi//x1cyqiFh5SrEMaO2SJZqfRK/wzHbwsSrSeh+nM3RK4hFiFC7TLz6rxVLzwxNplO
 PAdqolvP19au2mvwp4JmtMPdVzoWbVzf78wE1D7Im77HMuc5J+ygWnL5HqEic9Q7a4YyI=
X-Developer-Key: i=twei@axiado.com; a=openpgp;
 fpr=99C9620D3A8C2D1660EF75817810305DC45AF1D7
X-ClientProxiedBy: PH7PR17CA0044.namprd17.prod.outlook.com
 (2603:10b6:510:323::15) To PH0PR18MB4558.namprd18.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH0PR18MB4558:EE_|DM6PR18MB3667:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d3f091a-0e1c-4e33-b8ca-08de6558d866
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|42112799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MlRtNHdBbGZ4cnRTOVY4dXEzY0RPOS9rOGRVRXRQZnlTMWMxa2ZBVFpLdWpD?=
 =?utf-8?B?Wmo4N0pSR2dVeWJ6dEdpQVYzdnRKSWJkVWNVSGdyN2xNNncrWGQ3VENIcGd2?=
 =?utf-8?B?aVFaNWd1cVRiNnArZmtkc3VYdnNTWEJpelh2Y29hcmx3c0g1TWxNSDJidVFx?=
 =?utf-8?B?WWg0bm1kOFlwRy9tWFNaeGx0anNETzlMWEFIK1AybDhJUHRHYzJGdXV0aWE1?=
 =?utf-8?B?aFdNKysyRmFJV0lGcmNPSXVUZHJuT2I2SUFwNXhoMFJ1Y0J1SVBZWWhwWUZn?=
 =?utf-8?B?UTlxdnByMGZ0SERmOENQNFNOWEltK3N3RWdaSlBqLzZUeUFRZTlDVGRWaVI0?=
 =?utf-8?B?a3hHRTNjWEc4R3JOb3Y5eGdIMVkvSE9kaHNoNzlPSXFyUFdRNTdKaS9xT1Bv?=
 =?utf-8?B?ZHEzSEQzbWFJaEFjUWhLS2hpK2NQM1o0T3ZHRW5ib0lwSFRDS3R6TnFEc2JJ?=
 =?utf-8?B?SjdhYUtOSHp2Zm13cEVlNG9Qdmo1OHVSWHZjdkt5elNCTDhYcEg4SWxlSkYy?=
 =?utf-8?B?VU9qQlhBUEw0QzA1ZWZFSFpmK3A0Wk02WTVudThNdExnVG5nQ2VNcENZMXdW?=
 =?utf-8?B?M3FtUDNiTVh4SDdJd3I1RkpmS1dGR1h1T2xHblBFTzI1TWRUMGd5ZDRlNEVn?=
 =?utf-8?B?THZwanhNM1c4K3puU2tqSWxYR1BpY2w0SUxoaWVSYjIzaitndGY5ZjJ1N2Zr?=
 =?utf-8?B?RWpXWjhmbXVQdFdabnBCRHU2eTNBNkc1djJwcG5HOVE4Z1dUd1RJOW05N2ZI?=
 =?utf-8?B?UUJjWjUrdFF2eG5IT2FmTUdaMWo2Q01jeU9TUHNXelp6NjFRQ2thQndTOS9t?=
 =?utf-8?B?LytwcW1Bb2NqdmpJMC8wUForVDIxTHc4ODBiUUVsU0Y0YUpoTWZPeTJ2MTQz?=
 =?utf-8?B?eW9zSEI0dURobU5CY1hPZTFQSk9EYnkzNEsyWnVIR1I1YmJkQTNiL1cvL2ND?=
 =?utf-8?B?TjJPUFF5THFiem9sQjlmYzNMWGU4bUFWMXhMdzlXL21hQ2czYUV1OWZhSTln?=
 =?utf-8?B?OXQ2Zk1TbzlFN2ttUFFKZVJ1R0xYbWcyMnYrOHJvODVrRHV2VUs3V1BkeGt5?=
 =?utf-8?B?Y0ZPbDFsOTVYQVNPbitETWEvUzU2T2RPOEVnK1RvUjdrWjhYUFBRL2xseXNv?=
 =?utf-8?B?ZjVqbmszSy9VbjF1KzZ1MGorclVzTE9KV3lWRXpmVHB2VldDOUh5dnVDdlBp?=
 =?utf-8?B?R2ZzZVRRd0pqOHRKSXZ0Kzk2N3dnWWx2dzMwUXY4V1Q5WGlCR0hGZWVXRTJa?=
 =?utf-8?B?N3pzRVRnR0ptd0Z1RHV2UTNuMmtRSjhENW9Rd1pidDFaeEoveVVabG5SMG9Y?=
 =?utf-8?B?WE1aWlRwdHhGYkVvbnpwSmQ5b0NlQ2N6ZFowUG9vcll1VkRNdlVoQ0FSUEo3?=
 =?utf-8?B?dnpOcGhJaXFSTVZ2clRaaGlzY3VHd1BYWGNGNU81TnlVUWhDUlFDM3RLeXdt?=
 =?utf-8?B?djBVOXEreVNyTms3eTJuNXlndVR6d2N6YjFRRzNWVkdxM1lJVHlsL09weEFn?=
 =?utf-8?B?bmwyZy9hbHJmd0k4VXB5bVhDUlFOVk16OXk0M1lKUXZlUThvQmw0OXJXMHh3?=
 =?utf-8?B?UDdiTEx4dWFZT3RHenRuNTk1dFFLT25yNHkwWGhRTHNLTWpZOVBsYS9Fa3dz?=
 =?utf-8?B?eU1WanpYcHpKb2ZYMEFsT3VlS0VxM1laOUhQaUxZb1lBZDNrcC9QMGhkTlBS?=
 =?utf-8?B?bjFpN0FZK2V6a3QxajhzMXlaWFVHbUUwclZWb2I4bFV3ZzlPb2wvbGNmSU55?=
 =?utf-8?B?WkJkNUFicFVtL3c0RVFjM1U5cUtpZlBWdzZUQU9jZzdhWjl0YS9OcVQvN1Rm?=
 =?utf-8?B?WCtPdDR3QVJRWVhPMkZmZnBSUnZmSFZlOXZyNGlqYStrcHlKN0V0QzlDTVQ1?=
 =?utf-8?B?aDduTldoanVpdlphK3pjdWJvbFlJOVRLTXcyNW9EWUJwaGIzSHhTNVc1U2wv?=
 =?utf-8?B?QUM0b0hxQUptNmRuMzdpYUhIb21IS2xiZ0MwN1FRakd3RjVKc0lDL2RPaitT?=
 =?utf-8?B?Uzdrc3hZeEx1QXZYdWd0K0V0VnFNYmR0RjdGZXpRa0UvWm51UEJFT0pvV1dH?=
 =?utf-8?B?UEo4ZkZvaUZ6Rm9iQXk4UmVtaU1tUEJFZmo2K29xeGIvaTlZdjhIZUhNS1hR?=
 =?utf-8?B?dEVpS1pVcFZtbkRCRngyblovd0ZTTkVHWHN3Y2YzU2ZoV0p3a2lCS3hUaS9y?=
 =?utf-8?Q?uFQFXSczoC9JydAZpOZtyv4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB4558.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(42112799006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZG1xeFp2ak5QNGZBc09ESkc2OTFleFZ4QmljenlnbjE4VGVwaWNlS3o1VU5U?=
 =?utf-8?B?bTZ2N2Q5Zm1BVHhoelNHWnNHaUdtdmdFRUFQb2xoYnJBZE1rOEduWnp6UFZU?=
 =?utf-8?B?WFhPTTduaTk5OWxBV2oweVFVMnNrZXQyTENGLzdXMUNoaE80VkZ6MzZrWFRi?=
 =?utf-8?B?dCtaaVRYWkpLanFDSVA3S1ZheFFGTkE4QkU4bFJyT3cyNEtsMmMrd1plSURt?=
 =?utf-8?B?STVLWGN6TWhrTmdBUERSK3htQXh4T2phUHY1Y284ZEFVWWxPYkorWGxTYzN0?=
 =?utf-8?B?TC9SV29QcVVBRUhHQUJwSER5dWcraC9ZYjgvcnI1aEpkcUp3ME1IOHF2bU8w?=
 =?utf-8?B?ZC9VT2VYMTA5WGJXUUkycnIxRWl6VUlwTWpSdkNZclJHWlhPbDczYlpyWTFF?=
 =?utf-8?B?UWNUVGdoQmY3Vk9GUmlQWHc5d05QVmNLM0F4TnN0U292NkNXQ3o2QytqdXY1?=
 =?utf-8?B?OXF1N1Exd0t1RzBKZklQUTJPK1JjSG0xeExRL3NWNy9QN0UvN2QxZmltTWEr?=
 =?utf-8?B?QkpLQ1UrS0c5M1pDUUxnbXc2eG9kZDZEZk82cmx3bzMya1N6bXRLYWxWNWhZ?=
 =?utf-8?B?cW9DQThoTHVoT1dRZDlyR3NBNzltYnFYRWxJL09XTFNMczVsVjhFbVRpS2g4?=
 =?utf-8?B?UUYybTlRanQ0WTV5NFk4U1JSYStDb3ZKM2NFZkN4UUEwTU5GeDBxMjRGQkRz?=
 =?utf-8?B?NmhBb0NVOXczSEh5WTdxT0F0UU9QaE13ZkVoNTNZaU85a3MvRWJHcHNmdVc3?=
 =?utf-8?B?am1QSWFxTFgvU2d2T1NPZllHeTMyZDBPQ2RFeGpibFkweTN6VG15RkJWbjUz?=
 =?utf-8?B?ejlqMmEvL3pIRGdUb1QzMVlBbm1FcmN4WE1yemgzM1ZpQlM1QVl3U0ZLR1ZC?=
 =?utf-8?B?Y2JUa294N25ndmtZZDhTVzQ2ZThtNjZRMWVLM2tzZWw1QjM2bitTd1lBcEc2?=
 =?utf-8?B?K3JEWjhNZTYyRFJjQ1BmRisrMll1cndWZ3J3anIxa2RHaHdsRnNDUlUweHpU?=
 =?utf-8?B?dHZ6eWQ3UkJpSjEyU3FBbUhaTHZvNVB6R1Z1blpPb2RsdHFKaHB5VlhHK1kz?=
 =?utf-8?B?b09JaWVPalhwaUg1VGpGYWlzRWlPSXMyVS96dFRlUm4xWUN4US9TU1g5U09I?=
 =?utf-8?B?OXVLK3ZyQlJrTDdOek44UVE5V1RMbzRRK0kvY2x1bHUvdytXYndEbHlHWmo4?=
 =?utf-8?B?d0V1c1Eyc0V2V242ZGdMTmZPYkxTejlZalRndkV3Q1lwN0p2czY3KzBNSnNJ?=
 =?utf-8?B?Zno5UzY5RmY1bWprNDEwdVM4c2pGN3F6VmpSaUJnZDVML0VKVExxSzBEUWZJ?=
 =?utf-8?B?bGNDR3NlZkZSTWVZVkFMMmhPOVdZQ1R5SW40eS9ZekhlSUtFZGFwemFqcGNJ?=
 =?utf-8?B?R2JzcnRyTnp0bDgyU3BndGxHRTZVS1FoN2djUE5QMUt5b1F2VXVYQzJIaUoz?=
 =?utf-8?B?Zy9uYk9yTjFrMWgvNDJaWlBCTmVPZ0xZT2dVN0Urb1EvblVLaUNGaFBTcmVk?=
 =?utf-8?B?US9wRG5FRmFmdEQxQXRUS0tUeks0Qy9SWVE2ZkdncWlFUEZ2QjYzNkxycFQ2?=
 =?utf-8?B?ZWE1bHBtZ21MNkJkUG16TGY0NEozYUZIWDljWUtDSktWK3U4NTVyaTA1aC9r?=
 =?utf-8?B?MGRzbWg2Z0JtUGFQNjVFa3dFdlg5eS9mek04dTM1Q3UycEJaMW93cVZYSldP?=
 =?utf-8?B?VC9GMlhoN0E4SEw4OEV6Vkk4eWNzU3N5MGE2N3FPTGkxamdIa0d6blR1cVRj?=
 =?utf-8?B?Z1JPMUh4cjBaYjhqNkVQUzFyK1B0eGRZVHgxMWQxd3h2UGtVNjJEY2pKV0ox?=
 =?utf-8?B?WjkxVUxHVTlRVnp2MVJPb2huMk9wZTBQUjhYS0h4Nlhmbjc2MGtTcGZhVlJJ?=
 =?utf-8?B?Tk5Xczk4YmhhSFdEWmJ5eFo2Rkw4MFZYZWZFdFZjOEdjMDBRaDZTV2ltRmlO?=
 =?utf-8?B?d3R6TVR6bVM2WW9xbUYvODlpZS9mME01dHVqTFBkcmNaN2I5cGRGRTRXQmpU?=
 =?utf-8?B?ODZLNGk0eENMdkZqRkdKVVU0cFlJYVN2YzkzNFIvalZTSGN5OUtOYW01dW83?=
 =?utf-8?B?NEkrNDdnL1BrYS83M2VoWXRhT2trdktLS2ZaVy91UE9pdkQrTTlZY2VWaE9x?=
 =?utf-8?B?ZnpSNFpDeGtuNGROZHFGZ2RzdWhJYnlIVXBIZmRBU0hiZ1lsblhKcis0eklP?=
 =?utf-8?B?aTZtNXpJdnM0Z1hlQVF6ZEdvbTF5V0t6Zm5kWkR0RkFlOWVBYkJHdFY3a1pn?=
 =?utf-8?B?M1k0MkxHWjFDR0RNWmRJcFhCa0dxbTYrb29HNDhQTG5LYktqME5aWUVrSWlm?=
 =?utf-8?Q?FflA7Ba/8fDp5IUmbA?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d3f091a-0e1c-4e33-b8ca-08de6558d866
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4558.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 08:22:19.6691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8WPyxyYopPvFDyfPYaSCeiYgQRlvQBnvfCHHLj8MaCgt+8qBd2fj6U1sMqf1Lnc6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3667
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.80 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[62];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[axiado.com:s=selector1];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[axiado.com];
	FORGED_SENDER(0.00)[twei@axiado.com,openbmc@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:srinavmani@axiado.com,m:pbolisetty@axiado.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:twei@axiado.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-1337-lists,openbmc=lfdr.de];
	DKIM_TRACE(0.00)[axiado.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[twei@axiado.com,openbmc@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.912];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[openbmc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,axiado.com:email,axiado.com:dkim,axiado.com:mid]
X-Rspamd-Queue-Id: 5A10B10A7C4
X-Rspamd-Action: no action

From: SriNavmani A <srinavmani@axiado.com>

It provides the required configurations for Axiado eMMC PHY driver for
HS200 mode.

Signed-off-by: SriNavmani A <srinavmani@axiado.com>
Co-developed-by: Prasad Bolisetty <pbolisetty@axiado.com>
Signed-off-by: Prasad Bolisetty <pbolisetty@axiado.com>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
---
 drivers/phy/Kconfig                  |   1 +
 drivers/phy/Makefile                 |   1 +
 drivers/phy/axiado/Kconfig           |  11 ++
 drivers/phy/axiado/Makefile          |   1 +
 drivers/phy/axiado/phy-axiado-emmc.c | 221 +++++++++++++++++++++++++++++++++++
 5 files changed, 235 insertions(+)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 678dd0452f0aa0597773433f04d2a9ba77474d2a..b802274ea45a84bd36d7c0b7fb90e368a5c018b4 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -103,6 +103,7 @@ config PHY_NXP_PTN3222
 
 source "drivers/phy/allwinner/Kconfig"
 source "drivers/phy/amlogic/Kconfig"
+source "drivers/phy/axiado/Kconfig"
 source "drivers/phy/broadcom/Kconfig"
 source "drivers/phy/cadence/Kconfig"
 source "drivers/phy/freescale/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index bfb27fb5a494283d7fd05dd670ebd1b12df8b1a1..f1b9e4a8673bcde3fdc0fdc06a3deddb5785ced1 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
 obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
 obj-y					+= allwinner/	\
 					   amlogic/	\
+					   axiado/	\
 					   broadcom/	\
 					   cadence/	\
 					   freescale/	\
diff --git a/drivers/phy/axiado/Kconfig b/drivers/phy/axiado/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..d159e0345345987c7f48dcd12d3237997735d2b5
--- /dev/null
+++ b/drivers/phy/axiado/Kconfig
@@ -0,0 +1,11 @@
+#
+# PHY drivers for Axiado platforms
+#
+
+config PHY_AX3000_EMMC
+	tristate "Axiado eMMC PHY driver"
+	depends on OF && (ARCH_AXIADO || COMPILE_TEST)
+	select GENERIC_PHY
+	help
+	  Enables this to support for the AX3000 EMMC PHY driver.
+	  If unsure, say N.
diff --git a/drivers/phy/axiado/Makefile b/drivers/phy/axiado/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..1e2b1ba016092eaffdbd7acbd9cdc8577d79b35c
--- /dev/null
+++ b/drivers/phy/axiado/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_PHY_AX3000_EMMC)		+= phy-axiado-emmc.o
diff --git a/drivers/phy/axiado/phy-axiado-emmc.c b/drivers/phy/axiado/phy-axiado-emmc.c
new file mode 100644
index 0000000000000000000000000000000000000000..28d2a30c3b35ee7dba917487959e226941e8ea4b
--- /dev/null
+++ b/drivers/phy/axiado/phy-axiado-emmc.c
@@ -0,0 +1,221 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Axiado eMMC PHY driver
+ *
+ * Copyright (C) 2017 Arasan Chip Systems Inc.
+ * Copyright (C) 2022-2025 Axiado Corporation (or its affiliates).
+ *
+ * Based on Arasan Driver (sdhci-pci-arasan.c)
+ * sdhci-pci-arasan.c - Driver for Arasan PCI Controller with integrated phy.
+ */
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+
+/* Arasan eMMC 5.1 - PHY configuration registers */
+#define CAP_REG_IN_S1_LSB		0x00
+#define CAP_REG_IN_S1_MSB		0x04
+#define PHY_CTRL_1			0x38
+#define PHY_CTRL_2			0x3C
+#define PHY_CTRL_3			0x40
+#define STATUS				0x50
+
+#define DLL_ENBL	BIT(26)
+#define RTRIM_EN	BIT(21)
+#define PDB_ENBL	BIT(23)
+#define RETB_ENBL	BIT(1)
+
+#define REN_STRB	BIT(27)
+#define REN_CMD		BIT(12)
+#define REN_DAT0	BIT(13)
+#define REN_DAT1	BIT(14)
+#define REN_DAT2	BIT(15)
+#define REN_DAT3	BIT(16)
+#define REN_DAT4	BIT(17)
+#define REN_DAT5	BIT(18)
+#define REN_DAT6	BIT(19)
+#define REN_DAT7	BIT(20)
+#define REN_CMD_EN	(REN_CMD | REN_DAT0 | REN_DAT1 | REN_DAT2 | \
+		REN_DAT3 | REN_DAT4 | REN_DAT5 | REN_DAT6 | REN_DAT7)
+
+/* Pull-UP Enable on CMD Line */
+#define PU_CMD		BIT(3)
+#define PU_DAT0		BIT(4)
+#define PU_DAT1		BIT(5)
+#define PU_DAT2		BIT(6)
+#define PU_DAT3		BIT(7)
+#define PU_DAT4		BIT(8)
+#define PU_DAT5		BIT(9)
+#define PU_DAT6		BIT(10)
+#define PU_DAT7		BIT(11)
+#define PU_CMD_EN (PU_CMD | PU_DAT0 | PU_DAT1 | PU_DAT2 | PU_DAT3 | \
+		PU_DAT4 | PU_DAT5 | PU_DAT6 | PU_DAT7)
+
+/* Selection value for the optimum delay from 1-32 output tap lines */
+#define OTAP_DLY	0x02
+/* DLL charge pump current trim default [1000] */
+#define DLL_TRM_ICP	0x08
+/* Select the frequency range of DLL Operation */
+#define FRQ_SEL	0x01
+
+#define OTAP_SEL_MASK		GENMASK(10, 7)
+#define DLL_TRM_MASK		GENMASK(25, 22)
+#define DLL_FRQSEL_MASK		GENMASK(27, 25)
+
+#define OTAP_SEL(x)		(FIELD_PREP(OTAP_SEL_MASK, x) | OTAPDLY_EN)
+#define DLL_TRM(x)		(FIELD_PREP(DLL_TRM_MASK, x) | DLL_ENBL)
+#define DLL_FRQSEL(x)	FIELD_PREP(DLL_FRQSEL_MASK, x)
+
+#define OTAPDLY_EN	BIT(11)
+
+#define SEL_DLY_RXCLK	BIT(18)
+#define SEL_DLY_TXCLK	BIT(19)
+
+#define CALDONE_MASK	0x40
+#define DLL_RDY_MASK	0x1
+#define MAX_CLK_BUF0	BIT(20)
+#define MAX_CLK_BUF1	BIT(21)
+#define MAX_CLK_BUF2	BIT(22)
+
+#define CLK_MULTIPLIER	0xC008E
+#define POLL_TIMEOUT_MS	3000
+#define POLL_DELAY_US	100
+
+struct axiado_emmc_phy {
+	void __iomem *reg_base;
+	struct device *dev;
+};
+
+static int axiado_emmc_phy_init(struct phy *phy)
+{
+	struct axiado_emmc_phy *ax_phy = phy_get_drvdata(phy);
+	struct device *dev = ax_phy->dev;
+	u32 val;
+	int ret;
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_1);
+	writel(val | RETB_ENBL | RTRIM_EN, ax_phy->reg_base + PHY_CTRL_1);
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_3);
+	writel(val | PDB_ENBL, ax_phy->reg_base + PHY_CTRL_3);
+
+	ret = readl_poll_timeout(ax_phy->reg_base + STATUS, val,
+				 val & CALDONE_MASK, POLL_DELAY_US,
+				 POLL_TIMEOUT_MS * 1000);
+	if (ret) {
+		dev_err(dev, "PHY calibration timeout\n");
+		return ret;
+	}
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_1);
+	writel(val | REN_CMD_EN | PU_CMD_EN, ax_phy->reg_base + PHY_CTRL_1);
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_2);
+	writel(val | REN_STRB, ax_phy->reg_base + PHY_CTRL_2);
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_3);
+	writel(val | MAX_CLK_BUF0 | MAX_CLK_BUF1 | MAX_CLK_BUF2,
+	       ax_phy->reg_base + PHY_CTRL_3);
+
+	writel(CLK_MULTIPLIER, ax_phy->reg_base + CAP_REG_IN_S1_MSB);
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_3);
+	writel(val | SEL_DLY_RXCLK | SEL_DLY_TXCLK,
+	       ax_phy->reg_base + PHY_CTRL_3);
+
+	return 0;
+}
+
+static int axiado_emmc_phy_power_on(struct phy *phy)
+{
+	struct axiado_emmc_phy *ax_phy = phy_get_drvdata(phy);
+	struct device *dev = ax_phy->dev;
+	u32 val;
+	int ret;
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_1);
+	writel(val | RETB_ENBL, ax_phy->reg_base + PHY_CTRL_1);
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_3);
+	writel(val | PDB_ENBL, ax_phy->reg_base + PHY_CTRL_3);
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_2);
+	writel(val | OTAP_SEL(OTAP_DLY), ax_phy->reg_base + PHY_CTRL_2);
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_1);
+	writel(val | DLL_TRM(DLL_TRM_ICP), ax_phy->reg_base + PHY_CTRL_1);
+
+	val = readl(ax_phy->reg_base + PHY_CTRL_3);
+	writel(val | DLL_FRQSEL(FRQ_SEL), ax_phy->reg_base + PHY_CTRL_3);
+
+	ret = read_poll_timeout(readl, val, val & DLL_RDY_MASK, POLL_DELAY_US,
+				POLL_TIMEOUT_MS * 1000, false,
+				ax_phy->reg_base + STATUS);
+	if (ret) {
+		dev_err(dev, "DLL ready timeout\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct phy_ops axiado_emmc_phy_ops = {
+	.init = axiado_emmc_phy_init,
+	.power_on = axiado_emmc_phy_power_on,
+	.owner = THIS_MODULE,
+};
+
+static const struct of_device_id axiado_emmc_phy_of_match[] = {
+	{ .compatible = "axiado,ax3000-emmc-phy" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, axiado_emmc_phy_of_match);
+
+static int axiado_emmc_phy_probe(struct platform_device *pdev)
+{
+	struct axiado_emmc_phy *ax_phy;
+	struct phy_provider *phy_provider;
+	struct device *dev = &pdev->dev;
+	struct phy *generic_phy;
+
+	if (!dev->of_node)
+		return -ENODEV;
+
+	ax_phy = devm_kzalloc(dev, sizeof(*ax_phy), GFP_KERNEL);
+	if (!ax_phy)
+		return -ENOMEM;
+
+	ax_phy->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(ax_phy->reg_base))
+		return PTR_ERR(ax_phy->reg_base);
+
+	ax_phy->dev = dev;
+
+	generic_phy = devm_phy_create(dev, dev->of_node, &axiado_emmc_phy_ops);
+	if (IS_ERR(generic_phy))
+		return dev_err_probe(dev, PTR_ERR(generic_phy),
+				     "failed to create PHY\n");
+
+	phy_set_drvdata(generic_phy, ax_phy);
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static struct platform_driver axiado_emmc_phy_driver = {
+	.probe = axiado_emmc_phy_probe,
+	.driver = {
+		.name = "axiado-emmc-phy",
+		.of_match_table = axiado_emmc_phy_of_match,
+	},
+};
+module_platform_driver(axiado_emmc_phy_driver);
+
+MODULE_DESCRIPTION("AX3000 eMMC PHY Driver");
+MODULE_AUTHOR("Axiado Corporation");
+MODULE_LICENSE("GPL");

-- 
2.34.1


