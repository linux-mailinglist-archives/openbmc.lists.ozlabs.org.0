Return-Path: <openbmc+bounces-1310-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cH5JLAQrgWlgEgMAu9opvQ
	(envelope-from <openbmc+bounces-1310-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Mon, 02 Feb 2026 23:53:56 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 653C5D2824
	for <lists+openbmc@lfdr.de>; Mon, 02 Feb 2026 23:53:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f4hk56QjJz309S;
	Tue, 03 Feb 2026 09:53:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c107::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770038240;
	cv=pass; b=E4mlsr+p9Zr0d1blYGBLOAd9AaeOfI+CisUKE1Lr6hdMJNYQxDgAD7jdJ5aRdQcUSrItpVLx7CyUY+SKnIkWW+X3MVTFfAOK50/+PH4uH0Z4o1w06SmTgfkg9XBP2hk5xz7O+yM7vhKaE7fTG4YzfWC8SGON0xsd1gfWsVfLfa31H8dpQyTgon/3itDbOBuGWYcyZFrfwwWhMKDLLdZnJ8ylf3EuIE+SG7hJL9vwmbT5eNTNuHf4vRUdYNniXws5Ef8q7tpAdczbSrz1x7EvbV01pDXHKqKXY0QVO6jDMt52vj4WDUzpUpRWjLcFja12515ljwudrE/5LuYh+VXH7A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770038240; c=relaxed/relaxed;
	bh=doqVh+Zf3G+zZHM8G6ncXFd6FUzWtFUN22Z6fC3EDOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KCVH03jlMZXkjWqtW0Iwh9lBxpnKqTY6oF2gz9e8eA3AqxO6hZqW8ymnn+2qh99dR5f9gM3yeJAb75xlUxwNTkEvJj9VZaO5b9j73fMWr0FEzj9gGfqeZXYQ5wE4La0TvJf0XD6WFQLRt3YmoWX2WDsb4FYhyDuxdVhiFbdGb17CTy9ESTTn5bjhKS5bdmFhpN4AdvM4gL0X78JAeg3aQt17pfM48nFZeoSH+Gkx2gyzGpx674f3nUkXVZHINnjBqGIDqAoJ0k2Fmvfgm4vKYf6wzooexTsvNVEtCs2F9u8BZcFK/IIIEWOc8FjjRcdPEGkKi91cTaapRbmxG5Bl8A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=rXMfshOX; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c107::3; helo=ph0pr06cu001.outbound.protection.outlook.com; envelope-from=vmoravcevic@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=rXMfshOX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=2a01:111:f403:c107::3; helo=ph0pr06cu001.outbound.protection.outlook.com; envelope-from=vmoravcevic@axiado.com; receiver=lists.ozlabs.org)
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c107::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f4Rwt2hmPz2xpk
	for <openbmc@lists.ozlabs.org>; Tue, 03 Feb 2026 00:17:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aWVbQG2CZVQ9gBcjRmXLmfn4G36CBiFanlq8jWScgjPglKj4A2h5n2yDnq2JOSVyfpLM5RmKpdDuy0jV98i3cbnOi8ImAu+ZfQZnyl16JNRUwqv5fieASyfLgxiIj7vnUwJHmPASAoI+xKY0sB1n4+6cDSXWK1wXXdnpPCZ4hiaaQFWduIR+QNZ49w4Lo+toVymndsHjmVAuIhBq0sZAK6wG3L85fpFNoXz59fqrOA+Mm+KcQRXQrV6hqYPFP74TbaBhIVpJD00xsdtmDayX8b92JnEU7Fb7dr+hiFZj1n74GiqxUCNIv4dsncMxFELB9opk4Opp1f7j5MNeS9mKBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=doqVh+Zf3G+zZHM8G6ncXFd6FUzWtFUN22Z6fC3EDOU=;
 b=Y+TkswEvrvEnMoJrezcQNMcktC6SlhyfNzZtk3E8ww3zAyZ5V4o4p4EJc2IyOp3eQCcZVq95aiRxW3Z0HVF52M7ZCdR+7KzzsKB4wSeo/VQDUu/mbDJRoT46mlN46c/+S6zQEA8+xcLDJnNcgpOhd/gW5czSh90nVEPuRJMZzGUIZfZMlu+5va941aR0WxF7IMJal1d44r7q+aTVPyiym9ujtrrH7nAbnir0X2dwQs3nI5FgtFFhsmclVYcYudMkrrUUlWKpX0A/k55vhlnaxAkcL75rXn+aNFBZr7i+Ix3JTyttpgN7KA8TGr5FRHi3cbo6rsCHFYnejUqgBjU/Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 4.227.125.105) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=doqVh+Zf3G+zZHM8G6ncXFd6FUzWtFUN22Z6fC3EDOU=;
 b=rXMfshOXHyI641a+pJhijMLr4l3d3Mo2BpUH+iHCMOrFwayr9CzvBGJbr/mk06grwLmyNmQmHR++8WbLt0ymvZJ+qI6pmJqZd95XHRSSx0IsS7pRPdhkOycDr0D04nXjauVM38gMRGP+apYBlM3NRINHuRfl2rdsNnwO7/3NK9YMh+khbQfu+2E1cNynGMlLgQ4HcvKXzrUuOb9vQRW2xw+Mp2ma1rfjaamt67OZKsRL7/haoHeRaZfaTy/SvxFg36pDTLQHtwTHgpfVe7OH9RqMgQgAG9ZkhOOqrQuP0Y92O/LJsn+orJCD0PXWNBbvNVWJMliBuXSBP0rIYBff+A==
Received: from SJ0PR13CA0215.namprd13.prod.outlook.com (2603:10b6:a03:2c1::10)
 by CO6PR18MB3857.namprd18.prod.outlook.com (2603:10b6:5:347::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Mon, 2 Feb
 2026 13:16:53 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::da) by SJ0PR13CA0215.outlook.office365.com
 (2603:10b6:a03:2c1::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Mon,
 2 Feb 2026 13:16:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.227.125.105)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 4.227.125.105 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.227.125.105; helo=[127.0.0.1];
Received: from [127.0.0.1] (4.227.125.105) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Mon, 2 Feb 2026 13:16:52 +0000
From: Vladimir Moravcevic <vmoravcevic@axiado.com>
Date: Mon, 02 Feb 2026 05:16:28 -0800
Subject: [PATCH 1/3] dt-bindings: usb: axiado,ax3000-udc: Add Axiado UDC
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-axiado-ax3000-usb-device-controller-v1-1-45ce0a8b014f@axiado.com>
References: <20260202-axiado-ax3000-usb-device-controller-v1-0-45ce0a8b014f@axiado.com>
In-Reply-To: <20260202-axiado-ax3000-usb-device-controller-v1-0-45ce0a8b014f@axiado.com>
To: Krutik Shah <krutikshah@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Vladimir Moravcevic <vmoravcevic@axiado.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770038210; l=2667;
 i=vmoravcevic@axiado.com; s=20250904; h=from:subject:message-id;
 bh=i/vX6FTbEKgepWdxm4LiHJfG0DkQt3iPnVLC3/cNqPw=;
 b=vF6FfSX8env/lDCGtxNyJBdffahWNmX/u4UX771IYEqokiEsgnDqNOFBZrHg4rLda3nC84lp9
 z0Aray+mk5lDl38dRTk62U49oHrC6sxuRg6LGnxIUPMWPxaUyGI98RV
X-Developer-Key: i=vmoravcevic@axiado.com; a=ed25519;
 pk=iiyhWhM1F4HlCbbW3I3qKZhPCE8JsCrDQMgCBRg4YMA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|CO6PR18MB3857:EE_
X-MS-Office365-Filtering-Correlation-Id: d2bf995c-436f-4632-f69b-08de625d54f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?blRlOEJON2l3Y0VxcHN5alNWdFRiSUpPaDhmV0ZrM2ZhSTRJcjVQMVJFd0ZN?=
 =?utf-8?B?UmNIL1NBMkNKSFA0VDZoMlFJMGZNOHhRZDlDcWE5V3FvWjJZVWg5ZXpJZGJV?=
 =?utf-8?B?SWdwMGhGRkhmdjQyemZqUWdjRWI3L3k0RXhqcUFoM29aU1FCRm1WaEs2b1JJ?=
 =?utf-8?B?OXBheXFwY09rRk9yVTZaMjdLUHVVblhMdWJidHU5TDZ4VHE5M0FKMW9OTFgy?=
 =?utf-8?B?Y1UyeHBxdjlwREtuMVNkbFN1aTM4M1NOaDlsYW1PQTc0RkRxSjM0cHNYaFVJ?=
 =?utf-8?B?MDZGOHZCdTNuRElwQ0ZGdWFjdTVKM0JCVTNDcWc4ME5ZYjJabXcyODdVR012?=
 =?utf-8?B?ZU5NN0xZTGt4TjdvdmxtdHhISDBxZjlYL3BoeHd2U3hDaWI1ZXk5YVVJRDNQ?=
 =?utf-8?B?ODA3VThsVENUbEVGWHNwcllzUkVhK3pLU05YTmNxdWxCZEo3M1pxRzVZQlM1?=
 =?utf-8?B?WCtyS1RHYnhpa0trMXpHMXpHaytJMlF1UFhIRXpCNURWV3JZeDE3b3AxT3p3?=
 =?utf-8?B?RTFPakFxcTg3TlNjd1NtODBHQnRQSUtVaTE2OVdML1I1YXhKM2ZoeTJCN0lu?=
 =?utf-8?B?Mi8vdlZnWFo4OU1ZbFNESWpnaTNZRTA3YzkzUG5ORHp6SXpINnRpeE9SNG1X?=
 =?utf-8?B?UVFScGhOS2RBUnBJMGx2cnIrL3NKUGpQanRTaDFBNC9EMTM5QjBEK2NOdEN0?=
 =?utf-8?B?NWM1cWZwU3JZd2hrczd4WGthYzZKeUFrM211cnNhaEExRDNPaXQxYVoyTHBt?=
 =?utf-8?B?Zzl4ZlpoeW1nQ2N4U1o0QTlmbFgzbVJyLzVNQXU1cDIwTHlJU3prRkE0S0hR?=
 =?utf-8?B?WlRyc1FsYWpsNEwxNCtCNjk1SWZkbkJHKzdnN3ZxU2xhcVhFbXcxdDErZFFY?=
 =?utf-8?B?eHdWTC80MDBuSHpqMDR6V3B3TUdOWDJFNEJzQWRaREZhcDBpRlJFaDJGdXo1?=
 =?utf-8?B?RXRXSWp2M0NSSjRyRkc4MFpLYjB0NFJ4QktIZFZsd1V6WnJTYmNBQmMrUEgw?=
 =?utf-8?B?bDJ3VTExOHphOHF1ZG51dGlvWW5KVDdwUXRwem1hbWE4MDZEZEt1YndBTEZ4?=
 =?utf-8?B?RGFRaklXc2tnaEpTN1lwZ3RkS3plclNxTGExdURsSWtFMzBPaEFSRUU5Nnhh?=
 =?utf-8?B?ZGQ3eFdBUTVUZCtOSWtaSHBXTmxrbERsNVJGQTQwNGZQaVdwOG1oaHlqdW5S?=
 =?utf-8?B?S2dCTHNoWWdJZ0FrVStxa1IrRngrQkp0UXYxSnF2TjdGc0d2TzVGVGJ4Rzlo?=
 =?utf-8?B?VEZ0OE9wa2EySXRpQjdGdWJvcFZxWFNySFZ2MXk0d094S2R6N20zTStvMzJz?=
 =?utf-8?B?NUE3UjV1TE8zQlVSS21yNkRQWEJobldiT3JxNkFUV1lWQWtJVkpBNXkxelVL?=
 =?utf-8?B?cHhMK1J0dGZVSHova0tFUFRvVGhlSXIvZzhaSXFOejhWd3pxbGZnQTRCWUZT?=
 =?utf-8?B?MzREWmNUUEtYMkIyalRyNlZyaGJzNzdUcmk0ZEFTeXB1VDlTcWFRN0NuekRW?=
 =?utf-8?B?NytUaC8rQlU3UmxaYmtUQWlwRVJ6eExaK2h0MDI1MWZTKzhtVlBHVFpMM3dL?=
 =?utf-8?B?TFFMNDgwSExQdC8yQ0Y4OTlhaVB0cVRsbWl2bHlTNVMzMkkvWlZZeXVicy9P?=
 =?utf-8?B?dEN2bWZWdGRBR0N0UGZicmhzbHhnb1ZPODlaT01VTlhZRlliSGRHbHF5SnVH?=
 =?utf-8?B?WXU1WDBJSENEaDkzd1ZPdzk1ZGp1eTVQS0U4bWxtNVVETi93ZmhpWHBXcUxX?=
 =?utf-8?B?dkwyK0FYRWxxYlpPTk1rdmVCZHpXQ1c4SVp1TmNZVFZJWFdoM2ZEVitwaWh1?=
 =?utf-8?B?aXVIeUxsV25UOHAvanIxWStHMHo4eVdQb1hyLy9pc0FSejhxVWlXMTVaUlIy?=
 =?utf-8?B?Q2I0cTFSMDk5anBZNkY2dVI2QjVvaW1ZeVFrbGE1U2dVa3pFanlWcDQ5OWN4?=
 =?utf-8?B?SkNTZjFjbkFOb0djdnB5WkZhR1RtM0QvZEFGTXVOb0NBWHl3M2dGZUo0cHNV?=
 =?utf-8?B?M200dHpFaFB0bmR3ZFZaelJMM3g0RFJZcHNNYkowM3pWZVUrSkJTS3I1YThL?=
 =?utf-8?B?cStNM1dYTEIwem1EdStlM0hDNHlEbk0xc2huVDNZaFpNRWMzR1dySDlsWTdM?=
 =?utf-8?B?cE1La2YxUm8zdTgxYXZZQ29kNkQybVZmTTIyVE1RSXhnODdSWG5iOVpSRm9F?=
 =?utf-8?B?NXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:4.227.125.105;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fEpT+zpnvMM2hMwO7b91NUW29kURSJgF7ax6WQfYQhB+FwKTzCgvCG8D2IAqpcRV8gAsxjQ8Eux26tWN+2b3dfLLC7LZc3BcH/UHcASzT6DOZJ+W8us0D31Op1byyCFgSsIqSTTcuMiL6eaK+3yLJZHPs3WojbQeALZn5v2uJU9bOFOW9sdTn9Ga93/0jlzhk1qEGHybuLUR+6znyE1xr5f722Wx+1ZFdTOAUhUI6pZG0NkPnh1FuJCnUEcZ1qMcg+3H6VKBEdsluhDehMQq+FM4QhHtEfDmPs23Is9Sl5/S2nMUAepjjWLHiPZsDy3fAAjb82lUP3gdu5mjFFVA4ngS1p2DbAQFuMSFLmhGYz8obQTJ50/g6mwu8zQblB5oK8o5oeaOjxP2N0qU5zkxjA99lDtJv0Q5e83V93g9cceYLPYRKk4YOWKu8dCup2m7
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 13:16:52.5025
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2bf995c-436f-4632-f69b-08de625d54f5
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[4.227.125.105];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR18MB3857
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.20 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[axiado.com:s=selector1];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	DMARC_NA(0.00)[axiado.com];
	FORGED_RECIPIENTS(0.00)[m:krutikshah@axiado.com,m:pbolisetty@axiado.com,m:gregkh@linuxfoundation.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:vmoravcevic@axiado.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[vmoravcevic@axiado.com,openbmc@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-1310-lists,openbmc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vmoravcevic@axiado.com,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[axiado.com:+];
	DBL_PROHIBIT(0.00)[4.215.3.128:email];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[openbmc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[axiado.com:email,axiado.com:dkim,axiado.com:mid,devicetree.org:url]
X-Rspamd-Queue-Id: 653C5D2824
X-Rspamd-Action: no action

Add Axiado ax3000-udc (for USB v2.0 ports) and
ax3000-udc-gen3 (for USB v3.0 ports)
compatible string for AX3000 SoC.

Co-developed-by: Krutik Shah <krutikshah@axiado.com>
Signed-off-by: Krutik Shah <krutikshah@axiado.com>
Co-developed-by: Prasad Bolisetty <pbolisetty@axiado.com>
Signed-off-by: Prasad Bolisetty <pbolisetty@axiado.com>
Signed-off-by: Vladimir Moravcevic <vmoravcevic@axiado.com>
---
 .../devicetree/bindings/usb/axiado,ax3000-udc.yaml | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml b/Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml
new file mode 100644
index 000000000000..15658b5c924f
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/axiado,ax3000-udc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axiado AX3000 USB Device Controller (Corigine-based)
+
+maintainers:
+  - Krutik Shah <krutikshah@axiado.com>
+  - Prasad Bolisetty <pbolisetty@axiado.com>
+  - Vladimir Moravcevic <vmoravcevic@axiado.com>
+
+description: |
+  Axiado AX3000 USB Device Controller (UDC) is used on
+  AX3000 SoCs and evaluation boards. This controller is based on a
+  Corigine USB IP core and provides SuperSpeed (5 Gb/s), High-Speed
+  (480 Mb/s). It supports control, bulk, interrupt, and isochronous
+  transfer types across multiple configurable endpoints. The node
+  describes the memory-mapped register region, interrupt line, and
+  other required properties for the UDC hardware.
+
+properties:
+  compatible:
+    enum:
+      - axiado,ax3000-udc         # AX3000 UDC (USB 2.0/High-Speed)
+      - axiado,ax3000-udc-gen3    # AX3000 UDC (USB 3.0/SuperSpeed)
+
+  reg:
+    maxItems: 1
+    description: Base address and size of the UDC register space.
+
+  interrupts:
+    maxItems: 1
+    description: Interrupt line for the UDC.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        usb@81200000 {
+            compatible = "axiado,ax3000-udc";
+            reg = <0x0 0x81200000 0x0 0x00100000>;
+            interrupt-parent = <&gic500>;
+            interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+        };
+    };

-- 
2.34.1


