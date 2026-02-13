Return-Path: <openbmc+bounces-1368-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KD+WAhFMkmkLswEAu9opvQ
	(envelope-from <openbmc+bounces-1368-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Sun, 15 Feb 2026 23:43:29 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DA713FEA6
	for <lists+openbmc@lfdr.de>; Sun, 15 Feb 2026 23:43:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fDgsv0mymz2ydq;
	Mon, 16 Feb 2026 09:43:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10d::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770966639;
	cv=pass; b=QmzRfkuHql9TaHjSVwfLvBSzbohFfDnOFleqf6YA4brwjQN9WtZ8OAjeoWFEwA8/746mGyMi88QfVE0Y+CCQULJn0cEeHR55pPBD0+WOXJmJUYTp5OFqIUdyfeH46zhsTwwlGtM/oPT+zorgB4eTbqweLs2DO/yfyCdH2fDUlxESrzLb+BdL0Kk9bbBN0cYYlZlZn8S2xgnNmX9h9D+5CxDP84zZC1ZrPsR6u6zhiBO9ukRDlP2uIt8FO5icFs0rKjcn5J4oFq0sCDVGT433ahRBXPvf/IdfosB1qeC5Xbju51VCMs8w+ltUQCt9itv8t7VPkYYGKkXtRRSK5b8qWw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770966639; c=relaxed/relaxed;
	bh=k09A2bqJMnV6tg/fdQuh3OodW9NTDN2zBcuk58GE5xk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P0fUnwc8Sl+6sdJtLi9e+tKBt8Gim8LI3KpjDWkHB73+L/ZFHO29e0Ko4nN/pAjD5U+7AG7oi8I78IHdPZA/rTVQzIjnVsKkm3xoFKGlWoVVBpU8b4Fyotn6QvBmj9pQa5laxdMbe7Wmu9MDM03hhbgYNc2aqCWGErth/YgpEogIM8/0cCqskzfHWGboE8J5LgBvy7V7+90hfsIxNNaH5+XA5+sdjSMTReXpDFfj0rkVbWqEKc+N2OEpJr4GY+1NYZVgVw6gG4mYKPzhLLTxwUEyxm85mhu9FoCtj+D/B/iPb6L0CHqf1YrsfEVXPi/TQTKQ083gYb/Wj9G0WXhc7Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=nQIaBB31; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10d::3; helo=sn4pr0501cu005.outbound.protection.outlook.com; envelope-from=kchiu@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=nQIaBB31;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=2a01:111:f403:c10d::3; helo=sn4pr0501cu005.outbound.protection.outlook.com; envelope-from=kchiu@axiado.com; receiver=lists.ozlabs.org)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10d::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fC3Gk03P6z30hg
	for <openbmc@lists.ozlabs.org>; Fri, 13 Feb 2026 18:10:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bOtaCRGqLyhS2Soyi/oysma+hiSU0a8c6zjlF8BFTrXFu7UVngck5T14bYQqK0Jc4oCpCmjdlrzoMw3wvON9FhhlVgAXnttVnMGkGALHwLF91MA6a6og12EyP+5eMk7b2ozJsYP+GcncKiQoG9l6bYMNirl117cHfWYHx3oGoRMY9mOBPq+CBGzWBsirk89xT+yAG/fMjt3+LAVNUJtkf9U017MRTJVdS05nVEey8mjdyZIhCemBodOSkfYFuR2ADblE9r9Qbzw0JEwGulmldIVlxLYt3GGW5u6Odo+HcQkrjZkPI0oB3FxWbx1/yqtwOGxUUbbQ+jrQ4VxazkcBcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k09A2bqJMnV6tg/fdQuh3OodW9NTDN2zBcuk58GE5xk=;
 b=RwiGKxxUvhW1yGsF747KjXEp/SgqCTVvYpss9G55XSMU+6qLuoDwkKid4YhgtTuDedwO0ENaY2sdZJDNFAfVKPyZQ2ia7U8yJiwtoJi27mXnmNnI6ZRmzorRigsAtKrQWzLvmJQkA3ebWj1kaUSqeqcCGt9/YBGrCRpeJRTOWevU3eOKHRgRjL5iiO2e76G0q8ixmUBqoEuP6V4bP7EbTJo1PdnCCSlHntx8bsfrv4GlFrrXl8SPnpYjUzSWErxNhgGavShDNvAMJKO8CSbFRKwZlkYcfD3rlzNp05Srp1g5UGBj7HIXyJD2BoyEzLH5KZZ+CnLSoU0Ych2yMEl8qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k09A2bqJMnV6tg/fdQuh3OodW9NTDN2zBcuk58GE5xk=;
 b=nQIaBB31s5KtOYeMebAldx54pbJuaTCpCDZ9W89hQFDDS0G6EwjqcH9FDwyKc5DHH8SMJmb6ndeIs5AeSBr+VrW1Z5xFm1KXJu4HdMQBhuOZ7KUFupMbGoNSiILLhm+ikCGIn/S2Hy73ai9xEngapgzkPx1yn/9F1LhMYQ0Pnkia6vbV72FuroFJGG/W1SnA8bAcgVbQWKs2u7QCdc2tEU7CNkCzJLNugZbPyMYrW6DJF/xsN39WCVH1i67Q12cA8voH5aoZifYh/MqT5mdY/WLEy7JdChgEIhI6Ikh08EiMdlF4l7m6D/IYAX0LfGsoQ/w6cqB6LSx/BU2J+wjFpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from SJ0PR18MB4479.namprd18.prod.outlook.com (2603:10b6:a03:37f::19)
 by BN9PR18MB4121.namprd18.prod.outlook.com (2603:10b6:408:132::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 07:10:07 +0000
Received: from SJ0PR18MB4479.namprd18.prod.outlook.com
 ([fe80::2bc8:6a5c:b10f:9e21]) by SJ0PR18MB4479.namprd18.prod.outlook.com
 ([fe80::2bc8:6a5c:b10f:9e21%3]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 07:10:06 +0000
From: Kuan-Jui Chiu <kchiu@axiado.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Subject: [PATCH linux dev-6.18 v1 2/3] spi: axiado: Add driver for Axiado SPI DB controller
Date: Thu, 12 Feb 2026 23:09:26 -0800
Message-Id: <20260213070927.1114371-3-kchiu@axiado.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260213070927.1114371-1-kchiu@axiado.com>
References: <20260213070927.1114371-1-kchiu@axiado.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P221CA0018.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::19) To SJ0PR18MB4479.namprd18.prod.outlook.com
 (2603:10b6:a03:37f::19)
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
X-MS-TrafficTypeDiagnostic: SJ0PR18MB4479:EE_|BN9PR18MB4121:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a6e9d37-126c-46ce-bc80-08de6acee9d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dlQ4RXlCSXVxQmZGb1RYNFVTUmFuOThXN09GQXI3ZkJsTnpXczBwdlpKWDg3?=
 =?utf-8?B?QVR4TUppOEFubkhyNDUwd28vZVAzOHpoYnBvL2ttbFhzU2dPVU1qNU9SbHJq?=
 =?utf-8?B?L3ViaEpzSUcyVk82REtGY1B5RGVreWs2bExyNTFScE5JOVlLTHdFY3lCaXBE?=
 =?utf-8?B?TTRxcVErUnBkQ3FXSDNvc3poMzM5UmMybmFHRmFjK2tXNW5FNjJTYTZ0OXNJ?=
 =?utf-8?B?STYyZkFmNzFyQkU3ZERSQTY1UkVDOTlTYVAwK1ZGb21TZmhQQmM1VnRIMkN5?=
 =?utf-8?B?b1VsZkZEVGZMcm1GWmFCelY4VWJkbFg3ckdOdldCaTFoMGlBT1VyTVpWZjZ0?=
 =?utf-8?B?d2tnRXliU2RUUUJuZmtYZ3ZhVmp5dXcwTlkrSHlJWTBDcnowK05XdzRKMDc1?=
 =?utf-8?B?NitrOS9aU0NGbW84UlZrVldrM1lHZmd6Y2dvRjd0eHcyNUlCcmlUeVJBL0Qy?=
 =?utf-8?B?RkoxanFRWmFOUmhwY0hjbXZSM0EyOTgvU3ZvTThva1IxK0tVRUVPWVdldzE1?=
 =?utf-8?B?MWRDTmhscVorMWRrTHpzYTVLRk5wSmtSblhOMTFQVEZNeVNHOEtkMjJMN2o4?=
 =?utf-8?B?c01EZWgwMUNUcDVZeXJzbm1McU1zQzU5WThZaEtJSjN3enRGOGFaLzBJdUJK?=
 =?utf-8?B?ckpVdG9aQUlPcUVnOXB2R3dKWlgrdS9pY0ZraFZWckluK2c4RTlHTE1ITTF2?=
 =?utf-8?B?UE9YM0l1QXRYR1M5UUhqWVRzVjBPYU5TV25BRExNR3VZTFJsTFNFQ3BZVEVa?=
 =?utf-8?B?cDZNWlg3T0NpMkpZcU1SNG1NclZYbU5tdUY0d2lzQStEV1kwU2dmQWZQM1hv?=
 =?utf-8?B?aVJnejY0d2hZZnBrZjJtT0NGZGNpME9Fd1F5R0JnK2xWTnE3VEsvWXJUc0gv?=
 =?utf-8?B?WDNqZHJpamRJUmRlMDgrZFpPTkVpbTRiakQrbHdKcE55Slo4UElLTzZkKzhp?=
 =?utf-8?B?UkQrRmMzMHNCbmx3aDNiSkdxS1VJQldKd0s2dituTFh4RGQweHZlcmdPQlhD?=
 =?utf-8?B?RnJtN2VWL3JSNTRlVFVWcWpvR3R1cWZhdWpaRHlQQmxjOVVJeHl3bzM0VXJt?=
 =?utf-8?B?aFFIR201MTlPbC9Tb081YnM4Tk9wRm9YeWwybGV1L3dEWGFrRFFZZ3FJRGdn?=
 =?utf-8?B?SXdIUy90bWtCdUJEeGNpUVd4SktaQkppQ2dZaG05TFgySzdsSXdaUXJ0dFNo?=
 =?utf-8?B?VW5yOHBGN3lmb2FzK2xaN2p5eXlIMXVvVmhzalMybDNMbTNWbFFHaDBCSnUx?=
 =?utf-8?B?Njg5SFRtOXFPcFg2UXQrakxLZWEwYXBXa3hFdnlvSHlRaDhqS0UvSlFHbVRj?=
 =?utf-8?B?U0lld2dQYlBKUWFrOGxTbjU1WE9PSlNnZllRbVhURTQ3MS9teVhzaVFUSVNR?=
 =?utf-8?B?Vi9UczZFY252SysrZmJHV1VGd3RacXBHeHFLeGZLdWxjckE1b3Frejk0c0F4?=
 =?utf-8?B?dHZwUEhDNStCUDJRZUJ4cWpUYkl2bGQ3aG1xZHc5ZnZOUkcxR0NzMkdqM0lD?=
 =?utf-8?B?OG5IQWZrQTU1RlhWbUJmejdhQVJIeDlTaXZaYVNaRVA4bnhuTytGTjFaN01V?=
 =?utf-8?B?SWxHUVhVc2hLQWtqTjd2Znk1L2FubzV5VzV1ZG55VTFocktHbGh4akhKT2Zm?=
 =?utf-8?B?dXRaTnlzd2p3eTVBWGR4SEFlSVhMWXpmbHVOVXRvaFM1VXg5STFhQm5LcFNB?=
 =?utf-8?B?WW1objFacGQybFdUM0c1ak9uK2Y2eE5TUGdqZEt2dmFyZm5PZU5Yc2QvYTUz?=
 =?utf-8?B?VytzdG0vUCt6YzlRQS9qUTFFOWRxVHZMMjRFQnB0T2RrRG5mY3hWQ1dRTERq?=
 =?utf-8?B?MmIxc3lXZ0FNY2xMbFZuWWhOK2hST3JHT2NVNW9pbXVjdmdiS1lnMEF6b2RF?=
 =?utf-8?B?Yldwdm9PVnN3Y0ZoV3drWW91VVFjT0JUWlhhU1V3MjVad2VOcmZEaFJRSzRJ?=
 =?utf-8?B?bHhvTG5VOTZveisxTkV3T00raDlXMElpQ0ZMemRRdzFyclNvTTY1aUJtQzM2?=
 =?utf-8?B?VkNWVGc1S1BSNDMzRFZrZFk2ZWJ5aUNWbUNtdmxQK25OOHEzbyt5UFNrRFpT?=
 =?utf-8?B?bi91YVRqbEZ5dEw1YnZ6Q2R1U0dBQ0NxaS94dzZGN1ArL2tCUCtzaDZjZGhD?=
 =?utf-8?Q?hqs6NKscTMdQ+Yt1Yv2NyyNrz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR18MB4479.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDI1Q0VTa0NxaDlrWWwrS2ZCbXJGeGhpQXVtYWRycWdJdGpLeGZWRnBjNEVp?=
 =?utf-8?B?SkhGMTlwRytnVzFZT3lwcWhpbThXN3pHOWVreThqSC9rb21NTy9maXZJeVFj?=
 =?utf-8?B?VkxrYS9kdVNtc2hiWmNwbndtczM2eGhOdTllV1kzNDUwUURDNzlIUDhmM3N3?=
 =?utf-8?B?QUNDV1JPOThMTWk3Mjl4cnlncXdxRmt3dm9UWkxBbTR0em5Pc0Y3eTdtZjFj?=
 =?utf-8?B?eUx6QnRjWjFnT1M1UTJCQ0F6czZmREk1UmdyRDRpcDVnZ3Z0ei9uT3V4MTdP?=
 =?utf-8?B?Zkdrd1VEb0tJYnFYQjZMQzB2UCtIVFBxZ0hyZmhsdUhhU3BCOXNzbzlLbFFk?=
 =?utf-8?B?NTdWTzEyWkF1dWRYcHJYUytXTW9Ldk9tZmpKRjlPWWdQQU41Wlg4S1V3OVpm?=
 =?utf-8?B?WlFNMklROTFzb2VpR2tUNW1KdXFMOG55emtwUFlpallzMi8rclRJc0R6VGx6?=
 =?utf-8?B?MnNUUStISHFiMkJHUTBFclJDVUk1Z1pscFN2dERnOHZGZlRqRzVmZzNoNmFs?=
 =?utf-8?B?bE5PUERnZDUzZ2ZMSGhLVURuUWVRSHF1eUlwK2F0VnM0UUJKYmNwSWlBeitS?=
 =?utf-8?B?OWkyNGNXRXdTOUR4NTVmOWxLNHpqTklSSVBRRlN4Qk41NUp2ejJHUE1tVkx0?=
 =?utf-8?B?OHlqdmQ2anhkZXVuSXpoM0FqSE9EQ0E1emVacWx5UWpXbVFBYTQwNmNWaGVy?=
 =?utf-8?B?QThOYit2MzZRWk83Qkh0R1dqWFNRRW9DaVdUa0ZpaGNrZ1RvUmFqMktSSlA2?=
 =?utf-8?B?R1F3T1JKWWhsL1VKSkkyL21CcXlZUjF4OUl5SSs2UWEyQVU1SDVZVGRxc25m?=
 =?utf-8?B?bW54K1BoSE1hRGpBQnhOaWU3Z3pTMzNOcEhrd2tkUEZnZHRSK212bWNjUTQw?=
 =?utf-8?B?VDB1WGc5aEJrTEU4amE3V3lCZnBWZzhiVkhJN3VDMlIzSElLRVBPRjI1NjBV?=
 =?utf-8?B?Y05tUk1RUnRGWlpmNXU4Z1Q3Q1JhM1pKa3JkeE1CTXlteUVPL0NZL3Ewd3hF?=
 =?utf-8?B?QTlvQlpJdDdPR0JlR0xZaGt1aWtsaUp5Q2h1cFZ2d2NhQVZYeGx0Mjh6anpo?=
 =?utf-8?B?aTRIRUZxSlc1NnVhUHI5d3M0M05HZ0JXR2tSb2djRGxXbE9ydFpSZWc1YU92?=
 =?utf-8?B?Z2pENkxza3ArbUlFVEE5SHdJSlJ4c1lUMDVURFNFbG9WTzFoR3lEQndjTDBG?=
 =?utf-8?B?bFFGK3d0YWVPUkwveDhSQmVkUmZ6TEZxcTFocXdMdDJwcEprSFNFd0FkYzgz?=
 =?utf-8?B?a25tNEc4YVArYm1hZlltM3VCREVoN0E1UHBteDZKRnErUFVpY09GM1F0ZTJX?=
 =?utf-8?B?TWxDZVhLTFRrcUcyemtkK3B6SlRSTXlzTVgzVkJwV0RqQ1pzdGJacUdZMW93?=
 =?utf-8?B?bDV0WHdCbFRTTzlUaHU3d3RUTGF0cGZseTlTV21zcVRhQlhHK3ZSeDlOUDJo?=
 =?utf-8?B?bFNZM3I4NGh2cG5NMXFqNnVxMjdQTExneXE4NERtQzdWdlVZQW1mcFFESFd4?=
 =?utf-8?B?T3ovSXU3QU51aHFINlF1WTd1Zk1FVmZra1NkZGd3U1FGSHQxV3k0Y25RbzBq?=
 =?utf-8?B?WDY4dDc2RU5rd1d3N2ZwQzZTVE9HN3pEZTlQb1dEUFptQ24vNFlReGxaQ054?=
 =?utf-8?B?VU4rUENIQUlRaE91SGpPcVY3cWFWOUdHM3JqUG0zT2taK1FSanltUVpsbUxP?=
 =?utf-8?B?L2VuNk5oYTkxVXYzcTVzcnZNNG5sdmcrTWtzQ0JQS1JHRnlpeHltUU1JblJT?=
 =?utf-8?B?ek1jSkVqUm1UTVRvN2l5citBb0M3TTlSZE52TklyMm12Q1N3YklZdTBWaTNF?=
 =?utf-8?B?dUlWTExNZ0g0bGV5aWtibGZNSWdXaGdZYjhVdmhYQXZUNExTdnNwQ1YxMmR1?=
 =?utf-8?B?M0tObWpFNjYxTzVxSzkrQzcyaXhyWWxXenpxMy9IWk5zay9PS1hLV2Q3cVVT?=
 =?utf-8?B?ZEhpaTNOMWdMTzRva053RHdSQlg5Y0UreUowalpYYlp0THRzM2doWmtYNkVs?=
 =?utf-8?B?NmJCZXVzdjVGcUtOc05iQy9qWmpzL1J6L2JRdTN4SEoyZFdnMEY2VEJpWXpk?=
 =?utf-8?B?ZkwvSnNrRUlzM2tjNEZMVXZ4U1ExYm5QQ1VpWlFhZlBFeU94U1pDM1lxTmpi?=
 =?utf-8?B?WUxsVmUvZGFoVGN3bDNUdjhPZ0JwUlMzSjdXNUtUcVh5NmVhNEpGYlM2OHZP?=
 =?utf-8?B?ZWMyZUtsamhwOG54R2ROZDZBUjRuWmxzOWpBTHhxUHlkaHg0T3hPU1NCWml5?=
 =?utf-8?B?TUx4bGJyb1ZTSUhveEZUQVNJRzAxRDVseVY3QzNzVXFoQkpvNmxBWTNIQVRv?=
 =?utf-8?Q?YObqLIauQkBWDMN6Dv?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6e9d37-126c-46ce-bc80-08de6acee9d2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR18MB4479.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 07:10:05.9948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v9occIGF1d2bXaBS+iEZmPNwlmgTf2HbdgCJm1BYF2Ftmq6YDZuapR/k6NdhrZVaHX1fomxGiYvLDTG53uDxHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR18MB4121
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.30 / 15.00];
	DATE_IN_PAST(1.00)[63];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[axiado.com:s=selector1];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[kchiu@axiado.com,openbmc@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_FROM(0.00)[bounces-1368-lists,openbmc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[axiado.com];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[openbmc];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[axiado.com:+]
X-Rspamd-Queue-Id: C1DA713FEA6
X-Rspamd-Action: no action

From: Vladimir Moravcevic <vmoravcevic@axiado.com>

The Axiado SPI controller is present in AX3000 SoC and Evaluation Board.
This controller is operating in Host only mode.

Co-developed-by: Prasad Bolisetty <pbolisetty@axiado.com>
Signed-off-by: Prasad Bolisetty <pbolisetty@axiado.com>
Signed-off-by: Vladimir Moravcevic <vmoravcevic@axiado.com>
Link: https://patch.msgid.link/20260107-axiado-ax3000-soc-spi-db-controller-driver-v3-2-726e70cf19ad@axiado.com
Signed-off-by: Mark Brown <broonie@kernel.org>
(cherry picked from commit e75a6b00ad7962a7ed1c9c777e9ab1eb29043ec8)
Signed-off-by: Kuan-Jui Chiu <kchiu@axiado.com>
---
 drivers/spi/Kconfig      |   10 +
 drivers/spi/Makefile     |    1 +
 drivers/spi/spi-axiado.c | 1007 ++++++++++++++++++++++++++++++++++++++
 drivers/spi/spi-axiado.h |  133 +++++
 4 files changed, 1151 insertions(+)
 create mode 100644 drivers/spi/spi-axiado.c
 create mode 100644 drivers/spi/spi-axiado.h

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index 1872f9d54a5c..fa7836f5e6d2 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -204,6 +204,16 @@ config SPI_AXI_SPI_ENGINE
 	  It is part of the SPI Engine framework that is used in some Analog Devices
 	  reference designs for FPGAs.
 
+config SPI_AXIADO
+	tristate "Axiado DB-H SPI controller"
+	depends on SPI_MEM
+	help
+	  Enable support for the SPI controller present on Axiado AX3000 SoCs.
+
+	  The implementation supports host-only mode and does not provide target
+	  functionality. It is intended for use cases where the SoC acts as the SPI
+	  host, communicating with peripheral devices such as flash memory.
+
 config SPI_BCM2835
 	tristate "BCM2835 SPI controller"
 	depends on GPIOLIB
diff --git a/drivers/spi/Makefile b/drivers/spi/Makefile
index 1f7c06a3091d..0cfc33a005e3 100644
--- a/drivers/spi/Makefile
+++ b/drivers/spi/Makefile
@@ -32,6 +32,7 @@ obj-$(CONFIG_SPI_AT91_USART)		+= spi-at91-usart.o
 obj-$(CONFIG_SPI_ATH79)			+= spi-ath79.o
 obj-$(CONFIG_SPI_AU1550)		+= spi-au1550.o
 obj-$(CONFIG_SPI_AXI_SPI_ENGINE)	+= spi-axi-spi-engine.o
+obj-$(CONFIG_SPI_AXIADO)		+= spi-axiado.o
 obj-$(CONFIG_SPI_BCM2835)		+= spi-bcm2835.o
 obj-$(CONFIG_SPI_BCM2835AUX)		+= spi-bcm2835aux.o
 obj-$(CONFIG_SPI_BCM63XX)		+= spi-bcm63xx.o
diff --git a/drivers/spi/spi-axiado.c b/drivers/spi/spi-axiado.c
new file mode 100644
index 000000000000..8cea81432c5b
--- /dev/null
+++ b/drivers/spi/spi-axiado.c
@@ -0,0 +1,1007 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+//
+// Axiado SPI controller driver (Host mode only)
+//
+// Copyright (C) 2022-2025 Axiado Corporation (or its affiliates).
+//
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of_irq.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/spi/spi.h>
+#include <linux/spi/spi-mem.h>
+#include <linux/sizes.h>
+
+#include "spi-axiado.h"
+
+/**
+ * ax_spi_read - Register Read - 32 bit per word
+ * @xspi:	Pointer to the ax_spi structure
+ * @offset:	Register offset address
+ *
+ * @return:	Returns the value of that register
+ */
+static inline u32 ax_spi_read(struct ax_spi *xspi, u32 offset)
+{
+	return readl_relaxed(xspi->regs + offset);
+}
+
+/**
+ * ax_spi_write - Register write - 32 bit per word
+ * @xspi:	Pointer to the ax_spi structure
+ * @offset:	Register offset address
+ * @val:	Value to write into that register
+ */
+static inline void ax_spi_write(struct ax_spi *xspi, u32 offset, u32 val)
+{
+	writel_relaxed(val, xspi->regs + offset);
+}
+
+/**
+ * ax_spi_write_b - Register Read - 8 bit per word
+ * @xspi:	Pointer to the ax_spi structure
+ * @offset:	Register offset address
+ * @val:	Value to write into that register
+ */
+static inline void ax_spi_write_b(struct ax_spi *xspi, u32 offset, u8 val)
+{
+	writeb_relaxed(val, xspi->regs + offset);
+}
+
+/**
+ * ax_spi_init_hw - Initialize the hardware and configure the SPI controller
+ * @xspi:	Pointer to the ax_spi structure
+ *
+ * * On reset the SPI controller is configured to be in host mode.
+ * In host mode baud rate divisor is set to 4, threshold value for TX FIFO
+ * not full interrupt is set to 1 and size of the word to be transferred as 8 bit.
+ *
+ * This function initializes the SPI controller to disable and clear all the
+ * interrupts, enable manual target select and manual start, deselect all the
+ * chip select lines, and enable the SPI controller.
+ */
+static void ax_spi_init_hw(struct ax_spi *xspi)
+{
+	u32 reg_value;
+
+	/* Clear CR1 */
+	ax_spi_write(xspi, AX_SPI_CR1, AX_SPI_CR1_CLR);
+
+	/* CR1 - CPO CHP MSS SCE SCR */
+	reg_value = ax_spi_read(xspi, AX_SPI_CR1);
+	reg_value |= AX_SPI_CR1_SCR | AX_SPI_CR1_SCE;
+
+	ax_spi_write(xspi, AX_SPI_CR1, reg_value);
+
+	/* CR2 - MTE SRD SWD SSO */
+	reg_value = ax_spi_read(xspi, AX_SPI_CR2);
+	reg_value |= AX_SPI_CR2_SWD | AX_SPI_CR2_SRD;
+
+	ax_spi_write(xspi, AX_SPI_CR2, reg_value);
+
+	/* CR3 - Reserverd bits S3W SDL */
+	ax_spi_write(xspi, AX_SPI_CR3, AX_SPI_CR3_SDL);
+
+	/* SCDR - Reserved bits SCS SCD */
+	ax_spi_write(xspi, AX_SPI_SCDR, (AX_SPI_SCDR_SCS | AX_SPI_SCD_DEFAULT));
+
+	/* IMR */
+	ax_spi_write(xspi, AX_SPI_IMR, AX_SPI_IMR_CLR);
+
+	/* ISR - Clear all the interrupt */
+	ax_spi_write(xspi, AX_SPI_ISR, AX_SPI_ISR_CLR);
+}
+
+/**
+ * ax_spi_chipselect - Select or deselect the chip select line
+ * @spi:	Pointer to the spi_device structure
+ * @is_high:	Select(0) or deselect (1) the chip select line
+ */
+static void ax_spi_chipselect(struct spi_device *spi, bool is_high)
+{
+	struct ax_spi *xspi = spi_controller_get_devdata(spi->controller);
+	u32 ctrl_reg;
+
+	ctrl_reg = ax_spi_read(xspi, AX_SPI_CR2);
+	/* Reset the chip select */
+	ctrl_reg &= ~AX_SPI_DEFAULT_TS_MASK;
+	ctrl_reg |= spi_get_chipselect(spi, 0);
+
+	ax_spi_write(xspi, AX_SPI_CR2, ctrl_reg);
+}
+
+/**
+ * ax_spi_config_clock_mode - Sets clock polarity and phase
+ * @spi:	Pointer to the spi_device structure
+ *
+ * Sets the requested clock polarity and phase.
+ */
+static void ax_spi_config_clock_mode(struct spi_device *spi)
+{
+	struct ax_spi *xspi = spi_controller_get_devdata(spi->controller);
+	u32 ctrl_reg, new_ctrl_reg;
+
+	new_ctrl_reg = ax_spi_read(xspi, AX_SPI_CR1);
+	ctrl_reg = new_ctrl_reg;
+
+	/* Set the SPI clock phase and clock polarity */
+	new_ctrl_reg &= ~(AX_SPI_CR1_CPHA | AX_SPI_CR1_CPOL);
+	if (spi->mode & SPI_CPHA)
+		new_ctrl_reg |= AX_SPI_CR1_CPHA;
+	if (spi->mode & SPI_CPOL)
+		new_ctrl_reg |= AX_SPI_CR1_CPOL;
+
+	if (new_ctrl_reg != ctrl_reg)
+		ax_spi_write(xspi, AX_SPI_CR1, new_ctrl_reg);
+	ax_spi_write(xspi, AX_SPI_CR1, 0x03);
+}
+
+/**
+ * ax_spi_config_clock_freq - Sets clock frequency
+ * @spi:	Pointer to the spi_device structure
+ * @transfer:	Pointer to the spi_transfer structure which provides
+ *		information about next transfer setup parameters
+ *
+ * Sets the requested clock frequency.
+ * Note: If the requested frequency is not an exact match with what can be
+ * obtained using the prescalar value the driver sets the clock frequency which
+ * is lower than the requested frequency (maximum lower) for the transfer. If
+ * the requested frequency is higher or lower than that is supported by the SPI
+ * controller the driver will set the highest or lowest frequency supported by
+ * controller.
+ */
+static void ax_spi_config_clock_freq(struct spi_device *spi,
+				     struct spi_transfer *transfer)
+{
+	struct ax_spi *xspi = spi_controller_get_devdata(spi->controller);
+
+	ax_spi_write(xspi, AX_SPI_SCDR, (AX_SPI_SCDR_SCS | AX_SPI_SCD_DEFAULT));
+}
+
+/**
+ * ax_spi_setup_transfer - Configure SPI controller for specified transfer
+ * @spi:	Pointer to the spi_device structure
+ * @transfer:	Pointer to the spi_transfer structure which provides
+ *		information about next transfer setup parameters
+ *
+ * Sets the operational mode of SPI controller for the next SPI transfer and
+ * sets the requested clock frequency.
+ *
+ */
+static void ax_spi_setup_transfer(struct spi_device *spi,
+				 struct spi_transfer *transfer)
+{
+	struct ax_spi *xspi = spi_controller_get_devdata(spi->controller);
+
+	ax_spi_config_clock_freq(spi, transfer);
+
+	dev_dbg(&spi->dev, "%s, mode %d, %u bits/w, %u clock speed\n",
+		__func__, spi->mode, spi->bits_per_word,
+		xspi->speed_hz);
+}
+
+/**
+ * ax_spi_fill_tx_fifo - Fills the TX FIFO with as many bytes as possible
+ * @xspi:	Pointer to the ax_spi structure
+ */
+static void ax_spi_fill_tx_fifo(struct ax_spi *xspi)
+{
+	unsigned long trans_cnt = 0;
+
+	while ((trans_cnt < xspi->tx_fifo_depth) &&
+	       (xspi->tx_bytes > 0)) {
+		/* When xspi in busy condition, bytes may send failed,
+		 * then spi control did't work thoroughly, add one byte delay
+		 */
+		if (ax_spi_read(xspi, AX_SPI_IVR) & AX_SPI_IVR_TFOV)
+			usleep_range(10, 10);
+		if (xspi->tx_buf)
+			ax_spi_write_b(xspi, AX_SPI_TXFIFO, *xspi->tx_buf++);
+		else
+			ax_spi_write_b(xspi, AX_SPI_TXFIFO, 0);
+
+		xspi->tx_bytes--;
+		trans_cnt++;
+	}
+}
+
+/**
+ * ax_spi_get_rx_byte - Gets a byte from the RX FIFO buffer
+ * @xspi: Controller private data (struct ax_spi *)
+ *
+ * This function handles the logic of extracting bytes from the 32-bit RX FIFO.
+ * It reads a new 32-bit word from AX_SPI_RXFIFO only when the current buffered
+ * word has been fully processed (all 4 bytes extracted). It then extracts
+ * bytes one by one, assuming the controller is little-endian.
+ *
+ * Returns: The next 8-bit byte read from the RX FIFO stream.
+ */
+static u8 ax_spi_get_rx_byte_for_irq(struct ax_spi *xspi)
+{
+	u8 byte_val;
+
+	/* If all bytes from the current 32-bit word have been extracted,
+	 * read a new word from the hardware RX FIFO.
+	 */
+	if (xspi->bytes_left_in_current_rx_word_for_irq == 0) {
+		xspi->current_rx_fifo_word_for_irq = ax_spi_read(xspi, AX_SPI_RXFIFO);
+		xspi->bytes_left_in_current_rx_word_for_irq = 4; // A new 32-bit word has 4 bytes
+	}
+
+	/* Extract the least significant byte from the current 32-bit word */
+	byte_val = (u8)(xspi->current_rx_fifo_word_for_irq & 0xFF);
+
+	/* Shift the word right by 8 bits to prepare the next byte for extraction */
+	xspi->current_rx_fifo_word_for_irq >>= 8;
+	xspi->bytes_left_in_current_rx_word_for_irq--;
+
+	return byte_val;
+}
+
+/**
+ * Helper function to process received bytes and check for transfer completion.
+ * This avoids code duplication and centralizes the completion logic.
+ * Returns true if the transfer was finalized.
+ */
+static bool ax_spi_process_rx_and_finalize(struct spi_controller *ctlr)
+{
+	struct ax_spi *xspi = spi_controller_get_devdata(ctlr);
+
+	/* Process any remaining bytes in the RX FIFO */
+	u32 avail_bytes = ax_spi_read(xspi, AX_SPI_RX_FBCAR);
+
+	/* This loop handles bytes that are already staged from a previous word read */
+	while (xspi->bytes_left_in_current_rx_word_for_irq &&
+	       (xspi->rx_copy_remaining || xspi->rx_discard)) {
+		u8 b = ax_spi_get_rx_byte_for_irq(xspi);
+
+		if (xspi->rx_discard) {
+			xspi->rx_discard--;
+		} else {
+			*xspi->rx_buf++ = b;
+			xspi->rx_copy_remaining--;
+		}
+	}
+
+	/* This loop processes new words directly from the FIFO */
+	while (avail_bytes >= 4 && (xspi->rx_copy_remaining || xspi->rx_discard)) {
+		/* This function should handle reading from the FIFO */
+		u8 b = ax_spi_get_rx_byte_for_irq(xspi);
+
+		if (xspi->rx_discard) {
+			xspi->rx_discard--;
+		} else {
+			*xspi->rx_buf++ = b;
+			xspi->rx_copy_remaining--;
+		}
+		/* ax_spi_get_rx_byte_for_irq fetches a new word when needed
+		 * and updates internal state.
+		 */
+		if (xspi->bytes_left_in_current_rx_word_for_irq == 3)
+			avail_bytes -= 4;
+	}
+
+	/* Completion Check: The transfer is truly complete if all expected
+	 * RX bytes have been copied or discarded.
+	 */
+	if (xspi->rx_copy_remaining == 0 && xspi->rx_discard == 0) {
+		/* Defensive drain: If for some reason there are leftover bytes
+		 * in the HW FIFO after we've logically finished,
+		 * read and discard them to prevent them from corrupting the next transfer.
+		 * This should be a bounded operation.
+		 */
+		int safety_words = AX_SPI_RX_FIFO_DRAIN_LIMIT; // Limit to avoid getting stuck
+
+		while (ax_spi_read(xspi, AX_SPI_RX_FBCAR) > 0 && safety_words-- > 0)
+			ax_spi_read(xspi, AX_SPI_RXFIFO);
+
+		/* Disable all interrupts for this transfer and finalize. */
+		ax_spi_write(xspi, AX_SPI_IMR, 0x00);
+		spi_finalize_current_transfer(ctlr);
+		return true;
+	}
+
+	return false;
+}
+
+/**
+ * ax_spi_irq - Interrupt service routine of the SPI controller
+ * @irq:	IRQ number
+ * @dev_id:	Pointer to the xspi structure
+ *
+ * This function handles RX FIFO almost full and Host Transfer Completed interrupts only.
+ * On RX FIFO amlost full interrupt this function reads the received data from RX FIFO and
+ * fills the TX FIFO if there is any data remaining to be transferred.
+ * On Host Transfer Completed interrupt this function indicates that transfer is completed,
+ * the SPI subsystem will clear MTC bit.
+ *
+ * Return:	IRQ_HANDLED when handled; IRQ_NONE otherwise.
+ */
+static irqreturn_t ax_spi_irq(int irq, void *dev_id)
+{
+	struct spi_controller *ctlr = dev_id;
+	struct ax_spi *xspi = spi_controller_get_devdata(ctlr);
+	u32 intr_status;
+
+	intr_status = ax_spi_read(xspi, AX_SPI_IVR);
+	if (!intr_status)
+		return IRQ_NONE;
+
+	/* Handle "Message Transfer Complete" interrupt.
+	 * This means all bytes have been shifted out of the TX FIFO.
+	 * It's time to harvest the final incoming bytes from the RX FIFO.
+	 */
+	if (intr_status & AX_SPI_IVR_MTCV) {
+		/* Clear the MTC interrupt flag immediately. */
+		ax_spi_write(xspi, AX_SPI_ISR, AX_SPI_ISR_MTC);
+
+		/* For a TX-only transfer, rx_buf would be NULL.
+		 * In the spi-core, rx_copy_remaining would be 0.
+		 * So we can finalize immediately.
+		 */
+		if (!xspi->rx_buf) {
+			ax_spi_write(xspi, AX_SPI_IMR, 0x00);
+			spi_finalize_current_transfer(ctlr);
+			return IRQ_HANDLED;
+		}
+		/* For a full-duplex transfer, process any remaining RX data.
+		 * The helper function will handle finalization if everything is received.
+		 */
+		ax_spi_process_rx_and_finalize(ctlr);
+		return IRQ_HANDLED;
+	}
+
+	/* Handle "RX FIFO Full / Threshold Met" interrupt.
+	 * This means we need to make space in the RX FIFO by reading from it.
+	 */
+	if (intr_status & AX_SPI_IVR_RFFV) {
+		if (ax_spi_process_rx_and_finalize(ctlr)) {
+			/* Transfer was finalized inside the helper, we are done. */
+		} else {
+			/* RX is not yet complete. If there are still TX bytes to send
+			 * (for very long transfers), we can fill the TX FIFO again.
+			 */
+			if (xspi->tx_bytes)
+				ax_spi_fill_tx_fifo(xspi);
+		}
+		return IRQ_HANDLED;
+	}
+
+	return IRQ_NONE;
+}
+
+static int ax_prepare_message(struct spi_controller *ctlr,
+			      struct spi_message *msg)
+{
+	ax_spi_config_clock_mode(msg->spi);
+	return 0;
+}
+
+/**
+ * ax_transfer_one - Initiates the SPI transfer
+ * @ctlr:	Pointer to spi_controller structure
+ * @spi:	Pointer to the spi_device structure
+ * @transfer:	Pointer to the spi_transfer structure which provides
+ *		information about next transfer parameters
+ *
+ * This function fills the TX FIFO, starts the SPI transfer and
+ * returns a positive transfer count so that core will wait for completion.
+ *
+ * Return:	Number of bytes transferred in the last transfer
+ */
+static int ax_transfer_one(struct spi_controller *ctlr,
+			   struct spi_device *spi,
+			   struct spi_transfer *transfer)
+{
+	struct ax_spi *xspi = spi_controller_get_devdata(ctlr);
+	int drain_limit;
+
+	/* Pre-transfer cleanup:Flush the RX FIFO to discard any stale data.
+	 * This is the crucial part. Before every new transfer, we must ensure
+	 * the HW is in a clean state to avoid processing stale data
+	 * from a previous, possibly failed or interrupted, transfer.
+	 */
+	drain_limit = AX_SPI_RX_FIFO_DRAIN_LIMIT; // Sane limit to prevent infinite loop on HW error
+	while (ax_spi_read(xspi, AX_SPI_RX_FBCAR) > 0 && drain_limit-- > 0)
+		ax_spi_read(xspi, AX_SPI_RXFIFO); // Read and discard
+
+	if (drain_limit <= 0)
+		dev_warn(&ctlr->dev, "RX FIFO drain timeout before transfer\n");
+
+	/* Clear any stale interrupt flags from a previous transfer.
+	 * This prevents an immediate, false interrupt trigger.
+	 */
+	ax_spi_write(xspi, AX_SPI_ISR, AX_SPI_ISR_CLR);
+
+	xspi->tx_buf = transfer->tx_buf;
+	xspi->rx_buf = transfer->rx_buf;
+	xspi->tx_bytes = transfer->len;
+	xspi->rx_bytes = transfer->len;
+
+	/* Reset RX 32-bit to byte buffer for each new transfer */
+	if (transfer->tx_buf && !transfer->rx_buf) {
+		/* TX mode: discard all received data */
+		xspi->rx_discard = transfer->len;
+		xspi->rx_copy_remaining = 0;
+	} else if ((!transfer->tx_buf && transfer->rx_buf) ||
+		   (transfer->tx_buf && transfer->rx_buf)) {
+		/* RX mode: generate clock by filling TX FIFO with dummy bytes
+		 * Full-duplex mode: generate clock by filling TX FIFO
+		 */
+		xspi->rx_discard = 0;
+		xspi->rx_copy_remaining = transfer->len;
+	} else {
+		/* No TX and RX */
+		xspi->rx_discard = 0;
+		xspi->rx_copy_remaining = transfer->len;
+	}
+
+	ax_spi_setup_transfer(spi, transfer);
+	ax_spi_fill_tx_fifo(xspi);
+	ax_spi_write(xspi, AX_SPI_CR2, (AX_SPI_CR2_HTE | AX_SPI_CR2_SRD | AX_SPI_CR2_SWD));
+
+	ax_spi_write(xspi, AX_SPI_IMR, (AX_SPI_IMR_MTCM | AX_SPI_IMR_RFFM));
+	return transfer->len;
+}
+
+/**
+ * ax_prepare_transfer_hardware - Prepares hardware for transfer.
+ * @ctlr:	Pointer to the spi_controller structure which provides
+ *		information about the controller.
+ *
+ * This function enables SPI host controller.
+ *
+ * Return:	0 always
+ */
+static int ax_prepare_transfer_hardware(struct spi_controller *ctlr)
+{
+	struct ax_spi *xspi = spi_controller_get_devdata(ctlr);
+
+	u32 reg_value;
+
+	reg_value = ax_spi_read(xspi, AX_SPI_CR1);
+	reg_value |= AX_SPI_CR1_SCE;
+
+	ax_spi_write(xspi, AX_SPI_CR1, reg_value);
+
+	return 0;
+}
+
+/**
+ * ax_unprepare_transfer_hardware - Relaxes hardware after transfer
+ * @ctlr:	Pointer to the spi_controller structure which provides
+ *		information about the controller.
+ *
+ * This function disables the SPI host controller when no target selected.
+ *
+ * Return:	0 always
+ */
+static int ax_unprepare_transfer_hardware(struct spi_controller *ctlr)
+{
+	struct ax_spi *xspi = spi_controller_get_devdata(ctlr);
+
+	u32 reg_value;
+
+	/* Disable the SPI if target is deselected */
+	reg_value = ax_spi_read(xspi, AX_SPI_CR1);
+	reg_value &= ~AX_SPI_CR1_SCE;
+
+	ax_spi_write(xspi, AX_SPI_CR1, reg_value);
+
+	return 0;
+}
+
+/**
+ * ax_spi_detect_fifo_depth - Detect the FIFO depth of the hardware
+ * @xspi:	Pointer to the ax_spi structure
+ *
+ * The depth of the TX FIFO is a synthesis configuration parameter of the SPI
+ * IP. The FIFO threshold register is sized so that its maximum value can be the
+ * FIFO size - 1. This is used to detect the size of the FIFO.
+ */
+static void ax_spi_detect_fifo_depth(struct ax_spi *xspi)
+{
+	/* The MSBs will get truncated giving us the size of the FIFO */
+	ax_spi_write(xspi, AX_SPI_TX_FAETR, ALMOST_EMPTY_TRESHOLD);
+	xspi->tx_fifo_depth = FIFO_DEPTH;
+
+	/* Set the threshold limit */
+	ax_spi_write(xspi, AX_SPI_TX_FAETR, ALMOST_EMPTY_TRESHOLD);
+	ax_spi_write(xspi, AX_SPI_RX_FAFTR, ALMOST_FULL_TRESHOLD);
+}
+
+/* --- Internal Helper Function for 32-bit RX FIFO Read --- */
+/**
+ * ax_spi_get_rx_byte - Gets a byte from the RX FIFO buffer
+ * @xspi: Controller private data (struct ax_spi *)
+ *
+ * This function handles the logic of extracting bytes from the 32-bit RX FIFO.
+ * It reads a new 32-bit word from AX_SPI_RXFIFO only when the current buffered
+ * word has been fully processed (all 4 bytes extracted). It then extracts
+ * bytes one by one, assuming the controller is little-endian.
+ *
+ * Returns: The next 8-bit byte read from the RX FIFO stream.
+ */
+static u8 ax_spi_get_rx_byte(struct ax_spi *xspi)
+{
+	u8 byte_val;
+
+	/* If all bytes from the current 32-bit word have been extracted,
+	 * read a new word from the hardware RX FIFO.
+	 */
+	if (xspi->bytes_left_in_current_rx_word == 0) {
+		xspi->current_rx_fifo_word = ax_spi_read(xspi, AX_SPI_RXFIFO);
+		xspi->bytes_left_in_current_rx_word = 4; // A new 32-bit word has 4 bytes
+	}
+
+	/* Extract the least significant byte from the current 32-bit word */
+	byte_val = (u8)(xspi->current_rx_fifo_word & 0xFF);
+
+	/* Shift the word right by 8 bits to prepare the next byte for extraction */
+	xspi->current_rx_fifo_word >>= 8;
+	xspi->bytes_left_in_current_rx_word--;
+
+	return byte_val;
+}
+
+static int ax_spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
+{
+	struct spi_device *spi = mem->spi;
+	struct ax_spi *xspi = spi_controller_get_devdata(spi->controller);
+	u32 reg_val;
+	int ret = 0;
+	u8 cmd_buf[AX_SPI_COMMAND_BUFFER_SIZE];
+	int cmd_len = 0;
+	int i = 0, timeout = AX_SPI_TRX_FIFO_TIMEOUT;
+	int bytes_to_discard_from_rx;
+	u8 *rx_buf_ptr = (u8 *)op->data.buf.in;
+	u8 *tx_buf_ptr = (u8 *)op->data.buf.out;
+	u32 rx_count_reg = 0;
+
+	dev_dbg(&spi->dev,
+		"%s: cmd:%02x mode:%d.%d.%d.%d addr:%llx len:%d\n",
+		__func__, op->cmd.opcode, op->cmd.buswidth, op->addr.buswidth,
+		op->dummy.buswidth, op->data.buswidth, op->addr.val,
+		op->data.nbytes);
+
+	/* Validate operation parameters: Only 1-bit bus width supported */
+	if (op->cmd.buswidth != 1 ||
+	    (op->addr.nbytes && op->addr.buswidth != 0 &&
+	    op->addr.buswidth != 1) ||
+	    (op->dummy.nbytes && op->dummy.buswidth != 0 &&
+	    op->dummy.buswidth != 1) ||
+	    (op->data.nbytes && op->data.buswidth != 1)) {
+		dev_err(&spi->dev, "Unsupported bus width, only 1-bit bus width supported\n");
+		return -EOPNOTSUPP;
+	}
+
+	/* Initialize controller hardware */
+	ax_spi_init_hw(xspi);
+
+	/* Assert chip select (pull low) */
+	ax_spi_chipselect(spi, false);
+
+	/* Build command phase: Copy opcode to cmd_buf */
+	if (op->cmd.nbytes == 2) {
+		cmd_buf[cmd_len++] = (op->cmd.opcode >> 8) & 0xFF;
+		cmd_buf[cmd_len++] = op->cmd.opcode & 0xFF;
+	} else {
+		cmd_buf[cmd_len++] = op->cmd.opcode;
+	}
+
+	/* Put address bytes to cmd_buf */
+	if (op->addr.nbytes) {
+		for (i = op->addr.nbytes - 1; i >= 0; i--) {
+			cmd_buf[cmd_len] = (op->addr.val >> (i * 8)) & 0xFF;
+			cmd_len++;
+		}
+	}
+
+	/* Configure controller for desired operation mode (write/read) */
+	reg_val = ax_spi_read(xspi, AX_SPI_CR2);
+	reg_val |= AX_SPI_CR2_SWD | AX_SPI_CR2_SRI | AX_SPI_CR2_SRD;
+	ax_spi_write(xspi, AX_SPI_CR2, reg_val);
+
+	/* Write command and address bytes to TX_FIFO */
+	for (i = 0; i < cmd_len; i++)
+		ax_spi_write_b(xspi, AX_SPI_TXFIFO, cmd_buf[i]);
+
+	/* Add dummy bytes (for clock generation) or actual data bytes to TX_FIFO */
+	if (op->data.dir == SPI_MEM_DATA_IN) {
+		for (i = 0; i < op->dummy.nbytes; i++)
+			ax_spi_write_b(xspi, AX_SPI_TXFIFO, 0x00);
+		for (i = 0; i < op->data.nbytes; i++)
+			ax_spi_write_b(xspi, AX_SPI_TXFIFO, 0x00);
+	} else {
+		for (i = 0; i < op->data.nbytes; i++)
+			ax_spi_write_b(xspi, AX_SPI_TXFIFO, tx_buf_ptr[i]);
+	}
+
+	/* Start the SPI transmission */
+	reg_val = ax_spi_read(xspi, AX_SPI_CR2);
+	reg_val |= AX_SPI_CR2_HTE;
+	ax_spi_write(xspi, AX_SPI_CR2, reg_val);
+
+	/* Wait for TX FIFO to become empty */
+	while (timeout-- > 0) {
+		u32 tx_count_reg = ax_spi_read(xspi, AX_SPI_TX_FBCAR);
+
+		if (tx_count_reg == 0) {
+			udelay(1);
+			break;
+		}
+		udelay(1);
+	}
+
+	/* Handle Data Reception (for read operations) */
+	if (op->data.dir == SPI_MEM_DATA_IN) {
+		/* Reset the internal RX byte buffer for this new operation.
+		 * This ensures ax_spi_get_rx_byte starts fresh for each exec_op call.
+		 */
+		xspi->bytes_left_in_current_rx_word = 0;
+		xspi->current_rx_fifo_word = 0;
+
+		timeout = AX_SPI_TRX_FIFO_TIMEOUT;
+		while (timeout-- > 0) {
+			rx_count_reg = ax_spi_read(xspi, AX_SPI_RX_FBCAR);
+			if (rx_count_reg >= op->data.nbytes)
+				break;
+			udelay(1); /* Small delay to prevent aggressive busy-waiting */
+		}
+
+		if (timeout < 0) {
+			ret = -ETIMEDOUT;
+			goto out_unlock;
+		}
+
+		/* Calculate how many bytes we need to discard from the RX FIFO.
+		 * Since we set SRI, we only need to discard the address bytes and
+		 * dummy bytes from the RX FIFO.
+		 */
+		bytes_to_discard_from_rx = op->addr.nbytes + op->dummy.nbytes;
+		for (i = 0; i < bytes_to_discard_from_rx; i++)
+			ax_spi_get_rx_byte(xspi);
+
+		/* Read actual data bytes into op->data.buf.in */
+		for (i = 0; i < op->data.nbytes; i++) {
+			*rx_buf_ptr = ax_spi_get_rx_byte(xspi);
+			rx_buf_ptr++;
+		}
+	} else if (op->data.dir == SPI_MEM_DATA_OUT) {
+		timeout = AX_SPI_TRX_FIFO_TIMEOUT;
+		while (timeout-- > 0) {
+			u32 tx_fifo_level = ax_spi_read(xspi, AX_SPI_TX_FBCAR);
+
+			if (tx_fifo_level == 0)
+				break;
+			udelay(1);
+		}
+		if (timeout < 0) {
+			ret = -ETIMEDOUT;
+			goto out_unlock;
+		}
+	}
+
+out_unlock:
+	/* Deassert chip select (pull high) */
+	ax_spi_chipselect(spi, true);
+
+	return ret;
+}
+
+static int ax_spi_mem_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
+{
+	struct spi_device *spi = mem->spi;
+	struct ax_spi *xspi = spi_controller_get_devdata(spi->controller);
+	size_t max_transfer_payload_bytes;
+	size_t fifo_total_bytes;
+	size_t protocol_overhead_bytes;
+
+	fifo_total_bytes = xspi->tx_fifo_depth;
+	/* Calculate protocol overhead bytes according to the real operation each time. */
+	protocol_overhead_bytes = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
+
+	/* Calculate the maximum data payload that can fit into the FIFO. */
+	if (fifo_total_bytes <= protocol_overhead_bytes) {
+		max_transfer_payload_bytes = 0;
+		dev_warn_once(&spi->dev, "SPI FIFO (%zu bytes) is too small for protocol overhead (%zu bytes)! Max data size forced to 0.\n",
+			 fifo_total_bytes, protocol_overhead_bytes);
+	} else {
+		max_transfer_payload_bytes = fifo_total_bytes - protocol_overhead_bytes;
+	}
+
+	/* Limit op->data.nbytes based on the calculated max payload and SZ_64K.
+	 * This is the value that spi-mem will then use to split requests.
+	 */
+	if (op->data.nbytes > max_transfer_payload_bytes) {
+		op->data.nbytes = max_transfer_payload_bytes;
+		dev_dbg(&spi->dev, "%s %d: op->data.nbytes adjusted to %u due to FIFO overhead\n",
+			__func__, __LINE__, op->data.nbytes);
+	}
+
+	/* Also apply the overall max transfer size */
+	if (op->data.nbytes > SZ_64K) {
+		op->data.nbytes = SZ_64K;
+		dev_dbg(&spi->dev, "%s %d: op->data.nbytes adjusted to %u due to SZ_64K limit\n",
+			__func__, __LINE__, op->data.nbytes);
+	}
+
+	return 0;
+}
+
+static const struct spi_controller_mem_ops ax_spi_mem_ops = {
+	.exec_op = ax_spi_mem_exec_op,
+	.adjust_op_size = ax_spi_mem_adjust_op_size,
+};
+
+/**
+ * ax_spi_probe - Probe method for the SPI driver
+ * @pdev:	Pointer to the platform_device structure
+ *
+ * This function initializes the driver data structures and the hardware.
+ *
+ * Return:	0 on success and error value on error
+ */
+static int ax_spi_probe(struct platform_device *pdev)
+{
+	int ret = 0, irq;
+	struct spi_controller *ctlr;
+	struct ax_spi *xspi;
+	u32 num_cs;
+
+	ctlr = devm_spi_alloc_host(&pdev->dev, sizeof(*xspi));
+	if (!ctlr)
+		return -ENOMEM;
+
+	xspi = spi_controller_get_devdata(ctlr);
+	ctlr->dev.of_node = pdev->dev.of_node;
+	platform_set_drvdata(pdev, ctlr);
+
+	xspi->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(xspi->regs)) {
+		ret = PTR_ERR(xspi->regs);
+		goto remove_ctlr;
+	}
+
+	xspi->pclk = devm_clk_get(&pdev->dev, "pclk");
+	if (IS_ERR(xspi->pclk)) {
+		dev_err(&pdev->dev, "pclk clock not found.\n");
+		ret = PTR_ERR(xspi->pclk);
+		goto remove_ctlr;
+	}
+
+	xspi->ref_clk = devm_clk_get(&pdev->dev, "ref");
+	if (IS_ERR(xspi->ref_clk)) {
+		dev_err(&pdev->dev, "ref clock not found.\n");
+		ret = PTR_ERR(xspi->ref_clk);
+		goto remove_ctlr;
+	}
+
+	ret = clk_prepare_enable(xspi->pclk);
+	if (ret) {
+		dev_err(&pdev->dev, "Unable to enable APB clock.\n");
+		goto remove_ctlr;
+	}
+
+	ret = clk_prepare_enable(xspi->ref_clk);
+	if (ret) {
+		dev_err(&pdev->dev, "Unable to enable device clock.\n");
+		goto clk_dis_apb;
+	}
+
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, SPI_AUTOSUSPEND_TIMEOUT);
+	pm_runtime_get_noresume(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+
+	ret = of_property_read_u32(pdev->dev.of_node, "num-cs", &num_cs);
+	if (ret < 0)
+		ctlr->num_chipselect = AX_SPI_DEFAULT_NUM_CS;
+	else
+		ctlr->num_chipselect = num_cs;
+
+	ax_spi_detect_fifo_depth(xspi);
+
+	xspi->current_rx_fifo_word = 0;
+	xspi->bytes_left_in_current_rx_word = 0;
+
+	/* Initialize IRQ-related variables */
+	xspi->bytes_left_in_current_rx_word_for_irq = 0;
+	xspi->current_rx_fifo_word_for_irq = 0;
+
+	/* SPI controller initializations */
+	ax_spi_init_hw(xspi);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq <= 0) {
+		ret = -ENXIO;
+		goto clk_dis_all;
+	}
+
+	ret = devm_request_irq(&pdev->dev, irq, ax_spi_irq,
+			       0, pdev->name, ctlr);
+	if (ret != 0) {
+		ret = -ENXIO;
+		dev_err(&pdev->dev, "request_irq failed\n");
+		goto clk_dis_all;
+	}
+
+	ctlr->use_gpio_descriptors = true;
+	ctlr->prepare_transfer_hardware = ax_prepare_transfer_hardware;
+	ctlr->prepare_message = ax_prepare_message;
+	ctlr->transfer_one = ax_transfer_one;
+	ctlr->unprepare_transfer_hardware = ax_unprepare_transfer_hardware;
+	ctlr->set_cs = ax_spi_chipselect;
+	ctlr->auto_runtime_pm = true;
+	ctlr->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH;
+
+	xspi->clk_rate = clk_get_rate(xspi->ref_clk);
+	/* Set to default valid value */
+	ctlr->max_speed_hz = xspi->clk_rate / 2;
+	xspi->speed_hz = ctlr->max_speed_hz;
+
+	ctlr->bits_per_word_mask = SPI_BPW_MASK(8);
+
+	pm_runtime_mark_last_busy(&pdev->dev);
+	pm_runtime_put_autosuspend(&pdev->dev);
+
+	ctlr->mem_ops = &ax_spi_mem_ops;
+
+	ret = spi_register_controller(ctlr);
+	if (ret) {
+		dev_err(&pdev->dev, "spi_register_controller failed\n");
+		goto clk_dis_all;
+	}
+
+	return ret;
+
+clk_dis_all:
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+	clk_disable_unprepare(xspi->ref_clk);
+clk_dis_apb:
+	clk_disable_unprepare(xspi->pclk);
+remove_ctlr:
+	spi_controller_put(ctlr);
+	return ret;
+}
+
+/**
+ * ax_spi_remove - Remove method for the SPI driver
+ * @pdev:	Pointer to the platform_device structure
+ *
+ * This function is called if a device is physically removed from the system or
+ * if the driver module is being unloaded. It frees all resources allocated to
+ * the device.
+ */
+static void ax_spi_remove(struct platform_device *pdev)
+{
+	struct spi_controller *ctlr = platform_get_drvdata(pdev);
+	struct ax_spi *xspi = spi_controller_get_devdata(ctlr);
+
+	spi_unregister_controller(ctlr);
+
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+
+	clk_disable_unprepare(xspi->ref_clk);
+	clk_disable_unprepare(xspi->pclk);
+}
+
+/**
+ * ax_spi_suspend - Suspend method for the SPI driver
+ * @dev:	Address of the platform_device structure
+ *
+ * This function disables the SPI controller and
+ * changes the driver state to "suspend"
+ *
+ * Return:	0 on success and error value on error
+ */
+static int __maybe_unused ax_spi_suspend(struct device *dev)
+{
+	struct spi_controller *ctlr = dev_get_drvdata(dev);
+
+	return spi_controller_suspend(ctlr);
+}
+
+/**
+ * ax_spi_resume - Resume method for the SPI driver
+ * @dev:	Address of the platform_device structure
+ *
+ * This function changes the driver state to "ready"
+ *
+ * Return:	0 on success and error value on error
+ */
+static int __maybe_unused ax_spi_resume(struct device *dev)
+{
+	struct spi_controller *ctlr = dev_get_drvdata(dev);
+	struct ax_spi *xspi = spi_controller_get_devdata(ctlr);
+
+	ax_spi_init_hw(xspi);
+	return spi_controller_resume(ctlr);
+}
+
+/**
+ * ax_spi_runtime_resume - Runtime resume method for the SPI driver
+ * @dev:	Address of the platform_device structure
+ *
+ * This function enables the clocks
+ *
+ * Return:	0 on success and error value on error
+ */
+static int __maybe_unused ax_spi_runtime_resume(struct device *dev)
+{
+	struct spi_controller *ctlr = dev_get_drvdata(dev);
+	struct ax_spi *xspi = spi_controller_get_devdata(ctlr);
+	int ret;
+
+	ret = clk_prepare_enable(xspi->pclk);
+	if (ret) {
+		dev_err(dev, "Cannot enable APB clock.\n");
+		return ret;
+	}
+
+	ret = clk_prepare_enable(xspi->ref_clk);
+	if (ret) {
+		dev_err(dev, "Cannot enable device clock.\n");
+		clk_disable_unprepare(xspi->pclk);
+		return ret;
+	}
+	return 0;
+}
+
+/**
+ * ax_spi_runtime_suspend - Runtime suspend method for the SPI driver
+ * @dev:	Address of the platform_device structure
+ *
+ * This function disables the clocks
+ *
+ * Return:	Always 0
+ */
+static int __maybe_unused ax_spi_runtime_suspend(struct device *dev)
+{
+	struct spi_controller *ctlr = dev_get_drvdata(dev);
+	struct ax_spi *xspi = spi_controller_get_devdata(ctlr);
+
+	clk_disable_unprepare(xspi->ref_clk);
+	clk_disable_unprepare(xspi->pclk);
+
+	return 0;
+}
+
+static const struct dev_pm_ops ax_spi_dev_pm_ops = {
+	SET_RUNTIME_PM_OPS(ax_spi_runtime_suspend,
+			   ax_spi_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(ax_spi_suspend, ax_spi_resume)
+};
+
+static const struct of_device_id ax_spi_of_match[] = {
+	{ .compatible = "axiado,ax3000-spi" },
+	{ /* end of table */ }
+};
+MODULE_DEVICE_TABLE(of, ax_spi_of_match);
+
+/* ax_spi_driver - This structure defines the SPI subsystem platform driver */
+static struct platform_driver ax_spi_driver = {
+	.probe	= ax_spi_probe,
+	.remove	= ax_spi_remove,
+	.driver = {
+		.name = AX_SPI_NAME,
+		.of_match_table = ax_spi_of_match,
+		.pm = &ax_spi_dev_pm_ops,
+	},
+};
+
+module_platform_driver(ax_spi_driver);
+
+MODULE_AUTHOR("Axiado Corporation");
+MODULE_DESCRIPTION("Axiado SPI Host driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/spi/spi-axiado.h b/drivers/spi/spi-axiado.h
new file mode 100644
index 000000000000..6cf0e5bf5879
--- /dev/null
+++ b/drivers/spi/spi-axiado.h
@@ -0,0 +1,133 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Axiado SPI controller driver (Host mode only)
+ *
+ * Copyright (C) 2022-2025 Axiado Corporation (or its affiliates).
+ */
+
+#ifndef SPI_AXIADO_H
+#define SPI_AXIADO_H
+
+/* Name of this driver */
+#define AX_SPI_NAME			"axiado-db-spi"
+
+/* Axiado - SPI Digital Blocks IP design registers */
+#define AX_SPI_TX_FAETR			0x18    // TX-FAETR
+#define ALMOST_EMPTY_TRESHOLD		0x00	// Programmed threshold value
+#define AX_SPI_RX_FAFTR			0x28    // RX-FAETR
+#define ALMOST_FULL_TRESHOLD		0x0c	// Programmed threshold value
+#define FIFO_DEPTH			256	// 256 bytes
+
+#define AX_SPI_CR1			0x00	// CR1
+#define AX_SPI_CR1_CLR			0x00	// CR1 - Clear
+#define AX_SPI_CR1_SCR			0x01	// CR1 - controller reset
+#define AX_SPI_CR1_SCE			0x02	// CR1 - Controller Enable/Disable
+#define AX_SPI_CR1_CPHA			0x08	// CR1 - CPH
+#define AX_SPI_CR1_CPOL			0x10	// CR1 - CPO
+
+#define AX_SPI_CR2			0x04	// CR2
+#define AX_SPI_CR2_SWD			0x04	// CR2 - Write Enabel/Disable
+#define AX_SPI_CR2_SRD			0x08	// CR2 - Read Enable/Disable
+#define AX_SPI_CR2_SRI			0x10	// CR2 - Read First Byte Ignore
+#define AX_SPI_CR2_HTE			0x40	// CR2 - Host Transmit Enable
+#define AX_SPI_CR3			0x08	// CR3
+#define AX_SPI_CR3_SDL			0x00	// CR3 - Data lines
+#define AX_SPI_CR3_QUAD			0x02	// CR3 - Data lines
+
+/* As per Digital Blocks datasheet clock frequency range
+ * Min - 244KHz
+ * Max - 62.5MHz
+ * SCK Clock Divider Register Values
+ */
+#define AX_SPI_RX_FBCAR			0x24	// RX_FBCAR
+#define AX_SPI_TX_FBCAR			0x14	// TX_FBCAR
+#define AX_SPI_SCDR			0x2c	// SCDR
+#define AX_SPI_SCD_MIN			0x1fe	// Valid SCD (SCK Clock Divider Register)
+#define AX_SPI_SCD_DEFAULT		0x06	// Default SCD (SCK Clock Divider Register)
+#define AX_SPI_SCD_MAX			0x00	// Valid SCD (SCK Clock Divider Register)
+#define AX_SPI_SCDR_SCS			0x0200	// SCDR - AMBA Bus Clock source
+
+#define AX_SPI_IMR			0x34	// IMR
+#define AX_SPI_IMR_CLR			0x00	// IMR - Clear
+#define AX_SPI_IMR_TFOM			0x02	// IMR - TFO
+#define AX_SPI_IMR_MTCM			0x40	// IMR - MTC
+#define AX_SPI_IMR_TFEM			0x10	// IMR - TFE
+#define AX_SPI_IMR_RFFM			0x20	// IMR - RFFM
+
+#define AX_SPI_ISR			0x30	// ISR
+#define AX_SPI_ISR_CLR			0xff	// ISR - Clear
+#define AX_SPI_ISR_MTC			0x40	// ISR - MTC
+#define AX_SPI_ISR_TFE			0x10	// ISR - TFE
+#define AX_SPI_ISR_RFF			0x20	// ISR - RFF
+
+#define AX_SPI_IVR			0x38	// IVR
+#define AX_SPI_IVR_TFOV			0x02	// IVR - TFOV
+#define AX_SPI_IVR_MTCV			0x40	// IVR - MTCV
+#define AX_SPI_IVR_TFEV			0x10	// IVR - TFEV
+#define AX_SPI_IVR_RFFV			0x20	// IVR - RFFV
+
+#define AX_SPI_TXFIFO			0x0c	// TX_FIFO
+#define AX_SPI_TX_RX_FBCR		0x10	// TX_RX_FBCR
+#define AX_SPI_RXFIFO			0x1c	// RX_FIFO
+
+#define AX_SPI_TS0			0x00	// Target select 0
+#define AX_SPI_TS1			0x01	// Target select 1
+#define AX_SPI_TS2			0x10	// Target select 2
+#define AX_SPI_TS3			0x11	// Target select 3
+
+#define SPI_AUTOSUSPEND_TIMEOUT		3000
+
+/* Default number of chip select lines also used as maximum number of chip select lines */
+#define AX_SPI_DEFAULT_NUM_CS		4
+
+/* Default number of command buffer size */
+#define AX_SPI_COMMAND_BUFFER_SIZE	16	//Command + address bytes
+
+/* Target select mask
+ * 00 – TS0
+ * 01 – TS1
+ * 10 – TS2
+ * 11 – TS3
+ */
+#define AX_SPI_DEFAULT_TS_MASK		0x03
+
+#define AX_SPI_RX_FIFO_DRAIN_LIMIT	24
+#define AX_SPI_TRX_FIFO_TIMEOUT		1000
+/**
+ * struct ax_spi - This definition defines spi driver instance
+ * @regs:					Virtual address of the SPI controller registers
+ * @ref_clk:					Pointer to the peripheral clock
+ * @pclk:					Pointer to the APB clock
+ * @speed_hz:					Current SPI bus clock speed in Hz
+ * @txbuf:					Pointer	to the TX buffer
+ * @rxbuf:					Pointer to the RX buffer
+ * @tx_bytes:					Number of bytes left to transfer
+ * @rx_bytes:					Number of bytes requested
+ * @tx_fifo_depth:				Depth of the TX FIFO
+ * @current_rx_fifo_word:			Buffers the 32-bit word read from RXFIFO
+ * @bytes_left_in_current_rx_word:		Bytes to be extracted from current 32-bit word
+ * @current_rx_fifo_word_for_irq:		Buffers the 32-bit word read from RXFIFO for IRQ
+ * @bytes_left_in_current_rx_word_for_irq:	IRQ bytes to be extracted from current 32-bit word
+ * @rx_discard:					Number of bytes to discard
+ * @rx_copy_remaining:				Number of bytes to copy
+ */
+struct ax_spi {
+	void __iomem *regs;
+	struct clk *ref_clk;
+	struct clk *pclk;
+	unsigned int clk_rate;
+	u32 speed_hz;
+	const u8 *tx_buf;
+	u8 *rx_buf;
+	int tx_bytes;
+	int rx_bytes;
+	unsigned int tx_fifo_depth;
+	u32 current_rx_fifo_word;
+	int bytes_left_in_current_rx_word;
+	u32 current_rx_fifo_word_for_irq;
+	int bytes_left_in_current_rx_word_for_irq;
+	int rx_discard;
+	int rx_copy_remaining;
+};
+
+#endif /* SPI_AXIADO_H */
-- 
2.34.1


