Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 61391263426
	for <lists+openbmc@lfdr.de>; Wed,  9 Sep 2020 19:15:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmpYL3g3RzDqGB
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 03:15:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=nam10-mw2-obe.outbound.protection.outlook.com
 (client-ip=40.107.94.82; helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=supreeth.venkatesh@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-amdcloud-onmicrosoft-com header.b=zF8j9G3E; 
 dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmpWf6CdMzDqN5
 for <openbmc@lists.ozlabs.org>; Thu, 10 Sep 2020 03:13:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJZ0OYCzcFWBq3Rf1x8JmanUdmcCCRBBEa7M/avBdv88nx7JgKupxrYSQwYaJgGAJUEHsSAVyuyFKZz9eakh0FLfRH4UoKSbV+Saldro63vJCold22QsTcSfeKwwVBC6IvqVIM5UwDPteFycKRD/rmRz6UF7Pg5A6HRqQbWO4QcJGzwYGh5iu96pHpoBjzgA5+GR/2qCVQvXJCq6/ks+TDxyisPTB4ElnKr7zQ2upEbOXW2YxjA6xON0bDVeU+ZCX+A5lWJmbXvSDMTtl87S8dgSGCSMDCPJA48n+Ip55YHGpQlEnDDaoYa1vJ2xJs/s1SJqFP/URZIZAbCLScEP0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1l1JTulOKwjRMmkm8A5yqEP+ggMmw2WxW41/3MA4lA=;
 b=Sz/rdSoapZbeWxW9ASwJFuO7SgTinULvVUrjok9Q9pzOgoxTmTtCo+wG38Pi5ntmkF/XNQL1/ZJV05IeFfzxSRhsWEZWQHxYCXuBb3EuJS23atv08piaqRGB1sziFyYxDo9EK5ZDuxv+G2SU+1urMcCFSJZUsm/N0YVnQUeNIHCjYhUZJpTwWVOsFNYMirTsk3MNIfJEJ6sXpOy9p646QtcqHVCIzmwJ8uwZAYOYX2uYeYTS7h0v6z4wRmtNTVxlVVV3tan0p/s2fZp1TPCTMsx+5W9w4xx11Yn656rbKaUoE8fIm3ez2usT4sl2sLlWwI6rsczdGJducAPfRoeDIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1l1JTulOKwjRMmkm8A5yqEP+ggMmw2WxW41/3MA4lA=;
 b=zF8j9G3EJ7hptJPDWSzovkYFAvUoPXwqiGw6+/yt/8yaEBPioncXFC6S9Q0Dz4WCbo3xl5ZRplSpL6yZk8eB6AmFXWZeXEJXkJKkGbej0K1P4B6JCTBwVF79oVrW2UP672JVOjqU3XqIPXYiICNcdD+bHEn+KdD5p0awtE3k1VY=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2542.namprd12.prod.outlook.com (2603:10b6:802:26::28)
 by SN6PR12MB2639.namprd12.prod.outlook.com (2603:10b6:805:75::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 9 Sep
 2020 17:13:22 +0000
Received: from SN1PR12MB2542.namprd12.prod.outlook.com
 ([fe80::7d62:9500:521b:40a4]) by SN1PR12MB2542.namprd12.prod.outlook.com
 ([fe80::7d62:9500:521b:40a4%6]) with mapi id 15.20.3348.019; Wed, 9 Sep 2020
 17:13:22 +0000
Subject: Re: meta-amd repository
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <3e858b31-2547-a114-75f5-4ccd740641d3@amd.com>
 <20200909141816.by4hbfaqbbeud2fm@thinkpad.dyn.fuzziesquirrel.com>
From: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
Message-ID: <28643e5c-e0ae-9cf7-5593-af82899ace1f@amd.com>
Date: Wed, 9 Sep 2020 12:12:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200909141816.by4hbfaqbbeud2fm@thinkpad.dyn.fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN4PR0501CA0025.namprd05.prod.outlook.com
 (2603:10b6:803:40::38) To SN1PR12MB2542.namprd12.prod.outlook.com
 (2603:10b6:802:26::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.236.21.55] (165.204.77.1) by
 SN4PR0501CA0025.namprd05.prod.outlook.com (2603:10b6:803:40::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.9 via Frontend
 Transport; Wed, 9 Sep 2020 17:13:22 +0000
X-Originating-IP: [165.204.77.1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7f3b36ba-b1dd-403a-971f-08d854e3a7d2
X-MS-TrafficTypeDiagnostic: SN6PR12MB2639:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2639049825FA6EFEF056C4F596260@SN6PR12MB2639.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A6VAa0qBmZxrlGZ21a+BzghtdIFbZJnPnurlWBVMGxdT6nXQu1WU1mxw4CPsP8cQNHg3ecqQUvnSnfjPv54p/yGaSXj/bCinpGYturO/quUIMzXX29tVPrcX1adPobDpnc8F6gnZsa+Mr55BRyoPY98mqsoac35EB92VHPnlrOUp253Ebt5xA1Auoq5N9RFsKHvgsKDmN1ocFWaWmNaSryZbl0vLDmKpDMpfvu7fPYSu1z9t7aXt6oVRBU0yHeAx83mLjDSfwjt9cPZveHLTj2T1MhcZrM+VzxVIIA2zwfLNEsV37ohLr6vLwiu85Ow98xmB6GlezXrPqcmPwDH0mYhKqXfQTZFU1GLNfOTWX+1BgmfNIwQHkYq1VZCR0jDUgeFlGrgzbG1+ym2iiKSB9QB4Jy+SjAwsc9EtN0c3ciMQzYMfQAIOgt81P3aaQTb17h7ccLkSdSecnRM/X7ueZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2542.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(366004)(376002)(39860400002)(316002)(2616005)(52116002)(966005)(186003)(8936002)(6916009)(36756003)(4326008)(3480700007)(45080400002)(6666004)(956004)(2906002)(478600001)(16576012)(6486002)(66556008)(31696002)(16526019)(44832011)(83380400001)(26005)(86362001)(66476007)(8676002)(66946007)(5660300002)(53546011)(31686004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: /BFMZfr2AuidH971MVxitrPh+IQeUJmjYvDoVxNdj7+CNbXLHSAwVYBOce3TAdYdx/LzHX/7GboOgPw0CfQcpeIglql5GC/wSYekozTUVtuiKGafT5VWfiRZ3qcK/P0MBtIjQbGvXSwK14JsvvncKoj8Zzub+S7TxyroypfnoDpZxXVawfW/p+yPyoPuxzDvyNgo3c3K8NWGRd7ZS2QaE9AFskpl2wxfSLVitDpBnvEUCBlZnT4fLSEGabg+sCeWlrIyr3VoKKJZ8F3y1onBLgvgVMD8lPTDxFsDIBw8DWZMYu27QC8fdfDY7XoyvY86Nbb2g7eFCiT/yz6guxFPvpA78os1lm8fWWchlSuGjz1lZFZ6kNo0qYseBdV/7XjHGDp+BuvUUklF8dl31F/u+PluxD0gqzBpTem2RgzseUMle249iQ/YpaO2cjtu1C2322JzX5qgsm23apnFVULps0XHUKX8h3Gc5BASNLcmQkKKd62lgqCIBbp2zYzKUCiwaWPrLMPAlC0kEQIL6ViTJbNPkA6nas4lSQd0aAgTY+hIlRDgn2QeBbpML4x7FKLohhwBS4t6jpRLmAc48nDtvr8xr01jun3XGTsg+ii95ACQRbezZO9Ctdf7pz6B9qna/7X7Aysq9e8rWxvD8Qsx4Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f3b36ba-b1dd-403a-971f-08d854e3a7d2
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2542.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2020 17:13:22.4759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hfC3jvva8eBWRDrQmwmHur0qxP7szLHP578JNCfCn0GciGZy/EAuTygDOVZuI+6UreF8oayml6WmC9773569xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2639
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

Brad,
Much appreciated.

A related question: 
I see only the following targets being triggered for CI
Triggering ci-openbmc » ubuntu,docker-builder,romulus
Triggering ci-openbmc » ubuntu,docker-builder,zaius
Triggering ci-openbmc » ubuntu,docker-builder,witherspoon-tacoma
Triggering ci-openbmc » ubuntu,docker-builder,tiogapass
Triggering ci-openbmc » ubuntu,docker-builder,witherspoon
Triggering ci-openbmc » ubuntu,docker-builder,gsj
Triggering ci-openbmc » ubuntu,docker-builder,palmetto

What is the process to get AMD reference platform added as a target for OpenBMC CI? 
It is **not** required in the short term, but eventually would like to contribute to OpenBMC CI infrastructure in the long run.
We will be happy to collaborate by means of providing AMD reference platform, help with Jenkins script update, etc.
Please let me know, how we can help.

Thanks,
Supreeth Venkatesh
System Manageability Architect  |  AMD
Server Software


On 9/9/20 9:18 AM, Brad Bishop wrote:
> [CAUTION: External Email]
> 
> On Wed, Sep 02, 2020 at 02:55:20PM -0500, Supreeth Venkatesh wrote:
>> Hi Brad,
>>
>> Please help add meta-amd repsoitory into openbmc as a subtree.
>> meta-amd repository has been populated with basic bring up code.
> 
> Hi Supreeth.  Done:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgerrit.openbmc-project.xyz%2Fc%2Fopenbmc%2Fopenbmc%2F%2B%2F36339&amp;data=02%7C01%7Csupreeth.venkatesh%40amd.com%7C9958fcee95a54f96a06c08d854cb33ff%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637352579007884384&amp;sdata=A6HowV1WotfXfg9dcawpvMfAsyD20jG2yqQXKAxAiFI%3D&amp;reserved=0
> 
> -brad
