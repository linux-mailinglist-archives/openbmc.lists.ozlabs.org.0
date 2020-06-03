Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8A71ED6ED
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 21:32:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cfDf3ZwTzDqBc
	for <lists+openbmc@lfdr.de>; Thu,  4 Jun 2020 05:32:02 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cf3f6BzGzDqfJ
 for <openbmc@lists.ozlabs.org>; Thu,  4 Jun 2020 05:24:14 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <511713b5b1f66805a79ffadde5ba09a70db4c6fc.camel@fuzziesquirrel.com>
Subject: Re: Hello to OpenBMC Team
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Date: Wed, 03 Jun 2020 15:24:02 -0400
In-Reply-To: <DF4PR8401MB11451AC66E463D2EC408D2CA8F8B0@DF4PR8401MB1145.NAMPRD84.PROD.OUTLOOK.COM>
References: <DF4PR8401MB11451AC66E463D2EC408D2CA8F8B0@DF4PR8401MB1145.NAMPRD84.PROD.OUTLOOK.COM>
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
Cc: "Shaffer, Scott" <scott.shaffer@hpe.com>, "Verdun,
 Jean-Marie" <jean-marie.verdun@hpe.com>, "Cisneros,
 Jorge \(George\)" <jorge.cisneros@hpe.com>, "Rodgers,
 Renee" <renee.rodgers@hpe.com>, "Chung, John \(TWN iLO\)" <john.chung@hpe.com>,
 "Chen, Gilbert" <gilbert.chen@hpe.com>, "Newman,
 Edward \(iLO Firmware\)" <edward.newman@hpe.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2020-06-02 at 20:56 +0000, Garrett, Mike (HPE Server Firmware)
wrote:
> Hello OpenBMC team,
> 
> My name is Mike Garrett and I work with a team at Hewlett Packard 

Welcome Mike and HPE.


> Enterprise creating a port of OpenBMC on our server hardware.  We have
> just signed the CCLA (attached) and uploaded it.  We look forward to
> working with the OpenBMC community.

Likewise!

> 
> To introduce myself, I am a firmware architect in HPE's compute group
> with a background in BIOS and BMC firmware.  There will be a few other
> folks on our team working with me, all with BMC development
> experience.
> 
> The team has created a port of OpenBMC for our DL360 2-socket 1U rack
> server that runs in place of our iLO 5 firmware.

Is this https://github.com/HewlettPackard/openbmc?  Thanks for leaving
the attribution to the upstream project ("forked from openbmc/openbmc").

> This has been shown as a proof of concept at a few venues including
> most recently the OCP Virtual Summit a couple of weeks ago.  Jean-
> Marie Verdun has used this proof of concept as the underlying hardware
> for an Open Source Firmware CI system.  We hope to the upstream the
> OpenBMC work soon.

Awesome!

> 
> I believe the next request is to ask for team members to be added to
> the gerrit system?

All you need to log in to Gerrit and submit code is a github account.

To have your code automatically tested by the CI system, you do need to
be on an ACL - I'll set that up as soon as you log into gerrit.

thx - brad
