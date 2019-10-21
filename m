Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F39FEDE4D2
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2019 08:47:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xRyp1pC1zDqXS
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2019 17:47:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="JlejEx+h"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46xRxk1g7jzDqXP
 for <openbmc@lists.ozlabs.org>; Mon, 21 Oct 2019 17:46:30 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 79E7141207;
 Mon, 21 Oct 2019 06:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 user-agent:in-reply-to:content-disposition:content-type
 :content-type:mime-version:references:message-id:subject:subject
 :from:from:date:date:received:received:received; s=mta-01; t=
 1571640384; x=1573454785; bh=Kh5eHJ7+qvpa59DxGRQtihke6qHKlTGUvc8
 KePfL1iM=; b=JlejEx+hpFOpaLvbyZOzsbVsBzRB6ylRNMOLQCUXQuZ2CIjSrhk
 2Z1vw0kED4i9P9cgrtIxZlRJQ5y/m1hg8knIO7F3Q2pznfF88IBAJhQvNuVyatQ8
 8+wlT5AhnHHs5IzGAzTZ4bWSNTnNtj9UK65a7Ik5iYNJIKiVP3jZ9tJI=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gItJSElk4vxc; Mon, 21 Oct 2019 09:46:24 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 1F33B41203;
 Mon, 21 Oct 2019 09:46:24 +0300 (MSK)
Received: from localhost (172.17.14.115) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 21
 Oct 2019 09:46:23 +0300
Date: Mon, 21 Oct 2019 09:46:23 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: first boot repository
Message-ID: <20191021064623.GA2987@bbwork.lan>
References: <b09011f57074c8a9dc773937c0921f9860b92e50.camel@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <b09011f57074c8a9dc773937c0921f9860b92e50.camel@fuzziesquirrel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: openbmc@lists.ozlabs.org, geissonator@yahoo.com, a.filippov@yadro.com,
 "<wak@google.com>" <asmitk01@in.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Oct 18, 2019 at 02:31:18PM -0400, Brad Bishop wrote:
> We've collected a number of "do x on first boot" type scripts and
> systemd units.  I'd like to create a repository "phosphor-first-boot"
> to host these.  Does anyone see a problem with that?
> 
> here are a couple:
> 
> https://gerrit.openbmc-project.xyz/c/openbmc/meta-openpower/+/26292
>

I agree and I don't see any problem.
Besides, that couple of scripts has a lot of repeating code which might be moved
to a shared source.

> and there are others for things like creating users after a code
> update.
> 
> thx - brad

Regards,
Alexander
