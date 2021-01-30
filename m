Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E403091B2
	for <lists+openbmc@lfdr.de>; Sat, 30 Jan 2021 04:39:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSKgl3X27zDrg4
	for <lists+openbmc@lfdr.de>; Sat, 30 Jan 2021 14:38:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.102.118;
 helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=tmrdvOqs; 
 dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2118.outbound.protection.outlook.com [40.107.102.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSKfs26g8zDrfR
 for <openbmc@lists.ozlabs.org>; Sat, 30 Jan 2021 14:38:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=in/G4OMN27e8b3zSbVawo745qYJFFKvpfbK2CQSCGqk/cX98hj+EIcXK1zhqSCfKcsT/pCIDR6puc6/1zLlzDh0jW8aWS7w5irW66a1mGcRoSfGZLaxhJewkfRwp5NTDZp72rn39Cj8il27vsQwQzydVLVEpoiiU2jz2V68HH++vRaXIQpH2OZk8h8XiVJ/8H1k83b9BwqeeoCSVSuN+fuerfgk4fgQj4oiatd5nt0MuHT29spYiK7WRfbzC0Tx9vR7T546kMxtxxBzV8I/+SICDE5TlVpGSnhIzqPmeoXhAQg7f1YWWJKs5JkL3GonHyPueLQ8YlDsuo0UHssa56g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8/QpyHWlmzQoeV+5ymOMcOx4IYGtUpCcEnD2ughZoI=;
 b=j+jU/NrP4ECyYDXhOvwbvfgks4tvHdd4sJXI19BULW4CKCiRhGqeQvU80jm9eo/dDQ2/LL5Xxx35cJGtx9zpcatBERZSu163/S+Dgh5vfSmKc5B9tRs0Fqt6tMHB2slg51V0TmnNDXW8+yZ/xapHyZG3o75JIBuL/gYZsW0MiLYEANRPCgrslEkBxPDMe5HMLPG4gyrRDFu4BsDwsmn5DWBtVJm5Joyjza9eGDulJ+lkdfOLaNz9HIfAh77P+bkkVTO6O+0jjTXv1YhRxJUD2bbYqww8BfHrxciRQKg+6l5YbWJ7kdlIb7iC8j4+6QntTmA/mjEW/sKR8AbLXyp/UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8/QpyHWlmzQoeV+5ymOMcOx4IYGtUpCcEnD2ughZoI=;
 b=tmrdvOqsM5lXZsfYI7+xpyM/IGAqgz0oBeSNVr/EdN8JB36wrKNJRy8wGYZ1q/gBA/vmM2DG3EasleSaxn/A0SIONEC9Vei1rc/yoxdSQ4D4yltbMF1d77pa7EIgYJhjqJ7Aeg7YDvadUHLygnS/iG7ZLV5dBhtAsW13C4+VQdE=
Authentication-Results: fii-usa.com; dkim=none (message not signed)
 header.d=none;fii-usa.com; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from CO2PR01MB2039.prod.exchangelabs.com (2603:10b6:102:7::6) by
 MWHPR0101MB3182.prod.exchangelabs.com (2603:10b6:301:36::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.16; Sat, 30 Jan 2021 03:38:02 +0000
Received: from CO2PR01MB2039.prod.exchangelabs.com
 ([fe80::8077:5998:860:1210]) by CO2PR01MB2039.prod.exchangelabs.com
 ([fe80::8077:5998:860:1210%11]) with mapi id 15.20.3805.022; Sat, 30 Jan 2021
 03:38:01 +0000
Subject: Re: create meta-ampere folder in openbmc repo
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <d5302c4f-c0c4-0bde-2a60-e943a2f41788@os.amperecomputing.com>
 <0e2507bc-f8c5-85c4-cd39-4c603a729f4c@os.amperecomputing.com>
 <da62c090-c6a0-1844-cc2b-44846b83c89d@os.amperecomputing.com>
 <3eff5596ee50878be8623c021816977f42111ea4.camel@fuzziesquirrel.com>
From: "Thang Q. Nguyen" <thang@os.amperecomputing.com>
Message-ID: <96568613-294f-8a3b-9aa9-7918b5df2d9b@os.amperecomputing.com>
Date: Sat, 30 Jan 2021 10:37:52 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
In-Reply-To: <3eff5596ee50878be8623c021816977f42111ea4.camel@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [42.119.148.40]
X-ClientProxiedBy: CY4PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:903:33::18) To CO2PR01MB2039.prod.exchangelabs.com
 (2603:10b6:102:7::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.86.145] (42.119.148.40) by
 CY4PR03CA0008.namprd03.prod.outlook.com (2603:10b6:903:33::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.17 via Frontend Transport; Sat, 30 Jan 2021 03:37:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60e0cc55-77d3-498e-59e1-08d8c4d0718a
X-MS-TrafficTypeDiagnostic: MWHPR0101MB3182:
X-Microsoft-Antispam-PRVS: <MWHPR0101MB3182BDF39B12A05363E6590A8DB89@MWHPR0101MB3182.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ygPdw+P7ZGvzeU+xF7lk29k/6boLLMzAaBgxKiqPn+AJbH6WlEYtrJYgntvrFXi8OdF0oHCyXv/hOytPPQ6IJu444i9XSdQD/vOkAZgQBNK+CjJtFOxPUkznLROLnoIgws28wdF0f9cN92U/SFFkg8kc1B61v5aT1WRvSm6rc+9KVQtPmUTfsf2SuVpAM8YCnNGLlEgK7GLJyo013EAmOC62BgkUFNNOS71WfVz+kCAEqzylfWGaQrW1MbDQswSQ6mDAEtlWFe1CKyNiPh6dYx2t5USc0SWe3kTte4kwFn9AzEectfjarnE6Ea1iOsM8pMMru+9jtq7misIlWZ3KxnKPRR/xvbN54QL1o3uH+JTmYdwoSG6YqKSFgx+2ResIi7ozhRM92bN6pczZGvCBE3b9PuTaDvklnd29HYy2aKwkoFdgBlewGNWBi6x/twtmDwaqdO4EY8O8MLYRIP/0yuPuP0UEdGrCC0EQk5Sr7xucobNAVQ23YKbCHt0hBAZ76UEjNxfsnS2j5lmH0QgvSttgNLioUnrWgZJZAmbCC8oVJQ9xv7ZQApPtTXt2C3UOkL4RzLXPgnNto56MR65HznUZz+HyYcrnKlnVR5DZtU4W2677SSUHdrtzkTNhKFMs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO2PR01MB2039.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(136003)(396003)(346002)(376002)(52116002)(478600001)(86362001)(186003)(53546011)(2616005)(6666004)(31696002)(4744005)(26005)(66556008)(16576012)(316002)(4326008)(956004)(66946007)(66476007)(2906002)(83380400001)(8676002)(8936002)(110136005)(16526019)(31686004)(5660300002)(6486002)(41852002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L0svQ0xuOUpWTHFuTjNRVVptY2FoeEtkdmhlWTJBdUZveXgxTFY5QkJhRlAx?=
 =?utf-8?B?VWZHQVZQd0toNkcwWnd5RGZCN2RzWTR1SDNydmpKTkxScE5wTUVsT090YmhH?=
 =?utf-8?B?M2ZKdGlhVDJGeGI5RVJvUmtrc0p1V1ZpdWlHWGNya0x5WWFiNDVIU05mZkNs?=
 =?utf-8?B?emRSQjNENGg3L29KamMycU45cnVKOStYVmZhZE5iRHZ1Zk52dGZyZ3pIWkh1?=
 =?utf-8?B?eFJBV2JyenV4a2szT1J0dVBwOU1xTmc5WksvTkwvNkpvRmxySXBZb095ZEx4?=
 =?utf-8?B?T2FJcUtMTmk3VFBsN0VCV1JIMmdSMFNVUUplVEJFWU0rc0F4bTgxR2l2QTRo?=
 =?utf-8?B?Q1dlODh2MEdvQ3NROTVRbXo4ellERG9TK2dvdkZvc0pYR1V0Y2pNMjQxeTc1?=
 =?utf-8?B?ZmVvWmJ0bXRFL0xjVkJ4eE5teHEyZy9pZ0hVdjdwWnRyeHZ0K2U1MllRZThE?=
 =?utf-8?B?TkY5Q2dSd2tmeUVSelR4WHQwMWZubmR6QVJlaEtKZGN3b1hqTEllM0dlWWdE?=
 =?utf-8?B?OEtNYVVXVlFhZ0tSaEVLMC9aMHpMSzNsQjdWK1UySWhRSUhKTS9JMU5FYklU?=
 =?utf-8?B?MFZpVHluRmFYQ0w5KzdldDJOc1lMendLY1lOcEE0NnhVQTA1dTBFZ0hHTURK?=
 =?utf-8?B?VUdnZFl5Q2dvOHpydHM1VDlqczBuQ0ViUFFBS2NwK0kxYVpJS3FGRTNWRUNB?=
 =?utf-8?B?RkVTUE03OE9RNW5oK05WVDZFcUFjTmt5ZWlqK3JJR2hob3JEZzRBME5ldWVs?=
 =?utf-8?B?SkEzWWVzZktOb0lKQTd2TUtFQm9RS2U5VVlSa01OSXJpajJrcnVKNzE4aFAx?=
 =?utf-8?B?Ukt4d0tCelhSRFhONFR3aTUvd0h0TmZtOXRTcDQzUXJ4T1RZcWUvanpqZm5C?=
 =?utf-8?B?UEptRVR0TUExUFRLTjZFSWJtNGFjazZKR0ZtMkRtb2svekhscXEvSDUvU29J?=
 =?utf-8?B?UHZ3alpCVDRvSXNBY2x0WWJSRlR5ZGltUG9FdSswTXhDRVdvaXg4Sk5Zd0ta?=
 =?utf-8?B?cVRIcG9oNzBxaStSbEl1aGsrVEhhVUxVUnBLZlhYMTd1WHhPNDlLSUtXODhz?=
 =?utf-8?B?dGd0d3lxcWRNSmRrajRCTnFQN1IrelNnMUo2dkJ0SG9HNHNsS01IYTFYQ05H?=
 =?utf-8?B?MkxNZFVTaHJ5Wk01Z2gzWHdmSmxXSmVCQktQZ3BQSzJsaEluRytKa05FdWZU?=
 =?utf-8?B?SnN6aTJlVXNPUkpTT3EwaHgvZGNUZFVLUmlPeUFwOTN1YjRzVlpQYU1hK0k4?=
 =?utf-8?B?amxFM1hGQkg4YWZhS1lxMGZsd1BEOHhHQVFRU0V4ZDlWamVka0N0T0hYejF5?=
 =?utf-8?B?WXJoZkllUGdRS3ZUelBSYkJGMlhtUkN4Z210Mm4ySUgrT1ZmSEV2YTI4SktG?=
 =?utf-8?B?RGlUNzVNS2gzbHVzOTN1c0E2SGMrdUgvaDdTN0JnTm8yWFd3dXVtKyt4dzgr?=
 =?utf-8?Q?5Qxu8xJ6?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60e0cc55-77d3-498e-59e1-08d8c4d0718a
X-MS-Exchange-CrossTenant-AuthSource: CO2PR01MB2039.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2021 03:38:01.2877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tYkq/5vSP9jHXl6lA8u09qe8PeRia5MU/vZlwXf/2XUQp8KTAJ71Us3VdiCqG0gKwLWKn4OqvFB6TGYH8SK1S35DP1TsRgdFjCuMP9NetUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB3182
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
Cc: Lancelot.Kao@fii-usa.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 1/5/21 20:54, Brad Bishop wrote:
> On Tue, 2021-01-05 at 08:48 +0700, Thang Q. Nguyen wrote:
>> Hi Brad,
>>
>> Just a reminder. Have you got any chance to check our meta-ampere?
> Hello Thang
>
> Apologies for the lack of responsiveness.  This is definitely on my todo
> list, along with the request from Fii.
>
> thx - brad
>

Hi Brad,

With the change recently in owner plugin, what should I do with my 
meta-ampere?

- Wait for meta-ampere integrated to openbmc/openbmc before pushing new 
codes?

- Start from the beginning on openbmc/openbmc?


Best Regards,

Thang Q. Nguyen

