Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7229B96794
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 19:29:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Cd8F55F8zDrGC
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 03:29:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Cd7b0XQrzDql6
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 03:28:57 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Aug 2019 10:28:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,408,1559545200"; d="scan'208";a="262234430"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga001.jf.intel.com with ESMTP; 20 Aug 2019 10:28:53 -0700
Subject: Re: new dependency: hunter in entity-manager
To: Patrick Venture <venture@google.com>
References: <CAO=notzcsn+0cbEas2npaMk1cT7nv+PeHxy3WWYQnzt3CB_+Pg@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <e8180496-03ec-72d1-912f-14b0334257cd@linux.intel.com>
Date: Tue, 20 Aug 2019 10:28:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAO=notzcsn+0cbEas2npaMk1cT7nv+PeHxy3WWYQnzt3CB_+Pg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/20/19 9:26 AM, Patrick Venture wrote:
> A new dependency was added:
>   https://github.com/openbmc/entity-manager/blob/master/CMakeLists.txt#L8
> 
> My builds are failing because they don't have access to the internet
> and this repository is downloaded outside the scope of bitbake (so it
> isn't getting cached).
> 
> Also, I find the possibility of it going away troubling:
> https://github.com/ruslo/hunter/issues/1921
> 
> James, is there a hunter bitbake recipe? I didn't see one, but with a
> name that generic as a noun, it's possible I just missed it.
> 
> Is it only required for unit-tests?  If so, can you fix the cmakelist
> to only add it for that build?  If unit-tests are always set to build,
> can we add a flag to disable them when built for bitbake?  we do that
> for other repos?

See if this helps:
https://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/24581

-James
> 
> Patrick
> 
