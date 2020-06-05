Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 530B31EF897
	for <lists+openbmc@lfdr.de>; Fri,  5 Jun 2020 15:05:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49djYq3ym1zDr0R
	for <lists+openbmc@lfdr.de>; Fri,  5 Jun 2020 23:05:35 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49djXj1zW1zDqvW
 for <openbmc@lists.ozlabs.org>; Fri,  5 Jun 2020 23:04:36 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <030cdf274fbd7915aab1fe8c37a550f286cf2058.camel@fuzziesquirrel.com>
Subject: Re: Hello to OpenBMC Team
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Verdun, Jean-Marie" <jean-marie.verdun@hpe.com>, "Garrett, Mike (HPE
 Server Firmware)" <mike.garrett@hpe.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Date: Fri, 05 Jun 2020 09:04:23 -0400
In-Reply-To: <CCD31820-98CA-496A-9C0D-21EB336C9168@hpe.com>
References: <DF4PR8401MB11451AC66E463D2EC408D2CA8F8B0@DF4PR8401MB1145.NAMPRD84.PROD.OUTLOOK.COM>
 <511713b5b1f66805a79ffadde5ba09a70db4c6fc.camel@fuzziesquirrel.com>
 <DF4PR8401MB1145F2F1E0F66E7DA633D85F8F880@DF4PR8401MB1145.NAMPRD84.PROD.OUTLOOK.COM>
 <f590449eb4146a1c68560aa89ed5e61b3e4cd64c.camel@fuzziesquirrel.com>
 <CCD31820-98CA-496A-9C0D-21EB336C9168@hpe.com>
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
Cc: "Shaffer, Scott" <scott.shaffer@hpe.com>, "Cisneros,
 Jorge \(George\)" <jorge.cisneros@hpe.com>, "Rodgers,
 Renee" <renee.rodgers@hpe.com>, "Chung, 
 John \(TWN iLO\)" <john.chung@hpe.com>, "Chen, Gilbert" <gilbert.chen@hpe.com>,
 "Newman, Edward \(iLO Firmware\)" <edward.newman@hpe.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2020-06-04 at 17:36 +0000, Verdun, Jean-Marie wrote:
> Hi Brad,
> 
> I realize that we are not in the best condition. We faced multiple
> challenges before being able to arrive to such stage. The first one is
> a chicken and egg issue, related to the need to create some momentum
> inside HPE to be able to start working on a project like OpenBMC. To
> reach it we had to create a Proof of Concept, which needed that we
> worked on our GXP asic support and introduce patches into the original
> source tree that we forked. At the PoC level, we still could have
> ended up into a situation where we would have dropped the work.
> 
> We used that PoC to demonstrate the value of OpenBMC on top of our
> hardware to public and private customers, leading to a green light to
> join the project. 
> 
> I know very well the pain to maintain a fork of a project, and I
> believe most of the HPE team also. We will work pretty hard at the
> early stage of the project to upstream what is needed just to be sure
> that we do not end up into a complex situation. My ideal goal is
> always to commit upstream instead into a fork, and I share your
> concerns. We will probably have a rollercoaster ride at the beginning
> due to the amount of code to introduce, but we are ready to adapt to
> the community needs.
> 
> I do contribute to other projects like FreeCAD, which are huge piece
> of code, and maintain the snap of it. So forking is never a good idea,
> except if you want to build a separate project, which is clearly not
> our intend ! We want to be part of this community, and make its
> software works properly on our systems.

Great!  It sounds like we are on the same page and I'm glad you were
able to build the momentum necessary to get here.

> We do have an alpha loan program which will start soon also, and we
> would like to support it "publicaly" allowing its members to rebuild
> openbmc and linuxboot image from code which are available on github,
> this also explain the tight schedule we follow.
> 
> Last but not least, I am trying to automatize as much as we can, build
> and testing on HPE hardware through our public interactive CI which is
> under active development. The tool intend to take as an input a github
> repo, a branch and build a functional openbmc/linuxboot image as an
> output which will be automatically ran on a live hardware machine. It
> is available on https://osfci.tech and 
> https://github.com/hewlettpackard/osfci. The code is still a lot
> buggy, but I am progressing on a daily basis.
> 
> One of the main advantage of it, is that you do not need to be seated
> closed to real hardware to test on real hardware. I have also included
> a build machine with a lot of core and memory, so we could batch build
> images. If needed we could try to find a way to share it as a build
> systems into OpenBMC Jenkins.

This sounds exciting.  Public, automated testing on real hardware would
be a great addition.

> By the way Brad, do you think we could create a meta-hpe into the tree
> ?

Yes.  meta-hpe created.

-brad
