Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C682EA30A
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 02:50:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8wSC0vgxzDqRt
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 12:50:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.77.131;
 helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=TypERDm6; 
 dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770131.outbound.protection.outlook.com [40.107.77.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8wPd2rCbzDqPM
 for <openbmc@lists.ozlabs.org>; Tue,  5 Jan 2021 12:48:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQEzD6V7l9WQtH+LpkB6qgyRs3kfDGWomd9pY87eb41RpdNr7CoOQQHRW16Jml+hgTIFbwMGc5a2Rh/nE3vjjShMfzoIAdz8bmIetvP+lj9G10MfOHfQkeOXpusJfkoEckbQMBKXdLC/ijCGiK2CB2AGmO4XEK61hHTXKyysGGrM7gdd/e2Jjws7LFwDcZ2Bevp1JBsC4WnWIqPFuV6MMh7+zNzzjpdippivDIj3+F+53Tp53Z8ziRG+X94h2fA4ym4mkmAYZzOYmL0kEcBPnIKK+rraXPUC61N1PQhw3ALPnT/UkwYbB4xK7RCBR2sVKo67C4JCcmqVCDQMB+ct6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6FnH2dbVNz9SM50l5FHlcb2WVQW8SA1LdZ34+1U1Ec=;
 b=NaTpLhEPCjR8eXmMLweLRVM+76oLy/i7xgh7JuymoS6Z3j0FNYH7x7dSsrWcLjQajZv7Kg+HigR3iP848P28yqlS/mUy5kokW1PJxHQW3svq1/1gtazemWeZ4tDwfKiDu6KXe8rEHxD9wMP5xsp6s9lqyDNlPRZy67pNn50QrHdh2jp8UfIshLXgBq5EQaLrADe4OEhwUj+0IPXT3nuJ2aWNBKvFIW7NmEIhEjvUR17SHWP2iR8fhnChtruSdqOWRsUls+NkU2hS4BT8XNQGFUgEpJp80kzqhumUqBinUPYR94r3bQaAh//Pw2w7e/DMqAWrj/+4wG6StQa3qmlqUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6FnH2dbVNz9SM50l5FHlcb2WVQW8SA1LdZ34+1U1Ec=;
 b=TypERDm6xGcyed61p6oLelxzE/+rh3wwiTZr+0QVctB2pug7Vu95s6YdMcGd28B88yPR63StfspNVJeeUnG9FJheaoz6o/IkNd2sMRkVuYih70lwcJ0P1wpb1vmDLp1KHr1w05seLTRMFXCaxHNOWTyela4iyd/4cXj7aaCt6FY=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from CO2PR01MB2039.prod.exchangelabs.com (2603:10b6:102:7::6) by
 MWHPR01MB2287.prod.exchangelabs.com (2603:10b6:300:27::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.21; Tue, 5 Jan 2021 01:48:07 +0000
Received: from CO2PR01MB2039.prod.exchangelabs.com
 ([fe80::8077:5998:860:1210]) by CO2PR01MB2039.prod.exchangelabs.com
 ([fe80::8077:5998:860:1210%11]) with mapi id 15.20.3721.024; Tue, 5 Jan 2021
 01:48:06 +0000
Subject: Re: create meta-ampere folder in openbmc repo
From: "Thang Q. Nguyen" <thang@os.amperecomputing.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <d5302c4f-c0c4-0bde-2a60-e943a2f41788@os.amperecomputing.com>
 <0e2507bc-f8c5-85c4-cd39-4c603a729f4c@os.amperecomputing.com>
Message-ID: <da62c090-c6a0-1844-cc2b-44846b83c89d@os.amperecomputing.com>
Date: Tue, 5 Jan 2021 08:48:00 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
In-Reply-To: <0e2507bc-f8c5-85c4-cd39-4c603a729f4c@os.amperecomputing.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [1.55.117.24]
X-ClientProxiedBy: CY1PR07CA0035.namprd07.prod.outlook.com
 (2a01:111:e400:c60a::45) To CO2PR01MB2039.prod.exchangelabs.com
 (2603:10b6:102:7::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.86.135] (1.55.117.24) by
 CY1PR07CA0035.namprd07.prod.outlook.com (2a01:111:e400:c60a::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.22 via Frontend
 Transport; Tue, 5 Jan 2021 01:48:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bff7cd56-6fab-4f26-233c-08d8b11bf2ce
X-MS-TrafficTypeDiagnostic: MWHPR01MB2287:
X-Microsoft-Antispam-PRVS: <MWHPR01MB2287F8D9A725C4ABC2F2B3A48DD10@MWHPR01MB2287.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +/rrn4Huw1yxYpysnWsPtU8DFjM2O0GxhM/jeAApzbQDPZxocn2XezJjHL1Kxi9LN4tF6kOoBeP3bJfYOL2Z9v5a2Ua9pORqbZwcFPo5ZnzrxlwfuXSqrqRzXylc6Aq1Iaq7c/bcGzJ7KWF6iTa+igbzbZAGpL/q/x5vxdQUaFeMRL5/QJBkzLOYI83LdgpqziSP9TnqG9pUYlk3cc/J9W+IcX+aaRMkC3r4YniclIBeX+1tqr4YhafnPWIk0uzGw80H3BICiH4yk7IWD/SDo1bdmv7JtKdQmOsaaHVhh8Qw+hXNsHyIdeEphICFPz9mAtSZ+qpObLZ3mZaGAQJPycTEQah+mRVCNTMd/3WTK5i6xy/cPUztyptIjbqp31RzIOq350tYC9klVkf/AmO8sku4TogiooPH5qjrs61sX03ONvT8eYHbdgSQ83Mgf+cq+p02y7rouu6bictAAeFjpaW6Vsk5Ie1gCtPoMsaFG0YDGbXwfcL+u6j92mb2S1uf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO2PR01MB2039.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(376002)(396003)(39850400004)(16576012)(316002)(4744005)(86362001)(186003)(6666004)(16526019)(110136005)(6486002)(31696002)(956004)(478600001)(2616005)(53546011)(8676002)(8936002)(31686004)(52116002)(5660300002)(66946007)(26005)(83380400001)(66476007)(66556008)(2906002)(41852002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?alRtczVkZFE5QWpRY09ENDBQanJLS2VobS9Eb3FlVTFWSnJXSG9kTVZnSktu?=
 =?utf-8?B?RUNBcWRDZFl1V0tpcmRrWWkzYXdlQy8ySHhwRVM1WlFNT2NhZnpKQytTbjdn?=
 =?utf-8?B?VXo5aEVnUWRxRE5aYkxnSXZSOXBoamwyQnFmNDZ2Y3M3SVVMWnBzbGwydUxv?=
 =?utf-8?B?RmQwUFM5OFJ4RU4xN3pZOWtLVzlweTlMZmZQSzBLUkNNY3NpK2drMkczSHI5?=
 =?utf-8?B?NzNXNDJ4WXhoR1ZMV1BkeHZpK1IyeWhhQUo3Wmd0eU14elJGQ1hzNzR1VW9p?=
 =?utf-8?B?bHZ1ckcxSHd2NEpEc2Q1T1czY1hWdlJqK2QvUHhvbGpWeVQ3Y1N4U2xiWkNU?=
 =?utf-8?B?VWhBczM4SUVvZEFzclBuM1lPbXBocDNLZk5sVlE1OWlHUTdqbWZqeStpWlJT?=
 =?utf-8?B?enJKaXlQcUgwL0NncWhYd0w2a1JXV2NDOUc5Zm96SjJjTVlJY0hqQ0tjN0dT?=
 =?utf-8?B?NkxKWjZJMkNnZXZIVkF2eEZUT2lqVWxEZWk5aHdha0xCd3BWQmdMRkV6TTJD?=
 =?utf-8?B?UE9BOVlkdkdlMUdzZTZnd0Vsb00vVXBxa2FETUJJN0pzM1pLc2NZMG9HOEZV?=
 =?utf-8?B?Z0hJenQxVXFrYzFzR29vRXRLNlpPeGVMdGxOenNubnlUdUNOT1pWcWpvSVFN?=
 =?utf-8?B?aGg0SXhYVjY0MVRJYUpkeS8xQ0tvVXZLQi91aS9MS1ZWUTJOUGtpUEdsMDc5?=
 =?utf-8?B?cTd0OE9GNmlmTTFRdzR3Ni8xMUhOV2F3SEdiRkhhdVhkVWFEWVR3MGp1b0lj?=
 =?utf-8?B?bVVwRHdzWENvcDdaMElwZG9ONCtLYk02bTVydmllcjBtc3I0TklsQmFacjdy?=
 =?utf-8?B?WVRSTlpNcTluZGVSMGpVRTEycnBPVjRPc1NFQlFwcG9PUWw0OTZyM1BDU3BH?=
 =?utf-8?B?NE5DR0xOVDVmaFBsdlBXODVEU3hSUS9jMlhNS3RxajVvYnQ4cUhmZUtiSHBi?=
 =?utf-8?B?RlR4TUpnZ1JhVmlRYkNOeGc5S3FHUWF2RW95ZHIyNkI0UjZOcUxyYUtQUi9i?=
 =?utf-8?B?RXlsMTlkNGpHb0NFL3QvakxXRzFlT3I5aTZNakNJV3U2QmV0cGtmRWRHSlY2?=
 =?utf-8?B?b25JM3V3QUVnY25rdnBFaXlOMXpKMDI3QTN5aEFQdTdxOTZualVTOEVLU3ZK?=
 =?utf-8?B?YUFMQUpNUE1wZHYyVEcwZnJaMTYzN2NyYUkySEZxaFZZYUlNd1p1WlBVMkMz?=
 =?utf-8?B?OXY0TUgvTUJESlNsT1BVeEhYMnZkWVdVWEZkNDVTQndJVjkvVGQ1SmRWWWtU?=
 =?utf-8?B?OXhTek92UU9qdEM2RmRHc3AycTg2T2NLR2E1M3Y4Q3VmQjZOVXhCME1sYU5N?=
 =?utf-8?Q?zPoHRxdUWuY4s=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthSource: CO2PR01MB2039.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2021 01:48:06.5935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-Network-Message-Id: bff7cd56-6fab-4f26-233c-08d8b11bf2ce
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CGvTNcnTTkiaKDRQrMj8uXKgYgyuarmNXM54WFYVazzOE+Frf9a4nZV3TGXFaxOMwIgywJOYxKiPgi/3LNUwGki5nIdMYCbySRnhou0yRtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB2287
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

Hi Brad,

Just a reminder. Have you got any chance to check our meta-ampere?


Best Regards,

Thang Q. Nguyen

On 12/24/20 08:46, Thang Q. Nguyen wrote:
> Hi Brad,
>
> Can you help create the meta-ampere folder inside the openbmc repository?
>
>
> Best Regards,
>
> Thang Q. Nguyen -
>
> On 12/16/20 16:54, Thang Q. Nguyen wrote:
>> Hi Brad,
>>
>> Please help add meta-ampere repository into openbmc as a subtree.
>> The meta-ampere repository has been populated with basic bring up code.
>>
>> Thanks,
>> Thang Q. Nguyen
>>
