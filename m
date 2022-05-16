Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7682527BF8
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 04:33:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1jwP6BVzz3bw6
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 12:33:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Eh36kZ3G;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe5b::705;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=Eh36kZ3G; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20705.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::705])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1jvv58Khz2ynx;
 Mon, 16 May 2022 12:32:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oU7EMGokbbH9yyz+AXqTI2PJ0qIFZX84lET4z/9CsuMoKiSAt5thUSLCLbvwADnLOFpx3inwzh4r6RZzl9dN1Hhf8QnBn5W1jKfciZFBrAtUsU8H1s0kNRhIf7mJdxgHzeOVIwK6OGw0ZmYWiXSqnZG8b550MjkvZtW+RsAqHcvs3RUYxxeZkgXabDGDkbywRuBd4H62Je8hx4hK3/cWAC2LWG4rXtBUj7s5KIiIoiksiQ9StpXaKTeUi3+pxuugEf9G0BxG63FQAEH2g192ljXj6ko4fvHV6Ha4jLGwLZAk/q/DI+8of7WR1iUgcIfVohIVCSbPHmOTf104OARlEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6sKrDrgYHUgXwcECj1+dOy7fpJ5Awx1w3spblHAoj0=;
 b=EZ5jLebIaQH+igcVqDeug1/1fo7FmMhFQAo1kXRs3pW4V7WnAo5uqMuLAu6F4N/xMo8ODH8wP4XWvEVC9ECnp2JhYzo0Tk9AF9l6Kf7bz1J0JyzwsKDKyW7/f066Y7bEz0JsWDu8iiHaiHzIYyDtfr4sW8QYbh0DfQ4EO9l+s9RirHdlSxbyxkfcuZzSH5CRi/WcYj5YcZPcPmg/4yESLRxIcBWVcn7sQXX+MeAWmoRXZHBLR9Po3P47rxner2d0l+JemsIaqTBstFoR8GR51SbKORHgJ2C1Ag7sY7am6NnMLkoFSyrc+GIdchAnooSv9VloZ26ZE3rkRB41NM+sXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6sKrDrgYHUgXwcECj1+dOy7fpJ5Awx1w3spblHAoj0=;
 b=Eh36kZ3GQsNEgZPRSdggywQFNgkWBr/brk2eyuaBBbjKBc5u5Um0yC3YywlIZOMemR47+mKP+G06vAsH7CRlwIAnrSRZXVrmB+GblYx7DXUZye7konxYZHb6UM2FRviLAQDqZNntytToqG/PoxRn06OmogpZxhRtr4LFr0yJXX0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 DM6PR01MB5099.prod.exchangelabs.com (2603:10b6:5:59::18) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13; Mon, 16 May 2022 02:32:22 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c%3]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 02:32:22 +0000
Message-ID: <fc422a06-c035-f6e5-231b-74ea6afe8467@os.amperecomputing.com>
Date: Mon, 16 May 2022 09:32:08 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v7 3/3] i2c: aspeed: Assert NAK when slave is busy
Content-Language: en-US
To: Wolfram Sang <wsa@kernel.org>, Corey Minyard <minyard@acm.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 openipmi-developer@lists.sourceforge.net, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org,
 Open Source Submission <patches@amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>
References: <20220422040803.2524940-1-quan@os.amperecomputing.com>
 <20220422040803.2524940-4-quan@os.amperecomputing.com>
 <Yn+9QBoPdH8fMm/m@shikoro>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <Yn+9QBoPdH8fMm/m@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0152.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::32) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fdce3981-267d-4de2-48cb-08da36e44e39
X-MS-TrafficTypeDiagnostic: DM6PR01MB5099:EE_
X-Microsoft-Antispam-PRVS: <DM6PR01MB5099C07C7AB070E5A60CF106F2CF9@DM6PR01MB5099.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k89acXMin/kCS5QfJCCg74y0uLr5cIAB4L81v1enq6wKPQSJmEPtE7q5PRG0r0az1c2WX8G8S27RTTi/Qm6iV5aYOW7kH0As246IJ1tonLbM4XNIJ/X0kIIWRe7+JwoWP7gmULvfIZTNidPpj+hWV7GYpbif6eQuduJQCAtT462ky9Mwagqlg+jRlqZ+QkuGODbJmFFNLC5FZtJNZse/ypERT2BIfCBtFR6IIIWG7DfKQVdXtywZ5yK1kS6P24qHVX2yfzpsg60kQ7Br9+04npvmIvylJDsiKlnDkaNa00ESE7k3MnfI4y9H4roxcj10e7FlsjIx/6zU+Jcj+IFyx8VNG8HLOWaB8hJU1pcUNLAKXkMMzS+NixHyec+UmMiEz1t83z0mSF/NpLYSG/dOKweaauWYPQpdk0BCWC19AmxdIZqiC3EWmoapDuLdc5HAp0GetClDop+Twafp/ITo0MYlb5m+dIJ54wY2c1XoITkH4QOcdd5s//1SrdBT1y1Eat8gHe6EIvc9+947s6IZ2BI9ilYGLMmsKwG8dQ48crWDkPY2Lj5j/lVeKcP6S+f6lZ8KLEXEzuX5/VQON0UYINV6E9Mg+05jqFllsMY+EO0QRcZxItvxcDsPTGu0P2d12AjxnfOZjgarl++Lbks5WodBSb7T3t+xfZpkFJzwUZa8e0ycKjdxFgWaPWoHlz78c/9LRa09Z2XhpSY1a11Ig2xdcDfzRa+DOGgJeA4yviIUBbQ2/tUSlQEit19OXcCS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(921005)(53546011)(2906002)(316002)(110136005)(52116002)(86362001)(186003)(6506007)(8676002)(83380400001)(31696002)(6666004)(26005)(2616005)(6512007)(8936002)(38350700002)(31686004)(6486002)(7416002)(5660300002)(508600001)(6636002)(66556008)(66946007)(38100700002)(66476007)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emFqdlVOdTJkd2srdWg5UHorQm1Jd2hMb1Bxa0RPQUJ5S09aSCsrSDhRK1Uz?=
 =?utf-8?B?QkErKzZyd25vWjJRNnAxbCtZRW1ZWlN6eTcxSWlZelF2YmhmVWU2bFRBam5Q?=
 =?utf-8?B?d2tEdmR4SFpJdENHSHhqaFNGQm9YajI5MmUwTWJMdko5QTg3VWc5dzlLeEFU?=
 =?utf-8?B?OVE4NE55aGRnQk9uSDRLeVVadXY4VnNUNlNPaTh1TitGdXFJZzlFTHBSTTZ5?=
 =?utf-8?B?RXBPUGIxUXRmcU9qY2VoVEh0NWFvUEhnNEhSeTN4c0NLdEtLUG4wMDZiYTY2?=
 =?utf-8?B?T2taemdvRHBTdGFhNXM4NTVvb0oyZHB6U21oKzcvVitDcWRteWxUTm1FU3BD?=
 =?utf-8?B?ZGs2TVFUbklKUTh4dWJZbGZuMXJzSkw3aHBSUldUZUVlMHlTNHpCVUZTVGpy?=
 =?utf-8?B?L21oME5iS1pOMWlUL09MdnZNL1hCemZrN2hjR2xPWENGeW9lRDl2WFczTUpy?=
 =?utf-8?B?VTZGOUg4YlNKbGx2MHFhZTBuKzdMYWlSSFNDcW9sVTJuaHNWTkRab0FZQXVG?=
 =?utf-8?B?dmRwc080R3UrUGJqZWpod3NBc0E3amh2dDduMHRPdVZuUVlWaVVjTVU2cFJv?=
 =?utf-8?B?NHZJbWNBUXhhMjBFRU5kOHFiZzVsK0MxMGJPRUpMMFdwSkxqMStFZTdqUVM5?=
 =?utf-8?B?U08xMjFoMytqQUo0NWZ1Znc1ckw0VTcxSm4zazdTMnc3OHZUUUJuKytpSkpY?=
 =?utf-8?B?Y2NXOHZoZndDWnAyUEZOc1VGUTlXUHZlS0I3c3hZUlozQ0J5YWlrMTk2U0pS?=
 =?utf-8?B?VW0rODZyRVNjeW1DT1V6NUlSbDI5WWFZeit2ZUhtT2E3ZEF0aXJHVSs5TDln?=
 =?utf-8?B?M0ZESXlnQi9LZ2VzK2FXSG5rK2loODZOektiOFFtM3ZPdzdVYTROMnNUbFE5?=
 =?utf-8?B?S3AwbXgxUEltditFRjlJYk1zTGVLQUp6ckVBZ2U2OERnbVRlWTRCSkJlOS94?=
 =?utf-8?B?QjlUbHhqQm9mM0pVK1VRQUR0SnJwZGdSQ1JZNXZBNnlFcDdwVThVOXEzZjJY?=
 =?utf-8?B?c1dEVGJEZ09pbDN2REJpU0FORWxncXdjTHFBajFGQVRIWG02dHNTemRiRktl?=
 =?utf-8?B?VzkrMWpPMkFvU0RqUUZjbmVzaHhRUE93QytzUS9UU05KdThUNEZNREhjdjdw?=
 =?utf-8?B?cHg4MXdpYTRVaGlXOVlXdWdoS0V5ZVpqYU45eWJ1MWhhOUxwZGNZdElwdWdp?=
 =?utf-8?B?ck45LzhVT2lNSUkybkVwREEvUlNqUUhraWlqWXdVK1d3RG93NmxReElYN2VE?=
 =?utf-8?B?T3J2Nit0V3p6N1VrRTVXdnZMTURHQmhzTDVYM3Z0VCtKM05NWGlvYTdVekxO?=
 =?utf-8?B?a210M3d2cjZPQ29TaDQydDIvUVR1SmFHNEllWFpmd2d4SDhPTGRwNkphWWZ1?=
 =?utf-8?B?eE0rQzZkUTk3c2NQdGJxQjFtc1FuUTBDR1FpK3VjSXY4cEk4YUs0RHpTQWR1?=
 =?utf-8?B?Wno0VXBHU1ZWNHpwdUxYU3VVMUJ5T3VnSWh4a2ZKUVduenI0Wk9xRHNnYW5D?=
 =?utf-8?B?RnZ4NEVDN2xvN25ZODA5QlZlTlpsRjRUaFVLakdLdVlRK01ORG9xZlNBczFl?=
 =?utf-8?B?Z1FDdmsyQ2VZUGRHeUJhMnQ2Tm55R0ZWejlEaTJZRExiUzVFUkpmWk84N3BN?=
 =?utf-8?B?Y1c3Q1JOMDd1eWdVRkVTaGtlMGxvMmk2Sys3cUxxUTd1azhud0RScXRVSGlx?=
 =?utf-8?B?b2dQNlJxUlJ2MTZ3eXhCdlZLTkV4Q0llQ0loMjM2S1lhRk1Wdmd1LzhlZ3NP?=
 =?utf-8?B?dXhTeE9Ec21XMkR6VTE3a3k3aWZBMGdmUHJDWSsweXVXZlA4OEpRaFpORTNV?=
 =?utf-8?B?S2h2aGl3Yy8ra3J2bjIzMXhSUjhqVVBrYnBndXpiemJhRmhQZUd0T2J5TS9B?=
 =?utf-8?B?OGd2cFlydC9QYVlLZWlTSXZldHdaTUJPR2xhbTZYWExQeURseWkwN2VlbGNL?=
 =?utf-8?B?OGd3K0ZaTlc2NnIrU2IvMENjRkFObWpXMm9SZHhyMjk4TlVDQWhablpvQWxN?=
 =?utf-8?B?ZjUrRkNPMmlzd3ZiVXBzdGtGN21mNnZIUk90K2hiOENWOU41dUczc3REeE83?=
 =?utf-8?B?STIxU1VCb0htdExKSFNmd1BvNDBvWXdBalJSd3ZuaFBHdVBQOS9DQWdLSmpX?=
 =?utf-8?B?U0szekNjZ3NlNE05d1FhcGM1WHlpUXk0UjVHeS82bW5RUng5TFE3dlVTd0JD?=
 =?utf-8?B?eGV0YTNHYmJ0MVhiSC9JWGY3T0RBOTRNZ1psOG1lWlBQaUk4ckFFVnRkR1Bu?=
 =?utf-8?B?N0Q4eGpHWkVVMEs3Ykg2RUZJdTJ4K1lBNUZ4cmM2TGkzQ1YxWkV3VW80Mkx6?=
 =?utf-8?B?YTNldGQvSDc4NWIxcXVBNGRscGRtbHMvUE9NeFJLOStMcW1qY082Nm5NUXRE?=
 =?utf-8?Q?ZN71XmZHHCz3AGLscLUSwujhpIACeXd+1DKL4?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdce3981-267d-4de2-48cb-08da36e44e39
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 02:32:22.3867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /uCnwwLJDzgFj6UQIDq+LD1uKciF+v6P1+zEMw1+nZ+2uH6yDdI5DM5lyt1xP0NzfEGuZgBSxgvZPTYmQWxbeP0ThBVvGVCdqCWLjZK3lZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5099
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 14/05/2022 21:31, Wolfram Sang wrote:
> On Fri, Apr 22, 2022 at 11:08:03AM +0700, Quan Nguyen wrote:
>> When processing I2C_SLAVE_WRITE_REQUESTED event, if slave returns
>> -EBUSY, i2c controller should issue RxCmdLast command to assert NAK
>> on the bus.
> 
> That should be I2C_SLAVE_WRITE_RECEIVED and it should be NAKed on all
> errnos. Have you tested it?
> 

Dear Wolfram,

Thanks for the comment.

Yes, we have tested this patch with ast2500 and see it works well 
without the need of the ugly slave_enable/disable() as before.

When tested with ast2500, it is observed that there's always a 
I2C_SLAVE_WRITE_REQUESTED comes first then other 
I2C_SLAVE_WRITE_RECEIVED's follow for all transactions.

In case slave is busy, the NAK will be asserted on the first occurrence 
of I2C_SLAVE_WRITE_REQUESTED make host to stop the current transaction 
(host later will retry with other transaction) until slave ready.

This behavior is expected as we want host to drop all transactions while 
slave is busy on working on the response. That is why we choose to 
assert NAK on the first I2C_SLAVE_WRITE_REQUESTED of the transaction 
instead of I2C_SLAVE_WRITE_RECEIVED.

As we are interested in this specific case, ie: to assert NAK only when 
slave busy, we dont want to force the current aspeed's slave to assert 
NAK in all errno's. That is why we choose to NAK only when there is an 
explicitly -EBUSY return from slave.

Thank you for the review and hope to see further comments.
Thanks,
- Quan

