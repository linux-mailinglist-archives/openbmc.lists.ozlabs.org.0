Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 984CD9C34EF
	for <lists+openbmc@lfdr.de>; Sun, 10 Nov 2024 23:03:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XmmsH6sHGz3d9t
	for <lists+openbmc@lfdr.de>; Mon, 11 Nov 2024 09:03:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c112::" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731044896;
	cv=pass; b=cSW2J2txvhggRedrFUTA29ACOZCPugvaw68aPORO9IG3ajUz9Jb+ojRlEIG/D9uGxjEJ1VNxhxXe0s41k4sBX2mamseHfh2WDIT6Odkvs0Ekl+fLsjzi66G1AG949g3A7boQdcgz0mK3pxxvawsyHlW7Lw0X/osrOoWZK1DEMsSvlUaiG8Zla2EZkAX2C11DCtxgjHyCQbCs1telhtyXDZmPoxCS2ESz2j7bzBzGZ/NL3evB5w1bMPYJSiwDTbhQfmtb/FggjpW88u2X4QTHKglyuVc5DeYuqpR/M2HR0Qx+UCB5KLD+BOjlhGwMc/k3/R8UCEEBvzjQigTmx95PSg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731044896; c=relaxed/relaxed;
	bh=0g1risCGKK5h67zjiZTGrXuP7L9A3FHTwE5lntsLpUg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HaOG3Z9yrS4Ysg7U42/Ot9cXknjTnqFG5EjVSOg6QGzf07Ik+omJoM8YC8gItT4ZmCMBGgaGjy3p0CrVcGFOO61eCF+WF9Th9mDoy47qPWvkVQswCTe3fM6rfnOi3m/K6hrxd3G7rR7o+hhKaqWttu4XIG9V6wOOJoyRWsZA/89KMWhnGFy0I4ZBJTwPQyr9Kd9iSYgBlU+PQzhJsiag0kxudCOOhiO0l4s8FibQegmDIQLoTAjjRIw9I8VfaDJwqFYbfgvb9De/UyWijMIm3PE2LrSfH9NRDPJW75corYQUa2/wKB82UR8Ce4rVhB+dJzNUxyFA3O+DW6FeRoRAbQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com; dkim=fail header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=yC+ZuF/I reason="key not found in DNS"; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c112::; helo=cy4pr05cu001.outbound.protection.outlook.com; envelope-from=khangng@os.amperecomputing.com; receiver=lists.ozlabs.org) smtp.mailfrom=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=yC+ZuF/I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:c112::; helo=cy4pr05cu001.outbound.protection.outlook.com; envelope-from=khangng@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from CY4PR05CU001.outbound.protection.outlook.com (mail-westcentralusazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c112::])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xl7Jt5Njqz3bcS
	for <openbmc@lists.ozlabs.org>; Fri,  8 Nov 2024 16:48:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=onXlgV0ZLpyrylkfCJOWHJ1IsN3RzZXjaBQi1csnw7IO2JM1WNJ1CYN3aTl4OgTVzU5ZBfEeEXfYpFuFOXHkQSZ+XGdYEabd9feoV2yq6C/Yz0TSVKNvtO0623zTsLJ6XHI8jfwzCZNHSHt1XFna5Us/R3ZogookrbmVl8nzDMhRkg7T2ODg4ydETE5oiVHdExN2ogFV7q0LPDZVcuZJG9s0jQeCsIXKaXRE0Se0cpv5qD/BnXkA8zzzlsVqkiJDkXVJ0j0p7IMgurySKtlppMh0Z4FG6TvqUXJXQzaOtHwXigYgvms/io4mP5bBHmIryOEvm6kxA1OZFeAP06rbtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0g1risCGKK5h67zjiZTGrXuP7L9A3FHTwE5lntsLpUg=;
 b=cjQf7Low0lUYFqhzwgq5ld9p8qjCLfnr5CRLzADwMjcl6uDr5g8xDE0NN419Smasm0mlQtkTQN3lCHLRC52IRW6IwSjL9pq+2+mcwH9nCEF6tVrhbZhDNJyIz68vOLKxxMDQm5Ew+WqGHmSBvJ8vSTghwyLLHHCqOR2d8OGxPdwyOT/eWOO8spFcgcx3xkJ/bgFygR3ClRnBJfmdz/vVSXZKTfsmAP7MbeR1fNmaGp79l8fAwpdC/xenBqRzy5B6kBlhBU8Clk9Mfs03cQEygHMcJ99XL9+LbqgfIPwuX6xtutVDfUGqNYhXZ8TNl8MWbdqu2uzC/mJ6pGQ9Fjtg4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0g1risCGKK5h67zjiZTGrXuP7L9A3FHTwE5lntsLpUg=;
 b=yC+ZuF/IJj39QITx1MFfietLkesKpVHwZTW75yLwHskbw5fRqVEM9nY2FRkfY7ObbsUm2rNUIUG4PX6ksyLai+CRuCsXj5VrCtoA38uI8e8FaWh/vVAeIRjIzwvzPsJrhjutokxhAXcxyfKTR3YxXGsG/YjxlSyBEg3qnGq7P10=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from SN4PR01MB7520.prod.exchangelabs.com (2603:10b6:806:207::19) by
 BY1PR01MB8801.prod.exchangelabs.com (2603:10b6:a03:5b1::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.18; Fri, 8 Nov 2024 05:47:48 +0000
Received: from SN4PR01MB7520.prod.exchangelabs.com
 ([fe80::3ad8:b11:de24:6087]) by SN4PR01MB7520.prod.exchangelabs.com
 ([fe80::3ad8:b11:de24:6087%4]) with mapi id 15.20.8137.018; Fri, 8 Nov 2024
 05:47:48 +0000
Message-ID: <4c5b08d2-e81e-4492-a1a7-7e1e6445ddc4@amperemail.onmicrosoft.com>
Date: Fri, 8 Nov 2024 12:47:36 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: mctp: Expose transport binding identifier
 via IFLA attribute
To: Jakub Kicinski <kuba@kernel.org>,
 Khang Nguyen <khangng@os.amperecomputing.com>
References: <20241105071915.821871-1-khangng@os.amperecomputing.com>
 <20241107204157.683bca11@kernel.org>
Content-Language: en-US
From: Khang D Nguyen <khangng@amperemail.onmicrosoft.com>
In-Reply-To: <20241107204157.683bca11@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0003.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::16) To SN4PR01MB7520.prod.exchangelabs.com
 (2603:10b6:806:207::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7520:EE_|BY1PR01MB8801:EE_
X-MS-Office365-Filtering-Correlation-Id: 2de706d8-7044-4a05-d6d1-08dcffb8e014
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?YTZvV0I5Yk9zQWlXYWN5bmVwSjFrNTZLSmg0cEsvdm9SRWQzQ2FqejFkVFR1?=
 =?utf-8?B?WFdRTVNHcVpMdkYydzQzZ3BGWnc2Z2szMzZJakNsVzdLS0xOVlVPb1JuLzVh?=
 =?utf-8?B?djRiRlFXOU1WeUxudXg3THk4bVVJQ3R6enZqK0J3NkZHVFlYWmRjRElaSmth?=
 =?utf-8?B?eFFHWGlwWXozZ09Zdk1HSUxOb210NjVVaVY4cUMrNlo4Q0FwZ3RJY0d0M00r?=
 =?utf-8?B?cGk1cTFXUlYxMS83QklXc2NOanVsWm5kVFllY1JpMVYrK2JhdTlwbEx0dmoz?=
 =?utf-8?B?YkJ0cTZLMHozVzFSV0tXbDZmN3IwQU5TYW0vUmE4MjRIYzJqbTVzNWt3SXI2?=
 =?utf-8?B?b2s5dFFiVk9lVExOa1VMbzgrc0xpdXRNSjNZdW5ld3dkeVlzMm5kVmZHYTB0?=
 =?utf-8?B?d0sxcmVVMFF2dnRJVEVheElmQisrdm9vZW5HUFNxN2kyem9ZSE5wdm53MGl5?=
 =?utf-8?B?WUd3Z05va1FheHYzdGFCN3Ura3FEN0loc2lPTnFDZmxDSmVaMkpvb1JkVDFh?=
 =?utf-8?B?dU82bUM2Rll3MUZRWFZtWjBlblNFckx3ZEdoelVwTUFadEJJUnNMeWtkMUV6?=
 =?utf-8?B?elVKVC94bkFBT2xIaTNORU9rMWp4L0srQm83NEQ4N1NGZzdsS0hoWlE5ajUv?=
 =?utf-8?B?a3BzejFyU04wdXltaVFldGxzUlgreHhlMzBuWkU2elduZGd3UDlXZHFmRW5u?=
 =?utf-8?B?T0E1ZWtyeE53aytOZTU3SmNVVGF3cnpkbVVpb2gvWnZPMFpOZTVhOHN6K0xh?=
 =?utf-8?B?ek5TRUgvM1ZXeXFsLzljT1MwY2NUV1pXWVplOWFIeExveEtEbkNxSTBUY1Bu?=
 =?utf-8?B?NG9rekZRQlhsYWNDWG1oNXNrVlRhUXZLQzNDVFhDZENpTVAxRlVXZXh2V0Jo?=
 =?utf-8?B?Qi9aMDRJa1hreHlSTWJwc0FybE9JbFJ1SjNjRm9CamhOS2hobk14OWdUdjd5?=
 =?utf-8?B?aitaOE92Z0RwNHgvTFVOMER5THpjeFV1bmlPRWVuWGx1dE1nSlhNbWdIT2ND?=
 =?utf-8?B?RVZJOFh2dlRmMVBtQ3hkaStGVzAyUEUzSmxkemJJNmwzMld0U2dqWnNBcEh1?=
 =?utf-8?B?WURnK0xJZUJoQ3BsQzBacC82dTI2YjFTaTZPbUlKWVZqRklhUlBqUURNRkIz?=
 =?utf-8?B?RG5uU3lTWlB5MWlTaDFDS3U2dk5KY0JTUkk1eFFTZ2JkTU1OaTJlazFDbDJQ?=
 =?utf-8?B?L0FyWitoZW9aWXBIVklhY1ozbjdkMkw4enpMZ3VMRVBSRHl6YWNROFJWbFJM?=
 =?utf-8?B?czZwMUxxWElobDA2ZFFxVkhmZTk1TWJQVXhrbXVtZjJVUzl3UTFLTG9Dbms4?=
 =?utf-8?B?NHMvSkwvT3plWXlXaTlrMlpPV1pIUE9wWm9mdm52YytPWjBBc2cwcTJXckpH?=
 =?utf-8?B?L1JJZ3hseXFnZ2xXN0ZNdXVONlRBTk1xbUZJdmxZNzNIeWZXbnd5TkU1end3?=
 =?utf-8?B?bUNuY1o5ejM0RlNYczN5ak85aDJuSFptekpCUVlWMkRIOVY5bHBLNGdzenlV?=
 =?utf-8?B?QVl2MkM4TlcxMUU0ekxocU5sMURFOU9lVGlMVUp5c1N2akt4bEhmQnVJNFFK?=
 =?utf-8?B?QmpMUXBpa3FqODllQksvdzVVa3B3L1JiU2dqTU1ZRk5rbUJ2aHVIK24xdGZS?=
 =?utf-8?B?c0k1YjdqWHV5S2F0WDkzQjIzOE1sVUNrenpmMlk1NlN4NmxCZXVNN28yOTI2?=
 =?utf-8?B?bFJRSUlId1VWTndJeTRwVU9nUjUxVGVzR21panJQNTR5WHJKamZoUktCdEFl?=
 =?utf-8?Q?OiGpZfJgsq+Z91q5Oy+4M1RliIf5k3gNS2VbMfv?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7520.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?eDZobzBPUkZkbEZGazY2NkwyVGZWby9sbVBWNUlId0V4RnJKTzh5dWhmNWRK?=
 =?utf-8?B?b1VIUVIrR0lMMXBCM2NxaytVenI4TUpVaHl6SnZoWWVJVDNPTHhmb25oeEc5?=
 =?utf-8?B?d1p1WHZjRHBqNUhFQmwwTm1uc1dtbWVDR3I5T3NiSXU3N0RUWkFsZkN3VWpX?=
 =?utf-8?B?UytuS20wT2daOUFFQWFsbnB3MnFxaVhCdkV5Y1B0WUROZ0RUOEVrU3FnQlJs?=
 =?utf-8?B?cFhiMjlqalNtYVFMZjg1ZERUTk9TUytlc2FhZkZiV3pYRFlRT0JVRDBob2tt?=
 =?utf-8?B?VWlzREE1S0JRWDZ1K2RXMTVFaWplZkJpQlppNzk4YmNScENSSVV1RTZ3cDZw?=
 =?utf-8?B?cEpHamFBcitKb3FoUlBxM01qZnB2WTd2YkNTbkUraURoN29vejJFZDROOHpP?=
 =?utf-8?B?UFhPaE5XOTdzeFI0bEdwY2VHVjRFNGtGQ1c2WmdYcU1kZTV2bnV1K3BrUjFR?=
 =?utf-8?B?b2pLRE1xOC9GRWdvbnNNMUNiRGZkZHRPOFA0S1I4ZnFaU3RBZnh0RTN4Tmp0?=
 =?utf-8?B?VkVaWVFLVk5ITkhURU9RMDBMbldSZ0xvNHNObmVVdktXL2hocWg3VUxqcU9P?=
 =?utf-8?B?MXcvQ3NmRG5mZmpiQ1VrL1RtenRaSnArNmIvenVrRjNJQXN6Q3RBZ25INTc3?=
 =?utf-8?B?ZVJ3eW5IZGVXai9saVh4YzdTZ2srcitqUXkxZG5DcjJpSm1VVjdoT0ZsS25z?=
 =?utf-8?B?RUludHAzUmc1SndidVNJK0MrRkFsNzhiUXpNZHljZlpVYXBxdUpvWEZFd3Bo?=
 =?utf-8?B?cDE0SUMvWXZYamRWbm40OEJKU3k4SE5iaXpidmhybjRIeWQyRU9PZzg0eXZk?=
 =?utf-8?B?SGJVV2pPaGdra0lSZHBrcHMyQW1sSVZ2RTh4WWIxKzVxWDVjSEFIeTh1NnNL?=
 =?utf-8?B?UTF1R2kyVmY3eUtNbWJxdENRWkcyYzcwR3ZZQ25TY29ybGJxU2pBQUF0dkg0?=
 =?utf-8?B?TzdFaXB1cDMySDBmbzdLVlEwaFhlbzV0TjBKbjFZTzhPWGo3ZXNRdkhCazd1?=
 =?utf-8?B?aks3bFFsbC9vMkZjeTRZRG5odWNNTlE4RDAvUXdvUFBpeEdjeFBTTDFaSW5v?=
 =?utf-8?B?aXJ4UFZ1UlIvY1pmVS9SZWx2Y0gveDJnVmtLd0ROK2RLRWZicTZTTDdFQVhw?=
 =?utf-8?B?V05FZFI2UGRjTUU5Tk55Mmx3MGl1dEQrejl3NFk1b0t2S0RVK3lEdDZDVGFQ?=
 =?utf-8?B?a2VjeDVUN09uZGswV3RuY2JHUm1uOXNVTUwzQTFoVEZUN05RcGpJdmlocCs1?=
 =?utf-8?B?cUcvQjlhc3BnYXZpbm9IQnp4TnZyYmVpeTY1U2xSY0VTZkRVTVFDblhHVW4v?=
 =?utf-8?B?OHlVdXlNd3pzSGk1UFBsUmFrMDNlc0Fnc2JPN0JEWW9vTi9qVmI5V0FBWkFt?=
 =?utf-8?B?eW5zK29nYWUyNDlNUnZqbWU2SVcveDB3czhvQmg5NEtqd0RrZkg0UzJYaFBD?=
 =?utf-8?B?eDlHeksycnJ0bnZiQVoxN2pGc2d3aDFlZit2V0tiQWtGL2VUU2xqTXEwV0g0?=
 =?utf-8?B?UkVmL1o3MlZoMlZOcFNYc3o3REZSN3BodDVSK0dVSFIydUJibWFrUEx0UlZq?=
 =?utf-8?B?c2xNWks3MnVMR1FONjRBMzNlQ0ZmWGdZVWxUNk9aVVBBbHJKZ3JzUEVyRFd6?=
 =?utf-8?B?a3pmU082S2hiTVQ3SVB1L0FZQTJtU1VaOE9icXA5VU43V01Ndkd1d0J5MDRP?=
 =?utf-8?B?Z2RJOWFGK3ZBc2pMY0NQRm9xS2N1WnhqTVdZendXZVB1dGRiVXBGdTRMN25N?=
 =?utf-8?B?QUxaYlZ5Y0NLcnBpOUptKzFPZ1d4VGp4a1dQSDVUQ2VvK2tyYVJ2eDJpaHI5?=
 =?utf-8?B?OG03dFZCSi9oU1ozQ0NWd25YMkpPQlNLazFFNmh5bmtycmkyLzZhR0FienQ1?=
 =?utf-8?B?Q3I3SERDRnBPL0NmU3E2ZUprdWROV3RmSU1nbkJsTmp0NU10MVlTY1lmRENX?=
 =?utf-8?B?TXgyMDBHWWxaczkwVHQ3Ty85Z0R2V1RFZEYwckZER1RlRk5lUklyL29PZVE3?=
 =?utf-8?B?MGY2aGFRdE1rVGJzbTRoVHlNRFhvMzNpNzVCYWpXUEpVb2U3THNmQTNvNDIw?=
 =?utf-8?B?MXd3Wi9KWERCRlU0dWphK2JQVFR5a2FEL3dVNmd3K3BFN2JUczE1cUx6YUsw?=
 =?utf-8?B?UDNHZlFjTUwwc0U3UHdOenNvb2loM2ZicTNYRlJrV1RqTkZBR1JOZzh5NUFG?=
 =?utf-8?Q?NF5yIyASPHYFQ9T6SPKSGXM=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de706d8-7044-4a05-d6d1-08dcffb8e014
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7520.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 05:47:48.1173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D4SfCG/m5zx4Jy2EFrcZ9bFE9nn/TM6Nd68RP3i8CSYEiEWB/EGWdgww4T+IBqTPZj4StWR+lyB8QfnqknufnIIiu+G9M9ECahpAQHwoZgL7eSNC7bPunR+uMA8MZ1qf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR01MB8801
X-Spam-Status: No, score=0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 11 Nov 2024 09:03:25 +1100
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
Cc: patches@amperecomputing.com, Thu Nguyen <thu@os.amperecomputing.com>, Khanh Pham <khpham@amperecomputing.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, ampere-linux-kernel@lists.amperecomputing.com, Phong Vo <phong@os.amperecomputing.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>, Hieu Le <hieul@amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Simon Horman <horms@kernel.org>, Phong Vo <pvo@amperecomputing.com>, Jeremy Kerr <jk@codeconstruct.com.au>, Matt Johnston <matt@codeconstruct.com.au>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, Chanh Nguyen <chanh@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 08/11/2024 11:41, Jakub Kicinski wrote:
> On Tue,  5 Nov 2024 14:19:15 +0700 Khang Nguyen wrote:
>> However, we currently have no means to get this information from MCTP
>> links.
> 
> I'm not opposed to the netlink attribute, but to be clear this info
> is indirectly available in sysfs, right? We link the netdev to
> the parent device so the type of /sys/class/net/$your_ifc/device
> should reveal what the transport is?

Good point, I did not think about using the parent device, that would be 
a good workaround for the currently supported interfaces.

For the long term, we should still need the attribute. For example, 
vendor-defined transports need their 0xFF code, which cannot be derived 
anywhere. Or binding implementations that have parent SoC platform 
devices from the device tree, which do not always have a clear type 
shown in the sysfs...

(The MCTP-over-serial binding also does not have a parent device 
currently, but I believe we can fix that if necessary)
