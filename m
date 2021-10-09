Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9524279F9
	for <lists+openbmc@lfdr.de>; Sat,  9 Oct 2021 14:07:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HRP1s4hZJz3029
	for <lists+openbmc@lfdr.de>; Sat,  9 Oct 2021 23:07:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=sPRRS6y5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.243.92;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=thu@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=sPRRS6y5; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2092.outbound.protection.outlook.com [40.107.243.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HRP1M0lKcz2ypC
 for <openbmc@lists.ozlabs.org>; Sat,  9 Oct 2021 23:06:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SUY7bD0vsfC1zx2Cp7gyin0+dWdhBm6r+N/fC++QZcHbQrpjQNqDWfNCz72Gzfy7gi+fn+OYGRIdjas9+YNnuGLCVlW8yxCtVF9axmwQYrDqIiFsGaZuwqhCFcgJNDJXxZLmqEvXBGB024ePESaZXBbP6mxRM+ssw3hWcQ+XZG/ZTY9byCpP2qzyguhb9OCfYoUaqM5L1rIs3wwdJQFAE3N3xXT2LsVp/VTy/D/7EIN5srG+SNB3LAQDrfK8tGyxmF9uMzLgQ8hCuRWEjurYb8qrC4vUB/N3s6u58RtA9D8cHy2uuo6Eo6kY+SiPNC17XwvpMsglTiE9HnoViiOw1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZ6MH3CIH3vWaVRbj63mTAUoRTWrDKZYNA7ab+r+Oa4=;
 b=UwRLaKvXzWvHjVDb1OML3V7WMBhCNU5GbYM8DcC99pQu6eS1eRGpX9m7rjFzphrxKVIwQhC+3rOITqVXxeL0Dwc+lwO/lOEbBHuEiN6F9GCMI5jkOCrWc4VuVE6q1OVsbcr5MzUtDUVeHhTdjBhwvIikaBgciOT9x1u5elCSAjYe/Iou5G5Xh69u0xzf6MsZ3VFhlRre+LdX8OGRcZyxMYwN2aIsXtM23OSNA2FU2NBcW6M7Lgg5OqX37JoGlT/np1hhZbSfvSp2nsL63m0TzXM4Tv/AeFHFX46qfapVUGKbNed244SUCMrB9o9JF5QU/ERf/0ipKxfLwEzNS4TdoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZ6MH3CIH3vWaVRbj63mTAUoRTWrDKZYNA7ab+r+Oa4=;
 b=sPRRS6y5MauUr7og6yC4toBy7Y/3/MkDIaG7lY4F1zxjfXIgJgW/tORtYFudDQEQKPeDhAO43WkIOMfLdrt2vClkEWmIZLDi+cmZzD8O0O/NWXNYJrl5+eNXETAzfvt7I2qC3OQwYdFheV2xeEU8jw/FRkrn5hk4VKFT6n27o6I=
Authentication-Results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5145.prod.exchangelabs.com (2603:10b6:5:56::16) by
 DM6PR01MB5835.prod.exchangelabs.com (2603:10b6:5:14f::27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18; Sat, 9 Oct 2021 12:06:25 +0000
Received: from DM6PR01MB5145.prod.exchangelabs.com ([fe80::fb:2dbc:70b7:30f0])
 by DM6PR01MB5145.prod.exchangelabs.com ([fe80::fb:2dbc:70b7:30f0%4])
 with mapi id 15.20.4587.025; Sat, 9 Oct 2021 12:06:23 +0000
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ed Tanous <edtanous@google.com>, Matt Spinler <mspinler@linux.ibm.com>
From: Thu Nguyen <thu@amperemail.onmicrosoft.com>
Subject: Support PLDM sensors/state/events in entity-manager and Dbus-sensors
Message-ID: <3cb39323-c6f3-878b-9b99-444158777aad@amperemail.onmicrosoft.com>
Date: Sat, 9 Oct 2021 19:06:14 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SG2PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:3:18::16) To DM6PR01MB5145.prod.exchangelabs.com
 (2603:10b6:5:56::16)
MIME-Version: 1.0
Received: from [IPv6:2402:800:6344:422a:695b:6951:bf8c:cae7]
 (2402:800:6344:422a:695b:6951:bf8c:cae7) by
 SG2PR02CA0028.apcprd02.prod.outlook.com (2603:1096:3:18::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.21 via Frontend Transport; Sat, 9 Oct 2021 12:06:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 891577f8-21e4-48c0-6e8a-08d98b1d364d
X-MS-TrafficTypeDiagnostic: DM6PR01MB5835:
X-Microsoft-Antispam-PRVS: <DM6PR01MB5835185EBEEABFE80A27460C90B39@DM6PR01MB5835.prod.exchangelabs.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HV98GkxKaSvVaWgvNaMRDbjh8GRTSWfKkERpquJsGCdrTWQeQkxRsddRJYf0CfvtmM/PJmjTg5l+Pfqgjf/MqHHvR86xEIVbWwxaehg7jA/dafIMLtHMGJVb96p95EK+0AHzVirjPy415u/GNqoa5ckkyh6dyPZF9QUY8Fm5iSnmgTqP6TPvRsPfbCCJY+BDAEjXa6RoLgqViYmQRozKkpK/TUe3DVEJjyl2a2Me7fjfR4od9IpjXOfilfgLMy9orCg/624BAu0v4/lIdlexpYVr3SQpYMchXcr5O+5tIc13qflmfCjxhMFGjI/QQneJ5npwGZB8EJYxme0csQR3iwTUj4hGXcsAuUZ4gqiXP2NETKjm48+QomcpuJ3WotFjfMrSvWNN5H/eDjL01tgQ+aM/1Dt6PudHP04o9bKv+BZOAs5143aIapyFZnBHeyTvw3/hNC7uUP/EC1T2TukAt7tgSkUQat3cxbSWRnPGQqvqlEXdOzcjUkfol7HTq4lOxBMMoToBZcQz72CTYdjzrkXlPE7FSWwO/U2k07q2K2JmtUTB/B9SBoqxc/+nEhGlFajpUd/WpcqWgd2ugk+fSumoQ3WPlFf5p/YsDj3zSj8encalNTYlVoIE4cBXJwuRSGRhChXR3s2/n1jBIEyCuslZe4TX0BoQarkrjTumQaIJeiinm157hl3bLBSmLqi5OFMAX2mzyRQ1OakCIEl6/b0pCt9tbzg3xsHZ5OejF/tlAl2MrCDgY8Jit03pIH2xCe1ORhQAOBr26U5NdyekdGkOgqfmlah6xBXSGui4GA/wi+NzUabnj4zWZEwYcahX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR01MB5145.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(52116002)(4744005)(2616005)(110136005)(8676002)(66476007)(66946007)(83380400001)(66556008)(2906002)(38100700002)(31686004)(83170400001)(6486002)(508600001)(31696002)(186003)(5660300002)(6666004)(966005)(42882007)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wk5oR0FFV2duMGNjQ3BOd2J4Z2pCMU9mTFAvd1dZVkw2UVB2Q1RTOENGS0g1?=
 =?utf-8?B?citoUUFIRkFhdC8vNTJtM2VFdHlSWGxaRTc2bVJQQVpodDdmTVdmV1FnT3FZ?=
 =?utf-8?B?WnM2ZHFiTEFOa3U4SlhNRUpqN3ZDMVFZQ0RpengrdjI1Y3JtZzdJbzZJYzJH?=
 =?utf-8?B?NlNvSnBnOU9wS0J2Tk9rYWgzZkwzQ1ZXaUthbmhJMzAvSDQvTUt5aEQrSXFj?=
 =?utf-8?B?SDVOa0g2dE1jQ1pUREp5OUtxVjMrSDVjRlVKeUs5a1FMQlByYlNGaGFyQUt0?=
 =?utf-8?B?RjVESE5JTXN5bVloUkRtYzEvN1dkTVZyVmMyS21oTWxsdVo2N21zb1NXYk9J?=
 =?utf-8?B?MlFxWjRnM2F4em5PMCtyaGhYMHRMeTU3SS95Z2srVTNVcDJzK3F4ZytkSTQ4?=
 =?utf-8?B?MjFQWnloaHZsOGJiSnh3d0lEb3A0MVlWK0FGdHdYSWw4QVpBVWZkWld2dTQr?=
 =?utf-8?B?S3ozT2d1bkN1T3d0QmdBQXprQWUrcHlnNnJQZHFycWRaT0twTGdEVUMwN0pl?=
 =?utf-8?B?eHJiZzBaWGtXc1AwNk0xWWNlV1Ywbzh1aEowbm14UmhrRTNqS0gwSWdhLzQz?=
 =?utf-8?B?VWU0MEI5Q0d3UE1nempyYUltajRsaFJONGNWTXF2Zmx0dkRNSGpDUkRMY1Fh?=
 =?utf-8?B?N0RDMTNTV1N5UXFpOFBYSTFJRkR5SnBFeVVsbzVwVFRLVW04Um5OeHRqb21v?=
 =?utf-8?B?SzhwU2lRNmFyM3dDTEM4UkR5K2xDbVY3a2NYSCt1TnMwZzJ0cHg5UnNvUVl3?=
 =?utf-8?B?Z2VYbU5MbDJyRmNYaW16OGFSd3ltOEQ1alVNdmJsKzF4d3VnZ1N1MVVTV3JO?=
 =?utf-8?B?eFJLZ1dFZGFWOG1adzFoZ2QrdHI0VVBqQUlYMHc5cktyZ1FSd0owdlBzdUZw?=
 =?utf-8?B?cTBHVC9ycWw2WWFud2JCNkhQWmhMZkxqR2tBYkZWVGRRMnVQUTFycG03eWdw?=
 =?utf-8?B?US8zRUlJTENtWkcraGFHUDBVbXdzZ3pWWFFubGRhVndIK0Y0aXRWbkpHZXNQ?=
 =?utf-8?B?ajBQV1pyQmY5S2RrZFRGVUhMdFRPVnB4ZG9qenI3M3JvR3YxTWpVcHFCeCtE?=
 =?utf-8?B?UkQwcXppbzZMYUZ1Tmh3N3NkMkpYQkxyb2Z5aUNwR2s1NVNzOXZZVk81UVpX?=
 =?utf-8?B?dnlxTHMvVWxIb0JXUVBQQVlWbzFMclJ3UmpVUTFYTUh5Yit3cXYrVFEya1Ir?=
 =?utf-8?B?cU9JMWFCTUlCT1ZPU1NPSEpicUd1WDVmQnRuUVRnYXNpWWZWNnZHSWp4RkZY?=
 =?utf-8?B?eVFIei9NaXhIU01pRFJ5V0xvazk2dkNNOGVuNU1wNGF6RGk1WXlpMWdJWWpK?=
 =?utf-8?B?Yysyb1R4N3lVOFJ6S2kzczVlbXROYVIvZ0t4Z29SU0cxYXBUYmpGZlVyN0d1?=
 =?utf-8?B?NWdKMmpxdS81a3YreGFqSGgwR3l6Q2FmaWhGNWQ1OVU1bCtyb0QyZHNyNTBE?=
 =?utf-8?B?WHVjMVBMQkRxNjFCYzZJUCs4MEZ6cTdRT2JPOWk5MjJISHMvOFVsekI4OGhl?=
 =?utf-8?B?LzQ5amdhUkQrcFRqVExuT09tYkhVQVNWd2FhVE0yQ3RVYUIrVkhzQ283UWUw?=
 =?utf-8?B?a2V6Y0VCU0JTdVRQbnhKY2tUT0hwc25Kb1NNVE4xTStqT0I1dTg3dWtZd0Jx?=
 =?utf-8?B?cURCdjFoVFJEYjUvVm5OS0JUMi83ZWJCKzVtdWFick9HR1QySFFXVEZrZDFS?=
 =?utf-8?B?emI0NU5vVndicmFQKzhITkJFWWxxSGVOZXAvdTRGY0JwaklmS3FYZlpqSndH?=
 =?utf-8?B?b3pZdnBFV0xaVXZOWExTYTRjMDdFZ1dDVzB1blFESFVNT21VanZuY1NRb0VW?=
 =?utf-8?B?UExYY0Zxd3VpS0NsOGEreWZqY2RVR216YkxDS1Q5NEFsL2g3UEhpeFVJamVP?=
 =?utf-8?Q?ATy4iWE5gzBmb?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 891577f8-21e4-48c0-6e8a-08d98b1d364d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5145.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2021 12:06:23.1911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gfnRVdT904pT5xSVRpG/Nvvz75e56ScZSOFzfHZhySPUdrMIUqOmgXwP4546lrD5qmcOWT8EXJKcE3+pYjKqghLjWpTtrLcrKSCaUI7UL6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5835
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

Dear All,


In Ampere Computing, we are starting on supporting PLDM 
sensors/events/status in openBmc.

Research the openBmc specs, I do not see much spec about the PLDM 
sensors/events/status.

I only see PLDM stack.

https://github.com/openbmc/docs/blob/master/designs/pldm-stack.md

Do we have any others spec for PLDM sensors?

Do we have any team working on PLDM sensors before?


Regards.

Thu Nguyen.

