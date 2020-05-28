Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 487F21E60D8
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 14:29:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Xn8G3TWpzDqXY
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 22:29:50 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Xn6n05g4zDq9D
 for <openbmc@lists.ozlabs.org>; Thu, 28 May 2020 22:28:31 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <44af65e614be220809781690e0e413b2846929f5.camel@fuzziesquirrel.com>
Subject: Re: [PATCH u-boot-v2016.07] libfdt: Make it compatible with newer dtc
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Joel Stanley <joel@jms.id.au>
Date: Thu, 28 May 2020 08:28:26 -0400
In-Reply-To: <20200518194138.GJ1166713@heinlein>
References: <20200512212755.621891-1-patrick@stwcx.xyz>
 <20200512213135.GI10214@heinlein> <20200518194138.GJ1166713@heinlein>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2020-05-18 at 14:41 -0500, Patrick Williams wrote:
> Hi Joel,
> 
> Any feedback on this?
> 
> On Tue, May 12, 2020 at 04:31:35PM -0500, Patrick Williams wrote:
> > On Tue, May 12, 2020 at 04:27:55PM -0500, Patrick Williams wrote:
> > > From: Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>
> > > 
> > > DTC does not use an underscore for the LIBFDT_H and
> > > LIBFDT_ENV_H variables, this causes an error since
> > > u-boot does.
> > > 
> > > Remove the underscore from these variables to allow u-boot
> > > to compile along with dtc.
> > > 
> > > Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> > > aehs29@gmail.com>
> > > Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> > > ---
> > 
> > Hi Joel,
> > 
> > This patch is a port from facebook/openbmc to fix some failures
> > we're
> > seeing building u-boot in some cases.  I originally tried to submit
> > it
> > as a Yocto patch [1] and Andrew Jeffery suggested I send it to your
> > branch instead.
> > 
> > 1. https://gerrit.openbmc-project.xyz/c/openbmc/meta-aspeed/+/31833

Hi Joel

Is there some other way you'd like to see this fixed?  I also ran into
the problem addressed by this patch.

thx - brad
