Return-Path: <openbmc+bounces-1128-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85419D0C9E2
	for <lists+openbmc@lfdr.de>; Sat, 10 Jan 2026 01:28:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnzxt35rcz2yD4;
	Sat, 10 Jan 2026 11:28:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.61.81 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767952032;
	cv=pass; b=RqgXgBydO9yuaL885G64AnSBSw+di5zoqgXb1/f6m1p1PpkB3iZvbUODejL8wB2/vMyS6nixD/+93NsW51BXBaTdGezBNY2CKLebM0yd/wYUqIAb4F7wgt3rUlocoR6/+koIvMxxxSQlprPLZGskShU7ntEoNJoeYIReOgroUJpSwKS1o1ZwSeI0+yEUi5eEqSfYuAYs/rTYlnMjsPIOn1lH98y6sbcRLQlqWRrXnbBFUqC35ZNgH+kpa5vEcrdwjdWAmeBYvM/kybNm0sJi4iD5PNBpS2wVBW2KrPNSIiLp+ojZdq4Vz17b7LBkWhmuRQeoO+cvL3LOUW0O0B9QJg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767952032; c=relaxed/relaxed;
	bh=9DsselwTlNs5VYwn11Yd5cZKdAob+jXe0bT3Cd9+TqE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lCccSrPiHgutzjQ2HHs1BeNi6maid1JdEkgvAQpIm5UGR9vhiLIjR32ixdxG43v0DIUSCCNalz2ecGUQPFyJTjXqvH/PqFZ9SXI+qtFCpTpy96MwTkxiLIJM2LgHRaKXykoOgvpF7YlFzUnQKNP0vKCOmPpEElXhoz/FwfJFEsMtNHCsKDksvhXoOUw6XsmlPJ55jQhmvtaNNZGkyNwAAMJiZuP2XeFygvtX3cCulYrTFih7WEuxzdGh/PwCsJNZc+RdCUKtI62C9Rsf49TSoeESahIndCjl3e8wE/YkB55UTz7v0pEkYLjNsdLC4K2icOj4JGUdSvIGhYGhXWkcPQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=ZYbi/bl5; dkim-atps=neutral; spf=pass (client-ip=52.101.61.81; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=ZYbi/bl5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=52.101.61.81; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org)
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11020081.outbound.protection.outlook.com [52.101.61.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dncPW6LdNz2xP8
	for <openbmc@lists.ozlabs.org>; Fri, 09 Jan 2026 20:47:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GTa1I/guvmmIe/SGuMFoRzHmBLudYNSbEfMIVJ6SqeRcsfFIV3wRjPq3IIhnIyrNcwN0OttJ0kcAmQccdygkvaQrn2vj0rWslOqj5QwKtppiJpD0STXYZ0BYylSKdgu7ktVBOWKO8KJRGI3g3nkIk5rZFAU4sPV86OU8D6FYAdqezLti1H3Gn6lekph07yL6BjlzzNGLbTBiHLyqU3RZIQoaw3zZmr7O+afCPydu7pbb43NjFdAeOa+G6IwYwKj7EwMZiLuYpAM80XnL09X3/hB5Of7RHYKww4MsYmKI40ObcbmZbwZKfI9mC8TjSL9x8JxcZmC6CXoj1H2i/bUYiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9DsselwTlNs5VYwn11Yd5cZKdAob+jXe0bT3Cd9+TqE=;
 b=egrT1PmO5wfwq7K917mHgU7dpCRN0UmuucW26FFr0BElzE5/G4pRmmeVazgD7OU9R00YCslHb3JS/UQlRtrqFIuguNFeNO4/6Ie7lLnc4YjJdLQ1E2qhuVe8kTWCpi/4nydmYxkaV+abTMCeXzAfOjGlMtkhd/FfBiZwtpYgUwIRzP+ZbLSyzlte14RUuyI+LEHt2HVrDiiTnltiEOM7oET6TbR7Yb+tqUtE8lBKN14zILSZ/dJp82M0+57AKRLph0NYX0goJIcGrUhxyEKtrlqp9cYqYVcDOlA2UkvkDpWK8IdrJb+LaN8pvzoNccGgPgUbEAqQSlWuNBFXh3HQow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DsselwTlNs5VYwn11Yd5cZKdAob+jXe0bT3Cd9+TqE=;
 b=ZYbi/bl59wQDJCr8FrBEwZUx1JOkcaZGMc3ZGU813q9WrBHBoXpnvYkXoITpMxJ3mZE1AIf79m3YCzpuieNCi3nEcTn5xrPqu5kPHYqPa9G0yvwcQXsoDSO+TIJRqGbTjkJo0ql6U5PBYp9C1h3QFZE0ZVUWdacZaYDa7FX6qusJbRfei18OMyGgEu1DtvueR5e0Rbn0JON6veffJuxwUGx4Ff3n0mz6G3uOpmoWo7KcpMsUnY/Vq9OhIg9GApbijnR27Y6eFvtZ0YN3i+LQCvL1vbwFkB5Gm3EuB0DM/MbJcYD1MLw51u7Wz/U++qYtZnCEXeMuGYWeWp2Cl0guZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from PH0PR18MB4558.namprd18.prod.outlook.com (2603:10b6:510:ac::13)
 by IA0PPFE0CDC467F.namprd18.prod.outlook.com (2603:10b6:20f:fc04::c48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 09:46:31 +0000
Received: from PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311]) by PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311%4]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 09:46:31 +0000
From: Tzu-Hao Wei <twei@axiado.com>
Date: Fri, 09 Jan 2026 17:46:26 +0800
Subject: [PATCH v2 2/2] mmc: sdhci-of-arasan: add support on Axiado AX3000
 SoC
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-axiado-ax3000-add-emmc-host-driver-support-v2-2-934f1a61f7c0@axiado.com>
References: <20260109-axiado-ax3000-add-emmc-host-driver-support-v2-0-934f1a61f7c0@axiado.com>
In-Reply-To: <20260109-axiado-ax3000-add-emmc-host-driver-support-v2-0-934f1a61f7c0@axiado.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1466; i=twei@axiado.com;
 h=from:subject:message-id; bh=yzpFUN5M0EFv70Lr65O/GUTkglKywIoyImMmx84fBl0=;
 b=owEB7QES/pANAwAKAXgQMF3EWvHXAcsmYgBpYM51zWrCh6FDIgrjGpV09qflF6Ujj1H5s/amO
 45rd3NhAjaJAbMEAAEKAB0WIQSZyWINOowtFmDvdYF4EDBdxFrx1wUCaWDOdQAKCRB4EDBdxFrx
 1xBmC/9t1PCZ4ZBezWCpSevK11yVsP2+rP046Cf1L0WuVwriOj8PgmwT8bQxDMh5l7U6ccDdTNo
 R6s+t76ccm0a+ELVW0r5sh6FykzwYZZvrvgOOYI+OeG7RG9VkBCqeusJE6ccloGqzWxQldRBb0R
 +TiBtg25TRsLNcxpPq7ji/81zyrVVHVgBqufAX4Rh4bOReU4dRgLkkjkQfnBEmHxaiPPD7MfaBi
 cVDm164b1lESJPOjt9nv36XAldTF7W4RRVZGNDWbKJ6B4BWHn6D0eqwWMZ+i+AjLZfMCbhB6qT3
 DV7CVSxFSMIv5fw31+XqjFuc7pKf7dgBKv4B5a0H8yTnsu9kCmDPSpOw3nvMXxRj81efMUjIIk5
 3dskSVLP7rkxcSxWYTC+aDaJSyVaGW25oTQ4Pg9+uzx5jCORr+dD9IOfiSHQXHoFK6wYTDOmUie
 Ti8Z+TLyaOAnnOOkvZ26Gx5nDsqqEBmh6Tp+ir9jhHTHlFLPGXMj3K4VqtL0KHtOvoDxg=
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
X-MS-TrafficTypeDiagnostic: PH0PR18MB4558:EE_|IA0PPFE0CDC467F:EE_
X-MS-Office365-Filtering-Correlation-Id: a9668dc2-0625-4a82-2737-08de4f63f81a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|42112799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MkJYSlhXd3pzYWVmVGRKajdoTy9hZUQ1d1VRampnREFXWWRVNk9jWFdKYW1y?=
 =?utf-8?B?V1N1aWE5YytvYmwxQS9RK3ZaRFdjTlI2K1VGeGJNbzB5eTlobGtvZHB4Ris2?=
 =?utf-8?B?bU0wRjVPY0RkMlNscFJhU0Z3Q0tkL3dxcVFxY2FDTHROMzZCejFWVnRKcytE?=
 =?utf-8?B?THRNUWxYcTlad2p1MklEZEluV3J6Yk1hbU8yTUlmR2xYcTFzeDJRR3Nab1ZK?=
 =?utf-8?B?UUErU2dIaEhobDNkcU9RMnEyaStoM1hqVVFXKy9kYTgvZTlxekxoak5WeVJL?=
 =?utf-8?B?Z3BBUSt3TWxBZm5laG1LN2tEL3YvUktZR2JOYThsVTBud0NicW1OOHA0UjIx?=
 =?utf-8?B?U2RPcDQyeE1LamRRVGw0cVA3ZC9ZdlFGSGNzVzVSSVJXTStmQmhqbGtDd1BX?=
 =?utf-8?B?M0VrcmZFL0ZXUDRERjZXUWxqdGQxcVNhOTZlY01QTll3U01LV1I2VHJlbkJG?=
 =?utf-8?B?RjkrUmZRT1FJZkI1ZmpUcGZxMnpBYUlFQ2lkTngweDhjajlHaU8xR3lzY3hZ?=
 =?utf-8?B?TFFHTmliS3FjT3ZBUER1QU55TElEaTNVbkVRRE1uU3doUDJURDRMTHdlOTgz?=
 =?utf-8?B?QU5ibi8wMTRzc0F1NFJUYURwSWwxVFlvWVQxeU51bzk2RlNMZE1yM3Yzb0xB?=
 =?utf-8?B?WFIxTDdTUks5SE42bWFWQjB3bWlnc1EvbUhmSkR2QXpkMG81WUVlekZhajFW?=
 =?utf-8?B?TFA2Q2pYTktnZXdkUXNJQTVOSGtzQzA2enZwNlZoZVY2clZRQUx4U2s3RTJz?=
 =?utf-8?B?SE5VaTZleUo3NmhCYkF1QW1EWjdldS9WQzdMUzNZTXArRlNlTjFyb3JMdWIz?=
 =?utf-8?B?Z0w5ajVNdDUyNStTbXd3VlcrQkJwZ3BzWFZ0MmYzSHk3RkhJaDVmR1Q3aktR?=
 =?utf-8?B?TWdjM01zeUtTUW5jdE53amVLY3U4OWlFQTBocGxIUGhQWXNsNnFEYUgrbFdi?=
 =?utf-8?B?T1pYK21MeXhWby9oZlZzWDdaWmNZSkl5NHUrQUlib0d2VjZVOWhVTlpLM1Mz?=
 =?utf-8?B?UzV4MGZNV1FJQ2p4WEZEc2pJOGJKbGFEdXZWMHNtbDNKOFVTRDVsejU2RThU?=
 =?utf-8?B?MExZMHNzWFhUNER4eEhBQVFtTkxtNzhqczJmVndyWlhMck0zZTkzcU56WnRm?=
 =?utf-8?B?ajAxbnZxSFRORTNmbzFuUG03VGNKdFVQek0ybzhhRnF1UUN1WTY1TDdoRVhD?=
 =?utf-8?B?R05Pc3pRbVJDMEZRamUzdTBRUUh3WGZoUjFndVJyVkc0Z3ZSOEcrQ1E5Mll5?=
 =?utf-8?B?RHpUQm9sVFNwckdYamk3dnpmWlFUV280czlPMlpqbVRNYVhpTDgrZGtRYkZt?=
 =?utf-8?B?VzdML3pOcmE3bVFMaHBmVmtxQTRGbDJRcE1HK0xVbHQwSDA0aUZlNExRVTg0?=
 =?utf-8?B?QnVRT0xvaUd6SzZOditwOFZUOGRLUFRmRDRxNGgrSk11QVY2Ly9ub2JuYzhu?=
 =?utf-8?B?VFpEZFFESTBURVhzVFZlZGJ5RTB1TmoxbkNDb3RoQ0I0VDFFMit4ZGo5a25W?=
 =?utf-8?B?STZ0aXkrRms2VHZFYWFHNThSd0ZNWnI3MHpmMTJLeWJuTzM5Vkt6b0RFNEhB?=
 =?utf-8?B?YXZQTVZON2FFV3VvVTd1VmVBb2hUNXJIQ2REcjloTyswZEk3VDFWL1pmcDJF?=
 =?utf-8?B?aXk2WTdvU00wcTBTZWZ0Y2RzLzZSOXhqZy9CeXdpOTJ0RXRwYzE2WVlFd3c0?=
 =?utf-8?B?c01ya1IvVmNzVHFmcUR4a0k4YzhIMDhSWEFicFQxb0JpOHdBclNSSHY4YUdh?=
 =?utf-8?B?OUdSdm1USkJIMnBBVXl1cG9CTWRGSjIzelcyZ0hGZFZEQThmYjRzaDNMbjY0?=
 =?utf-8?B?dGR0M2ZraUpKRkhOMEh4SGZ0aVh0Zkt0cnFpU2R1TU5mczd6cDJyamFOZGhL?=
 =?utf-8?B?UDJWaWttb1RhWm4zR1VZWkdmY1RHNGVQOS91SGVaQ3dVTzNTOVdMT2s2enQ1?=
 =?utf-8?B?UkFoOW4ydktJVDZtZ2U1NUl1U1MxMUI4UWhLN0xNcGNnNzczSCtBTW01ZnhL?=
 =?utf-8?B?SVJ3OTllbTEwRXpMdXRyeTZUbjlwN3hBNGhDN3Bob2JaMVpJelkxeUZTbDNw?=
 =?utf-8?B?STROV2tWcy9Ha0M3Q1I0WWkzdE9jSkZGbUZUQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB4558.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(42112799006)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWJNVlVtcWxSUSs1MmNqYmZjd1liRFpLNVAzQUpGVzY5eGRYUHpWZ2xRNnJX?=
 =?utf-8?B?SVNMS3hnZ1ZrcmFWRFBBU0g1bjhkWThMbHZzNEI3TjFUc1VSWDlJV2gwMVpT?=
 =?utf-8?B?OXZJTVZMTTM1QUQwY1VoMHRYT1lYQmVhUWYyTzVueWJlRmpyMWFYaUFhNGYy?=
 =?utf-8?B?TkZWM1d0dWczK1BISTJha1hyR1hSYWF4TGhKSmNEdFN3NExuOE1xVzdoSjBF?=
 =?utf-8?B?TEtmWmliMktXclJsRWZ2MkUzdjFJZlhFNUJoUm1JWGFpTFNOOXV4TWxSSzlx?=
 =?utf-8?B?V25FL1d4d0t2MHVrcEdMQmlBbjY4bVdyajB1QkZ0ZXZKSkhPbG9PNnBMV21s?=
 =?utf-8?B?OEhHSDhraU5Cc0paaitBR2Rub1BXVXNjZGFaQ21ZSElXK0NFbVJ5WUoxYTZJ?=
 =?utf-8?B?MnBtS3NkMmt1cEc4Wmx6Vy8vU3UyQXMycE8yNlRQRmpnQjNmSzZVK0oyYU9D?=
 =?utf-8?B?TWdudk9Ib20yYTgxeVlRdlZENEluZ0pwVk81bm00NnJ2UjcvaitJQVZUZVZw?=
 =?utf-8?B?ZzdvZ3BLUFQ1K2ZOeDBuSFljVVVEMHVZdEw3MEJrd0ZaaWg5bVpLaGRWdnht?=
 =?utf-8?B?eFl5RTVtMEwralU3Y2FvRVEvUXZnRVNlcjBSN294VE15bEtXWHhHNFM3ZEVF?=
 =?utf-8?B?VDZZRjc1Mk8waDkycWZza0xkUUxzSVhXa1l4ODFrK0JNTmhwZlpZL1d2L21m?=
 =?utf-8?B?TktLRVJvdzZIb2xpY0hwcytkMFdNRWtKTTZtaS9TTzhmYmZ0K1krODl6azda?=
 =?utf-8?B?RHo1NXRKdzl3NUFxc1dmSmx6NHBJODdVNUdySUFSdmNQMHowRkthYnE0UUZG?=
 =?utf-8?B?ZUV4RUtMdVRlRURYdGdkRjBnR2xDZTVyalEzajRKVlhNRHhUbFhZN2ZuSStV?=
 =?utf-8?B?MG1oQXlCUnowaFcxRG9sTFo4dHFMMmRjaXJ0ajNGN0lrZnUxNXZaWWI2dFVP?=
 =?utf-8?B?Ti92U3c4SkV3czIwczJkU3A1VmVpcVpueWUxeWdHQ1NKOWc5MkE1NGJkT3Bk?=
 =?utf-8?B?ZHB4eE1FVGl0WlgwL3p6dzJpdnliWjlVL2NIWnRHZStKVlhQSzgxdURKdDRm?=
 =?utf-8?B?dldONnM2U2pwNVdiUFd3Wnk3cWp0TVVWMHhoMmErK0xBbGRIQ0R3WVdQVVNL?=
 =?utf-8?B?NnhxTjJzd0EvTmtvSVNjWnovSVFSRjVZZ3Yrc2JPNkZjUXNGK3FpWG5xSjZw?=
 =?utf-8?B?Q01neWFuWStsdjdzZ2NEaW9sTTZkcDhjNFFMdkRPTVNwSnkxYnhsU2FoVHIz?=
 =?utf-8?B?TnBTaHNLQlphd01ScnJLcnh3c05iUGxUb1VSOEZGZjJKdFhWTDB6ZE1kYUdh?=
 =?utf-8?B?UU5XeXMwellxR0hwMzJLUG0yV0pLRUU1bzBqS2RNZmk4ZTFUcE1xbkxQNTc1?=
 =?utf-8?B?VVRXTkMxOTFVcmRic1JROHZrNy9zMjAwUU1NMkZkUDlKcUNSaytsR0NSUUxJ?=
 =?utf-8?B?VXBpRmpNbUtOeHVMeE14aUtDMDl3ekhJY2gwN1pndURNOUpCMGw4VnUyNCtX?=
 =?utf-8?B?YW1aYVB4aUlYb1B5bTRCMEpUTlhzTE9HUFVieSs1MStPY0FXZnhYRjBJbnRo?=
 =?utf-8?B?RkJqL3pHN0ZhYzViNEI5Sk5tSTA2cnl0YmZ2c1RCUDVnb1JUeE1BT2ZkS2Zr?=
 =?utf-8?B?WHBPbmROdU1nTUFaN1gvL3dKNitBR1hhSFY4Tldib3paWW1pL2lPQ0wwekFt?=
 =?utf-8?B?L2hVOHV2MitWYy8yRmxIQklkQkJJMnZUV0Y2Q1oydHg4bmRjYXR4WWE3aFlC?=
 =?utf-8?B?NlFuVjNxNktxSVR5M0ZiNFdqU1Y3REZGRldkV2Erd2I5OFFmVlV6RVRCNTBD?=
 =?utf-8?B?bmloRWE5VmVlQm1lZDFFOE5VdHhKSml1aW5NY1l3OHhOYVRuMkNXWlczbC9v?=
 =?utf-8?B?aFhxNG1pK2JrOXFYdnE1b0hhVHdGV0JNU0gzcW02MkxNdE96UGE4UFd5aTRv?=
 =?utf-8?B?cHZUUVNESitkSGIvQzVWemV5YlRBM0VVTEVSc2FHSGtuSHpCQjlscUViK3pi?=
 =?utf-8?B?Y3VpSGNzeTlFbEF0em9MamwxcFVHSC96OUgwSlFBeEloV2FjQUJ1bVduZW5Q?=
 =?utf-8?B?b0E4d1psSW0xc2lKQTZBNkUweUVlVjhnVzl0NlBEenpFRFdBcE9sNnp6K2d4?=
 =?utf-8?B?Y2w1TW9rREUxRWt3NlpzTFVPTWRGb2VFdHpZb0NTVExlRFJFZGhUdjBtTnpa?=
 =?utf-8?B?VFF6ZzZFVTNJcjlYTG1hakFScU8rMG5ZL002L3JPWitNb3hTUzRyT1hTWEZD?=
 =?utf-8?B?SVVrT2hzcCt3R3BNLzBqQlFKVENCdVMzcENvV3pNUWw4ZFIxNzNUeE1ZRlVs?=
 =?utf-8?B?d0hRelpsUG1kdHAzRExUU0I1cks4UjRtcCtINUVNbW5Yekl0NS9EUT09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9668dc2-0625-4a82-2737-08de4f63f81a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4558.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 09:46:31.7771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9e+6Wgq8E7xlGCRTo+nQNhKWh+As9p8dzyoR5/hwLZ19TqnoIiT2SWUMN5vG9dHs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFE0CDC467F
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: SriNavmani A <srinavmani@axiado.com>

Axiado AX3000 SoC eMMC controller is based on Arasan eMMC 5.1 host
controller IP.

Signed-off-by: SriNavmani A <srinavmani@axiado.com>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
---
 drivers/mmc/host/sdhci-of-arasan.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
index ab7f0ffe7b4f007a58eb0a26868b08b0b02b40f3..5da915edd7416ab5c725a784867098c5e19236b6 100644
--- a/drivers/mmc/host/sdhci-of-arasan.c
+++ b/drivers/mmc/host/sdhci-of-arasan.c
@@ -1512,6 +1512,16 @@ static struct sdhci_arasan_of_data intel_keembay_sdio_data = {
 	.clk_ops = &arasan_clk_ops,
 };
 
+static const struct sdhci_pltfm_data sdhci_arasan_axiado_pdata = {
+	.ops = &sdhci_arasan_ops,
+	.quirks = SDHCI_QUIRK_BROKEN_CQE,
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
@@ -1538,6 +1548,10 @@ static const struct of_device_id sdhci_arasan_of_match[] = {
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


