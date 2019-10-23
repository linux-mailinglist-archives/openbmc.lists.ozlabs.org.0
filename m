Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B143BE19FF
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 14:27:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yqPX5bVmzDqQD
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 23:26:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="knlQSKZm"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yqLq5Z8CzDqPl
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 23:24:35 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 1E66241203
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 12:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:content-type:content-type:mime-version
 :references:message-id:subject:subject:from:from:date:date
 :received:received:received; s=mta-01; t=1571833469; x=
 1573647870; bh=Zx/6GAWQuzahE98tJhkCMVReQ53sJo9EiS7SXfvcSY4=; b=k
 nlQSKZm5GZq4o9/JfDJ2ElcKfnPqHaYY9mcMt87WWQFlfu/gLOHHaSYjcMKNUeOh
 CO8LQT8PZ2oYJnrlRXQMr46hSAanBWXLyVlUHLBIgW2JtoAwzh8JEpyUBqoZeb85
 JBtl5S/mCndUna5UAn+JoykJKGWejxM5Q7bFFum4BM=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L5kviCcKbbj6 for <openbmc@lists.ozlabs.org>;
 Wed, 23 Oct 2019 15:24:29 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 3084E411F8
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 15:24:29 +0300 (MSK)
Received: from localhost (172.17.14.115) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 23
 Oct 2019 15:24:28 +0300
Date: Wed, 23 Oct 2019 15:24:28 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: <openbmc@lists.ozlabs.org>
Subject: Re: iKVM support for AST2400
Message-ID: <20191023122428.GA15337@bbwork.lan>
References: <d7171952-8999-d951-cec0-644f4de524a3@acceleronlabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7171952-8999-d951-cec0-644f4de524a3@acceleronlabs.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Oct 23, 2019 at 05:15:34PM +0530, Prince V S wrote:
> Hi,
> 
>     I have a custom BMC board with AST2400. I am planning port OpenBmc
> 2.7(warrior) for the same. The warrior release not mentions that KVM support
> is available. Is this KVM support available for AST2400 Chipset also? Can i
> know which AST2400 platform has support for iKVM in warrior release?
> 
I had tested IKVM on our VESNIN (OpenPOWER P8 with AST2400 bmc) before the
warrior was created. It worked unstable and posted a lot warnings to the system
logs. I didn't dig into the problem.

I'm going to continue that research a little bit later, and then I could post
some details.

> Regards,
> 
> Prince V S
> 

Regards,
Alexander Filippov

