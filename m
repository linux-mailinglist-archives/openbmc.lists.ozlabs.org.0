Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C415F518D78
	for <lists+openbmc@lfdr.de>; Tue,  3 May 2022 21:50:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kt9Xk4rCzz3bbG
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 05:49:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=djeVL9F1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=djeVL9F1; dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kt9XG0Sj2z2yHp
 for <openbmc@lists.ozlabs.org>; Wed,  4 May 2022 05:49:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651607374; x=1683143374;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=fUJ/gwn8CfbFiR1jf8jYctZQQwX2R15XnXQFxk7vCEY=;
 b=djeVL9F1NNIjBysIAGAGz+SdOgzlibk/OeMouwNktLer+HXILVp/fG60
 ZAMdqOoX65pDuE9ol7bE4mU8PBeKVBkPiCxDBDH8yk1KYU7wPqCGbBXNG
 M2ki9AlDKlsLaZZe8SrvnXWrQAoCm8st74hZj/HPrS0LexikLFUZAUMMs
 KtEe2V1WIUZ+Uw7acvhUS146yo/x3rCagGIXJi8L9vIblITcDSTT3nKIm
 7sGaPk5U/nC+SLQiozQ3f/9AbylFWQZU7ThrWK4gmRF5bdJ19mxRRUhIV
 4FA1YukBexoqRrQl9oPq7adF2UciGy/opscvFYu9Tmv9qsVrx0ZS6U6x1 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="267451250"
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; d="scan'208";a="267451250"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 12:48:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; d="scan'208";a="567778403"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga007.fm.intel.com with ESMTP; 03 May 2022 12:48:27 -0700
Received: from [10.212.16.39] (jmbills-MOBL.amr.corp.intel.com [10.212.16.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 9651358095D
 for <openbmc@lists.ozlabs.org>; Tue,  3 May 2022 12:48:27 -0700 (PDT)
Message-ID: <50d7a4cf-d379-29ae-f635-ce4d79974305@linux.intel.com>
Date: Tue, 3 May 2022 13:48:26 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Running OpenBMC Daemons/Applications as non root using D-Bus
 Session/User Bus.
Content-Language: en-US
To: openbmc@lists.ozlabs.org
References: <16ba58d6-d06b-1c92-340b-e94119a47708@linux.intel.com>
 <YnBcJ6GPKIBpqYWN@heinlein.stwcx.org.github.beta.tailscale.net>
 <cfed9171-10fa-d8a7-e1e5-74cef23bc299@linux.intel.com>
 <YnEZ3irWISTwEikW@heinlein.stwcx.org.github.beta.tailscale.net>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
In-Reply-To: <YnEZ3irWISTwEikW@heinlein.stwcx.org.github.beta.tailscale.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 5/3/2022 6:02 AM, Patrick Williams wrote:
> On Mon, May 02, 2022 at 11:00:01PM -0700, Nirav Shah wrote:
>> Hello,
>>
>> <<<< Moving everything from the system to session /bus/ doesn't really
>> improve either of these aspects.
>>
>> I agree i am not proposing a complete transition to session bus. The
>> proposal is to move the interactions to and from as you defined it
>> "external facing application" and anything that does _*NOT*_ really need
>> root access to the session bus by running them as non-root. Applications
>> that "may" need root access (may be because the hardware interface
>> requires root privilege) will continue to use the system bus for
>> communicating with other root application and session bus for
>> communication with non root applications.
> 
> To be honest, this sounds even more complex than just using the session
> bus for almost everything.
> 
>> I agree that BMCWeb can run as non root today and still be on the system
>> bus. Also agree, this is better than running BMCWeb as root. However,
>> "We can then figure out how to further limit the DBus APIs after that"
>> is what I want to address. How does having a session bus help solve
>> this? This for me is complicated to put down in an email. If my
>> explanation below sounds too high level, I would agree with that too.
> ...
>> This is the approach I have seen in most of the Linux Distros for
>> desktop. I understand OpenBMC does not have the same use cases as
>> desktop but in this case it could be lot similar. Does this change your
>> mind?
> 
> Not really. :)  Yes, "too high level" is probably the simplest statement
> here.
> 
> Let me switch this discussion around a bit.  Please name me 4 daemons,
> which currently reside on the system bus, and that bmcweb does not and
> should not ever access.
One possible example that maybe isn't in place yet is MCTP.  If we end 
up exposing an MCTP interface over D-Bus, is there risk that this could 
be used maliciously since a compromised application running as root has 
direct access to the MCTP interface?

If the direct MCTP interface is on the system bus and the filtered MCTP 
interface is on the session bus, then a compromised non-root application 
would still be blocked from accessing the direct MCTP interface.

> 
> I think you'll find it hard to enumerate because our architecture is
> purposefully very flat.  I know the codebase fairly well and have thought
> about it for a bit and can only come up with one: kcsbridge (or btbridge).
> Perhaps you could expand to a few of the systemd daemons (org.freedesktop)
> where we've created an abstraction (xyz.openbmc_project), but I actually see
> present day code in bmcweb which interacts with the ones I was thinking of
> there.
> 
> So, effectively everything would need to be moved to the session bus
> _and_ we'd still need a mechanism for bmcweb to access some of the
> system bus end-points (via restricted ACLs), but effectively that is
> still every single dbus endpoint.  This proposed move didn't actually
> accomplish anything from a security standpoint in practice.
> 
