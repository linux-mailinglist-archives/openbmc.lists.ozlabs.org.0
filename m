Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B10997309
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 09:10:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CzM440ZBzDr5Z
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 17:10:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="EH2LMd+V"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CzLX11rlzDqcH
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 17:09:39 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 6FCD14120B;
 Wed, 21 Aug 2019 07:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 user-agent:in-reply-to:content-disposition:content-type
 :content-type:mime-version:references:message-id:subject:subject
 :from:from:date:date:received:received:received; s=mta-01; t=
 1566371374; x=1568185775; bh=2fOrPggW1pojYoFnDxztfi3Yvt3TLEazfP6
 Rho9WSZ8=; b=EH2LMd+VQKxzlYzJfZbZX3jftrKC6eitH9yXpiFPcjYaYFmdmNw
 g8HEa6b3gzctcDZPxQH7Zk3Icj0cRxrli6pVadp/zxbY0Ch8iTaz3oTkyolv01fY
 8KZzri2DWCO0QOmLEWP8XIXOXQ2DAadLia9RPNxDuCLeyz+AJP9ZVrTQ=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zB-LsVlr4zKj; Wed, 21 Aug 2019 10:09:34 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 64EF9404CB;
 Wed, 21 Aug 2019 10:09:34 +0300 (MSK)
Received: from localhost (172.17.14.115) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 21
 Aug 2019 10:09:33 +0300
Date: Wed, 21 Aug 2019 10:09:33 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: Terry Duncan <terry.s.duncan@linux.intel.com>, <openbmc@lists.ozlabs.org>
Subject: Re: Alternative to the filesystem overlay
Message-ID: <20190821070933.GA19933@bbwork.lan>
References: <efb47539225e57a0ab0138987287c230@linux.vnet.ibm.com>
 <20190816090955.GA15986@bbwork.lan>
 <791b2ada-c35d-c394-b7f0-fd3f92abeed2@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <791b2ada-c35d-c394-b7f0-fd3f92abeed2@linux.intel.com>
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

On Tue, Aug 20, 2019 at 05:56:32PM -0700, Terry Duncan wrote:
> On 8/16/19 2:09 AM, Alexander A. Filippov wrote:
> 
> > Most of these issues can be solved by the simple shell scripts. We could modify
> > the initramfs/init scenario to exec these scripts at the moment when ROFS and
> > RWFS have mounted but are not combined to OVERLAY yet.
> > 
> > Of course, this method doesn't prevent an occurrence of any new issues of this
> > type but brings an easy way to solve them.
> > 
> > --
> > Regards,
> > Alexander
> > 
> 
> Possibly the overlay FS is not expecting and does not support the ROFS to
> change as it does when a new build adds a file to an existing directory.
> When this occurs an overlayed file in the same directory could cause
> corruption in the directory. Are you suggesting scripts that detect a change
> to the underlying FS and attempt to patch the overlay?
> 
> Thanks,
> Terry

That's not entirely true. I'm suggesting to keep the scripts to solve each
particular issue. But if we can detect and resolve such issues automatically
that would be nice.

Regards,
Alexander
