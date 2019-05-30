Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 567B930213
	for <lists+openbmc@lfdr.de>; Thu, 30 May 2019 20:40:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FGc12JVgzDqW0
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 04:40:33 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FGbZ2G93zDqDp
 for <openbmc@lists.ozlabs.org>; Fri, 31 May 2019 04:40:09 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Thu, 30 May 2019 14:40:49 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Benjamin Fair <benjaminfair@google.com>
Subject: Re: meta-lenovo subtree in openbmc repo
Message-ID: <20190530184049.unrux3kredlnaz2p@thinkpad.dyn.fuzziesquirrel.com>
References: <CADKL2t4950qyjasc+MDH6ET+ndswPvOsNwgtx30rVMV3jhA-0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CADKL2t4950qyjasc+MDH6ET+ndswPvOsNwgtx30rVMV3jhA-0w@mail.gmail.com>
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

On Wed, May 29, 2019 at 05:54:17PM -0700, Benjamin Fair wrote:
>Hi Brad,
>
>Now that the meta-lenovo repository has been created and contains
>initial configuration, what's the process to add it as a subtree to
>the main openbmc/openbmc repository?
>
>Thanks,
>Benjamin

Hi Benjamin

I added meta-lenovo here:

https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/22100

I have been meaning to document my workflow but it really just boils 
down to lots invocations of:

git cherry-pick --strategy=subtree ...

I wrote a combo-layer inspired tool to help me manage doing that; you 
can find it here if you are curious:

https://github.com/bradbishop/openbmc-config

thx - brad
