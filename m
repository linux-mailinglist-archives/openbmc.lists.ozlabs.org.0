Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8C3A69533
	for <lists+openbmc@lfdr.de>; Wed, 19 Mar 2025 17:42:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHvcw4H85z3c8G
	for <lists+openbmc@lfdr.de>; Thu, 20 Mar 2025 03:42:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2417::609" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742402524;
	cv=pass; b=NDUx2sX7U8rbSgFRZ5Lbg211q2jJ9LoKiyWNNbMm2L0SUKDx7+o0Z/vTe25fS9AVJbG/CTM+8hwkhamTjfJqQJ6p1usY6I3gkMvRVFGqgtjxvI8eS3/JIcH8krUTohUWLEL4ZZKq32VcDAcE+XyUevWZhz5hvmEjhBE0sjWz6xq5kHKPm4Tq8sU/D40BzAEzsiwnFTfcuVWsyItECPetvnuQpojJF6GUVrQeeuFJw74FnBx5PEI/NNAnvu6GP0jO4gLMRNuHoZijlH1F5C7vEdS/fQ1ErCzKjtMSf30vMKc10RwKUxZlYhKOkXkB+t2LEbqkT34XeuPcncAlYHflGA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742402524; c=relaxed/relaxed;
	bh=cWQwz0AXkIyIUn2ezOvuaMMfacGPMiIzuEhHRVpEJwY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=o1JNrKDEaXZUSbPmNDPPhKLrxZPz8h7GMBOnEaJzZwa1gtHIXyCq09NMqpmSn0ek9BdNb/qquqLI03P4aIzJuIkxMl7VIRXdxvachx7nd/pfimsIwJzJhq3GFxMOEgJmWMrLolt1Oc0ZMs+CI5QrNRyevzeYLpQ70jLWAdsIy39cksk4wj4AMN+gIV5EC9ZlLAZLIOIknce8s0I7w1mJKSZFmbq9c4Gcf46qmA21hPw/Cve7Ue6zA3SszoFYDHTHFL6EQ7DPLtLmz4a0fVBEfrIZtSTF0UZ2zqXNHLwLzCvbW/f5T2MRLwXUOPLhYUatGzr3BHYbTPOrnD2Yg2KxOA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=NEqGH+nF; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2417::609; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=rajaganesh.rathinasabapathi@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=NEqGH+nF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2417::609; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=rajaganesh.rathinasabapathi@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20609.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::609])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHvcp046Cz2yf9;
	Thu, 20 Mar 2025 03:42:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OOml4Yl9jTY0d26Qu8GuscXYAwdPooK1SMPmHHKMQeTkaJ3iYYACpj2hG3xAKuRDiYVL+sjgwcI6iWx+v/H5QUeeRztDzq3bvmvIw60k35ugBwRit3DpJfMmTtDI6tpcAXW2S/gWWJ57e16FtBBYlaxhIrVV9W+ILAhjyAjlX0C3vvb52qlTb3iqLDh1BDu5e2/I2QhdBgbdcO9H1z5a90BfleVNi8zvNhlG6v5Z18bFa4395eF6aN9bLgJH47MGDy++rAXvMqJW+kFNzPTB0PgYAzoE9shF0pJsCcPJAjks7DKxjvHHKZQzerAko6teM5nvO6HLsrp+yUiGM+/pIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWQwz0AXkIyIUn2ezOvuaMMfacGPMiIzuEhHRVpEJwY=;
 b=xiFjV45DARQt38RQPgC/ausbTWa/0gidn/D4deRUFFORsBriMfsEpEtOJ/9SgfpfGmXgOlwDodzM02nWzLkkv4BDX6s4dDLVodRlgcIzWj0LoTlXxr5Pq80tOBEIQgrxazsm91kuVrDb9SYcUPgov2EdupmdsUiPus+GM1ZSwdfCxTiNWtnPiBSxAS+u5iew0I/z0RUGt+WgeIYCsC0N0oYHCC+tanaIpX/i7iTxJZzHdhEZwfiN2pBrtEdUyrejKCktS5zLPC1hts7yMoKHD6EOeJOiucPHD7KlpGKmG75QPRUPv0l0v+aK1V8DbzYgdJ7ztUxTrc6dhDsvfihWMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWQwz0AXkIyIUn2ezOvuaMMfacGPMiIzuEhHRVpEJwY=;
 b=NEqGH+nFtzy8T6QnARV1pAVX4rMHV13CTr+LbIttOJQqqSAvxwYB0D7HqTPvimBxpTcVq1d1Ozz2Ljp0uZehaWONJxsP46GI5Pc+ueek+gymKWsWvb+kbYdFawn+quEWLLpQjEwfiRFhpWySJ76+67PpENh5b+DAMtClRYKkuf8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6285.namprd12.prod.outlook.com (2603:10b6:8:96::8) by
 DS0PR12MB7745.namprd12.prod.outlook.com (2603:10b6:8:13c::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.34; Wed, 19 Mar 2025 16:41:38 +0000
Received: from DS7PR12MB6285.namprd12.prod.outlook.com
 ([fe80::6acf:b37d:a152:409e]) by DS7PR12MB6285.namprd12.prod.outlook.com
 ([fe80::6acf:b37d:a152:409e%3]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 16:41:38 +0000
Message-ID: <8c7be61d-d5e4-4f7f-a995-06cf856a84ae@amd.com>
Date: Wed, 19 Mar 2025 22:11:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] ARM: dts: aspeed: Add Initial device tree for AMD
 Onyx Platform
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Rajaganesh Rathinasabapathi <Rajaganesh.Rathinasabapathi@amd.com>,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, joel@jms.id.au,
 andrew@codeconstruct.com.au
References: <20250318174730.1921983-1-Rajaganesh.Rathinasabapathi@amd.com>
 <20250318174730.1921983-2-Rajaganesh.Rathinasabapathi@amd.com>
 <af75c352-0010-4c58-b8bc-ac0d02337d1a@kernel.org>
Content-Language: en-US
From: Rajaganesh Rathinasabapathi <rrathina@amd.com>
In-Reply-To: <af75c352-0010-4c58-b8bc-ac0d02337d1a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To DS7PR12MB6285.namprd12.prod.outlook.com (2603:10b6:8:96::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6285:EE_|DS0PR12MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b658751-5017-4677-4990-08dd6704eb4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?YUZRVEMrWTFrbzVSS0ZYVnFodDJPUGUyWmp5Q2c4dDhsM1VCOUF6U0U2RU95?=
 =?utf-8?B?a0NGM2tBTDRMQkVieTRVaVpNbExhWXJsQTkrK29yOXM1azN1ZFBqaG5adWtm?=
 =?utf-8?B?VThGOFlrTU9TT0dGYkZYQm52WjRtRU04YnFGZDFIK25sT05IclN1SW5sait4?=
 =?utf-8?B?TmFXT0U5ZzhVc1BlZ0pKcUY3RnlvdlNVOGxSRGV0MFpYRzZhWkhYNzBSM3Fk?=
 =?utf-8?B?SUFjU0ZNODBqNVBBZHphZkpHYlhDWWo3RXFMdlBRTmNxN1NKQkc3ZCtrU1Rw?=
 =?utf-8?B?QUsvVzl5cSsvWVM2VHFOUUdrN1BIcm9nekRKM3RUemF6U2tNZ2UvaWp4MEpZ?=
 =?utf-8?B?WnVCaHJwY2tRNzk1clhpRjdQWGlod1poNVJIUkVxZSsrQ0ZmMHhBQnhWOGpE?=
 =?utf-8?B?Y0tMSnBkS2ZscjY4b2tZWXZmSFJWN2JkTTRtdFhqVHJkY0VINVp3YnRaKy94?=
 =?utf-8?B?cDlZRmFtK1U5aTBxaFlRRExOQ3lDbkRHeEhiYjluNGFIMFJscWxJa3dzQXFM?=
 =?utf-8?B?dWRPbjFmRU1aWjA4RHRBNWdhUlhWM0EvdUJISlArWmlBWGphZnQrV3pOSFp2?=
 =?utf-8?B?aGJzL21SYmlaeU90ZVg5dlRqZnZPczNPZXpBQWdrL2dEQnh0TG1WSDZGbnQ0?=
 =?utf-8?B?Y2RyMDExT3E3R2VTUkI0R1pHc2J0OEpCa2NjTzRYYnBDK1UzcC9nRzNYUHRx?=
 =?utf-8?B?UFdYUldzNWtORTlnVTAxUkpxRjJYa0M2RkFzTUx3d3lhWWJpb1dnSmcwa0xs?=
 =?utf-8?B?TkpkMWNJcC9sMVhtU0dabTF6NUpDVEZTQ29mMG54YkRYTWt5alQyLzk5bWVu?=
 =?utf-8?B?ekJlbGNJeG93RzY5SlpxMXVSTlFhclg0YkdNWXZ6ak03QWREVmNEVUovelh2?=
 =?utf-8?B?UTc3b204ZUx5TW9kR2pONWNZVENYV1ZYQ0x0cGJnaUY2N0R1bkkxUFVCRnAv?=
 =?utf-8?B?WU9uNFU2K1lrQWJadDVwQ3RXZnRZRjJxYllXSmhOeUl2T1Bnbno3OEdnUUlF?=
 =?utf-8?B?eFdGclJmN0ovemtrZkQvZzM0dWtSTmw5YVJuaTFwMDRFckhROG41ZTJxSzNR?=
 =?utf-8?B?R09zbmtlWHIxS2pIT0xobGFYd2VSMHY3RHhFMGEvcGk1ZnlxeWRKVTJuaDMy?=
 =?utf-8?B?SkxET2dJUEQrdis4b3NkWkRuQmo0T3dFMzZ2OGk0VWpWajZGUFR2MzNOUVl6?=
 =?utf-8?B?OFJaREp4aWxsWUxsaWhsZ1hiUE43WXBSUTlmV2FQaGhHRDcyYTdMNlAwdGQ1?=
 =?utf-8?B?am1jQ25ZcTFidldhd0Q5S05BSjczNGY4SEE4OW8xOHlLWkhzVGNNRFkyUEJZ?=
 =?utf-8?B?Qlp0bXRQaTdkNEd3aW4xMWFVL1NBcnpRbHhxYlE5ZFpxOUZycUVoSyswWHdL?=
 =?utf-8?B?OG5UdlhrbGRyTGs4RS8rcmkxUkxyZXlBZGVscGJEbTNvVExhMFB5NVpiWW5P?=
 =?utf-8?B?TXM2blVxYmRDZi95Y2VTQXkrc1B1K2RFNjNySWFMK3hoSWNWNjFZbk5MWTla?=
 =?utf-8?B?SWh0TmZldU5yb21WU3QzQlhyQ2FUeE5UVGEraUtrTzR1WXVwVXJ0Z1NxV085?=
 =?utf-8?B?TEM5WjA0WEh2MHRYY3p1Q1IvU2xQMjdXZGxxTWNvL3RQemJ3T0tSZ0VraVB1?=
 =?utf-8?B?UHJxdndHVkxSdlptWXVwd1JQRE00cEc4QlQxbDBhVFlUY015L3VEWGJPN2dX?=
 =?utf-8?B?UlJOaFpkUFVvNGRXSWJEUERqbzVqT1B1bmJVbGhGU1dsMTdRR05xalJvajFl?=
 =?utf-8?B?THBSMm4xdUgwSms2aWJqUCtoY2FwOFZqeW14V1dLYjFNYmxlYXBXazE5Q3FO?=
 =?utf-8?B?ME5Lc1JraW1McU5ZbWZ2a0xwNDZQdHprSU1KSHFHNVBTWlY4NlVhN2FON3Iz?=
 =?utf-8?Q?d7Cw/9ABuLRke?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6285.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?MkxtQ0dCdS9zbHRzOWZIWGVPbkVndUFLbWtGVW5pMVNxbkh5S3EzNFBuL0ov?=
 =?utf-8?B?OW1lSUNqNnVRVzF6Q3cvbUg3T0Uzd3g5NDZjVXRPRlVDRkYyNlBwdHZIUmZH?=
 =?utf-8?B?Rmh6U3Q0VFFCNGdweWZ0SWs1bkgwSGJvd0FMNWNGN0VQNkJIY1pXSFBUZGls?=
 =?utf-8?B?Y0V6cVc5MHUvYTRGK3Jmd0ZLMUV3S1NmcS9YQStUQkFuMVNmVjIxc1dpRVlp?=
 =?utf-8?B?ZEhJYlhIMEwzRVU5RlVnN2gyTUh0TzRpY3o4aTBJR0l4dDM1Rlg2TUI4LzZ2?=
 =?utf-8?B?L3JqS3BjVENHRk4xeVl1NmsvWnlQN3ZxOUsvMTlIK1NQVlZveER6d3ZDQTE5?=
 =?utf-8?B?a3p5N1QwRXdueHdDb1N5d0lraUNBTldLTzBBeVBLNHRuOXJ5Ym9nT25XWFdi?=
 =?utf-8?B?TDJvOVJYUFVWUzdXQUF3WVgvNVlUc2pSQWdubDgvUnI1ZmNJZzNCOGJVcUhC?=
 =?utf-8?B?Nkc5R2NzY0piemF0WllTT1lhb3BueURxY2thSTU1Z01kazdVMElEa0YySkwy?=
 =?utf-8?B?T3JhNjdyb2ttTW44bngxeE1JT1lxUXZMczlSSHBDanU2YWx1b1Q2NU9wSndh?=
 =?utf-8?B?ZmxxZlJxcXVZenBjK0JkOUFseFo1YUJpd3RrZ2Q1QXo0K2ZJL1dDRDhHeVFJ?=
 =?utf-8?B?ZEwrcTF1VnRUYVpscmtGejVjYmZZQlovUXlXZEtubXdKdWd6Z1F2c1dlb0NJ?=
 =?utf-8?B?aDRXb2h1M016S0o4Q0ErYXI5YXdZZnljeHRzaU5HWStWRis5ckNIeTlmM3d6?=
 =?utf-8?B?ZS9yMWZQRTMrQThRZFpnZFlVUHNqYmhyVkh4bCtodkFhT1EwcmhtR0g4cnZi?=
 =?utf-8?B?SmdvNnhZd3RsOU1UM2FpMW1BTVRXcDQ2eWJONDIrc1ZwcUZjVFJocmRsWGhX?=
 =?utf-8?B?YmYyVm9Gd2UzN2JmSmVydlBCalZsVVBSMVQ2WkQzalNQajdOcnU2QWNCMVR0?=
 =?utf-8?B?c3Q0WFIvUHI5SGk2bUNQdFRvQTdDdWlqN3RETHYzYkh1ODB0VVFEZnVVcjVu?=
 =?utf-8?B?RTNPUWkzZVN5SHdsUmYzaUJicTMzRTVWNmQxSTZ0dGV3SUhPYVlWL2p4WXl1?=
 =?utf-8?B?OEtTVU9kZGJkckMxWHdoK0lCVzIxVENjM09MYytPaXlpVWoyYysyN1Y4NDNQ?=
 =?utf-8?B?R2RRZWpOQmR6czF5YWNnL1hoWXhXOE9UVzh1cVRPc2JXaTFRNnI5SEd6TTUv?=
 =?utf-8?B?ZzcyajM1a0kzMXkrM0xEME5NL2g3ZThVS1dSY1F3S0xza3B4c0JNQnJ0K2FM?=
 =?utf-8?B?TzhEV2tnQ091NVRHeENMdjZrbkRibzVhVU9Wd3QweEhZZW9RZTI5TzZvU1RD?=
 =?utf-8?B?TGRvTTZ6M1hRR3pVeUF1ZTAvdXBkbnpUMWwvUlM0K3JwZnNxZmQvR2FYc0N1?=
 =?utf-8?B?SkZLSWlyWWgwSVdQTE1mMENNRXRXdjl0Y3hDRG9TQ2RjdW5DdGg5M1lYdmgx?=
 =?utf-8?B?b3hadkZqTVVkZEF2d2dKVnZtNWFPaXo2QXVTQXVTcldzMSs5eU1ScERuQ3BM?=
 =?utf-8?B?b2VvRUI4QXlKcGdVZkwzOCtGWjRxNnpUNTR3NFdKQVlraDlzS1UzQURHemh5?=
 =?utf-8?B?dlc1MFg3NDBveGlsbXBvN1V2a3o3bkNSWCs2YjNtWUk3K2xpaUY1REQwT1N6?=
 =?utf-8?B?cXBLc1VNTmROSnB1ZnU4QUlsSGpkUlVNdUdZL2hoYTlpRjRNcUNvdmliaC96?=
 =?utf-8?B?cnh2MXJ0TXJPQW4wdEhURUNzRzFTMTdidkpPNlRPMXZtSE1nUUZTWHduWGlw?=
 =?utf-8?B?WmZqR3F1RjR4dVhFRXJpemU2YmEvZHd0V0pUMGxDeWQwdzhwSXl6cDFzVTEw?=
 =?utf-8?B?cWNEUHZlSFo3bUJVY05wUElnZGVHY2EvUUpvcFNEWmNyYWxva05ncFFPMEJv?=
 =?utf-8?B?MTRjai9LcC9wM0VhYk5JbXBUSVBQVXZaWFZSeDh1TTdJUU91NnJiQ2kwWW8y?=
 =?utf-8?B?SEg2TjFBQXRXejdMeVprM09UZVBzVWFJM1NSSnZVQUs3WUVpUHgyUmdKbnVr?=
 =?utf-8?B?RlRNZWtsWStZQ1RyWHJZZkpBTkJJM2xIV09JMFhqVytYOXQvVkhhWEVycXMw?=
 =?utf-8?B?clpIelJFNDBaUmNzanBVNWs3OVNoSkQ0a1BSSTFvWlZyZ0lDVGZPcDdxemg2?=
 =?utf-8?Q?1Bf3zpImD/040naGOZT8eWeSS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b658751-5017-4677-4990-08dd6704eb4a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6285.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 16:41:38.4606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uY8jRONfrEWlOxqGkT01lKymzfUwOuFggXdti/lS4ivAQIYrniiOECmZTl2eJLAyBXJDF34ZDyS4Z7LkurdKJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7745
X-Spam-Status: No, score=-1.3 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, jothayot@amd.com, robh+dt@kernel.org, Supreeth Venkatesh <supreeth.venkatesh@amd.com>, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/18/25 23:44, Krzysztof Kozlowski wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On 18/03/2025 18:47, Rajaganesh Rathinasabapathi wrote:
>> Add initial device tree and makefile updates for
>> AMD Onyx platform.
>>
>> AMD Onyx platform is an AMD customer reference board with an Aspeed
>> ast2600 BMC manufactured by AMD.
>> It describes I2C devices, UARTs, MAC, FMC, etc.
>> present on AMD Onyx platform.
>>
>> Signed-off-by: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
>> Signed-off-by: Rajaganesh Rathinasabapathi <Rajaganesh.Rathinasabapathi@amd.com>
>> ---
>> Changes since v1:
>> * Incorporate review comments
> 
> Which ones? I do not see my comments addressed and if you do not list
> them, I treat it as a clear sign you do not care.
> 

Understood, will list them in next patch submission.
>> * Update commit message
>> * Remove vmalloc and earlyprintk
>>
>> Changes since v2:
>> * Address review comments
> 
> Which ones? This has to be specific
> 
Got it, will add details and fix in next patch.

>> * Fix checkpatch warnings
>> * Remove bootargs
>>
>> Changes since v3:
>> * Fix stdout-path
>> * Change commit summary
>> ---
>>  arch/arm/boot/dts/aspeed/Makefile             |   1 +
>>  .../boot/dts/aspeed/aspeed-bmc-amd-onyx.dts   | 102 ++++++++++++++++++
>>  2 files changed, 103 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts
>>
>> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
>> index 2e5f4833a073..1e6a130377b8 100644
>> --- a/arch/arm/boot/dts/aspeed/Makefile
>> +++ b/arch/arm/boot/dts/aspeed/Makefile
>> @@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>       aspeed-ast2600-evb.dtb \
>>       aspeed-bmc-amd-daytonax.dtb \
>>       aspeed-bmc-amd-ethanolx.dtb \
>> +     aspeed-bmc-amd-onyx.dtb \
>>       aspeed-bmc-ampere-mtjade.dtb \
>>       aspeed-bmc-ampere-mtjefferson.dtb \
>>       aspeed-bmc-ampere-mtmitchell.dtb \
>> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts
>> new file mode 100644
>> index 000000000000..32509a651183
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts
>> @@ -0,0 +1,102 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +// Copyright (c) 2021 - 2024 AMD Inc.
>> +// Author: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
>> +
>> +/dts-v1/;
>> +
>> +#include "aspeed-g6.dtsi"
>> +#include <dt-bindings/gpio/aspeed-gpio.h>
>> +
>> +/ {
>> +     model = "AMD Onyx BMC";
>> +     compatible = "amd,onyx-bmc", "aspeed,ast2600";
>> +
>> +     aliases {
>> +             serial0 = &uart1;
>> +             serial4 = &uart5;
>> +     };
>> +
>> +     chosen {
>> +             stdout-path = "serial4:115200n8";
>> +     };
>> +
>> +     memory@80000000 {
>> +             device_type = "memory";
>> +             reg = <0x80000000 0x80000000>;
>> +     };
>> +
>> +};
> How did you address comment here from v1 which was responded with "ACK"?
> 
> What else what exactly fixed and what not?
> 
> Best regards,
> Krzysztof

Thanks for the comments.
I will add 'Acked-by' and in next patch submission. 

Thanks,
Raja
