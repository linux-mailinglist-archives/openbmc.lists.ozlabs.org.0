Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E979B7FEAFF
	for <lists+openbmc@lfdr.de>; Thu, 30 Nov 2023 09:40:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=LSsjtRFi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgqQp3D2Wz3cTr
	for <lists+openbmc@lfdr.de>; Thu, 30 Nov 2023 19:40:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=LSsjtRFi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e89::704; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20704.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::704])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgqQC0W3mz3bw8
	for <openbmc@lists.ozlabs.org>; Thu, 30 Nov 2023 19:40:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkouRmxDG7nDv6VJZM5IP3OhX9EgBSHEnjxIjH15ng6JxRsdsiLxgX5qVvhSiX7nGQchd9i7bB4qyzsXoc5RmtAccT0O/O1ArCgFlb+88pa4bk5dMuDylVfg/9xLy07xQE+7iVwp1k36IHbO3HV454bYmNt61C9ufSXtggWTDhkfl/mvSM/Mwe4Xkrpf/Lk4/NjiJWPU9M42dNRkA4rMKCx8tcvwaHPBOdDFOj10tN9eYxBlT8ZSCyCsAwoebXjTAktmdgq0ivsK2sGJwX/7e+Q1JHsOdxiDCYK03Ok7UXIOuLVU/Crc93K1C/Ht4x+vLg8R0RX2ZIRu5BT5kyIHow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yV/F29IfBt/gtR2BrPHsqcXTL1lajfnG9dJh+c70JEY=;
 b=BmbmFvA4WUAleonWLrv9ZDM0mhvx3texp3AgvyjYdaIqbEkffnRMDSizlryB6uxft+Gzgs3NjPlwN3l1ud7AtCCBaXznOB/14OL5k0v4dwJL3R3F7jX+sY+5SPWlivRTl2aY7uiAdXQHK1//jRoLsl8ZNKaoXAvXUfmKFdzg60bpN5uep9H4Is1MWm+gpoV067txItxq1W66uGyAD5tL+BwbHn3ZnbX620DjD1D3KAzPoZ+skR9yepCVLxZUN5hP8SfpoU1gt/Ex2RQkpQwBZikMsbFmuu1JqaX4bqmiaUcWaPZoImBSiSP8s1ThOaIshU5wXpsm27Ies3hALzR6Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yV/F29IfBt/gtR2BrPHsqcXTL1lajfnG9dJh+c70JEY=;
 b=LSsjtRFin/HjufzxrKUA4bOEhzQ8qa5r89fiIHUkb82DiozA6kTPej+0gatnr7zI0ZPfMG49cVascfp4GHHshegEvBO/9cbBFRHStx5DlOqNABSNAaqZcnD8yZ7IWQMns2LRrX5iG1ESrUFgAn8nxXQD0bSqdfxc29ZHVm0Qrho=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 SA1PR01MB6560.prod.exchangelabs.com (2603:10b6:806:1aa::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.24; Thu, 30 Nov 2023 08:39:56 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68%3]) with mapi id 15.20.7025.022; Thu, 30 Nov 2023
 08:39:56 +0000
Message-ID: <706506b7-a89c-4dfc-b233-be7822eb056e@os.amperecomputing.com>
Date: Thu, 30 Nov 2023 15:39:45 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mctp i2c: Requeue the packet when arbitration is lost
Content-Language: en-CA
To: Jeremy Kerr <jk@codeconstruct.com.au>,
 Matt Johnston <matt@codeconstruct.com.au>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Open Source Submission <patches@amperecomputing.com>
References: <20231130075247.3078931-1-quan@os.amperecomputing.com>
 <473048522551f1cae5273eb4cd31b732d6e33e53.camel@codeconstruct.com.au>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <473048522551f1cae5273eb4cd31b732d6e33e53.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096::28) To
 SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|SA1PR01MB6560:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ba9933a-9f55-4a36-d22b-08dbf17fee39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	YZF71IwKkXVJfZW1t3qAnEyI0rYCVaCICKrjyfCYfpyAMo1Q7UCjOvQjwl7yYH7FXN+KZg7umrrf28sRkW2Om4cs81Jo6+dw8dabBVaVs3pkSlyAggoe2GZZqHgY2bSdwUJNOI3Cs/WPYtPEwBsNEBYPBeGS9gpSzjweh+p4+VxocTTd3xU8rHwTPzV+JLq+AQb4fXUY0FjVezRT9RV+L5c2emkY8uyzwmsK4E5I++T6DenslMtli3Psvc+FSdFPoKpCp51x3imZZnr7A3ppVLmfDvnjUziOSNhupaUwnYIDANogNm8hnnJpCdHyDlGM4b7971Aabn3oW9Q9W+LmafI1CLoTaGHu8UxiaGDG4JyTS1r/eoYa0v4bvFw504kJ5QJJ1Jl1RMX3++UWcPh0m7rDY01tFXHG9VVlCzuzUdbDpqzLuPxmwipelsb773v6xiSNmvNEXsHqRccWxbiKrX/KdncH2o1g/3XvWSiJMFeckgNuvL4SlJ0zgypcHzQq8WeWK5MP/9IQMQgi9yJdiIVTtdHN/04j9Re9hoGFbeOOpNj4S+/LFao/UdhPylqnLnwogRopbzLj0Km++hVEEMlhvTVoMrQoDg+VRBe50qOGIEG5pNVdHJxmiH8mCGyWnC+NyeqrN2MNn3ygxeO2Gmg/vf8mPtdMBQjK/LRP/V8=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(396003)(39850400004)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(5660300002)(2906002)(6506007)(6666004)(966005)(6486002)(478600001)(4326008)(8676002)(8936002)(86362001)(31696002)(316002)(54906003)(110136005)(66476007)(66556008)(66946007)(26005)(107886003)(921008)(31686004)(83380400001)(2616005)(6512007)(202311291699003)(53546011)(38100700002)(41300700001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?clArZ2hvOUlmNXl4bEhVYkk3RjhweDVYWHZzMnNzYi92UGROb2c3R2hTNFlN?=
 =?utf-8?B?L1VieWtFMDNtWk9WZm1sT3M3OGo5U1BNK2hoOUhueUNUSE8za1hZWXhVZ08z?=
 =?utf-8?B?S1ZSUDdpV1hyc0w1ZFUwNDhoamhhTkZweDJWcjIyemJ1NE9hZ0ZJVnFUOThv?=
 =?utf-8?B?Zk9LY2NMS1d6ZnVMaEtFU0x3WW9TRUIrMDRrVWFxOXR4U3AxeXpNUWRPY2NW?=
 =?utf-8?B?RTVsdGNmMHllbVYyVWFUWFRQSWhtRXpWNkErYzJrQ0FnZVBBSXV0Q1ZZTXRK?=
 =?utf-8?B?M1hCMnBQcythS0ZpN2hMU0VtRDJoN2dRcmJzT3lNZ1J0VDM4NjBjTWowUEtY?=
 =?utf-8?B?Mkh4MC9WdlIxMnN4YlVUUW41YmY5bkxQekdpbExEbGdhMFJkUFA3cFVSMjAx?=
 =?utf-8?B?OFZTS2dtRm5LWThQeUFtNWRGaTdoZGpDaExZQmczS2M1YXE0R3lXTlFPcWZN?=
 =?utf-8?B?VGFkN0puMlVOQlZ5T1RqaDNmTzR6OGh3WVFjMTRSQnBvZ2dtNFRkRXRDMDlG?=
 =?utf-8?B?QVR1dEZSc0dtYktMSThBYnFxeGRRQXFCTnRVT0U0V2JqMjlLcmNGb1pCTGJs?=
 =?utf-8?B?Tlc3ZFpHUGFpWmhlSTJDdXhHeHdNZ2w4SGp6S0hMTE1zYUs1TWlZeGVxcDA0?=
 =?utf-8?B?Yk9Jb2lORTBLME81dDl4MmFLcnYxVXRSbGFPSkxEQ2U2OGpKZTkvSVJKQ1I5?=
 =?utf-8?B?eVBWdmNvaGRic1B6alF3NFV4bmR6QXNJVklROGZZc0J1RS9JcXVadjFicUlp?=
 =?utf-8?B?WXBOUm5NbEhraHNRUmFiNVJENVF6NjFyY2YvMFUzcnJIaWduWDdqTkpsbDZa?=
 =?utf-8?B?WWEvd1VNaytPL3VSU3ZCN2N2UnpqNnNQWDNKVlNYak5hc25TeGJhTnViZEhG?=
 =?utf-8?B?dVZya0tDSVhwcFFDTDJmN2RrQ056dm1vY3F5cUx2c0dHQ201d3Y5Q092YUUx?=
 =?utf-8?B?NjFobDFwWCsxa0lOVWtSem5Eekt0Qk1GdXJxMTNDSzhkekJZZk94dE1GNlVR?=
 =?utf-8?B?ZVJld1dTYWJMN0trNnd0bGJZOXFOSnZrOE1OSnNiZUlkdjlrNGJocUhkdXBt?=
 =?utf-8?B?VFdOdDhJSVpMeG43clVyRFc2Qi9zMmJCcWRhUE4wRHJ3c1ppYktCblpna2dz?=
 =?utf-8?B?L0M5OE5BbWtXbmhmbHlpT3VHbFF4cThpdzU2MWVidVl3NE9CRU1RNWRtM0lp?=
 =?utf-8?B?NnN5M3BTcU5kb3U2aTRKa0drdjdERW9xTVFTdE1valordUZvaU1JKzA5aFpt?=
 =?utf-8?B?aGdWZFo5UXJMTlk3Tkp5LzdMY1RuVFgwbEhVOGpTMTYyM0NwRW1xRG5jeDdp?=
 =?utf-8?B?Y2VVeXdsR0pQdkg4UkI0MjNVSFZnNGtueC9DMUNLZFZNT1dycXdDZlNOenZT?=
 =?utf-8?B?dlVjMVE3SUw1REI0UXVCMVAyTHRIaERTOW9aVC94SUhyMVk1b1MrazNSRUlV?=
 =?utf-8?B?bTFHbE5ibCtqd3QrenIrUytBQ243dE9MWGhpZjNlY2tOT0JmS1hXdWVDTEFq?=
 =?utf-8?B?dFNxRGxsU2hmbE1BTko2Qzl5S2tPSjZtMkZzbFVkem5EM1Fhd3BoTUVzV1Nq?=
 =?utf-8?B?UU93TlgzSW1YSmhpVURyWHJHcTdmbXhEWW84eFdyWnVsc2g2dERhUGhXVWs2?=
 =?utf-8?B?SHZzS2N3c0hhdHord3h0Q1dsbnhPT3JMNEZmb2xyTEt3MFNFYlVWNEcyY0hp?=
 =?utf-8?B?dGJ1RjVEVlFZNG9ybnJUVHpUaTFLRldkWE1TTjdSeDVOa3ZhdXg1NHpTNnFW?=
 =?utf-8?B?Q1YyUGVzTTBNMkhyTkNEZVlBZEJJNStFcUI2YzhQVlBndDlmcEVPZzNZTDJx?=
 =?utf-8?B?WWtlRnRBNHhxMkYvaVdKMUJXcDBIR29aY3E1ekFIZ3RtUWpSMzVGTFlNcHR3?=
 =?utf-8?B?ZU1DZWxjQjFxNENJeWNPMThVRWVWQ3o4dFE0WDc2UytJdm9xejhIUWVpMEtG?=
 =?utf-8?B?UzhOMGFVKzJWc29PU09qQXBwV3dUNldsZUFBU2pQUHFVblRiM1hUU090NU1G?=
 =?utf-8?B?b1hJVVUrQVpaUElmMmlvK0lEdE93bFpNRmtYNkxGWCsvTm9sdDkrODZjTDZU?=
 =?utf-8?B?L3Y4ZW1UdnBGWWVlSmU0Ry9OeXFvY0J4bHJuOVBoaEp0YkhRTkJxTmVrWnV1?=
 =?utf-8?B?V3lZS2RMVkY2NUVVQXd5MjUvU3Qyci84Vm4rUXpQMTFmYUM3eGR0SUxBWGtH?=
 =?utf-8?Q?7/2spUU9rCg9a4vnEONCFJs=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ba9933a-9f55-4a36-d22b-08dbf17fee39
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 08:39:56.8262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yS0FznNfA++d7BvfiXnhfp0xhbnZx4MwDb2837VqOiM+LdJXu1pphfZ4o/hr92kzBwK64huNxtqNvx4JZyvUcDNdhJ3/pwCQ91xppJ6/rt8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB6560
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
Cc: Dung Cao <dung@os.amperecomputing.com>, Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 30/11/2023 15:03, Jeremy Kerr wrote:
> Hi Quan,
> 
>> If arbitration is lost, __i2c_transfer() returns -EAGAIN and the
>> packet should be resent.
>>
>> Requeue the packet and increase collisions count on this case.
> 
> Are you sure you want to re-queue the packet here? The i2c core would
> have already retried on arbitration loss:
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/i2c-core-base.c#n2223
> 
> With this change, we would be disregarding the limits in adap->retries
> and/or adap->timeout.
> 

Yes, the __i2c_transfer() does try its best to send the packet but if it 
still fail with -EAGAIN, that means it still unable to win the arbitration.

Without this patch we usually see the error below. The consequence is it 
stop and need the PLDM layer to retry when timed out, which takes time.

"[   61.616210] i2c i2c-3: __i2c_transfer failed -11"

With this commit, we all see the packets go through peacefully just by 
requeueing the packets at MCTP layer and eliminated the need to retry in 
PLDM layer which would need more time.

The result in our test is as below (Note: would needs some addition 
debug print code). I also think it is worth noting that in our setup 
there are multiple Masters.

[73183.511487] i2c i2c-3: Arbitration loss, re-queue the packet
[73192.550519] i2c i2c-3: __i2c_transfer failed -11
[73192.555734] i2c i2c-3: Arbitration loss, re-queue the packet
[73207.250036] i2c i2c-3: __i2c_transfer failed -11
[73207.255247] i2c i2c-3: Arbitration loss, re-queue the packet
[73429.499875] i2c i2c-3: __i2c_transfer failed -11
[73429.505116] i2c i2c-3: Arbitration loss, re-queue the packet
[73504.672065] i2c i2c-3: __i2c_transfer failed -11
[73504.677317] i2c i2c-3: Arbitration loss, re-queue the packet
[73540.762984] i2c i2c-3: __i2c_transfer failed -11
[73540.768242] i2c i2c-3: Arbitration loss, re-queue the packet
[73631.040049] i2c i2c-3: __i2c_transfer failed -11
[73631.045333] i2c i2c-3: Arbitration loss, re-queue the packet
[73648.538967] i2c i2c-3: __i2c_transfer failed -11

Thanks,
- Quan
