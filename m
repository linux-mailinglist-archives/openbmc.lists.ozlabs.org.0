Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BF2517CE6
	for <lists+openbmc@lfdr.de>; Tue,  3 May 2022 08:01:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ksq8n1DpPz3bcn
	for <lists+openbmc@lfdr.de>; Tue,  3 May 2022 16:01:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=afaDu/40;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=nirav.j2.shah@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=afaDu/40; dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ksq8M0JfTz3064
 for <openbmc@lists.ozlabs.org>; Tue,  3 May 2022 16:01:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651557667; x=1683093667;
 h=message-id:date:mime-version:reply-to:to:cc:references:
 from:subject:in-reply-to;
 bh=WH7aVeAZXednuQxJO4LmfEe9XRl7qZ6lk+ap96z0WyA=;
 b=afaDu/40bBWpbZZZxlJYAMlILaFzLNo3+NAZDgk1m2s324S52P1sqmJz
 d+5lgix1lNyvGucOGLvRU/k7kd1cDAxdb1zicfSCyHtN0CZZvt6Rg6NA2
 gt9WU+CPHZloeKzzBIM11okelTAETx5lc2KwaGrVfB940O+8suAdZNeKm
 n/1/Mj2STdMjULJ/QBhpw17EM6W5OhHZA30hnDGUC0jdLxWxoRLt226xQ
 eEsgYQV7t329ycQV2m1/O99eSVIyRywfLxtajb4+zu9HKVU25GE8rCAwe
 QQpThRpAnaPik0pCOQx1RpXzLDNDEkoaFH8qno/naUbfVmMO75h6mqJVf A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="353843954"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; 
 d="scan'208,217";a="353843954"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 23:00:02 -0700
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; 
 d="scan'208,217";a="663851184"
Received: from mlbuechl-mobl2.amr.corp.intel.com (HELO [10.209.84.200])
 ([10.209.84.200])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 23:00:02 -0700
Content-Type: multipart/alternative;
 boundary="------------tplbrYbCF0raRT8CEsRtVaR4"
Message-ID: <cfed9171-10fa-d8a7-e1e5-74cef23bc299@linux.intel.com>
Date: Mon, 2 May 2022 23:00:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>
References: <16ba58d6-d06b-1c92-340b-e94119a47708@linux.intel.com>
 <YnBcJ6GPKIBpqYWN@heinlein.stwcx.org.github.beta.tailscale.net>
From: Nirav Shah <nirav.j2.shah@linux.intel.com>
Organization: Intel
Subject: Re: Running OpenBMC Daemons/Applications as non root using D-Bus
 Session/User Bus.
In-Reply-To: <YnBcJ6GPKIBpqYWN@heinlein.stwcx.org.github.beta.tailscale.net>
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
Reply-To: nirav.j2.shah@linux.intel.com
Cc: openbmc@lists.ozlabs.org, nirav.j2.shah@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------tplbrYbCF0raRT8CEsRtVaR4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

<<<< Moving everything from the system to session /bus/ doesn't really 
improve either of these aspects.

I agree i am not proposing a complete transition to session bus. The 
proposal is to move the interactions to and from as you defined it 
"external facing application" and anything that does _*NOT*_ really need 
root access to the session bus by running them as non-root. Applications 
that "may" need root access (may be because the hardware interface 
requires root privilege) will continue to use the system bus for 
communicating with other root application and session bus for 
communication with non root applications.

<<<< if the only goal is to run bmcweb as non-root, this could probably 
be achieved without any change at a DBus level. Use the systemd magic to 
run the bmcweb service as a non-root user and add an ACL so that user 
can access everything on system DBus. This at least limits the bmcweb 
process from accessing kernel APIs and limit the surface area to just 
the available DBus interfaces. We can then figure out how to further 
limit the DBus APIs after that.

I agree that BMCWeb can run as non root today and still be on the system 
bus. Also agree, this is better than running BMCWeb as root. However, 
"We can then figure out how to further limit the DBus APIs after that" 
is what I want to address. How does having a session bus help solve 
this? This for me is complicated to put down in an email. If my 
explanation below sounds too high level, I would agree with that too.

Essentially today we have 2 possible ways in OpenBMC to implement ACL on 
D-BUS.

1. Using D-Bus configuration file, by default full access is enabled 
(e.g. if a root application crashes a non root application can take over 
the interface while the root application is being restarted). To block 
all possible accesses that could be exploited exception rules need to be 
program. This is what is called discretionary access control. This might 
be fine if we have an exhaustive list of all the possible exploits but 
we rarely do.

2. Using SELinux, apparmor or some sort of a mandatory access control 
system, where unless specifically configured, by default access is 
blocked to everything. In my experience, biggest problem here is a 
separate debug build with special privileges is almost always required. 
This becomes a challenge with on field debug and also when there are 
timing issues. Also, corner conditions where the unit test was not done 
could easily lead to "access denied" failures.

Using a session bus allows for flexible combination of these 2 
approaches with ...

1. By default, blocking "all" non root access to system bus unless 
specifically configured for an interface/method/signal. (MAC approach)

2. By default, allow "all" non root access to the session bus unless 
specifically blocked (DAC approach).

This is the approach I have seen in most of the Linux Distros for 
desktop. I understand OpenBMC does not have the same use cases as 
desktop but in this case it could be lot similar. Does this change your 
mind?

<<<< sdbusplus already has functions to request the system-bus or the 
session-bus (just like sdbus itself does). Some applications 
arecurrently written explicitly requesting the system-bus and some are 
written requesting the 'default' bus, which is system for root and 
session for non-root. I was mentioning elsewhere recently that this 
inconsistency is a poor situation for unit-testing as it is.

Thank you for this information.

<<<< Code contributions go through Gerrit.

Understood, thank you!

Thanks,

Nirav.



On 5/2/2022 3:33 PM, Patrick Williams wrote:
> On Mon, May 02, 2022 at 02:55:39PM -0700, Nirav Shah wrote:
>> Hello,
>>
>> I am new to OpenBMC (and BMC ), so apologies if I am posting this in the
>> wrong place. I have been looking at this
>> <https://github.com/openbmc/openbmc/issues/3383>  issue.Here is my
>> summary of the problem statement, please do comment and let me know if I
>> got this right.
>>
>>   1. The biggest challenge is the use of system bus and non root access
>>      to the system bus.
>>   2. As previously suggested an ACL based approach can work. (whether it
>>      is using a D-Bus ACL configuration file or SELinux)
>>   3. However, it does require an exact configuration to cover all
>>      security scenarios (for MAC) and IMO “may” make debugging efforts
>>      harder.
> I don't really think the issue is session bus vs system bus.  There
> isn't really a significant difference between the two.  Just moving
> everything to a session bus doesn't solve any security concerns.
>
>> Coming from a desktop background (which additionally uses D-BUS
>> session/user bus for user isolation), I was investigating if having a
>> session bus would help. For OpenBMC, the idea would be to allow non root
>> application to communicate with each other and with root** applications
>> on a single session bus to begin with. This can be further augmented
>> using ACL based approaches if needed. I have a small POC, which tests
>> this on OpenBMC with D-Bus broker
> What does moving everything to a session bus improve from a security
> perspective?  I can't think of much.
>
> I think the primary concern is that external-facing applications, like
> IPMI and Redfish:
>
>      1. Are the biggest attack vector for being compromised.
>      2. Once compromised could do anything they wanted on the system,
>         including on the DBus.
>
> Moving everything from the system to session doesn't really improve
> either of these aspects.
>
>  From an ACL perspective there is similarly a large surface area of dbus
> interfaces that these (especially Redfish) need in order to do their
> primary job.  The ACLs likely need to be written at an method/property
> level within the DBus interfaces and this is, frankly, a lot of work.  I
> suspect the 'best' answer is to put decorators into the
> phosphor-dbus-interface YAML to be able to generate the appropriate
> ACL configs.
>
>
>> I am happy to start with a design document on git hub and also make some
>> code changes, but I had a few questions.
> Code contributions go through Gerrit.
>
>>   1. Your views on, if this a workable idea?
> If you try to move all openbmc applications to the session bus, most of
> them will work just fine.  A few of them will need secondary access to
> the system bus because they operate on upstream components
> (org.freedesktop interfaces) that only live on the system bus.  Anything
> that initiates systemd service operations would certainly be affected.
>
>>   2. I am hoping I can isolate all the changes to sdbusplus, sdbus,
>>      phosphor-dbus and object mapper. What else might need to change?
> sdbusplus already has functions to request the system-bus or the
> session-bus (just like sdbus itself does).  Some applications are
> currently written explicitly requesting the system-bus and some are
> written requesting the 'default' bus, which is system for root and
> session for non-root.  I was mentioning elsewhere recently that this
> inconsistency is a poor situation for unit-testing as it is.
>
>>   3. If I can make all these changes, I was thinking of starting with
>>      BMCWeb as non root but since BMCWeb interfaces with a lot of daemons
>>      that would be a big step. Any better ideas?
> If the only goal is to run bmcweb as non-root, this could probably be
> achieved without any change at a DBus level.  Use the systemd magic to
> run the bmcweb service as a non-root user and add an ACL so that user can
> access everything on system DBus.  This at least limits the bmcweb
> process from accessing kernel APIs and limit the surface area to just
> the available DBus interfaces.  We can then figure out how to further
> limit the DBus APIs after that.
>
-- 
Nirav Shah
--------------tplbrYbCF0raRT8CEsRtVaR4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello, <br>
    </p>
    <p>&lt;&lt;&lt;&lt; Moving everything from the system to session <i>bus</i>
      doesn't really improve either of these aspects.</p>
    <p>I agree i am not proposing a complete transition to session bus.
      The proposal is to move the interactions to and from as you
      defined it "external facing application" and anything that does <u><b>NOT</b></u>
      really need root access to the session bus by running them as
      non-root. Applications that "may" need root access (may be because
      the hardware interface requires root privilege) will continue to
      use the system bus for communicating with other root application
      and session bus for communication with non root applications.<br>
    </p>
    <p>&lt;&lt;&lt;&lt; if the only goal is to run bmcweb as non-root,
      this could probably be achieved without any change at a DBus
      level. Use the systemd magic to run the bmcweb service as a
      non-root user and add an ACL so that user can access everything on
      system DBus. This at least limits the bmcweb process from
      accessing kernel APIs and limit the surface area to just the
      available DBus interfaces. We can then figure out how to further
      limit the DBus APIs after that.</p>
    <p>I agree that BMCWeb can run as non root today and still be on the
      system bus. Also agree, this is better than running BMCWeb as
      root. However, "We can then figure out how to further limit the
      DBus APIs after that" is what I want to address. How does having a
      session bus help solve this? This for me is complicated to put
      down in an email. If my explanation below sounds too high level, I
      would agree with that too. <br>
    </p>
    <p>Essentially today we have 2 possible ways in OpenBMC to implement
      ACL on D-BUS.<br>
    </p>
    <p>1. Using D-Bus configuration file, by default full access is
      enabled (e.g. if a root application crashes a non root application
      can take over the interface while the root application is being
      restarted). To block all possible accesses that could be exploited
      exception rules need to be program. This is what is called
      discretionary access control. This might be fine if we have an
      exhaustive list of all the possible exploits but we rarely do. <br>
    </p>
    <p>2. Using SELinux, apparmor or some sort of a mandatory access
      control system, where unless specifically configured, by default
      access is blocked to everything. In my experience, biggest problem
      here is a separate debug build with special privileges is almost
      always required. This becomes a challenge with on field debug and
      also when there are timing issues. Also, corner conditions where
      the unit test was not done could easily lead to "access denied"
      failures.</p>
    <p>Using a session bus allows for flexible combination of these 2
      approaches with ...<br>
    </p>
    <p>1. By default, blocking "all" non root access to system bus
      unless specifically configured for an interface/method/signal.
      (MAC approach)<br>
    </p>
    <p>2. By default, allow "all" non root access to the session bus
      unless specifically blocked (DAC approach).</p>
    <p>This is the approach I have seen in most of the Linux Distros for
      desktop. I understand OpenBMC does not have the same use cases as
      desktop but in this case it could be lot similar. Does this change
      your mind?</p>
    <p>&lt;&lt;&lt;&lt; sdbusplus already has functions to request the
      system-bus or the session-bus (just like sdbus itself does). Some
      applications arecurrently written explicitly requesting the
      system-bus and some are written requesting the 'default' bus,
      which is system for root and session for non-root. I was
      mentioning elsewhere recently that this inconsistency is a poor
      situation for unit-testing as it is.</p>
    <p>Thank you for this information. <br>
    </p>
    <p>&lt;&lt;&lt;&lt; Code contributions go through Gerrit.</p>
    <p>Understood, thank you!<br>
    </p>
    <p>Thanks,</p>
    <p>Nirav.<br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/2/2022 3:33 PM, Patrick Williams
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:YnBcJ6GPKIBpqYWN@heinlein.stwcx.org.github.beta.tailscale.net">
      <pre class="moz-quote-pre" wrap="">On Mon, May 02, 2022 at 02:55:39PM -0700, Nirav Shah wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hello,

I am new to OpenBMC (and BMC ), so apologies if I am posting this in the 
wrong place. I have been looking at this 
<a class="moz-txt-link-rfc2396E" href="https://github.com/openbmc/openbmc/issues/3383">&lt;https://github.com/openbmc/openbmc/issues/3383&gt;</a> issue.Here is my 
summary of the problem statement, please do comment and let me know if I 
got this right.

 1. The biggest challenge is the use of system bus and non root access
    to the system bus.
 2. As previously suggested an ACL based approach can work. (whether it
    is using a D-Bus ACL configuration file or SELinux)
 3. However, it does require an exact configuration to cover all
    security scenarios (for MAC) and IMO “may” make debugging efforts
    harder.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I don't really think the issue is session bus vs system bus.  There
isn't really a significant difference between the two.  Just moving
everything to a session bus doesn't solve any security concerns.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Coming from a desktop background (which additionally uses D-BUS 
session/user bus for user isolation), I was investigating if having a 
session bus would help. For OpenBMC, the idea would be to allow non root 
application to communicate with each other and with root** applications 
on a single session bus to begin with. This can be further augmented 
using ACL based approaches if needed. I have a small POC, which tests 
this on OpenBMC with D-Bus broker
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
What does moving everything to a session bus improve from a security
perspective?  I can't think of much.

I think the primary concern is that external-facing applications, like
IPMI and Redfish:

    1. Are the biggest attack vector for being compromised.
    2. Once compromised could do anything they wanted on the system,
       including on the DBus.

Moving everything from the system to session doesn't really improve
either of these aspects.

From an ACL perspective there is similarly a large surface area of dbus
interfaces that these (especially Redfish) need in order to do their
primary job.  The ACLs likely need to be written at an method/property
level within the DBus interfaces and this is, frankly, a lot of work.  I
suspect the 'best' answer is to put decorators into the
phosphor-dbus-interface YAML to be able to generate the appropriate
ACL configs.


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I am happy to start with a design document on git hub and also make some 
code changes, but I had a few questions.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Code contributions go through Gerrit.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> 1. Your views on, if this a workable idea?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
If you try to move all openbmc applications to the session bus, most of
them will work just fine.  A few of them will need secondary access to
the system bus because they operate on upstream components
(org.freedesktop interfaces) that only live on the system bus.  Anything
that initiates systemd service operations would certainly be affected.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> 2. I am hoping I can isolate all the changes to sdbusplus, sdbus,
    phosphor-dbus and object mapper. What else might need to change?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
sdbusplus already has functions to request the system-bus or the
session-bus (just like sdbus itself does).  Some applications are
currently written explicitly requesting the system-bus and some are
written requesting the 'default' bus, which is system for root and
session for non-root.  I was mentioning elsewhere recently that this
inconsistency is a poor situation for unit-testing as it is.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> 3. If I can make all these changes, I was thinking of starting with
    BMCWeb as non root but since BMCWeb interfaces with a lot of daemons
    that would be a big step. Any better ideas?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
If the only goal is to run bmcweb as non-root, this could probably be
achieved without any change at a DBus level.  Use the systemd magic to
run the bmcweb service as a non-root user and add an ACL so that user can
access everything on system DBus.  This at least limits the bmcweb
process from accessing kernel APIs and limit the surface area to just
the available DBus interfaces.  We can then figure out how to further
limit the DBus APIs after that.

</pre>
    </blockquote>
    <div class="moz-signature">-- <br>
      Nirav Shah</div>
  </body>
</html>

--------------tplbrYbCF0raRT8CEsRtVaR4--
