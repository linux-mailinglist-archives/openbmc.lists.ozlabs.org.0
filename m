Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6104A1FB165
	for <lists+openbmc@lfdr.de>; Tue, 16 Jun 2020 14:59:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mSvh1cq7zDql2
	for <lists+openbmc@lfdr.de>; Tue, 16 Jun 2020 22:59:28 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mStR3Pj0zDqSP
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jun 2020 22:58:21 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <48f251104e0380947fb1f791736a374ae64224c5.camel@fuzziesquirrel.com>
Subject: Re: Redfish Support
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: vasant patil <vasantpatil2@gmail.com>, openbmc@lists.ozlabs.org
Date: Tue, 16 Jun 2020 08:58:00 -0400
In-Reply-To: <CAERBOQ+x3aUmFu+pZUPjn4DOJ_iXKWpgG1Cq-Mza7F5hCS47mw@mail.gmail.com>
References: <CAERBOQ+x3aUmFu+pZUPjn4DOJ_iXKWpgG1Cq-Mza7F5hCS47mw@mail.gmail.com>
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

On Mon, 2020-06-15 at 16:25 -0400, vasant patil wrote:
> 
>    - Are users allowed to attend the working group (like PMCI) meeting
> who have not yet signed the CCLA?

Hi Vasant

You can definitely attend the working group without needing to sign the
CCLA.
