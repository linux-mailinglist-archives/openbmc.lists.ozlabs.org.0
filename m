Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F911EE718
	for <lists+openbmc@lfdr.de>; Thu,  4 Jun 2020 16:58:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49d86C4xDHzDqsJ
	for <lists+openbmc@lfdr.de>; Fri,  5 Jun 2020 00:58:11 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49d85B4BjjzDqg6
 for <openbmc@lists.ozlabs.org>; Fri,  5 Jun 2020 00:57:16 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <f590449eb4146a1c68560aa89ed5e61b3e4cd64c.camel@fuzziesquirrel.com>
Subject: Re: Hello to OpenBMC Team
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Date: Thu, 04 Jun 2020 10:57:03 -0400
In-Reply-To: <DF4PR8401MB1145F2F1E0F66E7DA633D85F8F880@DF4PR8401MB1145.NAMPRD84.PROD.OUTLOOK.COM>
References: <DF4PR8401MB11451AC66E463D2EC408D2CA8F8B0@DF4PR8401MB1145.NAMPRD84.PROD.OUTLOOK.COM>
 <511713b5b1f66805a79ffadde5ba09a70db4c6fc.camel@fuzziesquirrel.com>
 <DF4PR8401MB1145F2F1E0F66E7DA633D85F8F880@DF4PR8401MB1145.NAMPRD84.PROD.OUTLOOK.COM>
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

On Wed, 2020-06-03 at 19:36 +0000, Garrett, Mike (HPE Server Firmware)
wrote:
> Hi Brad,
> 
> Our thinking is to set up public forks "close to home" that we can
> work rapidly in 

That makes sense - my dream is that someday everyone could work rapidly
directly in upstream.  We have work to do to get there for sure.    If
ideas come up that could make the situation better please share them
here on the list.

I think it works best for everyone involved when you can commit to
working directly upstream, first.  My observation is that it is
extremely difficult to circle back and incorporate community feedback
after you have something that works for you.  That can lead to problems
like the code not being accepted or introducing fragmentation into the
project.

But I understand that can be really hard and conflicting internal
business pressures are often mitigated with techniques like the one you
have described.  My company maintains forks too.

One last opine just in case its helpful - like security, working in
upstream first isn't boolean - it is a spectrum.  Where an organization
(or a single developer) lands on that spectrum is one element of what
separates those with influence over others from those without.

> and simultaneously work to upstream patches for U-boot, Linux, and
> OpenBMC to the main repos.  

Great!  Looking forward to working with you and the team on that.

thx -brad
