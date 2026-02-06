Return-Path: <openbmc+bounces-1332-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFk7Mf8PiWnG1wQAu9opvQ
	(envelope-from <openbmc+bounces-1332-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Sun, 08 Feb 2026 23:36:47 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D557110A79C
	for <lists+openbmc@lfdr.de>; Sun, 08 Feb 2026 23:36:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8N3H4mJwz2y7c;
	Mon, 09 Feb 2026 09:36:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c000::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770366217;
	cv=pass; b=OZylWgTsnMKO6KMMpR0aXqrpqYpKUshXFYhXTgUs6509JQJfjps8ZLVt7t/N7UVgqoy5ENNSTYPTap5mFOqYhRKVwbWFp7PNERrZQ8Ct7SnhQiGbohkAM2DSuW3v1JcwsQTgD0HedpOOSBDsLMsGURPBpPgK11B56DyRKj8Gc4o5lQxbKRPRgR4ZIn6L6JWsddqbfCtYszLFFxVZhik0Xxs4FLIo6NpEpXTTYYlq8/uJVOZ8FkxXczsSBHQGUDnW7oBxDiV3bbeqJKnONClnp9QPTNwLdlvkmWITS3JomhF+Ip8M+LiZu2y7eYZZ7zXYnzumKxnNgEvj8wZutexnIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770366217; c=relaxed/relaxed;
	bh=jZAMypgJLDe6oh/HfhO9/KF1EpLew3skk+yEv3YpP5o=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=ZikNczYjfXxeVtz/gP+7a22gBh/Pmye5dfVhHEYgsTXaATN2cb5cxqqBbwCiGc/eZ2wCdPOLO4ZU796RU9UsLlPmACcc54xJXOOCMKR19jqhrjSSBqs9fwJtSFmNI2Z/eujzYOSEcmuR2E+VaajntTg3nBCxC/jPRTrz1OMJSYKevPCYX4JBUtuxYiE3xcbYjieid7Gsq205FBJ3RPIVprp++WmfRV9IZL5KAPXZrkPBnTrfLdrYD0tZlxAmL277N5IH68sYtXJAOqGmLwx0gISUhijYIvcgzrN0+vYX59PsWcqDQdxYtCp1uwo/fMYa9QqeoihC6074GwxSr3F/XQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=xjtKC21Z; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c000::1; helo=byapr05cu005.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=xjtKC21Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=2a01:111:f403:c000::1; helo=byapr05cu005.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org)
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c000::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6nD90hSvz2xWJ
	for <openbmc@lists.ozlabs.org>; Fri, 06 Feb 2026 19:23:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4zgsRQEjU4ybXx1sPtTnmo/j0NO9tp6KApfn1Pc57uZfv6bBds18dzmIrHc41AMtx42/HhNiXU8mbw2jTevsvxXeTrP+2Ij2292caCjZN47lODeClYqAhIin0Jr1t2v6MmwSnBVexYWb9uw1Pt13gkdq/bXK90c4TPmqrLoILmStv0jD9VR2P0I4X4f5pET/AQQJyuglCngG4FVC245Uz3R2YVie3V1a4b3pRUXmyCoXCPe48wiQKwGmQwWbIi8HE5dPfh5X1Wit8RedjcuNvBHiWjP3rSppUbdKNdfq+PgAmEpNUNbd/6WGtF0bJMfkcXZFEKdGIIEEMriZ7hrDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZAMypgJLDe6oh/HfhO9/KF1EpLew3skk+yEv3YpP5o=;
 b=mcnTdIJwSkCFt641k0Npxt1pNCNIa1BvD2S16LpLrCm44PfQGOe5hnYg4t0pAkYR2rEpalb9MQ8hq1em5ht9xxb2mBDFnLLeO+1em90UdMJXSPBEd/adk0fHGQPCvz4qIj53DSld5EbEyVGNaUuufLOv8NzQQoxTLiJyI6+B8gR3Vpw4+86/AQIJ4+rNxv/i9JX7zvi3Yge/toQ7MPaEcEMA1iggr/DUHWWSC4uk/DuH/xFzKNb8iOgDz3Rri3oO11r8ufIlbAJ6/0cnEOMa0bLXEGArI6fvaqTXFCPdRubc36ZbxzAe2mKZs47wx4BXMaYnBlYNA9ImxGOE7g6WWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZAMypgJLDe6oh/HfhO9/KF1EpLew3skk+yEv3YpP5o=;
 b=xjtKC21ZAAx9bD8/JxFReejCQNNn6hZpIDq74lHvJYevbgSiU1GIfGy3D0LKM8+fWFP8NExWWRR8Eut6WhWRrhujvnlW4XNGK8GpATqpGrfCfANDaCMDWVa50Cu+nFDMEzp8KzU0PxWXrYZ2SbhG0ZtHVCXZMhkfLLVePYQVs+qfdhZ+V5Nh+w4HJ1IV95TYAlwDEh4Zqql71Lty83NPMBFzd8UrcFoQ1ysPr+N5tfSK4M8ZDiK5MpjPloNTwsiB0CYQ9hvkh7pylRBBMryDaBOrPe43IjFbSsfQMYyLmYK5kVXutbaA8/PRGl1Rx4uGTOfUMfVNISrolj/HgeG2Hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from PH0PR18MB4558.namprd18.prod.outlook.com (2603:10b6:510:ac::13)
 by DM6PR18MB3667.namprd18.prod.outlook.com (2603:10b6:5:2ae::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 08:23:15 +0000
Received: from PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311]) by PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 08:23:15 +0000
From: Tzu-Hao Wei <twei@axiado.com>
Subject: [PATCH v3 0/2] Add Axiado AX3000 eMMC Host Controller Support
Date: Fri, 06 Feb 2026 16:23:06 +0800
Message-Id: <20260206-axiado-ax3000-add-emmc-host-driver-support-v3-0-ef83b09325be@axiado.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOqkhWkC/52Qyw6CMBBFf8V07ZhpeQiu/A/jorSDdIHFFhoM4
 d8toAuXuprcSeac3JmYJ2fIs9NuYo6C8cbeY0j2O6Yaeb8RGB0zEygyLoQAORqpbRwJIoLUGqh
 tFTTW96CdCeTAD11nXQ9CqSKVRV0UpWQR2DmqzbjKLteYG+N7656rO/Bl+5cmcEDI0uyokSqlq
 /S8HR+UbdniCeLDzpFj+RNbRHaZpDWXOa+PCr/Y81bK0WOIj+vfzeb5BUsUArVWAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1374; i=twei@axiado.com;
 h=from:subject:message-id; bh=YJCWSfxjXt6bCvUlnpnsX7ZdXemSgQOD1wQv6GvzZlM=;
 b=owEB7QES/pANAwAKAXgQMF3EWvHXAcsmYgBphaTyIdsxozlNuLiCoyqo1Q4nx4+VzjZjAEcbT
 lrxB/rimp2JAbMEAAEKAB0WIQSZyWINOowtFmDvdYF4EDBdxFrx1wUCaYWk8gAKCRB4EDBdxFrx
 1+nWC/46BBr430n6KiD8wtbJnaTjc+Zuza95qFXuy0wzKlM6BxZiy4br0tJXsVAWsjlc4F8Tceq
 m0gocuYYbdVMu8ZkCIPcfAEvmTyYsOe3fn3NOfi7+WxiJq0GiTk1Znwj1SxvisDE9gW9ZValmBp
 FeayiConNuJOmZaOJyS8VpDHe7iz53S6cRoyIGSggwo38vdYKYMG6JvVU88Oz3BgM0NVDIgYBEJ
 /ZkD1DLMiCCncT8f2eqNN4n8sps50asoGKBWGfP58RC1zT39lMMd1OmshlSJBKXPXtGfbvE5Y9l
 WpxUyDNuADVNFdWw0T38CNroqO7Ys2bX4DVvLBLw8xlUailkoLHwDXgUaB8W4s9glqEnD8BAPtm
 ht7VgSFsHErixWZ7FEAEadheNnLaRIxc6UeW2VaV++/dc5Nl24x3Fs4IhRtdn7ayNgYpoJ/8I7t
 uidmHHq7b2bvXyhRd7WDdFFHC1D+J81Mb4RcTyYLb1hTT/SxPQ912izyuTvsKyjzAVO9E=
X-Developer-Key: i=twei@axiado.com; a=openpgp;
 fpr=99C9620D3A8C2D1660EF75817810305DC45AF1D7
X-ClientProxiedBy: PH8PR22CA0016.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::9) To PH0PR18MB4558.namprd18.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 95caac4b-5c36-4b94-08b9-08de6558f989
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|42112799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVNveG5ad2Myd2tscVBtSEN6b1RhQ29UUDZyZGhEQ2J1aVRnNHp6a29JOElH?=
 =?utf-8?B?azFzQW9ZSmtQUEhrQlYwN2RmZGlWY2xTQkh0Z3UwbXEwdFMvVkZCLzhteFJH?=
 =?utf-8?B?UlhXZzhGQTNwR0J6YnlMYlM0bWpBTUFuZmpqWmZqYlIwUWRxKytJVFd4ZUdy?=
 =?utf-8?B?N0hacHorQkh2amRIUFpUTFhHWW1oTlpXZWtZTnRGa0JRS3ROQmVNejlld09Z?=
 =?utf-8?B?RUd1b0k0QlA0M09HOWRJeWxTOEg1N1k0VFp4U2RFb3VQU3U1elJtRUFRZmVL?=
 =?utf-8?B?aE9IckJyRjVYMzgwcHR1UzJJZlhReklOWTlEWk1nWXIyNTNxdE9FVU9mSy90?=
 =?utf-8?B?TENWcWl3WWJZMmNLWlRjbERyd05uQ2pkNEJkQ1ZpYjRPVENTMmRZUlU4Vm43?=
 =?utf-8?B?M0daRXVsRnJMMjhwdkhPWHdja0Q0ZStpM0VzbW9UR2RDMXhDOTIrTUJadVFO?=
 =?utf-8?B?ckdYTjBvZWtkMlhPYkRQN1ZQQ0t4dE5VaktKaDU1TERpd21NRFFmbG1BYmhV?=
 =?utf-8?B?cGQ1L2JRN01TRUFtRll0V1hoOVQ5Yk9yZkVEVkxld2RoYSt0dTNlWTR6YU9r?=
 =?utf-8?B?TUZHQTJBVTlyMmJuT096RjlNVTdBakhGOS9iZUdWZDVwbldXc1gxZlJETHl1?=
 =?utf-8?B?c0xCTkZ0V2t0TkR4eCttMzEraU1sZlpjcUQ5Y2ZIYW8yV2ZmTUNxV1VqU2pP?=
 =?utf-8?B?Y3dHVzN4Uzk2c1NhTXZBSUUzd1lTZjJ6aFhzamxnd0VkcGJudTk2NzVRcTZ0?=
 =?utf-8?B?eTVtMi9FSFhGQ280WTZCVGNhNlVvaGYwQm1hcHNHN1ZSSFcySGl1TkNnSmJ6?=
 =?utf-8?B?R3dQcHpMMFkwRjFhZXd0T1Bybjd6c3NRUnU3cXUyeWpGRldCQ2dINnA5S082?=
 =?utf-8?B?elFaZDJnYnFnQnN2cXZhV3lRYTZjeTRtRS8xMmdmTG4xckJWQ2kwcSsvazBT?=
 =?utf-8?B?ZVd4SFhBOGhyUjIwM0lBcG5QeGdPd3NBZE4yc3JXUGpKTXNDL0NyS2tmY2Ex?=
 =?utf-8?B?V200OUFrNkRiU0gwK05ZNzVxUUpqVERUL01FaVg0UU13NmJwRnJ2Rkxja1o1?=
 =?utf-8?B?RktnanZwUTBreUs2OWx2c0pqcXFtOGN4Yis4aDMrdExWUTU3Q0RIVmlHUkFx?=
 =?utf-8?B?SElMZTh3Kys3S2Vqdm4zbFBMMjVJeXRIVFpmVHBJYlZyQ25pQnJFRjQwc2lx?=
 =?utf-8?B?ZjVIWUpnRUZtTHp2QnBxUlp5U0ZSRmRqNjFMamg5U29IN2hmVDl5d3pKOFNK?=
 =?utf-8?B?bXBIMXg5OHphd0dpZ1JFaUhybUJ0K3h2cUw3ZlVsdXU3MSsxS1JuenBNdGpI?=
 =?utf-8?B?T2lTUXkxN2oyM0dQcmJCZG15ZmcybWc3RTBlQmlFWE1XQTh0cUxXTkVJaFVJ?=
 =?utf-8?B?Z1h5UWRSNzAzd2tQbDZWNVNmcmtGSkRVZXRyMlp5WGZGZ2JvN092MzhjeTIw?=
 =?utf-8?B?UXhnbkFmMnNtSGo3SE81ek5DZkgxOTJTazVQZ0VHZGRDeENGMnJsbHAxWFJI?=
 =?utf-8?B?azUyZ0JWbmZwekdaaUxlQUVGU1VyNXJ4cVdFNlBaUGZmQUNZaEhjV1QzeHFK?=
 =?utf-8?B?U0FZSWtpZWQwaC9TV3BSRGJxTG9ydkNHTjNIWWpxc0dqZ3RJbkNRNWdJT2kw?=
 =?utf-8?B?L3NWTTkwZnBONHo5RlJaeTBRQXlocTQxQlFWMnppVm5EN3drdVlWWmc5U1lz?=
 =?utf-8?B?K0g4TTlSMG5vOUNmc3pTTUxVclRaSHpVZ29tQ3dBVm80RndxVU4xRnlEdzla?=
 =?utf-8?B?YXFLbFhhRFRoRDRNamRrOFJmSVlNV0Z4VHVGei8vOS9JMnplR2gyb1RZbTdN?=
 =?utf-8?B?ODhCOVlwY3ZQdGp3c1cyVkpxNW5DaC9zZnJqUm5lcDBCbTZSMlVKeXhsZDRM?=
 =?utf-8?B?N2xYbzBGS1FXQjljWHVxOVoxaXQ2dVlDSHBxSW54Smh6eWlzaVprWld0V1lL?=
 =?utf-8?B?L0cwUE5OQldVcXpMNkJhNmtFWnhIdU8vZGd2QkZsYmhxT2oxSHhiYUtyU2hj?=
 =?utf-8?B?aEQ0M3hPZzBYZG0rY3VXQkdHcG5ITzhmZXQzb2NoMGp4U1JCSlN3c1BPN3ky?=
 =?utf-8?B?QVhBUWRCNFIwM3NsTFhrUFYzb250NEQzMUs0eXFONDJibTVOSEtsbzlhcC9U?=
 =?utf-8?B?ck1lbHBvNXlSeGF1ZlFZZ2tTYWxVL2lHTHErRU1aNEdpeUMwUDYzazFkRElR?=
 =?utf-8?B?VHd2NUVxVGEvZFN2N3F1b0djUmo3bU1YK1NxU0NSc1IxQXhjTUluNEVLS3lM?=
 =?utf-8?B?UjVYTnpuZGVpY3Y2UWVuTWFiV3RRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB4558.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(42112799006)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGVLWDdURWZGVmEvUmEraVI0YnJFWS8wYVpiWWZyQzFrcTlPZ3dBcElmZXIx?=
 =?utf-8?B?Q3k3cGd0UkZpalJ6UzBZelVHVGthbmRnSTFUMytqL0o5VmNrVCtBZE04eFFs?=
 =?utf-8?B?Tkt6TXByRWRqd25BRGhsaXY3Y2k3SHJiS2RLZDhWTUs0eGFtcG9aSHdCVVY3?=
 =?utf-8?B?clk5N0hvTkpRMitjMDhQbitXNkZSdjVLbzJ2enFodnFEZS93a3V6b2tOc0R3?=
 =?utf-8?B?VUk2RUMzQXNTVFlDNGlFdWtCUXBxdkEwdWJONW8vQUNiUEpnTEhtdm5tOHcz?=
 =?utf-8?B?TGtZV3NQc05hMHgzUjZ0QkdnYk5yL1VRVHhrd1NmS1R4eXZOdmkralFpSmRw?=
 =?utf-8?B?V2RCeDRCK0VnT2lMTktEZWhXWWZHVUlxNkF1NHVwOTVYRFhtNC9RNzQwZTAr?=
 =?utf-8?B?QXFLaVhjdkR0ZytuRWc5aW0xa1dCTC9vdXlha3lSb0ZRMWtON1Q0Z2hVamcx?=
 =?utf-8?B?OTUxTGtzT2xaVE5yVTg5N3FSNDhNN3J5SXIyNzVCSThDU2w1WGtvV0VlQjVU?=
 =?utf-8?B?Z3ZRYlVZdjBMTGwwL2xERno4M3ZEUGQxSmx3WlFENXlTRlZlVVpGcmdFeUVq?=
 =?utf-8?B?Q1ljTEU4RS9JdThzYmx0L2hEOElYQU5rWEtDVXFPV0poNytDek1QRWVYQzBQ?=
 =?utf-8?B?M0pTOVRta3JCeTlxSTdsbDlwK2RBSUNQZjB2eCszck5hdVUreWt6T0c2R3V4?=
 =?utf-8?B?VDBzSllpUnZ1NnJGb3EweEp1SGpNeE1nME1iZnMvNjN6STJ1dkFSVVd5V0ww?=
 =?utf-8?B?aXV5Tkk3MGZaWkhSdHA5NWs3dEI5aU05NUhtVHRrTFMyS21YZkYrQlUydFli?=
 =?utf-8?B?bm16R2xGSGtpSGpObGxIY0RMdjlNWmFmUWpSUEJsL09PU2JqcGU3TlI3SXBI?=
 =?utf-8?B?d3pBcWFZd2JydEpHZFEyZGl1NUtXWGVnME9Lbk55VUFxd3NsSWpKeFUyS2dl?=
 =?utf-8?B?NUZ6VDhVcTVKRHdEaDhGMjVKVG4rOGEwYzZGN3hPNGN3MWFFSmZDbnVBbEox?=
 =?utf-8?B?MS9lNGtMRlQvQVZLdlpJVjhTVUlUSDZMVFBLcmpFNHhVL1RGQ3pwMjhMd0lP?=
 =?utf-8?B?K3lnamhnNzV3c0d3aFpuRHZxN1hTaDBXMjJxYWlaOVBYdzRnRTdiU3BSbXJB?=
 =?utf-8?B?eVJzWjJmMzZPbXhlZjJ3Y21KRG1zd2ltUHNRM3JENUhtcWxXVTNwSm5XNE9v?=
 =?utf-8?B?V2pFU2ZnaGErTGp2NnBidTNSODJnK2Iza05INXlQRWRSSE1pMEMrc3g2aFNS?=
 =?utf-8?B?RDFuTC9vR25YVVNtL3VDV1FHNUlwVkFzLzIwZjNQcEZESmJ5RkZyM0s4MCtO?=
 =?utf-8?B?OUVEZnZUVkwzcnYwTVJFU2dBSkFiQThobzF2SDhtSTRiM3ptUDBLcFBxWStw?=
 =?utf-8?B?SVl3WWlsbVJrL1VrcVZGMGFJRTk0dVNzemdad3ByNll2MDh0ZE4yUm5ndVlr?=
 =?utf-8?B?TExPVkp2YlZKMnhrZk10SnptMHVSMk9PSHplaUs4WFVJZUVLdDNyVnNjTWhK?=
 =?utf-8?B?ajBkeExiZXVBdzZtc3luTWNaTFg3RlplV2VUUTFVNHZ6d1JReXkwSzNGMksx?=
 =?utf-8?B?RDRNcGtIUGhmN29IYzc4eXpWNEh6bzhVU2ZmKyt1d3FJYldGNW0xdUV5b3Zk?=
 =?utf-8?B?Uzl1cm4zbWdLS3FPSzdlclluYzZMakEyVTNtRm5hRnlFQTFySFhkNDF5MDNp?=
 =?utf-8?B?K0lwbTR6NVJJZEQ1OUtOTHRZWUtUamx3TUxtcllnZ0JrQ3l6ZDNHVXJ6b0Vi?=
 =?utf-8?B?M3Vsa2lMYW9ydmNuUTdGWkZNV2U4c281MkxoblNIaHZnTTAxNkJVY1Y3QWVj?=
 =?utf-8?B?WXJ4dVV0T0R2dDVtNXd0cnJnYU1SRnZMTHZjaDg4L2xxKzgvM2lXR3QxV3Nt?=
 =?utf-8?B?clFzYWh6YVQyUEdiTGFPZWVUWlJxT1NxWlVBVEZhRHpsRVFQZGFKSnY3Tk9Q?=
 =?utf-8?B?aUJqSEdmSWtuZ1B5RTV3MTQrSG8zcDFaQVhJU2UyREJUUmtoVDNjYWh2bkJN?=
 =?utf-8?B?Z081TU56Vmo4em45b25RYVVqbmdyZWJDOVhFSTNjazhiQVFJYk5DZzEzNElq?=
 =?utf-8?B?dzNXNHNzZXBJb2g0MGVoeTJBWG90ZjMwWVdmTHh2NjVCVEpldHFDTnE3KzA0?=
 =?utf-8?B?SGY2a3RKMXY0dmpMTnNma1VkN21oazFuVVVIaWF0VFBYajZ4OUxVTGFJbGdw?=
 =?utf-8?B?TDdBK0pvRTJQV3VVdHk4YkJYRzRoeC9Gd0NramhwMFJSSVk3UXA0L2FKM1R3?=
 =?utf-8?B?YjdBWFc2a0diUlZ5aGVJL0pmTVpsYXFEbnl2bXlKbkVRK3NmQjdrWFRGdm4v?=
 =?utf-8?Q?EKh714K5X7CnR4PXxz?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95caac4b-5c36-4b94-08b9-08de6558f989
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4558.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 08:23:15.2003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z/H0gU9cjdqP4/NxqkEyf+v/bCEISKfYiChbxFIR7b/twIPNL0zPSAoGEoXnJQPW
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[axiado.com:s=selector1];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[axiado.com];
	FORGED_SENDER(0.00)[twei@axiado.com,openbmc@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:srinavmani@axiado.com,m:pbolisetty@axiado.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:ulf.hansson@linaro.org,m:adrian.hunter@intel.com,m:michal.simek@amd.com,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:twei@axiado.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-1332-lists,openbmc=lfdr.de];
	DKIM_TRACE(0.00)[axiado.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[twei@axiado.com,openbmc@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.951];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[openbmc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,axiado.com:email,axiado.com:dkim,axiado.com:mid]
X-Rspamd-Queue-Id: D557110A79C
X-Rspamd-Action: no action

Axiado AX3000 SoC eMMC controller is based on Arasan eMMC controller.

This series includes:
1. Add bindings for AX3000 SoC eMMC controller
2. Add arasan sdhci support for eMMC in Axiado AX3000

For platform device tree change, we will send a different series of
patches.

It has been verified on AX3000 platform.

---
Changes in v3:
- Enable SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN quirk
- Remove dependencies in b4
- Link to v2: https://lore.kernel.org/r/20260109-axiado-ax3000-add-emmc-host-driver-support-v2-0-934f1a61f7c0@axiado.com

Changes in v2:
- Keep host controller changes in this patchset
- Use pdata instead of mix compatible string
- Fix coding style
- Link to v1: https://lore.kernel.org/r/20251222-axiado-ax3000-add-emmc-host-driver-support-v1-0-5457d0ebcdb4@axiado.com

Signed-off-by: Tzu-Hao Wei <twei@axiado.com>

---
SriNavmani A (2):
      dt-bindings: mmc: arasan,sdhci: Add Axiado AX3000 SoC
      mmc: sdhci-of-arasan: add support on Axiado AX3000 SoC

 Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml |  3 +++
 drivers/mmc/host/sdhci-of-arasan.c                      | 15 +++++++++++++++
 2 files changed, 18 insertions(+)
---
base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
change-id: 20251222-axiado-ax3000-add-emmc-host-driver-support-2cc84a8f889a

Best regards,
-- 
Tzu-Hao Wei <twei@axiado.com>


