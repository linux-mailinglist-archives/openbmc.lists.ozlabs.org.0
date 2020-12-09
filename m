Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 762032D3896
	for <lists+openbmc@lfdr.de>; Wed,  9 Dec 2020 03:10:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrL9L655JzDqkR
	for <lists+openbmc@lfdr.de>; Wed,  9 Dec 2020 13:10:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eaa::730;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=RUmFi255; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20730.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::730])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrL8H32RmzDqhD
 for <openbmc@lists.ozlabs.org>; Wed,  9 Dec 2020 13:09:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LmiHvgZUDbYSzKzGAqEPtaNTXBVg5xJlufD2Z8AE+T9dsaIcA8qynhPhuLvp88EmG1agsPxoeWRfftQLEnQ41BPWZewi5sJbowvpVkshyy8ZN23IwpprL9gwzzavMbwFFQ3hI/zeRXPpW5aIQ3xa2AZpVaiFwVTjKmWnyem/7sSyj4Mf2NCQyY4iP8Rdyg2+SHFWo+Y6HTTyxSSyJQW1WM2fV490Tnah7UUN/7jaAOV5QrBGlzC4RYXOaPn88e7RaYePE57wzhIZkWszYQhX5YBfkBDXUj8XvOFTNH0qznuTGC6b2Vxn/Ef36+ltfZh9cxDlCslFJWaHXe6fUqtNdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLkf32SLiCXR61y5MxFt7vZH70qjuGT9q+M11asPbO4=;
 b=kpvBBRTQH+z+xoz2sqfNmsY+e4UMWcbZCh2VVKGU5DsCBNaCEEn7n2icm8Ep+secbJskW+qlkeHpTAxG/wvgC9DhzRksM9gL96aRP2RHifstYxOuxBiB/tC0CqbnGqk1hEU+4V7uEwFcycbXEP8lrPizaHzGMI6DVb18vH8jQW/eTqPU8/akydAUjbD9FXHZv0DvCyuILHmbaPL9snbApA/K9dIRj3pF7sm8+jEtqlGA9apJiEduTxaTA0EuP8ChQnhdpZPy68LfMwIaROdanJRiMcTdRk6EGpkAL6k8iK3v5RN+I7ivulDa9ccmJGZf9WSOd7o6mkPJp2oBYt4rZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLkf32SLiCXR61y5MxFt7vZH70qjuGT9q+M11asPbO4=;
 b=RUmFi255p83V9fU7wFUrUdikaS7Nit15KOC0o6mzyBxqKnduM5Ug40d5pLNZiOa1ERxxrTvG+UAhoTxCVbgbA6YlOyyfgd3vZvVvtdSLC5UcmZUx00Kv/alLDlPOof5BBr/fq3nzsyDEtW8Pa63CKTAUSKhVpvIJm2QrYi02z54=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from CO2PR01MB2039.prod.exchangelabs.com (2603:10b6:102:7::6) by
 MWHPR01MB2687.prod.exchangelabs.com (2603:10b6:300:fa::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17; Wed, 9 Dec 2020 02:09:04 +0000
Received: from CO2PR01MB2039.prod.exchangelabs.com
 ([fe80::8077:5998:860:1210]) by CO2PR01MB2039.prod.exchangelabs.com
 ([fe80::8077:5998:860:1210%11]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 02:09:03 +0000
Subject: Re: Request for ssifbridge repository
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <1630860a-0de3-a89e-ab70-66ade1d8e0ef@os.amperecomputing.com>
 <20201208213049.3fnst4b3qdwpa6or@thinkpad.fuzziesquirrel.com>
From: "Thang Q. Nguyen" <thang@os.amperecomputing.com>
Message-ID: <2804fc21-57b2-2c24-56d0-4298133abdc2@os.amperecomputing.com>
Date: Wed, 9 Dec 2020 09:08:55 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
In-Reply-To: <20201208213049.3fnst4b3qdwpa6or@thinkpad.fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK2PR04CA0087.apcprd04.prod.outlook.com
 (2603:1096:202:15::31) To CO2PR01MB2039.prod.exchangelabs.com
 (2603:10b6:102:7::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.38.33.206] (118.69.219.201) by
 HK2PR04CA0087.apcprd04.prod.outlook.com (2603:1096:202:15::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 02:09:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84d7994a-d181-40d8-a150-08d89be766ca
X-MS-TrafficTypeDiagnostic: MWHPR01MB2687:
X-Microsoft-Antispam-PRVS: <MWHPR01MB2687544A09113E8943F38E788DCC0@MWHPR01MB2687.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: znIcLxzWMwIvjVOAGu79R9+Qbw1vN99Tr4LQ/5s2AnRw/zwCGObMJpMKqr+kJu9KCRcUK3r/DnD6K0vUJZCtruYwndcytoXgjIte+AzGUDv9Y3KoDiY/zIP4Pszd+am9VU0MBvDYv6DDMDaGrGgwlKNZ0iUi7w/Nb7dNIfLGDt7RnXJyg7X3xARBGt7GUSvgDnd8jc8ysTuAeh5/jKUR0xbEZ07fFgco0hOIhjYHo8iIse3bphkvfJVa6IvjJSNFbwD3NNLNngPR9hn8HfRq5K+5aoKiBtQPLJf/fET53WgsI6rqpSOskvhsD6MzA5FK9AQHIfWmwrvgYPgG2sX4rTZUmlOmGAYA4q1bicwkKIWEBYfW6VU69ErY7hlOazS9B9m4BIr8Fa3N+xb71dYkC5BDTJ1qdYYrhXWbJrOWaHdmQ9Xis4qPkgLLy5mvR+VIrf9xKryX90hwrJd0PLZrOz7rwjVN1HBQVg3+Vx9QkNAPAA+lyKAuf2Q1oeIxdmmxxG+/9avg+JISOk7mSTd/W6/Im5RJjyGn6ABktvSE56M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO2PR01MB2039.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(366004)(66476007)(5660300002)(2616005)(52116002)(966005)(34490700003)(6666004)(16576012)(508600001)(66556008)(956004)(31686004)(86362001)(6916009)(186003)(4744005)(3480700007)(66946007)(16526019)(8676002)(26005)(6486002)(53546011)(31696002)(2906002)(8936002)(4326008)(41852002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L1lVcGlOQlc4MmlMNXg1VnJiSFdrc2RhNFkxT1F4c2d5VWNoY3NRZEtOZXZt?=
 =?utf-8?B?SHFYNEUvTXFFc1ptaUlwazZEZ3h2bWlRamxXeFN6Ny8vUFJRVFpBbFdFd3BW?=
 =?utf-8?B?SnRGandvaEdaeldnL0tNaStlSTVyWGtOQWJtVWRuZ2VxVkRpdXl0VXJiU0NF?=
 =?utf-8?B?LzZvS1l4Y1dIeXphY3VFeFROTk9vT0FEYzkzazZNc1FwR0JWU05udW5JeGVp?=
 =?utf-8?B?RUc0c3RJYnRjU1M0ZFNMNnhMY2JhQUtaZ0VLWEFOUkh3VGV1aUxUTXBLclZl?=
 =?utf-8?B?SGduTTFmU1VPWnU0V3ZNMWVCR0tBRVI2RjV0VnRWNWlrV1d5d2xQUUdmMTlv?=
 =?utf-8?B?ZTBYbFIvWDdhTHp4RmNodnF5ODFUNlh2YVpqKzNUWjFOTjh3TzdKUDlZTWcw?=
 =?utf-8?B?WDBZK2d4MlV0MTNQY3VNQnlTNm9CYUI1dkM3WGFNUWo1OHErVGVFU1RlWnV4?=
 =?utf-8?B?SmMxZlJqZWw2VmJmQ0I0cHI4VHozT3FvV1NSUncvVzBDdGYzUmR1N0tBN1pl?=
 =?utf-8?B?bEtEbUJIbUNhMDIrNnpGVzJWZHovNFlKZWZ5SjF0Z3dUYlpFaDRFVDBib2Rx?=
 =?utf-8?B?Q2duTUpNQWl0dlpGNmp1MmswVjZyYTg0ejMrYmpZZzFudk5Rek9mWWpKM1FE?=
 =?utf-8?B?SWx6ZHh5UlV4RnFraCsyMlR5dHV5RGRkeFpJeVp1QmI2d3hjbU1CSE5WV1lO?=
 =?utf-8?B?OTJlU2QwdHhrQjBYK1pUMWdaUk51YjNiVTV1T2FKN01BaVkvZ3JadzJUNFBH?=
 =?utf-8?B?cm5uYk02Yk5nck44ajRKazJ4OStuZlV5YnZ6Rk8xbmxpMG5qQmlldU1yK1M2?=
 =?utf-8?B?T3A5VEZKOFJUSCtkOEJnNk90T2lxZ1Z4elZ6N3dpb1V4M1NDRkxOMEk2Z2JG?=
 =?utf-8?B?T3lQV1duNWEvZC9TWDVPRHRCeXlWaGxBckRhNXErVFZVM2RWWVJoVEs1Z3Jr?=
 =?utf-8?B?bDYxbU9CT1pFWkl5OVRWdDN1ZW5oU2RTYm44MWlOUGlSeCs0OWM5cXVLSWla?=
 =?utf-8?B?SUJ5d2RzeUdDQkkvNmltVWZQMHFCRVFUU0V6SURYZjcwSVhwYjdJSmYrU2lV?=
 =?utf-8?B?VGsxT05vVzNlanVxSXlOeFhzQ25PZ0RydXpteVMyUnQzUWZrUDRCUXVEWnpY?=
 =?utf-8?B?bXBIZlNQbU93cWhnQ2grQXBKVmR6ckxqNC9Zb2NDMlFycWwrWDJPVmJ6VkJq?=
 =?utf-8?B?VXIwRytyTjBFZExPWnZnaTN4aEVCZEdzY0ZsbFJVdUh3SDZFWVRLRjZBd3NK?=
 =?utf-8?B?RlY4UGdOdmVqNCtoNnlzdGZjT2F4T1hHQ0pNN2VBY3ZMT2s3SEFTV2lvZmNh?=
 =?utf-8?Q?dCF3/71wfIWt5t+7R7MI/WTX3L3jNK0F4u?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthSource: CO2PR01MB2039.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 02:09:03.4482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d7994a-d181-40d8-a150-08d89be766ca
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: md5nU93yYsaIHGD9WIBCsgH0yzqhZ/tq2lzD7Ha/HLbM14do5jgY+87KiET0togCELVrPO16GOkRqS84MO5AwF8AZGuL7QZbXmi6WKIe4dU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB2687
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

Thanks Brad for your support.

On 12/9/20 04:30, Brad Bishop wrote:
> On Wed, Nov 25, 2020 at 01:48:34PM +0700, Thang Q. Nguyen wrote:
>> Hi Brad,
>>
>> Could you please help create a new ssifbridge repository under 
>> github.com/openbmc folder? We intend to publish our SSIF bridge 
>> source which is based on https://github.com/openbmc/btbridge but 
>> apply for IPMI SSIF.
>
> ssifbridge repository created.  Thanks!
>
> -brad
