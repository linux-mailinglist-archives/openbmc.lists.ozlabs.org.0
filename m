Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFD81F778B
	for <lists+openbmc@lfdr.de>; Fri, 12 Jun 2020 13:55:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jzgr6pTFzDqx0
	for <lists+openbmc@lfdr.de>; Fri, 12 Jun 2020 21:55:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jzg34RgDzDqww
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jun 2020 21:54:54 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <a32b29c96cbfca3a005a5370b66087014b225d87.camel@fuzziesquirrel.com>
Subject: Re: AMD's Signed CCLA
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Venkatesh, Supreeth" <Supreeth.Venkatesh@amd.com>, Mike Dolan
 <manager@lfprojects.org>
Date: Fri, 12 Jun 2020 07:54:30 -0400
In-Reply-To: <SN1PR12MB2542B7316775ABE7C8F5033F96800@SN1PR12MB2542.namprd12.prod.outlook.com>
References: <SN1PR12MB25428FA4CD525DF87AC73F8496830@SN1PR12MB2542.namprd12.prod.outlook.com>
 <CALVHhecYnixzFTgxbFTcYcgTQNh8JSZpikBnmj4RDo2dax63sg@mail.gmail.com>
 <SN1PR12MB2542B7316775ABE7C8F5033F96800@SN1PR12MB2542.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "kurt.r.taylor@gmail.com" <kurt.r.taylor@gmail.com>, "Stephens,
 Christie" <Christie.Stephens@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2020-06-11 at 21:39 +0000, Venkatesh, Supreeth wrote:
> [AMD Public Use]
> 
> Thanks Mike.
> 
> Brad,
> Can you please help create meta-amd?

meta-amd created!

-brad
