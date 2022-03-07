Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB06A4CF3B3
	for <lists+openbmc@lfdr.de>; Mon,  7 Mar 2022 09:35:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KBsGb3xbzz3bPD
	for <lists+openbmc@lfdr.de>; Mon,  7 Mar 2022 19:35:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Dscsku1G;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eaa::730;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=Dscsku1G; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20730.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::730])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KBsCN4n02z3bT1;
 Mon,  7 Mar 2022 19:32:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KyH5fLBlnQ8Qd76bGqZGKOudE5Ejb5ivIqdmYWMfaFizRrNCfHCitYjMjrWOnq44N/E3B86/Yg7TSF4Ckm26XTea9z75agMBdO1mevBbljiFiDqnxZ34GqWEqaFaH/FXJ9b6to3QbKcMesy1pjkFVboCh0upjPfYrst6pWj0OjYit8Jyeos4IEr1grsu88C+ByFDCgGnJ8xCZnyjsNiKsxfslYs+w7QdlgWQfHDwvI1rRYl1N7efBpo1OWTqmU0KN7r8f+cSQ2hG366Wtt9Cr7BnnC6v/nQmqsHGix1pJ2yLp8rswMULQcnCihfIIDk79wE+iZbZ0U1VrgUsWTcZ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ay36domTlTnIwET+Vh1YQcMpsJyz+dP1yZC06oysOrQ=;
 b=lW0blIFinDMCtFSh+4OJWoUUhQX9ye0WjJD1fNkOkEYTzoj15fR4N0OOQnfDhYWdowr0NIqIFtfj/NOaQ02CGuHs+l7H1JbDdq9Up13v8OZ6bRKM7MpnyORduZJiyjmfTFA1akE8wrZFZtjYs1qEX08qCAcVFeAVh3WDpndglncCV7TOQpAh4Oy/PowYYtFRE6GLeWxRBiwrwMeBI2NnkG1tFKEZsLqKFgwrx9qbhC+j2T/2TWS2OiV5kX3JfOW8CDTWwqMbsrJSO+IQxNspkZfT8iROeH17+K4yoBb75JVVwImx3To8ESqCaoOwRFtv9xVm+j1FLDccTU2OcBiG7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ay36domTlTnIwET+Vh1YQcMpsJyz+dP1yZC06oysOrQ=;
 b=Dscsku1Gl+1ofBaluCe0IQM1et7K09pTDB5VY6VrEYpfYymACx4NmuBBu6M1ivOmzRTNfClpOVmLqqwicRioRfM1bS8d88fdf6ebWxQqsW7XY6/j+DjrJzOHG0tExnRcDLrJAQttkumf9iBHF6xVGjKc/P5PPSIKWV44vgok8AE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 MW2PR0102MB3498.prod.exchangelabs.com (2603:10b6:302:3::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.20; Mon, 7 Mar 2022 08:32:22 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 08:32:22 +0000
Message-ID: <ab8c96a9-b064-f96b-9062-095ff8635ec5@os.amperecomputing.com>
Date: Mon, 7 Mar 2022 15:32:10 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
From: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v6 6/9] misc: smpro-errmon: Add Ampere's SMpro error
 monitor driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20211224041352.29405-1-quan@os.amperecomputing.com>
 <20211224041352.29405-7-quan@os.amperecomputing.com>
 <YcWFrCjWSG65KQgb@kroah.com>
Content-Language: en-US
In-Reply-To: <YcWFrCjWSG65KQgb@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK0PR03CA0097.apcprd03.prod.outlook.com
 (2603:1096:203:b0::13) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5186937a-acea-4657-e8f3-08da0014ffff
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3498:EE_
X-Microsoft-Antispam-PRVS: <MW2PR0102MB34987DDDC6CC29959E9E22BAF2089@MW2PR0102MB3498.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DtHYHAsf8xTr1wxxwY0ra2yDTFFzu+BRn3/ZLZvs5/N4mDWHP9X6bpQEMlWXljVffXxV6OEy7GO+jkbxNg9xvlDh1hBoGlKPP/rIdVduBDrhVZOvMifP0c2do/hZIDRVLGAKcBFnUfbMA33DvLKMn9zMrI7ZtMsAUC3oyX7X88ukKkZYTjYXKJ3RCDsLMaRg9uCYSYKaCp0LP9MSOZPagWYQh7ETRJVOz1F32K/N7ipq9UK9X2S8L2g8Mhqz8YtEm9aSLQX/5ND+aYzr+jTV6UpO5/sA2mGzNO/BIVz8tDNyknMAjrndNYeTLhQCPicWY50ndgQYRCd+p8OFs4Usl+EK7lmi414jps7sOjiZo0Ki//M4+pkxpwevoPCY8g+/bG6ZqwOv1f3i4SrCjN8iD65C1B7HRZyvuE5/Eby2jvzt4Z8r6uzC0vR467YAcc2GizD/Cto88mWe0L+Tw2wlpbK9aJmk06AvgCPdkGYv++PK+UWahpxl4VGZwjRkSweKx9/HEiF3SwQbaoSTEuxZTH1jQ1Vn8Gj1cqH+XFzrNOTWOjXtkulQlibE27+4CGfKvn3bvw6aKjGv58iPeJtYn9UbNGk9CAU5TZb0TEmKAaYcEcJ2S4OF0ZhbNrGu3zUC8+Ht48XN7JVgZkOIuYttvMqluaHQCQV+qrEnCbvaE+ZmRhjoPABOvNtWV0+rOQbzduzD4AgxSlEubB2ppznLKmwSwHH1TU1cDhpCm2GphIM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(5660300002)(52116002)(6916009)(31686004)(6506007)(26005)(38350700002)(8676002)(66476007)(6666004)(86362001)(6486002)(55236004)(53546011)(54906003)(316002)(31696002)(2906002)(186003)(107886003)(66556008)(4326008)(83380400001)(508600001)(8936002)(66946007)(7416002)(38100700002)(2616005)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0hqZnYzcjRwUjdkcFNxZElrdnNOM3pTeUxxTHJDREF4S1VUSU15eVVYV00x?=
 =?utf-8?B?UTJyM2htTFo5YUhWRGZiQ0JqUjhLL1N0QWh1czRzbHN1UG1wdTJhWS85Mm5q?=
 =?utf-8?B?VEdwUm5ZZDBXRHN0QW90S2dHRTJVYnZiSUI4V3pSdVllK0V2RzJSNWZ2bkwy?=
 =?utf-8?B?bFBWbTRyVU9UWUhXVTdTM2laMmI4OHp0OC9ZamZYQWs1SStrdy9CLzA4SGhk?=
 =?utf-8?B?c2hPcXFPcnd4OHl4d3RKV09QV1VPaForTHRYTkxSQXdSc0xhZElvV1dvK25J?=
 =?utf-8?B?NWxGUEszSlo3S2tROCtYczNRSEI3Ynh5enlQN3dqb0hDUFkzdDd1NHBjR3lr?=
 =?utf-8?B?eTFCdm9hQi85cjJ4NnJTdHBNSE5ITU5NdWRIaStQbkIzYjZ3ZUVzc1V3NVJJ?=
 =?utf-8?B?bHUwL21tTUFCTk1TSUJyN216WEhrL2N3UGxweUQrRGZhNlhhNVk3V3dnTWZh?=
 =?utf-8?B?RzZRQktoSk9CbUlHUjZPSHYrakFWOWwrTTM3UWVJTk9sUmRNMG5OMFRxZ3Q2?=
 =?utf-8?B?RlJNNWpMTFVXMVptZXRQTXdmODg2VFNSMmd3eHdnNG8yL1l3MWczZTJ0anho?=
 =?utf-8?B?VkFNektpOFZpSFpkOEZCeWxZWW5WZ3lPaXJEUTEyYmFvdi9wQmF1YkgyWTBZ?=
 =?utf-8?B?Y0NlaUR3c1BpV2JKUGVpbHZWdk1xOHcyZjNpNFp0RURnZHFYeFE3OEh3b3hm?=
 =?utf-8?B?VDFvYWVGRW1kc0tWN2tIR2ZKQWptaFJTa1VyY3J5OUx4MzZGMnFXbVVNVlBK?=
 =?utf-8?B?Ull2Mzd5ODg0WlRTZXc4ckZkU0Ixcm0wNDZoeUJGN0pHZU9Gck5aSm91dWdE?=
 =?utf-8?B?aURGTG9RNFhTaU1oMEVwaTJCYldObFlCV3Nid0pEYUduZjJTTG5haWl0T002?=
 =?utf-8?B?RUlPWXAvL0FTQUZRb1QwNEVtOVpDZ25BOFhaclVadGN4THBEWnM1THAwU1BY?=
 =?utf-8?B?UE12OTFCN0lZaCsvQUhlVHJmOS9ZNmFWUVQ2UTRUOVlOQjFMNExmQW12S1VN?=
 =?utf-8?B?SlFvRDhSOGUyS2FEMXpZaDBSQWlYc2wrR1pqVkFRMWpobFlacklFUTNpM3ZN?=
 =?utf-8?B?d3JScjgzVXlDa0RTdE1nV1p1dnhwbytjRWNqWmtRa1BvbkJibEN4Q3kzdi9D?=
 =?utf-8?B?S3VhTWZaNFZuMWJmM204REZnVEdZeTFXdEp0em9WMVh1NEtUVlphRmJQckJE?=
 =?utf-8?B?THBKZHRZR1dNTDdpUGNUK3N5NXhaZ2FQajk2NCt1b2dEKzFKdFJPUTJMa0JQ?=
 =?utf-8?B?RFhsSEpKbTA2QkJTVVVTK2hlOFJsM0laZ054VnpHWHQ4S3lwd2ZNYWVIREVq?=
 =?utf-8?B?MWRZYWh4YUVoNUlzVHJrMWJLS01QMWpDVW11VVN1eDZ5UTJqSlIzVHRjdDFS?=
 =?utf-8?B?T3Ewc2hMMkQ3ZHVBVWZoeDk2SkJvSHMwN3B1clNHWW90SGExMjl0YjlBc3hm?=
 =?utf-8?B?K1ZmQmd2Vm9YcWRPbXl2eVpvYlVFQUZyVmp1d1c0QjlSdk5ORjhFL2h5TW9U?=
 =?utf-8?B?MmhpYk1YVnh5M2dpWDRlZUlsOFBLOTJzZTBRdEJEZzhMMEhhcmtoOTlGcHlN?=
 =?utf-8?B?Z3FJZDlDcGVMQkV4SUxTcGpaRCtMd0tJVk5OVCtLVG1YRjRPajFWSmZGMlE3?=
 =?utf-8?B?MjRpWFV6azF5T3N1dHJhZTBpcUJsMkFuUnpjNHEyWDNDNWI0UHVIMGQzdFZW?=
 =?utf-8?B?Y1d1SHJla1ppNUxRN0F6V3JmM25ZQ0RXNmZUSFNvdk0veVp5Rk1JZVEzOXEw?=
 =?utf-8?B?Nmx4dytBanV4bitWU1dmamJWY05pNkswSmEyRlpNdk1Lc1o4QzdONWUydHZQ?=
 =?utf-8?B?cnJIMm82VkU3K09uUUxZS1Q0NjUwTGx0Szg4d0hrZlliTzlXK2NoaHJNRzd4?=
 =?utf-8?B?RmU1VkVtbFMveUdKdmFVRWF2bGV2aDBjV0t5Y2JtK0xFTkM2V0dEMjh5NmVC?=
 =?utf-8?B?SU0xeWRTTmtIYkZxU2lRRUUxejFDQWZnL1lQYnJ4SVZRbUNERmN5T0pqVXNm?=
 =?utf-8?B?TFpUalFtM1ZHTFRlbU96Ukx6UCtiWFZUV0JFblpFcmt4SDVjWDFTWDVBYmx2?=
 =?utf-8?B?ZXB2VEFQTFEyOGVsRFdnWkVoaUVUbUtuOGpkVUlIUzUwbENrSVhnMDhFdlFO?=
 =?utf-8?B?Z0xsNGc4UDFCb2RpcVNUTmt1RUFISisySDV3Zis3Mld6aHRWdmwzWGhvZXVF?=
 =?utf-8?B?ZWl6WlJjZDVKaVI3R0xab1VxNytoYmk2TGMwcHVJQTNrVlR6bUMrSmwzZ2hl?=
 =?utf-8?B?b0RhRldaaGlCbUF6bkxQWDZZTTFRPT0=?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5186937a-acea-4657-e8f3-08da0014ffff
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 08:32:22.3934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: juju/3QgeCQCl9iqMAd6TRdaT7kSPgHIaMdnRBjM+G6S0JMkNSuiFi8TcTYR4xepyRdpd809xvqtzHZzpA/1QsMbxcZZqeivSpugkEJKclI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3498
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
Cc: linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 Phong Vo <phong@os.amperecomputing.com>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, openbmc@lists.ozlabs.org,
 "Rafael J . Wysocki" <rafael@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Derek Kiernan <derek.kiernan@xilinx.com>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Arnd Bergmann <arnd@arndb.de>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Rob Herring <robh+dt@kernel.org>,
 Open Source Submission <patches@amperecomputing.com>,
 linux-hwmon@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 24/12/2021 15:32, Greg Kroah-Hartman wrote:
> On Fri, Dec 24, 2021 at 11:13:49AM +0700, Quan Nguyen wrote:
>> This commit adds Ampere's SMpro error monitor driver for monitoring
>> and reporting RAS-related errors as reported by SMpro co-processor
>> found on Ampere's Altra processor family.
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
>> Change in v6:
>>    + First introduced in v6 [Quan]
>>
>>   drivers/mfd/smpro-mfd.c     |   1 +
>>   drivers/misc/Kconfig        |   7 +
>>   drivers/misc/Makefile       |   1 +
>>   drivers/misc/smpro-errmon.c | 571 ++++++++++++++++++++++++++++++++++++
>>   4 files changed, 580 insertions(+)
>>   create mode 100644 drivers/misc/smpro-errmon.c
> 
> You need Documentation/ABI/ updates when you add sysfs files.  Please do
> that for your next version of this patch.
> 

Thanks greg for the review,
Will update Documentation/ABI/testing/sysfs-* file in next version.

> Also remember that sysfs is only "one value per file", this driver seems
> to violate that in huge ways and is not ok.
> 

These sysfs's does not return "multi value per file" but a single record 
of data, one example is to return the 48-byte ARM RAS Vendor specific 
error record.

Thanks
- Quan
