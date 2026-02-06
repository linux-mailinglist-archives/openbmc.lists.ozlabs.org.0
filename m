Return-Path: <openbmc+bounces-1336-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODL2Ky4QiWnG1wQAu9opvQ
	(envelope-from <openbmc+bounces-1336-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Sun, 08 Feb 2026 23:37:34 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB27010A7BB
	for <lists+openbmc@lfdr.de>; Sun, 08 Feb 2026 23:37:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8N3j58b5z2ydj;
	Mon, 09 Feb 2026 09:36:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770366166;
	cv=pass; b=iUNF5tlLAxK5lkkJLoU+Mm0E8RIRJ2v1sYzEuye2qXAuNId1H+/v/+Y+W38sf2HoAL9ktvvwcOlQ3lIizHY43Xnt2/1URXI5i8GSyvbUot8Qt5M/mRFPvNiNB7i6gb240MwTqndWvRnUo9NMpcblDNbGxvEmlSOe3FA2YnKUh9N/wjBduns4SprzeZD1J3D/n7LtXaVVDVIEEA+gFe0EUl2Qf3UHQ0bEF7DST6iZVra536r5hR4/q1jBhXQmCL7OxkWb5KWjWkJfXrDG+p0YXiTh0TX5JwkIyY5lHFZiAMuoj3MF7pNnSz+rUB7O3tAq3o5OlcgnBuVjA4PuFgCRDw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770366166; c=relaxed/relaxed;
	bh=UgPJlgCL7hM53W4rulPh73OCjxaP0vLCMVnlO+e4Ed4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=oZvzfXqrJxs1voHbHUanhx8Pv7XBAABkrj6jU8G55knWPG/VQIMfhYUkGThqgXYjyFqwZh6Mqo536AeqZCSM63Qhif12yNMMXqU77cqTVLjUY0jjhjImh7nh93ol/Mrf5/HRjpgxmWQQ/xK70G1WJptPoLnGMc2REsF/XRBzF9Am4Dk/onFLFUPMFHR5MFd874e1kPg2Q3jOkTnsYXgO9Q+A/OGIBO6eeA3Zql5XS7eD4+c6wcfX4/sDKiezWqj5WEKash9vIkV3YLiqx76m32cY5Flvd54AZEnSiErP90GqyrVfYADbtVYUqHQ4taXLh5jGXoRpxYOzJVD2Ej7x8g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=LUVglVh5; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=LUVglVh5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org)
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6nC95tS4z30FP
	for <openbmc@lists.ozlabs.org>; Fri, 06 Feb 2026 19:22:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G1qggFQBHR6lvM0ccegSuJxeFqAfDr4P2U2DrUOM8MOfrWNmNEn0f2rV4QCY9GYPkm96g5fC36hCTnyiaf6LWcUAqBuILC4Gx2B03SD+sZJptAv7XsQNwBsHwdjqPcKOtRN5rVDf4Fzu+onUrurokDSH4+ukkKn5RW7wJWF+E+k1EmGVzga//p5vWAqB9DiJyT+5A2BwocoA7L9AUJpEn0qgFYkPSNYzNYM9rs79pN0nBDihbENXOSP3kdNuV431DBNFK9nuRxj5tYJmcEtmJzrgTK+QopJvYBnCykSXZ79p81YjBY+l2D3QuGAgdVKP2CQuMGN9TQaDH5v1VhKObw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgPJlgCL7hM53W4rulPh73OCjxaP0vLCMVnlO+e4Ed4=;
 b=vu8aBmFt1lAjKVekcqH66dTGcREgzogSbdzTZhntY/wkjWlJ0eY/Zd5AMQcx++QR2xsMfA4DPCG4UBbanzpItu8KLrgSSuHRuFnyxA5qakb4JxIPqLSWcAe9REPGEgJmEEEbpyJpiou6fO8C930gUUgTP0pmlvO4L4qMabbf7DY9Qqfte7gn1VfDGd0XXUMrnU8EvH7sMzvtjTbcazEiCX70yzDNQm5p0jjkXD97Ghca+cmE15XQbfGlMrJIVeYYjZBSkhuxy0+dJc+8UjRUbKSaGKHVOvSu1qCUpWLMQIaabN8bVfPSzjIgXt6AMetqlyNoQYFmDhXUaeduu39mGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgPJlgCL7hM53W4rulPh73OCjxaP0vLCMVnlO+e4Ed4=;
 b=LUVglVh5KnsgMIT6zIuUuu7bcNMKnk9VEE6cBcPQMG7Js3bCK042EsFtV/NygQ2CGBx6cXvccgFmSLvA+f2JsLtz2tRd//tuQaQqXmcyahaOp7LsiHeekkOu3gylVPQFOJNOop5u7Xghx6RrwjjTJTzwpukfYWD3tf1xNrmmdchJMhlc2zKvbfz5YniTW/peKOSGCLSfiI31H8SLe9iJrT6575ULmpDI3qB0rT7uAUaZZniAhrD1O3XgajR0l7oXCHC1EiB2P2DEciXWIqJxbnhfGxnoiBAAhlypnvWvVyhYLJIqbkyPXQbztWhXm7tLcdNNjXSEkHZ7XEug7/zgKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from PH0PR18MB4558.namprd18.prod.outlook.com (2603:10b6:510:ac::13)
 by DM6PR18MB3667.namprd18.prod.outlook.com (2603:10b6:5:2ae::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 08:22:19 +0000
Received: from PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311]) by PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 08:22:19 +0000
From: Tzu-Hao Wei <twei@axiado.com>
Date: Fri, 06 Feb 2026 16:22:08 +0800
Subject: [PATCH v2 1/4] dt-bindings: phy: axiado,ax3000-emmc-phy: add
 Axiado eMMC PHY
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-axiado-ax3000-add-emmc-phy-driver-support-v2-1-a2f59e97a92d@axiado.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1494; i=twei@axiado.com;
 h=from:subject:message-id; bh=UKn+27Cd/+9wGfoIbXplaEOl6p7AzuvBQ/uFXejBAYQ=;
 b=owEB7QES/pANAwAKAXgQMF3EWvHXAcsmYgBphaS5XOuIdxuTZDsSVJTwFo/Xo5FH8ySOY1dca
 CqPTmDx7lWJAbMEAAEKAB0WIQSZyWINOowtFmDvdYF4EDBdxFrx1wUCaYWkuQAKCRB4EDBdxFrx
 13UCC/4sk0YZQn2Q7izKbF1QB9GCwZa8jvB/Ia8JSu4F06fQhinWRmOGsR1X3so2FzGUb3Oplm6
 EocfH8uJ+MjjVq3QadiikQVXhasdSM2DBTpzEv0wk+aNS3Pf9AfCyeJ2esHnStqIcGcWivztPoE
 0anDP5TRElcsxqTenkmPzInYVAxb1hdhnWaoQgM0tBGQ47Z0YMbDTFhh2044lrPNOVL/U6SRT1d
 7s77oqIFeMn10jZ+xTnaw1qfYGzGySz/hkzYtuXFdSuUROPd8FQ4bPZxKaP2fIza+VIj2aJjUFW
 xNxAbuYl/EUiXcYg1nJMk+rySXnCM35DDo6cj2LoZIuBtlrgmbcOeT4uyDMBQVJR+G8zzC2vwQb
 VbmhKQrYAe6OWak6Jx1BuyH17KpOSQ41yEZZlIbXBcLEadIHP8/JPmLpnHunsRIXHfIYZTa3xaT
 Ny79wUAGKTwtzDu4Jl+/7N8xLhmQIylWOyg/iz4QhWjvLbQ44xGEZ7mERtULWzuA0pHPc=
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
X-MS-Office365-Filtering-Correlation-Id: 437f46cc-abc5-4bc0-5a06-08de6558d81c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|42112799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eUkreGlaNS9OZ1ZMUk00WThKZmdhbVdhV3NzL1pBTWR2MElUcEpicVJ0MjNT?=
 =?utf-8?B?YlBMbXltVXNkdUI5WCsybGY1UXhJWXVac3ZzZCtPd2orV0UzS1ZPa0JubWVj?=
 =?utf-8?B?K0pONytmTnhGNjZVNDdiY2ZyckFyNVo1aUZiSS9qNk5PbG95SE90YjgrNWZl?=
 =?utf-8?B?SFBFOHFZKzJ6dVV0MHl1ZmRkaStoVkNFU0hGTlMrNUQ3Y3V6bEx1REZHbE9r?=
 =?utf-8?B?c1FlRFJZL01DU0NlcHRESmZiSGU2ckxXb0cyMmd4SVRiMm9zZ1NrbWhFZXAz?=
 =?utf-8?B?K3h3ZjUyczI0UE5lZnJnVFpRTFBLUDdkV2pNWnJsTnBwc0txSzk3RW5IdDhZ?=
 =?utf-8?B?UDJpeUtTdDVBYXI0c2EvU2NKZjh0T04rUUhnVWR1djErYlBHSjRsQ05hdisy?=
 =?utf-8?B?Vjl1dEoyYlRSYjR3QWF0L2UrUnpab2VIZ3V3TStIeFZkblBlN2tDem9ibXZi?=
 =?utf-8?B?QWRjdmdXd1hkMjNSOFFGVTFZWFhUaUIxSFBQclZWUC85MDhtR1FINnlUaUM1?=
 =?utf-8?B?VUsyTnowdThJMi9CK0ZtUWF5VmRhMmdkSkVjN3h2dFc2aXNFVlpqSkJ0OE9T?=
 =?utf-8?B?bGJFbzlpUEJyaGpZT0d1SU9tWDRxL0RWV29Ic0t1UUkzalEyN1ZkanNPK0tG?=
 =?utf-8?B?QUpsK3cyOWxQait3SzhYVUIyUE8rOU9CdWQyeWJ4b09VbUQxVElzb3JFVDRJ?=
 =?utf-8?B?Z29Yd1ByZnVpU0tiWVdkSUNKZFgyTXNiRTY0MWtONW5FQ2xBc3VLZUlJeEQ0?=
 =?utf-8?B?VGVsV2JnQzY1cHZST2NTY1M3YUZaZDJaWlRQUnZ0Z3BUUU05UGRjM0trRXBm?=
 =?utf-8?B?dnJjbmUvNzFxL0FpcFp2a0NOdTdIdFAxcFNWQVRLRlNidXBscXdXVi94K2Ju?=
 =?utf-8?B?dXQwenJJWWJTM251VDcyTm05UkFEandtK2xiWTVzdmFDczlEamkrclRxbU9J?=
 =?utf-8?B?UEFYam0vMUlTRTEzNitjS1BQVEFpQ1FCOWpQUHhpUmRWUFRpL2s4RkVDa29G?=
 =?utf-8?B?U2crb20yRUdwYW16N0tVT0dCOE9Bd1Ywa01nT3dUYkJlSlBzd1RIT2NhSTVa?=
 =?utf-8?B?UGE1bWxZZWZ3endoMEVaRFJxOUlQSG9rajZQZTV0K0pSbmF4Q1d0UTM3RlRE?=
 =?utf-8?B?VXU4eTNHaGI2SkF6SUducTI5czZ4UHcvb2FaQ084aE1XNUw4dXVaYjJzWEUz?=
 =?utf-8?B?MHo3Yzhpc1NzR3lpSGNTRXpCdDh3RUtkRmNqeUlldmhMVmFCYk5Sbk1pWWFD?=
 =?utf-8?B?S3hqYUNaQ0llM1IreE5oUjNEb0tQSVEwVXRuRVB2cDl1NGtrWXVUK2NEUWJj?=
 =?utf-8?B?QXh2WkRpdExEWWJBWFE5YnVJSFdLYWhhRFZhb3M1VldCcXJkTFgrY1dpajhF?=
 =?utf-8?B?UXZWaTMzaDY1WEg5QmZoaEYvNzRlb2hBNG1vUjZVMmppMzVVdVJyNWlwcWVQ?=
 =?utf-8?B?Q1d0WlZNNWF3bFI4SllPSERnY3Z4SGRUYkd5ZVF4Z1htTXJ5MzJCa1U3NHoy?=
 =?utf-8?B?OU5BaEdROGJSZ043L1FqdFlYajFDeEJkRTRRbmlUTFVKL09ka0NiRTBSWGhu?=
 =?utf-8?B?N3ZXSGtLWkRtSGZ3dzRQVzI2eFVCc0lkbUNEZTZkak9hRTZiL0xwK3kxS1U4?=
 =?utf-8?B?Z0t0aHFOUzZsaHptRWJxVWNjV05YSm04cEVVSHVVZ09VbmwvNXVsTzNBdWJv?=
 =?utf-8?B?QUJVZnRMTHF0ZXpyd2kxRngwd0p5aDV4bE41SEJnTGxnT1BUb2N3RC9vdWlG?=
 =?utf-8?B?N3RoallvZGo2ak5lMWhXY3Y1dmpJdXIvY2pGZFpGMDNNekhNL2VZWjVueEl2?=
 =?utf-8?B?eVNVdUJYKzdOalA3NEhTdWVoQnZzSkJ1UDBneTE2cmNQZ3JmSGhJTlNDb1FS?=
 =?utf-8?B?YlVnNTQ2RWw0YitsTlFHN1l2TTU3WGg4My93NDk3V2xMNlRwL1l6SEtQODZW?=
 =?utf-8?B?YzR5TEhkaTlSL3JndkgvSEsvMks0S0ZqOTl6R1FPeURFaTRGdUVvMm5EMVUw?=
 =?utf-8?B?dEZ5cUwwSjR5MUpwVGNmeE95c0MxOXRWSFdpTGY3QmtKVDU3RDNNVmV0aEE3?=
 =?utf-8?B?NUFtS25qVkVkQzJBK0RxeW4vbTM3MlA3OFZXVFF3aXdHRGdUVXZVSEsxUll6?=
 =?utf-8?B?RE1rTGtRTnVXSnhKQWZTYUIrdTR6Z09BNTFQN285c0gybUc0d1J3Z3c1b2Qx?=
 =?utf-8?Q?5MUiPwL2ksa1b7Za0eql998=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB4558.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(42112799006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1lxSXp4aCtUc0ZkTlRnM2U3YjVHM01wcitWRG54ckxTYWJHaGYxN3Ixb0xz?=
 =?utf-8?B?WlprdkN5VHdRQ05MM1VBbDc0Y0djY25KS2N5YU82MU5rMFM4L2U4aUdmQlAx?=
 =?utf-8?B?bmxtSnRKaFFCTmEyZWZPeGNnN2VjTXhQNU9nSnpvZlJIZG9WakhuNUhycGN5?=
 =?utf-8?B?cm1uOHFGZWtnQW5TS0h5dnFkaE9NWGI4RGRWd2xOODZFeTFZdFdKd1BXY0Y3?=
 =?utf-8?B?L2xhRFJsYjVUbUdpSnBrRVd0VjZhZlFaM1VhRFY4cWYzZXp6UEFnbHpRcFZ0?=
 =?utf-8?B?blNFWDg4ZWpBUU9vamhZZytOVlhQQzFEUHZvWk51ZXpXRHBheFlLMTVCY3dH?=
 =?utf-8?B?M1FuWmtKUjBJQ1lpemluMXdaRVNidTlPZ2J0M0tCY3IwY2NHeTFhK2hKL0pt?=
 =?utf-8?B?UzBWeEE3ZUNBaVRPZEtpcCtWRENVZGlOUmtuY2djRUtVNzlXaXVhblhMUm50?=
 =?utf-8?B?a1NIMGxaQ3JwSG5ONi9SOUhIUTFqTnUzUGhCcnZyZ0dIK2dURndHUHd1OURj?=
 =?utf-8?B?YzdnL0p0aUtYYi9RQU0zWm9tVm4zWmtmZU4wK0tCd25RWXZidWJBSm9HTFAz?=
 =?utf-8?B?SzVoNS90RFBzYXBwdjN3VjU4V2NGalZKa0xjcGVVNzNJVmFvQ2czbnZHRGN6?=
 =?utf-8?B?SXV0Q3FUaUcvT3NJMDhlSktoUVJYWTd1UWtHZ3FBbFJleXlYYjFObXhBelZI?=
 =?utf-8?B?YzBKRGw4aDJaNEx0L2hjOGJjb1QwYzVQUnhFVkkwOWZSMTdkcXkxVlA4MjAx?=
 =?utf-8?B?dGRaY1hmc2kxSVc2SWRyTEZDcWtFWmh3Q2tWamlrYWRNTURsSmxrbnFjaFVY?=
 =?utf-8?B?WDdBckd1ZjdQM0JrY0dIaUFkZmNZL1BUNGYrdmZGamdld2dsSUJMYnQ3NWNM?=
 =?utf-8?B?c2k0QVowKzc0Tkg0ZTBPd2hBeFZCSjVubzl4aHhuaWRDVndTTit5Uzk0MkpI?=
 =?utf-8?B?ajZkOVpvcFJ5a2FDT2xFMGdOTHhnZkhvSXRmSUdIVFFtbGo5QjY3MFJlL3Fj?=
 =?utf-8?B?SkhNbnpyWnhaUEFzblZHcjJmL1ZPd04rckg5VmpaNXBZTUpLN3B2V1ZsbEpP?=
 =?utf-8?B?cll5NG9HSCs3bXZuZXBwTFRtWlRDQVZML3RIQUk0N0pndmhUWENCRy9qQlNs?=
 =?utf-8?B?Yys2cFY5S1pLRURhVFRJUkFhcFlQaG8wMHpPcisrZDBtQUlnZU44TGJSelA3?=
 =?utf-8?B?ZWtrRGxhQjZVRWpaRDFobDkxeDRYTkZaNms4YWdkREI3VHI2K0FTcGdxQyt3?=
 =?utf-8?B?M2lNNGNxcERnYXpscFQyemQ3cDUzK1BiZUJvZUVma0ZncUppa1ZLVVo2bmlL?=
 =?utf-8?B?OU9HY1BmbG9pOUJIeWJxVllhakFPaUhEall3MHQxTmN4dmd4YTlQOFVudE5D?=
 =?utf-8?B?b2libGRGeFk1MUNZUTc4a3FXTzZDQzNOTW4xVGE3YUJ1TW9YWjRNYzU5Sk0z?=
 =?utf-8?B?M0pDRWZXVWJ0MUhQTDJCMWE3Yi9pTGV1dThhWFNtRzlSelNGNTUwZzdoV3c1?=
 =?utf-8?B?MW5ZbHNyeW9ubFJEcXNRcmUrOGhnUHVSVmVINzc4STAwbWU3dE4yZU0xeWox?=
 =?utf-8?B?WUxSdXNKVEhxYVJrYUFBR0JETGkyNVFHN3F6MFB0TnVUby9qZHVqTE16amk4?=
 =?utf-8?B?RHpKUEZuNkFQVHlZaWpCN1h2QnhuZ0Fia1p0WWNQdnpGYVh6dXpvVWg3dHpk?=
 =?utf-8?B?L3U5elk2Tjh3czhCa3JJS2EzU2p3NnZheGkrblMxMHdqdmV0ZHR5U0N6dVE4?=
 =?utf-8?B?b3lDVWttTEJJSzdZeWtuVHNuTEdqSUVSZXRLV3pIZmhBRlNnT0xVSlFWUFJL?=
 =?utf-8?B?RW5xdkJTU3RJTStrQzRKdE5mTDdOWG9PRzZNZTVwRGczZmVEdzA1MmgwNzhG?=
 =?utf-8?B?R2FBaXZ3WTlPUmJFMWIvbVBkZlNXNTNJVnBvU2JUdmJ3ZEY4RzZqYlRraVdD?=
 =?utf-8?B?K1pUUE5yNEhoc0xpYWRiaHBDeFk2bXpMcEowSjVEUDN6N1pQbVo1RUhDaFdv?=
 =?utf-8?B?MFh6dFRBa0owNWRnZFhxK1dMMko4VkdzTURlN011U3Y5NWlSSW01WTNXL1pn?=
 =?utf-8?B?dERiYTBNeUUrQXdialhGVlB1TWZwSHpWVUQxV0UwYWU2eGkrYWpsZUM1QndI?=
 =?utf-8?B?RWtrc01Lb0VxazJENkVWVHVMMG1iZmZ2RWNQUS8yaG1VcXI5bTZDcDNranhj?=
 =?utf-8?B?VU8vZDR1dDZVVDhvbnp5ZDdSTXAyOWJWYStNeXlrUHJtRUtoT05XQXR0YmpF?=
 =?utf-8?B?NW5EWUpTamRYVWFlL1F1RmtKZSsrSUFxeGRDTUhBc2hHeHFTOG5uOTZ0VmNN?=
 =?utf-8?Q?phCsH/H6zhDQmi0gO7?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 437f46cc-abc5-4bc0-5a06-08de6558d81c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4558.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 08:22:19.1317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5M2i/7x8RKHDdInxpSCVzDxWuDQfTGVbMMk4NFi4bzUJV0NBuTVarVrQpEj1p1oY
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
	TAGGED_FROM(0.00)[bounces-1336-lists,openbmc=lfdr.de];
	DKIM_TRACE(0.00)[axiado.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[twei@axiado.com,openbmc@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.951];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[openbmc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,axiado.com:email,axiado.com:dkim,axiado.com:mid,80801c00:email,devicetree.org:url]
X-Rspamd-Queue-Id: CB27010A7BB
X-Rspamd-Action: no action

From: SriNavmani A <srinavmani@axiado.com>

Axiado AX3000 SoC contains Arasan PHY which provides the interface to the
HS200 eMMC host controller.

Signed-off-by: SriNavmani A <srinavmani@axiado.com>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
---
 .../bindings/phy/axiado,ax3000-emmc-phy.yaml       | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.yaml b/Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..61700b80e93f7185e16ca9eab0922fe6bb29fe86
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/axiado,ax3000-emmc-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axiado AX3000 Arasan eMMC PHY
+
+maintainers:
+  - SriNavmani A <srinavmani@axiado.com>
+  - Tzu-Hao Wei <twei@axiado.com>
+  - Prasad Bolisetty <pbolisetty@axiado.com>
+
+properties:
+  compatible:
+    const: axiado,ax3000-emmc-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@80801c00 {
+        compatible = "axiado,ax3000-emmc-phy";
+        reg = <0x80801c00 0x1000>;
+        #phy-cells = <0>;
+    };

-- 
2.34.1


