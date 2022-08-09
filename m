Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAFE58D52A
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 10:09:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M25MG4ZrJz3000
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 18:09:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j1GBkeQV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=jiaqing.zhao@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j1GBkeQV;
	dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M25Ls49XQz2xjt
	for <openbmc@lists.ozlabs.org>; Tue,  9 Aug 2022 18:09:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660032549; x=1691568549;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OUtj8PDQH1O764kQwCllIAW90otQshciXG6qF4Ss2YM=;
  b=j1GBkeQVOa9Z6BMwe+uOF9Ovn91pbBOZSX5Vf8nu4YfkJ3lBBWVn5A1V
   yDD3qVrLawm+S/lRW48y19sVq7EoSxxiM/FMYL/w42wJa5ucRWifR2fCt
   dzQTRoCOg0Z5XbApxOcX6RSGSk0u6QHV8mOu1CiqrF+Or/+0xKAe2a5Pn
   Tye9AGymKuRWte3xYI1yJ2ffDt6Q/U01ZmpylfOncXErXJ5vtFWbGx9vb
   6561LXD55X4cmLi++xSCpLBbNq41cJAjiHk6mZcKSQB4z7Ed6YdMhrY9L
   IVmlOagXdPjSbx41pIYK9M8SN2ll05iNHG/EXYb/MzMYt4+A1/hCrRqgE
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="273832012"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; 
   d="scan'208";a="273832012"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2022 01:09:04 -0700
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; 
   d="scan'208";a="633243254"
Received: from jiaqingz-mobl.ccr.corp.intel.com (HELO [10.249.168.253]) ([10.249.168.253])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2022 01:09:02 -0700
Message-ID: <77004044-4ea7-8086-eab9-ac3c6d4bd634@linux.intel.com>
Date: Tue, 9 Aug 2022 16:08:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: Can we improve the experience of working on OpenBMC?
Content-Language: en-US
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <3df049fc-e5ec-449e-b696-a2ca86c37ed3@www.fastmail.com>
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
In-Reply-To: <3df049fc-e5ec-449e-b696-a2ca86c37ed3@www.fastmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Benjamin Fair <benjaminfair@google.com>, Ed Tanous <edtanous@google.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>, Heyi Guo <guoheyi@linux.alibaba.com>, jebr@google.com, scody@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2022-07-27 09:22, Andrew Jeffery wrote> # Problems
> 
> 1. Yocto is hard
>     1. Managing patch stacks is hard
>     2. Yocto-specific tooling is hard
>     3. Finding the right recipe file to inspect/modify is hard
>     4. Yocto has too much documentation
> 2. OpenBMC has too much documentation
> 3. Querying design/implementation/bug properties across the project is hard
> 4. Coordinating breaking changes is hard
> 5. Coordinating tree-wide changes is hard
> 6. Identifying the right repo to file a bug against is hard
> 7. Transferring bugs between repos is hard
> 8. Bug reports are duplicated across repos
> 9. Bug reports are ignored
> 10. Working out where to submit a patch is hard
> 11. Getting patches reviewed is hard
> 12. New repo requests are bottle-necked

I'd personally like to add one item

* Submitting patches across multiple repos is hard, especially when they depends on each other
