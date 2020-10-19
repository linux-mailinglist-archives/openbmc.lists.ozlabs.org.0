Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A119D292AC6
	for <lists+openbmc@lfdr.de>; Mon, 19 Oct 2020 17:47:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFLjh2wgdzDqWy
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 02:47:20 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFLhc55r6zDqVn
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2020 02:46:23 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <52de6ccfe559e95d0a754fb93b6b5969998ebdd9.camel@fuzziesquirrel.com>
Subject: Re: Moving phosphor-power/tools/i2c into a separated repo
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Lei Yu <yulei.sh@bytedance.com>, openbmc <openbmc@lists.ozlabs.org>, 
 Matt Spinler <spinler@us.ibm.com>, Shawn McCarney <shawnmm@us.ibm.com>,
 Jet_JC_Lee@wistron.com
Date: Mon, 19 Oct 2020 11:46:18 -0400
In-Reply-To: <CAGm54UEiiuBbBbozu2xecjq3HHBvOJo+afqOkd+ppx00XFKTOA@mail.gmail.com>
References: <CAGm54UEiiuBbBbozu2xecjq3HHBvOJo+afqOkd+ppx00XFKTOA@mail.gmail.com>
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

On Mon, 2020-10-19 at 17:39 +0800, Lei Yu wrote:
> This email is to propose to move the i2c library in phosphor-power to
> a separated repo.
> 
> In OpenBMC, some repos need i2c/SMBus access to various devices.
> E.g.
> * phosphor-power implements a C++ wrapper of libi2c in tools/i2c to
> talk to PSU.
> * dbus-sensors is going to have a wrapper to send smbus commands.
> * We have an internal (probably will be upstreamed later) repo using
> i2c to communicate with a CPLD.
> 
> The one in [phosphor-power][1] is a full C++ wrapper, that supports
> byte/word/block read/write, supports both I2C and SMBus
> communications, and provides a mocked interface for unit tests.
> It could be a good candidate for a separate repo so that it could be
> shared by other repos.
> 
> What do you think?
> 
> [1]: https://github.com/openbmc/phosphor-power/tree/master/tools/i2c
> 

In general I would rather see us working with the kernel community to
find a way to meet our needs.  To me i2c-dev (and libraries built on top
of it) feels like a workaround to missing kernel frameworks.

I realize that is hard, so in the absence of that I wonder if anyone has
ever tried to get something like this:

https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/bindings/cxx

into i2c-tools:

https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git/tree/
