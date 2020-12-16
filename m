Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 476CB2DB998
	for <lists+openbmc@lfdr.de>; Wed, 16 Dec 2020 04:19:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwgNH5Q0VzDqCY
	for <lists+openbmc@lfdr.de>; Wed, 16 Dec 2020 14:19:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.237.121;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=thu@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=mB1M7aDK; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2121.outbound.protection.outlook.com [40.107.237.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwgMD3PKQzDqK1
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2020 14:18:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S4B0+gy2CJUBWVt07WOE3PUek2hWpLuSdsMT48WZm6EbGgMaEgaXXF5l5e0QnR6uSKH3khgLPxq/eImvK5EmhpLwHtyC3Y2JGhV+F4+pVz/3rRUv18CRVYx1va50C1STp2MyVFuOGUfxLfLSzQNQJtlGXc1KQ55ztwVz8czDRyLqbKP9oyNK6zXm+wkbcdOU6Fb615iCkdjDZilq2yjWOF8En5D6LoXnAekjW9M1lwjoIKHO/0ZL5QSZXkPMy4JsLC44Rnfj585gYJopcFkoo7FzvtdaXe6MwHmEbNd5qVPK+fSNd8hnM0z7un+NDASfbRWOIvKcbswf6B0WgndVPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Db9+I5sMGRVa53lyiHjFf2sCqsfLiWUKn4rC/mxlzSM=;
 b=JfnftkxR1NTJCQW//Qu5t/TBNwMAfDH6Tuv4atr4KxBKix/rY4KVZjigvjtcZ4kJR4Xp+EN+2k8JOV6Jjc933VTxSkWm8of5mX/OUdJUZoqZel1SfX0AbQPmEQ4CYz5SXZmVzMP1o16chNKOB19rPdqw7VQ6GIBKKkZ0873r4GVCQbxcJD4OJghcpn2TbSKnNGpw5z6EEq6Xusr6xr3YicS4EJRLJqThdUhcGNE1jrCXUzCNuB1mveXgSnbmJS+PdeAydEzQ524pOT7Nq98qs7xSZk6rXaW27g8eSkneijOLPrXVkVZ0O8/P6mC1gqO1GW7nzIhcYLwO24WKs7Juhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Db9+I5sMGRVa53lyiHjFf2sCqsfLiWUKn4rC/mxlzSM=;
 b=mB1M7aDKiF0vNdyNqgDAQuxcwWqTXn0A4Ea7mQx+mVZdgh8+jzmNdjAIxO7/qF3krSp03CJGaqMsw4LJPUZYmZ2JbNy7lR2Nnt32hncqn0Ag4GaCPCd3xqyEasGK3b01Gnb4TtrttPnMR3fBHwCao0Sc1Nf8djCA4WIJxEvf/wc=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5145.prod.exchangelabs.com (2603:10b6:5:56::16) by
 DM6PR01MB5035.prod.exchangelabs.com (2603:10b6:5:5b::27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.24; Wed, 16 Dec 2020 03:18:40 +0000
Received: from DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::c930:8fc9:847b:7f3e]) by DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::c930:8fc9:847b:7f3e%7]) with mapi id 15.20.3654.025; Wed, 16 Dec 2020
 03:18:40 +0000
Subject: Re: Phosphor-fan-present only update fan Functional for
 xyz.openbmc_project.Inventory.Manager
To: Matthew Barth <msbarth@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <5299ced6-5d6a-843c-4112-3d9fa34f3ae7@amperemail.onmicrosoft.com>
 <d7f1a690-bf35-dcb1-2bdb-33caba87bf66@linux.ibm.com>
From: Thu Nguyen <thu@amperemail.onmicrosoft.com>
Message-ID: <d07abd06-f89f-aebb-61ae-776842efc0f3@amperemail.onmicrosoft.com>
Date: Wed, 16 Dec 2020 10:18:32 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
In-Reply-To: <d7f1a690-bf35-dcb1-2bdb-33caba87bf66@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK2PR0401CA0008.apcprd04.prod.outlook.com
 (2603:1096:202:2::18) To DM6PR01MB5145.prod.exchangelabs.com
 (2603:10b6:5:56::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.38.33.175] (118.69.219.201) by
 HK2PR0401CA0008.apcprd04.prod.outlook.com (2603:1096:202:2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 16 Dec 2020 03:18:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1d571d0-c098-4805-545b-08d8a1714952
X-MS-TrafficTypeDiagnostic: DM6PR01MB5035:
X-Microsoft-Antispam-PRVS: <DM6PR01MB50357E9664EA2BA2EEFCA9C190C50@DM6PR01MB5035.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /86npTu8F94Df/b1O0u3CtxVAiTy6Dm2TV1wHmsJ2mn6BePgCuwNgJ4q+xbub4ywgKEe10AX2rqZuwX/oUsGcduV3yzCDi7Q5GpFOGKs1UH8e/sxQWLLv4NP2ZpGa/K11178ccb3QZccSdjArlB209xbjqdhDo3bbXHytjl0ccVQ2TuVm7TGeRNdHxzDvVjKBcBRBcfkS+PRJEwMP0fqEHqD3oYAk4n5cgjP+4fL0gn/QVhkLSVS5Q/7Qd1pUD/lkDcGNOcapSKrUO0CThczandU8MjbViJzsw4ggb/HiDC/He/D9qzN7xhTM7XRTIWXfM6n6uj1+No7zXz1clJlzDLEl/iaWixITiXfWzKJyTUJQIxfLfErqFORVXLQ/3EgkAOTmDVr55QTQnf1nDJvAf4JLEVbuK/Ud2uu4oSlFEs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR01MB5145.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39850400004)(376002)(346002)(396003)(31686004)(66946007)(83380400001)(6486002)(316002)(31696002)(478600001)(83170400001)(186003)(956004)(15650500001)(5660300002)(53546011)(19627235002)(8676002)(6666004)(2616005)(16576012)(66556008)(2906002)(66476007)(52116002)(8936002)(42882007)(26005)(16526019)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ejBPcGNQNGlqTzk3TjZMTnpCcExqemJYOE5CMlFRMTFHWVFHMnVNMTgyaUZy?=
 =?utf-8?B?amlMMXZVa255WlF0NUtwOC9uQ1dRays0dWY3S25WYW1jUk1nNVlLanVkTUtM?=
 =?utf-8?B?QXRDK1U3MGszT2V3dHNNbUlHcFA1YnJlWWRaTEhQUmNmbTZmTHM5ZHl0RWFC?=
 =?utf-8?B?OFk3SHpNSW1hWVJuc096ekZhMWgvZXlBWFkwM05IV29mSnhRQWorVXVzQU81?=
 =?utf-8?B?dCtuc3Q2czlYR0t3ckY0dTNvUUQ0V0l3QlBvZUU4VEd1cHM4NHl4NGk5S1lC?=
 =?utf-8?B?OW9sTlI4azB3b0p0VEh4MlYyaElxOGhxSHBCbDJHMDloaHk3dHlDS1ZWLy9p?=
 =?utf-8?B?OXNwOWVSaGZNWEU4SGFXRzY0c0ZwR2YrdWhKVW9kZTB6bkJmSlRpWEh4alVV?=
 =?utf-8?B?ZEtZZkFtT0FTTzM4a2xZeXFrWjJDV3h0QTdzd1V4RUxmVXd4YjBLQks2RDlK?=
 =?utf-8?B?aXU4RG1PUFNLdzFqMVVWU0svTzJCR1l1MGFYRHBEVWY5YVE5Y3VaMGM2NkV5?=
 =?utf-8?B?c1VlMXV3b1lyZGdNNDFKL1QrY2RHM3M3VzNLVUo5M3V1SUtSOFA3Y0ROTDA3?=
 =?utf-8?B?c05keW1UdnVsejllK1Jmd0kyTjBBcW53QytIOVR4ZEs2OXpSelpMNW1WOHVw?=
 =?utf-8?B?aEd3MG1rc1RiTEp4S214T2s2amRmaDRTY2NtOTAzejJrOHFqanJ1UVRDMHZk?=
 =?utf-8?B?VmE3WVZ3TWZqa1ppZGlMb0p0R0o0bVNFR1J4c3NrTEUvYmFIU1Z4MG05bFRy?=
 =?utf-8?B?TVZ2c1R5V2pTZUJscGlXOWdnWFJjVDZYU3ZLZXlxOVZIY1ZOWWZYWEgwc0FP?=
 =?utf-8?B?RnBJd3M0cDlIbGExV1ZOU3RXQXpjR0t0WFpZNndYNzVGUUpzQmVvY1hrb280?=
 =?utf-8?B?UUNyWnZ4S0tYMTB5NkZyNldRRFkzc1RjdEE0SFZ0WFo0aE40ajJsbHJNU3ZE?=
 =?utf-8?B?MDBZbjVBa2tYaFFnYW0yU0Q2WWRpTS9ZZlNIYm5nUmszK09BdHlBNDNtdUhr?=
 =?utf-8?B?WmJaUHNockpPbzZ0SGRoUit3UWU4MWR4VEp6Q0VYWHJyN3A3N093T0xZbVNL?=
 =?utf-8?B?cmhBb0FtWmtoL3dDeGFTVVVOelB4N1RZdFpRaUVUa2ZlTUYrRW02SkVUV0Ew?=
 =?utf-8?B?elVQT3ZJWFZ6OUdQTUNVSW9VRy9mMzdwZlRmdjJiN3kwNnI4Zll6cGM2aEpH?=
 =?utf-8?B?WjRsWVhSbUt6RWF2OUtMVWxHQ2JISzVVVmowVVMxTExWSDduUXM0dUI4Z1E3?=
 =?utf-8?B?WExCa29nQ0tUQ2V4R0o3TSt5dTZ3WmR5eS9pNW01TWljN2cyQnpLWWJHcHBX?=
 =?utf-8?Q?KDHZ48kKQ639sTeL5irKUt0Z0EG8IPj1ys?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5145.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 03:18:40.5484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-Network-Message-Id: e1d571d0-c098-4805-545b-08d8a1714952
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CevQux9jPwJQyAj9rFcifxCh+Yep3B1Zt0gvi52Tq69i4BU3JnE+mptdi6V4xSeJtIpkxOokbInzLnQnFQVBWlWBqU2hjO26msToQb5ESEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5035
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

On 12/16/20 10:12, Matthew Barth wrote:
>
> On 12/15/20 9:01 PM, Thu Nguyen wrote:
>> Hi,
>>
>> I would like to ask about current behavior of phosphor-fan-present.
>>
>> When I unplug one fan, phosphor-fan-monitor will only update the 
>> Functional Dbus properties of 
>> /system/chassis/motherboard/FAN3_1/FAN3_1 and 
>> /system/chassis/motherboard/FAN3_1 of inventory interface to false.
>>
>> But not for "/xyz/openbmc_project/sensors/fan_tach/FAN3_1" of hwmon 
>> interface.
>>
>> Below is test log:
>>
>> ~# busctl get-property xyz.openbmc_project.Inventory.Manager 
>> /xyz/openbmc_project/inventory/system/chassis/motherboard/FAN4_2/FAN4_2 
>> xyz.openbmc_project.State.Decorator.OperationalStatus Functional
>> b false
>> ~# busctl get-property xyz.openbmc_project.Inventory.Manager 
>> /xyz/openbmc_project/inventory/system/chassis/motherboard/FAN4_2 
>> xyz.openbmc_project.State.Decorator.OperationalStatus Functional
>> b false
>> ~# busctl get-property xyz.openbmc_project.Hwmon-1644477290.Hwmon1 
>> /xyz/openbmc_project/sensors/fan_tach/FAN4_2 
>> xyz.openbmc_project.State.Decorator.OperationalStatus Functional
>> b true
>>
>> Is this the expected behavior?
>>
> Yes. The phosphor-fan-monitor application is configured to only update 
> the functional status of the fan (and/or individual fan rotors) within 
> inventory. This is separate than the functional state of the device 
> providing the tach sensors themselves since, for example, the sensor 
> can be correctly reporting 0 RPMs for a feedback speed, however that 
> should be shown as a nonfunctional fan needing to be replaced and not 
> the device providing the tach sensors of the fan.
>
>> Regards.
>>
>> Thu Nguyen.
>>
> Matt

It is clear.


Thank Matthew,

Thu Nguyen.

