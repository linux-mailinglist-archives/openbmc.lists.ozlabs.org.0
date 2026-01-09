Return-Path: <openbmc+bounces-1131-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAB6D0C9EB
	for <lists+openbmc@lfdr.de>; Sat, 10 Jan 2026 01:29:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnzy73FmWz2yFm;
	Sat, 10 Jan 2026 11:28:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.93.196.138 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767951873;
	cv=pass; b=lvbQX+t4tvb73RaWkvD0yijsLQ0xqrO4QPIsKj7dkat0Cd6/NZVpR297mAq9xBFcoQGX8HbSJMTX3zsKwVfYPP+D2siMcUp0WgjDUynpVa2zifCSfsx62BAn9D4+iOHdhM5zhcEGZHECID4VfmBZbDyt5BvxV/hfJo5LdHvmPz6NmQkUvkF6N3e/75raBnbeM6egzVY5lt/Xw0k+dAhrr0uHZfqz7Vvz4AuYHEvwmzvA8f/rjWtlWKWfvUNTqyW/KyktYnX2PSY9G3qJNZ5raTIn0+YLt+/Q2P2MGzybL6LgHgLXw2wnrGmT1eOBdiEuyAn3y06ewO2rfKpWujBSmA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767951873; c=relaxed/relaxed;
	bh=50PX//GhTje1GAz4lQDZeI+bHC2updOMlm/tzkU6HJk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZNE1xMPl8l4aqi69MuYo/QOa0IwCWbivxbOxdjflteDyxuIiDLL/lKPK/49sp9D7lBIp/1OuUF8rH/15Cmhfk1pWc3pqgHPdgkqxcrGxhv/BZVTCaxee2aRwZ9nSEZTW88zJ7mZsENiXKOajNuQsySa3ftqN08QVSQetiKGJLmazoERE+CMFUWAUurEs03x2dgq3+5YKcVMYG8QUr7d9p8chwqTbsVFItTT3wRQtrSboTPgC4JYf1SZZa06zeLqB9YycwzTFdigUuXoDYoLFektJeU4laObSHSdDuxnhiqTQocxGKOITX2ADckDgtnn6Q9ptXkWJDHi5iG0kvIoy4Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=fHRvrIK8; dkim-atps=neutral; spf=pass (client-ip=40.93.196.138; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=fHRvrIK8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=40.93.196.138; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org)
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11023138.outbound.protection.outlook.com [40.93.196.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dncLS722Fz2yG0
	for <openbmc@lists.ozlabs.org>; Fri, 09 Jan 2026 20:44:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XdHLiVWB9DIbQEwiskexrpMARI4ioC1/LRZYvnfkGECGYmRvZzuEKa5opXJyZ5L79GWNl6+2fjwjWgm8qlz0Le4f/PhQ8QczGmDGBcCRxKWnqDUgmApXsxyvaOsaWbxuYClu/jBMyYi4RUckQy4qJW1AGA70umB/mRwZ9I3qISpelAXqZlovApHSLQ8iYe6+1LCMv3JD502F5rFJvLMNW+tJCDPLtAwsUbgyheiajp5BFyRNF2C/k79NdqF5kfnca47xJ5JYfZn9u83jp7+gD3A3gZCPsUdMizFw5zY1e2azB5KybD7+8J0oxYj+qb9AXXkxCw8fHm0ikKHrK1s41A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=50PX//GhTje1GAz4lQDZeI+bHC2updOMlm/tzkU6HJk=;
 b=qYYy1n1halNoLl2DaG6g4bnYtaJwhvSKODYBCLLDD+FS5W6rfp0PRsKZwKJ0aKbXMTy5O7yytI5+jk2YX+/LFuBFtKSDSq6wS5fy43KPqfvt81dNP5fTZoH94rGhHrroOw5hkPxn5LMHoaKnSMWYjgU8dF6h9dua9lHaXMhTfgOWFTWecLeH/MKj3MKSd0iyAZpmoI1pZyecN7VLdENJBLNagfDPdatyDhVO1sWADFcVuvxi+DKelHHf3vA7/XoGkvRmzQMoFrW5wwx0vqd96yu+okkXCp3FQi92xv+al1x1W3tR1SkfYKU18xcE3teSO4jAOcCMeMCOx9iDwQ3HYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=50PX//GhTje1GAz4lQDZeI+bHC2updOMlm/tzkU6HJk=;
 b=fHRvrIK8sFHOeo2W3nH/hBg62nhcYpNPiPHt1knbhvpmuXTNje97SVklTakSf5E8yIWdWmAmZFVsqi3mAz7OgmMFFE3AbREY6m3vAbF8CFSQFcyfS9L6CcD77DqkN3fYOLlLVzgR70McBDfj4pET8r4pu8gL1uCs9g66ZB33WUTP1syngX6CDato5e8cV2NDyJ30hcDApG0e5dYY3eIJNf1nX4SrMhMDhrze6QsHMofSAVOBz0hudyBw8IFnr0I6nZOpJ3hiO0t5keBPk/pvAByyczWJ6dXKPdGO/8duMpLePk4vBVs4Mraz7/f2avn1HqW3u1F93m+xlYBARNXZ8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from PH0PR18MB4558.namprd18.prod.outlook.com (2603:10b6:510:ac::13)
 by DM3PPF538CF913C.namprd18.prod.outlook.com (2603:10b6:f:fc00::6a6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 09:43:48 +0000
Received: from PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311]) by PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311%4]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 09:43:48 +0000
From: Tzu-Hao Wei <twei@axiado.com>
Date: Fri, 09 Jan 2026 17:43:32 +0800
Subject: [PATCH 4/4] arm64: dts: axiado: Add eMMC PHY node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-4-dd43459dbfea@axiado.com>
References: <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-0-dd43459dbfea@axiado.com>
In-Reply-To: <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-0-dd43459dbfea@axiado.com>
To: SriNavmani A <srinavmani@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Tzu-Hao Wei <twei@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=895; i=twei@axiado.com;
 h=from:subject:message-id; bh=NOMsm3atZIRiq7L4gvQJhZNVcg8FIdt6XYiz5M2k1FE=;
 b=owEB7QES/pANAwAKAXgQMF3EWvHXAcsmYgBpYM3Qe/+Gj1HuTe/UEkN7Dzr5ft6zXrpCgRFyR
 9CMLXmnGHSJAbMEAAEKAB0WIQSZyWINOowtFmDvdYF4EDBdxFrx1wUCaWDN0AAKCRB4EDBdxFrx
 13UsDACp7qwtXyd1pjihjTJbFwGLG7aFJAlBeLBtH0Ncce4lhVqCJyKVRLgLnj8GD+G7C5ipYeG
 uB7XBw/OcFG5dhhJUvAOaGzqcJqNU/SPskgl2LmFCP/kmaOPrEkmF9Mrs9WVoU0N15HdTfGrVpn
 2SWjPXyJZK/X+79oDzJKiDX3bqVskJa3mS6Vaf/QT8WvrERj2ZSMd+Pv+8Biwlt+1cd8sxgwyUQ
 HjmfaB/KFwnRrHXxYn7OiFvZsXZFJx0yjahzmXhBeNbxQMPGzCcpgFOHQsQU3cYiE2cbQwhxWS+
 R+N4ABK7wZPP7X6u0TddyD2ZTE2A/ZxhWcxtnLpmeoJVDdbincUuazFru8Yf4O67tPPUYhYHzmV
 m93zZRam5OwulqxgABYXi33ijXB/wk+WoUki0YPTeYu4mjECw2fb7qDxNBZyhiTSON0Dc8SbAkc
 aNa5iF9PDgMAPRBkXvJ+K1IDQiIgX8FA7N9GOZvqBzC6Xnh/zga/A5gEVY1QOn6h+sX2o=
X-Developer-Key: i=twei@axiado.com; a=openpgp;
 fpr=99C9620D3A8C2D1660EF75817810305DC45AF1D7
X-ClientProxiedBy: PH7P221CA0009.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::28) To PH0PR18MB4558.namprd18.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: aa2706b4-471e-4bbd-8da1-08de4f639679
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|366016|376014|42112799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UjJpYVNMbXBGOUowQjR1b0IzUENlVmJZdjZFeTEwQ3FJQzM5NU9yMmE4a3Yz?=
 =?utf-8?B?ZkZNMmRseDd5QUJlaXE3cXFyMlpCK0Y0NGxFOG15TFo0Y0RIMzVkRWZmRWRI?=
 =?utf-8?B?STk0cHcxelJHY3FjOXBLT0tuZ3JZN3hXZ3BiZ3RJUTVWOHNxU21FT1VxSkdX?=
 =?utf-8?B?bGEwcW90ckhIOUNlSStSbG1zREdodDIzOGhGdW9Helg3UGNkVkNnaVlQMUN1?=
 =?utf-8?B?MzVpazJvS0NxbHZmVmtqdWtlMS85R01YN3N2MDFKcmZzUXF1M2dXM2wycndG?=
 =?utf-8?B?VXJDNVdSV3FvaU44b0pVblIwYTQxWmJMdDYzZGI3UXV6U0pTN0xQazdGTC8w?=
 =?utf-8?B?aW9DM1Z5b1dNU1ZIQlNNdEtKblhGV1Zma0hMWUU2ZnFXU09Fa0tCeGVyUTBD?=
 =?utf-8?B?YlVkNUVFbndpcklmcHlLZmZqanZrenhYMHNYcHNoVGsyT3RCcW5hd0FRZktV?=
 =?utf-8?B?V1hkM3dtelhxU3FTek1ZV3RuVHRYSnBIblBDVGFJakthd0dENVU2VWFxdkta?=
 =?utf-8?B?ZDhldWE0bHEvU1lCK2EzeUhtd0Z5dEk4djhUSXAxejN1WlBEUEViMzF2bWJW?=
 =?utf-8?B?aFdWdGFlb0FWNnhkMEhLQjVQd0lVWEhEanZPSlkwMkU0a3F5SXFTdG5XSmdz?=
 =?utf-8?B?TDYvRUpscTk3cHl0R2dwbjVFWC9NdThSY285TXN2WS9MQW5oNWU5U2xxUU1j?=
 =?utf-8?B?YXYzUFUvZUJuVkdnQVhJSnpzVTBsem9aSGhZREI1a1J0QVBUY2lHVjc5VUd4?=
 =?utf-8?B?c2YwTmt2Y2hoTFB0UElIajg1WGdZdmE2Wmp5NXZCTjdJNU5NSE1nbWhlZ2o4?=
 =?utf-8?B?Zmc2WjZqalZIRHI0L1ZpNzJhMkM0anJEc3ZwOUs1YzVHNnQ1MnduL2hKc21j?=
 =?utf-8?B?MzVtUUNZVjVGR0NRZkJkelJWVzZFWUprQUl1TUJtbkgwQjhWRngyR0NBSzhr?=
 =?utf-8?B?ckRVUFlQL1lkNndvNFRsMkhDN2JpV2M0Mzd2VFJlcU5haTFRc01XenhVZ3JB?=
 =?utf-8?B?RERqZHl4MFI2bEdQaStINHEzVXRBbmU5NnRIWlQzK1gxeFdsR3FvNzMrRUd1?=
 =?utf-8?B?UmFPd0JNR2lZeUF0SGEzMktzempQV0QzVEdiSXRNRnl5U2Fja3lvYU96QitV?=
 =?utf-8?B?SGNIQU9LelBSc3gxN25NSUhTTjExUGxDUWpHZnA5YjlKbkpxQVlpRHRqRlNW?=
 =?utf-8?B?NmRxZ3pDbHZOaFlPOXN6WGxtdEQrRWRWZlprTlJ1QkN3emdvQjNMbW1OR3Ez?=
 =?utf-8?B?eHNtcXU4b2YxVmgxQXcvd25qekF5MGQ1OHFBUWErSGJnQW1aZ2w0dTNjTlEw?=
 =?utf-8?B?WVI4SWNuTWU5cXNmTGpiS1U4K0FGak1VU2dYMFllT3VXTWtlcWJNT2dYL21H?=
 =?utf-8?B?a3h1c24xbnBVUm9SblRCVlRGaExpdnNkOFJpR21XN294VmQ3eDl0amdEdmhy?=
 =?utf-8?B?TmIveGtCMkRpZjNHY3R5MVB1eGJrRzNqWWdwVDF4dnFQdkJUeW93eDc4dngy?=
 =?utf-8?B?ZkU4V0NmbE5UYVV6bzNJR3Q1NmdYYXYwbkRralE3VmU5L2U4T0p1aTJhaG13?=
 =?utf-8?B?eEk4cU1Tb3RaVVM1a3hyU1ZuWWtPWTZsZEF4dktTWTZHcEZ1a1VBR3dHaFo1?=
 =?utf-8?B?TUo2a1JCclBBZW82UlJ2QUZpMGo4TDI1bjN3dHZiVTJRaXUzeDEvY3VqQkpX?=
 =?utf-8?B?WlhvRWdZSVVaQ1hJVm5Na1cvZHluQkdINXFTWkZWUHovM043VXdMVHdMWEZN?=
 =?utf-8?B?Wk9NckJRbDlIRFBacysyQjhjYVRTYVRnS2Z5TStZNElPL1o4MW9CTUtwcDNV?=
 =?utf-8?B?OTlvY1AwankrY0pLZjV0RnJDUnQ2RXBGUEVrNk5nZlEwb0RUeW1qNlVHSUtz?=
 =?utf-8?B?MlFhUExkT2lxU0Z3bXgva2wxSUt1cGZveFU4blRndzRkRkQrRGQ4NndqZUhs?=
 =?utf-8?B?dnh6WXNia1haSFRjSFU3RnlkTVFIbnBTc3p1WFEyMHprUG0vWERLbXA4ZmN3?=
 =?utf-8?B?dUlneFR0M1lyV1dOSEpFd2NLYklIeGkxOHdUSFZ6Rm4xcTBFRGJQTjJnQUFX?=
 =?utf-8?Q?yp7mEI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB4558.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(366016)(376014)(42112799006)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXJPeFBGZUZNUWpoN3R2dFpoSUpGcStRMkNtZFpvWEtBV3d6cWh6Tkg3RGxV?=
 =?utf-8?B?b04veVRVcWlhTUFGUTNYTzhMektwTGFyZ0hSWDNEdTMrQWhxTkZvR1pabmhp?=
 =?utf-8?B?OUcvcUVicSszY0dHRWx4NGx3NW0xLzVaZEJnaitQNWtyZTZuUWxpZ0t1VDcx?=
 =?utf-8?B?a1p1UC9lcEw3eFMralJBWUc4RUxJTkpDbzZnV0VHdUpORmlFSDVrSVgrUWU1?=
 =?utf-8?B?QnlrbEZHdlo3Uk00TTlCR09QN3kwTU1yN1JJcVB4Vi92Y1dtZC9jM1pzdVpw?=
 =?utf-8?B?aTBLdy91ekdtUVptQ1ZieWZndGl1eFpGQ29NdVpaKzBxb2R0R21Yc29yL0ZV?=
 =?utf-8?B?NE8rRmY2ZVBwQ3YrL1pURnRkbGI3MTM1THFEODBtWVFLUlVWcWFMelJzRHBI?=
 =?utf-8?B?a2c0OFJWNDBlNGwxQVFyRnJUOE1xSDdlMVRKRG5SRk1oU1ZtMGN0YTVhTmQv?=
 =?utf-8?B?WE90SXZxclcyMzlIeVdmbndxa0VhYW1USEEwcUV5WEx1RE15eG9pTTExakdt?=
 =?utf-8?B?bm9qOHlUc1lZZENrSkREbFJZRzRiVUgxWEJQOG5EOVdQUlpYSHV3Z3E1dnA2?=
 =?utf-8?B?RlNiZ1R0cERKcm5XNG5GRGw5b2ljWnN4SG1mVmhSejRKREE3b1VpYU9YSngr?=
 =?utf-8?B?U1BtQ2wydzZxUHJrSEt4ZGlURWV5ZXlQNXEwNC9iby81NzFoVW5iNlptc0dM?=
 =?utf-8?B?K05VOVNHSmpEUFdTK1o1ZlYrb2ErSXYreGEwQzhUVXJpcmlDUzdleEx3eG05?=
 =?utf-8?B?dENhMnFsSCtIQmRmSFB0MklHTkxaQTBuSGhMOVNGY003MnJsRmxUZk1xT0sy?=
 =?utf-8?B?Zm0yeHdNT3RaWk1PK05qQjIxSS9ISzFjUXhVcnRYK1dFZkc1RVowVlBabTQy?=
 =?utf-8?B?TnliZUhodE5VQnNoajNmVHNtNFVqejJWZW81YVBkR3VkYjZQQitzcE1pbFJS?=
 =?utf-8?B?aGlJMWtVQk4weUdCUjRIWklicDlON0k3dXZaYlhXSmJucXRHMWpqRFY2Uk5K?=
 =?utf-8?B?aWxwYkEvRUIraWxDS2w0dXF1MlVUTFVmUWpWRlh3d3pSSHdFNkNpcU50OGl3?=
 =?utf-8?B?bGo2QTB0UHFRa3lrT0ZGNlZnNktDT1BKS2s5bjFpMEczUzhUUFZQbHB4Tk5u?=
 =?utf-8?B?TkgrbnlGZW1uMGp5SnpaS3RxbDcxYjlIUGFuT3BFN1Jkby9STmFPR21FcTlq?=
 =?utf-8?B?WXZ5RXcxUldQOTdYaFdhOUxibUhKNTQ1OVRpS1UvUjB5YmkvTjQ0bTNJQTIz?=
 =?utf-8?B?QTY4cXVqazZtVGN0MWZjbFBrN250K3c3QXh1TnVEb2J6ZUFabnBiOGJZUCtM?=
 =?utf-8?B?eTdHUlpCUWsvcFhSUERzUWxRSXVmQ3Y1WnAwSjVOaW1mRTRhT0tYT2hEemww?=
 =?utf-8?B?RHpUMXVtTkM3Mjk3bHZqclBPWU9uWFhRSnNJWTVBOENncC9lZk0xY29ITmda?=
 =?utf-8?B?VWZEM1BxWDluRy9rU3krK012UmFhTjV5Mk9mOXdzdjZZUy9RbGx0QkRDaGN1?=
 =?utf-8?B?d3ViakZaY1VIZVUwa01WNGlyMFRmbFBpdVlDcGRLRUM5Yk5QQVhIL3A2TEda?=
 =?utf-8?B?Zkc1cFI5dXI3ZTkwN1Fla3ZOYS9uV0ZVVXY5cmFlRUlqVWNBV1U0Qi96cUkw?=
 =?utf-8?B?SW9sQVU3VmlyRTlPaW93YkRRbGt0YWFGYVN4WGhkQnNLb1lraTA1YUhZT3Np?=
 =?utf-8?B?ZWIxaThTWFQ3aWZsS3RXWitLN0JicjVkVGVIRTNQZEh4NlQ0dUdBTlNNTUln?=
 =?utf-8?B?cStWQit3Vms1bzZsVTh2TlU0ZDF5Y1hFSkNzdit2NGdUTnZ1S1NLaEpMTDht?=
 =?utf-8?B?VVh6dFY3YjVlVG1lYmk0NGZ4OUIwL244YUlTV0NQcWlhNFJ5NS9TNzF2Yk8x?=
 =?utf-8?B?WlZhY0NxajllcXJwaGUzOHZqWkxmZCtUclRGV1B5TnM2TWl1T1BrMGQvblRl?=
 =?utf-8?B?YlNQWEdEZDdBSmlYQkZiVW9WNmJjRVo1THM3TEVWb04rU1hjVzJNZ2xISXlX?=
 =?utf-8?B?cmdnVU01TDlKQjEyaEp1YUFiMHQ1aW5aZFdEbGxwdFNwMzR1QWpZVnE1akc4?=
 =?utf-8?B?K0s5M0xTWmY1Uk1BOWQxOUlMczdWUGdnUUYvRFd1K2lEMWZlVWE3anJnRDEw?=
 =?utf-8?B?K3pQVW1KaXlpZFlNUUFCT01scTZETFRaS1FuODg1Zk5iU2srNEFRYWR6N1d4?=
 =?utf-8?B?aUdtcUxoTy9QbThMWUllOVc0blBxS2hiVUNjWmhCVXFSVzc3TEl4N2JNeDRL?=
 =?utf-8?B?cDBuYWp5ZDVOcTJlNG82REF4TVo3ZjNXQm02NnVZcnlMY0JnMDhDbEF0Q2VC?=
 =?utf-8?B?VDVBVy9vMU45cFhNTU9zLzhFWk54MHd2N3FQdm9pL1d6dHNUc1BoUT09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa2706b4-471e-4bbd-8da1-08de4f639679
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4558.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 09:43:48.1218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J43LgAPhVbB3mwpAF/SgjuwmGd+9H6Fg/oS2vG4InIpybUpUnp00rnz3BTPYp3tb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF538CF913C
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: SriNavmani A <srinavmani@axiado.com>

Add the eMMC PHY device tree node to the AX3000 SoC DTSI.
AX3000 has one eMMC PHY interface.

Signed-off-by: SriNavmani A <srinavmani@axiado.com>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
---
 arch/arm64/boot/dts/axiado/ax3000.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/axiado/ax3000.dtsi b/arch/arm64/boot/dts/axiado/ax3000.dtsi
index 792f52e0c7dd42cbc54b0eb47e25b0fbf1a706b8..4694a9fd94c53a4bd6d752ba8001fbeba74594db 100644
--- a/arch/arm64/boot/dts/axiado/ax3000.dtsi
+++ b/arch/arm64/boot/dts/axiado/ax3000.dtsi
@@ -507,6 +507,13 @@ uart3: serial@80520800 {
 			clocks = <&refclk &refclk>;
 			status = "disabled";
 		};
+
+		emmc_phy: phy@80801c00 {
+			compatible = "axiado,ax3000-emmc-phy";
+			reg = <0x00 0x80801c00 0x00 0x1000>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
 	};
 
 	timer {

-- 
2.34.1


