Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73441308391
	for <lists+openbmc@lfdr.de>; Fri, 29 Jan 2021 03:11:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRgmq0lDSzDs6v
	for <lists+openbmc@lfdr.de>; Fri, 29 Jan 2021 13:11:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.223.93;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=NXHTGdwy; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2093.outbound.protection.outlook.com [40.107.223.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRglX2S1mzDrnm
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2021 13:09:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KE9f+K61np+ThJsxqMZnBa1knf/T0MxUdxOP8hz7v36AWhaQXVNVoh/pzwFzxXB2MYnDIFsA3dj2f5dH8MyTOhs8SQJL+UWXwKXMyGVpcZ+Z0TQkJeES64XetQAJz22lWSLmGCoJ5TxjG3f/Bnj2DLmk05ITTIbkRLBCra7dp1WC2ABEgG6xNW+VvJKo2RMGimOIQnOClK5EvNTSbLm0Xai1mjn2HspV2CUZOZ+MxXfDh0R5/NKRLBIWoK+y81GYWsYhgXynKRm4oDv1ZJyZ1BiIcWDaT6mqhNVmw7rgbXcjNAyj8SkE3wMLk0he1SQKtHJign6xhhcPqFUTaIc6Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YE9HjEip4xtTBn/qhbzt+RTp3Bi+Jfr2mydalt+ZYLg=;
 b=J3WC0RU2nxe7Qb16B/jiGFV0lplJSWMy1TcqQuxQgARxXU7HOuk43yMvAz4qCQdX/9qR5C6NhpO6W9+VcC5Vj4JajDThuQlEym4629XQw8cInP3VenJmGBMg3VDumZtdFVwZT2ZdaxwFQ9JGTldEMpTEi7ZzuWXgGjdvuTrgMKtQ9HPHaJOfySi6A2TZEbABoSgmVg5bIvQ6yaiJPyJ4EY/TeC9mhChl77WNw0O45bBhMo8A1uHIN/IeeoYRturbp5cSEksbMGn9NOVjAMGW14JrZ92EuZ984lBT/2rbJ+xTV/iY37LmDsV7KhRddUvVANczlrF9YDLAYNK2EA1cfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YE9HjEip4xtTBn/qhbzt+RTp3Bi+Jfr2mydalt+ZYLg=;
 b=NXHTGdwyG0ZcDGsQKnNc0SBe9Sk5e5Azv1gx85XEwXWAYVO6qUbNS35nUo2oepvPTe4vIGCC+KhAKjG7x2oFLRYQ0gBgVXSJ2cOVxd1Z9uAk2i49j8oixZRyFwT14Oc4TjBtHwutrMT6K0RSI1kzY+fgucI8dHR3CkBJLwyzecU=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from CO2PR01MB2039.prod.exchangelabs.com (2603:10b6:102:7::6) by
 MWHPR0101MB3133.prod.exchangelabs.com (2603:10b6:301:2c::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.19; Fri, 29 Jan 2021 02:09:47 +0000
Received: from CO2PR01MB2039.prod.exchangelabs.com
 ([fe80::8077:5998:860:1210]) by CO2PR01MB2039.prod.exchangelabs.com
 ([fe80::8077:5998:860:1210%11]) with mapi id 15.20.3805.018; Fri, 29 Jan 2021
 02:09:46 +0000
Subject: Re: Gerrit owners plugin coming
To: Ed Tanous <ed@tanous.net>
References: <CACWQX821ADQCrekLj_bGAu=1SSLCv5pTee7jaoVo2Zs6havgnA@mail.gmail.com>
 <CACWQX8236dghCCdnDAdnij0Di_GF7DsmAO_xEtWmk6ckKDocYg@mail.gmail.com>
 <e18c023a-ccb3-6591-1092-cd488cd331e9@yadro.com>
 <CAH2-KxAC1r2tSOmbCyyvnYcY0Z-iyW97FoGHbtzitVNH1u5jow@mail.gmail.com>
 <5a209aef-f6cd-40fe-bd3b-8a4e1c623c8a@os.amperecomputing.com>
 <CACWQX83_KWqvroAzdZTOh=HHre+w8T-QF-eftGxah++-5Yda3g@mail.gmail.com>
From: "Thang Q. Nguyen" <thang@os.amperecomputing.com>
Message-ID: <faf5cc4f-4a53-7d8b-6f63-b64834e4ae17@os.amperecomputing.com>
Date: Fri, 29 Jan 2021 09:09:39 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
In-Reply-To: <CACWQX83_KWqvroAzdZTOh=HHre+w8T-QF-eftGxah++-5Yda3g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HKAPR03CA0008.apcprd03.prod.outlook.com
 (2603:1096:203:c8::13) To CO2PR01MB2039.prod.exchangelabs.com
 (2603:10b6:102:7::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.38.7.183] (118.69.219.201) by
 HKAPR03CA0008.apcprd03.prod.outlook.com (2603:1096:203:c8::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.10 via Frontend Transport; Fri, 29 Jan 2021 02:09:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fc08b9c-c35a-4502-e39f-08d8c3faf34c
X-MS-TrafficTypeDiagnostic: MWHPR0101MB3133:
X-Microsoft-Antispam-PRVS: <MWHPR0101MB3133ECF7D7B5255547E091428DB99@MWHPR0101MB3133.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xq/Jln6vECIa6fmiTAD6MWmGSY2xVwA9wjFJ+WrvrHPEc8pmKl1ifiu+y1PIZWixQS/60MisC53PnQ/BeoLe3Is5ZXZ3RJpg3qNOtQUd6sO5Mq6gsKslRrJgk6OM1ymKU4jyg4OARGivMWwfbCGaCeIhCo77fe7Rp4a/AU85r/N1PPDZ9S/fJUNegBSXgu3s8VdpGBpinaGhG9JJsVBvsepTa3LTtTpgfxZ/8F/Zs1GYaqUWRSZ2O+3umGFoD5eJ9U25orZIOiCGFh1tbca6tdNsLtPcz7IiZX0wdIbJhBR51uzbECGtVMqSbA5cRy6wc/P1HODlrRHexuMnfa13ysWL5aDJurO8JBti+YQLxbABtWDMj2VofPbeI5Qjawr5Zcjv12ywr0fcD+Fwo1/bsvmydpyIAmtgvqPRaP70orofAtNBW+OVcxHeDkqfX4QqEWzlMDfmyfPRLMXZwv5MnsM/7NVd18i8UadGlQnKfjrYLLHUaM4BHsn16zI0Jw6hpM6xAaiF1anQCR7MgpnLxuRDf0uZVmw8dj4hpD+q+G4nubURCONuiirPdi9mrqRteGXL2r48nuyWAvS4FPPymYUaexzAZaYyLya3nH7POfrXPoeDAIvCZv1SRWM7zy3N3Fv8SvHpkObtof9m15yH0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO2PR01MB2039.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39850400004)(346002)(376002)(136003)(6486002)(5660300002)(6666004)(16576012)(3480700007)(8676002)(31686004)(53546011)(8936002)(16526019)(186003)(4326008)(26005)(6916009)(66946007)(316002)(31696002)(83380400001)(956004)(2616005)(478600001)(52116002)(66476007)(2906002)(66556008)(86362001)(41852002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aVgwRCtZWGRFRStkRGtGTy8rYlY1anJrWXpwM2NnMXNzSjBwcmIwOFduNVp0?=
 =?utf-8?B?Y3pvTkY2Z3c3QVA3NVBvS3MxNld2NHFFemFaMTJwdjNwRkJrUTNMZStMMlNY?=
 =?utf-8?B?MmVrT2xsQ3RYTk9EUzJXejYyQ2VFZEd4YzZxT0hEVmVidjlXQWRic0FJSkxU?=
 =?utf-8?B?VW9iK0FVYTh0Nkd6TUhNQVNzNmJ0Ly9seXRheTVaMmIvOE1zOUVtU1RkUVNG?=
 =?utf-8?B?L0VLNFB4Nnc5aC8rV2VvYndQamlmcnZoTzlYbkZGcVdwM3h0VE93SUZ6a0NJ?=
 =?utf-8?B?VFRIc21OT2I2dnVVRzIwY05UR1R5dUJHM2U2YlF6S2RQSS9iNFh0TUtXRmpq?=
 =?utf-8?B?SkZNbzhhTjE4VHQ3TkxYTjV3TE0waDdVRmp6QnhYeFFwMk8zUTR2dVI1L0Y0?=
 =?utf-8?B?YndobmpMdHhhRjJUcG1ybzFSdG04ZnVnZTZ0cVBNUVpldmNhNXhJcFZLdlR5?=
 =?utf-8?B?WVRVTXR5VXJGSEFFZCsxbjFIczNhSFdHRnlOWHcyaHRVbmgvSmE2S2w4NGpi?=
 =?utf-8?B?RzF6Z0hBZHVpcitQWDZBN2VCdXkrdEpGbmJNTTd3Y0xzTmFqK2Q4bXk2MFc5?=
 =?utf-8?B?czYrYVRwSlJyODlmK2RaQk43cE5ZNHRaSEFveE5HK3Z6eWFPQzF4NjQwRFli?=
 =?utf-8?B?azdMOEMrdzNPdWhLZnNTTWhZdE9WaEZsZWw5Rnl5QmRvL2ttQURXS3Jlc3dy?=
 =?utf-8?B?VUUzdjU3M1NTRzEyaWFjSVlxZnFKQml0TWFOSFpicmtLQ1JuNmZDRkxwb0dk?=
 =?utf-8?B?bU1RK3Fyc1VLNU44OXNySVFTOFNlamVIb1QyTDFrTjd3WmhXSFZyTmZXdVNt?=
 =?utf-8?B?L0Y2N3BSeVNQVHNOaURHSVRTdjZ4WGZLTWQ5VXV5b29VUlh4MVRaY1pQc1Z4?=
 =?utf-8?B?dFBDVTFNZEdaVzNWd2lPTk5WakV0UGk1elVYMzkzZWU5cTdacTIrOVpURFRP?=
 =?utf-8?B?ZXVzZWdqakh4Ui9Qd09hUlBzVmtXeUI0N3F0WjFDNlV6NktiNVZzM1JicWZG?=
 =?utf-8?B?WHF3aUNEaVRVYkJoVHFETklEWWhsU1kzbjd3dWgwSTEwMEpMK1I3MWp2ck11?=
 =?utf-8?B?eDJOeUpnYlE0WDFVV09BN3AyYXRUbzQzY080SmlieDZPUUtqcVM2UUY0NERD?=
 =?utf-8?B?SlRrQTlJVUJZWkg1NHhHV3dDdFlzc21COFhwa09IYVBoUzIvaFhzWW1xOWdF?=
 =?utf-8?B?dXBnTStlc0ZwT1JQeFFyZVgwcnphMno4WURPZXRKWG9GcVhEZEZzUW54YkxT?=
 =?utf-8?B?cHJ4ZmpWeWdFRVIvbjU1K1B4dThha24wMU84MjgvTWR4eHk3OS90TzVVOCtQ?=
 =?utf-8?B?N21MZ1RNRXR0YmhvMldMNFVKRzRSOTdvd3Bsb2kxUHBNT1I1cmZhbEdiOHAr?=
 =?utf-8?B?UmIzNERHelB3UWhGdmQyVWd2OVZqY1dmVGxLZDFPQzFGN05OaVNzUk1XcGx4?=
 =?utf-8?Q?t+bxml2d?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc08b9c-c35a-4502-e39f-08d8c3faf34c
X-MS-Exchange-CrossTenant-AuthSource: CO2PR01MB2039.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 02:09:46.5817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJauTJpXr9VUxWPaBQV6bp5SyZz/fmSi3RsEqHkrhXqhccuCTG+i5osAcmsNezbRZD6k/PoCE2ratCwllrDHldtonZ3AK73Q4qorFNJdpqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB3133
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 1/29/21 00:23, Ed Tanous wrote:
> On Wed, Jan 27, 2021 at 6:08 PM Thang Q. Nguyen
> <thang@os.amperecomputing.com> wrote:
>> On 1/28/21 00:09, Ed Tanous wrote:
>>> On Wed, Jan 27, 2021 at 4:02 AM Alexander Amelkin <a.amelkin@yadro.com> wrote:
>>>> 26.01.2021 00:26, Ed Tanous пишет:
>>>>> On Wed, Jan 20, 2021 at 11:23 AM Ed Tanous <ed@tanous.net> wrote:
>>>>>> Over the last few weeks, we've been slowly getting the gerrit owners
>>>>>> plugin deployed and tested, and got the OWNERS files merged into their
>>>>>> respective meta layers.
>>>>> These changes are live.  Any commits to the individual meta layers can
>>>>> now be submitted directly to openbmc/openbmc now.  If there's anything
>>>>> broken about the new workflow, or anything unexpected happens in your
>>>>> workflow, please let me know on discord and we'll try to get it
>>>>> resolved.
>>>> Does this mean that meta-<vendor> directories are not subtrees anymore
>>>> and respective repositories are now obsolete and can (will?) be dropped?
>>>>
>>> The intent was to make them read-only in case someone was relying on
>>> them directly.
>> Hi Ed,
>>
>> Any problem with meta-* repos which have not been integrated into the
>> main openbmc repo? For example, meta-ampere, meta-fii.
> They'll need a review pushed to openbmc/openbmc by someone with an
> interest in them.  Make sure to include an OWNERS file in them.
I requested the meta-ampere for Ampere Computing's Mt.Jade platform 
support and I requested to integrate meta-ampere to openbmc/openbmc 
before. There is OWNERS file added to the repository.
>> And with the change, the new change will be submitted into
>> openbmc/openbmc repos in gerrit instead of openbmc/meta-*?
> correct.
>
>>>> Thanks.
>>>>
>>>> Alexander.
>>>>
