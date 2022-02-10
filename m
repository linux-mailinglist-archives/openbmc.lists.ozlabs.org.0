Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D254B0A7C
	for <lists+openbmc@lfdr.de>; Thu, 10 Feb 2022 11:24:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvXt90xXDz3bVL
	for <lists+openbmc@lfdr.de>; Thu, 10 Feb 2022 21:24:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=amk3e9l5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=amk3e9l5; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvXsk6dCSz3bP1
 for <openbmc@lists.ozlabs.org>; Thu, 10 Feb 2022 21:24:10 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id E6EF0474F2
 for <openbmc@lists.ozlabs.org>; Thu, 10 Feb 2022 10:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1644488644;
 x=1646303045; bh=w1anvQN+BDFkOvA5UlqHEVCbWdN+XwSeKVyF5h5lhHY=; b=
 amk3e9l5btBCBlQS62iEOX4OrLB7wkXEair1Fg3p8agQBCJf+JEzsloNCcDkc/0l
 xhFrHNMzOXLuL29eb6LQ6JNXJ1992d5XwvmBdvikSDbckehRAhNPqYER++/R2R69
 1toUpw2HWVVUC4RZz5ChH4NoThCNePAeHUXxBL64oFg=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C0ML79FPrHGm for <openbmc@lists.ozlabs.org>;
 Thu, 10 Feb 2022 13:24:04 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 54AC347564
 for <openbmc@lists.ozlabs.org>; Thu, 10 Feb 2022 13:24:03 +0300 (MSK)
Received: from localhost (172.17.1.114) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 10
 Feb 2022 13:24:02 +0300
Date: Thu, 10 Feb 2022 13:24:02 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: <openbmc@lists.ozlabs.org>
Subject: Re: LDAP groups and roles mapping
Message-ID: <YgTnwp2ry/u6RYw5@nbwork.lan>
References: <Ydw+3uYSqK44CTHq@nbwork.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <Ydw+3uYSqK44CTHq@nbwork.lan>
X-Originating-IP: [172.17.1.114]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
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

On Mon, Jan 10, 2022 at 05:12:46PM +0300, Alexander A. Filippov wrote:
> Our customers want LDAP groups and roles mapping working not only by primary
> group, but also by the membership in one of these groups.
> And this requirement seems to me reasonable.
> 
> As I can see in the code of phosphor-user-manager it can be easily solved by
> searching the user name in the group members list that already received by the
> `getgrnam` function. But I have doubts - wasn't this restriction done
> intentionally?
> 

I've pushed the fix for phosphor-user-manager that fixes the role determination
using the groups membership.

  https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-user-manager/+/51114

--
Alexander
