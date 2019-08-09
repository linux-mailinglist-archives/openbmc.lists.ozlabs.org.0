Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7360687300
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2019 09:33:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464cRt72DXzDr0P
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2019 17:33:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="KPhHUWVu"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464cRC52pgzDqxQ
 for <openbmc@lists.ozlabs.org>; Fri,  9 Aug 2019 17:33:11 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 8A65141200
 for <openbmc@lists.ozlabs.org>; Fri,  9 Aug 2019 07:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 user-agent:in-reply-to:content-disposition:content-type
 :content-type:mime-version:references:message-id:subject:subject
 :from:from:date:date:received:received:received; s=mta-01; t=
 1565335985; x=1567150386; bh=Bx7mXEaMNTRY/BGkvtQvmfvYTj3esXzR2TL
 pBerPeIE=; b=KPhHUWVuRMrfgDoRX2zxVVPc/jzv8jjfsrxGxW0OMfeZ8SLGur5
 ihH/4tZYbrmXi+dBGB5y/iyna12vjya/rJ6hhpNlAWiZRZ115NaMB0QGFqQEvUBU
 T7bxt6nNIOUzGwsBNh3V/UVUFSdVqEW/U5HH2d/eyY8FWAmxF/SY6WKs=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WtBRy2dldSid for <openbmc@lists.ozlabs.org>;
 Fri,  9 Aug 2019 10:33:05 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 413AA404CD
 for <openbmc@lists.ozlabs.org>; Fri,  9 Aug 2019 10:33:05 +0300 (MSK)
Received: from localhost (172.17.14.115) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 9 Aug
 2019 10:33:04 +0300
Date: Fri, 9 Aug 2019 10:33:04 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: <openbmc@lists.ozlabs.org>
Subject: Re: Continuing discussion on Handling persistent files
 (/etc/group)during BMC updates
Message-ID: <20190809073304.GA327@bbwork.lan>
References: <96f5e075-b324-90da-f004-703ab6275374@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <96f5e075-b324-90da-f004-703ab6275374@gmail.com>
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

On Fri, Aug 09, 2019 at 12:19:32PM +0530, Raviteja Bailapudi wrote:
> Hi all,
> 
> We are looking for thoughts and perspectives on the way the persistent files
> are managed across BMC code updates.
> 
> The problem is regarding the code update where, as a part of code update we
> don't touch any of the persistent files like /etc/group or /etc/password.
> 
> what if the new BMC image has an application which requires some changes to
> be present in these persistent files ?
> 
> For Example:
> Let's say the BMC image which is used for code update has a new
> feature(ex:avahi) and it requires avahi user and
> the group to be present in the /etc/passwd and /etc/group to even kick start
> it's daemon.

We had faced with the similar issue several months ago and don't find good
solution yet.
https://github.com/openbmc/openbmc/issues/3468

> 
> How to update such persistent files where customer data might exist?
> 
> One of the quick solution i could think of is:
> - We can identify what is missing and then write a service override file to
> make the necessary changes in the persistent file.
> 
> But i am still looking community thoughts to fix this issue? There was
> already a mail sent regarding same, please find it below:
> https://lists.ozlabs.org/pipermail/openbmc/2018-March/011162.html
> 
> Thanks!
> Raviteja
> 
