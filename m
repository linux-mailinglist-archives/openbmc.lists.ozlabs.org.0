Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B459A073E
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2024 12:27:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XT6bf1mFDz3cL8
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2024 21:27:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c105::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729074442;
	cv=pass; b=aqo325WaB7Dr45FAlbVgm6/tt/MhZ6kyNCoMtCEE3EMcBuKS4zKj1oURKzunH6WhKEXtaje8nNxoMuH86Ay+fjQ5Fv688B4FXmQok4/wT3wn91Ll/wSbC1vsOLIY1msrJUh0RbhHlghF4FMdRgRzk1pczifLktVykAqa+ooSIIlDYUqSh35LKuLYHi3kDx1za/xMgrGJgOfr3B8EsVkPXl3Pzms73lDQZ47vUYWAQTqWn3fSQRf9ZFj33HXXEhnUv+HmKAtkwgvpdpZhoUivZjlRAJepD1hltwOI8SOqwHzLglHxVD/H3+sJgqz60yZwlQdYRi5fAkljF5xDTlvLkA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729074442; c=relaxed/relaxed;
	bh=EOKYwRRYaUot1QbD/YC0hIcxM2oQtb1LBQqet8QJOSY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nKxTrokNzsW5hvGGGQEh/fuh8j5FjQ4c5Drk40YEWpdpBlq8oyo9L1xeXmhh4NI90VgdTSOJ50K/yxCno2iGX+muQQKNmOjBt7XD1BziMBVLS3wd0KS23IWP21ZbCPxu49MH//LsxPEBPJo19aQUN96nE8RgnJNqWx8oE7Q62s2o/JUz7P42ZCT562q61qj3p24udTPeP1Pon6MIWPI63JNcQr2eHOuyFnoB87H/A/9c4AS7tgmJ9tyLak9qUYAIkNIPKB9+SWUYT01J2htHY6v3ln3YXI9cv9ljQV+TvWJ97/GeRXF6DG/pzm8Cz5smL7PWPjO8eox2FwfnVwYNvw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com; dkim=fail header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=9bpc10j8 reason="key not found in DNS"; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c105::5; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org) smtp.mailfrom=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=9bpc10j8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:c105::5; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c105::5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XT6bY1JCXz2xqc;
	Wed, 16 Oct 2024 21:27:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KC8H866jml/vmZbM7UfdeRN3JMlBL7TKw7E/l+HHf15Pfe/s7IvZifsL8UkPT40I7k/paHZ0zOM9jWsigI+dhDPwW5BkCDjFQLUNLO3CJS3s9MNdJYWBwIRKQzegj+MRZkDjjcDDmwZz0z92w4RIIgi7eRiDmFKnWmj/o1t7cA8zwFcZui97XX/fmkTpvRq8j7Ah1HjoOnMDZrWX1IRU6IVKQjWM2UqcQ8wFEpeC3eImjFllWmje5XRPUUV96/pHxfiPcqwftd0ezMph96zP+zsh0CixPUGnwVdXTrZsVPrYyiIQ6GSB0Kjl/legM+DxsxEvzAc4B0I7064lzHiwLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOKYwRRYaUot1QbD/YC0hIcxM2oQtb1LBQqet8QJOSY=;
 b=qlI80elNScb+udJVmfvd+dwQFELlQ/k8uWYc43u81HKOQHZZvC2JbyF9ZheLjjmgFZehav3B3pnZ97aZjM5a9MVH54xopBeco/sh00VljZ1eE055EuG8Z25NIBlpRo6vnbB4lpBpKMae2oDGynEgDFoa1dUCl3/lVYjwOFQCSnqimKg+bv4biKNWJI6itZcuJz5fh/JuOIRqRRr2CbLHqzpsFA7/94MZq9vSQ553ySZtuhga0Fhx4yfpz8Q4Vo6Vvh208a1GwuFoJ/+Cbz4e8ef0PMNhnbYkAP81ydUtce+90GHG9l5hW5dXgBNKP0M1nuhk0m/fU/f+bhV1p4Wqtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOKYwRRYaUot1QbD/YC0hIcxM2oQtb1LBQqet8QJOSY=;
 b=9bpc10j8euJRRf9ht5SOT4uT5AuL6V6950ItEKQqp2WlXwTjpNosD+2fpBb2P3zlgVlieG4Bt+nntKbSj12O2LsZc1vQQw98xIzu7yJstLuL8tygmtTc+7DMRaIE7qSUZeKIQHFC9MDmXU+p5HlWVlDppwDtcl/yyqbvYJhzkT4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 DS7PR01MB7685.prod.exchangelabs.com (2603:10b6:8:78::13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.34; Wed, 16 Oct 2024 10:26:53 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7982.033; Wed, 16 Oct 2024
 10:26:53 +0000
Message-ID: <c42be4ea-9902-4fac-8b1e-afc38fe04bad@amperemail.onmicrosoft.com>
Date: Wed, 16 Oct 2024 17:26:42 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: aspeed: Add device tree for Ampere's Mt.
 Jefferson BMC
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Chanh Nguyen <chanh@os.amperecomputing.com>
References: <20241014105031.1963079-1-chanh@os.amperecomputing.com>
 <172891445289.1127319.4114892374425336022.robh@kernel.org>
 <b5919d904c9f06a618a54d49bc895c3081a511e4.camel@codeconstruct.com.au>
 <e8e31fb4-4a9f-4ea9-be4d-9ba29d824cc5@amperemail.onmicrosoft.com>
 <7555c528c90e6151f54d0e17c278527f95fac184.camel@codeconstruct.com.au>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <7555c528c90e6151f54d0e17c278527f95fac184.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0138.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::18) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|DS7PR01MB7685:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d14cb5e-e5de-4142-00c1-08dcedcd0d57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?QmJSa3dxL3Y0aUFwd0xFS1hmMkQ5Nkl4TzFrQzFSdm1sY1YvdUhxM3BuNUQ4?=
 =?utf-8?B?emt2a2lLSHBqT2V6VHlkVzBwS3VnM0FsUGhJUTBXc29FWThsSkJBTmU0RzQw?=
 =?utf-8?B?eWRZS2tyUW1CQzJKMzNMRHRGaG40Tk51dnR6b2JRV0M5Q1ArczM1WTE4SUYy?=
 =?utf-8?B?VS9PMWpqQnpCbkZ2QXRwTW1aWW0vUUwvTnc0aXc2a0xsSlVwamVHN2RvNWRC?=
 =?utf-8?B?Sk1XQzIzMEpTZ2J5U212UE00UC96MUhWNmdJTGd3eTVtVmRjdGhwL3FhRSsw?=
 =?utf-8?B?N081OTFrNDgwM3k1dmJYcWdoVE5kY25VREhjMElkK3BQTVl3cFFIcVlTcVZq?=
 =?utf-8?B?VjRTVjlMaVJIZkR2bERFWjZJdkRPdkdQcjJpUWIzOVBOWUhmamoyeFNmS2lS?=
 =?utf-8?B?Z3RQZDRVS245clM4Rk9DQzR0ZEFwVTQ0WUZOZnA0NEd5aEl0Y1MreUpKdGV6?=
 =?utf-8?B?bjJvVW52MUpZVXV6UEVOSkVEdWRBaTc4MzRwS01nVTZ0aEx6cVlJZjZ4VGND?=
 =?utf-8?B?NGxCWlcyRmxLQjBySklqRnF2V2VqWGRwYksrU0RKN0ZGTit0bHFQallUbW44?=
 =?utf-8?B?NVV0dFB1L2k4cVU2NG9lOWZpS05kQnM2d0ZnSTR6Y0xrbWZtcHVic0YvYzVF?=
 =?utf-8?B?cFpTeXlxMC81K21DL2R5MGd1SERLQTVPUFlZUHBmOGR6bHkyVjFabDNKcVlt?=
 =?utf-8?B?Y1QwL3IzK2ZzVkZUZmtuR29JZE9kZ0JrWVIySTVFb2ZIMHRhYkVTL0Y0aXE3?=
 =?utf-8?B?citrZURjTjg4ZUwrTlpyRi9FVVlhT2JOb09QNWI2K2U4TWw2a2JTS1psYmw4?=
 =?utf-8?B?aFlyZTBHdzdCUEprVERFb2lKUG5SR0cxNGZzV3lpQ21mZ0hOYndyWWJYMmc1?=
 =?utf-8?B?M0Y2V3lpb2h6SFdKTWU2U29obGVVV0NFL1J1RGJKeHdGMHBKNkNuN0pPSm1p?=
 =?utf-8?B?bmpZOXpsYkpjRW52ODBOOHdRRm9mS2tiYnlPY2k0d3lZSXQ2L0dUZ2h4TGM3?=
 =?utf-8?B?SmhuOE9SM00yL2Y0dmdGOVZVeGhlTW5tMEUrWjVUL0JOdjF0UFZkeWRmTW1x?=
 =?utf-8?B?WVNLazF4YWlhRlpBV2dRN0V0dXEwTjVTU0dKck5UT2Y1cHhPQkx5SGZwdnlS?=
 =?utf-8?B?UXNyVFh4UnZPczFzTTBSVGZjT2tuUy84eTkvL2tEUFlOdkEyS2VQbjBuMlhM?=
 =?utf-8?B?cHhzcGlHQi81Qm5CUzNDRTBtZHhXeVBRczBEdi8zRGdId29TUUd4eGh0cWQ0?=
 =?utf-8?B?eG5ZWXBPaWRWc256S3VsTDg2RWpjZWJ5NGlHbkFoQWh6V1dSYk94MStPTzl6?=
 =?utf-8?B?OTBhdEVlTEhlS0RkS2kxallmYmFGUjJlVnc1bzcvVWF4dTNkSFhrbENubzhG?=
 =?utf-8?B?dnNsWFNVbXkvUkltSEY4UW04Qk44L29OMmVCV1hLQlcyc29xdDFBcXltWE11?=
 =?utf-8?B?SFhpQUQ4dUFaK3NzVE1xbm1qNGUyWTd1SWkrZEJxZmw2UVRFaXNaOUhYTmww?=
 =?utf-8?B?VEhhMXpWSTZuSkI3ZnZKQTBaTkw4b2wwZkZXUXpQME5LN0dpNnl0aFZobmtv?=
 =?utf-8?B?Y0pJbStaQ08rNlVuUWg4UnVQNlN0UEsvUDB3cnlyTFNUTkJyUitvY3RiOW4x?=
 =?utf-8?Q?paP0mR7CZAlzdICGzXiPTnSwFNKfJMbIyfM1xam1UdQg=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?OXZiQXVwbUo1MStrMEw0TldkOW1WbW8wYU9HQmhGT1JFSHdOL3RRZFBLbm03?=
 =?utf-8?B?OUFEc2dDRFNxTWM5V2MvQlo0bWlyVUE4R3BUVURYYkw1ejA4blBKWG5VMjda?=
 =?utf-8?B?M2pHejBXUENlRFVqMThpTkJOTm1HbWlCZ0ZQOUNkV0NKTk1rcnQxaXNnSDRC?=
 =?utf-8?B?QWVMMCtPZjhyb2d3RGpRSmxMeWFlL0Y0NmxZSXZJekxMUXdZKytUY2RoTGxE?=
 =?utf-8?B?ZllXMjAzb0tkdzVNV0lvSmN2NERGekVEaGZnWmdBRVRMZ1loTEZiN0lubllB?=
 =?utf-8?B?ZkE3RVBTRlpDb0M0dGxiOVVaRnVqdGpDWFpXZEVSdUVGM2w0aDdKS3hJNWJH?=
 =?utf-8?B?eG5ncGJSTitHWmxGdm9MczJCMXBvQllyRVlDd25sK3lWMEJ1eTZPUS9mZXJz?=
 =?utf-8?B?c2h0WVV6Q1BpZDZ5Ym1qemxnQ1dZREdnVktleTNSQlhMS3JON3UveCtPYkl0?=
 =?utf-8?B?L2IxejBoRkpBSWNNL1BIVk51L3NhTGk0TzFIRFFyWGdjZHF1M1RESnhaOFhL?=
 =?utf-8?B?NzMrOXZFczRuSkJuVUN5VnhSQVJxbWNKZE9tTlNGUzR3R0pCcWtYZDgzNWV5?=
 =?utf-8?B?THdnOUxJTWlIUDNoOVlvZ1J6YmlZYlNuYXlvOTVmUTg0OE1HZFZqSHpDY2pp?=
 =?utf-8?B?TzlGYjZ3L3Z6TWh5WHZLK2o5UGttSjlzcjZWMnUxQ2RweXgrVjQ5ZDBOdm9w?=
 =?utf-8?B?bHJ6VVdFZUZGbmZPVVZGbFhPdXNOY2V0UHdXeHRUS2RDR0RkYVNKMkt4clZF?=
 =?utf-8?B?bmFMc2tLUG1BZWZuSVRkU3BDZC9wYkExNitnai9VYkREQS9FUVZRbHBIRjhl?=
 =?utf-8?B?cHBuTSt1M3VGNGxtemZpTGhuWGU4cUUreHhUemNwSStBSTkrdkxqUlRldGw1?=
 =?utf-8?B?ZmgwNTI4OHF3eTJpVDBjL21JMEkwWVdQVmdiOFlnSVpVZElEaXhRcWE2aG9C?=
 =?utf-8?B?NnIyeVJUcERwTGNnYVg1L1RyeUIreUtCb3Y5dFBBYnphUG9xQ3VVSE5RT1FC?=
 =?utf-8?B?d3BKN0duUWZENjlrWENUeVhRZ2Yrc3hqN2dIeWEzTWFNNnBSNys3UCswT1NZ?=
 =?utf-8?B?akk3cHVFWHZOMFUwRHhBMjdaZ1M0VmJIWHVjdUNKY05wUmZlNzN2TmJSZUlE?=
 =?utf-8?B?ZlAzWU54VTMwTUo0RjJoeVAzU1RmRy9pbXZFWTBMMnRhM211K0hwTWNXcnpi?=
 =?utf-8?B?RjB5RUgxOTZ5T0lza0pHcUxJRyttZ2l6M0dmSjhJNnRoL1VsY3RsRDVxM1ln?=
 =?utf-8?B?N2U0eC8vVktCUTR5bTFzQXdZRkpnaWpvM3BuYWZKcktHbjRPZnhObXVKTHZN?=
 =?utf-8?B?RXJJMmMzeVJTVXZkVTlRWEx1NWY4RVY3TEFDT1BUeE04TnNzUEdtSy9zYTB2?=
 =?utf-8?B?eHZIdis2L2lUQ3czK0IzRVhsdzB6Vm9vMUY3K1BnYTNvWWZlT1NHT0hCQytU?=
 =?utf-8?B?MkdySk4rZHJXV3lNYWJyeVZhNXRzY0xyS3VscGFEY0xCUkhkNzVjYllRdEpk?=
 =?utf-8?B?NnBsOXFVZUlZVlZObTkyYjNsZHVZQVhKbDVGdU90alBzZjROdko4NDlhYVYx?=
 =?utf-8?B?b0J5RXVFckVod0N0bXZ1VWhGdW9rM1lyMGJ4K1FnaERmVHd2MnZGY1hvVnY4?=
 =?utf-8?B?aENZUk51ZjYyVUpna3Y2VFVqRlczMWVtbEthSVFxdU5xZHRoRVhMY3QxZGNY?=
 =?utf-8?B?cWgrbE0zOHFDQTRNYzF6aG1rdEozNlhzWjFCcmlmeUNveHQ4MDlUelZBUnN4?=
 =?utf-8?B?aEtMSlEzblZlTml2VXA5Tng5d3gzMk9XR01KckJ4VTFiaUVQQUVKM3JDTEQ2?=
 =?utf-8?B?MC9zSFU4cTdYc3NrUWlZYllzcW1UaG5YYUIxTFQzYWdMSUNUV0p1amZoZXpF?=
 =?utf-8?B?UXN1T2tvaW1lU2V3RTdRcHA2MVM3S1JKMWNqRysyTk9scmtVU1BKTUd4UDlH?=
 =?utf-8?B?MUhJcnVWckt1c20xWGRESWZzSDFkYzdGVkEzMStrOXpDSnY2NFRmSm5iQllC?=
 =?utf-8?B?bVdGQUY2c0pnSkROREg1YXhXVDFBczhHS3J2SmYva0VCbjN6bnZ6eURRYVpz?=
 =?utf-8?B?L0I5L0lWL1NNNFRwZTMyc2dieFQybHloOW1qNnJlbWdPcHhzWFFHc1NOYkNo?=
 =?utf-8?B?Z08zZ0l4R1VYbmF5RDVTM1RPWnI4MVQybWp5VlRrbjJzT2xKQU1xeExrUkVs?=
 =?utf-8?Q?PM/xz//00mOh+qd/qiNJ0bc=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d14cb5e-e5de-4142-00c1-08dcedcd0d57
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 10:26:52.9671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1qS6D+oEbmrz1bB3BIPfdhe5IihwiA2mga9wGFSPXcDo2YUc5E3cjQEIDDTHgj1KkF58tCOfT3RcMiI42e2Y5LxG3ntdTvOXXbB245ytnVgEaiVfi5xSELNyOPl8HFSZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR01MB7685
X-Spam-Status: No, score=0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: "Rob Herring \(Arm\)" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Khanh Pham <khpham@amperecomputing.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Open Source Submission <patches@amperecomputing.com>, linux-arm-kernel@lists.infradead.org, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 16/10/2024 12:07, Andrew Jeffery wrote:
> On Tue, 2024-10-15 at 13:39 +0700, Chanh Nguyen wrote:
>>
>> On 15/10/2024 07:44, Andrew Jeffery wrote:
>>> Hi Chanh,
>>>
>>> On Mon, 2024-10-14 at 09:05 -0500, Rob Herring (Arm) wrote:
>>>> On Mon, 14 Oct 2024 10:50:31 +0000, Chanh Nguyen wrote:
>>>>> The Mt. Jefferson BMC is an ASPEED AST2600-based BMC for the Mt. Jefferson
>>>>> hardware reference platform with AmpereOne(TM)M processor.
>>>>>
>>>>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>>>>> ---
>>>>>    arch/arm/boot/dts/aspeed/Makefile             |   1 +
>>>>>    .../aspeed/aspeed-bmc-ampere-mtjefferson.dts  | 646 ++++++++++++++++++
>>>>>    2 files changed, 647 insertions(+)
>>>>>    create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts
>>>>>
>>>>
>>>>
>>>> My bot found new DTB warnings on the .dts files added or changed in this
>>>> series.
>>>>
>>>> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
>>>> are fixed by another series. Ultimately, it is up to the platform
>>>> maintainer whether these warnings are acceptable or not. No need to reply
>>>> unless the platform maintainer has comments.
>>>>
>>>> If you already ran DT checks and didn't see these error(s), then
>>>> make sure dt-schema is up to date:
>>>>
>>>>     pip3 install dtschema --upgrade
>>>>
>>>>
>>>> New warnings running 'make CHECK_DTBS=y aspeed/aspeed-bmc-ampere-mtjefferson.dtb' for 20241014105031.1963079-1-chanh@os.amperecomputing.com:
>>>>
>>>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
>>>> 	'ampere,mtjefferson-bmc' is not one of ['delta,ahe50dc-bmc', 'facebook,galaxy100-bmc', 'facebook,wedge100-bmc', 'facebook,wedge40-bmc', 'microsoft,olympus-bmc', 'quanta,q71l-bmc', 'tyan,palmetto-bmc', 'yadro,vesnin-bmc']
>>>> 	'ampere,mtjefferson-bmc' is not one of ['amd,daytonax-bmc', 'amd,ethanolx-bmc', 'ampere,mtjade-bmc', 'aspeed,ast2500-evb', 'asrock,e3c246d4i-bmc', 'asrock,e3c256d4i-bmc', 'asrock,romed8hm3-bmc', 'asrock,spc621d8hm3-bmc', 'asrock,x570d4u-bmc', 'bytedance,g220a-bmc', 'facebook,cmm-bmc', 'facebook,minipack-bmc', 'facebook,tiogapass-bmc', 'facebook,yamp-bmc', 'facebook,yosemitev2-bmc', 'facebook,wedge400-bmc', 'hxt,stardragon4800-rep2-bmc', 'ibm,mihawk-bmc', 'ibm,mowgli-bmc', 'ibm,romulus-bmc', 'ibm,swift-bmc', 'ibm,witherspoon-bmc', 'ingrasys,zaius-bmc', 'inspur,fp5280g2-bmc', 'inspur,nf5280m6-bmc', 'inspur,on5263m5-bmc', 'intel,s2600wf-bmc', 'inventec,lanyang-bmc', 'lenovo,hr630-bmc', 'lenovo,hr855xg2-bmc', 'portwell,neptune-bmc', 'qcom,centriq2400-rep-bmc', 'supermicro,x11spi-bmc', 'tyan,s7106-bmc', 'tyan,s8036-bmc', 'yadro,nicole-bmc', 'yadro,vegman-n110-bmc', 'yadro,vegman-rx20-bmc', 'yadro,vegman-sx20-bmc']
>>>> 	'ampere,mtjefferson-bmc' is not one of ['ampere,mtmitchell-bmc', 'aspeed,ast2600-evb', 'aspeed,ast2600-evb-a1', 'asus,x4tf-bmc', 'facebook,bletchley-bmc', 'facebook,catalina-bmc', 'facebook,cloudripper-bmc', 'facebook,elbert-bmc', 'facebook,fuji-bmc', 'facebook,greatlakes-bmc', 'facebook,harma-bmc', 'facebook,minerva-cmc', 'facebook,yosemite4-bmc', 'ibm,blueridge-bmc', 'ibm,everest-bmc', 'ibm,fuji-bmc', 'ibm,rainier-bmc', 'ibm,system1-bmc', 'ibm,tacoma-bmc', 'inventec,starscream-bmc', 'inventec,transformer-bmc', 'jabil,rbp-bmc', 'qcom,dc-scm-v1-bmc', 'quanta,s6q-bmc', 'ufispace,ncplite-bmc']
>>>> 	'aspeed,ast2400' was expected
>>>> 	'aspeed,ast2500' was expected
>>>> 	from schema $id: http://devicetree.org/schemas/arm/aspeed/aspeed.yaml#
>>>>
>>>
>>> This needs to be fixed as pointed out by Krzysztof.
>>>
>>
>> Thank Andrew, I'll update that in patch v2
>>
>>> *snip*
>>>
>>>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/apb/bus@1e78a000/i2c@180/i2c-mux@70/i2c@0/psu@58: failed to match any schema with compatible: ['pmbus']
>>>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/apb/bus@1e78a000/i2c@180/i2c-mux@70/i2c@0/psu@59: failed to match any schema with compatible: ['pmbus']
>>>
>>> These two should also be fixed. The compatible must describe the
>>> physical device, not the communication/application protocol. It may be
>>> necessary to add a binding if there's not one already for the device.
>>>
>>
>> Hi Andrew, My device is following the pmbus specification. So I'm using
>> the generic pmbus driver
>> (https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/hwmon/pmbus/pmbus.c#n237)
>> to probe my device.
>>
> 
> The devicetree doesn't describe drivers though, it describes devices.
> The compatible string needs to represent the device.
> 
>>   In arch/arm/boot/dts/aspeed/ directory, many boards
>> are also using this compatible to probe our devices.
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dts#n219
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dts#n263
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dts#n260
>>
>> Andrew, Recently I saw the ASPEED platform's maintainer accept the
>> "pmbus" compatible with a warning log. You can see in the below list
>> that patches were merged recently.
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=bb3776e564d2190db0ef45609e66f13c60ce5b48
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=28cfb03afcb20a841e96e821ba20870a7c437034
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=36d96827f480e90037d162098061333e279ea35f
>>
> 
> Unfortunately for your argument, I'm not trying to make the case that
> some people are allowed to do this and others (such as yourself) are
> not.
> 
> Rather, this is the review process in action, where hopefully everyone,
> including myself, tries to improve their practices with feedback.
> 

Thank Andrew for your feedback!

> You can also find discussions where other maintainers (Guenter, hwmon
> maintainer; Krzysztof, devicetree maintainer) have asked that "pmbus"
> not be used as a compatible:
> 
> https://lore.kernel.org/all/f76798ea-6edd-4888-8057-c09aaed88f25@roeck-us.net/
> 

Hi Andrew,
I checked the discussion at 
https://lore.kernel.org/all/f76798ea-6edd-4888-8057-c09aaed88f25@roeck-us.net/ 
. It seems the maintainers don't want to use the "pmbus" compatible for 
specific devices. The maintaners require an explicitly compatible from 
device list in drivers/hwmon/pmbus/pmbus.c . Please correct me if I'm 
wrong anything!

This is device list from drivers/hwmon/pmbus/pmbus.c

	{"adp4000", (kernel_ulong_t)&pmbus_info_one},
	{"bmr310", (kernel_ulong_t)&pmbus_info_one_status},
	{"bmr453", (kernel_ulong_t)&pmbus_info_one},
	{"bmr454", (kernel_ulong_t)&pmbus_info_one},
	{"bmr456", (kernel_ulong_t)&pmbus_info_one},
	{"bmr457", (kernel_ulong_t)&pmbus_info_one},
	{"bmr458", (kernel_ulong_t)&pmbus_info_one_status},
	{"bmr480", (kernel_ulong_t)&pmbus_info_one_status},
	{"bmr490", (kernel_ulong_t)&pmbus_info_one_status},
	{"bmr491", (kernel_ulong_t)&pmbus_info_one_status},
	{"bmr492", (kernel_ulong_t)&pmbus_info_one},
	{"dps460", (kernel_ulong_t)&pmbus_info_one_skip},
	{"dps650ab", (kernel_ulong_t)&pmbus_info_one_skip},
	{"dps800", (kernel_ulong_t)&pmbus_info_one_skip},
	{"max20796", (kernel_ulong_t)&pmbus_info_one},
	{"mdt040", (kernel_ulong_t)&pmbus_info_one},
	{"ncp4200", (kernel_ulong_t)&pmbus_info_one},
	{"ncp4208", (kernel_ulong_t)&pmbus_info_one},
	{"pdt003", (kernel_ulong_t)&pmbus_info_one},
	{"pdt006", (kernel_ulong_t)&pmbus_info_one},
	{"pdt012", (kernel_ulong_t)&pmbus_info_one},
	{"pmbus", (kernel_ulong_t)&pmbus_info_zero},
	{"sgd009", (kernel_ulong_t)&pmbus_info_one_skip},
	{"tps40400", (kernel_ulong_t)&pmbus_info_one},
	{"tps544b20", (kernel_ulong_t)&pmbus_info_one},
	{"tps544b25", (kernel_ulong_t)&pmbus_info_one},
	{"tps544c20", (kernel_ulong_t)&pmbus_info_one},
	{"tps544c25", (kernel_ulong_t)&pmbus_info_one},
	{"udt020", (kernel_ulong_t)&pmbus_info_one},


My device is similar with the "pmbus" compatible about the 
"pmbus_info_zero" attribute. So I chose the "pmbus" compatible string 
for my device. If the maintainers require an explicitly compatible from 
device list in drivers/hwmon/pmbus/pmbus.c but not "pmbus", then I must 
add my device compatible string to the list in 
drivers/hwmon/pmbus/pmbus.c . Please help me confirm my understanding.

Thanks,
Chanh


> The tools are asking you to do something different via the warnings,
> and so am I :) Please define the compatible according to the device
> used in the design.
> 
> Thanks,
> 
> Andrew

