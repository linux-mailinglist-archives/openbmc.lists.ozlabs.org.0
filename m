Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A36DD489CE4
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 16:57:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXdk24h4Jz2yZd
	for <lists+openbmc@lfdr.de>; Tue, 11 Jan 2022 02:56:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=IaUeniP+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=IaUeniP+; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXdjf6LP3z2xKR
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jan 2022 02:56:38 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 396E246FA6;
 Mon, 10 Jan 2022 15:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1641830193;
 x=1643644594; bh=8sc+7WwLxL8QH7bdUz92Trt/aF/mCtg2b2JHhLn1fpE=; b=
 IaUeniP+207qdXGk4dfp7yg+8bsYGd4jlXsIm+TDrChkvRvE3jVLAIyYkrPXW7g3
 HoTxuLVC2R/vn4xBzLkcXvHMhgMXyJwJ4yWAwgVe3L1TVTW6qmZZ+xwlQHTFRgC3
 qJ0b4uxiBua1UXB+EydQIRl4Sr00ttaFiKn/e8DTziw=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OdUNKWj7y5vg; Mon, 10 Jan 2022 18:56:33 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id BAFCD46BA2;
 Mon, 10 Jan 2022 18:56:33 +0300 (MSK)
Received: from localhost (172.17.1.114) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 10
 Jan 2022 18:56:33 +0300
Date: Mon, 10 Jan 2022 18:56:32 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: Paul Fertser <fercerpav@gmail.com>
Subject: Re: LDAP groups and roles mapping
Message-ID: <YdxXMBloqYjk8Zy8@nbwork.lan>
References: <Ydw+3uYSqK44CTHq@nbwork.lan>
 <YdxFQl9Opddem7O5@home.paul.comp>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <YdxFQl9Opddem7O5@home.paul.comp>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jan 10, 2022 at 05:40:02PM +0300, Paul Fertser wrote:
> Hi,
> 
> On Mon, Jan 10, 2022 at 05:12:46PM +0300, Alexander A. Filippov wrote:
> > Our customers want LDAP groups and roles mapping working not only by primary
> > group, but also by the membership in one of these groups.
> > And this requirement seems to me reasonable.
> 
> A sidenote: windows active directory admins might also want you to
> take nested groups into consideration. I suggest you check with the
> customers if that's the case or not.
> 

Yes, it looks like a problem.
I'm afraid that the recursive queries will execute too long and PAM will give
rejection by timeout.

But `phosphor-user-manager` allows to create mappings of several LDAP groups
into one role and thus, I suppose, we can claim that we don't support the nested
groups.


> AFAIK there's no standard way to do that (other than recursively walk
> through the group membership) but microsoft has
> LDAP_MATCHING_RULE_IN_CHAIN OID:
> https://docs.microsoft.com/en-us/windows/win32/adsi/search-filter-syntax
> 
> -- 
> Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
> mailto:fercerpav@gmail.com

--
Alexander
