Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B05B910EF6
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 00:24:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vXyH6k7rzDqQ3
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 08:24:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.45;
 helo=mail.rptsys.com; envelope-from=tpearson@raptorengineering.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b="uNpWS8gl"; dkim-atps=neutral
Received: from mail.rptsys.com (mail.rptsys.com [23.155.224.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vXxK4fh5zDqQw
 for <openbmc@lists.ozlabs.org>; Thu,  2 May 2019 08:24:04 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A9402D8230F;
 Wed,  1 May 2019 17:24:02 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Q_Jxa-lwQGyZ; Wed,  1 May 2019 17:24:02 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id ED439D83509;
 Wed,  1 May 2019 17:24:01 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com ED439D83509
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1556749442; bh=KNnmIE12VSRMgoAn4Dd9DEXLH12YiHn5FlcWiFxbIqU=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=uNpWS8gl9TpPqj91HwOu5ZHx4qIzrGW6iOW2sWs1OPESUaJpyxTfK8MHb4kfwxd2I
 0Lfg/29HVQ0h+wycEPqtZiDQqo+pi2uotxYP95zRuz7yG8X9F/t+NBEf/w1vs/Y2HY
 74pgCtGbsvfKZViopfIpSKXlzPDuTcPa3/eKeGZE=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 8zz7pQdZeOJl; Wed,  1 May 2019 17:24:01 -0500 (CDT)
Received: from vali.starlink.edu (vali.starlink.edu [192.168.3.21])
 by mail.rptsys.com (Postfix) with ESMTP id CD2FCD83507;
 Wed,  1 May 2019 17:24:01 -0500 (CDT)
Date: Wed, 1 May 2019 17:24:01 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Message-ID: <1190272602.3390634.1556749441142.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <20190501154412.t2st22so32q576as@thinkpad.dyn.fuzziesquirrel.com>
References: <757768607.3289093.1556696321378.JavaMail.zimbra@raptorengineeringinc.com>
 <20190501154412.t2st22so32q576as@thinkpad.dyn.fuzziesquirrel.com>
Subject: Re: CLA concerns
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - FF65 (Linux)/8.5.0_GA_3042)
Thread-Topic: CLA concerns
Thread-Index: lqOvmprdyxNWvYXUDzy3cFGwQyJteA==
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

----- Original Message -----
> From: "Brad Bishop" <bradleyb@fuzziesquirrel.com>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "openbmc" <openbmc@lists.ozlabs.org>
> Sent: Wednesday, May 1, 2019 10:44:12 AM
> Subject: Re: CLA concerns

> On Wed, May 01, 2019 at 02:38:41AM -0500, Timothy Pearson wrote:
>>
>>Is there a way to clean up the patent section of the CLA to make it
>>clearer that only the patches submitted are released from patent
>>infringement claims, and that any third party modifications to those
>>patches (or to the codebase created in part by those patches) must
>>still be cleared by their respective authors / maintainers not to
>>infringe on the patent rights of other contributors to the codebase?
> 
> Hi Timothy
> 
> I'm guessing the first thing the lawyers will want to know is, what
> wording would be acceptable to Raptor?  Do you think you could ask your
> legal team to take a crack at the actual wordling they'd like to see
> such that Raptor could sign?  Then any interested legal party can simply
> review the wording and accept the change or propose an alternative.
> 
> thx - brad

Absolutely!  As the entire problem revolves around this language:

"where such license applies only to those patent claims licensable by You that are necessarily infringed by Your Contribution(s) alone or by combination of Your Contribution(s) with the Work to which such Contribution(s) was submitted."

we would propose to strike that and replace with:

"where such license applies only to those patent claims licensable by You that are necessarily infringed by Your Contribution(s) to the Work, in isolation, at the time of submission.  If Your Contribution(s) do not infringe on patent claims licensable by You at the time of submission to the Work, no license to patent claims shall be granted under this section by You as a result of submission of Your Contribution(s)."

This has two effects: 
1.) It reduces the burden of accepting the CLA from having to audit the entire codebase of OpenBMC and its linked projects for potential patent infringement.  This level of audit is not in the best interests of Raptor or the OpenBMC project; we do not engage in "patent trolling" as a general policy, and as such there is no tangible benefit for us to engage in this type of audit activity.  This is the reasoning behind the "in isolation" wording and related changes.

2.) It closes the loophole of a third party extending "The Work" once it contains "Your Contributions" to infringe on patented technologies, then claiming the CLA allowed said extension under automatic patent grant.  This is why we specifically state "at the time of submission to the Work", to avoid Section 3 from triggering an automatic patent grant as a result of subsequent third party modification of "The Work".

Please let me know if there are concerns with the new wording that are not addressed so that we can try to find common ground if possible.

Thank you!
