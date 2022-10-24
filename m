Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3237B609ABE
	for <lists+openbmc@lfdr.de>; Mon, 24 Oct 2022 08:50:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mwm0b5tnpz3bkx
	for <lists+openbmc@lfdr.de>; Mon, 24 Oct 2022 17:50:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=BgYE0ZUx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.93.109; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=BgYE0ZUx;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2109.outbound.protection.outlook.com [40.107.93.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mwlzz0mwhz2xy6
	for <openbmc@lists.ozlabs.org>; Mon, 24 Oct 2022 17:49:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+LZeTm0nRZkQlhqmSpC2RNzPC/1rqpIPmGA9ewqS2w9aDPMWDLVVRwirrjuXDne1z7GLOG+ljNBH01yIKY1Wy2z1GbFdEBbVb7eOQvXaCJao4CioB66CZOk359v0dUNSmD/9KE/QSNRIOsih9pdPdcJEs6jvMGfACzZX3pC/y/1bmIBdj6HtIx37CGVKX9zwThgDYJvAFgn1owVL8lXyQXDaYfEzMl8UYP+a/HhuUnA2q5ck3p6+4bauV1R5h9muxE5YExkqe8UFD4jVQ71wcv0AX+aZhecMxObUHNPJTme9CZlhNj2U2uzSRWgKg2gLi7DxSMb8IMgHex9EvUlFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ccNJD5kHhOvnBxjHcoPmHvRtc60w7kb2BHYKaB/ywk=;
 b=aeeb3wSKZqPqlPEWgLLhMEh46EhX3o3Du5xIBBJA1FHCtDhV2OGwvAI9shdFXS+Qj/l8Mcn3KQZaIkEPh8lF0LdBCMOmPHM+EMATqcHb4pIoyCKMzurkPp/P5myp5bAJpHPiGueDpF2xk004BVRUwWnNJcyRcX14hOmIoSnSrpGQ2X5X5EwX2nB8vhKolpYSA1VDaCdU/bOafSgh69rDz+w93SjHmTR5NWfVYr9SI0VNqLHM0YqBoxH4fGil+II6IVafZGsE8FnzT7+GQrMIcqswD0V+QHwyccik4ki/535t3W83ClYVguoxS6XHoX6haYVVWz51djxkzaPpLV2v0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ccNJD5kHhOvnBxjHcoPmHvRtc60w7kb2BHYKaB/ywk=;
 b=BgYE0ZUx58gZvYvXc1nfHXaGB6A6DYNYyiqKGSuwDMyWyqraN7cEM1l++n4HRB/ihKm5iC9w5PAyn5thjSw+WAu7CTq1RDtIQ1WH6mS6FyQFSUg2cog7RnSRaclSseo4T7Dz70FNayyAOe+MKVRYcdZTOvv1xUSqr0hAInFSxq4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 DM6PR01MB5865.prod.exchangelabs.com (2603:10b6:5:206::30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.33; Mon, 24 Oct 2022 06:49:13 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::ebe2:243d:ff84:aaa8]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::ebe2:243d:ff84:aaa8%3]) with mapi id 15.20.5746.021; Mon, 24 Oct 2022
 06:49:13 +0000
Message-ID: <86025034-488a-87f5-abb5-825398a2f094@os.amperecomputing.com>
Date: Mon, 24 Oct 2022 13:48:56 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: ast2600 i2c irq error
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CACPK8Xd1mvUqk+=dP6UfQdNECBLXMfX=5-M_TCKW+mKMOh3MXA@mail.gmail.com>
Content-Language: en-CA
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <CACPK8Xd1mvUqk+=dP6UfQdNECBLXMfX=5-M_TCKW+mKMOh3MXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0238.apcprd06.prod.outlook.com
 (2603:1096:4:ac::22) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|DM6PR01MB5865:EE_
X-MS-Office365-Filtering-Correlation-Id: 80d99685-1de2-45e2-3438-08dab58bdcb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	QLMWxu5TKCiSdMa35QCnFR+tfJ/NX3B5vnzDbi9oYVTjH6qbxYFi/U2i1mIFwuSupZb9HIp4OJWGqwn7+f5KbC1gd4FMYZWy71MEmsqDTmfWGyFK9AFHJhWxwt1+H7g4c7wGxUPiVZ/y+apbSGJiF8BuSUxBZmFxeiJeRA5+BxPctMMIWogW9RUl3W9owSDWmdPwC0Q1Wk3vTvCaThy9M2E/SI6UHyNYwB6RJkyAU7Ecu+MscyGCkIytMdpqxV3tlcGlwmuQqhC8w806nDQOz/PjpEGrVA/fjlZ0NKBE1+QrOBQnA3jynSByM2LeXONEsMeGfXJXADV+ctNF4Y2zOJCUeyliWwYp++iBAJwCRRXmY78pL9dItOGhRm5GZLR0V8CBFabF1utkz7PHWcrBlTvmofJ3CtwIDrv+FwdLQaPiD46Y2vgl7FMRPvGEJP/sFyhKWpr6Lg0+qr/pNpuNPxromLwbq2JR9idMTNQLfiWHbQ+jPhkEwabzEnYwLn9ze7Gcp5SOgGq0ol75Glvd0cpyop3Fh/D0rrokoMP9Jihdbw5A9+L0Q7M7NJcNenAyR0WgEOrHCW7uDIFd/dyRewToniDEqlFbl3Uji1wJfhwpvqL90mWj0pgt5oq1ZVENdYGa7i6C222Fdz+y3C3/jjOiw0j4EdnTnqf8+eRLz502uQxlsXrcbl50D+XGF/MRLavLU/9FuwllsjivpRKqF5qrWcRR4aExI9WV9XxvoEr0bTcamCJzhmErxAofFiRrHmbZPqm+f4BSOhKI5bWf+aANxN9u3sf6No8XCcm8LHwXZq+mdFPLEddAua0ikIxi37LLEeVIwU/vMStjxgKLZyEHLIshxvy8fXCipHYjuuE=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(39840400004)(366004)(376002)(451199015)(478600001)(31696002)(38100700002)(86362001)(38350700002)(6486002)(2906002)(41300700001)(110136005)(66946007)(66476007)(66556008)(8936002)(53546011)(4326008)(966005)(6512007)(5660300002)(316002)(26005)(8676002)(52116002)(6506007)(186003)(6666004)(2616005)(31686004)(83380400001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Si9kbjB1Z3V6cGhiNmpjRXhTS2pwTkFTVERnMk5JMUhEcFUwNGtCb2FLN3Mw?=
 =?utf-8?B?RVdnNTRROWxTamJlbjFiQW9LM0cxaEFPbWNLOFdJNFBUV3BUOE1JMTdyenBK?=
 =?utf-8?B?ZW9ueWYvdFZqOURRNHRHVW5vVkZaYkttaUsrSENCdWhUMDQ3WUdlWVBsN0R3?=
 =?utf-8?B?T3I2UU94US9QSGJtbjB0bWZNejZmeHRNOXBuVVpLbDVvYkJYTUdvR29IL3pG?=
 =?utf-8?B?d2w3WXRDRXZJVUpRb0ptOG5oTGlWbE16a1ZicTBEc3pFUjRGVXM3ZXJ0dDdP?=
 =?utf-8?B?TkwvUjQ1YldZODVhWUFvLzEvSXBXckUyTGh1NDNKL0NDVHExZmo2UzNZNzRD?=
 =?utf-8?B?L0owLzdsbk9xc2NPb3lmK0IxS09IZ1gvWFFBNHUzakJKWmNMVDhXMU5XUDgv?=
 =?utf-8?B?Q2hEVXhITGlhSm5xWHNFQTJ5MHdpQkhlNGtDbzJRLzNBbXJIU1lXbG5uM1JU?=
 =?utf-8?B?aytvajR2YlQ0NnVCQUNYR3FXMEgwTzhVOW9lY2s2MmNNZDlZMG1Zbjdrckhx?=
 =?utf-8?B?S2xvM2VodHk4U2h4S0pkZlEyVWh2dmJiTGxnQTBjUGpCV1RQOTFWK2tTd0lM?=
 =?utf-8?B?aGVSeEZjazJvTVhMbkU1TFdJL3ZMbHZWcHhBUVBRTjJJVTVsd1FkN2tya0Rn?=
 =?utf-8?B?cnpxQ3RiY3pxc0JES0MvQS9mWm1HMkI0c0xWZE9aSXdlKzcycjYzZkxudisw?=
 =?utf-8?B?TjNvTjNlN0N2VVp0ZVY2NlZ3alpmU2YxZFIydm42cWVISkZ1VlM5RlFjUUp1?=
 =?utf-8?B?eEdRK0FxRTkxd010NUNtL3p1akpOcW9oUnJONitnd25MWUNVTUt0UmsvdFFY?=
 =?utf-8?B?aE1oeDdEY1FZcXJTcEpjR21mZmI1K2FqdWMyWXE1bzlCbVphMkhoSEMwczlK?=
 =?utf-8?B?bzFuQ3REd3k0cFcxR1lpR3dXbEdlekRSNnhpWEFJYWZWLzB3Ti9adUhwci9q?=
 =?utf-8?B?QXBwWXNudE15YkVVNU4rQnVvaU5ucW9DekVUV0F6Um9iRDJhVnppN3VDcmtw?=
 =?utf-8?B?d0ova0RSc1M0U1pZWDgxZVd1eTNzeWx5amRqeHg4TTlUREtyODdIYmI4OXB5?=
 =?utf-8?B?TmZmNEhIeU1HWHJydHZQK1JoS1NaTUd6ektqM1NHZjFJQnB4ZndSWFpkOHhu?=
 =?utf-8?B?QjhTM2F6c0lzaE41NU9GVlJ0REZRZWVxWmJrMGFxeXlSMGI0SkVtZ3Q3V0U2?=
 =?utf-8?B?ajF3NUNzTDR6SGloUXVTQU5pa1ZYWHZLUEI5ZkdTbWxxZXBrdkdtc1U0YkU0?=
 =?utf-8?B?Wnd1bnE0b2NMYkRrbVRMSmZVVjNOWStFYkhVQmlVUUNtdE9jd1hQNjdQWlc3?=
 =?utf-8?B?OE1KQUoxRnZCeFJZalhmdHJ1bzdWODNueHY1QUJpdnN2ZlkvdG16UVFidllj?=
 =?utf-8?B?emNUN3ptbXE3SzV1aE40Nk1sSFdxdnp6N3BYTEJ6TVRyNm1qaHkyM1RXTTJa?=
 =?utf-8?B?NjRjdVBuKzZuN05tUnRTOVkrODFWUytDTUtpZWNCNVFSTW00VXJpS0dqRHlH?=
 =?utf-8?B?RDM3WE1lYnFBckJ5NTVseFhmblNxckFSTkgrMVBETDh2TlpYTHBqVWtsVU8v?=
 =?utf-8?B?d042d2I3OW8yUjU3TTJBK3NnUDVONU51M25MNVE5eVM4SEdkaEF4VEdBcUcz?=
 =?utf-8?B?NjYvbkVsUW9OZlZRcURsL2YvWnVib0FNbE9FRDUxa0xURndEUWtSMkprRlRX?=
 =?utf-8?B?QnI1WFU2eXpQS3g1Uks4a2R0ZW9UWThpdXVaaEtJU29ybzdwclpKVUE5WVlY?=
 =?utf-8?B?QXNVbmRtNlZrN0xGVG93cVZHOHVWUVVHUGZ0S21sT1BwMzg5WGkyT3poYkFk?=
 =?utf-8?B?SXVuUmdnOGJ2b0l1SHB6MzNxcDh6T3BNdUd0K0ZtZUZXVkxlQzhMZVRWRGdM?=
 =?utf-8?B?cU5LUkMyOERYNmtIWERxZnRxYkpCRWQxNlpqdm1lV3BhQ08vbWdSNU5yTmRZ?=
 =?utf-8?B?Y2N6RDVkdWJNZVptd0dreWRwUTJ6RFJjZnBnZ0lvWVYwNlFsd0hZdjF2NUpi?=
 =?utf-8?B?bzRGV0NhdERoMUhQUWF5WDE5RCs2SHd5bDlQR3JqWmVDR2NaVW5xUiswM21H?=
 =?utf-8?B?MlZLS3JIazMyak9jWi9rVkFlL0lMM0pFSWFwM1FCNU1KMUlwdEh5bWlHT21T?=
 =?utf-8?B?eGdRbFhrR2plSHdMb29qVlhkM1dRd2ZseFlMazlWZFBSOGJFYWRjYklWUFBv?=
 =?utf-8?Q?2ZdFWzNA/qJyaJ8Vo5aAQfw=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d99685-1de2-45e2-3438-08dab58bdcb5
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 06:49:13.5540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Lx+Nyj2PO5cZjRdxTGsBMgMjWL0gr4HHOoS8Jt1G3hnqACS5LTC5a+SgHaJQCBiRms0ZH0PkvbecYcjQMlgeM0DZhUdWeBwPlc6WVidPAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5865
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
Cc: Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,

Can you try the patchset [1] to see if any improvement ?

We tested with these patches and they look good. Graeme has also tried 
them as in [2].

[1] 
https://lore.kernel.org/all/20210616031046.2317-1-quan@os.amperecomputing.com/

[2] 
https://lore.kernel.org/all/72c8a5bc-830d-25a9-0528-5d428dd9f163@quicinc.com/

Thanks
- Quan

On 24/10/2022 11:02, Joel Stanley wrote:
> With the 6.0 kernel I saw this on hardware:
> 
> [  205.644781] aspeed-i2c-bus 1e78a800.i2c-bus: irq handled != irq.
> expected 0x00000021, but was 0x00000020
> [  205.669842] aspeed-i2c-bus 1e78a800.i2c-bus: irq handled != irq.
> expected 0x00000021, but was 0x00000020
> [  205.694814] aspeed-i2c-bus 1e78a800.i2c-bus: irq handled != irq.
> expected 0x00000021, but was 0x00000020
> [  205.719805] aspeed-i2c-bus 1e78a800.i2c-bus: irq handled != irq.
> expected 0x00000021, but was 0x00000020
> 
> $ bitfield G6I2CD10 0x00000021
> decoding as AST2600 I2C interrupt status register
> 0x00000021 [33]
> Slave Address Received Pending: 0x0
>     Slave mode inactive timeout: 0x0
>            SDA data-low timeout: 0x0
>                Bus recover done: 0x0
>              SMBus device alert: 0x0
>                        Reserved: 0x0
>                        Reserved: 0x0
>                        Reserved: 0x0
>                        Reserved: 0x0
>    Slave address received match: 0x0
>           SCL clock-low timeout: 0x0
>             Abnormal start/stop: 0x1
>                     Normal stop: 0x0
>         Master arbitration loss: 0x0
>                    Receive done: 0x0
>         Transmit done with NACK: 0x0
>          Transmit done with ACK: 0x1
> 
> I think it was happening at host boot time:
> 
> Oct 21 03:03:20 ever9bmc kernel: aspeed-i2c-bus 1e78a800.i2c-bus: irq
> handled != irq. expected 0x00000021, but was 0x00000020
> Oct 21 03:03:20 ever9bmc platform-fru-detect[587]: Failed to read
> block data from device 0x6a on /dev/i2c-40: Protocol error
> Oct 21 03:03:20 ever9bmc platform-fru-detect[587]: Unhandled error
> condition in notifier callback, disabling sink: 71
> 
> There were no i2c patches in dev-5.15. Since v5.15, the following
> patches have gone in:
> 
> $ git log --oneline v5.15..dev-6.0 -- drivers/i2c/busses/i2c-aspeed.c
> drivers/irqchip/irq-aspeed-i2c-ic.c
> 5bd733a9928e i2c: aspeed: Assert NAK when slave is busy
> ea1558ce149d i2c: move drivers from strlcpy to strscpy
> 50f0f26e7c86 irqchip/aspeed-i2c-ic: Fix irq_of_parse_and_map() return value
> 653becec6d56 i2c: aspeed: Remove unused includes
> 
> The only one of these that had signficiant changes is
> https://github.com/torvalds/linux/commit/5bd733a9928e.
