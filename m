Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8084724C20D
	for <lists+openbmc@lfdr.de>; Thu, 20 Aug 2020 17:22:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXT0n5nNFzDr3k
	for <lists+openbmc@lfdr.de>; Fri, 21 Aug 2020 01:22:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=nam11-co1-obe.outbound.protection.outlook.com
 (client-ip=40.107.220.48; helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=supreeth.venkatesh@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-amdcloud-onmicrosoft-com header.b=Mf06MYSV; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXSz31gbpzDr3b
 for <openbmc@lists.ozlabs.org>; Fri, 21 Aug 2020 01:21:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=izjoLicvLbA9DTF2xzyomNZ5BUrNge0up53GgnNpTboDr5wTiyQn1ZOa2PX1lVHQ5dEfdrlQSpZw88ipX2IcKvBIsO3dcI/uklOzHoT1UBugukPhi304lauM1gQAVSWoixCdixSkHSdu6bybbTMbVTTmdcsq/13d4WKrwlZB0bWnKiifGl+ZIcIK54Jwuz1KAXJnhrsObBENFc7RB4dMOgdMFxJPx4fpzkAAQrwkEEqDlFbLLnQfIcVKwMz6XEKltOW+9HnhO8MPSi10p0BYk+husHCaI6aq+zUDfba1U1oJ49aO6IXrwyHGVXEJDZ77kMvBP1Swjp0RSaSilBi1nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sre57R933ifwhsZfRxE79AGUFa/Ec1OMxcv9nY1TtPA=;
 b=J8/eZREzrgVdLB8vPBvguLVlqBHVj7K7znvQDaMHWpn2Pe9xXeNNKIBLvvoz2bR/XL1m8y72RhBDt7unaDVV58yoO7L7y/OnNcShWfoC0SnbQxwIMmK9H8KhXcChl7em8f5g0MxkaSrf4wMAj8HD+SJB5a4w50i8rLJAQXNbrWQ9vlmf892vdmhK6kMUKyPUhjVswXfW1eXZ1aZI1uuzozylEq1voOMmeo0hqZajaAvZae+la0fkCfuCT4slE4YO59SqeNZW4G+jx/qTlfSHeTjysCtzsBnAiXZ09zyhZaWvZtAIyPj/s+mUGjLyTTK4eEx9KmTJEtN0sXo5dMsVbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sre57R933ifwhsZfRxE79AGUFa/Ec1OMxcv9nY1TtPA=;
 b=Mf06MYSVaRl1wHu2QQ7Ja9lgS+odhAfH/Xvq2VRFBo3lN+0I13p0hD/mPFUGauwhPy7KUn5CA3XGq5HRP/6rvX1+epMneYTrbjlt4QasBIVryIPrje2aoiPj0plCqKwVn0y6UBD1uD2wusXUfNmEaviS/67c0ZZEpv+14frE34g=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2542.namprd12.prod.outlook.com (2603:10b6:802:26::28)
 by SA0PR12MB4432.namprd12.prod.outlook.com (2603:10b6:806:98::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Thu, 20 Aug
 2020 15:20:55 +0000
Received: from SN1PR12MB2542.namprd12.prod.outlook.com
 ([fe80::7d62:9500:521b:40a4]) by SN1PR12MB2542.namprd12.prod.outlook.com
 ([fe80::7d62:9500:521b:40a4%6]) with mapi id 15.20.3305.024; Thu, 20 Aug 2020
 15:20:55 +0000
Subject: Re: moving meta-{openpower, x86, arm} content to meta-phosphor
To: openbmc@lists.ozlabs.org
References: <d6d450e638d016d29496ef1713083e80551a84bd.camel@fuzziesquirrel.com>
From: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
Message-ID: <773fc4a8-2264-685e-34b1-a86f1fc9d0de@amd.com>
Date: Thu, 20 Aug 2020 10:20:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <d6d450e638d016d29496ef1713083e80551a84bd.camel@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0401CA0012.namprd04.prod.outlook.com
 (2603:10b6:803:21::22) To SN1PR12MB2542.namprd12.prod.outlook.com
 (2603:10b6:802:26::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 SN4PR0401CA0012.namprd04.prod.outlook.com (2603:10b6:803:21::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26 via Frontend
 Transport; Thu, 20 Aug 2020 15:20:55 +0000
X-Originating-IP: [165.204.78.1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 90af6581-8eda-4b59-ed93-08d8451ca23a
X-MS-TrafficTypeDiagnostic: SA0PR12MB4432:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB44328989E5B4317662CC3A59965A0@SA0PR12MB4432.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 01DnEVgImu+lQKaiwcLbLQzxBtJHIhpmubq+bTFLwQ/82pUk+POtFJGbUBS/pLcAON8j5nxZFQ6pg7RzYq3R3vtIQMdortX5lOpelp9Gy+fCOIa5JeKLvA8SY6YInSnKx/kql8cUsCMfdq6S1G21/QuApTFLZVHu7M4SRYbM37+C5vUN14QcGe9jxz+2ohQYXiG1VUdGEXksFVoZ+3fyCycvec1UxeLTj1DUPMSbi6azpmAXWSM58PryinjBeETImf8FtqBnP0QSecXv/C7KtD0zrpNLHTmYuBvrkAd1VhWzzBsIzxk28upgiFY1RaNO6fuMw6YoKBJMQoegsvsTX3cSD5s4MfsVhv07C1yeKW+DXG+NlKStT066biRJ9/xgkMdXjaWWcduNzwWfkax5KFSyuC5IOrb27RC1VSNdNKRZbZKXKJpw4d05vVKl35DJ2iY0YkXKLM6nVAjlRU22Y8semHLrhnWuOd9Vj/mhQb4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2542.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(346002)(366004)(376002)(45080400002)(5660300002)(2906002)(66946007)(4326008)(316002)(66556008)(66476007)(6916009)(44832011)(26005)(53546011)(52116002)(956004)(86362001)(31696002)(16576012)(2616005)(966005)(186003)(8936002)(478600001)(31686004)(83380400001)(110011004)(36756003)(8676002)(6486002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: jfwPGzf/LMLdsxO/BhBrgA5hhx+LqTo62SPaO1suQ00yTrR6p2+FKwwPxgjnEfIbutWchXWaBuKFEQLXCj1si7ip7ZezQSckIdukHVQe6QiOVgRdLOlfgtaFj68lM0EtWcwJFYf+52RVAjqCzNXkuZFR4Y4k5RX+yZ+UfF5lG3wkyjlAtZFcxqRnSc/VpuIYaD2pRidsvrhSIU4aSULNhaxedVNqqDKv6TVV5SiQYiL4VJ5gRam1xCEXIaKor7C9JfbwyM5IOua8zAUA/LEZoJcFABx84CStMe7oNF/h6fE0SL7aPAi01AhQ2JvBvsdjm9uTLGnvk+jX9kjKed046W2tV1IXp9bZzi9dq3XebGvcKpuwWYFEc8MB68Bwn8riSAAp1+d0WqtpU00XDLffxdjBf5GwK2TYIag0MG8pA6U2A989M9Z8HGAb4BZrsArdEgn9NvpPUKyFz1lVOyDKt2Y+XFcLtWjTDUpoNCj9wDB6ckzJasa6myQHnIIVEWaOxPtCcC4oPXD1O5EQz6Fd/pQGkGv6HxONgI8OTgUnkryZ+XeV8py6poDmpBc99iSalRXN51dX3+2YrhGZLDrXEQgHgcU4gn9gfhvRrnFhyAUtNGhy10daEYSR4G9uvirPP3+ZNLoju1MN51wAVnG6lg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90af6581-8eda-4b59-ed93-08d8451ca23a
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2542.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 15:20:55.8395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I52liY4UqSAjrhM68MMGmxro6l3VF/MH7igu7btiTW6/63aPHC4QYiqDwE7fcnurDyJ+vKFzXKl5cnVOMvmz/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4432
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
Cc: christie.stephens@amd.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 8/20/20 8:15 AM, Brad Bishop wrote:
> [CAUTION: External Email]
> 
> Fellow OpenBMCers
Hi Brad,
> 
> Over time, I would like to do away with the processor arch layers e.g.
> 
> meta-openpower, meta-arm, meta-x86.
> 
> In hindsight meta-arm and meta-x86 might not have made much sense and
> should have been something like meta-x86-intel and meta-x86-amd perhaps
> - this is confirmed by the fact that there isn't any content in meta-
> x86.
> 
> I propose the content simply go in meta-phosphor, and that we frame our
> thinking of meta-phosphor and OpenBMC as a project that supports any and
> all host processor architectures (as well as devices that aren't servers
> at all).  This results in several positive things:
> 
> - Increased developer/maintainer awareness/cross pollination of other
> usage patterns (community building).
> - Differences are obvious, highlighting areas for improvement in the
> project.
> - Build time, cross arch incompatibilities become obvious (e.g. building
> images that support both Intel and AMD processors for example).
> - Improved time to understanding for newcomers - everything is one
> place.
> - Reduced (granted a small amount) layer configuration complexity for
> end users.
> 
> I'm not aware of any benefits to factoring things out into the different
> layers like we have today - if you are aware of something, please share.
> 
> Getting more detailed, how would this look?  This series is an example:
> 
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgerrit.openbmc-project.xyz%2F35759&amp;data=02%7C01%7CSupreeth.Venkatesh%40amd.com%7Cbbd5c3a67de445e0fefe08d8450b6d82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637335262670832408&amp;sdata=NVk%2Bs5DTzdtp2t36ZJ20yvF7lrJiy81GjX5dzM6leRo%3D&amp;reserved=0
> 
> For projects that are truly host processor specific e.g. peci or occ
> support, we already have a recipes-x86 folder:
> 
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fopenbmc%2Fmeta-phosphor%2Ftree%2Fmaster%2Frecipes-x86&amp;data=02%7C01%7CSupreeth.Venkatesh%40amd.com%7Cbbd5c3a67de445e0fefe08d8450b6d82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637335262670832408&amp;sdata=jrectSdNgbMaWl%2BgtjF8gNbyAEbgbecmQjvelruheR4%3D&amp;reserved=0
PECI is specific to Intel host x86 Architecture.
APML is used for AMD host x86 architecture.
> 
> I propose we allow the creation of additional folders using this
> convention e.g.
> 
> - recipes-power
> - recipes-x86-amd (we might want to look at renaming recipes-x86 to
> recipes-x86-intel)
Yes. It would be apt to rename recipes-x86 to recipes-x86-intel and recipes-x86-amd because of differences noted above for now.

> 
> Or even better IMO, we co-mingle these recipes as well based on the
> abstract function they provide for some of the same reasons I would like
> to move to a single layer - increased awareness of what your community
> peers are up to.
This is interesting, I like this approach as I hope this will lead to more collaboration within the community.
+1
> 
> Please share your thoughts on the matter.
> 
> thx - brad
> 
