Return-Path: <openbmc+bounces-1132-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 865A4D0C9EE
	for <lists+openbmc@lfdr.de>; Sat, 10 Jan 2026 01:29:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnzyF59xMz2yG2;
	Sat, 10 Jan 2026 11:28:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.93.196.138 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767951872;
	cv=pass; b=S3sN0cbkYDDCwfLVZP96MoVczH7hL5bia/8NoGHvtjZcoCfv5CKrf3dtHpdZCrHwD6uWqJrcZ7/Z4UxJ2e1y8FYc3Q0/y3r0pC0I/VNcNdcmAOcso3T9EwevbbUOo2DcsnoeTA6JdxAsGVu6tvbvhl1OEHDGh+2HEjwqmhwBTDAiZ97oieqtm+8EYUQJd1v2VLKi0cQi0+r8ORusjcmdP+o4Wo+xeZGlkK9F/7rja+ZNuCmyqPYhZlcab6dTqHsFPjFCNNgol5C75ac+l7CNesAjJF9W+U83Oop1lZBiorPFYgsXzgvNSg1dY5yuk/BHd4lSqJ7uF5NRQ+dVwz67+A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767951872; c=relaxed/relaxed;
	bh=A0jjoSsfAN8WW80JdRkfVcvZEyXFWqGRF0i2Nn07QnY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=albrZ1BX1+44foIulMMBq8yzh49R/F+MtmT06fVNR3ijXYbzn6OnAprVZSKSzuKfn/+70vxI7u3tLcGANKiso9647I97wkNwWF/uefY/cGwbuggnfYQIGpAGiMyXQUTNI5snO+8ufqoCzMZwd1dDqV0t86sR5Ptais+454ykfN0myFmi2w4juIfGLR6NqJWW8I3WhLIcgKwcllcsGeWZo47hlD0jyjkaFNRqPsWBd0xPGllTFTFyvOwHLcN7WHrr5LaRMNLExGCss1+/j0csiI5J4hUkRdP3whZoEJP/KnbeRspL+cRBJ30CVbluNdF6mA3K9SwLBMpOVzUJrsL+Kw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=uF29uKJM; dkim-atps=neutral; spf=pass (client-ip=40.93.196.138; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=uF29uKJM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=40.93.196.138; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org)
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11023138.outbound.protection.outlook.com [40.93.196.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dncLR2H9qz2yFs
	for <openbmc@lists.ozlabs.org>; Fri, 09 Jan 2026 20:44:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KpQNvy2MKaWV3v1hUWWqbTuLUiEv1lZIZz2gmEKZaTHBu2upbtcDavy6S4jVZF8taOVEoB2jo4RlZjQxBQUxI9KU6UOJ9TIPA4nSpohl7r3mYzQ/ZAaSFrHVvClIsmLuGKLq+YZoNdBRhw+ErWr03F0Yv9Yp0wxtaZmAU44m3wNDkWKZYiaJUPEPoienTwUsJX5H0H7VTa/Xf2CIFMhVtsV0O8LHhODDtSZuIa7EIxrtutNwlZ685JPG/nBGfl+0G0OxYyzx7RneNkCBD9vhZH2FLkY3JPZTVY/4fscfenFYHSPOg2t7ea1IYz4mSIi6PsXj9ybRAgR1PiX5PlGYMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0jjoSsfAN8WW80JdRkfVcvZEyXFWqGRF0i2Nn07QnY=;
 b=tBMQYi/wbOpDvJ5RBvxfGJjoktmOa+YdRDi6g1QUxd2D8ihfzahgbzeAW9tH3iAPvXsNCfAeRMU3OAAaiZAS84SLEuxPZA67Fg4fPAE17xzJ162Ger6s4umg4WyO53F+LP/fO9bThWAYuFJB1d/XklZaMfBo5nuezqRc6mSx1rhVriydtWeHdZJN0zgFd79+9Hhe4D9sa0WpFNBgt82UBJHHfNE5w0dhc5BMpNkJA7E7ILQajtvIEUj0VyoFxh1/1h+dfCAnMsf6sEjrwELx77VDiDlqTKXi/NCyyr00EsG4SfpMArYDZkKhkj6RXoE6jI34kYkCZ+NELxkw4kps7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0jjoSsfAN8WW80JdRkfVcvZEyXFWqGRF0i2Nn07QnY=;
 b=uF29uKJMiRI5knbCk/PJVR4WOKnOY3H++9VN57chVUmjJ1DL+L/EWufpPHmyE4/IWhm9WpgQ8VqOuAl1nXX/uRBU495L8DynD+Ar/dvtTjLGoGvxq1Q4GTznrVKdt5/jUkJi4TBRTTpWyuXAlV3Ffj/fHHPia/Y7aUOB5eRTj+YNijSzfsFz0a3Yj1bXnMIWWLdqME0mlCzBWbIdFcB9V9Myvl4bVSPAKQNshnI8pHOogN5+wyNUThC4s2FI7/7znDxUT2Ch+gf/LRYkNWlNuQa96cjpDurTvIVZ0Us5Et2FF9UFoVRkDdQz4pgMimLEUaXSfIPYvMuua/qqtkVEpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from PH0PR18MB4558.namprd18.prod.outlook.com (2603:10b6:510:ac::13)
 by DM3PPF538CF913C.namprd18.prod.outlook.com (2603:10b6:f:fc00::6a6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 09:43:47 +0000
Received: from PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311]) by PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311%4]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 09:43:47 +0000
From: Tzu-Hao Wei <twei@axiado.com>
Date: Fri, 09 Jan 2026 17:43:31 +0800
Subject: [PATCH 3/4] MAINTAINERS: Add Axiado AX3000 eMMC PHY driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-3-dd43459dbfea@axiado.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1058; i=twei@axiado.com;
 h=from:subject:message-id; bh=7P7aM9BPH1DQjPkM3qZXLvDahtBv8ibiPubsKFUVLq0=;
 b=owEB7QES/pANAwAKAXgQMF3EWvHXAcsmYgBpYM3QLfyxU5fWc9f+zPl4Uv5FFBVimRyu//c+d
 XlC/5cCWoCJAbMEAAEKAB0WIQSZyWINOowtFmDvdYF4EDBdxFrx1wUCaWDN0AAKCRB4EDBdxFrx
 1x1YC/9AD3G+E7OKTzbCVhVStKFU0kU5504EWRuVGRe3DOBWPalwVVCl5Po5/otq4vBdq++nxI6
 qBJH8YdgR7iCriKw9TfE/2jTXxeP2Hql4t38OerKGPLDI5gvSDlLv2NgWNykbbYgsZFH+0F7jdM
 5yhYRNTVL6Fuo0UXha01h9FLC2k20L2mVPJxz5mQaUwYmTB/g7wpt7vwNIOnPb1XXvlhoqTuL+u
 9G/mTgcZ5JMhBSa0CG37DRpPD94RpAaZ1hmf1UYGEpFF6jPNX5F1k3hmA/fUFok8IWqln72jd8J
 dnSLS/2PcNZWB+tSXSSlkiqdsRk8MobvseOdnVh06L+XnJGe8mFbRsyVyzty/5AwTca3ubd9xmH
 ak2hLyQGKxcCZMgwtNF4q8dQSVXmgWznDy7roQEdVeJFw5rvN9hrKFcqQdnUwbYi30kXA3c2ptd
 3Ddc8JCIuDRHRORUOKgygo2UvZYnDhx2lYxutGOkwv+e5jaWTf1kYmPkeYxHucm2ZJPTA=
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
X-MS-Office365-Filtering-Correlation-Id: 6be441c1-a264-4748-4cf5-08de4f63961c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|366016|376014|42112799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V00vYmhwTTE4S0pKMlMzbE1GOWwwb1JlalQ3UVdpMVd5NEFLUlZXRXphR3ND?=
 =?utf-8?B?Ny9hOW1IRjJoNzhMajhZT08vanpuZ2FBMk5xeGh3L25VV1BxWUNZOWEvRDVU?=
 =?utf-8?B?MXRuUUt3REJxVXgxYTBpRk1DYUU4TDhOeFYrVGJFczMxM1lvejNlR3JlU21H?=
 =?utf-8?B?YXZZT2kyaUp5N2xXa3NSYXVvYk9McnM0aEpXaUVvUlhBWk51M3luWjl1emxI?=
 =?utf-8?B?QW1GbmNXbkpKbThLcFlrdUVTRndGMlY2T3lSaVAvek1TckJsV1VXOXljMXUz?=
 =?utf-8?B?TitwSTB6ZHJDNEVRVGxJcjdxblB0ZWZWYUlXRVlVRXdOVmdhcG5CTExCdzFn?=
 =?utf-8?B?ZWFYZ1hYdTF1TWd0b254SG92alAzMjVSZnF4bG1lR1RNMDN4SExtQ3kyemdX?=
 =?utf-8?B?emErTUhKeXkzRDBwZndtaFVPUVhnMDFlZ0pJSENzQVdSQXI2YWt5RFRSRFFC?=
 =?utf-8?B?RFBBeWFXK2FQYno1bkZlc3Vycm1VcHVwNk1uVjNPUWlDa0F2MmliM2ZVUlJr?=
 =?utf-8?B?MGtnMWRjRDJhUkYwT1lGL0pVVldLNkNMSzh2U3NXZzdxK1lPQXdZaXpxQjRv?=
 =?utf-8?B?elYxUVBtYjQ2V0pKalZ5YlBSQ0s3RHUva0NRUGg2b05pcVMyLzU5dlB2bUdK?=
 =?utf-8?B?TWp1dEZhMElRM0NFaUtueWh4aE1UWmIxQjNYNkhmV2Y0Qm1GK1dYaXVBdjQy?=
 =?utf-8?B?aCtjakxISjZCMkI5ZTl1SHN5dys1MkhGcHZnZ2VzMFI1VHQ0enhkY0JLRTkw?=
 =?utf-8?B?Nnk1Ym5wM0RtVHRzVTdrSU5BeFZQN0Z5NnkrQzBMVFF6Y25ZcFRwS0VtSW1o?=
 =?utf-8?B?TW9XMThsWVJPRXViaU96K3Z0djRNTWI1Qm9MQW13UlltMXljY3ZDS1NWRXNU?=
 =?utf-8?B?b3o1RHNTNmVWaTUvNGpRcGlRNkpBSlBoVGIvbXBnbURrTFNHb0x5Y20xeklK?=
 =?utf-8?B?aktsb3Z4dHBVczNsa3NwbXRiVHIrMWJ0bUlzYkFpTFAzUkVmaWsra3pLSVk2?=
 =?utf-8?B?dVl0dXlTalR4WlI4YTRMVlZ6alYyZGVOOXphTXdkSk0zeThVaForcEhtUmQ3?=
 =?utf-8?B?bjVJVGI0MzJob01VZmpJTXRmN215NDIzQjJtZnZuRTExZFF2WjRHZ0hZd3VI?=
 =?utf-8?B?Uk9SVmFxV0FmWW43NUMySTZTYm9KdHpuN1hmT2R2eWp1TTZZeENEMktLZUdM?=
 =?utf-8?B?SU9SdWorcEs2THpCQ1JBak5ZcHNjeXNJL3lyQ1hLTVV3S0E4dWlIci9tS2JB?=
 =?utf-8?B?L2pqS1B0aVVPWVZKVFFCazRzVUlIUGxKUmtQNFN0M1FQdW1CRUxDbE1id0Jx?=
 =?utf-8?B?dkJ4bGtyam9GYzZqcll4UjlMVUdTQXhYc0xaSWczU3kzRnpiRXF6WkNNK3NX?=
 =?utf-8?B?YUV2YW9lbkxwZGhVdW1SUm1RdWYxY2xFd1U5eDU1VDVQQzVFT0czL1VZQW4w?=
 =?utf-8?B?YUwzLzVpQUh3eCttTCttR3NRb20vT21CeWYyb3lIUlF5Z1djTmo5VWw3YWto?=
 =?utf-8?B?Z1h3VnhUS3ZxV0YrMEQxRDRCaTZWaW1kRHhDSWZNZEg0NjQrUkVoUURmbE5T?=
 =?utf-8?B?S2dWeURnSlROd3RKNUJja1BJWjFXVHdzR0grMThXRXNRa25iSkgxTVc5V0ht?=
 =?utf-8?B?ajFETG0vNE5YakF2RHJzaytxeGFma2h0ckxlY2o2bVMzM3lLYmc5dlpEbDF0?=
 =?utf-8?B?SWphN0pSK0VyOEZ4Tm4xRlpUOE5wbkg0M1htc01ZWXhVUlFlSFNxY2xKN2pX?=
 =?utf-8?B?MWc3Z2lqd3JMUXpPclpyTmRMY1ROOGE4dUlnaHBVYVE3bGIyalRNYVZFVFV2?=
 =?utf-8?B?bjF6SFhjaFkrbU9WV2ttUDNzTGtrYWNPaERCc2lianVoYlJhVXRVcHpTUFdR?=
 =?utf-8?B?empaV3BoOXJReGlWREQ2VzlCWmFaS2xPQW14VWhoa1lwaEsvSGZabU1HVDF0?=
 =?utf-8?B?eDd5dnk1TmdBV2hIUWxrV0tSRkpsd2hUSk15V0t1THRaeGc3MmJuQ2FmdmVD?=
 =?utf-8?B?VitHM09heGFoZ0NpSVpxcHBLUDJKK1NXKzE4UzBKQWtlWDZDMURNaHQ2TFh4?=
 =?utf-8?Q?EQZbnw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB4558.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(366016)(376014)(42112799006)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFJBem5Td2hZN3RFVDBqcXF0NWhIQUV2aUdxT1BJTkNsQ2ZreUNIa0NNRkx1?=
 =?utf-8?B?Z0IzSUU3aU92NGJMYjFmdmJPc1RxRHIyUXVhbjB5dDRJUFJDU243Rk5BQmhR?=
 =?utf-8?B?b1lIL0Y0aHdlRGlPNFhobHhJbEZwUVdyVFZxVHFaUW5ZOFJEalJGYzV1N29U?=
 =?utf-8?B?Z2ZqMmVNMFBsd2wvYlJWdVVlQ0tsdkljbWJGMW56T3puSHFCb0hheThyeEZJ?=
 =?utf-8?B?MWZGR244V3NCR1dQa0NXOTRVMHNaQlRMbEU4WGZNSDFwS2V3cFgyYkxyVGcr?=
 =?utf-8?B?K0JQUStqN0hqVXVHYWxHQ3ZjbGwxVENPUWhLZkpqaEZ4V0N4dld3dzM1NW5G?=
 =?utf-8?B?VWM5OExheHcwOW84cXl0QklIQmtNanppMnBwWll2SlJxTXVxMmNuSldQLzNh?=
 =?utf-8?B?bklUc2M0KzIvaDhZY1lMVUxjUE11U29FM29zM3VwbGoyVlNPVzRWQS9OUXd1?=
 =?utf-8?B?WWFVdWYzSFlkTjNZaUFnZjVGdGx2ZlVEcFhLeHlZcUd5YVRvcXJWbEpMRDFv?=
 =?utf-8?B?YXdOeDhRQXA2NjFsVXQycnh1azM3OWRrclpYdkordE9DSTlTQk1EZW9jaWZB?=
 =?utf-8?B?TnNNQWNBQTJpbHRZWnJOSlBOVHZ1cjBoYzAvQkgrRGFLUVdDbVovbDdQZUJB?=
 =?utf-8?B?ZVAwWHpHeGdQK25RMlMvWTlXSkdpWWRCUTU4R0ZWNjRDaHNubFYraXpYYlpp?=
 =?utf-8?B?TGplUkFWM1ZuTVgvWXJXRy9ZZUV0N2p6TngvdU45aWE4Q2pIcnlUaW92SlpK?=
 =?utf-8?B?VnZLSlhySDFZZHlpZkd3eU5rNTg3MEZkR0VnUXUyZTc2aVdlOUdreWhkTzhV?=
 =?utf-8?B?T3g4MzYxb0tnR2ppdGNYZDVOSUpNWXBPZlZjSnpmcFcyMmlvYzljNmU0YjBl?=
 =?utf-8?B?VVRqS00wLzRra1g4ODB1eUk2bnlsUEpicGR0M2pGeHZ6Z29tZTl3NVA0QXNW?=
 =?utf-8?B?S3hoeDNUV1hPS0w4d1VnaW11aW56SUpUZjNNdWJudVlqcVpyVTBGeWxYbkxW?=
 =?utf-8?B?dDJON0Z2NG94b21DaXdWbGxvVWZXdzZtZ2NwWEpYdmh1T2pDMElVQU5xR1Fl?=
 =?utf-8?B?T2F3dGdaeXFsd0hqcjJaOHF5S2c0NzVubjlVdGVyRGtFTldmd25ZU0dRbjhF?=
 =?utf-8?B?dUdFTENHVmJsYVNZR1lSTUJacGVyZGdMRVR0WWlXdjlBN2x1L1dwM1dneHBu?=
 =?utf-8?B?UngyYzgwUHNRaDhqZi9DMGVIQkM3VkU3bHk0d3lmbTRmV2E3NzE2aWtxNlEw?=
 =?utf-8?B?RFdkajdiQXJDRWJ0Ujhud3VZZHQ4SE5zN1dwOXRUUVUvbHRWNXJYdWtaRmZ3?=
 =?utf-8?B?bWdDaGd0eHpRQWxsQnFYK2hLWUJmOFFCQW5hWEJEbmlBWGdNaGlvQVdMZE9V?=
 =?utf-8?B?WWIxUXlWQll2TFluaDByK3dUUTZaL0hqakhKdXNjckY3cnFvZmZxVitTWFl1?=
 =?utf-8?B?Z21VK0NHSEpqckl1d0x6M0N5MEhDZnhEYnVWOEdRcks2UnEyc2RicTlSRG9r?=
 =?utf-8?B?RHBkenErdGdGcEduZG05R0drVk9kcDhnelFhVzZ5SDdqSlI3dXNaNVN3dXFT?=
 =?utf-8?B?OU5JZDIvRmdxZThKTDZBOEVlNDdRZ3FRc25vQlVzWStoditpcDl5UnptV0Nl?=
 =?utf-8?B?KzR5ZkRnSmovSWN1c3BvQlhKelBrRktPMTE5T281S3p6OE1TaENJeUFpaTJC?=
 =?utf-8?B?emJxUmxmNWkyeVFpU3d4TjNBaER2ZWNBb20wZERhL2lUT2gzWFVoaGxzL0Nj?=
 =?utf-8?B?TUx4SWpndnpuMmR0QjZ3b0I3a1UvWElPL3Y4bnRITlEwZUFNZHFaUXRoYk1l?=
 =?utf-8?B?OXhUYVVhYzltc2hTdGJuNjVVUE9qaUlYcnk5ZDBkNG0xOGQrdzZIT0Q0bHo5?=
 =?utf-8?B?eDVnYkVkK3hMYmZNdTllcjYzaFhlNmFrY3FFaCttM0R0UzJHTDErUWFKS2lQ?=
 =?utf-8?B?dTVQMTh6RERwcDJOSStqSmNnNXhVM0NHeUNZQUV3MENlYjkzNyt6RFo4WWRJ?=
 =?utf-8?B?SThxNGRmd0pKb1VsRUQ3VU5lUHNhQXpEV2Z0L3VWYllLRXY1SkJYeWZzRW1t?=
 =?utf-8?B?MGVaTUFySzgwNjdMNU9sKzB0a0JncXloTko5c1crSDVUbHRyZWErUEVCUXB1?=
 =?utf-8?B?czloRXpNWmFaMEJmOUJFN0piZGJIaFNMRDgwWFNlWndvMC9WbFJPNWl3T3pP?=
 =?utf-8?B?c0l4RjRxYXNQeXd4S21ScGQrV2szNDMzRmF3UDhOWDArbkg3SWl3d2ErMEJm?=
 =?utf-8?B?VE9jMFd5a0R0Y0NqVXRKOVJmTkpaZHJQZjlmVHRMSmRzQ3l1cDJwcU5hMWJ2?=
 =?utf-8?B?UlcyRkg0cUYxZ2N4Y2NzN3dyVHpWMWp3enk5RWYwZzZwaVYxTmpBUT09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be441c1-a264-4748-4cf5-08de4f63961c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4558.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 09:43:47.3550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0rl6eZbBDXd3yOz8wN6aVb1xFp5daeRa68BAea85/b++qH+ScgezI/wPb+W58/M+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF538CF913C
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add SriNavmani, Prasad and me as maintainers for Axiado AX3000 eMMC PHY
driver

Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a0dd762f5648b7e4e6fc62560662e43720422e01..6d1af11eb289ffb7c0d8634ac7d8f903aed1799c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4250,6 +4250,16 @@ W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/hwmon/adi,axi-fan-control.yaml
 F:	drivers/hwmon/axi-fan-control.c
 
+AXIADO EMMC PHY DRIVER
+M:	SriNavmani A <srinavmani@axiado.com>
+M:	Tzu-Hao Wei <twei@axiado.com>
+M:	Prasad Bolisetty <pbolisetty@axiado.com>
+L:	linux-phy@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.yaml
+F:	drivers/phy/axiado/Kconfig
+F:	drivers/phy/axiado/phy-axiado-emmc.c
+
 AXI SPI ENGINE
 M:	Michael Hennerich <michael.hennerich@analog.com>
 M:	Nuno Sá <nuno.sa@analog.com>

-- 
2.34.1


