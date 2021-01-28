Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DACA6306AE8
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 03:07:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR3kw0Vz7zDr0N
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 13:07:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.76.107;
 helo=nam02-cy1-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=dFp5xm9Y; 
 dkim-atps=neutral
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760107.outbound.protection.outlook.com [40.107.76.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR3jq50K2zDqKK
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 13:06:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/zxy2APG1QYzhyVpL3UwZbH7KpR9/Hxa/r0IFMIjXOIyg4+jlqjXltk7g46I4nZ3OOmAVh2TOsuyr1ScVVRd8+NbeENgBnjhTkGcN8cGcGo/5md56h9217u3Zbe9yvl8N8/RC38mGfUBTFimONkFHddoWFZvJ8MLsui9Us0/v+ylGKS7F8OVhHPnJ7hLm6PKKzozTFY1TXCIykj/eZVMnBFTEhgkPcow/jZSg1br3VIyKev6s2JG5TEZPeDjlOFb0nEDRepmHOoaMlDgvgeBxhvxCsdVkVUo90jSO09Rt40nynmWLSzzNG7Rhn5Df7vEqAGocZff/8HUq/pryREeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NV0YZvOi63kBLz9POYtb9vxrkwCcd4497e85FgMkGqA=;
 b=fNmwFUTObWN1EuEhmEgPBxTQwdca8IySWrWiOZ5ewEI88+yUsux8CNAUfe2bl46JyFn8TXHcs2JpT+kz/tP0S7iWJ/QHose4261DwuUow3eFqlxWSfVHXT5tw86k0Y8p1UWJCyyuXETs+I0dPTB30RupWrS7YvNc4AW36qqkZdZnkrQarKytllwZlP6SfTEE+TZ+PtytmVt94Bl95y/1Rvda6+aXD+duk9C7L86qMDYEwLYa987dNSaEDeiTh1VeWP3V9jGj9KsVQ228d5BEKu4K+K9YRM0hVbpX4RqNvLxLJQke7syLyhLowRarYHh8T/1wSjis80GHwy4zM/AT3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NV0YZvOi63kBLz9POYtb9vxrkwCcd4497e85FgMkGqA=;
 b=dFp5xm9YBOj+InEyOuqfqjaGEAbdPQfgKa8HwYAc/puGHCkDlrMKwJnmziLBlkG7oOLbW7Y0uHDtDOok5HiVVYa7VTsAYYl7iwi1aLusOxyxs4wYLPGSQYu0lU62+OMUr3xmLPrZAeHF7Lpw40CVSTYpcPLjc3STo2db8eZKMI8=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from CO2PR01MB2039.prod.exchangelabs.com (2603:10b6:102:7::6) by
 CO1PR01MB6519.prod.exchangelabs.com (2603:10b6:303:f1::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16; Thu, 28 Jan 2021 02:06:15 +0000
Received: from CO2PR01MB2039.prod.exchangelabs.com
 ([fe80::8077:5998:860:1210]) by CO2PR01MB2039.prod.exchangelabs.com
 ([fe80::8077:5998:860:1210%11]) with mapi id 15.20.3805.016; Thu, 28 Jan 2021
 02:06:10 +0000
Subject: Re: Gerrit owners plugin coming
To: openbmc@lists.ozlabs.org
References: <CACWQX821ADQCrekLj_bGAu=1SSLCv5pTee7jaoVo2Zs6havgnA@mail.gmail.com>
 <CACWQX8236dghCCdnDAdnij0Di_GF7DsmAO_xEtWmk6ckKDocYg@mail.gmail.com>
 <e18c023a-ccb3-6591-1092-cd488cd331e9@yadro.com>
 <CAH2-KxAC1r2tSOmbCyyvnYcY0Z-iyW97FoGHbtzitVNH1u5jow@mail.gmail.com>
From: "Thang Q. Nguyen" <thang@os.amperecomputing.com>
Message-ID: <5a209aef-f6cd-40fe-bd3b-8a4e1c623c8a@os.amperecomputing.com>
Date: Thu, 28 Jan 2021 09:06:02 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
In-Reply-To: <CAH2-KxAC1r2tSOmbCyyvnYcY0Z-iyW97FoGHbtzitVNH1u5jow@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HKAPR03CA0022.apcprd03.prod.outlook.com
 (2603:1096:203:c9::9) To CO2PR01MB2039.prod.exchangelabs.com
 (2603:10b6:102:7::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.38.7.183] (118.69.219.201) by
 HKAPR03CA0022.apcprd03.prod.outlook.com (2603:1096:203:c9::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.8 via Frontend Transport; Thu, 28 Jan 2021 02:06:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b21eface-698c-423f-e06e-08d8c33147be
X-MS-TrafficTypeDiagnostic: CO1PR01MB6519:
X-Microsoft-Antispam-PRVS: <CO1PR01MB6519AFCB4DEA5AC4829D31E88DBA9@CO1PR01MB6519.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zKN8fRJYCE6x08Fd/HqUfP9Y9Ym0nsGCHnXxRKh9zNlWjHn1VvdkNhYZsjnCsjl3TeyvkuQofvZQHzPhyoIeKZPe9pioJsRwx6p2HYVFE0mbZbXn7KBwqrJlfyN9p4jP/4FNoh1aCwzD1ZV/USo4FrZEQEbxXsdvimsu4WYoNWaSStUInp2kf+xOVWFhXDdi5ZFZdf+V4j6V7V78mHwnh3XxmFqDufvuXWWcK8VJudi7c+sRXbn6AYHJZu1sk4q6EB2MfZrW40jae4EeJLlmOn2yQN23x260lFSeVyy3sv63cWzSYJc6uzegbd/K+V46Vm90Mkh6/sQTqka4xHINScD7e6/L6bCRnejwGms75zxHcDh7iHAtpDDyOQTlYOdQqFqlmTlx1VsxgkBKd+LTEblhc2OG/Y1cDSvmCelg+RO91968RrbHG8p1BHCSTu8Rzv9jLYSml5uHF8lbq59DGQ3R+fGNG9HxPMM3V1r3LV2rPbYj8rSRnzatNCNDw4nuoCOBWL3D6f9cOvNz0pjTRY6m1v3DV3v0Tl6ORJNEmWYRbxFbOC10NQE71SKTP4hy+Hg32R+f+X5aSa9oXxPlWB0iNd+DIY6nie4EdfYSx9r+z9OMM4f0V2iJHVjSGubBEikeUHYrSCpXMXszU60sPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO2PR01MB2039.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(39850400004)(396003)(26005)(16576012)(316002)(186003)(16526019)(31696002)(3480700007)(6666004)(956004)(86362001)(53546011)(2616005)(52116002)(66476007)(8936002)(478600001)(6486002)(5660300002)(66556008)(66946007)(2906002)(31686004)(8676002)(6916009)(41852002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dHprNjFoOEQ1cDNyU2t2dnliUFhVZ3ppZDl3RFRhYkdWYmlVMEZDTlhJRHha?=
 =?utf-8?B?dk9VdEpwTHBJUVFURUhDb29kZ3QwUWtnQU0zU3pmK2hXTzlya0ZwZXRzdHpX?=
 =?utf-8?B?UmkrTmlrK2ZxS1ArdmVYbG9VTldQUTlaTDZ0cGpNM1p1aS9Qb2hsYVRxZUVl?=
 =?utf-8?B?RTZ0WHREL3JZWEY0OEg2T0JYcEN6d3NuWkVNSTk2S1k3bFhkZG5HaTRoeWRw?=
 =?utf-8?B?a2xnTzloSndPZE5zUDgyZVVSdUkxYW5DVmRxbkxOMm95VS9ZT3hBLytXKy9w?=
 =?utf-8?B?L1JpS05TMTkrdXhLVmwxNUcxc0pWRG9SVDVVdmRmUUJQYWd2eU5SQ1VObktT?=
 =?utf-8?B?QjY2RnlqdXZvbDUyZ3pGdHFhVitQeXl3cnkxNnZqNzg5a2RnME5LVG04U29T?=
 =?utf-8?B?a1lQelBDZzhlOFova25zUGdGVmRvaFlaWEdCTWpmTUNwN3VMb0lkMzhQVW5V?=
 =?utf-8?B?dGN5Y1dhWlhqRUxzNVFtd0JhV3FBL2lTckt5WEVOcmRLWDhibGk5QkROTVJ1?=
 =?utf-8?B?UzVvbzdmSmpLN0pzV01uVHVjK2JKMXhKb1Z0T0QvcVhsSlpxaUFCYTBwUCtJ?=
 =?utf-8?B?SGFyUTl6cE9Bbk9JMGlBMk1TcXRjT0Z2RXlHaklxcVJ1OGhwSnpUbGhVeGFw?=
 =?utf-8?B?Rk1DcC9aSzBydy92TWZSZTg4dG9wYmM0UzlFcXRHMnFnNE15b3RCdVozVzNr?=
 =?utf-8?B?bUhJWFAvUmwxaDlWVzNjQndjeU8zRnd0cTN1a1VhU2RrT1JDVGJRNmg3S0tP?=
 =?utf-8?B?bHJRM2greUJyWGtJTU5POGd4eTJtMGNucjU2TXVORk5aQ3VlaE1PcHkwWVZF?=
 =?utf-8?B?cjF5WlZZVWRsYkN1Q1ZFc0NPODFHaXJxUHZpM0hBcU5UOUJ1K2UwanFJMldU?=
 =?utf-8?B?ZURGTitTTGdqbHhhUDdLNlc0N1ppL090N1dMZkw3MEZ0bllrR3B0elJrcnpn?=
 =?utf-8?B?VW8rNktmbjJ5VUkrZGpJOUthSlJ6R2J0dWtlS3h6RjY1WVVTdnVtV0hHci84?=
 =?utf-8?B?Q09QWkVXeHJNd3dCOEpIZXlpL0tyQlVtZlc0emxrM05sdXZIWnJSZit0REVu?=
 =?utf-8?B?Sml6Q2R1WDFTdnVLbjlRK0ZRYVBsUDRYMDA1c3MyN3JUdm9DVkVvdkowTVBB?=
 =?utf-8?B?TjFieUg1M0tYUDl6TGFhdjJXU3UrMGc1MHN1S0I0Ym1oZFVTVGM2VVNHQU9i?=
 =?utf-8?B?WlAwQlp1UUlPWGRHdjJJcVBoTHJPYnFTRENxcktwcjRGQmU3YVNIcFNnU085?=
 =?utf-8?B?eDlKQU9CaENBUHYrd280Q3BRYTJkK0dYUUlZaUZObnM0a0sydmZ3cU54Zlhn?=
 =?utf-8?B?ZEc5Vk1MMEY3bWo5cTdmRG4wN0hBanNRVitheTZ0U0ZZdTVEcTVvNXdaa2Vv?=
 =?utf-8?B?MEZlSEhjYlZ0RWlOaW5NUURReFY1RnlPY29Dd1ZKeUJXaFF6ZTkwZ1dlZE91?=
 =?utf-8?Q?CI2HH/sD?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b21eface-698c-423f-e06e-08d8c33147be
X-MS-Exchange-CrossTenant-AuthSource: CO2PR01MB2039.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 02:06:09.9239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NMW2nEQaKfhTMfBEPs48NfTfW4XV4DQ6SUWTOEoNpN+p7CesndcavS71hwViGmioisMcjYxL9ISxewKzGh8EJ/tn7+fkO8/a16Ge9Zo5J74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR01MB6519
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

On 1/28/21 00:09, Ed Tanous wrote:
> On Wed, Jan 27, 2021 at 4:02 AM Alexander Amelkin <a.amelkin@yadro.com> wrote:
>> 26.01.2021 00:26, Ed Tanous пишет:
>>> On Wed, Jan 20, 2021 at 11:23 AM Ed Tanous <ed@tanous.net> wrote:
>>>> Over the last few weeks, we've been slowly getting the gerrit owners
>>>> plugin deployed and tested, and got the OWNERS files merged into their
>>>> respective meta layers.
>>> These changes are live.  Any commits to the individual meta layers can
>>> now be submitted directly to openbmc/openbmc now.  If there's anything
>>> broken about the new workflow, or anything unexpected happens in your
>>> workflow, please let me know on discord and we'll try to get it
>>> resolved.
>> Does this mean that meta-<vendor> directories are not subtrees anymore
>> and respective repositories are now obsolete and can (will?) be dropped?
>>
> The intent was to make them read-only in case someone was relying on
> them directly.

Hi Ed,

Any problem with meta-* repos which have not been integrated into the 
main openbmc repo? For example, meta-ampere, meta-fii.

And with the change, the new change will be submitted into 
openbmc/openbmc repos in gerrit instead of openbmc/meta-*?

>> Thanks.
>>
>> Alexander.
>>
