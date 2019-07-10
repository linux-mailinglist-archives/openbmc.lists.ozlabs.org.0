Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AABD764C75
	for <lists+openbmc@lfdr.de>; Wed, 10 Jul 2019 21:00:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kT5V0993zDqkJ
	for <lists+openbmc@lfdr.de>; Thu, 11 Jul 2019 04:59:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kT4v1vlBzDqfc
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jul 2019 04:59:20 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jul 2019 11:59:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,475,1557212400"; d="scan'208";a="173939602"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by FMSMGA003.fm.intel.com with ESMTP; 10 Jul 2019 11:59:17 -0700
Subject: Re: Proposal to replace Clang Format with ESLint and Prettier in
 phosphor-webui
To: openbmc@lists.ozlabs.org
References: <CAOUmYFRfVQha0NCZd2aLTc-EC2GNF8wuXqnAyWNMCpzcecQUKw@mail.gmail.com>
 <6f963ba0-467f-14fe-ac0b-7c09b547d109@intel.com>
 <CAOUmYFRHh3bQSwmFMEcvokd6_yFxPE7-X+UmBTcFxMegHdX0eA@mail.gmail.com>
 <26aeae20-6815-d160-584f-c9252ec6a568@intel.com>
 <CAOUmYFTj37WtKAs+RdjXPabEjVKj859=j2e5v0NWBc5n81VcUA@mail.gmail.com>
 <CAOUmYFSPoDhDrTqhNv+ehtJmj3E6qw2cyUKSQGp26nyFH_VAaA@mail.gmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <d453defc-d076-5077-1e6c-ea7b50789efb@intel.com>
Date: Wed, 10 Jul 2019 11:59:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAOUmYFSPoDhDrTqhNv+ehtJmj3E6qw2cyUKSQGp26nyFH_VAaA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 7/10/19 10:17 AM, Derick wrote:
> Thanks Ed for the reviews and support on the GUI tools work! I ran into a
> roadblock with the format-code.sh call. I am not finding Prettier as an
> Ubuntu
> package and won't be able to make the call during the build process.

Not surprising;  Prettier is an npm package, not specific to Ubuntu.

sudo npm install --global prettier

Should give you the result you want.

> However,
> I am able to use a Git hook to test the code prior to commit and/or push.

That's great that this is available, but I'm not really comfortable if
it can't be enforced in CI.  That would mean someone needs to pull down
each commit and verify it manually.  That doesn't really scale IMO, and
considering that the incumbent (clang-format) can already integrate
properly, it's hard to justify going backwards.

> 
> I added the npm scripts that can be called for testing and fixing (if
> auto-fixable)
> so that they can be run from the command line for anyone that doesn't
> Prettier
> integrated with their code editor (it even has VIM support). 

They'll still need to have it installed globally, which could be added
as part of the main webui install, but I'm not sure that would be worth it.

> 
>  I have these changes in the Gerrit
> review https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-webui/+/22366
> and am hoping that this is an acceptable solution. 

My main sticking point is the significant manual testing that's going to
have to take place, for a relatively modest increase in productivity.
If that can be resolved, I would support you moving this change forward.
