Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD3324865E
	for <lists+openbmc@lfdr.de>; Tue, 18 Aug 2020 15:48:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWC0p6JXtzDqcD
	for <lists+openbmc@lfdr.de>; Tue, 18 Aug 2020 23:48:10 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWBzs2sLPzDqMW
 for <openbmc@lists.ozlabs.org>; Tue, 18 Aug 2020 23:47:19 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <a572c98e059865e4875f69eb3b53740b6e32b53a.camel@fuzziesquirrel.com>
Subject: Re: [PATCH linux dev-5.7 v1] ARM: dts: aspeed: rainier: Add I2c
 buses for nvme use
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Santosh Puranik <santosh.puranik.ibm@gmail.com>, Jet.Li@ibm.com
Date: Tue, 18 Aug 2020 09:47:15 -0400
In-Reply-To: <16a09d4c-7499-b75d-6bf6-3ec8a0e0d51d@gmail.com>
References: <20200721115942.27009-1-Jet.Le@ibm.com>
 <16a09d4c-7499-b75d-6bf6-3ec8a0e0d51d@gmail.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2020-08-18 at 19:13 +0530, Santosh Puranik wrote:
> Hi Jet,
> 
> On 7/21/20 5:29 PM, Jet Li wrote:
> > From: Jet Li <Jet.Li@ibm.com>
> > 
> > Adding pca9552 exposes the presence detect lines for the cards
> > and tca9554 exposes the presence details for the cards.
> > 
> > Signed-off-by: Jet Li <Jet.Li@ibm.com>

Actually 5.8 just went in, so this will need to be rebased and
resubmitted.
