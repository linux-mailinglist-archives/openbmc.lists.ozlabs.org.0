Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3EA2731CC
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 20:21:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwCS34DgKzDqW8
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 04:21:07 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwCQs0z92zDqfZ
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 04:20:04 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Mon, 21 Sep 2020 14:20:00 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Ed Tanous <ed@tanous.net>
Subject: Re: interest in a minimal image recipe
Message-ID: <20200921182000.twlx3epiawrlfs55@thinkpad.fuzziesquirrel.com>
References: <20200915202832.rq3os62pdj7mzaco@thinkpad.fuzziesquirrel.com>
 <CACWQX80tELWA-EW0A8-DnJGFmJyMxDC04YTq4B+--bRaoV8rOQ@mail.gmail.com>
 <20200921125540.4d6amvus3wt57igg@thinkpad.fuzziesquirrel.com>
 <CACWQX82i4k+PADJkOjDQEeUAQJtve+pySLRQVcqR7XayG5cJCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACWQX82i4k+PADJkOjDQEeUAQJtve+pySLRQVcqR7XayG5cJCw@mail.gmail.com>
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

On Mon, Sep 21, 2020 at 08:53:26AM -0700, Ed Tanous wrote:
>On Mon, Sep 21, 2020 at 5:55 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>>
>> Ok but those are autotools/cmake/meson options which correlate to a
>> distro feature or maybe a packageconfig.  Those are orthogonal to image
>> features and image recipes, which is what I've proposed.  I've not
>> proposed a minimal distro policy.
>
>Maybe this has all been a wash then.  I had thought you were proposing
>a minimal distro, and didn't realize you were building a minimal image
>with the existing distro.  My bad.

No worries.  To have a minimal distro, we first need a set of default 
distro features from which to subtract some to have a minimal set.  We 
don't really have any real distro features defined yet - the ones we do 
are non-sensical IMO - they are artifacts of my lack of bitbake-fu from 
5 years ago.  I would like to hear about areas where you think it might 
make sense to define distro features.

>With that said, the images description is "Basic OpenBMC image with
>full support for the hardware supported by the system".  Was it
>intentional to call out "full support"?  Maybe I've misinterpreted the
>long term intent of this patch?

I can see how my summary would cause confusion.  FWIW I used the summary 
in core-image-base as a template.  Is there a better summary?

Maybe this helps - I was trying to replicate oe-core:

  core-image-sato -> obmc-phosphor-image (all/most of the image features 
                                          are enabled by default)
  core-image-base -> obmc-phosphor-image-base (a minimal set of packages)

What is the minimal set of packages?  I don't think we know yet.  I 
expect many to bbappend obmc-phosphor-image-base, and select specific 
image features (IMAGE_FEATURES) or directly install packages 
(IMAGE_INSTALL).  After enough time has passed, we can use those as an 
input for identifying what makes sense to use in the base image recipe 
as the default.
