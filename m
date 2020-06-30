Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D4020F548
	for <lists+openbmc@lfdr.de>; Tue, 30 Jun 2020 14:59:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49x4FM2J3HzDqcG
	for <lists+openbmc@lfdr.de>; Tue, 30 Jun 2020 22:59:35 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49x4Cn0XdnzDqTQ
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jun 2020 22:58:11 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <592efd7f5f45e2831dda06e1bac5a501ae33ce10.camel@fuzziesquirrel.com>
Subject: Re: [PATCH linux dev-5.4 2/2] ARM: dts: Aspeed: Tacoma: Enable EHCI
 controller
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Joel Stanley <joel@jms.id.au>, Eddie James <eajames@linux.ibm.com>
Date: Tue, 30 Jun 2020 08:57:15 -0400
In-Reply-To: <CACPK8Xd==01QYwGsqyophmaSFHpDqH=NVc8oEZhXfjJo9GU71Q@mail.gmail.com>
References: <20200616135724.24514-1-eajames@linux.ibm.com>
 <20200616135724.24514-3-eajames@linux.ibm.com>
 <CACPK8Xd==01QYwGsqyophmaSFHpDqH=NVc8oEZhXfjJo9GU71Q@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2020-06-30 at 03:02 +0000, Joel Stanley wrote:
> On Tue, 16 Jun 2020 at 13:57, Eddie James <eajames@linux.ibm.com>
> wrote:
> > Enable the second EHCI controller on the AST2600. Also add a line-
> > name
> > for the GPIO that controls power to the USB port.
> 
> What's the idea behind the power control?
> 
> Is there any reason not to add a hog, so power is always applied?

There is a desire to allow the port to be disabled, for those that are
worried about rogue USB sticks.
