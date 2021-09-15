Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D7140BF63
	for <lists+openbmc@lfdr.de>; Wed, 15 Sep 2021 07:42:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8TdQ6ZfSz2yMV
	for <lists+openbmc@lfdr.de>; Wed, 15 Sep 2021 15:42:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=Rhjxax4x;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.93.108;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=Rhjxax4x; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2108.outbound.protection.outlook.com [40.107.93.108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8Tct5BlFz2xsm
 for <openbmc@lists.ozlabs.org>; Wed, 15 Sep 2021 15:42:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VO42WIq1kE1twlWNRwdYS9fEgNuF0O/qRw/y0T0UrDOa8FqkAbUS5TE2ktkB0FZBbsNV0+ezE/7IQocRPKztFuIOV5+V54bMEnzbr/NTj6kuApSoBHUZE/WwKzPEvVcDHzwLxrCxVunHfzHwjnvOXZGqbpL2rvGGw4ZO1PJg1ey7UbGUw91XehUpNnAmwSuFQAbZdkDKBepZ8eg0Nu1vs8Ji/2CagL4n9My6iyUgETJ4uH0rat0WiFsIj0U4Dg/yoiMDleuwGwtEjNLbQteyLVDMBJJ6fHw4jBv/E8ZMmV/hGwUfIRLhLDl+WhQb5ERIoZeEQMf49+uYlt4S4/62sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=G9CbziZfeZa17GGdnj+DOFgRlgrxbtFnQ48TycJpo2E=;
 b=ZP/+W8/jHrXY/KAKAaUDd1zFuEXUuJUJbI7i1DYnCaxzkbzUBQRO9ojek5C9rquSdB3T9+RUVfVA05Z6k9oSe10NDUOrd1VfGJAePIYK3M64T5zkvnp3cNOCMDNDLPs60MhgG6iREvizBfeq9zUsXjJU/8VI1Q9nUe0H1hz2vljvbYjqvS82XKsYNec7gy/HMSEgqtm7Bkhxng/0s/e60lyW/3pJfDnJsG2vMb8wcsX01rmUbEBKH9atuWsiyoi/BXZWpFcfLPl7MdNzjTjjNFaynvKyTD7CrpfcN+lNeV64aaXZQ90oHDZlK2T20nkfiOBBztU7UvOmVK4NmTfpOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G9CbziZfeZa17GGdnj+DOFgRlgrxbtFnQ48TycJpo2E=;
 b=Rhjxax4x23Cvbtl01hrKiSqGK/VY/9D9R8CVdDdnFjDrdKIvkvkN1UmtqYeFIfJDNJsdG3Sw5iuPk9dfTfIpsFYg4dA4UIz11Iwp/UPRscrBfagrJgK60/8Bzy7ehTNdeadtzbAyOmeBF1QPyA7SR8nkrjNRHRijofutaYZHP9M=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from BYAPR01MB4678.prod.exchangelabs.com (2603:10b6:a03:88::27) by
 BY3PR01MB6772.prod.exchangelabs.com (2603:10b6:a03:366::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14; Wed, 15 Sep 2021 05:42:00 +0000
Received: from BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::545:38ca:33b2:afdc]) by BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::545:38ca:33b2:afdc%6]) with mapi id 15.20.4478.026; Wed, 15 Sep 2021
 05:42:00 +0000
Subject: Re: Read smbios2 file failed
To: Andrei Kartashev <a.kartashev@yadro.com>, openbmc@lists.ozlabs.org
References: <CAMqwjCAaHrv0SgA_1hDEjjnX1fur6ijmCJCrn1gTPbr5Z2-ONw@mail.gmail.com>
 <d190054863c8112a66baad2f50dda7c6bdc45717.camel@yadro.com>
 <5f94cf85-6ded-3520-8ad2-592fade91e81@amperemail.onmicrosoft.com>
 <9ab79bcd06ad6b6cf574a8455247a767df8731ac.camel@yadro.com>
From: Thang Nguyen <thang@amperemail.onmicrosoft.com>
Message-ID: <d93fc722-2a24-0921-56ee-b9968edbd6a6@amperemail.onmicrosoft.com>
Date: Wed, 15 Sep 2021 12:41:52 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
In-Reply-To: <9ab79bcd06ad6b6cf574a8455247a767df8731ac.camel@yadro.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: HK2PR04CA0066.apcprd04.prod.outlook.com
 (2603:1096:202:14::34) To BYAPR01MB4678.prod.exchangelabs.com
 (2603:10b6:a03:88::27)
MIME-Version: 1.0
Received: from HCM-FVFX4014HV2J.local (42.116.120.79) by
 HK2PR04CA0066.apcprd04.prod.outlook.com (2603:1096:202:14::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 05:41:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74a54a3e-2ca5-41ab-3f7f-08d9780b89a0
X-MS-TrafficTypeDiagnostic: BY3PR01MB6772:
X-Microsoft-Antispam-PRVS: <BY3PR01MB6772AB634658EC9C5A76A93F8DDB9@BY3PR01MB6772.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QF95C58ndQPJJmSvOV2sAoy93f6PxQflW5HDiBWCS9VMCK15t2LLWcxiprAMJ28JoXSktTEnVilbd0JXRb0flDiGYFXmuRo0Ut4IJoe74tDGyakWzoo3Hm1whrp9aqpdfz6nVi55AuvQaUMzHxgIbKK3PRU+QpYXZzj+GEdV48ENBtXNIPPuyrTKDbnCw14ECDNgUPygSAj3bK4cizgLEvzmy+fOj9MvfT0gpl2uT0pYKmDdmi44AdsegblbjRxDmIkn9fdoYPrCUbPXtKwPXM+cRiS+bfLDZqq680O+GAT/lcTvr56uBjNMX9ghrX3q9G7fyr+2JhbKqMAu1DLD3JX70fbturLsrbfRGFiXW7l8Qcm68F8uyviypbR0q3et80clNX/o9ihdFJK2v4nf3J1B2nexRjl9vge6KkjNIQuB4T5wMTXz7nXzDg9/KWvbMhqy5q1/rUFH+4yIkHHxJAlvNrCBSq18z2uCXj9kMhsVcJ7wHvrz8J4967mU6LZGNy9VDwFgZxFmS0yb3Qhkptr9Q5tBOelH6UisqBzQsjcAW3HjJXTpPrFQwpQyaZmh/Dwqqf0dxZ1n/H3jBckKU7UpAGRS84BGXN1P+ko+zL5cv2f4BeFxfv2zcSPmlg7DVfh2ZXIwg86IfsbvkCVbRDbPXbGpnX1dQ998IlDEg3U8paJR11LLdTlxs2tjOwU2NP+z6vVLRFUaJtNgG0HuARDUsetTpDWpezOFSsSBYlsfzCxqK1kxRneSvunuIe/IBz4D3EtDtCTok4QaqVrYrqnObxrtcmTv06hVTu4fFaCZ8ojDB/DxqlFeR2er4eaIsGf6l2F8lhIksBea/tMW0J9dr8bgKFwS7aY3aLKlNe0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4678.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39850400004)(376002)(136003)(396003)(6486002)(42882007)(2616005)(52116002)(956004)(966005)(6666004)(31686004)(6512007)(5660300002)(186003)(316002)(38100700002)(66556008)(26005)(66946007)(38350700002)(53546011)(66476007)(83380400001)(478600001)(31696002)(83170400001)(6506007)(8936002)(2906002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEdodEQzY2dkMS9STWRzQXRFcWdxOVZ4emZ6ellVRWV2OUYyRjc4cC9BL2ZF?=
 =?utf-8?B?MmhTelZkeXlTYVRWOTJPQ0VvVmJOOUZKSTRva24yUEpSMkpRSjVrUkU3bnIx?=
 =?utf-8?B?VTh5aCt0ZGZYMDRISDlsdVR2ZmZMR1VjOWZrbldOdy85YVJoR3B6Y0FaaWwr?=
 =?utf-8?B?VDRIU1ppTTE1cDJyelJtYW82aXRYR3dTcXJVUjU2aEJnbWkwcldrNW14UmxS?=
 =?utf-8?B?RUUwczNML3JNMFpoY2IvbUIxZ0JkWTlRbmp2d2pwUUpmNkNvTXRXdStubHE5?=
 =?utf-8?B?STFhd0I3Q1dKUitHaWJjL3JTN3EwNVlnQkxvdWRoVUFURUhPbWo0bWd0aS9L?=
 =?utf-8?B?Uk5YWlZCUHdKOEt2aXRVOFhxbjU1VWNIb1Q4L2tybW1uNzFsY0U1WWRLbko1?=
 =?utf-8?B?ZHNjQWNKQ2kwWThMV2RDelR4SFlXZU5mTWttZ2Z2K2pJV1ZPa05DSUJKZ3VT?=
 =?utf-8?B?NzN4amZpMGJZQndDbnRDTVFQYXk2cXA1UDlhbHRWR3JmSURLcVd3WXhOaVRw?=
 =?utf-8?B?TjJVazdvSHBzRU45a25VSjZXbDVuWG00citMbzMrSkR6d3lJb3ZFNVVvc1hq?=
 =?utf-8?B?NUw3QnhBbjZoZTZaeUZzZ0hzMlVoQlZTczNVSHl2dVI4T1I0bWttMDRmVGVY?=
 =?utf-8?B?WEdxY0tReGJUajI0RGhRLzZPT0tBYzdhU0hWaEFua3dzdnIyOStvOCt5MzND?=
 =?utf-8?B?T1cvWFc0Y1g4UjVVdFUwNE1GUjhIU2pRbWFSNFFuS294NFhYbXNjZTM2TXJI?=
 =?utf-8?B?RmZPTjVicmRTWDhEbWxUTHk3cVhSZGJiV2dJUGYrL1Z2TE5QRkZ0YzJBcDFB?=
 =?utf-8?B?VDJpZnhtQzBoZWgybXRRSGZ3U0hXN0Z2NmhiSW1iRnZuM0FhMVhTVGE4eXov?=
 =?utf-8?B?S2lYekJraURFcHZLUVA0aDliai9vTUxrWHNOYVFTTUo1Y2llQmFDdE1tOW5j?=
 =?utf-8?B?YXNRaFgzL2s3WHAzMjZZaG9pN0haRm1iR2ZhYlJ5MlZxa1pTTjJ4allRaEM3?=
 =?utf-8?B?eWtCc3VNRkdqeWtDV2I4cnRPaU5EK1hVQzAyWEVid3F6cHVUeTBRQ2FBR21F?=
 =?utf-8?B?dnhPNUs2MXpmOEZUNmV4cE51WHZPS2tzYTdjcG9DV2IvYld6U1YwN2tvektZ?=
 =?utf-8?B?VWlqT0l2alBIOTFxZXFoNkVHTFFpN3Fwb3pSTkY3OHFlaysreGE2WjdUNWVT?=
 =?utf-8?B?UEkydU9BWDJoQ0dnVVpDZDNTVUVzZXBTZFcwZm03NGtaL0xoVHIydURZbDdj?=
 =?utf-8?B?QlFGOTZHSUordndvTW9UMUtwcG8vbGpld3h3dFRBTHVNUXIyLzdyTk9JMlVO?=
 =?utf-8?B?WHczWHZjQXp3ZjdFT3RRanZyb2Y0U1p1NDlYVnBRc2ZFZjRQdVU3dWo5Vkhy?=
 =?utf-8?B?MWJEd0tpUDVxY1ppaUxjN1h1Vk5zSnFmU1VPOWJXV21SYXFFSWp4VlRlRVJs?=
 =?utf-8?B?N0Fuc2Fkd3BnNUVuN3ZLM1BreGtmTmlpY29ZUEVCclR5dzhZK0YyOUFqdkRB?=
 =?utf-8?B?MDgyMVlMbGw4TC90V2h4S2lyMDhEUnErNGVOUWwrR0Q4WU9HRWsyYS81MUkv?=
 =?utf-8?B?ZHViY2MxRGUyd3hmVUtjYWszam9jcXVIVFBaYTFMZDBueXJJdzBQU1p2VE9G?=
 =?utf-8?B?cDJHYldDYTNKQVBNWHhqVmREcWsyY2FNZnRtZkxsQWNJcWluVmNueGNwSzh0?=
 =?utf-8?B?NDhyNzc4aXhLaGMvWWkxUkQ5cmRweHdKQXptYUl2bTgyZ1RjT04rUSsxWll3?=
 =?utf-8?Q?JlBjuteVzIjGw/jzxFd7k2WHLb5Rl8OSvO0W/GN?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a54a3e-2ca5-41ab-3f7f-08d9780b89a0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4678.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 05:42:00.0698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sRvMnUIbP81GsKeqyANi4N92TsSG+cAg9uaNk2sxTEyJS1xLw6V63jKB/lUmLOOrGTR710EicVvxpqtsdaTo1JfWMwWPGlL+FMt5BxmN7IIRzNcWSEJQ1js8zAWnHqEL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR01MB6772
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

Hi Andrei,

I see output of "dmidecode --dump-bin" follows SMBIOS specification. As 
the data for smbios-mdr does not follow this, do you know about the 
document or any information I can reference to prepare data to send to BMC??


Best Regards,

Thang Q. Nguyen

On 14/09/2021 15:51, Andrei Kartashev wrote:
> No, it is not same as "dmidecode --dump-bin".
>
> On Tue, 2021-09-14 at 13:46 +0700, Thang Nguyen wrote:
>> On 13/09/2021 23:56, Andrei Kartashev wrote:
>>> You need to somehow deliver smbios data image to BMC. This means,
>>> your
>>> BIOS should implementat some logic to transfer this data.
>>> For BMC side see example here:
>>> https://github.com/openbmc/intel-ipmi-oem/blob/master/src/smbiosmdrv2handler.cpp
>> Hi Andrei,
>>
>> What is the format of smbios data to transfer to BMC? Is it the same
>> content of "dmidecode --dump-bin" command from Host Linux? or
>> anything
>> special in formatting the content to send?
>>
>>> On Mon, 2021-09-13 at 17:40 +0300, Alexander Raih wrote:
>>>> Hi guys, I am beginner in openbmc
>>>> I build openbmc with smbios-mdr repository and I have error:
>>>>
>>>> Read data from flash error - Open MDRV2 table file failure
>>>>
>>>> There isnt file in /var/lib/smbios/smbios2
>>>>
>>>> How I can resolve this problem?
>>>> Help me please!!!
