Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A66634005A
	for <lists+openbmc@lfdr.de>; Thu, 18 Mar 2021 08:41:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1JrK3PMcz30R0
	for <lists+openbmc@lfdr.de>; Thu, 18 Mar 2021 18:41:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Lp2fUmrI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.223.136;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=Lp2fUmrI; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2136.outbound.protection.outlook.com [40.107.223.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1Jr26vjWz301q
 for <openbmc@lists.ozlabs.org>; Thu, 18 Mar 2021 18:41:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VuqR4BdIrpk6ldZ12VnqRPiyTMfcTAFoHiY5f0EY25/HZoQMGHvlDeHudWVFfE9ZK7i4O8+0PUHukSkHGZi1Xx/79kNGkFYnYDRV22j61qLy44NnebObBbt14uG2SgxUu08hO9FeK5WiSudTjwheN+DRCjzKESAMMyQU+7lMxJvihDgbCk0jQd+j6AJXSDuFqqfqc/yqAwj7ikTbNfZqK5ZeYxIjekseQDX5olmjmFZd46QkMbcsk3jJFlquaTVxwnTQxgGEkNYzywjZtGUdfHBm+5JB/MkzGRtTM92/EUcL1VANCXFQNaar2gYK+xUOEwyko/jKCvzv7DHHoILKkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJteyTrC3OLdMn5dabPxuDmLy6JOwoIHfvaw89ISifg=;
 b=dfSHGAl9JtyveZOZKdcijzp6PbZMUzf72+ZJhnvdzM522rnjXyAxUMArfZZoc//n6OlZC36zlRIW18Z1zkaa91MhPNteG8IcPeNf7WriEkWxlwv35rA4ryiFJvtPP15Sj6cDJw467YoAOUr4F2zYHQARbympqIaYx0O8zTjoheDNzYtUclCozNkfRoR4irk0Umqoo3urFXB2JO6abvYfiDiSzRk+YVmw1XJBx3OnCo+kiiJ4O7pE/ug3e80U9V3M67AFxzs2d8csqQlWLrsGIz38fcTRDg5VOmonjEK/rBnSedvFNCi88pieKNXe4mqmBZ1kLccN5Cfo2CPoEN7snA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJteyTrC3OLdMn5dabPxuDmLy6JOwoIHfvaw89ISifg=;
 b=Lp2fUmrIvF3cEKsoGQ42K+ShQqzA1DfIX+YEYR1nVBZUCZgOds/+uiWmyx2FNO+B3l25AwxFJE03pywBSE0RQpX71LQS1CkF7EEe+wjYqaEwiKlAitpFQHMblEaxxW8Rb6b1MVQEiVPQNgmqla90HdYpvZtzQMvr2+rbrcLbOAo=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4685.prod.exchangelabs.com (2603:10b6:805:dc::16) by
 SA0PR01MB6378.prod.exchangelabs.com (2603:10b6:806:e3::8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18; Thu, 18 Mar 2021 07:41:27 +0000
Received: from SN6PR01MB4685.prod.exchangelabs.com
 ([fe80::cd4a:192c:d45:b3ea]) by SN6PR01MB4685.prod.exchangelabs.com
 ([fe80::cd4a:192c:d45:b3ea%7]) with mapi id 15.20.3955.018; Thu, 18 Mar 2021
 07:41:25 +0000
Subject: Re: Where to collect information for Redfish System's Processors,
 Storage, Memory data
To: "Ren, Zhikui" <zhikui.ren@intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <925a9eba-db8f-fba0-7d17-db32860c44ba@os.amperecomputing.com>
 <DM6PR11MB4410AB2F408E39757C2D38B1946A9@DM6PR11MB4410.namprd11.prod.outlook.com>
From: Thang Nguyen <thang@os.amperecomputing.com>
Message-ID: <f5275c09-4eb8-fc19-520a-5c3d23a94235@os.amperecomputing.com>
Date: Thu, 18 Mar 2021 14:40:54 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
In-Reply-To: <DM6PR11MB4410AB2F408E39757C2D38B1946A9@DM6PR11MB4410.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HKAPR03CA0020.apcprd03.prod.outlook.com
 (2603:1096:203:c9::7) To SN6PR01MB4685.prod.exchangelabs.com
 (2603:10b6:805:dc::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from HCM-FVFX4014HV2J.local (118.69.219.201) by
 HKAPR03CA0020.apcprd03.prod.outlook.com (2603:1096:203:c9::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.9 via Frontend Transport; Thu, 18 Mar 2021 07:41:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73609bc4-eecf-43c0-a298-08d8e9e13b78
X-MS-TrafficTypeDiagnostic: SA0PR01MB6378:
X-Microsoft-Antispam-PRVS: <SA0PR01MB637885EEE7207777A10B5CEE8D699@SA0PR01MB6378.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /MiBjZ2vFdpNvqX4o2Rbr5WXT6m61kHk5UBAwLCzwT0E5lj4Sp2rmmE29X04NF0Yp/p4BYe1WRDzkbqozg4o4YJnqZMuVWc8/1t6T1VVP6yWpKU1L+b14ZMB0NRKThDzP7AOquCLljQKHm/OTgLP6e5IEyOJO7ePdF/Kov2V8TkV7JqXWx14qZdpz2no9vimDcH9oHwDySoIPpBhR4oMdOdopwAS/YQ6p8CoUTHL9Og6Ne3A7leBJjL5ieOYrPGgQDjVcofjxIroPH5X+BxKDq8WdW8r3j6LRDwuMpQbHsBEoEQEQ0e+QnptW6QeoyoDWntH6mlJRGLf88HKuBa4cKQxBqv/ldUnf6l3g3B6T924wQO0wiPB4HIp+a5jhn3+BM3Oc4mBjMML+DdIRVXK76hvbHlFrVW38BkA8h13Q8xv3SsbIGy1rg1fwc1pkYX9eZRNldcQbSBmYllLbRtTOFrs08dbM+bAxTz+fQNYUQJA0cRpqU0fVQ0qA06o8duy7ofjpVVBn/raz8ihwyHXYPyJZBRkggtmz+WWOTp06SHFI5MlsAHp4sUtRmqrUsbw53NksIrQ8vgNI+58daI7NGWE8z/FKD2QsEhlbk0wAXs4f8QPY1FwFEn479+Bi/XE+rJrqNhPHgdmAq80d8P26Ns8lDTgG/7mywDCjJzOXXyZFy/Sp3CsqymVfw6i87mJQnMeZyxD1NVy8pb9xQQ4p4FOsK9nhSVsp4Mk1U7bd0l+rZoLfxx/jFDDKEJX7206
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4685.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(39850400004)(346002)(376002)(31686004)(31696002)(83380400001)(2616005)(110136005)(956004)(66946007)(16526019)(6666004)(6486002)(19627235002)(186003)(6512007)(6506007)(66476007)(478600001)(5660300002)(8676002)(86362001)(966005)(8936002)(52116002)(2906002)(53546011)(66556008)(38100700001)(26005)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TUFZTWVCZGJoeCtiU1FUZUdaWXA2a3MydGNNeWQ0cHo1clhqcmJFalJtYTls?=
 =?utf-8?B?N0FvY3h4UHdsQ0NlWXNtR0k3a1JidGtDYkFXSHVHRFVBUjJZbzd2UGpuNVp6?=
 =?utf-8?B?WVUrdHAweXhmZEtHOStWQTIyWHN0S1JvcW94L29ZM3FwZC9DeTFCSFlBUXlu?=
 =?utf-8?B?RGRYV20yWE1DMXE5Z01DUkhRRmRCcU9iNVJ6T3IxYWxXZi82bXFnK05wenl5?=
 =?utf-8?B?NEpPRWpNaE9rZURyWUpER3d5TVdkeXNwSDY1ZnNpYXFleVptZjNSVzJ1eld0?=
 =?utf-8?B?Zi82OWxjSFVYZktQTFpoVEQzL2pIM09xT1VnNFY0aEpmTjJZSUdqQ2YrMjVx?=
 =?utf-8?B?a2FKTlhJZDZnN0QrYkxyT1Z6U0hnRWQ0aWxkOG41SWxORVA0YjdEN1o1SlBV?=
 =?utf-8?B?OUgya3htTHd5NDFuaVNqb2UvanZSdCsrWExwbGNGejJxMzR5RkRBNG4rRy8x?=
 =?utf-8?B?S0hXTVpISmt6Y01uZTRiTEdMVTJLdUJKUFBhMmJ4eDRDRU5obXdXOXN1RWVK?=
 =?utf-8?B?YnE3QmpPWHhUUlVQdk85bm1PUVYzRDFOdHdBbFQ3cUNKb00zRFhUU0tLcHFR?=
 =?utf-8?B?VmhHNi9TbTJSVzRMU1h0UmhaYXQwcHA3YXR1Vi8vRGN4dy9WeFVSN1BkcWhR?=
 =?utf-8?B?cFBQY21vQm1RbEZmUzNBL1F6ZmpNZnUwVENsK1I5L0RMb0t2ZVpHSThXM3ZI?=
 =?utf-8?B?QUFSQW1CdzZnK1dRc3VKMW9Obk1QK0IzVUJIVmx1SSsyVHF2S3gwZjBLU3Uz?=
 =?utf-8?B?eVIvSGc2aWkwS3VlVTI2NWdTVjB5VnNLK3p0anN6SEZWOXY0NXBiNFh6cXdZ?=
 =?utf-8?B?UDA3TXpyVHppMlZMeXlyM0E5RlJkSkZHNzNUbVJkTkZIWk1WYTdSZFBsSlpv?=
 =?utf-8?B?bThpQmxDa0cxL0tid2NjYXZQWmZaK3JpcC93OTMweEh4bStna21oZW1yTmNO?=
 =?utf-8?B?U3U5b2lOck1BM2ZKQ0hUQmMyNTJFeURPa3VsR2xlekh6bzZNcmVXQlJPUjgy?=
 =?utf-8?B?ZWxyclljeU1WcndhU2ZsVzQzS3l3QUZoZnVxcERIbTIySy9sVUx5bXY2UHZj?=
 =?utf-8?B?YU5GU3ZXaDMwcjNJZk1hQk9DNUlFenA5emt0UmV2QWxzamRJYUg0MWFoQlpK?=
 =?utf-8?B?TGF6NFJpNGZjT0VMY2lxN080cWlRM2g2VXlwbFN6Q01XLzMzR2JZYXkxOHFZ?=
 =?utf-8?B?d2V2NEhHQ0VNWStDWFdzdExVd2pXc1BLdUNmdXlDMzBUbnk2UE5DMk1MRWVB?=
 =?utf-8?B?ZStOVDA1TXk5cFdPQVZYaG5qZWhsMHljSTRDbDVWVDBvdUZWMG1PK0ttUVR3?=
 =?utf-8?B?NWhtMzVVWHRuMzRKM3pDWlRFSGxMOHZYTFNqeFhYcGdxWTZBZDV0MFN5RW55?=
 =?utf-8?B?TGhaWmNzVG43b0JsQjQ5dklKZHFyUmFwWG5TUEtUWi8yZE5WTUo4K0MyMzZy?=
 =?utf-8?B?UitUdGg2aEMra0lGNDRxU3RXcERsYnBsMkJDRThHUTRoNXZ2eGFCTnY5U1p5?=
 =?utf-8?B?U2wxY0F3SUNsR05WYVl2MFBFMzhSN09Gc25oSThESnhBa1orRHMwK2ZSbGtn?=
 =?utf-8?B?MzdYVzlZTkpOWUE1NnYzSDJ2U3ZWV2xlT3BaQ3V1NnZjOGFTTUt4RGU0T21r?=
 =?utf-8?B?TlRQY2dwdDBpUmlGZExNTVIxUzYyNVdLTUNHNmJSWE5lQk9DR2NDcDZCK1Aw?=
 =?utf-8?B?Z283bVgva1pRUlFrdkg4UW51T25lempQVFFpUUgzUit4dDNHd1RKN1JyZDF6?=
 =?utf-8?Q?owDdApVp6RVXW0wJYDQNDmQe4trY0V+/VDMZ0ae?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73609bc4-eecf-43c0-a298-08d8e9e13b78
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4685.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 07:41:24.9769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EnOPUPcT5604fWvK3TiH4Bs+LcFazZ4uFnTs80t+3DDMSkXotMh0LGdyUFPEpBa/paIPCUvRKlR6Tq283kCzHvh+nBcMSW690l/dvKxjpI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR01MB6378
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


On 18/03/2021 02:26, Ren, Zhikui wrote:
>
>> -----Original Message-----
>> From: openbmc <openbmc-bounces+zhikui.ren=intel.com@lists.ozlabs.org>
>> On Behalf Of Thang Nguyen
>> Sent: Tuesday, March 16, 2021 3:22 AM
>> To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
>> Subject: Where to collect information for Redfish System's Processors,
>> Storage, Memory data
>>
>> Hi,
>>
>> I am looking for how to support Redfish System schema which information
> >from Host:
>> - Processors: redfish/v1/Systems/system/Processors
>>
>> - Storage: redfish/v1/Systems/system/Storage
>>
>> - Memory: redfish/v1/Systems/system/Memory
>>
>> I looked into the bmcweb repository at redfish-core/lib/memory.hpp and
>> redfish-core/lib/pcie.hpp but just see doGet() function to read data from
>> dbus to report via Redfish. There is no doPost() function to post codes to
>> Redfish.
>>
>> My questions are:
>>
>> 1. How can Host BIOS collect information and send to BMC so that BMC can
>> report via Redfish? via in-band Redfish?
>>
>> 2. If the information is not from BIOS, how can BMC collect information?
>> What recipes/repositories are used to collect information?
>>
> [Ren, Zhikui] https://github.com/openbmc/smbios-mdr is the service that populates dbus objects

[Thang] Thanks for your information. But I don't see any meta-* use 
smbios-mdr. How can OpenBMC get SMBIOS information?

Do we need to implement IPMI OEM or something like that to send data to BMC?

And UEFI (EDK2) collects SMBIOS data and send to BMC over IPMI?

>> Thanks,
>>
>> Thang Q. Nguyen -
