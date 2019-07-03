Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF875D88A
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2019 02:07:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dhJQ169zzDqX7
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2019 10:07:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dhHs53KqzDqTb
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jul 2019 10:07:20 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x63078Ia006035;
 Tue, 2 Jul 2019 19:07:09 -0500
Message-ID: <e5f536d8ceb6017aab17773f3eed2e10b1f687b9.camel@kernel.crashing.org>
Subject: Re: fsi/sbefifo problems on bmc
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Eddie James <eajames@linux.vnet.ibm.com>, Ivan Mikhaylov
 <i.mikhaylov@yadro.com>, cbostic@linux.vnet.ibm.com
Date: Wed, 03 Jul 2019 10:07:07 +1000
In-Reply-To: <e76b6c0d-f822-18f3-a5f6-6e69e50ec390@linux.vnet.ibm.com>
References: <ce4ba08f8d44c5e3d1f8a549578ce23c2311f39d.camel@yadro.com>
 <e76b6c0d-f822-18f3-a5f6-6e69e50ec390@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
Cc: Alexander Amelkin <a.amelkin@yadro.com>, openbmc@lists.ozlabs.org,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2019-07-02 at 10:24 -0500, Eddie James wrote:
> > On the first run we have no problems with fsi and sbefifo and no issues with
> > fifo or problems with switching from SOFTWARE_PGOOD to BMC_POWER_UP. In the
> > consequenced reboots we have unresponsive host and only manual powercycle helps.
> > 
> >   From my point of view it seems like the fsi slave became unresponsive which
> > resulted in the fifo problem and in problems with other stuff.
> > We're looking for some guidance on how to debug that. Maybe some hard fsi reset
> > via devmem could help?
> 
> 
> I believe Ben H. wrote the coldfire FSI stuff, and much of the SBEFIFO 
> driver... cc'ing him to see if he would like to help.

Nothing obvious comes to mind. Is basic CFAM access working ? Can you
check the SBE it still up and running and not crashed ?

You rescan FSI on power on ?

Cheers,
Ben.

