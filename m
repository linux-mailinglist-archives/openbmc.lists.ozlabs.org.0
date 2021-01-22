Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2434A30052C
	for <lists+openbmc@lfdr.de>; Fri, 22 Jan 2021 15:19:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMhGp2h1DzDsFG
	for <lists+openbmc@lfdr.de>; Sat, 23 Jan 2021 01:19:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=amd.com
 (client-ip=40.107.244.72; helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=supreeth.venkatesh@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=0e14tw44; 
 dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2072.outbound.protection.outlook.com [40.107.244.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMhFb0pVrzDrh5
 for <openbmc@lists.ozlabs.org>; Sat, 23 Jan 2021 01:18:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PlaZSqNqXAZ1Qb+rHQhhFGyD14I3d7QvOje/BslkclSnE9jqRZlwc1eeLfVey7E6pKsl5eVjDnoLifo78uNHpV1xlQyj2ZQohgEdRK6HxHMHB6gLykWGSLlr/GJlqVNs9EtBWY+9W4+i3+6LyNhVSsUTFJPLwUpDfR3qJWWhy4NZM0jBFPuPalKwggYHmwrB76GH/Z5QLXocCb0k6gr6+tZ1XhU+/LmrMWxsQtoqFHxoiuT+qFa+XXG4cOzaapqecGm6MjwkHDFlJnFh5lr5nKEq4b6y9mqHFFpqUeliRugijLl7UpIPebpGFu460Po9W5YEjbxhC2omj58i+jodaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLr22+d1uIYKUwFO1ajMQUkADTwP5EHDz3wuuxenQuA=;
 b=b8scGqZeXCuFaulFPFbG4avjN0ggT0ApA0f/+LcYtwJKijjanJlTEFciGPgRKFW+bkiS6iCo1Y3ORqYXXAcR5dLsgHEFsQ6zxDWucI8aMbclTcBximGQ/NCHlyfPzbgcBN81xiTB8WMV14pLXPl2H+63wxrMkZxrPrYHiNkVomwFAhS6qUa6o7YseIuo2KsZpeXqyHCpbUmwYLy8JU9kPkDbVlydtZGjw7pg9Y5tXqmXL69qGGNYcgUsmGzhw7I5bipbwvggeol5xyVAhIh4SDf0IGNEkoSsWk0IvwdeOtgGp7Zk5TUzzy/R3TMlIGMFaOy7iEJ8sFRzZJwzyoZX4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLr22+d1uIYKUwFO1ajMQUkADTwP5EHDz3wuuxenQuA=;
 b=0e14tw44NPJEbMooD4dHbnsxu71pWTuYFTyGrS2Tetf9euR0/T9Z3oCssJDpbI8UCIQ/5G98p/urLFPdkJH5QQ8VtBWXw2Jq3ByOZvzuBurIPt5BLU14kX0zlwWSv6Ny/hvqxDLNV+GBcKWCavVtGHwmSvBhxQFpywhDtPNjsYs=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2542.namprd12.prod.outlook.com (2603:10b6:802:26::28)
 by SN1PR12MB2367.namprd12.prod.outlook.com (2603:10b6:802:26::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Fri, 22 Jan
 2021 14:18:31 +0000
Received: from SN1PR12MB2542.namprd12.prod.outlook.com
 ([fe80::d877:4772:5272:33a4]) by SN1PR12MB2542.namprd12.prod.outlook.com
 ([fe80::d877:4772:5272:33a4%5]) with mapi id 15.20.3784.011; Fri, 22 Jan 2021
 14:18:31 +0000
Subject: Re: Progress Codes in BMC
To: openbmc@lists.ozlabs.org
References: <4795347F-477D-45EF-A145-0C7B163FE01B@getmailspring.com>
 <CAM=TmwXEmFc95mBEg4G8bUNoBq7qDL9i_vv=YtomRDrVPDYBEw@mail.gmail.com>
From: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
Message-ID: <7821f27b-31d5-a9d9-a6e6-d709e5456af5@amd.com>
Date: Fri, 22 Jan 2021 08:18:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAM=TmwXEmFc95mBEg4G8bUNoBq7qDL9i_vv=YtomRDrVPDYBEw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: CH2PR10CA0027.namprd10.prod.outlook.com
 (2603:10b6:610:4c::37) To SN1PR12MB2542.namprd12.prod.outlook.com
 (2603:10b6:802:26::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.236.136.123] (165.204.77.1) by
 CH2PR10CA0027.namprd10.prod.outlook.com (2603:10b6:610:4c::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.12 via Frontend Transport; Fri, 22 Jan 2021 14:18:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 676eb096-3929-4e2f-faec-08d8bee0984f
X-MS-TrafficTypeDiagnostic: SN1PR12MB2367:
X-Microsoft-Antispam-PRVS: <SN1PR12MB2367D6FED9DD40398D3805AD96A09@SN1PR12MB2367.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +C3yffjsT/kmFxtWhZHEJfw6D2PipRkVrLglYhlal858INmvw27ucl6eE3IbezAMrwIbb6YSEoh+Ul8w0lt8xtgQC0uxMHM/I4RszRKH4quhXtM3FVsoBDxd+g+gbeUF2TxKB6L6EXu5oWm9lIOfMd673W4Ue0PyYEUsj7IB1Ips0osdIaZX+AGG7dF+kEmbKNFN4A8toghlW2g2O++t3+d+EK0/FYiVJKAEX4bx4aGa1b1kfdg4oGjn3hgzSloHVm56D59Mb8tE1nN75PViKmv+YZ1gJoVMO3LyRnds7uOeP1cVJtrhzqSr+0brVNyrolNvSlx6lOTfPxFTWJSk92TtQMUass9a8y+BCfj5pjXJYtccXGvxKiJqhtajowLAHNnOojLf19KY6EnnTwyvhxzmODxGpkIcJgIO9Uwr+3fH6ceHNBfASfUM1j65F9YS8jxHFucN80hVt6oJ4VD/pHi+/qTldjTrAwGiEaKO64O1WJV656leRjeuxe57xjnnrADgrnG0TQ0sSD6eDliNzh91043x42EugbavRKeyaKsbid6ejsrAb4bmqNXEANSf8keJ1luPrNuuv0ZPM4g3fT5aM/GtSNf6SonQNai9AFALJDtYZcMykjSxBub05cbxpmxFV/sumfdbS2/Vj7u9BTOVRmLUkHtKZQSGooWpADlnMPGYrGgquNiaq9GN+WyZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2542.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(956004)(16576012)(31686004)(8676002)(2906002)(53546011)(2616005)(86362001)(52116002)(44832011)(316002)(5660300002)(31696002)(36756003)(3480700007)(26005)(16526019)(186003)(6916009)(66946007)(8936002)(478600001)(83380400001)(66476007)(966005)(6486002)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aGpOUm5hRUU2aEtPaGZ4TDBpS01tbVZmQXdpc3ZzbmtmcFJ3a2srWmw3N1VK?=
 =?utf-8?B?WlVzWGpvVlB0eDdCQmFVUWZUQWx5MWhXdmhqcXNNUVd6enQ3cEJGMDh4Yzdh?=
 =?utf-8?B?WmhJWHpsaHZrYmlTaVlQVExYVDV0OEJlTjhFbmRNbXdvb3NLVDY5dllmWGhn?=
 =?utf-8?B?NE5GS1Q1azBiVVVJWWh4Q3A1ZkRXUFBkZXhrL3ZubkNzOE5HQjQ4YTAzSVIr?=
 =?utf-8?B?RFBXZE5UanRlR1lDRnBidk42bGdjSWxoQ1VBeWh0UXJnVE1RZXBxUkRxYWJ4?=
 =?utf-8?B?bHkwY0l2S2I4UjNSZFZjTTZKN0xPR1JHOE1DVm5rT3FNbkNia24yOXNNcFBY?=
 =?utf-8?B?eSt0b0IvbXpuY1RmdENxMmtLdXAvV3Z5S1JFR0VyME42TjJEcW56bHVidDE0?=
 =?utf-8?B?dEJtOGZRK2hrV1YydSsydTV5N1lCUmRJaVdsSHlKOXN5R0Vvc0cvTmpONnYx?=
 =?utf-8?B?TzB2elhXR2g5VXdEbFlZMmI0TmtjR0s1bzVHY1IzOS85ZFJ6VVNYbmd0SWpN?=
 =?utf-8?B?dUZsNWFhZytnVWdsQTZSc0R4K2E0bHdBSklIZmdtb0hkWk45RnlickF4N21X?=
 =?utf-8?B?ZXBHMzQwVVRuRXl2cHJBdkRxamRrdUlLdkpjcExrdFhjOXg4MFBYSVM2VUNT?=
 =?utf-8?B?TkdwbHpIQWV4S2plTHI2eDB5eC84LzBjL2ZDUUJGank5WkNWYUEwazBmYXc3?=
 =?utf-8?B?RFlWL0d5MDUvalkralhlTnkzemNQakZKcUtYMlJRL2hQdllPeUN4T3hvNGQr?=
 =?utf-8?B?RzFFUnVUNS85VE44TWVzMzVMMjBOc3JwR1JzY2pPQWxRbVpKSCs2SGhrT1gv?=
 =?utf-8?B?b0x6UzZXTkk2b3dBaXBRbDJXRXJhR3Fkbmkrbm0rSGVYTUQyek12Vzl5ME05?=
 =?utf-8?B?MHh2cXhaS1FxQTBhbXVoYmtTcE5PTGdRcEs4NFFSb01WLzROVWpKZzRWUWpB?=
 =?utf-8?B?dlI0ME9uZzM3ODkyMGVyUnJmL2tib2RsQm9pbzJCeWszb3ZYU1FKY0hiTGtF?=
 =?utf-8?B?Vkozd1lhNUROMU9ieXpiRHRPQUhmUkJMWTR2NlpSS05FczhTZFVqZTQ3QXho?=
 =?utf-8?B?L3Z5eVVSaXJDalhxTitJME0yQytDeWZGZ3pOLzZMVWJkcTRrTndMaWdPbkhO?=
 =?utf-8?B?K2lTUlRaaW9xT3gyZ2VSc2d1YUQvaCtTTFFZK1NTajNodEVzL3NpRFBSQkNk?=
 =?utf-8?B?NVpzbjM4bUE3Zjljb2l2Qkt4SE9qdWdHTnRKV2V6NnkwdUlzQWVvL1ZvWkdq?=
 =?utf-8?B?c3VucFNFT0RmaE9BTGFna3pFWGdoZHQyRktyanM0UlluZlI0OTduNjFXYUpZ?=
 =?utf-8?Q?IEL8zTJjyhkdE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 676eb096-3929-4e2f-faec-08d8bee0984f
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2542.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 14:18:31.3403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tdLnXAXmGLNHC5mQ9j5i+umhx9ltj6QyJTPX5qDLuY48okkfOEXabN2xMLI2rNQVxAG8dnWO4iEUk94vOycUog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2367
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



On 1/22/21 6:32 AM, Deepak Kodihalli wrote:
> [CAUTION: External Email]
> 
> Hi Manoj,
> 
> On Fri, Jan 22, 2021 at 5:25 PM manoj kiran <manojkiran.eda@gmail.com> wrote:
>>
>> Hi All,
>>
>> IBM Servers has a feature called Progress codes[1]. These are generated by applications on the BMC & host to show their progress via the standard interfaces like GUI & control panel [2]. These progress codes are used during boot hangs e.t.c to provide additional detail as to how far we made it with respect to boot.
>>
>> Does the community has shared interests on this & would like to collaborate ?
> 
> I am interested in this problem as well and would like to collaborate.
I am interested as well.

> OpenBMC already seems to have solutions for POST codes -
> phosphor-host-postd, phosphor-post-code-manager and there's a
> Boot.Raw.Value D-Bus API. However it would be nice to have a more
> generic solution. I think it's hard to converge on the format of such
> codes (since they can originate from different layers of firmware
> stacks/bootloaders and some of these layers might not accommodate
> PLDM/IPMI etc). 
In this process, We may have to extend 
https://www.dmtf.org/sites/default/files/standards/documents/DSP0249_1.0.0.pdf
which has a 16 bit state sensor for Boot Progress. As well, We may have to make sure that it gets mapped to 
Redfish.

What I mean by generic above is:
> - A generic D-Bus API for progress codes
> - A generic app for managing the policies around such codes
> - Platform specific "Producers" of progress codes, conforming to the
> generic D-Bus API
> - Redfish mechanisms (LogService/other) to extract codes

+1

> 
> Maybe some of the apps I pointed above can be extended for this
> purpose, but I'm yet to take a closer look.
One of the deviations on AMD platforms is that POST code is usually 32 bit code.
I did extend phosphor-host-postd to read 32 bit codes and added experimental associated driver in Linux, as LPC ports supported is only two.
However, it is far from production quality code at this point. We can definitely collaborate on this to arrive at a generic solution.

> 
> Thanks,
> Deepak
> 
