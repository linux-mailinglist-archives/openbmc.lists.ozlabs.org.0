Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E21D650CEF
	for <lists+openbmc@lfdr.de>; Mon, 19 Dec 2022 15:02:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NbLxS3YZKz3c8F
	for <lists+openbmc@lfdr.de>; Tue, 20 Dec 2022 01:02:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YWkqivfE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=przemyslaw.hawrylewicz.czarnowski@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YWkqivfE;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NbLwq1bWvz3bPL
	for <openbmc@lists.ozlabs.org>; Tue, 20 Dec 2022 01:01:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671458507; x=1702994507;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=VfowfKznjFy1wzPdvzuchsw636vZYZzQMDRqGbHohhg=;
  b=YWkqivfEFkZKUEonZNClNjgA8gebLgW8d+IWG/a3Qn26cgHujXgQPYqp
   cOyuI6/6hIW0k7dWdKD+P9iusM6aqSNIVjK9EaU5e8ez8k06EKitNIOic
   lcvFO1ddfUvpiSVDII86/Cuw8OJDUpklS4u+0pnmyXwaf8CKiwhl653LJ
   q1VDrDJLhhRGg2TYiAFG/aG2PbaqXGc4D+dGf7LNLWbRsKEimVn5+dxEn
   UaZXa8YPiLtLJ4JZNUlBC131+0T4YRfHS69F+rWIsFDtO1XOBRpucX3LT
   uhLrhfnnkUDITRca4XYcISQWGMVlM2dwr6BOsMIw/5YPxMIOUPRtcc76i
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="319398135"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; 
   d="scan'208";a="319398135"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2022 06:01:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="719116987"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; 
   d="scan'208";a="719116987"
Received: from phawryle-mobl1.ger.corp.intel.com (HELO [172.28.38.34]) ([172.28.38.34])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2022 06:01:36 -0800
Message-ID: <8a15e91f-a8a1-0a70-1006-d07dafdd7b34@linux.intel.com>
Date: Mon, 19 Dec 2022 15:01:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: Virtual Media repository request
To: openbmc@lists.ozlabs.org
References: <DM4PR11MB52476717C6A134B92BD62061B96E9@DM4PR11MB5247.namprd11.prod.outlook.com>
 <YbDjsxZYYtnNPsCK@heinlein>
 <475ba120-3734-8bf1-868f-83f48f10ccac@linux.intel.com>
 <YbdwYODNRJPuRady@heinlein>
 <5c98b6d46d71907242f1d868cc3d918db99cea53.camel@codeconstruct.com.au>
 <CACWQX819tsUA6t190mVp8LrrHbteiP4w-35MEH9LG9mWTvYgxw@mail.gmail.com>
 <d9ea11af-4b30-3424-5b1b-e0a51dde28f4@linux.intel.com>
 <8857fb3c25b2e3918dcda00f04710b3e9f84f1d9.camel@codeconstruct.com.au>
 <592e3b4d-2125-22b7-2413-0aa0857c9fe8@linux.intel.com>
 <4ab2d31e-4433-5987-c2ad-8f3d4ce50090@linux.intel.com>
Content-Language: en-US
From: "Czarnowski, Przemyslaw"
 <przemyslaw.hawrylewicz.czarnowski@linux.intel.com>
In-Reply-To: <4ab2d31e-4433-5987-c2ad-8f3d4ce50090@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 23.12.2021 02:01, Czarnowski, Przemyslaw wrote:
> On 20.12.2021 13:54, Czarnowski, Przemyslaw wrote:
>>
>> I plan to start pushing changes here this week.
>>
> Replying to myself, but just pushed a series of first 4 patches to review.
> 
> It is just a skeleton (infrastructure to build main flows on) but wanted 
> to get the first reviews for initial changes (transition from old 
> content to the new one in particular).
> 

I would like to rise the request for new service of Virtual Media 
repository once again.

Recently I've made an attempt to push VM service patches once again 
after UT has been added. In the meantime, I've noticed that in order to 
make a graceful transition between old and new solution the final switch 
between the old and new code should be made at the moment when the last 
patch is accepted.

There are two main reason why I would like to recall the discussion.
First is the voice of the maintainer of the old service. Second - 
problems with linting and CI which wants to build and test both projects 
simultaneously.

Of course the decision does not belong to me. I just do not want mess 
with current CI to support this transitional state.

-- 
Best regards,
Przemyslaw Czarnowski

