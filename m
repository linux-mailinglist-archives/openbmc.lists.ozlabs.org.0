Return-Path: <openbmc+bounces-1129-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BC0D0C9E5
	for <lists+openbmc@lfdr.de>; Sat, 10 Jan 2026 01:28:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnzxy6W6Yz2yFx;
	Sat, 10 Jan 2026 11:28:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.85.132 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767952030;
	cv=pass; b=V4oLNvyieAygurMPPVajPrkUDZ773ZOIcAS6LgoPTtDlzI4dR9Z7SMFiH0gHyEbvw415C1CE2uc4j8erhv4zgzJuM0QJ7Etvpzk3gh6zYq7orU6OF9YRV7oMlBCl5YLbh+8CZQ0rEGpNMndaWmhBLb9So87fZ/ttAkULs/fQBN1SEWjkcgsjiHOHvQ7D9rxfo3OmNJ88SS34Hnemrm6AV///Qbc5kJ44rZmNgBUN3ii8C54fKcnlCQYZBhkM8zLHxPYsEPmwKIzSpxbXUWr9E3DPPVx5/97tea6xYU+ApqABDBvczZQf0TMv0LbdwCLDXD/pvgAHsCBjDNNoDmCx9A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767952030; c=relaxed/relaxed;
	bh=K6Snjn5MtSkm4KSJYoGva+fmatASb6cr4Mi3yUa2WbI=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=FNsXhol5kityQW0VRvwgpsb4qm8TS7qsmLLX8ZVJbP5o0OebHWrbDFLmJW+eG9s2c+A97A93rnnOT6MzMwD9PCF4ie3e850OZuZ5W/XZ4HvA5/ggAse33ct+hTiD/PCRutGllrlgkqWrMXyEUrTreK0V3+dADMER0UK2CJRv6l/u2VemflX5tIdnH3TvM+5pGM3SehOhg2Pibd2CvMjhgGEcWr0cC+kKYxJ/O1idEIX72Myk+7lYY6lLaFb3xnFXVYy/RB+KcLsryZ2QhrI9s3zEavNTr9TEWVLCdREWsXxUbjCNHMqaffh7ZZYx2s4fvgIYkxys40VUQdGcol2ymQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=bLHd40yu; dkim-atps=neutral; spf=pass (client-ip=52.101.85.132; helo=byapr05cu005.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=bLHd40yu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=52.101.85.132; helo=byapr05cu005.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org)
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11020132.outbound.protection.outlook.com [52.101.85.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dncPV23qsz2xP8
	for <openbmc@lists.ozlabs.org>; Fri, 09 Jan 2026 20:47:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h4bUUILdjJnjbnSe56bVbXVxJZlLVrd3LgFyr61+9vwK6qhZZkS1LVIVwwZSoLmJj13+H+xC72YSdQhmAUGi6boyd04cbwEOZggGwOX7s59LxlvOBhMbumgrk8OtMu4S72cBncuDBsMn+YM16D8X0dmY7YqIp+Dl8Qj33XdqXJVf8yVUW4qapbaiYZ2zlZwhHQ1HbXH4qflArakupuuTgsD7O2+GjORjspHh0hcX8kIl3cW7Ocmrvvd9JD6qmGEA1OiqxNiu4jFrWEBr5bDiZyuvyg6mznR0vzGV2XZeYYnH+MjNo8II59xCFXmd8QC/IaUwzSGko5oMXg4Nz9cAug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6Snjn5MtSkm4KSJYoGva+fmatASb6cr4Mi3yUa2WbI=;
 b=bzSAtfui+LTQNuHaNZxpiTy+rlxQCNJuTotIT9V0xORJlCTn1FnVbOGiPAPAFalcw0ckMX4A8Wv/yhpI7lA0XNVu0JHnLkdDIEjrmgQvPMdRHXyO+fqHtL21yxoDxP3USw08E7eSeHSx3zOBY4f2HkLgnEchJ7z2x6/x0yCrWALj7KI19I2QJiaPKcsAcykqjU3VLOiTjRDQdWmY6fzOrcx24rxe+3xRG+3pTaZpggEqw8/G+hpM3CymIAfucTZPCBmVfBK08JsO8LU5SAarImYn1qcGu6gVpjyX7eFCQPNpcWwZqU4/T8Tk2nKA32m7dTENSFXZDU7R43ewz+4ezg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6Snjn5MtSkm4KSJYoGva+fmatASb6cr4Mi3yUa2WbI=;
 b=bLHd40yue0Pt/CgRf0/nv9++E+DwGjSaXf39jkBkVAqEQdHA8Es03ZDPoc+pNdP8HS0YCMbGSUyIgkm9PLHTjIhidBG2/WLVa572vnHMwlHb7oY7A8sp5D89YVcT6Bpq7l+/s/XrZpSj8b4k7XbqhC1YQvp3pC9O6DI4jzhKhxd0Ld2Bm6ep0g1nqcJZX3cHJT3cJ81ny7rcq7q2R/HOw5wsZW4cZ+Yisi2vQ3MA65YElisSxmsKaB01sM4F7Ifs3equ6JbK7QKCBEerfizNSiDKTT/usXlDxNAtIa3vHh1U3kMgFxi/HsGHpEtmcruzGoeb7XShVv++Z4FozRq1NQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from PH0PR18MB4558.namprd18.prod.outlook.com (2603:10b6:510:ac::13)
 by DM3PPF538CF913C.namprd18.prod.outlook.com (2603:10b6:f:fc00::6a6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 09:46:30 +0000
Received: from PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311]) by PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311%4]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 09:46:30 +0000
From: Tzu-Hao Wei <twei@axiado.com>
Subject: [PATCH v2 0/2] Add Axiado AX3000 eMMC Host Controller Support
Date: Fri, 09 Jan 2026 17:46:24 +0800
Message-Id: <20260109-axiado-ax3000-add-emmc-host-driver-support-v2-0-934f1a61f7c0@axiado.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHDOYGkC/53PwW7DIAwG4FeJOM8VuElGc9p7TD044CwcUlKgq
 FXVd6/XHCZN2mUn9CPZn/+7ypwCZzU0d5W4hhziSQK+NcrNdPpiCF6yQo2dQUSgayAf5dlrrYG
 8B14WB3PMBXwKlRPky7rGVACdsy3ZydoDKVm4Jp7C9YV9HiXPIZeYbi+7mu/ffzHVgIau7d695
 tH5sf3YhncuLur42ODE54uUK5v+002qauy10fYvcp1vv0XfG2LyduoRB7lciJEyg4BLKENT+50
 5QHKt8I8n7dGYKWMBAAA=
X-Change-ID: 20251222-axiado-ax3000-add-emmc-host-driver-support-2cc84a8f889a
To: SriNavmani A <srinavmani@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, openbmc@lists.ozlabs.org, 
 Tzu-Hao Wei <twei@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1379; i=twei@axiado.com;
 h=from:subject:message-id; bh=8c4eEQ1R0fZbz+b7vXQvhtrznJyDwTAbYpDJ+3mC76M=;
 b=owEB7QES/pANAwAKAXgQMF3EWvHXAcsmYgBpYM51dCw5xYNVifxmJDtpFFHM6gOBefrwrWjRK
 GbQApVVwpaJAbMEAAEKAB0WIQSZyWINOowtFmDvdYF4EDBdxFrx1wUCaWDOdQAKCRB4EDBdxFrx
 18WBC/97XBhMsOoAenXigbEg9hOWQa/yKIUpmTzg02nz49lo6lkxx032UEF+7Mkzd8ADzz0354r
 +5UKOVVLgegaTXAZxP0EbyvZEuJtwrYSaKU7APcXksJBMoZy0EiWmKtnA97tOWcfOulFshDqUOW
 r9uTPNEtJydm2TTg85LPZ61Inq5x2c9eCgb4myxXDSEzhxCEy19DqyIqM09Nvl40kpkQyuSTPKT
 j0wTOgquYALhKSmtp7A7X40Lg0lNEygrnHJg0ZN/UJu0Bl+lnnucOiMRGR+gRWhG2c5ETGd7WiU
 hr5CuYp7hRW9+67o6ivG1CtqUtJKFu1OX3lJDnns4p66ZHQDHT0YpSmHMHoEQ7A5eB3UIC1T2R+
 66buoLiXZM3ydjjRil3eL0tVnHry8ULJFVqXayg51VtY3HsVaED6O142hhZMlz5bOLuDt3o1A1q
 0va6CcAHJ2S+2i6uDR1oeGhTCpcnQ9NJUY9tqc0cu1kbbVzhfrpVPQTNnFDp+bPCOdX/Q=
X-Developer-Key: i=twei@axiado.com; a=openpgp;
 fpr=99C9620D3A8C2D1660EF75817810305DC45AF1D7
X-ClientProxiedBy: PH8P222CA0010.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::8) To PH0PR18MB4558.namprd18.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH0PR18MB4558:EE_|DM3PPF538CF913C:EE_
X-MS-Office365-Filtering-Correlation-Id: 3109c643-dfb2-413f-b38c-08de4f63f741
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|42112799006|1800799024|366016|376014|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eEl6b2R6TWxtdStJZU9aNUpUTFdOZ3c0VzR0cHZZUnV3dmU0TnREVXIxN3V6?=
 =?utf-8?B?OVFRWGJLTkZsUzZ2UEl3VXBUNGU1WGI2MUF2YkVBNS9yVjE2RWo3SWNUN3hp?=
 =?utf-8?B?Qnc1enpTeTBKcFJselRienJJNU5DRFI2S2tFSExwaWl5ckJhSjJkVEI1S0Fu?=
 =?utf-8?B?WGlydytwQUQvVkpNODE1UklJR1R4SWF1RUxweUhZRkhSdTBhbmY4a0pYZWhG?=
 =?utf-8?B?SlRrU1RrQUdycW5qL21yeU50TVR3a2lYR0JPWGZFaHRFNk56N1MyckNmK01G?=
 =?utf-8?B?cGwzWHM0SVRES1lmaFZWRXFnakJnRDNtem1HYksrRHFGNEY1ckNKT01WWlp6?=
 =?utf-8?B?RXl1cCsyM0tzWWlZaVJqZlFkMG9jdHdpTFZSV3RPYVNSbURadnhGc1ZWeUUv?=
 =?utf-8?B?dDNFUU13VU1KUEw3dDRrTFJhVlVJVTZneis5ZDc0dDE1b2o3OWlkeUdMRUdT?=
 =?utf-8?B?bk5YUkhtbWJ4WllybTlvakpVcjZCOWg1emo1eUNlVjk3cXJoSHRWdFUwV0gr?=
 =?utf-8?B?WFlzY1ZxNlhQWjg5VVIzd3JEc3p2MGIyNG9GaXlSaHlndnY2UVpKMTBHK1Zj?=
 =?utf-8?B?Y3dnZWFNd1plVnlxK2EwZEQ2UVdUc1NEYkhHNkNMcmRKV09McUdFMGNNamtl?=
 =?utf-8?B?ZzZGNWtrMk5Fc09JS3E5QjZkMEh6UmR1SDd6dWxpL2hZUWJiZUdDQ2VCaFY0?=
 =?utf-8?B?V2hHbnlKR3Y0WEpuV0VaQ2tIeFFSbjg3OWZ2RnYzWHFwb2JiR3JXRG5MQm1o?=
 =?utf-8?B?TUlIV0h1RlBtSURLb1RIOFVQWXhtMkxQUEVCRlRBblNBR0tYRkNmVysrQTBZ?=
 =?utf-8?B?dndVRk1RWEc3TVlwbDdvWTk0SlN0elh4WVNKOWN3NklOL2EvVmJ4eUUwRkxy?=
 =?utf-8?B?VndsZlYwb0l4VXNmK1FEMTgyOWpqZkEzU2Y1aHVwUmE4czFOcDMyak5Xa2g3?=
 =?utf-8?B?TEttQkFNNnFGMDdwMDI5MHdkNzNicVlEbHdJQUkyL3p2YXBDSVRSOHpCNHVa?=
 =?utf-8?B?aXdzNFF0OHU4dm5KaXAxcUVCZGQ0cVZZLzAwRTRqRDhuM2NKN1FkS0N1UjJs?=
 =?utf-8?B?RUxCa2FqRE1WaytsWUZhcVZsbG1KcVRFaXAyekh1ejNtQXR3VHphOTdOY1Ey?=
 =?utf-8?B?V21wZXE4bHlaZnd3Q3MyZWdaenAwNUZYY01aOGJLNWFYaStrVm5KTHhMRG8z?=
 =?utf-8?B?N3ZteUI0MVB4bW14RUFUQmdLdkJrSGlIRnkrOFo3L0UycWpMelN2NEF4RVJX?=
 =?utf-8?B?dVBaTVh1aGlyRXhQU05WT3hZMkZmdjJMVkFQTnJtcVU4M1NpaHlzcjNucUs4?=
 =?utf-8?B?QWR0Um1Yak41RXA1alVqZXVYQU9CaHRJeWNhbmZ4b0J2K2o4N2t3c2ZPMXJO?=
 =?utf-8?B?YW5kSGp5NUwrYklaei9sMzVEaS94M2ViOUlrV2daOWYxT0pzNUFDaFhDR2pn?=
 =?utf-8?B?STZXYStsUXAvSlFKaXR1cnhNekRwZWN3TndtdnBaNWxOM05DOVhnVHRHaERr?=
 =?utf-8?B?akhscXpWa1VJNHk4SHJtTFc0cE16OUVER1R0bG5SdklOL3RWRk1yblB5aHJM?=
 =?utf-8?B?ZFVCQU5tR1hZRjF3N0FqZ3BqNWk3a2dTN0JxbUdCSE1sTHJvdGFMVW5xTnor?=
 =?utf-8?B?VldENjJnR0VhclB1ekM5UHR1MG1Vc0RHcWFhZkxFZ21QUUlMTnFxMDgzV3lm?=
 =?utf-8?B?Q3VyQkJUcW01b2dVcWJ2cUM4b0JTZ2o3QzhMM1hycS9sZ1JIZE04VGwzeTRy?=
 =?utf-8?B?bVEzZ1VtVTdVRloweVFqUnljamFjZVczc3hPc1lvdFJUcDJwNDd3OFFHWEZH?=
 =?utf-8?B?cUdkVXpmTWd2ZDVERSt2VDFBYmczV09aQ1Q1b1BMVHBxWkpSVnIxNzIrUHpo?=
 =?utf-8?B?RTE3ZllJWkJQMHlBU0Y0QytxdmFQREY2WTIzSHlzMWxzZDZ5Tk4rdVhnZUw0?=
 =?utf-8?B?MnZvYVJURHMzdyt0V2tGRDRaZzlrcUEzQU5idmZabWZoYUFvNWs3SGJ4dE53?=
 =?utf-8?B?MUpXY29TaHVkRWtMVm1ORzNhUWtBdW1QdjlZZU5KVy9rWVRwSWd6ZFNZRUg0?=
 =?utf-8?B?QW1jbEErS01jM1VCWW5qTnAweWVCeklvWDYxQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB4558.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(1800799024)(366016)(376014)(52116014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFA0SWgyalgzdFVqVy92RUczTWkzSStHSi9IcW43QnBNOWxmb3NlblZDV3lr?=
 =?utf-8?B?ZjVKNWd6MmZYZERqZHdFcklSaGVrMXVzYjlhaW1ZVytOd2VnVTc0Z1NPOHo3?=
 =?utf-8?B?V1BkWEVJNDAyS0o1cmJpSFZrYWpDYTVjaDhpRDdZamV4RzByRkxyWUU5Qzhp?=
 =?utf-8?B?R05ibS82TVE2TElZSTI1OVc5NXI1Y29PaEk1b0cxUklIUjNEcmRDTm52cXJG?=
 =?utf-8?B?cE9aZHJXNVNMaUF6TCtvdS9XeEtKbkxQenB0K1NvVDBteE5IbFpzN29YTDNw?=
 =?utf-8?B?VjVuSjZZZTlBMVYzaVlXcEFvNHd3SzFnejdUeHhsY0tDb2oveDBWb1VjT21F?=
 =?utf-8?B?K3NBMUFzbWxweE81RkdlSnlCRjRXS2txNXI4dWszUUtMc1FGV2IwME1uVTBR?=
 =?utf-8?B?WGZRdFBKYXczbGxWakJOeFlmakxlWVd3NFhCVXBQZ3A4cEFqeXVpOVlNY1F3?=
 =?utf-8?B?TWhCTGxua2NXT3VGaUt0ZFVvY0Vmd3ZNR3ZiQjMvYSszNU9SdU1RK21uTVlB?=
 =?utf-8?B?ekV4OE9INmtKQ0hJKzljV0xJNUI2TVNhQnFjSUFOdFJKbDBkVGpyb2hhZ0N0?=
 =?utf-8?B?SnFGeWE3bm02QllHSGk0bUdkbkpkSURaT3RwM0VzcXk2QnlITTREbktlNStH?=
 =?utf-8?B?aUNXSWNiakl6eFpSODRuL3ZteWI4S3Q2RmZ0SmpCWWp1djZWcHJuYUtiNDNl?=
 =?utf-8?B?QTdwa1NZTDJQMkxHR3BaejBmWHgzR3FTa0kxeDJXb0c0bVc4OERDN1JBMmEx?=
 =?utf-8?B?eDlGTkNCUUxFNlppWEJtMmJSOU5HTHh6bGJ4ckpSaUdwZXloNzcyS05LSEww?=
 =?utf-8?B?U1cvK1NUaEd6bW1pOXNjYnRubnAxVjZvM3VaajdCcC8xSDR2TnRheEFaaE9W?=
 =?utf-8?B?QUcvNGJzT2Q1MTFQei9BMWsrbVZRa3BoVW1mOU9sbFdhYXNLU0htaUpKVVhE?=
 =?utf-8?B?TFRDVlZoZUl4L1cyR2NUN21zNEVNbjBvSUtoMUdiYWliOUE2dGtDUVEyTXZi?=
 =?utf-8?B?S0FDU2lTcUdLVnJ1aUduWlhpWno3bnFRMlZJY0V1UEpDZm92MksxaXNyZTdw?=
 =?utf-8?B?N3RhMW5Zak01OWpoSDlndU5wNlZQUmR4UUUyd2JKNFBJSkhLb0tpaXpGS0E2?=
 =?utf-8?B?SGh0ZDZZdDJ2YVplK1RNVXF0NHhHY0hTZ1JVNExwMlBQdG1vOTV4ZEdFUmtQ?=
 =?utf-8?B?WDNLY0VKcU9ZZjdldXRIY1lZeHRhK0ovUTlLWksxYWlTZiszTVhUbUlyRnRF?=
 =?utf-8?B?MXRWdWJrYU0vLzJ3dlZmRmJCcC80S3NaNUF0aHFQWTFacFVQbWhEZ240VUNs?=
 =?utf-8?B?TjRoSmdvRnJxU3BLank2bjhuclAzU3lMcUI2cjQyZ3lUWTAvTmorRVErQkls?=
 =?utf-8?B?dzFPazI2QzNtcGdrNUpDSVN1a25QMTVHNXJmbWp3bWpjd3ZjanlvaVU5WUtu?=
 =?utf-8?B?V0lpdlk0QjdxczhPbEZSME1GQlllRVlQdy91U2dDbTNnTVo2S2I2ZWxnekcx?=
 =?utf-8?B?RWpsTTVIYmxOZ2JXVzJzNStuRUVNZG5wbjVyOG1FektjdEVmbkNmYTREVHJL?=
 =?utf-8?B?ZEgzR2lQbUV3aElSWjgra1pmNHVzdVlHR3dxZ1R2WitoZWlBTCt3RTJxTDBq?=
 =?utf-8?B?a1dtNHI1T0JwRjdSSGQ1aURMdVcxdjFaK3hkcTIyU1JNYnRNNi8rMkh5eDlG?=
 =?utf-8?B?T240KzJ0VkdHMU45Yjl3R1l0Sm51VnZBc3hvRlRJN3hKY1loNVltUUx4azNj?=
 =?utf-8?B?S3g5b3lXRkdqQ3BXSXQ0TXJoeTFRd3E5WkVWWWM5Z0V5NzhXQThvUnZ2Wlp5?=
 =?utf-8?B?cFd0TGMzMlpLdW1NbGxEYWt2TnhuNFJJMk1pTUwxYVZwakcxUXFnMWNQU1Zo?=
 =?utf-8?B?Tm5WZEVSV0lVK0xwU0U0UFBjZkMxRyt6TlR5cXZwaXpUdFcwQkprRzZnclA3?=
 =?utf-8?B?MzZTNUwxYjVLV2dOOEorSlhJZ3BESXpxR3pTYk5rVlZuOVdtQkw0QnVDRHg5?=
 =?utf-8?B?RkJJa0lRZWlWN3lad0NPMG90aU9ERXcvTWd0Wi9KMDVzZDlZV3g1d3hDellG?=
 =?utf-8?B?S1Iyb0JPVDY4OE9IKzc4Q2FPaEdneTYvdy9sbzFweG1Id1RaMFJIbk85N09n?=
 =?utf-8?B?amxVcHQvQVhkWXdvYWZldUpZMk5KQ0ppOTRVUnptcFova2dXVklZNDd0Skov?=
 =?utf-8?B?Y2o3ZDNlNUF5d0UraUxoeDJQbE9rS3JZMndWOTZ5ZmhXZXA2UEZkcUtiVkox?=
 =?utf-8?B?Umdrc251S2JmZzFnRzhzcFdFY1h2WjNNUVNtV2hEbVRkT0lmR0xVM1BkQVFJ?=
 =?utf-8?B?OGxRcHB2TUVoQkIvTFV6NzNGcFZtWUVsTS90ZDgvMlpsNGtZRW5WQT09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3109c643-dfb2-413f-b38c-08de4f63f741
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4558.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 09:46:30.3010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Urt0vgszalLj+p4zeAiAyWHZFVHOjQqwalbdk3gF+eW+BtMkPbo6fy0s94SE14Tl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF538CF913C
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Axiado AX3000 SoC eMMC controller is based on Arasan eMMC controller.

This series includes:
1. Add bindings for AX3000 SoC eMMC controller
2. Add arasan sdhci support for eMMC in Axiado AX3000

Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
---
Changes in v2:
- Keep host controller changes in this patchset
- Use pdata instead of mix compatible string
- Fix coding style
- Link to v1: https://lore.kernel.org/r/20251222-axiado-ax3000-add-emmc-host-driver-support-v1-0-5457d0ebcdb4@axiado.com

---
SriNavmani A (2):
      dt-bindings: mmc: arasan,sdhci: Add Axiado AX3000 SoC
      mmc: sdhci-of-arasan: add support on Axiado AX3000 SoC

 Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml |  3 +++
 drivers/mmc/host/sdhci-of-arasan.c                      | 14 ++++++++++++++
 2 files changed, 17 insertions(+)
---
base-commit: f10c325a345fef0a688a2bcdfab1540d1c924148
change-id: 20251222-axiado-ax3000-add-emmc-host-driver-support-2cc84a8f889a
prerequisite-change-id: 20260108-axiado-ax3000-add-emmc-phy-driver-support-d61aead8f622:v1
prerequisite-patch-id: 03617f4dadb7ed33653d1e0b3c03e732ed4948c5
prerequisite-patch-id: 454a64fb94f3c1b6cf6fb7fbfce97f706933b7e3
prerequisite-patch-id: 7961935b88d6c3056b55b4058c1ba878aa00490c
prerequisite-patch-id: f87b65e3c93f8f1edf2305784ea3f81a04c4ad58

Best regards,
-- 
Tzu-Hao Wei <twei@axiado.com>


