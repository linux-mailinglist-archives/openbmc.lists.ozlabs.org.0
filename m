Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FFB35CF8
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2019 14:37:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JpFj4VhqzDqfL
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2019 22:36:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JpF45XpkzDqTG
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jun 2019 22:36:23 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <8a52562d6237b1a6481d964f85718a8744e7a892.camel@fuzziesquirrel.com>
Subject: Re: U-Boot environment management from userspace
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Vernon Mauery <vernon.mauery@linux.intel.com>, Adriana Kobylak
 <anoo@linux.ibm.com>
Date: Wed, 05 Jun 2019 08:35:16 -0400
In-Reply-To: <20190530172004.GA46814@mauery.jf.intel.com>
References: <20190528183802.GH15959@mauery.jf.intel.com>
 <e42fb92effbc990f60239377b05e3f4e@linux.vnet.ibm.com>
 <20190530172004.GA46814@mauery.jf.intel.com>
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
Cc: OpenBMC Development <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Vernon

> Brad,
> 
> It sounds like Intel is not the only ones that might benefit from a 
> service like this, so it might be a good time for a new
> project/repo. 
> 
> Could you create a new repo for us: phosphor-u-boot-env-mgr

Will do.

It sounds like you are working on something that needs a new repo, will
generate a new dbus API and have applications providing and consuming
that API.  That sounds like a non-trivial enhancement to OpenBMC.

Please consider having someone submit a completed design template and
opening a github issue.  This enables the rest of the community to know
what Intel is working on and when, and thus have input, possibly help,
and avoid duplicate work.  Please let me know if any of my thinking
here is flawed.

thx - brad
