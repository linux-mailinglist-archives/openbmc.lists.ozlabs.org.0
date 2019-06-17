Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 642EE47A07
	for <lists+openbmc@lfdr.de>; Mon, 17 Jun 2019 08:28:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45S1WP0LjDzDqbD
	for <lists+openbmc@lfdr.de>; Mon, 17 Jun 2019 16:28:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="UgoiFl/m"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45S1Vq09stzDqVK
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jun 2019 16:28:18 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 46A9441258;
 Mon, 17 Jun 2019 06:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 user-agent:in-reply-to:content-disposition:content-type
 :content-type:mime-version:references:message-id:subject:subject
 :from:from:date:date:received:received:received; s=mta-01; t=
 1560752892; x=1562567293; bh=yeDZxpJrTqX375Bm7xDKXcvWr4/Sw2YngT9
 Is7+0Ut0=; b=UgoiFl/m+IlnhX4Wg9ecXhWi81THHc3N8QjBLWB0Y9T2Nrv06yo
 Cjds2Msv85Z/PKZEZdtCxgrCts3QOP4VbGHnAwaRmrrulGM3QKUDkuFwmtsvCfva
 7Xzyaozf5SoLZYMkY8rR4cF0fsBYqvJQihSdTNi4mB113y8DTPq5BqAQ=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5kLHL6UPIVCb; Mon, 17 Jun 2019 09:28:12 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 223784120B;
 Mon, 17 Jun 2019 09:28:12 +0300 (MSK)
Received: from localhost (172.17.14.115) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 17
 Jun 2019 09:28:11 +0300
Date: Mon, 17 Jun 2019 09:28:11 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: meta-yadro subtree
Message-ID: <20190617062811.GA3524@bbwork.lan>
References: <20190603115332.GA20703@bbwork.lan>
 <0b087d91bf683a9d2e28ccdf751147e26c45a277.camel@fuzziesquirrel.com>
 <20190614144256.GA13210@bbwork.lan>
 <20190614163948.ziy62zrcpif65zpu@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20190614163948.ziy62zrcpif65zpu@thinkpad>
User-Agent: Mutt/1.11.3 (2019-02-01)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jun 14, 2019 at 12:39:49PM -0400, Brad Bishop wrote:
> > > 
> > > Hi Alexander
> > > 
> > > I finally did this today.  Thanks!
> > > 
> > > -brad
> > 
> > Hi Brad
> > 
> > What about corresponded subtree in the openbmc/openbmc repository?
> 
> oops.  please check: https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/22626

Thanks
