Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAA68FEB8
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 11:10:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468yGZ3qKSzDrSH
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 19:10:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="sjTvEGwR"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468yFk6hg0zDrM9
 for <openbmc@lists.ozlabs.org>; Fri, 16 Aug 2019 19:10:02 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 3C2E941200
 for <openbmc@lists.ozlabs.org>; Fri, 16 Aug 2019 09:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 user-agent:in-reply-to:content-disposition:content-type
 :content-type:mime-version:references:message-id:subject:subject
 :from:from:date:date:received:received:received; s=mta-01; t=
 1565946596; x=1567760997; bh=WFAIxS2pOmRHGMG9gYYcFTyKstsnN+zaRjJ
 X4K9pYcQ=; b=sjTvEGwR1BHvjuXF8QjTLomWPTGUXjZMteF23m4dLpSbkg5HvMZ
 LyjmhhXH9HOJa2woZemlzlU/A75yvpaPACc2EtNaiKbnh44utFqRmhL0ML+plcFm
 8q1j5+Kkx/ior5rgEawWzo8t4wXYM24ro5sz8rvt0cbgqF6Pz+rC486c=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fhhzyuHkOclO for <openbmc@lists.ozlabs.org>;
 Fri, 16 Aug 2019 12:09:56 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 3C1D8411F8
 for <openbmc@lists.ozlabs.org>; Fri, 16 Aug 2019 12:09:56 +0300 (MSK)
Received: from localhost (172.17.14.115) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 16
 Aug 2019 12:09:55 +0300
Date: Fri, 16 Aug 2019 12:09:55 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: <openbmc@lists.ozlabs.org>
Subject: Re: Alternative to the filesystem overlay
Message-ID: <20190816090955.GA15986@bbwork.lan>
References: <efb47539225e57a0ab0138987287c230@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <efb47539225e57a0ab0138987287c230@linux.vnet.ibm.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Originating-IP: [172.17.14.115]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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

On Thu, Aug 15, 2019 at 12:38:16PM -0500, Adriana Kobylak wrote:
> In OpenBMC we've been using an overlay to make the read-only filesystem (or
> part of it) writable. It hasn't come without its issues, like missing
> directories (openbmc/openbmc#3564) and various flavors of corruption
> (openbmc/openbmc#3578 and issues when adding files to /etc in the build
> causing files that had been previously modified on the bmc to become
> corrupted).

There is one more issue for the same type - openbmc/openbmc#3468.
And it can't be solved by the way you propose.

> 
> An alternative would be to use a bind mount and manage the file merging by
> an OpenBMC app. Doing some experimentation, seems this solves the issues
> seen above. The way that it'd work would be:
> - The init script or initramfs would do an rsync from /etc to the bind mount
> destination directory in the read-write filesystem, skipping the contents of
> a list which would contain the files that have been modified in the BMC and
> should be preserved.
> - A new OpenBMC app would monitor /etc for changes via inotify for example,
> and if a file is modified, it'd add it to the "list".
> 
> Considerations:
> - The /etc dir mainly being a configuration destination does not get
> modified often so the app that is watching the directory would not be
> triggered often.
> - The bind mount would duplicate the contents of etc although it's not much.
> If space is a concern, some exploration could be done to have the bind mount
> be a tmpfs and have the monitor app copy the modified files to the
> read-write filesystem instead of adding them to a list.
> 
> Thoughts?
> 

Most of these issues can be solved by the simple shell scripts. We could modify
the initramfs/init scenario to exec these scripts at the moment when ROFS and
RWFS have mounted but are not combined to OVERLAY yet.

Of course, this method doesn't prevent an occurrence of any new issues of this
type but brings an easy way to solve them.

--
Regards,
Alexander
