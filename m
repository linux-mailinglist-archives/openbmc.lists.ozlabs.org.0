Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E57F8461A2
	for <lists+openbmc@lfdr.de>; Fri, 14 Jun 2019 16:51:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QNq30lMzzDrgH
	for <lists+openbmc@lfdr.de>; Sat, 15 Jun 2019 00:51:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="qF06G03t"; 
 dkim-atps=neutral
X-Greylist: delayed 466 seconds by postgrey-1.36 at bilbo;
 Sat, 15 Jun 2019 00:50:49 AEST
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QNp20D12zDrPv
 for <openbmc@lists.ozlabs.org>; Sat, 15 Jun 2019 00:50:49 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id CBF0741860;
 Fri, 14 Jun 2019 14:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 user-agent:in-reply-to:content-disposition:content-type
 :content-type:mime-version:references:message-id:subject:subject
 :from:from:date:date:received:received:received; s=mta-01; t=
 1560523377; x=1562337778; bh=1tPCcap9FeU8NfKu0KGV44oLahsFvfRCsvQ
 +X0ZP+is=; b=qF06G03tI6i77t67K0DcEugmikXkQrNzCkauGEGnAGCTG1qvLcr
 aYKpni8DcFLFgLaDi5VoydhTKJQdNFQIqonfJMymF0lxXg7TKQUO7PegV6efiakm
 h+2OoBScm0k+alV8IrL24WBIkSUDpUnDqhwaFuQuxv5MuHp4ViKRwoDs=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kl3THeePWahY; Fri, 14 Jun 2019 17:42:57 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 77C474181D;
 Fri, 14 Jun 2019 17:42:57 +0300 (MSK)
Received: from localhost (172.17.14.115) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 14
 Jun 2019 17:42:57 +0300
Date: Fri, 14 Jun 2019 17:42:56 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: meta-yadro subtree
Message-ID: <20190614144256.GA13210@bbwork.lan>
References: <20190603115332.GA20703@bbwork.lan>
 <0b087d91bf683a9d2e28ccdf751147e26c45a277.camel@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <0b087d91bf683a9d2e28ccdf751147e26c45a277.camel@fuzziesquirrel.com>
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

On Wed, Jun 12, 2019 at 05:52:38PM -0400, Brad Bishop wrote:
> On Mon, 2019-06-03 at 14:53 +0300, Alexander A. Filippov wrote:
> > Hi Brad,
> > 
> > Finally, we are ready to publish our yocto layer. 
> > Could you please create a repo meta-yadro in OpenBMC project and
> > corresponded
> > subtree.
> > You might clone it from https://github.com/YADRO-KNS/meta-yadro.git.
> 
> Hi Alexander
> 
> I finally did this today.  Thanks!
> 
> -brad

Hi Brad

What about corresponded subtree in the openbmc/openbmc repository?
I could create a pull request for adding subtree but I guess that you have some
scripts/configs which also should be updated.

--
Cheers,
Alexander
