Return-Path: <openbmc+bounces-662-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6765B87276
	for <lists+openbmc@lfdr.de>; Thu, 18 Sep 2025 23:35:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSTS30SfGz3cDN;
	Fri, 19 Sep 2025 07:34:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::9" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758231283;
	cv=pass; b=EEjlHgNUIr+jQS724ic2pOvhTpX8PR8h0l48dOLPiorryvLvqwCTPT/v7L3L/8WtvgFtECQdJ7ZoGeMb7AQbCkEpf/TOUHx8U30sJ6x1yeZVsZkwZb6UguzAVok5JW2GLFtFk1Q+bV9MmXv5Z7aRHENCdEQZX17h23KkkqzP/WtvdPa/0PYHgld5+PO0Sfc78IMYlFPZNIXwpRiDm+OeJVHFPfTyTtXE2u2k7ba1hV10ikVD0HVTNCl6AtRIDc0iE9hfIoVybwii+mcFltwip6d7+vyuu4T0WvUHQPj0ChJ+1aVeIVcT97J15rpHwIaZalnrg9kw2LU3s8AE831dYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758231283; c=relaxed/relaxed;
	bh=ZqUU4FfoLg/rfVdz/rls4q8g+sUrUxJrfRom9rjOYfU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GNAlHzXP607PgolKRIv7AKO8rrXYJwumxpRv66FInWEZfRI6pSTk0satCp/iVtFf+PoYlpJEfr2v6bla5EKstASDR98sXN5tqO+K5zktcHpPL/Bw2+OxaMR0dCtl7Mpvs+HN/3x9F8JvJK2MQgSrleHlMsAQJhmVnRlr/H+LwOVWxLeBBYx7zV0W+SrAUhOlEq/aYCTVXXLYsP7CWtk/yRw2txWkYb9G33s3sQlOd9ZIk686pPH1bL8HhmvVTijrDw0QqIVVYpavIEJ4g4rgitwtwDuAJ9Ue4cCrVw2ZiVcYDFFHEFnHsQpapCyJp4zcJPBwfCTOkW3IQpe84TfjWQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=r9SXlXrO; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=r9SXlXrO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazlp170110009.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSTS238D0z3cYP
	for <openbmc@lists.ozlabs.org>; Fri, 19 Sep 2025 07:34:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VAu6t2HrgrWwqplzasOa/RJBrNNmBE2hT8ZdkrPqQ9Y2D+prCza8zS9k1Dvhl0KSdQEd6+w9kLTo/sw/nd/JkgXx7ZP7kDp8b6sWa7mckDFldfVHvePOs+OX1X8Kx+qCQ4lIdPJxGRMSmWOJu2uMHq0umNPY14GLvCKYpy2tkw9TElMh7aUBkdyrqjQceuRmE0a/AaNgphP8WwdtBdHg1kNTmgLleas+6u9WHBN1qiSK26zk+SKLk7fEaTCKycJn9QcJaq1/24gYTGz3lrtM2NBZ4U4/1MS53Pcf4Tske02Hxy2LlZqMyG1RgntAPAFVOeXpnTUVvKGJIn7bVfdl+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZqUU4FfoLg/rfVdz/rls4q8g+sUrUxJrfRom9rjOYfU=;
 b=DMgUUcjYo29o1BQXhinwAI8/8Sr3KDpUxhN2qxbNZbLlU1CjXmrDOxr5Ofq3WX3R6zXhrxgnHF1eTnPluBFPnr44Jv2P8whSLqe6FtpTHMtcA59ISq8bx8usICtN0A7J1nG2ckX1n1xm5L0DLdLU/B3PO1rCwgf7oHeckz9T7bFLXyYCcf6ppDHZG8iThGfSC+2zlCNtNsf9RTNjJ2ohdHf3rF8KLNDOgJv10XRboMN0UwibjzTa8R1lU1+Y+wKV17kb57d4zXuSOO8AMlCBwr34DqVEQ8o5QZJrIqRLIvCxb0iEttm08dIGdClTAklXFwpLgoLZhWTTAWbY6QdrFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZqUU4FfoLg/rfVdz/rls4q8g+sUrUxJrfRom9rjOYfU=;
 b=r9SXlXrOCLuM2EWt+Up5G/WbYFpPxcvpo4xQJkicGRTgMFgGXujHnX9mraBvOI7TQnbLi5JCnto5wmrr2QHjbY2PNDYL9XsLH+DOjN5VZpRiwCkO+c7JzyFWkbgd7vs9JeDvS61gGrckNiPL0ePZg6i9lJJHo3sVvXn+Q/lmPIBSt/yblraFF3dMOtYjzQ3aH8pd4ic6esNdfmlTIY6Z1kHKMADHL8eYeQQlLtP88sd/uFv7nz9gDqPzQWIBAbyhkAbwMkRdc3NDTafUJoSOPxBwpHvjqYxflHBj52hzYO2P/vToLSElYHhvSSEOf335LPB5ud8JUQxImxYG9JGhhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by SA3PR12MB8024.namprd12.prod.outlook.com
 (2603:10b6:806:312::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Thu, 18 Sep
 2025 21:34:24 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::9de5:7299:4ee9:21e8]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::9de5:7299:4ee9:21e8%4]) with mapi id 15.20.9115.020; Thu, 18 Sep 2025
 21:34:24 +0000
From: Marc Olberding <molberding@nvidia.com>
Date: Thu, 18 Sep 2025 14:33:53 -0700
Subject: [PATCH linux dev-6.12 07/14] net: mctp: test: move functions into
 utils.[ch]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-mctp_gateway_routing-v1-7-8fdedda742c3@nvidia.com>
References: <20250918-mctp_gateway_routing-v1-0-8fdedda742c3@nvidia.com>
In-Reply-To: <20250918-mctp_gateway_routing-v1-0-8fdedda742c3@nvidia.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au
Cc: andrew@codeconstruct.com.au
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758231250; l=10444;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=8Bo0dEEKo+yGLxlI1B8ZbfWDE1lfsnvKvqa2pwN4RNw=;
 b=C2ezvdbHTo8VFljKyIEk7x2FUOtV8105+foiDEgnwW8ESalQ+EuXTPZQ2sgcYIb73bd1yJ1o5
 cp/zbXXXma+ButIdW4XyeGBdmBrBF99EAsSeOp7Fnt4WhDMIlquSuHG
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW4P223CA0002.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::7) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CH1PPFDAD84AB72:EE_|SA3PR12MB8024:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e608c81-5ede-41ce-fffb-08ddf6fb22e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dTRZZ3NZbllvY1dmekN3dEZMVEsyaFJkZWRrQkJLc0J2Sytac1ZmeCs2bWZU?=
 =?utf-8?B?aEZYbnBmZHBlcHl2dnpjY1V6TTdFUTNLcElRNkJ3VFUwcnhLYUtCNjRiM2pL?=
 =?utf-8?B?ekJvb2t5L1NxS016YmdRMTQvT3ZDMzM5ZHNYY3hmZkcvVFdCRmYvVkxJcE5s?=
 =?utf-8?B?dnhnVVUxZGVwelNuOGlZK2Y2MlZCdW56VnZGZFpRNEZIcW5Pc3lpWG9RTjlG?=
 =?utf-8?B?c2w3QVprOEFwVHN6REY2RjR5NlZvVEhWalkzMFNYZm9yUCtNbnB1VXNJb0RT?=
 =?utf-8?B?OXFNQ3RUL3ZzUnRlc0ltZUFkQTZySkpBRzhwM3ltd0h2VkdCOGV5TlBFTFBW?=
 =?utf-8?B?VVQvUjlWTzZCNytLU1Jubmd2Tm1IZTlNYlBCcVNML1dBRnNSbVFPZjFzU1RK?=
 =?utf-8?B?aG5GeTJGcnNma2dxRU5WOTBSNVE2M2lPU3lxYjZKd1RKblNJeWN0WVZEYkJ4?=
 =?utf-8?B?NGZzcTFJOWVnMU43NGlESmozQ0wxamhBUlJqSkxpVzdwWWRWZ3FQNUZQb1lL?=
 =?utf-8?B?YS9PUXZocXA1MHRMRjhsZVBSSjJ1RnVTdWE4TzNVTXBaa2VKNkFMRyt0RUhh?=
 =?utf-8?B?VkFzQUFudE5tR2N2LzNMOUxsMjlXdEEwMmpoM1cwNDc1eDExVWV1cnkzdmxH?=
 =?utf-8?B?MitHcWNGMWF4MWlqa1FKU294OXJ2YkVvRVBPZ1dNRHpqbk16K3R0M2UzTW5r?=
 =?utf-8?B?aENpUlh0VGwvVCs1TFZTRDBjemROMVJDTWxsd0tFSHkzQUdFWEhacHZxMmtY?=
 =?utf-8?B?TXViekZJSFVmZFRHeHhoYWpka2FXczYzb2V2NXc2Y1hsUWtRSk9ybGlod01I?=
 =?utf-8?B?WkVSWk54ZC9haUZDU0FVdlpYYy94WEl2RllGbHJremU3WTdzSHE2L2dFWU02?=
 =?utf-8?B?cDB1aU5PcEpjZk1Cd1FOUEJnUlVzWG52dHpJMFdxLytjNEZWcFBET2dXdTBM?=
 =?utf-8?B?WjVyMkd6d1diZ2FJWmU1VlFoRi9JMjJtVHkvb2FFTnNkTXBSUlpjZG5FSXd4?=
 =?utf-8?B?Y21WaUJxYThBUWlJM3duZDhRclBuRHRzeC9zNEtJSXQwczQ1TEgzbzBoTnBx?=
 =?utf-8?B?U3RaVDFsdEF5Rk9wb1FvaDFjYUVmeHVpeXVvMW5rK1JhbzNVY2w3UkR2QXJs?=
 =?utf-8?B?UFBpRWZ1cE00azVENmZXNHBOd3hEdDVvVGE5UmdxMFZpSmdrcUlZdzVONURW?=
 =?utf-8?B?dGVuY1ZMSmxQZC82dTJkRk1vbDVaclJzQnJkNXdwUGhTaEdXOEZVdFlKSStR?=
 =?utf-8?B?ckdkemUvRlh0Z01BaEJjRlVHaW5sU2M4aERlVWhkeU5GY0N0d3VpWksra1lr?=
 =?utf-8?B?bmMwbFVlYnRhaEhCU3hmeDR3S3o4QXB6SDlkK1kxYWwrV2wzcEJxQmErL2F1?=
 =?utf-8?B?dUJEdGFXeFNWdmdzL3hudlE5akhxaDhTbjhLMTZNalRoaVBlc2NjZUtoUGFD?=
 =?utf-8?B?bWJZeGVIWGhveXcrK3orbW5Dcm53RUZDRy9NVzVYeXFicDRmNDJmQTVvaUJN?=
 =?utf-8?B?K3JWZGdpeXdjM3RCM0FnTzdsOVpPWWxBS1NjU1h3V0JsRW1lQzBJT0MvSTZp?=
 =?utf-8?B?R2JwQ0pGRit6QVdXb1grSW0zTmZ6NGFpbks2WGhjN3dpSEtwV09sN2ErUUs4?=
 =?utf-8?B?T1lQakk1eERINWo2SG1mYkErMzRRWm8wVXNOWWNicGNjNElnRUJGUHRsQmVK?=
 =?utf-8?B?emZOakNWNUk2RjUyYmUzbmVRcnUwMDE0cE1uck83ciszUis0TE5DaUdiQjNa?=
 =?utf-8?B?a0hBUFlocUxXSGRHYVg3cnRtemNQM3VvbEViWW5ha0RhcHpGOTBlQjlRNHNI?=
 =?utf-8?B?cDBxV3RQQ2J2aVl0RUo0TmkxbU1YZDFMc0JCOHBDWUZTMXVwaU8vSGFDM0Ro?=
 =?utf-8?B?TEh2ZGM1bE5sWm9PdXkybnl2YjNmN3JwM1dsaDFNcU14Q1ArdlVRQVlma1JH?=
 =?utf-8?Q?G79PpE8VRVY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmlPY1JQU1VvT0EzL00xRVQrN01Bc3dvSFJkRENBQzJoL2FEckNWQWxnZDFO?=
 =?utf-8?B?V2VxQXRLemVlKzJ5OEYxRDlUR3lvMVM4TlFkOHk3ZExOb08xWFAvc3B2K0xy?=
 =?utf-8?B?eWI1M01ISXYyem8rQ0h1bUZKMjh1Z29ncytsTGhrSmVCckJxdFZHUlBiS0w4?=
 =?utf-8?B?T2ZWK2dVREkzckxuaWhsTyt2Tm9DSDBvSXFzck02eks4d25yOG82anQ1OXEx?=
 =?utf-8?B?Z1NZbkhYREp6dW1ZOVBEVUdZdUJhTEhxSzh3TUVOckNHbklpTnFGamhVTVk0?=
 =?utf-8?B?b0JBczBlQnhhNjFMakRRZFViYzIwdnVoOVQydXdFNzRxbElNQnd6Q1UrNmM3?=
 =?utf-8?B?UEJybG9HS1h1RW4wcDlJdkRNUm9BcW1PUHJrbm0rTFE2MFhNWGRZS1VVSUFh?=
 =?utf-8?B?TTE0ZnpsazZucE54YkRBNFcxaDNkL3dBbHMvVUc1V1c4TGh6VzIwQVhtRE4r?=
 =?utf-8?B?UkFqbWxqbEtCd2xzdEpDMHR2Y1pPbCs4bEVibGpKK3Rrb0tlaGY3cThmN2Vk?=
 =?utf-8?B?Ti84UVMyMkdZa3F2VXF3d25Xa0VwMHR6SjRFa0FITmdWTzVOTEdqV05MUWh4?=
 =?utf-8?B?L29jVHU5dmJzbjdGZmpoWmtSUHNWRmx5U3NnZmEwRUZBd1Axd0l4NjNkZ3hO?=
 =?utf-8?B?RG54SEdNOXNnZytCVDMwZTNNQ1cwSHdqZjA1bWdtR3hXcHQ3alFFTUU0MTl0?=
 =?utf-8?B?d3pFUFVkaFZNeDVPQzhKbnpyaDdtamprZTh3cC9LTkRLZTBEZnkweExSeXFZ?=
 =?utf-8?B?ZDh1UXNtZXBqRXJRTEhmMGx2a3d5TFpFN0swRUh2Vk0rSm04a2tiZjJHV2g5?=
 =?utf-8?B?ejIxeFd4OUlvWFFjOTczUkZVMDFnZVZDcFhTMldtQWlia3owT01Dak9mTDI0?=
 =?utf-8?B?U2dFOUtVNTF4ei9lUk1BanlIRGxXaGlua1hyOStLc3lGUTBkSEVOaHlVOEpr?=
 =?utf-8?B?enZEbVpiQ1d2SmlyeTN0d29iek9ybFJtaGYzUVdyeTlacGVOOHJhMkVScU11?=
 =?utf-8?B?RWtSejJXT0JINzVPcUJINzhONTNDVnpieUdlbDlPMDBrNWpxNHM2U005LzFi?=
 =?utf-8?B?dlNuRzg5T0dhVlI1WDZGb29CZmZUdWNrNGNkbXExcStiZnlkV3lPOUFHUC9W?=
 =?utf-8?B?dmhnczNWa3I4dU9wREFKYTVXRWZTRUFMVCtpYnAxb3NWU0NkOGlpTEdCZ2lu?=
 =?utf-8?B?U1RqVlFMenVKaVVDNG9pS3gvMDdWaGxZa01HdlhTQ2NjNGJzc1dRdWlybjU0?=
 =?utf-8?B?SFdiL2FyZTF3VGY4QThtMFl5bXNtcWViN0pWUkxhM3p3S2R1Rm0yR3BCUEls?=
 =?utf-8?B?TFIvcHpmc2E2ZDlvNEMxeWpKNkRvclRjNk9mOG1LYmR5QXFueHNjV2RPMmYx?=
 =?utf-8?B?d2lJR2lWUll4eEtxZjBENUNCVTFFNTljOVJjR2oyd2FQWTlYUzNZaEM4TUFD?=
 =?utf-8?B?ay8vWnhLbGMrODB5QXhlN09xdk00b2ZEaXVnSDBScUVDc0pLdENCczBWSXRS?=
 =?utf-8?B?RVBHMVE3V3hOOGFVRDMzeUl1c0hVZStJZkpZVjM3R3RGbWpGMHVSSjUweGlY?=
 =?utf-8?B?VXVuR2NJSk5xR0dkT0RJOHRTMW5UdVQ0RUFGUzJCWS83SGxwT0xORkRCdGJG?=
 =?utf-8?B?OE4wSmFscXZXZUc1SVdOc2RNUzdKS1QzRzJCa1pPNlRuZ2ZNNGdTN1gwTkFF?=
 =?utf-8?B?ekhYTHdsVExyME1BUzl0VnlkUFVUUjAyNTdYdFF5TUlaSmszQ2x5Y2lMNjBH?=
 =?utf-8?B?Mk1VRGVwMjhNZ3hFY3ZvMUtjYTZ3eVBZZmVuQmhpTi9rSmZaVFRlaENyOWxL?=
 =?utf-8?B?SzlnWXVpc0NDV05nVGpLWXZsRUNvUVlqcTRmRmRJUDBPVWpaTG16azlZZHVk?=
 =?utf-8?B?ODVUcWNIdVN5NUxRZld2UU0xZnFpaWhwZG1GRktwQ3l5aWxBNmo4ZzE1RTlQ?=
 =?utf-8?B?MzF3UStqVGYwdWFGOS9BdHVVVFZMZWNqK3AzNmhxQTJUYk9ndkJwbVN2bG53?=
 =?utf-8?B?RkkzeFRwKzVpMEpGRW5QYmZKL1Y0SFI4TkROZ0xqc0RzVndXYzc5VnVKaTZG?=
 =?utf-8?B?b3JDbWhLckhhb2ZRN1dUQkFuekhiUlV1ZXVhSmMyQkU5Rk5EbDBTc2luV1A5?=
 =?utf-8?Q?Lll5XFyZnJ5UyX4mfvVDv7B2e?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e608c81-5ede-41ce-fffb-08ddf6fb22e7
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 21:34:24.1058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ihAKz32+av6OZnT7VRBgywr2u1JmTkzFSvoe113uzQpzda0g60etSKtqATrJVeD+X8dyk+KNLwvY8QtizTixw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8024
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Jeremy Kerr <jk@codeconstruct.com.au>

A future change will add another mctp test .c file, so move some of the
common test setup from route.c into the utils object.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
Link: https://patch.msgid.link/20250702-dev-forwarding-v5-7-1468191da8a4@codeconstruct.com.au
Signed-off-by: Paolo Abeni <pabeni@redhat.com>

(cherry picked from commit 80bcf05e54e0e269515192c3a2ceff736a730492)
---
 net/mctp/test/route-test.c | 163 ---------------------------------------------
 net/mctp/test/utils.c      | 150 +++++++++++++++++++++++++++++++++++++++++
 net/mctp/test/utils.h      |  32 +++++++++
 3 files changed, 182 insertions(+), 163 deletions(-)

diff --git a/net/mctp/test/route-test.c b/net/mctp/test/route-test.c
index 3a1a686e36c36d3ee700a093cbf77da7e25afe56..bbee22d33d6d3bb89cc61a0e010b8c4f07c68eae 100644
--- a/net/mctp/test/route-test.c
+++ b/net/mctp/test/route-test.c
@@ -8,169 +8,6 @@
 
 #include "utils.h"
 
-struct mctp_test_route {
-	struct mctp_route	rt;
-};
-
-static const unsigned int test_pktqueue_magic = 0x5f713aef;
-
-struct mctp_test_pktqueue {
-	unsigned int magic;
-	struct sk_buff_head pkts;
-};
-
-static void mctp_test_pktqueue_init(struct mctp_test_pktqueue *tpq)
-{
-	tpq->magic = test_pktqueue_magic;
-	skb_queue_head_init(&tpq->pkts);
-}
-
-static int mctp_test_dst_output(struct mctp_dst *dst, struct sk_buff *skb)
-{
-	struct kunit *test = current->kunit_test;
-	struct mctp_test_pktqueue *tpq = test->priv;
-
-	KUNIT_ASSERT_EQ(test, tpq->magic, test_pktqueue_magic);
-
-	skb_queue_tail(&tpq->pkts, skb);
-
-	return 0;
-}
-
-/* local version of mctp_route_alloc() */
-static struct mctp_test_route *mctp_route_test_alloc(void)
-{
-	struct mctp_test_route *rt;
-
-	rt = kzalloc(sizeof(*rt), GFP_KERNEL);
-	if (!rt)
-		return NULL;
-
-	INIT_LIST_HEAD(&rt->rt.list);
-	refcount_set(&rt->rt.refs, 1);
-	rt->rt.output = mctp_test_dst_output;
-
-	return rt;
-}
-
-static struct mctp_test_route *mctp_test_create_route(struct net *net,
-						      struct mctp_dev *dev,
-						      mctp_eid_t eid,
-						      unsigned int mtu)
-{
-	struct mctp_test_route *rt;
-
-	rt = mctp_route_test_alloc();
-	if (!rt)
-		return NULL;
-
-	rt->rt.min = eid;
-	rt->rt.max = eid;
-	rt->rt.mtu = mtu;
-	rt->rt.type = RTN_UNSPEC;
-	if (dev)
-		mctp_dev_hold(dev);
-	rt->rt.dev = dev;
-
-	list_add_rcu(&rt->rt.list, &net->mctp.routes);
-
-	return rt;
-}
-
-/* Convenience function for our test dst; release with mctp_test_dst_release()
- */
-static void mctp_test_dst_setup(struct kunit *test, struct mctp_dst *dst,
-				struct mctp_test_dev *dev,
-				struct mctp_test_pktqueue *tpq,
-				unsigned int mtu)
-{
-	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, dev);
-
-	memset(dst, 0, sizeof(*dst));
-
-	dst->dev = dev->mdev;
-	__mctp_dev_get(dst->dev->dev);
-	dst->mtu = mtu;
-	dst->output = mctp_test_dst_output;
-	mctp_test_pktqueue_init(tpq);
-	test->priv = tpq;
-}
-
-static void mctp_test_dst_release(struct mctp_dst *dst,
-				  struct mctp_test_pktqueue *tpq)
-{
-	mctp_dst_release(dst);
-	skb_queue_purge(&tpq->pkts);
-}
-
-static void mctp_test_route_destroy(struct kunit *test,
-				    struct mctp_test_route *rt)
-{
-	unsigned int refs;
-
-	rtnl_lock();
-	list_del_rcu(&rt->rt.list);
-	rtnl_unlock();
-
-	if (rt->rt.dev)
-		mctp_dev_put(rt->rt.dev);
-
-	refs = refcount_read(&rt->rt.refs);
-	KUNIT_ASSERT_EQ_MSG(test, refs, 1, "route ref imbalance");
-
-	kfree_rcu(&rt->rt, rcu);
-}
-
-static void mctp_test_skb_set_dev(struct sk_buff *skb,
-				  struct mctp_test_dev *dev)
-{
-	struct mctp_skb_cb *cb;
-
-	cb = mctp_cb(skb);
-	cb->net = READ_ONCE(dev->mdev->net);
-	skb->dev = dev->ndev;
-}
-
-static struct sk_buff *mctp_test_create_skb(const struct mctp_hdr *hdr,
-					    unsigned int data_len)
-{
-	size_t hdr_len = sizeof(*hdr);
-	struct sk_buff *skb;
-	unsigned int i;
-	u8 *buf;
-
-	skb = alloc_skb(hdr_len + data_len, GFP_KERNEL);
-	if (!skb)
-		return NULL;
-
-	__mctp_cb(skb);
-	memcpy(skb_put(skb, hdr_len), hdr, hdr_len);
-
-	buf = skb_put(skb, data_len);
-	for (i = 0; i < data_len; i++)
-		buf[i] = i & 0xff;
-
-	return skb;
-}
-
-static struct sk_buff *__mctp_test_create_skb_data(const struct mctp_hdr *hdr,
-						   const void *data,
-						   size_t data_len)
-{
-	size_t hdr_len = sizeof(*hdr);
-	struct sk_buff *skb;
-
-	skb = alloc_skb(hdr_len + data_len, GFP_KERNEL);
-	if (!skb)
-		return NULL;
-
-	__mctp_cb(skb);
-	memcpy(skb_put(skb, hdr_len), hdr, hdr_len);
-	memcpy(skb_put(skb, data_len), data, data_len);
-
-	return skb;
-}
-
 #define mctp_test_create_skb_data(h, d) \
 	__mctp_test_create_skb_data(h, d, sizeof(*d))
 
diff --git a/net/mctp/test/utils.c b/net/mctp/test/utils.c
index 26dce14dc7f246f03ff66e5b84274b33c48baf0e..6b4dc40d882c912575e28dfd8f2e730bf346885f 100644
--- a/net/mctp/test/utils.c
+++ b/net/mctp/test/utils.c
@@ -82,3 +82,153 @@ void mctp_test_destroy_dev(struct mctp_test_dev *dev)
 	mctp_dev_put(dev->mdev);
 	unregister_netdev(dev->ndev);
 }
+
+static const unsigned int test_pktqueue_magic = 0x5f713aef;
+
+void mctp_test_pktqueue_init(struct mctp_test_pktqueue *tpq)
+{
+	tpq->magic = test_pktqueue_magic;
+	skb_queue_head_init(&tpq->pkts);
+}
+
+static int mctp_test_dst_output(struct mctp_dst *dst, struct sk_buff *skb)
+{
+	struct kunit *test = current->kunit_test;
+	struct mctp_test_pktqueue *tpq = test->priv;
+
+	KUNIT_ASSERT_EQ(test, tpq->magic, test_pktqueue_magic);
+
+	skb_queue_tail(&tpq->pkts, skb);
+
+	return 0;
+}
+
+/* local version of mctp_route_alloc() */
+static struct mctp_test_route *mctp_route_test_alloc(void)
+{
+	struct mctp_test_route *rt;
+
+	rt = kzalloc(sizeof(*rt), GFP_KERNEL);
+	if (!rt)
+		return NULL;
+
+	INIT_LIST_HEAD(&rt->rt.list);
+	refcount_set(&rt->rt.refs, 1);
+	rt->rt.output = mctp_test_dst_output;
+
+	return rt;
+}
+
+struct mctp_test_route *mctp_test_create_route(struct net *net,
+					       struct mctp_dev *dev,
+					       mctp_eid_t eid,
+					       unsigned int mtu)
+{
+	struct mctp_test_route *rt;
+
+	rt = mctp_route_test_alloc();
+	if (!rt)
+		return NULL;
+
+	rt->rt.min = eid;
+	rt->rt.max = eid;
+	rt->rt.mtu = mtu;
+	rt->rt.type = RTN_UNSPEC;
+	if (dev)
+		mctp_dev_hold(dev);
+	rt->rt.dev = dev;
+
+	list_add_rcu(&rt->rt.list, &net->mctp.routes);
+
+	return rt;
+}
+
+/* Convenience function for our test dst; release with mctp_test_dst_release()
+ */
+void mctp_test_dst_setup(struct kunit *test, struct mctp_dst *dst,
+			 struct mctp_test_dev *dev,
+			 struct mctp_test_pktqueue *tpq, unsigned int mtu)
+{
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, dev);
+
+	memset(dst, 0, sizeof(*dst));
+
+	dst->dev = dev->mdev;
+	__mctp_dev_get(dst->dev->dev);
+	dst->mtu = mtu;
+	dst->output = mctp_test_dst_output;
+	mctp_test_pktqueue_init(tpq);
+	test->priv = tpq;
+}
+
+void mctp_test_dst_release(struct mctp_dst *dst,
+			   struct mctp_test_pktqueue *tpq)
+{
+	mctp_dst_release(dst);
+	skb_queue_purge(&tpq->pkts);
+}
+
+void mctp_test_route_destroy(struct kunit *test, struct mctp_test_route *rt)
+{
+	unsigned int refs;
+
+	rtnl_lock();
+	list_del_rcu(&rt->rt.list);
+	rtnl_unlock();
+
+	if (rt->rt.dev)
+		mctp_dev_put(rt->rt.dev);
+
+	refs = refcount_read(&rt->rt.refs);
+	KUNIT_ASSERT_EQ_MSG(test, refs, 1, "route ref imbalance");
+
+	kfree_rcu(&rt->rt, rcu);
+}
+
+void mctp_test_skb_set_dev(struct sk_buff *skb, struct mctp_test_dev *dev)
+{
+	struct mctp_skb_cb *cb;
+
+	cb = mctp_cb(skb);
+	cb->net = READ_ONCE(dev->mdev->net);
+	skb->dev = dev->ndev;
+}
+
+struct sk_buff *mctp_test_create_skb(const struct mctp_hdr *hdr,
+				     unsigned int data_len)
+{
+	size_t hdr_len = sizeof(*hdr);
+	struct sk_buff *skb;
+	unsigned int i;
+	u8 *buf;
+
+	skb = alloc_skb(hdr_len + data_len, GFP_KERNEL);
+	if (!skb)
+		return NULL;
+
+	__mctp_cb(skb);
+	memcpy(skb_put(skb, hdr_len), hdr, hdr_len);
+
+	buf = skb_put(skb, data_len);
+	for (i = 0; i < data_len; i++)
+		buf[i] = i & 0xff;
+
+	return skb;
+}
+
+struct sk_buff *__mctp_test_create_skb_data(const struct mctp_hdr *hdr,
+					    const void *data, size_t data_len)
+{
+	size_t hdr_len = sizeof(*hdr);
+	struct sk_buff *skb;
+
+	skb = alloc_skb(hdr_len + data_len, GFP_KERNEL);
+	if (!skb)
+		return NULL;
+
+	__mctp_cb(skb);
+	memcpy(skb_put(skb, hdr_len), hdr, hdr_len);
+	memcpy(skb_put(skb, data_len), data, data_len);
+
+	return skb;
+}
diff --git a/net/mctp/test/utils.h b/net/mctp/test/utils.h
index c702f4a6b5ff9f2de06f6a6bfee0c3653abfdefd..9405ca89d7032d65fbfb92503fbeb884ebd8bd25 100644
--- a/net/mctp/test/utils.h
+++ b/net/mctp/test/utils.h
@@ -5,6 +5,9 @@
 
 #include <uapi/linux/netdevice.h>
 
+#include <net/mctp.h>
+#include <net/mctpdevice.h>
+
 #include <kunit/test.h>
 
 #define MCTP_DEV_TEST_MTU	68
@@ -19,9 +22,38 @@ struct mctp_test_dev {
 
 struct mctp_test_dev;
 
+struct mctp_test_route {
+	struct mctp_route	rt;
+};
+
+struct mctp_test_pktqueue {
+	unsigned int magic;
+	struct sk_buff_head pkts;
+};
+
 struct mctp_test_dev *mctp_test_create_dev(void);
 struct mctp_test_dev *mctp_test_create_dev_lladdr(unsigned short lladdr_len,
 						  const unsigned char *lladdr);
 void mctp_test_destroy_dev(struct mctp_test_dev *dev);
 
+struct mctp_test_route *mctp_test_create_route(struct net *net,
+					       struct mctp_dev *dev,
+					       mctp_eid_t eid,
+					       unsigned int mtu);
+void mctp_test_dst_setup(struct kunit *test, struct mctp_dst *dst,
+			 struct mctp_test_dev *dev,
+			 struct mctp_test_pktqueue *tpq, unsigned int mtu);
+void mctp_test_dst_release(struct mctp_dst *dst,
+			   struct mctp_test_pktqueue *tpq);
+void mctp_test_pktqueue_init(struct mctp_test_pktqueue *tpq);
+void mctp_test_route_destroy(struct kunit *test, struct mctp_test_route *rt);
+void mctp_test_skb_set_dev(struct sk_buff *skb, struct mctp_test_dev *dev);
+struct sk_buff *mctp_test_create_skb(const struct mctp_hdr *hdr,
+				     unsigned int data_len);
+struct sk_buff *__mctp_test_create_skb_data(const struct mctp_hdr *hdr,
+					    const void *data, size_t data_len);
+
+#define mctp_test_create_skb_data(h, d) \
+	__mctp_test_create_skb_data(h, d, sizeof(*d))
+
 #endif /* __NET_MCTP_TEST_UTILS_H */

-- 
2.34.1


