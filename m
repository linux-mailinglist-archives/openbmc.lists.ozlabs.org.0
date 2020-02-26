Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4B416FF31
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 13:40:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SFkp71Q2zDqWg
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 23:40:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=aleksandr.v.tereschenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SDps0qCCzDqbx
 for <openbmc@lists.ozlabs.org>; Wed, 26 Feb 2020 22:58:43 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Feb 2020 03:58:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,488,1574150400"; d="scan'208";a="317393199"
Received: from avteresc-mobl1.ger.corp.intel.com (HELO [172.22.245.179])
 ([172.22.245.179])
 by orsmga001.jf.intel.com with ESMTP; 26 Feb 2020 03:58:39 -0800
Subject: Re: Security Working Group meeting - this Wednesday February 19 -
 summary results
To: openbmc@lists.ozlabs.org
References: <b9170918-0937-714a-470e-cb41e1e74b63@linux.ibm.com>
 <f4d9d6f6-277e-8c8b-6b5c-d0577eaa82cc@linux.ibm.com>
 <20200220162633.GB41328@patrickw3-mbp.dhcp.thefacebook.com>
 <2b30dde7-3415-8c7a-2001-28793e938339@linux.intel.com>
 <20200221201022.GA67957@patrickw3-mbp.dhcp.thefacebook.com>
 <2c409610c4544e0187e37a5322c6a313@SCL-EXCHMB-13.phoenix.com>
 <18a2f2f6-7281-8884-20c2-eceee87c3bea@linux.intel.com>
 <21543.1582561154@localhost>
From: Alexander Tereschenko <aleksandr.v.tereschenko@linux.intel.com>
Message-ID: <817a0984-4928-17c5-d6a5-1f2a5b2ccb1b@linux.intel.com>
Date: Wed, 26 Feb 2020 12:58:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <21543.1582561154@localhost>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

> James Feist <james.feist@linux.intel.com> wrote:
>      > I think the original motivation of 10 years was something above the average
>      > support cycle of a server, so on first boot the user has something they can
>      > use to login to the server with.
>
> That's not a crazy consideration to me.

James, do you imply that the certificate would be generated during 
server manufacturing, not at the first boot at the "end owner's" premise?
If so, that indeed changes the perspective, I personally and I think 
everyone in our discussion during the meeting thought of the generation 
as happening at the latter moment, not the former.

>      > That being said, if the browser wont let you
>      > in, that is obviously more important. 30 days seems a bit too strict
>      > considering shipping / unpacking times make it likely you'll have an expired
>      > certificate upon arrival. But if we can't come to an agreement, we can always
>      > make this configurable.
>
> 1) it would be good to clarify what browsers are really going to do.

Indeed - especially given that the recommendation mentioned [1] is a 
CA-side one (used for _issuing_ certs) and the respective RFC section 
for X.509 [2] is unchanged - so I'd expect browsers to continue sticking 
to that. Unless, of course, someone decides to go the "let's make it 
more secure for people based on that CA/Browser forum recommendation" 
way and adds some logic that would do otherwise... However imagine how 
would that look like - the browser is at the receiving end (i.e. 
browser's user typically has no control over the cert), what does it do 
when getting such a cert? Throw a warning like "this server's 
certificate is valid for more than two years, beware" or something? 
That's bad UX, [very likely] can't be acted upon by the user anyway and 
actually FUD - the certificate is perfectly valid.

So if you want my guess, I think browsers won't do a thing about that 
and that recommendation will be enforced at the CA level only, so it is 
unlikely to affect OpenBMC users at the end of the day.

I was more concerned with the general fact that the self-signed cert we 
generate doesn't provide full protection and what _gentle_ nudges could 
be used for them to change that. In that context those 30 days looked ok 
(don't break anything, but provide additional warning for an admin).

BTW, that MiTM may not only be happening at the network level - e.g. 
admin's computer may be compromised and some process there could MitM 
the connections without tapping the network infra proper.

All in all, it actually sounds to me like we may as well be not doing 
anything here :) If admin's threat model allows for using the 
self-generated self-signed cert, early expiration may be worse UX than 
today - and if the threat model doesn't allow for that, the cert will be 
replaced anyway.

[1] https://cabforum.org/wp-content/uploads/CA-Browser-Forum-BR-1.6.7.pdf

[2] https://tools.ietf.org/html/rfc5280#section-4.1.2.5
