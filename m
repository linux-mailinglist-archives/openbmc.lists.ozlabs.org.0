Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD14203BA1
	for <lists+openbmc@lfdr.de>; Mon, 22 Jun 2020 17:56:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rDXf461BzDqXf
	for <lists+openbmc@lfdr.de>; Tue, 23 Jun 2020 01:56:02 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rDWZ5zdvzDqR6
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jun 2020 01:55:06 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <1c18b5232c02f0fe704577a5efb6b593c08407f1.camel@fuzziesquirrel.com>
Subject: Re: OpenBMC - how best to do meta-hpe commit
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>, "Verdun,
 Jean-Marie" <jean-marie.verdun@hpe.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Date: Mon, 22 Jun 2020 11:54:23 -0400
In-Reply-To: <DF4PR8401MB11459191B8F682B8DAB4707A8F980@DF4PR8401MB1145.NAMPRD84.PROD.OUTLOOK.COM>
References: <DF4PR8401MB11459191B8F682B8DAB4707A8F980@DF4PR8401MB1145.NAMPRD84.PROD.OUTLOOK.COM>
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

On Fri, 2020-06-19 at 15:37 +0000, Garrett, Mike (HPE Server Firmware)
wrote:
> Hi Brad and all,
> 
> Thank you for creating meta-hpe.  I'd like your opinion on the best
> way to do our initial meta-hpe commit.  Its currently 168 files split
> into (1) a machine layer for our DL360, (2) a BMC SOC layer, (3) a
> common layer for elements common to HPE platforms.  I know the team
> prefers small commits but would like your thoughts on this since it is
> more or less atomic.
> 
> I assume this would get committed to 
> https://gerrit.openbmc-project.xyz/openbmc/meta-hpe and go through the
> normal Gerrit review process right?  I've looked and not been able to
> find good examples of other "1st commits" to see how it's been done in
> the past.
> 
> Thanks,
> 
> Mike

Hi Mike

I didn't have anything to add beyond what Andrew said in the other
thread.

> However, my guess at the best course of action is to push the one big
> commit you have to gerrit,

I agree with this ^ we can go from there.

thx - brad
