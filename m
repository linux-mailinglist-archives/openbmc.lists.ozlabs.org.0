Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D02710A39
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 17:44:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vN3r3JD0zDqPf
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 01:44:08 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vN3447KmzDqPG
 for <openbmc@lists.ozlabs.org>; Thu,  2 May 2019 01:43:27 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Wed, 1 May 2019 11:44:12 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: CLA concerns
Message-ID: <20190501154412.t2st22so32q576as@thinkpad.dyn.fuzziesquirrel.com>
References: <757768607.3289093.1556696321378.JavaMail.zimbra@raptorengineeringinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <757768607.3289093.1556696321378.JavaMail.zimbra@raptorengineeringinc.com>
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

On Wed, May 01, 2019 at 02:38:41AM -0500, Timothy Pearson wrote:
>
>Is there a way to clean up the patent section of the CLA to make it
>clearer that only the patches submitted are released from patent
>infringement claims, and that any third party modifications to those
>patches (or to the codebase created in part by those patches) must
>still be cleared by their respective authors / maintainers not to
>infringe on the patent rights of other contributors to the codebase?

Hi Timothy

I'm guessing the first thing the lawyers will want to know is, what
wording would be acceptable to Raptor?  Do you think you could ask your
legal team to take a crack at the actual wordling they'd like to see
such that Raptor could sign?  Then any interested legal party can simply
review the wording and accept the change or propose an alternative.

thx - brad
