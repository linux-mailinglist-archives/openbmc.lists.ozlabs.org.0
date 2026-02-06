Return-Path: <openbmc+bounces-1331-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOOpAfMPiWnG1wQAu9opvQ
	(envelope-from <openbmc+bounces-1331-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Sun, 08 Feb 2026 23:36:35 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3326410A795
	for <lists+openbmc@lfdr.de>; Sun, 08 Feb 2026 23:36:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8N3C2CVrz2yrn;
	Mon, 09 Feb 2026 09:36:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c000::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770366219;
	cv=pass; b=FQrQj7CjvM+vuI5vJFnE2p5P8vtulc7Z+ray1KJOEVzvJUSyW72BEdaKxT+n09fMhNQkHGveAVSMwOnEa4R+OpQ6FOtIKpnbSQw1a0gCO3nkneZwAkqpcPED+LdtSDNgX8CEECFP5XjnN+Fw5e7gdRNdrm4fG0UqwWgfNU9r+tHHsYGZKvAXKqhuikfoG1MK7WtivoKosRi3gqaohKQN3ZbvAoer2vh6eqj+AUAATAzsC3s/ddRxv7VJBqDH8onfd4OKdS26F2VzhZBSsb1IFE9nWL44FiwlCfdCRH5PW9Qff+vExvyYVmoV3jJdLi7deXCd+59I/IejOjgLu42m/A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770366219; c=relaxed/relaxed;
	bh=HGiqsJ3YYdcu1HU2VkhXeOL9E4lKp4z07ZLAyzmvsVE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=aVdEDa4lRWXwXA0R+Vs+PBicbkhU5ICHHAyTlee2slpwGrG0Z1keMdwhWSZnA+s3B/yOlcGUG5eHikAczK4kFjxq2XNJQkxY7jENVu3/AtY2BazKbJjnBG9jnhRwrvS5hTZXvPHdKL0t5XlcC5RvDPdFHI3hoqcloRuUycanIWVD5+WPvPRA90wc5x9OPiia3PIwsNGOhKzOjBDqpduLcyQDk1nJMPGWhVvONkqR2qDaGPJqC+dYaBJenY7Y4ON5v7sua9u3ReuQzsD1Osuy3QXbkPRpXX9XSObDM3TLfaYsubM1ypxWVzQi3Nxozj2UmnPWXl8DHrI58e5snGb5aw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=bSilDG2e; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c000::1; helo=byapr05cu005.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=bSilDG2e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=2a01:111:f403:c000::1; helo=byapr05cu005.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org)
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c000::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6nDB59Lrz30M0
	for <openbmc@lists.ozlabs.org>; Fri, 06 Feb 2026 19:23:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQprZne0zoVZJfTdIavI/ZbSTNxqvXL0ZpHDgz9NXUFzYrnUEV4QaOvHPJX4rMVOLMXsO+TeBmOqhrG3Jr3UeLPOeCx4e0lOeEVazeTo3YU4yJKKOWPGOwZrxzjrZBU0cybUNdo2pVRxo8rCd93xx6JfcqM/vtIFl0SeuO6iP6AiagkEL752TOMzqAXrEhnaIzSgpZjHcmzkGDFgauEFssSVugQt28QQLXgMjqjC89TNqWLQZ0XstR1HgMlJeEKT07ylcj0qINu4Wc604bY8BnCnZFev3CeqrAO4o+G53Yoy4TG87P58xhntTLlZXyBOWL0+F1YoFSi3wA+vxjod6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HGiqsJ3YYdcu1HU2VkhXeOL9E4lKp4z07ZLAyzmvsVE=;
 b=AwIp1UE2iFLfTXUz7LG6rPMALs4ILHp7IfzFhr36Zq9+1u8eFDeyKhMd+YHfrbYlGV3VQsQXN9SlyGTHJxnCktm4josxxXnFk1yPI8JRFx9n0VNB1L6dKZcxoBdtx9KYZ/x5/vo1LF7vrDV2meamVjuJGth6RcQBV3bRZ0Ei3mbz9gMmTJBH65+ba8LPMeQiVjvmY6sOtNY5S74eQyHzXz2v244BbhHt/EKUVRaZFNhMwMcpNmItzTrAQuQrIHjRE07/hPrG/AfuDIuXWvf/EZyTgBNKFP0D+HqtSEt/kN11AVq83UAhsT/IElx21w8hqpiU/fFbZJipxEKwer0QiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HGiqsJ3YYdcu1HU2VkhXeOL9E4lKp4z07ZLAyzmvsVE=;
 b=bSilDG2eeye+sdJiEFl35VHZHG95YLaSwKWudGtKu+Zp9b2vQnlycIl4vcA1qsiodWa5YWhAwLNHs+Yl8TXsim43Gr+Uio6GsjLNQWNx/+p9/r1tkVVcS+tnvQHzKM65wUfOotgFdvvYTCeB14zkI0kqU/8tkmUotJ1ujD4XJHieO7bGi8sN/s6RUN1cUhhFmEpL2pp4SxcDvXksQvyP1GZj71iupAYY6h3IRRgaaM3BLR8BEE0YqMOHwRvcxVtXyWCFYRrbpzKZNWP4vVVfqEYKSq6k/eP+PV85noKrTMqQ794fD//hViBqHqUCkx7dhqe9/jxGC0jvmn3NB0jGBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from PH0PR18MB4558.namprd18.prod.outlook.com (2603:10b6:510:ac::13)
 by DM6PR18MB3667.namprd18.prod.outlook.com (2603:10b6:5:2ae::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 08:23:16 +0000
Received: from PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311]) by PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 08:23:16 +0000
From: Tzu-Hao Wei <twei@axiado.com>
Date: Fri, 06 Feb 2026 16:23:08 +0800
Subject: [PATCH v3 2/2] mmc: sdhci-of-arasan: add support on Axiado AX3000
 SoC
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-axiado-ax3000-add-emmc-host-driver-support-v3-2-ef83b09325be@axiado.com>
References: <20260206-axiado-ax3000-add-emmc-host-driver-support-v3-0-ef83b09325be@axiado.com>
In-Reply-To: <20260206-axiado-ax3000-add-emmc-host-driver-support-v3-0-ef83b09325be@axiado.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1508; i=twei@axiado.com;
 h=from:subject:message-id; bh=I4Vo8Qn3Sj3LishM2f+4R8M1+J3i/RSYnBRaMawYJSc=;
 b=owEB7QES/pANAwAKAXgQMF3EWvHXAcsmYgBphaTyJFUmFKFNC13l8wrbKalG+9sVHGZvpjGHU
 FtPlVSaCMyJAbMEAAEKAB0WIQSZyWINOowtFmDvdYF4EDBdxFrx1wUCaYWk8gAKCRB4EDBdxFrx
 12KeDAC1ojpyHuZCXImhP9oKLwIpos60FlTT1c0ESdF0jEgjvDVP7h2U2PHtMBH0mg54gtL05RT
 AWM463BTTjop2oAJ6jpSKrwMbAHznLTxFRxxL4b3LZjUYZkbqPLvtS7l3u1VVI2OZpZOhSpnBq5
 u+Q3q3+fsxQlt0m1ofjFp01lRygZdCzSpV37vMaq47yJIzKkEHrv+ljTSir+DePkHaXz8gz2noN
 XrN7p3RanF8x7MTFpHI+VD0I8blK01QgNVnN0j2Ws3BqtUuIxmzWIeMewnkZui5PQZbSplVUqjO
 oC3AXVbCMQkRrFfxzahOvPeXqixKHCOPoi/xBIlu2Vz3FKrg5KG6E3EJsQykjDD3JrQoZNZ/pz7
 IggJFfNZDq2+dK2pqD3G1Pk5v1TmBNSUJX8lFR8T3JJW3EYpaHc8+mtjWb6ZBbU4aLGxFi/nmld
 NNcj74NKJEp4EvSb6IAEhKRH27nZ2XxkOcK9tNmP6S9T+J4/YtNkOWKAU7VnkhQaOJwQc=
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
X-MS-Office365-Filtering-Correlation-Id: 92242437-ba68-4ecc-4ed2-08de6558fa2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|42112799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UlpRMVlKNTRHL0lDb0NZMHZqdzdyVGhQVGdCRk9mMjdwNENuc3BHbEs5L21h?=
 =?utf-8?B?dUJzc3Fmc3hMRW9BcDZXN0M2MDdZd0lrNUJNMXRvUlFCT2R0SGRLWlRxWVpZ?=
 =?utf-8?B?S1A3d01vUThlcTBpdVpSZVVTbXc5YUs1RFRQRWRiN3lTVWJJTEV5eG0zYnor?=
 =?utf-8?B?a3lmWHlGUzVaMzByOWtUOVdNOGQ5Y28wSldic0UvOGxCOURXVUpKNzVtTXIw?=
 =?utf-8?B?UnVROXZ5TFJOZjltT25aNEtocDQrcllKdG94TlkrMkFwN0tPVUp5TXF3NGNp?=
 =?utf-8?B?YndqMS9ISHByYkMySjZBakVsSTJlVkxvVmU2M2czTDB6dmlOT3ZxQm54aytn?=
 =?utf-8?B?ODIwWFhsM1FXcjBVNWF5Nk5Na3Z4ekVsNDd0VUhJb0dUU2JrQ3RObXgrYjRx?=
 =?utf-8?B?YU51bGNiejBzc2trdkVVL1E5QWJrbHgxS3ArVGsvYlJMTGNFL1JEMnVhcEVM?=
 =?utf-8?B?WkhjTzAxT3RNZGRNQU0rS3pMV3BGbUdxSzRzY2lBelNsdDNTb3c5b2ZrL0xu?=
 =?utf-8?B?enZjMXdSZkF1SE5Tc1B2Q2cxSkU3T2JCUWdDMnNHMk9wNVFmRTNtaGlXUlpP?=
 =?utf-8?B?eC80c0xvM2pOcktGQ2t0QWdRZ05XTHBQSFF2emZEWWlmR1pRQmxBemJNUHpH?=
 =?utf-8?B?R3lRTkZaeW1sODJBbW44TXF6NEt3cjR3S2p6R0syQ2t4bGJaZXdoQ3FhVnFi?=
 =?utf-8?B?Wm80U0Q4aHpsa2ErWTdBalFHTVhnNndZZTY1WEhWOU9VS0p3bDR3QzlzK3E2?=
 =?utf-8?B?UFVsb21GOElZQmpGcmFWSSthalVRTnkxWTB4b3NMeWpqajB6dVNJN0N5aFVi?=
 =?utf-8?B?Y29pRjhsc2tIbUFia2hOU0FYTTlIckhnQU53UXJPZXZHbndGbGczZFdFVmhP?=
 =?utf-8?B?YmgwVjlhZVcvSGxJekQ2UDNIMEJ4MFdXZDJBcGluODE3aU4vdGhEWmhqeXdl?=
 =?utf-8?B?OFd0dmNyKzlscUNreFJ0SUNkL1FjSmZRYWExMmxSYzFPWHhMUFYxUUpMWUNr?=
 =?utf-8?B?OTBpNzRvS3FxWC96c1FZYUc3eDBuNU9sRERhWU01aGg4Y3pWQkU3TEpWR3pV?=
 =?utf-8?B?V01GSmdKckx3aTVBQ1d6b0xYb0REclVpN2RXTnhkTHhwT2xIbzdNYUwxQkdL?=
 =?utf-8?B?V3ZnMjJxMWFhUGpTLzQ5Tk1RcVRmUDhWamp4bzl6dDJ2YlllT1hWdjVBelpj?=
 =?utf-8?B?eDhqRXhYL3l3MktBL0xZN2hxRlNWMktrQjYxcFpxcmkvNnFEeGJBdUM2UWdo?=
 =?utf-8?B?R3BqVUtnUlQwa1kvZmEyaE0vUVRwRU04YW5jcnJnSWdWd3hLelRWYTR0Tm1s?=
 =?utf-8?B?TjljRi81MGE3bTRtY3hsOCtDV1FjWi9SMmM0czA2WFp5OWRaazVPc3lVeDVR?=
 =?utf-8?B?MWNEcFRkZE1iNHhab2ttUU44RFdzMUhkVi9CeTVMRWFTZ0h3WmViaFQyc0FF?=
 =?utf-8?B?K3RXMVJ6U2JNbTZQRFhoQnhFbnhPSElNa05yVkJpQmRFRmY0OEVHclhMb1hM?=
 =?utf-8?B?cFBlOENWMU83dzZuM29kRy93TXRHUVRUNGN6dCsvQ3VEZE5ZcmlZeVdCMmRU?=
 =?utf-8?B?WlZjMmFua2U2bDFENHB6UkxoclZ3VWVuek90Z2VqdWhQWXFRVktUbDBmOFA0?=
 =?utf-8?B?em8zMCt2VFdrZEZyQmRFRmRhV2M5U0FVUW8ybjNzRFczc0VyQlpVWHJVNEk2?=
 =?utf-8?B?L1IxUWh5WUdDZkk5UEUvNTU0UDdwVGZjRHFhV05KN0YxT0JoRHBkUCtqK245?=
 =?utf-8?B?ZUEvVUJqUjhCSEhkbUo0aUlJbDN1NU9JN2l5d2xpRWhsWWlTSk9LRTFWc0E3?=
 =?utf-8?B?VE00REdPY0hDa3dRdUtETlFUbU1OSzZuekoyb3dRYVlaR3ZMTXRBUWpzM2RC?=
 =?utf-8?B?RHdHNVNIWi94N0pHemw0NHdpQTlNZktXTTBzbEFUeTdGU2xyeUhaczVpNlV5?=
 =?utf-8?B?ajNiazI5U29uV1RJN3lSelpaUEgxU294cURjWEovTVh3WFhrWW9HY0RqcFBM?=
 =?utf-8?B?UXd5bkdhemkyYXJLamw0UkY2eFhvbFpjZFh3b2orZThZdFJRYlBPclVPZ1Rn?=
 =?utf-8?B?dWJlaFBkSCtKaC9aV0dwVEtvZVAxRU1jNktvOVJzQWp3ZGg1ZGhBUVZzVEg4?=
 =?utf-8?B?WE9XWERlYzA3SzVzWWQ4bkQ4TlZMWGJyVndBNG1pWWsxaTRnRUZ1Nmw0K1hO?=
 =?utf-8?Q?S8oPSWSiVOihBUhWV6AkGppO9SfC1u2zoJMHh74PT5dq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB4558.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(42112799006)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tk5lY050Zk1qWjRFZmpxdzRxY1AzSmRFbTZJUzBFRVRFR0kxQUxka28wcTI0?=
 =?utf-8?B?WWFYTVEyb3JnRmFiMHAxTFdtVGFtOTJQUVh3V3JMUjRncmdqUDdmVUtJNXdJ?=
 =?utf-8?B?VFV6T3lIUjZlMUl5SVVRV1dKbmx5dzBVTmQ0aXpnRjE4ZjdJOFlEcVk3S2hJ?=
 =?utf-8?B?LzZOMkhES1JqVDl3UTJ6K3ovZW5RSzJ5bjhMKyt0UDh4bHpKSWsxTU0rZG15?=
 =?utf-8?B?bWxvRy9haXd5akZZUEZudHdVY2VkUHZ5ZWJJYTRtMlg4RDNNdVlndlI4SjBs?=
 =?utf-8?B?ZWtMVmY4ck8yRHpJVzE5YXV2SitsRjdEQWxDZ3hxbExUSTAvTjBmc1JmSDJo?=
 =?utf-8?B?Q2RRRmtJT0NjVEpjS2dDQUpWb1ZsSFErcGJsVU11alFZYTR2OTd6a29JekNT?=
 =?utf-8?B?Q1hrL0tVaHBsZnhmQWVpeDNwKzBWNFBCZVFVc1J6aC9aRDRFQkRLVGVHNmdN?=
 =?utf-8?B?S3ZaQkdpbjF3TWlSWG1wQkFXUGtrVkhKOCtLYTFLdG5UNEh4aGpKN3g4WGtQ?=
 =?utf-8?B?UXB3MXlUNUY1MzZQWkhtd0Y2bXZKZXl0bkMxSUJjb25xem54NWgySTd2b3dE?=
 =?utf-8?B?YWw2N2lmVE5FZitFTm9TM2d5REpPUjBaSHFWRlpkKy9xY0VWOXQ0Q1ltT3JG?=
 =?utf-8?B?WTF4ZEx2MFRrKzk4MUxyaHRxWnVKRHFXRmgwUnNPTGVGTERkNmlBZVNOS2hL?=
 =?utf-8?B?UkRPQ2hlRG12SzRrNzdsR01jVldNRXhNZ2pSQWl2UXFDR3BhaWZ2R3pRVEt1?=
 =?utf-8?B?MjlmN2tXUjZqdjhoSXVDeGd5Q1FkNkZHdGplbSswRnk4cXFZSnBKdW4ybVZX?=
 =?utf-8?B?MVVxb01YdGJSYVZUdUxzMk1CR0NTWGtJNmdpMmVXZmlXYTVpaUdqamVhcEtX?=
 =?utf-8?B?RzFGUFFmZUpUM2htT1o2MVZmMThnc2pqcDNVRlo0S2lzY3Fpc0NiQzVIVXRZ?=
 =?utf-8?B?SkROeC9pRjVvbmZLN0R1VnU5YUxnbnA1cXpPbE0wemljc2hkZ0k1Zk1QLy9V?=
 =?utf-8?B?RUhoVkdob0xveVQ2TmRPOHJDalFkeHpWajNCQzFFb09lbVQyNHRJeTZRcm9i?=
 =?utf-8?B?WWxsa0tsMXlleTdDU2JEczhsUFlTNTNidjZuZERGcHIwY3hUS013WUsxUGZn?=
 =?utf-8?B?WEtWT2R6KzBqYlZOZXZLaUFrR1Y4K0JEYjdpQVR5dCsxeis1Tk9TU050VWQ3?=
 =?utf-8?B?dzhmS3hrZUdVTTE2clRJRzQ0ZWY1V1NDSDkxZHdjOVh1VHZUSW5nako0RlA1?=
 =?utf-8?B?MTdnL3YycGNrTXQ2bFNQOGFoS2g1SXFHYjlnRy9IdXQyQ2p0b3h5a1R2VnIz?=
 =?utf-8?B?ZjEwcG1DaTJiVnJsamhrVmxneDBudHNBT244VGtOTnAraTBNSDNIRHpzMCt1?=
 =?utf-8?B?b0U5UjRZVHJTVGIwL0Y1TnJuM2ZqUmhBSnJWRlUrcmtINk82ekUvTVpPU053?=
 =?utf-8?B?blNSdFQwYldiNjJQK1VrRlQ3M0pGV0c3V2IyUThHVlJ1SzhadE9rMVlvdVRt?=
 =?utf-8?B?b3BNYkZmOVgyQStlSDE2cHIzd1hKMWZNOEVBR040c1pxcW1DWCtUY0ZMV2hY?=
 =?utf-8?B?YjhMcmsvOW1oK2gyRHVEM1ZHTHVSWFdJWmJiUy8yU1FoUGhHTDBJaEQ5S3p6?=
 =?utf-8?B?QTR6L25DOGZZb1E3VlBMWE1hTFhXRk9Iek9VUFRkdlphWmxVQlVDZ2tCWFVG?=
 =?utf-8?B?MVg1OHJBWUtOcmRULy8yZWlsZXdXcWFQU0tRVDJ4VElYUHJLcUlwWk1MK0JO?=
 =?utf-8?B?MzlzRXR1QXVwaWhWZFlHU25QTzFNNzk5V1hJbGIzSkNTNHJ1Yy94YzQ2Tmsw?=
 =?utf-8?B?Ym9QYzkvQVhoSjdYK1RFMjFZak1aV24rNnBZTHhQcERqdk1UUXRUQ2lPZ0Fw?=
 =?utf-8?B?blR1eXdnczRHSnNxWlFNby95eElOUVhDZG9YMGxGUm44L0hybGZuZnQzUURC?=
 =?utf-8?B?TTN6NkpyUHBlMEFCS3lSYmc3NjZjeFNHMCtRWTZXUWpXQ05pbnd3eFNiWmRh?=
 =?utf-8?B?Zng4dTVLRmEwRFplTmxWUjFFdXlnMEV0N3JFeWpEU0YrYjVHbzYzVExqVFVh?=
 =?utf-8?B?UFg3Z20vdmxDYkYyb2hGekRvTjBLcDdJNXFPOXBsVU0xOEFhTVNJbVJXOUtS?=
 =?utf-8?B?dDNsaEdHR1F4WXBsSWgvYVhwSnN3QzBGdlRCUjJzbWdLbzRtRVNaS05Tamxl?=
 =?utf-8?B?ODlQQUdRY2xZTGU4dFFONWc1N0FTaWtqUjJZQ043bHRidlNvQWpvMWNYYTBy?=
 =?utf-8?B?YnFHUUtMVkRSWUkyMklZZEZMNHJDWDA0dDU4VWZtUytKaEFoS2xOb2pMMzQy?=
 =?utf-8?Q?lW2+aQMuw4EK/gWXUr?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92242437-ba68-4ecc-4ed2-08de6558fa2d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4558.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 08:23:16.3044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J78/95Pftv/UAu+Efc1vSHLGDiLW1SHD3APqInTbteiEMEv6Ne1e9ZduCr220KAv
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
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:srinavmani@axiado.com,m:pbolisetty@axiado.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:ulf.hansson@linaro.org,m:adrian.hunter@intel.com,m:michal.simek@amd.com,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:twei@axiado.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-1331-lists,openbmc=lfdr.de];
	DKIM_TRACE(0.00)[axiado.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[twei@axiado.com,openbmc@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.922];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[openbmc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,axiado.com:email,axiado.com:dkim,axiado.com:mid]
X-Rspamd-Queue-Id: 3326410A795
X-Rspamd-Action: no action

From: SriNavmani A <srinavmani@axiado.com>

Axiado AX3000 SoC eMMC controller is based on Arasan eMMC 5.1 host
controller IP.

Signed-off-by: SriNavmani A <srinavmani@axiado.com>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
---
 drivers/mmc/host/sdhci-of-arasan.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
index ab7f0ffe7b4f007a58eb0a26868b08b0b02b40f3..caf97238a58b487312d6cc2b7a868913ace60f22 100644
--- a/drivers/mmc/host/sdhci-of-arasan.c
+++ b/drivers/mmc/host/sdhci-of-arasan.c
@@ -1512,6 +1512,17 @@ static struct sdhci_arasan_of_data intel_keembay_sdio_data = {
 	.clk_ops = &arasan_clk_ops,
 };
 
+static const struct sdhci_pltfm_data sdhci_arasan_axiado_pdata = {
+	.ops = &sdhci_arasan_ops,
+	.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN |
+			SDHCI_QUIRK_BROKEN_CQE,
+};
+
+static struct sdhci_arasan_of_data sdhci_arasan_axiado_data = {
+	.pdata = &sdhci_arasan_axiado_pdata,
+	.clk_ops = &arasan_clk_ops,
+};
+
 static const struct of_device_id sdhci_arasan_of_match[] = {
 	/* SoC-specific compatible strings w/ soc_ctl_map */
 	{
@@ -1538,6 +1549,10 @@ static const struct of_device_id sdhci_arasan_of_match[] = {
 		.compatible = "intel,keembay-sdhci-5.1-sdio",
 		.data = &intel_keembay_sdio_data,
 	},
+	{
+		.compatible = "axiado,ax3000-sdhci-5.1-emmc",
+		.data = &sdhci_arasan_axiado_data,
+	},
 	/* Generic compatible below here */
 	{
 		.compatible = "arasan,sdhci-8.9a",

-- 
2.34.1


