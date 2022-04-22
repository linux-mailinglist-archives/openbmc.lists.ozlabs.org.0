Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 646FF50B213
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 09:57:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kl6G126hFz3bc9
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 17:57:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=WBxuwn41;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e8d::719;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=WBxuwn41; 
 dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on20719.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::719])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kl6FP30Ctz3bWx;
 Fri, 22 Apr 2022 17:57:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F8Wed9wpOiGmGtqE9MEAJjio8qb4Bit7xzHIgP174AjgjAXW61Lwg1ckc2FQpCCtAFlWp0gPeoLAKVfzC1tF2Uc29XWQ+IefNQNt4jTP0E1bPOJR3Aj9bLC6bNI8JeRClxsLJI2LkLyBXeIMTZ/eybxNHkgIJ+6WrPSazkfFfaGydUxFmJM/cmvFHId+W3waYAjbC+S0QDM/+PF0e53CH3FGCQ/Jls0CzqdG3qfqz1b9ZX+4Z7dG1Cm0zbZQP8egoRiXS2dvMuxNwLb0dxWKCayfsJgsYxJ+k7XadnTmynDqemko8g9sgfMwExe+APCpG0g8ViSr5j4CR9z0ZrgORQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSdpXd107G+76ZcOMCNQlJdCAB2/rS9PPGx2LAPowz0=;
 b=n5PD9yIPKkTTZ7aBu98OyxljBxFvQ6b0opO8Uwqy1aCtC/vSQVLzkLWQ7AO9F++zBqAek6nfajlIO6qE2mJkYAKxF7kISgWE3fGK7Dz082HhylDEZj3M3AM9/grVOExXHhTYLmKhAxAgfoSRXF1eQICtEf8N8aB08UPwgKwYsbRV2L0EmVW8rH2Pm6TwjXHRMKCEvzBXl9caOOTMgxt7JCKW3eZWwznhUW7ITQ9yoMAek7OXwQDhYcWPdgNhykaULLqf6C3TldMmvZyLq1vQ2+Q+ACcZXsY7qDLzHHslZb+ogR6gL9F6/BfP5lmVNj60E4XA6C78Usty29KWLD4IJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSdpXd107G+76ZcOMCNQlJdCAB2/rS9PPGx2LAPowz0=;
 b=WBxuwn41C0xELpL9gHihOJN7x2x1tO5Go286ufpI40IP1qLvwVyMxVNH5hsBQbQ/AwnxvfWuc11rCqKvE0Vlnktw1wjZbNSBhk/Vnn1zPlYHmZ1fFnjf6x/mUjOByzduiczYp8iGzp9H/QqutBVakBJwO2CPhHtyaPnYZFZukZ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 SA1PR01MB6800.prod.exchangelabs.com (2603:10b6:806:185::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.13; Fri, 22 Apr 2022 07:56:47 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c%3]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 07:56:47 +0000
Message-ID: <0e719834-5745-4a82-20e8-541f3bc6b6eb@os.amperecomputing.com>
Date: Fri, 22 Apr 2022 14:56:33 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [PATCH v7 2/3] bindings: ipmi: Add binding for SSIF BMC driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Wolfram Sang <wsa@kernel.org>, openipmi-developer@lists.sourceforge.net,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org
References: <20220422040803.2524940-1-quan@os.amperecomputing.com>
 <20220422040803.2524940-3-quan@os.amperecomputing.com>
 <153da61e-dc9d-467e-221c-b48d6f54c6c2@os.amperecomputing.com>
 <55cbbc16-5769-ecd2-e65e-c3b39a34dfbb@linaro.org>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <55cbbc16-5769-ecd2-e65e-c3b39a34dfbb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0028.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::9)
 To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 680f0aeb-51b2-4171-573b-08da2435a684
X-MS-TrafficTypeDiagnostic: SA1PR01MB6800:EE_
X-Microsoft-Antispam-PRVS: <SA1PR01MB68009B51D8623CE59F7520E2F2F79@SA1PR01MB6800.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7pvWP8+OFWJpaCCVu8V0AxhONnzei5TGGTQLvTlItXs8HmDNL6nqrjvpLHy/AqinpPAteJHQ+h13yC0QEpMDrVNRaB3f9ljYBpuuaJUsLlOoUTtwraM0MFmi8ZU7gYgHF8MhMfXtb9hJ9U3g0JgICQywJviBsru7mByfOIqke8TruxYG5VNzP+jVwrxoUooLo6lqR/Gi96LglCapkwyAIJZuCWgjAiTQe8+DVIrKgOkPMJwJE2YSALT9EnkojoU6UXOyIbzzCuDQ8//URqF57Sul8qqQlLwRmTEVebHokq1b3qjokFsjn0ndgXtZIdgnVoKdee37F2bTnFEvmD7lrmtHYo0nCOPUppEZbhRgN+ytayKinDISyam1M382zzbJQ7/WueUQrK2tCBpP64ux6fmdaT/QHDok1owlH2GR/z3lYpMmITSUW+YAqVtccrdoFXoKwO0zgQB7GHIOHkcZT3GcLjlLOODboyHJ0iU+3vcPfMO+Ga9Q5ZM/v1DkCbyiwU3BJM7UG5296k03nPzcSue9+KHxRYSjnRThziHyn5tM+EvCfkEXHNn/QO4p3/sNDl7iLCMm4zliUT0n7ZuITWi39ncG9J1aVHPMqsvYYGRBcghamnMIYX01Z+PyOGL0aF9q9JdPgmxPUzBDnjfVNs58CXpcBAIN4hLMrnPhyCRx3w+XoSbz8gyLn1Cbwc+SizOOa3HG3I8fRXn9unviF7h57QjnHY0tEcH4ysdpvwKcB/daopvGf1zLnPEHIVDn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(31696002)(38100700002)(8936002)(54906003)(38350700002)(921005)(2906002)(7416002)(53546011)(6512007)(4744005)(107886003)(26005)(110136005)(186003)(6506007)(2616005)(6486002)(508600001)(6666004)(52116002)(66556008)(66476007)(4326008)(66946007)(8676002)(316002)(86362001)(31686004)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGdqaEJEOEgrdi9RVVVlSG1VOFRkOUdpNkdmSURMaW1ZdmJhWnBDeUNQcERB?=
 =?utf-8?B?VGRxUkZmOVdveHBxZG4veFQyNnU5Ujg1cGdtUzNTc2pmaS8vMUMvYS9PU0NX?=
 =?utf-8?B?YkZocEl4ZFk1QWZVMnNvNTJaNFVxem5qeFgxQzByeG9XaWhEMVhDYmJ0NE9y?=
 =?utf-8?B?K0lWL1Y5Nm9HbzRRNHhSV01UZ1REc2d5Z3VrZHE0SFBJTWNjdTVXS1N5bjEx?=
 =?utf-8?B?MHRWNHBDcHBBRXc4UkpCSHRlVU1UaGdxRmV0anJOZWRwNTgxTDZBQnhROWw1?=
 =?utf-8?B?Wnc4VWUyVEQ0THI5N3FWWUI2cVBYMlh1bzluWk1UMjJxL0t2ZDloNzZkbzM1?=
 =?utf-8?B?dnVGenFhSkdtQUZ5cWFYcjFHU2JPWXZ5alVHQmxraWxzMVRzZUxEcHpiQ21O?=
 =?utf-8?B?S2tFMXB3Q29EUzhsZnovbGl0ZWdleFE2NEtPU1VYN3ZqQXNVSmlsNmxVaytW?=
 =?utf-8?B?S1k5ZmZHSjFYZ2N6MC9uM0NScUFwc0Y5MitRemNyblc0cGhpNm9Pak5ZbU9m?=
 =?utf-8?B?Z01zK2k3Tld5Wk1jalEyQURQdWNESTZtUFFMY1EwTElGZkpTbDhaczByVnd2?=
 =?utf-8?B?SnZjM0xvNjR5TUhCa2E0b1N6M1BCbEJFZFdsU2tzN01lcXh1bEVYS0lBUVV6?=
 =?utf-8?B?c2RnZm8vTC9Hc0J6aHhOSjN4WHlSZkt3L1FzeU1QaXVtdTdkV1F3WGdpamJv?=
 =?utf-8?B?aU9vdG9IREdBVmFjclRhU0UzazdKWmhLcGpsb2oxeElzcVFNVEJiM1VyeFdW?=
 =?utf-8?B?ZnN6YTNCQ1dWZXRYU3BFOGswRSs4ZTNLODYrQUJ0NnhrVjU1SFlOcjlBTWg4?=
 =?utf-8?B?TlR4VmVpQ3VmYXJwZ2grYkhnNWhMMityRUtWWTVDT1NFMDNVbEVBSVkzeVFB?=
 =?utf-8?B?Si8wL3dLYTlNSGF0UzdDanJXTGgzNGdJQlNSNXRrV0VCQTV0UmgxOENSZzA4?=
 =?utf-8?B?QU4yQlZvTVhmT3BvaVNjQUZxWG90REt4ZWJLaUtNYXNsUXFrNHl1SC9FTVdk?=
 =?utf-8?B?VkpzcjdVS2VnMkd3ZThBTDMyWml5R0U5RkFYL1MxYi94ekZ4Q3c5eHEwWWVE?=
 =?utf-8?B?QSsya3VaVkhlaFVxVUVoZ2lBemkxZkZTSEVlRVBZZDRPZndsYjV5dkNIeHRD?=
 =?utf-8?B?bFdBSHJSdlRVd3VpVnZQTGlkL282MjhkNzdaTFcwWUNRdHJabGJXb3Y2bUcv?=
 =?utf-8?B?Q2wzTE9DckYxTVFYM0JhVUtqMEp0azZpTkhsSVdhU2J6OHJwWHpqWlpZUnBr?=
 =?utf-8?B?L29uN1Flc0NDOVlFMUNwcE1JUEpGakszWVN0VU1ONXZjSEhNMnd4QUE4alJV?=
 =?utf-8?B?dStZT203QkpKNTBXcFhodGx5Tm02N2RIazJzeGFKa2VRQ0Vibm50K05aSDYw?=
 =?utf-8?B?anc2M21lMXVaUXFwbThjRTQwaXhwTVl4aSsrenB5ZjJCYVdMVWRzejhXQ0dN?=
 =?utf-8?B?OG1XR2NsSlE4MndVTU1hR2crdTY5T2RpakU3VjA4aTRsUzJHMU53cVBJUmdT?=
 =?utf-8?B?N3JyNzRyVVFBbGF1U1BzbUl6V0R3VHRVdWk0YUlXeU5CNnI4NG1kK09HcEM3?=
 =?utf-8?B?azV0L3ZMNzhQTGV5SnZXZ3ZsUEdkVm5oeUp2WVZNd1UrYWx4L1g0L2tQVlQ1?=
 =?utf-8?B?dW12eWdGeFQwTzIxRnFPRXZ1dGgvU09iWjI1U2JMeHdlZnZONHd4VUZ5YVFq?=
 =?utf-8?B?VGF0THhZckhkc1R4bXBDUngvS3FSOWJ2dXVzeHJYdGN5V0QyeWhOcVY5ZEUv?=
 =?utf-8?B?UGsycTlia01tNDFpUCt4cG1KTnhwYnlLYkp4Q0lOYi9yN3hscStxZWJVZkxs?=
 =?utf-8?B?LzJ6dEdlZWRtOG1tTktQRExKNnZNT082Zi9PamhBMTJtdUc2ck1mSjRTNk40?=
 =?utf-8?B?WlFja1FVdEVtV3lFL0V3bUdSZkZRYmpacVF4S1E2WENpcTJjNUI2bE1xOVJs?=
 =?utf-8?B?UytwMWN3VUx2VjlFWGdzWWdsOS9wL1JkRHV2em51QVEwVzJ2RFRXUzZHMHNr?=
 =?utf-8?B?aXcyR3Nvc2tycFphNXpTVEIrdW9KSkwzdjJHTEJXSjM1ZDlpSDlrWlV4cUt6?=
 =?utf-8?B?TU9TakZoMmF6RFdUTnZhY000WVFjd0hBblNhRGZqNkpoOXhBam9NOXVlS2pp?=
 =?utf-8?B?MjVUVG1OdFdwVDUxZmlVUjlnS2ZvR1RDV2UvV0piOXZvcWN0ZE1IeldlVXdv?=
 =?utf-8?B?M0dNRnk0NTk5UWkyZWRhYStzYlNIc3Z2ZC9oa0FtQ2t1N0w1ZCtrcmFFL0t6?=
 =?utf-8?B?UGJGQVQyM2dWcW9vVU4vTmw0Z2g4ei8vVFVJR0tSaHdqbDJzbDVhdzlsWnhs?=
 =?utf-8?B?OTBmOHkxU3RxR2lkbHVWRUNEdVI1WTZVQzA2UURkNkVHQnBMSldmWW4vd0ov?=
 =?utf-8?Q?FYYaLbM198a5oaqV2xTUGqEYvzWUpqNrnms5I?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 680f0aeb-51b2-4171-573b-08da2435a684
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 07:56:47.6290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O48cexixpxuQzkXVcpXtVAurL5Eh4OrfVd5aaZPpfKf1HjX1+VYlJ4Y+l19nJ5xGgbTkML/vlROZcg2MUfyWkRNATrNwyuX1xf5046vwzsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB6800
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
Cc: Open Source Submission <patches@amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

My apology, Krzysztof.

This patchset was rebased with the tag next-20220421.

And it was my fault actually.

I was using last revision's recipient list after compare recipient names 
with the output of get_maintainer.pl to make sure everyone included. But 
I missed that your email @canonical.com was changed.

Will be more carefully next time.
Best regards,
- Quan

On 22/04/2022 14:21, Krzysztof Kozlowski wrote:
> On 22/04/2022 06:16, Quan Nguyen wrote:
>> Added Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>> as I'm not aware of the email change
> 
> The email change from @canonical.com was 1.5 months ago, so it would be
> better if rebase your changes on more recent Linux kernel. You get all
> proper .mailmap entries.
> 
> 
> Best regards,
> Krzysztof

