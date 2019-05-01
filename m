Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F28A810E47
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 22:54:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vVyN07lBzDqPC
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 06:54:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.45;
 helo=mail.rptsys.com; envelope-from=tpearson@raptorengineering.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b="Y3CIKg7i"; dkim-atps=neutral
Received: from mail.rptsys.com (mail.rptsys.com [23.155.224.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vVxP5GFJzDqLj
 for <openbmc@lists.ozlabs.org>; Thu,  2 May 2019 06:54:00 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 45887D243F2;
 Wed,  1 May 2019 15:53:57 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 7kG4l6jYMviN; Wed,  1 May 2019 15:53:56 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 6EA7ED243EB;
 Wed,  1 May 2019 15:53:56 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 6EA7ED243EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1556744036; bh=MmpC8KpyQfW+LVP7hGpmoucCrRbMULgfZAVqV6libn4=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=Y3CIKg7iU/Fq9fOfIoO5MgxXCOhaWuJrjteVFtfBg5T2CsxgVro4bsklThpMIL+Cf
 zhbubwu4LU+41JHy0KZ8GyMec4/ZC42n1rkVEbwTpGDFAI1HPcIxcWkjKNoTNYuZMF
 gup8iE5dCqhGMcGx/AMitzJ5AHQLuDaJ/n15SbkI=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id StzYyZaUvuoQ; Wed,  1 May 2019 15:53:56 -0500 (CDT)
Received: from vali.starlink.edu (vali.starlink.edu [192.168.3.21])
 by mail.rptsys.com (Postfix) with ESMTP id 4CD69D243E8;
 Wed,  1 May 2019 15:53:56 -0500 (CDT)
Date: Wed, 1 May 2019 15:53:55 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <773280498.3380381.1556744035619.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <fcc815f6-00cb-c0db-7517-62a761f144c8@gmail.com>
References: <757768607.3289093.1556696321378.JavaMail.zimbra@raptorengineeringinc.com>
 <fcc815f6-00cb-c0db-7517-62a761f144c8@gmail.com>
Subject: Re: CLA concerns
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - FF65 (Linux)/8.5.0_GA_3042)
Thread-Topic: CLA concerns
Thread-Index: 1qV8ZazwSdez8M8H1o7jZHEEyxK2pA==
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

Thank you for your response!

No, we are not looking to upstream any patches that contain any patented technology.  The main concern is that the language is somewhat open-ended, and an argument exists that if a third party wanted to infringe on the patented parts (which we were planning to maintain downstream as you mention) all they would need to do is to extend the code we added to tree, then claim that the combination of our code and their new infringing code was authorized by the CLA.

If it could be made clearer that our patent release /only/ holds for the patches that were signed off by us, that would probably allow us to proceed.  Just as the project and its contributors are not in general able to perform a full search to avoid infringement, it is similarly unreasonable to require us to audit the entire extant codebase against our patent portfolio before we can contribute patches in one specific, audited, and cleared area.

----- Original Message -----
> From: "krtaylor" <kurt.r.taylor@gmail.com>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>, "openbmc" <openbmc@lists.ozlabs.org>
> Sent: Wednesday, May 1, 2019 1:51:30 PM
> Subject: Re: CLA concerns

> Hi Timothy, You are absolutely right to examine the CLA/CCLA IP terms
> and make sure that they are compatible with your product legal team.
> 
> I am not an attorney, but do have several years experience with these
> things. See my questions/comments below inline.
> 
> On 5/1/19 2:38 AM, Timothy Pearson wrote:
>> All,
>> 
>> While we would like to upstream the Talos II / Blackbird BMC patches to the
>> OpenBMC project, our legal folks will not approve the CLA.  The main concern is
>> the patent section, since our mainboards do contain patented technology that is
>> not part of OpenBMC, but that OpenBMC may interface with.  We are not trying to
>> upstream any code that would result in patent action, but are very concerned
>> that the CLA would end up granting a license for the patented technology that
>> exists outside of OpenBMC, merely because the OpenBMC codebase is able to
>> interface with that external technology.
> 
> Is the concern about releasing IP about the interface, in that it might
> give clues to what/how the patented technology operates? What if that
> interface was abstracted in some way and kept in a downstream private
> (behind your firewall) fork of OpenBMC that you built and supported for
> your customers?
> 
> This is a typical practice for keeping company value-add or patented
> technology separate from the upstream open code base.
> 
>> 
>> The specific clause in question is:
>> "...or by combination of Your Contribution(s) with the Work to which such
>> Contribution(s) were submitted."
>> 
>> This is ambiguous enough that legal is concerned an external entity wishing to
>> clone the patented technology from our mainboards without a license would
>> simply be able to merge our contributions with their own de novo code
>> duplicating parts of the patented technology, then claim a license for the
>> patents was automatically granted by the CLA.  As such, we are currently
>> blocked from upstreaming code to OpenBMC, despite the fact that our patches are
>> freely available under GPL and MIT licenses, and that those patches are not
>> covered by any of our patents (past or future).
> 
> Patches/features contributed to OpenBMC should not contain any patented
> technology. Any value-add or patented technology that you have should be
> kept in your downstream fork (see above).
> 
>> 
>> Is there a way to clean up the patent section of the CLA to make it clearer that
>> only the patches submitted are released from patent infringement claims, and
>> that any third party modifications to those patches (or to the codebase created
>> in part by those patches) must still be cleared by their respective authors /
>> maintainers not to infringe on the patent rights of other contributors to the
>> codebase?
> 
> You can imagine that requiring a developer to clear modifications of
> patent infringement would be a monumental task to burden the repo
> maintainer with on a per-patch basis. As said above, any patch that
> would require this special treatment should be kept in a downstream
> product fork.
> 
> I would like to learn more about this, and help if I could. Apologies in
> advance if I have misunderstood any of your points.
> 
> Kurt Taylor (krtaylor)
> 
>> 
>> Thank you!
>> 
>> --
>> Timothy Pearson
>> Raptor Engineering, LLC
>> https://www.raptorengineering.com
>> +1 (415) 727-8645
