Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 086EF4315B
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 23:13:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PKMy25k6zDr5N
	for <lists+openbmc@lfdr.de>; Thu, 13 Jun 2019 07:13:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PKMP4QFLzDqsb
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jun 2019 07:12:33 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Wed, 12 Jun 2019 17:13:18 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: Re: pull in safec from meta-openembedded/master-next
Message-ID: <20190612211318.xh74eg6augmneyyu@thinkpad.dyn.fuzziesquirrel.com>
References: <20190611213719.GE46814@mauery.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190611213719.GE46814@mauery.jf.intel.com>
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
Cc: OpenBMC Development <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jun 11, 2019 at 02:37:19PM -0700, Vernon Mauery wrote:
>Brad,
>
>Could you pull in the newly added safec recipe from meta-openembedded/master-next?
>
>http://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=7a81eea01aa06205732bddbe62df21f127c67955
>
>We have some projects that would like to use this in OpenBMC.
>
>Thanks,
>--Vernon

I don't cherry-pick patches anymore - instead I have just been tracking 
master of all our subtrees (including poky, meta-openembedded etc):

https://lists.ozlabs.org/pipermail/openbmc/2019-April/015766.html

I haven't done it in several weeks because they moved to gcc9 and we 
need this fix from William first:

https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/22123

I have been meaning to review it but have not found the time.  Maybe you 
could have a look?

thx -brad
