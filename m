Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBF51D3196
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 15:44:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NCSR347SzDqWy
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 23:44:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=aRdP6//R; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NCRK26tgzDqWy
 for <openbmc@lists.ozlabs.org>; Thu, 14 May 2020 23:43:09 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 1A71C4C83B;
 Thu, 14 May 2020 13:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1589463282; x=1591277683; bh=7NSc+IheR1wQgO3DWW8UWZN/L
 84FV9QzjQxA/UOgQQY=; b=aRdP6//R+y3T/oBeD6fhmYoIrvxZwwHO5lA3ygAXu
 D63dwf5hLYp8YvmZsgUaqIimMVvSXdsO3NYctlajQQqfqiobZqKTfbfUyVdVMi0w
 BM+gnJk1qhSXkuDt9miMw63oO3VVja9p4L//oJGMS2WFb3gwLMopyd5Db0ynwhEX
 HQ=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HRJjb3Nxe1cG; Thu, 14 May 2020 16:34:42 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id C77C44C842;
 Thu, 14 May 2020 16:34:34 +0300 (MSK)
Received: from localhost.localdomain (10.199.3.14) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 14
 May 2020 16:34:36 +0300
Message-ID: <203fa0c3540c4b6aa48eeb8de03ad42f43c1d463.camel@yadro.com>
Subject: Re: Requirements for security audit logs?
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Joseph Reynolds <jrey@linux.ibm.com>, Andrew Geissler
 <geissonator@gmail.com>
Date: Thu, 14 May 2020 16:35:44 +0300
In-Reply-To: <391768ba-0c55-d862-d2fd-af5546b382df@linux.ibm.com>
References: <87f78066-22d5-6f15-56a2-134388844a66@linux.ibm.com>
 <4DD0C271-0081-4E9D-9733-F9DA101D7CF8@gmail.com>
 <391768ba-0c55-d862-d2fd-af5546b382df@linux.ibm.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.199.3.14]
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2020-05-13 at 17:54 -0500, Joseph Reynolds wrote:
> On 5/13/20 3:38 PM, Andrew Geissler wrote:
> > > On May 13, 2020, at 11:56 AM, Joseph Reynolds <jrey@linux.ibm.com> wrote:
> > > 
> > > What are our requirements for Security Audit Logs?  The main idea is to
> > > add a new BMC logging service to hold security-relevant events.
> > > 
> > Def hoping we can work this into our audit design:
> > https://github.com/openbmc/docs/blob/master/designs/phosphor-audit.md
> > 
> > I’m not sure how much progress has been made with implementation but
> > we spent a good chunk of time reviewing/discussing it and it seems to
> > hit a lot of the items below.

Not so much for now, little too busy on april.

> 
> Thank you, I had forgotten about that design. :-)
> 
> I think the phosphor-audit design can perform security auditing. The 
> "low-level design" in my email below is not needed and is replaced with 
> phosphor-audit.  Here are some ideas and questions how the  
> phosphor-audit Configuration can work:
> 
> 1. We can have a "security" configuration that identifies 
> security-relevant events (as listed below).

This is whitelist/blacklist part. Any security-relevant event should be in
whitelist. Or we talking about some 'security list'?

> 
> 2. Can an event be handled in two different ways?  We need all security 
> events to be logged n omatter what else happens because of that event.  
> For example, if a server powers off, we should log that as a 
> security-relevant event, and also send a SMS to the operations staff.
> 

This is post-process in 'User actions'.

> Then if you don't fully trust your admin:
> 
> 3. Security logging should NOT be configurable by the admin and should 
> be always on.  If the BMC admin can prevent security logs from being 
> generated, it is too easy for a bad admin to hide their tracks.

I assume it is possible with additional list for such events. This list will not
be configurable and always on with their configuration. Also, what about
generation of these logs from BMC admin? If so, then we need to care about some
trust on transaction level for such events.

> 
> 4. The admin should NOT have a function to delete security log entries.  
> The security log should instead automatically delete older entries after 
> the prescribed (configured?) retention period.
> 

Any ideas where it can be stored?

> If we need a way to configure security audit log settings, for example, 
> to satisfy more strict auditing schemes, we can create a new security 
> administrator role.  For example, a new distro feature 
> SEPARATE_SECURITY_ADMIN adds a Role called SecurityAdmin, with 
> Privileges that do NOT include admin privileges but can configure the 
> security settings.  If this feature is not defined, the SecurityAdmin 
> Privileges would go to the Administrator role.
> 
> Those are my initial ideas ... probably need to be kicked around a bit.  
> Staging: I would be happy if we got 1&2 working and we allow the admin 
> to configure security settings.  Items 3&4 can be developed later.
> 
> - Joseph


Thanks.

