Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 859BB9A3AF2
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2024 12:09:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVL5m1hm1z3cSY
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2024 21:09:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729246152;
	cv=pass; b=TEZvd/ejtjNXJAEeCLFERAVIvo23WvhMagrtL5bzGwryTetJXvCsF0/21Nio9LGKg4F7sg/nl1rDEh9s7jgioJc6Fj0KDlevcyw4F1QLTgt44zEPJx1m0D+upr5N9G/y/bcXNot67yV74ItUL2HWcVq4r2WPsQwkH2AupmC2DAuhExosIV/J2zc8w0eHFa2uggO6Bjng3oPaEznA8oInif4xidA9U564m3wkQ8JcsM3AGHdmo/FKHqucEPtfVldBvrpb1HDXM3Twgx/8RNsFnZGlDekExnwZ+AnWdKVR0T+rVEC09i3EyyhM7d5eDA0TpC4phzLKEH1a+xdPYut0oA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729246152; c=relaxed/relaxed;
	bh=BNVHi8OvXlHaA04UfLAlVPyhQH+ZPxiJfMepH7su6QA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hMHuCCGhOxxQpZno5lKfOU6fNpiKAgHfz0tzRNxHuIzfdxWaqnM1dmwctfwFKTOHXnEa2qvzq9lJr2EiRwSuPi1PJypL/s5aj9RepgxjRVMrhMgQm0J5XZps4wOobh6NI9dwEnZc8hFgQJjkkTI0rUVSu7qEcoNjXXazCGiAhqUG8iyBITLcQFfNg8eelEPrVcZlW1BWpA96K3xda19V9Pq1sus57fhVW1E82jZnSTbra15GLEGsJYTZLJLfZ+c7EIwpKy5JC0FrBCCwbLImcAVRJpdr3pVAswhtTwcBla5tzsH9wBgYLALATSku37s4yT0ZrqhuN6RwPI35nMcvDA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com; dkim=fail header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=rcqon3Vs reason="key not found in DNS"; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org) smtp.mailfrom=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=rcqon3Vs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVL5f2b5Dz3bmH;
	Fri, 18 Oct 2024 21:09:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rDeuTmi8fF7h780e+bPkJFTAqRPzMOkwnX/cpm7ai7j9tb4Ix7EkDvGY6zQ0A/72dHS8alewATFdAS3I5yEKxElOPlhKqMmk7iCNKCDf618DONHEvbha7gPR8OdS5kCL9er4/hKH80/OEbbyJWPvOIifH4Q7vFrQ8RXc2IYBhlOXGjaUn45CPwvYZ3KaWpvh1nxz1YlmhUOoMLw+dhLJMfvkpRa3rpno5JWRggR4aymLit27X8EHkoCD0h//hr7hOQHJ0kS057Zzshl2UVsx3Ysu65P3bqWY5u3r7eF1pGFdSGySmj2SC11jCqYzrdGlW4XFjsItJjYb5P0PAvcBFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNVHi8OvXlHaA04UfLAlVPyhQH+ZPxiJfMepH7su6QA=;
 b=eSD6s1jNSUGvxt0UeL1VwXe7dwwhImUTkys9r6ZDRwUUl+f8n0jEMSdXGrwErNIdeTFEIRJjinuubPzxmoHvwH6I5xtQ1AZTmbDENG561w9u9i5zbV3IcaGUcbRrgkgvIsrQnOVVX9B3jpFZ0EpM8Si4fg+w/Y0VdHCWoncc9TrQtpLkQPjdDZ4eTr4J9zzBXicebvNUw2WJaEwGxvj20ZTmmQooWg3ENAyFbsXwchPifSBq97Vm/D0gfX5XPgpnVD3VLv3cQs7AxN7VnhfLaBT+F0Yxf9Dqit8DFoTt9Xw68MhQ2pcHRh/STYAapZiTbMCW8OLzGFWVkz3UQPOqcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNVHi8OvXlHaA04UfLAlVPyhQH+ZPxiJfMepH7su6QA=;
 b=rcqon3Vsqq7APvS/x0PjVmnGvs7QhTFX/qolspGOAntXejhqGdhBVNWcKFGp4Kq1/CBYlA3n+IxG+xv1LIKwPmpymf7bPh3TgAyfSMbZwskkoN3bdcR8b7FXpWCAOCpHJFK/dxJtcHRZeqW55RCFNJdAYv/g8zVG5GnXIpN9az8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 PH7PR01MB7701.prod.exchangelabs.com (2603:10b6:510:1d4::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.32; Fri, 18 Oct 2024 10:08:39 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7982.033; Fri, 18 Oct 2024
 10:08:39 +0000
Message-ID: <21065884-97c7-4815-9347-f4f03dff8c43@amperemail.onmicrosoft.com>
Date: Fri, 18 Oct 2024 17:08:29 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: aspeed: Add device tree for Ampere's Mt.
 Jefferson BMC
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Chanh Nguyen <chanh@os.amperecomputing.com>
References: <20241014105031.1963079-1-chanh@os.amperecomputing.com>
 <d514fd066353c529052e59c564d1d15f91b6a8b5.camel@codeconstruct.com.au>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <d514fd066353c529052e59c564d1d15f91b6a8b5.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:4:195::17) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|PH7PR01MB7701:EE_
X-MS-Office365-Filtering-Correlation-Id: 46735ecd-8583-4337-0d4f-08dcef5cd608
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?R3BDc0NOeGVuYWkyeXNrc0FxU0l1V2g0L0FsSFJlWXI0RDcvcVJkUEl6VFY1?=
 =?utf-8?B?SnFvOGVGNGJuOVFsNC9YRnhZblVpTmYrWUdOQ21KajYzc3BqODdxQUlrU3lX?=
 =?utf-8?B?Nm13K2phL1J1d1VtUVR0ZXl6eVhQUm1rT3o0dVZVNWxQYjhSWDdwSFVhQ3RY?=
 =?utf-8?B?djlLUHROTzQ0TjJWWktIaENIYzR6TmFvdTdiTU15RVFiRnlNWEw3N3dCY1Ay?=
 =?utf-8?B?OEVzMEdib1pyY0l5ejZ4N2NCTUtKZmZjaHIzWmlKbkpVdlZPRndlNlROdGhJ?=
 =?utf-8?B?QUxLdzUxT0hhSWEvcm5jcXl2cGFoVFdyT0luNmpBOU5Ob0gvcE1tWVlmUGU4?=
 =?utf-8?B?OHBTbndseVRjcUNES3ZqeldZcWpyakVTWGZPN0RhaGs5YVFwdEx2NnFDRVY0?=
 =?utf-8?B?RUI1YkVXSEZYZlFIdjMrQ00rOG5xTGRCVlUzSi9rSUZUVWtib1ZadFd0M0JU?=
 =?utf-8?B?dmhFRXVhZlEzRGJkYjMweTl3L3JBeDZJTkJ0M3VxRG1mejhCVlBFV0x4U0VN?=
 =?utf-8?B?cFVrdlg4amFLcUtNTnk5NDVmWDZDNGdwcm9RMkVxbWpDUHhsSFZ5Z0pzSTZ3?=
 =?utf-8?B?cHZsVkFhem9Rd3lZaXBDZE05ZWJQWGxJcVBrNzl5aFZmakVLL1ZMaFlIWUZ5?=
 =?utf-8?B?WE50ZithTGcwaUQ3UkhVNllieUQwOHZnNUM5bS9YUk40bmdGS3VWUHdoNkRw?=
 =?utf-8?B?R2prb1pFTUV3dHJwaXllWWNmZGRCU2c3NmV0NE94UnY2TVhyYUlQdFFSOTBD?=
 =?utf-8?B?c3ovb0ZDL2lhQ3dzRmZRcTNOK1c4SHFKV3pNaWgxMnloVERsbWFJUjRPZWs2?=
 =?utf-8?B?STY0T3FyUUxybENCYzUzdGZyTWN4MFVlOE1EM2hYNHl4VHpZRzlSR204Tmx5?=
 =?utf-8?B?N2Z1VUhPUVV3T0VBN3RPV0VrYWNCWGZsd1Q1eE16S0VyLzhsUHZmR0Qyc1dH?=
 =?utf-8?B?SXlNbXhqNk9ZcEdUWDcxK0Qyb053bmxFTXQ3YzJ1Nk5mZDFvYjJaWTZ6RG5n?=
 =?utf-8?B?WEZhQlZMeUxRQi95WVJwUmRLMWVSWFRZQUl4dmpIdlFGY3hFdkp1clUreWRF?=
 =?utf-8?B?TWdDdERJQ1dMMjhBcmNaNkt2SVk0K3pvNFQ1K3JBTWpJWTNpTVZJdTAwYWtn?=
 =?utf-8?B?QVg3aE1yakpGZFNSWXdQaFd0QkFDMGlYQ2JtUE45M2dueDk2TjZLWklqTXY3?=
 =?utf-8?B?VlErODg2V2VMSlBPeTBLWnYvOUV4L3VycHAxdVBsQzRGcU9jVnN1RWhhMTBa?=
 =?utf-8?B?ZnN2em5OM245Yks1TmFRTWo4NnF6YXQ4dHU2NU5tenRjSnMwT3JkUEM5N3cw?=
 =?utf-8?B?em15NGtzcWF0aUFISmFFNUludnpuS2pVR2tKczFrN1JIZW9XYmFmYTltbTNX?=
 =?utf-8?B?c3lSYWNINHVyWnBhTk41bTZIenhyaXRqcVJ6T3pKTjVjajlhUjRDZjdPbldF?=
 =?utf-8?B?OGYwY0htYWNJZGZKNnR1aDdRRURuM0R6dGFHb0FkREhKY1Bzb3pta1ZPNkxC?=
 =?utf-8?B?SHNqREs1VFc2NWMzZExtdmRPbmNJeHMzeE8vMm81bGlsM29SQ3VKYTU0dUJG?=
 =?utf-8?B?Z0lSemxDelBJZCtLTHBKSlhRV242YW41TjRCdnVYUHFSY0tGMVB4WDJPNG5r?=
 =?utf-8?B?UmdDMEJNdng2dGZQQS9FUjJGWVZpNFBFeFBSQkp3bm9KNCt5K0FhRVc3MUV1?=
 =?utf-8?B?OFFCSTdjRnA1VkExVUJod0d1cDI2cXRwcjVjY0RaV2RCejhCTnk0bVBXRXdp?=
 =?utf-8?Q?spdH5gpr+UhvKfeKsPyUIkhHDjLmvRIQzPXUQWe?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?S1NkWk16aFVXdzdqK3EyakR0YnBHN1lPbUpSLzZBRFlwMFFYRlFpVzZmMVBO?=
 =?utf-8?B?N200VHdpWklOaTdFcWR1eVhhL2lDci9WajY4L0p5TkFjdkFteHBOaG9uVmpu?=
 =?utf-8?B?aFNIUXYrWW1BYTJWRFlSMW5wdmxhS0NQSVZlV1BVb0JSNWVpTDNCZys0S3h4?=
 =?utf-8?B?YWkyQTNxbjgxNFV2S25iR2RUNGJEYlNHNTBtSGNHdmZCcnVFbnVRdk0zODFL?=
 =?utf-8?B?N1BnS0hFbnByUUpsNEZjRjM1UHJSODJENmVUWUxHMXBsUU5FMTEvZ0FkTkRm?=
 =?utf-8?B?NGlSdGVTSjI4K0djSkUxUVFBOEYzNWdwSGNjK0RDZ1NIV3A3VkdHbXdXeFQ2?=
 =?utf-8?B?SmhPSng0eTlkV1Vxc2NrRVphSk5iWmtlbkRYc21pZkhvZGd6OVFjWExyMy9t?=
 =?utf-8?B?SklzbXlraXk5NXArNUJYSmlwZW5LSjk2Z2UrVmFBbHozVitIcFVpZGV6WmJj?=
 =?utf-8?B?OGpMRmNlRlZudUc2R2dqckJIVFFpZjJ0a3BZRVhEL3JNUFEvaEY0Q3YrRisr?=
 =?utf-8?B?OU5HUWF6b2RhdDlPY25hbjlyS2s2VVhzWFA1RFpQWHlPVDB5VXFWNXNTU2R0?=
 =?utf-8?B?WGZOd0lody9rRm5DZUxJSFBVREZEYWhHSGNCVllGMzdrWGVzaWc2VDlmR1Nk?=
 =?utf-8?B?RXlUSDVSWlZEZmxqc0NPaG5jYWJzQ0w1YUFHK2QwS3RveXhzcG52UTFiampF?=
 =?utf-8?B?dU1qUFFjRkZXbHB3SFBjUytHa2JRQWlPQU81MjFWTHZqRjVmNitBZlVpV3lO?=
 =?utf-8?B?S0JGWmdWblMvaUpwdnpCekhDa01zOXFtalFLVzB1VWZRd1QxeitCVml1S1ky?=
 =?utf-8?B?V1F2V2dYVVhwVU8xTXlMUXBqS0ExQ2Z5TVdZeUc4bjBTeWxFTzUxUDBBT0VR?=
 =?utf-8?B?RUlqSTE3MW8ySHpYNGhibWlaVEZocWNpanJxRVdKblc2Vld6ZDRwS0dzSkMr?=
 =?utf-8?B?MGV0aFpEV0pnbXBpbUVTa1I3Y0lzbXNaRlk1aGxuWTlwSythRHlUcHUvYll6?=
 =?utf-8?B?NG9WYXdOM0gxNE5JdzlPQitWZzRMd0hOWms4TTV0RmlEbjRlYmFUZnpFTUQv?=
 =?utf-8?B?UXlNUVJEaU1DVzNIVTB3MHZWelpNT09Yb2dpelZYNEhCa0xsc28wUld6SjhO?=
 =?utf-8?B?MXV6Q3lwTXZMeUN5U0FWcnJjMTVaajRCVmp4Mmw2TnM1YkttNm90S2luSlpW?=
 =?utf-8?B?Rkp0ZW85dUw1bC8rQ2Y3akFNQlhxUEUydllmNnlFVlUvMnMwbmd3SUM3cTBS?=
 =?utf-8?B?dVhlQVZsYUpzSzVyNWFSZ2hVR0E4cHVScWh0UUloY3RDOXdaNlZOTVZNR3ZC?=
 =?utf-8?B?Q0NNT2V6VzFXUmhJZGVRSGtrcWNSVkRLUjlaak5jcENQQlNVNFVEUGhabmtH?=
 =?utf-8?B?aVQxZGlDTnUzL1RwdnpHQkZ0SkVSZXhVRGJWMVAyYTlEMU1vaGFnRW5IWFZZ?=
 =?utf-8?B?UGhKeUxHMUl4WXcxZUgvcmdkUml0RHpydzRFZnR4TkRkRVpXdnpnT2JoNWVF?=
 =?utf-8?B?Y3FDdFgreWwrazNobUZwTGQzYzFVVjZ2S1J3VVh0T0ZORUovTkkwM3llby8r?=
 =?utf-8?B?ejZmVlFtdnlNc3FwTUpOUmxPcnFBcnM4VkNwMERtQXZTRUhySW16YklQVnZZ?=
 =?utf-8?B?UjJNVVI1c3JtRGlxQkJic0VQWDNMbVg4bDJ3bmF0SGZqSStORk5kQS9iaHhq?=
 =?utf-8?B?YlE5a0dwSWVXeTgwekRzWThockZXc3dtdDVjZmlnUG95RkxidWppYTcyaVRR?=
 =?utf-8?B?RS9QYU5kRWVKdUw5NTIyWVJIc1R5ZzlyNXBGUjM4aE02VWU2cnVPaWZKRlVU?=
 =?utf-8?B?VEdxNTNZZ2NqRW5hTWpGcysyTmJybmQ5eks4blBPbURkM0pWdnI1cHQ3NjFS?=
 =?utf-8?B?R01maDRYUldmL3JnWHRIU1h0Z3JFbmhKMkEwWkpwRmlGQkRUcGpjMURSRkJW?=
 =?utf-8?B?QlNUMk51RUxSZ2FnVmhETlpRWGp1OWM5N0tnYXRBUlB3U0MvOWdsZFhjaVlp?=
 =?utf-8?B?bWJnVTlablphYkRjekE0UHViUXM3UitDYUJsWWxEVXRIelNiYzgxUjNZWWUw?=
 =?utf-8?B?TFpYUmRlOERmL1EyRzhFZzJMU2lRYWpobHBvbitWOFBnR2k3VnpuSDZ0UHZB?=
 =?utf-8?B?UHV3dk9EVUpJQkh2ZWdmQ05WZ3hyS2xwcVk0eWQ5YWlXVTRBVXdxSGxSdmsr?=
 =?utf-8?Q?kCozcejIkb9vJTuypQAlqrY=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46735ecd-8583-4337-0d4f-08dcef5cd608
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 10:08:39.1152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q4ceK1bwU6e4ExhzOysIVlB6WxEwX65MCTydBdfng9zq7LN10N+FuakDkBL48a35HraJheSJn7U7uiDr8aXLDVKB5DzcXj8HRJPdF9at3dBBybU/ISsysV6GQIrj9yPL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR01MB7701
X-Spam-Status: No, score=0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Khanh Pham <khpham@amperecomputing.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Open Source Submission <patches@amperecomputing.com>, linux-arm-kernel@lists.infradead.org, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 18/10/2024 11:34, Andrew Jeffery wrote:
> Hi Chanh,
> 
> On Mon, 2024-10-14 at 10:50 +0000, Chanh Nguyen wrote:
>>
>> +&mac3 {
>> +	status = "okay";
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_rmii4_default>;
>> +	clock-names = "MACCLK", "RCLK";
> 
> Should this be overriding `clocks` also? There's only one clock
> specified in the dtsi.
> 

Thank Andrew,
I think it is redundant config. I don't need to override the `clock` and 
`clock-names` here. The mac3 will use the clock specified in the dtsi.
I'll remove `clock-names` in the patch v2

Summary, I need to update as the below list.
1. Add Mt. Jefferson board compatible binding as Krzysztof pointed.
2. Remove the PSU node with "pmbus" compatible.
3. Remove `clock-names' property in mac3 node

Regards,
Chanh

> Andrew
> 
>> +	use-ncsi;
>> +};

