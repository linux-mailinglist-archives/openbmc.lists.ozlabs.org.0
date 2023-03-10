Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0036C6B32BC
	for <lists+openbmc@lfdr.de>; Fri, 10 Mar 2023 01:22:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXmvt5tKNz3cf4
	for <lists+openbmc@lfdr.de>; Fri, 10 Mar 2023 11:22:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=UIWmaxcq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e8b::70e; helo=nam04-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=UIWmaxcq;
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2070e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8b::70e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXmvC27H5z3c3W
	for <openbmc@lists.ozlabs.org>; Fri, 10 Mar 2023 11:21:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=klsJexdRyluKMiAzGHiElf8oHNeDPBb1CnaUiw1BIKrLDJkXx0P0yN68Nn21tLG+R4g3oYVVIvGBekXXo7Q3Ex/QOCOMnq1gK54mN/PIE/9UOUBQBipmF/c5bgPgh8AQ+a9/ca/lVZKI/WmJClxnfXwq+aG/vOPgIsK824QPgGRD5Gm6zx+vjK8WhriSjqvJ60ma43R7pPaB3fc0n/RCzz9UEpS3GFPQ/OmuWtTXVsUnUDYtmW4cvSIJCcvPEAdmN0HNgCL6ShEBcPpfFgjmJ0KsKF1P3AjnxGJp9OaNbR6DGpgjEXNmTA5GoEPgf/pOuNhyB5uV34/ijSPSBRjOGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljbJm0d0rS1NkyP1RTTN8bgHSUk1ay3pTxEzDhEQCzg=;
 b=O/obmHl577eL2e1dSdJwAEBqUvhxro7l9CdJpFXFviPhDvWIDJCaJ1wslgATxcKuSzUbdwI7MgAYEXE9JWMlWkKMU9JmNmMat9T6QpyX8hMKN6IM6T753htcVJg8HMJcFoBMITfSac66RoWrRqSXxAJdP/PP/Oe31P5EVQTNE5bF0ECcTkf1uOKF0+0LVfeQbc+chvKBKxvmGwGq0crbJEUPukcl4/Bj9iELYmBFPKcQ7bv1xUB1Kn3Awn7KUgztxfBBvATQfnsH+AZvuJibez0HSwsoBaEmkZnWpnVizpevyNV9TJFHv6l/HyvVr1BjbqMjEp//fzHG96u8tsKDVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljbJm0d0rS1NkyP1RTTN8bgHSUk1ay3pTxEzDhEQCzg=;
 b=UIWmaxcq8XYA9MoNsrAj6H8wRDmbZXpmUrysaOooDvtzxgGPSJU0y/VnZBmCAZNGODVTqOk5Fzc3GZsmwueX8v1ffIp6nRCfFlMMmJHXhXSaDQlu6UCwB5VpRI5XzX9gQ0qM8CCQcX98bp23KXt1K+O8ghL37xmazpzwsHqw3EI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 CH0PR01MB7154.prod.exchangelabs.com (2603:10b6:610:eb::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.19; Fri, 10 Mar 2023 00:21:17 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::ff57:42f9:7d6d:de10]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::ff57:42f9:7d6d:de10%3]) with mapi id 15.20.6134.028; Fri, 10 Mar 2023
 00:21:16 +0000
Message-ID: <57a36c86-3d17-88fd-2ef1-ee4adcea1ce4@os.amperecomputing.com>
Date: Fri, 10 Mar 2023 07:20:56 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] misc: smpro-errmon: Add dimm training failure
 syndrome
Content-Language: en-CA
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20230228092010.1863419-1-quan@os.amperecomputing.com>
 <20230228092010.1863419-3-quan@os.amperecomputing.com>
 <ZAoR9EnGBAwGaF0l@kroah.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <ZAoR9EnGBAwGaF0l@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::20) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|CH0PR01MB7154:EE_
X-MS-Office365-Filtering-Correlation-Id: 40b88339-3b9c-4e7a-002d-08db20fd5cfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	aWB5uRg558/NyLEOoMu/Uo6VcF+EnHY0eXpvhAw9NJycANXl3l/7LnCVg3BkOFjWqBOzPTOO+ra5EhHEO1Su3zR5jixoefbtUeeicKdll8qoWzOoCrUy2DwESp1AyGnRUFzDxmKYGgSYVD727XpaUWkXDe2n0a1GgYh05MO5LdT02+xnZGXNvBqae0t6g2j9NmCZnV5kgeodg6wajXt7PSSg5fgLWFt3hDaQtm4XHalwnhR6o+jaMHd60Xrck+eORZHnC3ZwhTzFTynUsMtWtMOpO+0ZT725IS8WqwuNv054pYWfY8M5rP7OBBBc1g6s98TBAwwjVuoMcGsSSe+sJY++s77O2T+9af0JHcn+YeYzI8Mff0thDqBcSbS38G4iqs7bpIQx14uMEVtOdROnwFTrVs/pskX9Xemy1M4cv9iA5nZmJ/AQVdVndo7Vr4ecwD4K3Uzn+dhqqAo82ePd7mcjeOuh/FRKVV/uWpIR+co1EOtRkp+3bvImdy4tE2CWmsGTNfxZdfdZolW+5BnIKpglgGe3BSiFA5d0qk6bVqPjq/5zOugwvZeAR5oiY6ZS3NnUex9Om9U3nM9t3VSqvQJ2ifNfdfyz/qz1Rs/2xo21XgKIRSnAgv96jxpylnJ84OY6Q0vu5WVec3ErzAevmHjp2ivny3QnUZn8Qr7yt/pvkYZieMsafi8mUj3Z6lHPXurHkllZzd+w5lV0/lE3GePj/NExO6K7Lt7hQTATQ5U=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(39850400004)(346002)(376002)(396003)(366004)(451199018)(2906002)(31686004)(83380400001)(4744005)(5660300002)(66556008)(66946007)(66476007)(41300700001)(8936002)(8676002)(478600001)(4326008)(6916009)(316002)(38350700002)(38100700002)(86362001)(31696002)(54906003)(52116002)(2616005)(186003)(53546011)(6512007)(107886003)(6666004)(26005)(6486002)(6506007)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?djdiQkpBN01aSTVTZER5cll2T1Q1RnFoRUdTYVlrSG5scDlObWhBclpCWGRV?=
 =?utf-8?B?d2lFOVFvYVZaaDZCTWZKZkJkQnBXRldENEkwdWpHL2xQNHNRTGpmb1lQckkr?=
 =?utf-8?B?cDZmWEVZRTFaem9acW91MS9vdmR3cFRrTWlFZUNoUUkwRTZtWjcrS2hjcUdL?=
 =?utf-8?B?b0tOYXBoVXFjVy9IM0JxcGFRWnh2aEprNS9FMzFsNzRHcWxGYzVhb20rcFdH?=
 =?utf-8?B?NGJxWGdmbWdENGl6RVBjT1B0N0hSejVTckpGWVJpM2thcVhQRitDZDFVbjNS?=
 =?utf-8?B?REl0elFMcXptejM1a1hsQ0VMOUVEWDN4OWZuOUNJRHpTdG9BMUF0U2xxZzJL?=
 =?utf-8?B?QURSVVNUdjUzMW5QbjlGYjFORlJKMitydWhxUU9UT3BPd0NiNVZ4T2MwLzY4?=
 =?utf-8?B?MGNzT0FvMklBOUhaOGdXTE1UcjN4VHlhaDMzekNSaEhOdGVPZ0hwZS9rT2V6?=
 =?utf-8?B?aEorZ1lyWGNoUDljY3Z0QTBZR25ISnEyajNDZFhaemZXTXVDUWdrbk8wSG5p?=
 =?utf-8?B?YlI0cGxHYldRck5SdUoyNFRIYjNBR3JtNDZLQ0swSzRuN0Rab0Q0VVgvUjVT?=
 =?utf-8?B?ZG41S3dQckRpTm5MVnRHYUY0NnJSVjk5WTdMb2dENGZQS1JIc3dPcTBGK2ZL?=
 =?utf-8?B?ckJDYzFSbmlLK2EzdmdCbjNDQW9yenhmVDg5M0dVbUMvM0NzTDkvTGJ2dC9Q?=
 =?utf-8?B?Y24vSHhTOUFRdDRxTEFLemFDRjJmODIwaDlmTktodDB4NytqNGlyTmhiWkxx?=
 =?utf-8?B?SzNxaFk1eXNtNDZ3dEJXNGMxM1E4NDhTdEUvVmJzWjN0NFRidFRkYnhka0Q2?=
 =?utf-8?B?WW0wdGdSWGxzdExLMnlPcmtqVUpIbW5rTmdJeEZLV2hGa3BHWWE3NHhiYTRO?=
 =?utf-8?B?YmJObnlVeU1wVEFBc3ZvdVYyVDZ0eUFHOEk3QVJ2YmJSYVRvbGt3NXI0ZVFo?=
 =?utf-8?B?SlIzbmFVYVJ5OGFlYm02OTBQaWgrak5TSHM3UGlpRlRxT3dPTk5wRUtwRzlF?=
 =?utf-8?B?WHpkSW1weWxoTUphd0t3YTRrYitZSkhsblRMTGJ6SU5teXdyUVFHTmhxUHhR?=
 =?utf-8?B?RTE3Q0pIdHd3N1NXZGQvTGY4cmxraXI5bHpQT20rYk5xMkd6VTQ5WXRWS3A2?=
 =?utf-8?B?VldVL3U3OUMrT0h6MU5aZlU5Rm5RQlZDcCtkN2plcjlkU1kyOGJVL1RuSXdi?=
 =?utf-8?B?cjR0Y25BUUpIQ0lGa1N6RUd5TStmRVBSOXpXK2NLM0FPNWQwbWloOThCaGNK?=
 =?utf-8?B?ZGtwWUYyUEdKaHJTY094S25vd3dOZzB4aGc5MjFnWlNPQzdPS3dXQnIvNkNI?=
 =?utf-8?B?ZG45eDBLbmlldDlFd3M2eFhUaTNQcEMyVG1oaXhER0UvVTg2RDlaRmxSY2lN?=
 =?utf-8?B?a3NGSTkvaFhtbUgrMFlLbWtPekRXY0dkVXhnRHUxZzR2dHNrL0ExVUU5Wm8v?=
 =?utf-8?B?anhYR0JJeTlvTDYybzhleXYzMTFqOHdhb1ZqUHBpOVpycHNCU3hiVE1FbjdO?=
 =?utf-8?B?OFVOQ1dqTWxweHFPTVYwRkRKWS9YT0dYaE80VlVlL2ZCZEhkUUpIR2s0OTNY?=
 =?utf-8?B?NXZOMjZDUHg5VFd1d2FHRDZtQlo1NVRVWlJXd1BVd1FKVnBudmJoS2RPekd1?=
 =?utf-8?B?bjFsRDNCSWxhMG9HdUhZdDFGeURmMkxmRGtXNlZlbGltMXQ0Z1MvUHhmQU0w?=
 =?utf-8?B?WjYvakxZUSs1QVZQWC9jR1g3VkdGU2lDRnlKSU5VZmd2ckNuRS9VSjJTVDMr?=
 =?utf-8?B?YktOQWxYQ2pxdk9hTmdoMWU0N3RKV043elordnV2UE5kQVVDVDVteko5UWNo?=
 =?utf-8?B?T0pCaXhicjA2QmNSQ0hNVG5IL0trc25pcVFxdTg5d3dQRFZlNFlmckJSZGwv?=
 =?utf-8?B?V1FSQXNvM2VHaXJ4b2RzTjVKYnVNbEhONVpGQ3lBSW5ieVV3TmNuakdqR1h4?=
 =?utf-8?B?N1JWR1RqLy91WE5mWXIvZGJaenNXaytGV2E2VTY5MzI1RlpJamxXem51eWh5?=
 =?utf-8?B?bkJCZng1VW5aeCtrOEJKR2Q4ZDN6b0pqRmpkRWlzdkkrNlZRTmxBd2lFVGIv?=
 =?utf-8?B?YmpIQWorM0V0VHRUS25WQjdmVWZKSlYyekpLNENBMkN4T3BaOXQzVmlNZU9z?=
 =?utf-8?B?TW03ZXdPYzVmd3lrTEtBQ080T0RKVnhDTHdTZzRvUjdHK2Y3SUxKdzFaM3d6?=
 =?utf-8?Q?f+ATAdwSkol0ektCApFgwro=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40b88339-3b9c-4e7a-002d-08db20fd5cfa
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 00:21:16.6290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5l+D0Jrg12QxdqDxkMYNPepdDNXIm1OWi16LerdOZ+ymrxuwDACnqY8TcjC10X/2oI9ZZfbNj1kmZ5SILOu+1SHCFHQpS4+Rg0unaNS3TfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR01MB7154
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Joel Stanley <joel@jms.id.au>, Open Source Submission <patches@amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 10/03/2023 00:05, Greg Kroah-Hartman wrote:
> On Tue, Feb 28, 2023 at 04:20:10PM +0700, Quan Nguyen wrote:
>> Adds event_dimm[0-15]_syndrome sysfs to report the failure syndrome
>> to BMC when DIMM training failed.
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
>> v2:
>>    + Change "to initialized" to "to initialize"            [Paul]
>>    + Corrected kernel version to 6.3                  [Greg,Paul]
> 
> Sorry, but this is going to have to be 6.4 now.
> 

Thanks Greg for the review,

So should I send another version for the patch with 6.3 to 6.4 correction ?

Thanks,

-Quan
