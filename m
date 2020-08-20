Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBE524BE0A
	for <lists+openbmc@lfdr.de>; Thu, 20 Aug 2020 15:17:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXQDz1jDpzDr2j
	for <lists+openbmc@lfdr.de>; Thu, 20 Aug 2020 23:17:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXQBl5KjGzDqwf
 for <openbmc@lists.ozlabs.org>; Thu, 20 Aug 2020 23:15:58 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <d6d450e638d016d29496ef1713083e80551a84bd.camel@fuzziesquirrel.com>
Subject: moving meta-{openpower, x86, arm} content to meta-phosphor
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc <openbmc@lists.ozlabs.org>
Date: Thu, 20 Aug 2020 09:15:52 -0400
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Fellow OpenBMCers

Over time, I would like to do away with the processor arch layers e.g.

meta-openpower, meta-arm, meta-x86.

In hindsight meta-arm and meta-x86 might not have made much sense and
should have been something like meta-x86-intel and meta-x86-amd perhaps
- this is confirmed by the fact that there isn't any content in meta-
x86.

I propose the content simply go in meta-phosphor, and that we frame our
thinking of meta-phosphor and OpenBMC as a project that supports any and
all host processor architectures (as well as devices that aren't servers
at all).  This results in several positive things:

- Increased developer/maintainer awareness/cross pollination of other
usage patterns (community building).
- Differences are obvious, highlighting areas for improvement in the
project.
- Build time, cross arch incompatibilities become obvious (e.g. building
images that support both Intel and AMD processors for example).
- Improved time to understanding for newcomers - everything is one
place.
- Reduced (granted a small amount) layer configuration complexity for
end users.

I'm not aware of any benefits to factoring things out into the different
layers like we have today - if you are aware of something, please share.

Getting more detailed, how would this look?  This series is an example:

https://gerrit.openbmc-project.xyz/35759

For projects that are truly host processor specific e.g. peci or occ
support, we already have a recipes-x86 folder:

https://github.com/openbmc/meta-phosphor/tree/master/recipes-x86

I propose we allow the creation of additional folders using this
convention e.g.

- recipes-power
- recipes-x86-amd (we might want to look at renaming recipes-x86 to
recipes-x86-intel)

Or even better IMO, we co-mingle these recipes as well based on the
abstract function they provide for some of the same reasons I would like
to move to a single layer - increased awareness of what your community
peers are up to.

Please share your thoughts on the matter.

thx - brad
