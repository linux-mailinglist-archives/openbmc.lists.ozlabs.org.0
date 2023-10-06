Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EFD7BB0F1
	for <lists+openbmc@lfdr.de>; Fri,  6 Oct 2023 06:51:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xdt/xcsV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1wxt3JdFz3cmk
	for <lists+openbmc@lfdr.de>; Fri,  6 Oct 2023 15:51:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xdt/xcsV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::233; helo=mail-oi1-x233.google.com; envelope-from=sunithaharish04@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1wxF412Qz3c53
	for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2023 15:51:11 +1100 (AEDT)
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3add37de892so1077736b6e.1
        for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2023 21:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696567869; x=1697172669; darn=lists.ozlabs.org;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3hFrBur7/qSeuucQhcaPa9df3bcoKj/0DABjnUThnw=;
        b=Xdt/xcsVAEweqYGDdQJ70fb9lhnBwQFIPp6s4H61gE+Iu5ButcQIlpBfCzUZBWDYr6
         VoP2ebmMpVeIrFk1ckDX6F3vdFxv7XDqtcekGcVUvmCkScuqCGSXWU9BYhjv6BVhnE4C
         H8N3EJPw91ji/bKUyRD6OQglAKmpAGsRmoKAxhQONGqQiMkQcdleWq6kmAL2HgqF++oa
         JvQ1Fe2dnd30CgmvODMndZZwvRc+8Q+7ODrOnbv9Op99MawRfoY4Fchez26FNIcQOrOZ
         pfiNQGwYUnUSTlmM0Gvfxn1SHhgudZR8w4P/2UKWEIjG6SwkYOZrB+5zoEACr7EOT4Oa
         rWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696567869; x=1697172669;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n3hFrBur7/qSeuucQhcaPa9df3bcoKj/0DABjnUThnw=;
        b=VQFMwInmy53dt7UpiuskcKIWgm2nl3rQW817fCnKjo2NC4JU7sDGEQLfv2cKQC37oe
         x/t0Jv4kqhF5jD8ySlusfmJ4XuGG/kCiqSEoEQVJg1UXjVitITXkyPWVhcuDOno2iKqE
         xXvzGs8KyaP0R23jsnvGvyEmyAS0XCBe9x8Dyp7n6D2tU+SVky5P2/7cqNUeN4OBKHH3
         eFIaV8y/Qp+HUS71MlDxs1SVa8U45+ENI4NnOLjhiN/MLog0pJt4BHc5xG6gYDXC4AVR
         hG1oZoU1RI1vBRRFcqB0qBHhclfF9jCxdn4EJVBn6mNVsZuE70jkNKn5sLTwSlZjk+tj
         B3WQ==
X-Gm-Message-State: AOJu0YyX5RBDGkZPbVJFYznOE8VWOFbloMU7siiuhpk8eaqtTdisZJu5
	wsbolfaDa/IOyetsWtEdbxI=
X-Google-Smtp-Source: AGHT+IFiGlBOjViRcj3f49vGV1/SoBMfHyjJNJ966iiW3ZIrqfdq4Wzcum2xPh2GoRAHw9WTrILluw==
X-Received: by 2002:a05:6808:16a4:b0:3a4:8140:97e8 with SMTP id bb36-20020a05680816a400b003a4814097e8mr8893359oib.14.1696567868587;
        Thu, 05 Oct 2023 21:51:08 -0700 (PDT)
Received: from ?IPV6:2620:1f7:3d44:7c4b::32:3cc? ([2620:1f7:3d44:7c4b::32:3cc])
        by smtp.gmail.com with ESMTPSA id a9-20020a63bd09000000b005891f3af36asm2347072pgf.87.2023.10.05.21.51.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 21:51:08 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------RxlJmJ9R29eS2MKyN0zqNHnc"
Message-ID: <0af0324d-c8a1-4ce8-80c3-f8f846cc930f@gmail.com>
Date: Fri, 6 Oct 2023 10:21:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: D-bus model proposal for pay for access features - LicenseService
 at OpenBMC
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, abhilash.kollam@gmail.com,
 raviteja28031990@gmail.com
References: <CAMhqiMoFAHcUk0nO_xoOubcZqF_dPDFweqsttTULRJK38o1Ung@mail.gmail.com>
 <CACWQX83=CG_H8YUvEYj4BpDWFPoYkVLdpxo6n9V5LneTeeM7Bw@mail.gmail.com>
 <20210504233843.hvuvmebaznanqnlv@thinkpad.fuzziesquirrel.com>
 <YJLXlNyk/c8IVf9e@heinlein>
From: Sunitha Harish <sunithaharish04@gmail.com>
In-Reply-To: <YJLXlNyk/c8IVf9e@heinlein>
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
Cc: Ratan Gupta <ratankgupta31@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------RxlJmJ9R29eS2MKyN0zqNHnc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Patrick,

Re-starting this discussion with the design that is being worked at 
License Manager: Add license manager design (Ibd6c6f35) · Gerrit Code 
Review (openbmc.org) <https://gerrit.openbmc.org/c/openbmc/docs/+/64710>.

I agree with your concern about using this feature for letting the BMC 
software or resources licensed. We should reduce the scope of this 
design to exclude this from controlling the driver updates on the BMC.

But as we have the DMTF approved redfish schema for the LicenseService, 
we would like to bring this into the OpenBMC. We can use this License 
Manager as a pass through application at BMC. With this application and 
interfaces, user can upload the license for the hardware parts and for 
the installation of any OS on top of the firmware. There will be no 
validation of the License at the BMC scope. All 
validation/interpretation of the License will be at the hypervisor or 
the operating system level.

We are looking for views from you and the community.

Thanks & Regards,
Sunitha

On 05-05-2021 23:06, Patrick Williams wrote:
> Brad,
>
> I've reshuffled some of the quotes around because it makes more sense
> with the points I'd like to make.  I've tried to add color to what I
> think the OCP perspective would be.
>
> Typical disclosure: these are my thoughts, not my employer.  I am not
> a lawyer.  Blah blah blah.
>
> On Tue, May 04, 2021 at 07:38:43PM -0400, Brad Bishop wrote:
>> On Tue, May 04, 2021 at 10:02:19AM -0700, Ed Tanous wrote:
>>> How does this affect our standing in things like OCP open system
>>> firmware groups?
>> I wouldn't expect this to affect our standing in OCP in any way.
>>
>>> Does this OpenBMC systems that enable this feature
>>> ineligible?
>> Do you mean to ask, do systems that configure OpenBMC with something
>> like this enabled make them ineligible for some kind of OCP compliance?
>> Probably, but isn't that a problem for those configuring OpenBMC in that
>> way?  I would say if you are looking for OCP compliance, don't use this
>> feature.
> I'm glad things were broken out this way because both of these questions
> need to be resolved.
>
> I agree that the presence of this feature, or any feature which isn't a
> violation of widely accepted ethical guidelines[1], should not on its
> own affect our standing in or usage by other communities.  But, it can
> certainly affect their opinion of us, which can diminish our standing.
>
> The other question is: would OCP accept the usage of this feature in an
> OCP Accepted / Inspired[2] system?  I strongly suspect the answer here
> is no.  It isn't just this feature, but this feature coupled with the
> code signing, which is what would cause the denial of certification.
>
> OCP machines are expected to be owned by the entity that purchased it
> and not the manufacturer.  To quote from an OCP website[3]:
>
>      Open system firmware is an open development project, the goal of which
>      is to allow OCP owners to "own their firmware" -- to move the point of
>      control of firmware to the system owner. Owners must be able to change
>      firmware and share it -- including any binary components -- with other
>      owners. Starting in March, 2021, OCP badging for servers will require
>      that systems support OSF.
>
> Compliance with this statement would render any firmware-based license
> enforcement moot.  (Note that this above OCP statement is in reference
> to OSF, the UEFI implementation, but I think the intention is reflected
> elsewhere in BMC expectations.)
>
> This is very important to both OCP and Facebook for the obvious reasons
> that it allows us to enhance the server firmware to suit our own
> purposes but also the non-obvious reason that it reduces the
> environmental impact of our business[7].  If ownership of the firmware
> is a one-way door (either us or the OEM/ODM), it means there are more
> components which have to be scrapped when the servers are decommisioned.
> If we can transfer ownership, in a secure manner, those parts are then
> able to be reused and/or repurposed.  ITRenew is one company I am aware
> of facilitates this kind of reuse[8]; they are a platinum member of OCP
> and Sri hangs out on the OpenBMC Discord.
>
>>> Assuming you did this, wouldn't anyone be able to simply
>>> recompile the code with the license checks disabled, load it on the
>>> system
>> In our system design, the BMC is not doing the actual license
>> verification.  It is only a proxy, providing an interface to a user
>> interface application.
>>
>> Further, we don't allow BMC code to be loaded that isn't signed by IBM,
>> so unless I'm really missing something I don't think this can happen
>> even, if the validation was being done on the BMC.
> This feature was originally presented to us as being used to activate
> "unlicensed" hardware or enforce license agreements with your OS.
> While I think that is a lousy business model, that is between you and
> your customers.
>
> But, IBM (and other OEMs[4]) also uses this feature to prevent people
> from applying IBM-signed firmware updates to their own machines,
> unless they have a current maintenance contract.  So when we have a
> CVE in some software package used by OpenBMC not only can a machine
> owner not compile their own fix for their own machine but they can't
> even apply the fix already compiled by IBM unless they cough up
> additional money.  This behavior is why I used the phrase "openly
> hostile to your customers."
>
> IBM calls this entitlement to install firmware updates an "Update
> Access Key"[5].  The referenced website describes how the machine
> will only accept firmware updates if the UAK is not expired, how the
> original UAK aligns with the system warranty, and how you can get
> additional ones after this point (expiring every 180 days) if you
> have an "IBM hardware maintenance service agreement".
>
> This behavior, and not the hardware licensing, is a big motivating
> factor in why I said "I have no interest in providing any assistance on
> this feature" and do not feel the project should support it either.
> You might say "well, we'll just keep this part of the code private
> then", and it would likely be pretty trivial to privately hold a few
> patches to phosphor-bmc-code-mgmt to do the UAK work once you have
> the rest of the framework in place.  The triviality of it is partially
> why I don't even want the framework in place.  This feature provides no
> benefit to anyone except <<insert OEM>>'s [bad] business model and provides
> no benefit to users or this community (and I'll posit later it actually
> harms this community).
>
>>> if we're now supporting firmware locking down systems?
>> Don't we already lock down systems with things like secure or verified
>> boot?  Can you help me understand lock down better?
> Yes, we support secure / verified boot, even on OCP servers.  But the
> OCP model is that the machine owner owns the machine, not the ODM/OEM.
> The other model, which is what you're doing, is only advantageous to
> you (and is deterimental to everyone else).  This isn't a matter of lack
> of technical capability because IBM's own security research team provided
> a whitepaper to OCP on best practices for providing transfering ownership
> of the device firmware to the machine owner[6].
>
>> I'm pretty certain this is something many server OEMs do and will
>> continue to do.  So let me ask you what is better?  A single place for
>> those with the common use case to collaborate, or a bunch of one-offs,
>> likely full of bugs and security problems.
> If I had to make a choice between supporting code that is a net-negative
> to the community or letting you make a buggy implementation of a bad
> feature... letting you make a buggy implementation is a double-win to
> me because if you fail in implementing this it means [various people with
> an ability to reverse-engineer] it can **help** users by giving them a
> way around your terrible firmware update lockout.
>
>>> 2. This is harmful to the intent of OpenBMC and open source firmware
>>> as a whole, and shouldn't be supported in any capacity in the OpenBMC
>>> codebase.
>> If you don't mind I would like to hear more about the intent of OpenBMC,
>> and how any of this harms those intents.
>>> How would open firmware principals be retained
>> Can you elaborate on these principles?  I'm curious.  I may even
>> document the answers :-)
> I've badgered enough on the firmware update side of this, which is
> the primary hinderance to "open firmware principles" I see.
>
> On Discord I said that I didn't think this feature is in the "spirit of
> open source software" and I think Ed's statement here is along those
> lines, but I realize there is a lot of potential perspective encapsulated
> in that one phrase so let me try to unpack it.
>
> Corporate attachment to the Open Source / Free Software movement has
> often been around the collaboration (and thus deduplication of effort)
> side of it, but that is an outcome and not a principle of open source.
> To me the draw has always been about freedom to read, debug and modify
> the source.  It is immensely frustrating to me when I have to use non-free
> software and I find a bug: you have no visibility into what is going
> wrong and you have no possibility of fixing it!  As the GNU/FSF often
> states it: "'free software' is a matter of liberty, not price... you
> should think of 'free' as in 'free speech' and not as in 'free beer'.[9]"
>
> Again I bring up firmware update, but the emergence of GPLv3 (and
> similar licenses) was instigated in response to the the Tivoization
> of consumer devices[10].
>
> [ Side question: are you sure your statement that "only IBM signed
>    firmware can run on our machines" doesn't violate the terms of the
>    GPLv3, which is used by a good number of packages used in OpenBMC? ]
>
> We often have people show up to the project with some 5 year old server
> they bought off eBay asking "how do I get OpenBMC to run on this?"
> Which is a worse answer?:
>      1. Well, we don't currently support it specifically but we support
>         <XYZ> which is based on the same reference design.  With a little
>         bit of reverse engineering, or the schematics from the
>         manufacturer, you could probably create a port.
>
>      2. Yeah, we completely support that machine, but unfortunately the
>         manufacturer locked down the system in a way so that you can
>         compile all the code but the machine won't recognize it.  And if
>         I told you how to bypass that, the manufacturer could sue me for
>         violating the DMCA[11] because the same bug that allows you to
>         bypass their signing is still present on their current systems.
>
> IBM does great work on this project and having upstream machine support
> is good.  But, there is a big part of me that would much rather answer
> #1 than #2 because of the implications from a Software Freedom
> perspective.
>
>>> and something
>>> that, if done wrong, could be very harmful to the goals of the
>>> project.
>> Can you elaborate on the goals of the project that would be harmed?
> I hinted at the DMCA above.  The inclusion of this feature by the project
> pushes DMCA risk onto me, a developer on this project, from IBM.
>
> A long time ago now, I did an internship at IBM and at the time someone
> had figured out how to circumvent exactly this feature on Power3/Power4
> AS/400 servers and was contacting IBM customers to sell them black-market
> activation keys (my cubical happened to share a wall with one of the
> inventors of the hardware used at the time to confirm the activation
> keys so I got to hear plenty of details on this).  The DMCA was new at
> the time and first applied for protecting from DVD copyright, but I have
> no doubt that if this situation happened today IBM would leverage the
> DMCA to stop this rather quickly (and honestly, rightly so).
>
> The problem is that the DMCA has also been leveraged for cases which are
> not a direct theft-of-service[12].  I am not saying that IBM will, and I
> can't expect you to get a committment on that, but you are pushing the
> risk onto me, the other developers here, and the project as a whole.
>
> What am I even talking about, you're probably wondering?  Since IBM is
> using this feature to protect your intellectual property (AIX licenses,
> firmware update lockout, etc.) everything about it falls under the
> purview of the DMCA.  If I find a bug in your open source implementation
> and report it in a public forum, you could issue a DMCA take-down
> request.  If I review a code change and conceive of a way it might be
> used to circumvent your implementation, and I bring it to your
> attention, you could issue a DMCA take-down request.  If someone comes
> to us with a 5 year old server and we figure out how to bypass your
> security lockout so they can flash on the Github version of OpenBMC, you
> could issue a DMCA take-down request.  If I do a presentation on
> debugging with dbus and it turns out someone figures out how to use that
> information to circumvent your licensing feature on the SSH interface,
> you could issue a DMCA take-down request.
>
> These might sound absurd or you might think "IBM would never do that."
> How do I and the other developers here know?  You're asking us to take
> on that risk.  And why should I?  I want to stay as far away from
> anything related to your licensing feature as I possibly can.  It does
> nothing good for your customers, it does nothing good for this project,
> and it puts me, a developer, at potential legal risk.
>
> While you might have a little bit of code that you're sharing, that
> maybe other companies can leverage, you are also giving us baggage
> that reduces our collaboration.  Now, anytime I'm even close to this
> code, I have to think about not only the technical but now legal
> ramifications of what I'm doing.  That means, I'm quite likely going to
> have to just say "do whatever you want and leave me out of it" anytime
> this code comes up in reviews or discussions.
>
> -- References --
>
> 1.https://www.acm.org/code-of-ethics
> 2.https://www.opencompute.org/products#ocp-accepted-inspired-modal
> 3.https://www.opencompute.org/projects/open-system-firmware
> 4.https://www.zdnet.com/article/hp-to-begin-charging-for-firmware-updates-and-service-packs-for-servers/
> 5.https://www.ibm.com/support/pages/management-power8-and-later-update-access-keys#q45
> 6.https://www.opencompute.org/documents/ibm-white-paper-ownership-and-control-of-firmware-in-open-compute-project-devices
> 7.https://www.theguardian.com/technology/2021/apr/16/facebook-says-it-has-reached-net-zero-emissions
> 8.https://www.itrenew.com/resources/the-tco-of-ocp/
> 9.https://www.gnu.org/philosophy/free-sw.en.html
> 10.https://en.wikipedia.org/wiki/Tivoization
> 11.https://en.wikipedia.org/wiki/Digital_Millennium_Copyright_Act
> 12.https://www.eff.org/wp/unintended-consequences-16-years-under-dmca
>
--------------RxlJmJ9R29eS2MKyN0zqNHnc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Patrick,</p>
    <p>Re-starting this discussion with the design that is being worked
      at <a href="https://gerrit.openbmc.org/c/openbmc/docs/+/64710">License
        Manager: Add license manager design (Ibd6c6f35) · Gerrit Code
        Review (openbmc.org)</a>.</p>
    <p>I agree with your concern about using this feature for letting
      the BMC software or resources licensed. We should reduce the scope
      of this design to exclude this from controlling the driver updates
      on the BMC.<br>
    </p>
    <p>But as we have the DMTF approved redfish schema for the
      LicenseService, we would like to bring this into the OpenBMC. We
      can use this License Manager as a pass through application at BMC.
      With this application and interfaces, user can upload the license
      for the hardware parts and for the installation of any OS on top
      of the firmware. There will be no validation of the License at the
      BMC scope. All validation/interpretation of the License will be at
      the hypervisor or the operating system level. <br>
    </p>
    <p>We are looking for views from you and the community.<br>
    </p>
    <p>Thanks &amp; Regards,<br>
      Sunitha<br>
    </p>
    <div class="moz-cite-prefix">On 05-05-2021 23:06, Patrick Williams
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YJLXlNyk%2Fc8IVf9e@heinlein">
      <pre class="moz-quote-pre" wrap="">Brad,

I've reshuffled some of the quotes around because it makes more sense
with the points I'd like to make.  I've tried to add color to what I
think the OCP perspective would be.

Typical disclosure: these are my thoughts, not my employer.  I am not
a lawyer.  Blah blah blah.

On Tue, May 04, 2021 at 07:38:43PM -0400, Brad Bishop wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Tue, May 04, 2021 at 10:02:19AM -0700, Ed Tanous wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">How does this affect our standing in things like OCP open system
firmware groups?  
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">I wouldn't expect this to affect our standing in OCP in any way.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Does this OpenBMC systems that enable this feature
ineligible?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Do you mean to ask, do systems that configure OpenBMC with something 
like this enabled make them ineligible for some kind of OCP compliance?  
Probably, but isn't that a problem for those configuring OpenBMC in that 
way?  I would say if you are looking for OCP compliance, don't use this 
feature.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I'm glad things were broken out this way because both of these questions
need to be resolved.

I agree that the presence of this feature, or any feature which isn't a
violation of widely accepted ethical guidelines[1], should not on its
own affect our standing in or usage by other communities.  But, it can
certainly affect their opinion of us, which can diminish our standing.

The other question is: would OCP accept the usage of this feature in an
OCP Accepted / Inspired[2] system?  I strongly suspect the answer here
is no.  It isn't just this feature, but this feature coupled with the
code signing, which is what would cause the denial of certification.

OCP machines are expected to be owned by the entity that purchased it
and not the manufacturer.  To quote from an OCP website[3]:

    Open system firmware is an open development project, the goal of which
    is to allow OCP owners to "own their firmware" -- to move the point of
    control of firmware to the system owner. Owners must be able to change
    firmware and share it -- including any binary components -- with other
    owners. Starting in March, 2021, OCP badging for servers will require
    that systems support OSF.

Compliance with this statement would render any firmware-based license
enforcement moot.  (Note that this above OCP statement is in reference
to OSF, the UEFI implementation, but I think the intention is reflected
elsewhere in BMC expectations.)

This is very important to both OCP and Facebook for the obvious reasons
that it allows us to enhance the server firmware to suit our own
purposes but also the non-obvious reason that it reduces the
environmental impact of our business[7].  If ownership of the firmware
is a one-way door (either us or the OEM/ODM), it means there are more
components which have to be scrapped when the servers are decommisioned.
If we can transfer ownership, in a secure manner, those parts are then
able to be reused and/or repurposed.  ITRenew is one company I am aware
of facilitates this kind of reuse[8]; they are a platinum member of OCP
and Sri hangs out on the OpenBMC Discord.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Assuming you did this, wouldn't anyone be able to simply
recompile the code with the license checks disabled, load it on the
system
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">In our system design, the BMC is not doing the actual license 
verification.  It is only a proxy, providing an interface to a user 
interface application.

Further, we don't allow BMC code to be loaded that isn't signed by IBM, 
so unless I'm really missing something I don't think this can happen 
even, if the validation was being done on the BMC.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This feature was originally presented to us as being used to activate
"unlicensed" hardware or enforce license agreements with your OS.
While I think that is a lousy business model, that is between you and
your customers.

But, IBM (and other OEMs[4]) also uses this feature to prevent people
from applying IBM-signed firmware updates to their own machines,
unless they have a current maintenance contract.  So when we have a
CVE in some software package used by OpenBMC not only can a machine
owner not compile their own fix for their own machine but they can't
even apply the fix already compiled by IBM unless they cough up
additional money.  This behavior is why I used the phrase "openly
hostile to your customers."

IBM calls this entitlement to install firmware updates an "Update
Access Key"[5].  The referenced website describes how the machine
will only accept firmware updates if the UAK is not expired, how the
original UAK aligns with the system warranty, and how you can get
additional ones after this point (expiring every 180 days) if you
have an "IBM hardware maintenance service agreement".

This behavior, and not the hardware licensing, is a big motivating
factor in why I said "I have no interest in providing any assistance on
this feature" and do not feel the project should support it either.
You might say "well, we'll just keep this part of the code private
then", and it would likely be pretty trivial to privately hold a few
patches to phosphor-bmc-code-mgmt to do the UAK work once you have
the rest of the framework in place.  The triviality of it is partially
why I don't even want the framework in place.  This feature provides no
benefit to anyone except &lt;&lt;insert OEM&gt;&gt;'s [bad] business model and provides
no benefit to users or this community (and I'll posit later it actually
harms this community).

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">if we're now supporting firmware locking down systems?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Don't we already lock down systems with things like secure or verified 
boot?  Can you help me understand lock down better?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yes, we support secure / verified boot, even on OCP servers.  But the
OCP model is that the machine owner owns the machine, not the ODM/OEM.
The other model, which is what you're doing, is only advantageous to
you (and is deterimental to everyone else).  This isn't a matter of lack 
of technical capability because IBM's own security research team provided
a whitepaper to OCP on best practices for providing transfering ownership
of the device firmware to the machine owner[6].

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I'm pretty certain this is something many server OEMs do and will 
continue to do.  So let me ask you what is better?  A single place for 
those with the common use case to collaborate, or a bunch of one-offs, 
likely full of bugs and security problems.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
If I had to make a choice between supporting code that is a net-negative
to the community or letting you make a buggy implementation of a bad
feature... letting you make a buggy implementation is a double-win to
me because if you fail in implementing this it means [various people with
an ability to reverse-engineer] it can **help** users by giving them a
way around your terrible firmware update lockout.  

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">2. This is harmful to the intent of OpenBMC and open source firmware
as a whole, and shouldn't be supported in any capacity in the OpenBMC
codebase.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">If you don't mind I would like to hear more about the intent of OpenBMC,
and how any of this harms those intents.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">How would open firmware principals be retained 
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Can you elaborate on these principles?  I'm curious.  I may even 
document the answers :-)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I've badgered enough on the firmware update side of this, which is
the primary hinderance to "open firmware principles" I see.

On Discord I said that I didn't think this feature is in the "spirit of
open source software" and I think Ed's statement here is along those
lines, but I realize there is a lot of potential perspective encapsulated
in that one phrase so let me try to unpack it.

Corporate attachment to the Open Source / Free Software movement has
often been around the collaboration (and thus deduplication of effort)
side of it, but that is an outcome and not a principle of open source.
To me the draw has always been about freedom to read, debug and modify
the source.  It is immensely frustrating to me when I have to use non-free
software and I find a bug: you have no visibility into what is going
wrong and you have no possibility of fixing it!  As the GNU/FSF often
states it: "'free software' is a matter of liberty, not price... you
should think of 'free' as in 'free speech' and not as in 'free beer'.[9]"

Again I bring up firmware update, but the emergence of GPLv3 (and
similar licenses) was instigated in response to the the Tivoization
of consumer devices[10].

[ Side question: are you sure your statement that "only IBM signed
  firmware can run on our machines" doesn't violate the terms of the
  GPLv3, which is used by a good number of packages used in OpenBMC? ]

We often have people show up to the project with some 5 year old server
they bought off eBay asking "how do I get OpenBMC to run on this?"
Which is a worse answer?:
    1. Well, we don't currently support it specifically but we support
       &lt;XYZ&gt; which is based on the same reference design.  With a little
       bit of reverse engineering, or the schematics from the
       manufacturer, you could probably create a port.

    2. Yeah, we completely support that machine, but unfortunately the
       manufacturer locked down the system in a way so that you can
       compile all the code but the machine won't recognize it.  And if
       I told you how to bypass that, the manufacturer could sue me for
       violating the DMCA[11] because the same bug that allows you to
       bypass their signing is still present on their current systems.

IBM does great work on this project and having upstream machine support
is good.  But, there is a big part of me that would much rather answer
#1 than #2 because of the implications from a Software Freedom
perspective.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">and something
that, if done wrong, could be very harmful to the goals of the
project.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Can you elaborate on the goals of the project that would be harmed?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I hinted at the DMCA above.  The inclusion of this feature by the project
pushes DMCA risk onto me, a developer on this project, from IBM.

A long time ago now, I did an internship at IBM and at the time someone
had figured out how to circumvent exactly this feature on Power3/Power4
AS/400 servers and was contacting IBM customers to sell them black-market
activation keys (my cubical happened to share a wall with one of the
inventors of the hardware used at the time to confirm the activation
keys so I got to hear plenty of details on this).  The DMCA was new at
the time and first applied for protecting from DVD copyright, but I have
no doubt that if this situation happened today IBM would leverage the
DMCA to stop this rather quickly (and honestly, rightly so).

The problem is that the DMCA has also been leveraged for cases which are
not a direct theft-of-service[12].  I am not saying that IBM will, and I
can't expect you to get a committment on that, but you are pushing the
risk onto me, the other developers here, and the project as a whole.

What am I even talking about, you're probably wondering?  Since IBM is
using this feature to protect your intellectual property (AIX licenses,
firmware update lockout, etc.) everything about it falls under the
purview of the DMCA.  If I find a bug in your open source implementation
and report it in a public forum, you could issue a DMCA take-down
request.  If I review a code change and conceive of a way it might be
used to circumvent your implementation, and I bring it to your
attention, you could issue a DMCA take-down request.  If someone comes
to us with a 5 year old server and we figure out how to bypass your
security lockout so they can flash on the Github version of OpenBMC, you
could issue a DMCA take-down request.  If I do a presentation on
debugging with dbus and it turns out someone figures out how to use that
information to circumvent your licensing feature on the SSH interface,
you could issue a DMCA take-down request.

These might sound absurd or you might think "IBM would never do that."
How do I and the other developers here know?  You're asking us to take
on that risk.  And why should I?  I want to stay as far away from
anything related to your licensing feature as I possibly can.  It does
nothing good for your customers, it does nothing good for this project,
and it puts me, a developer, at potential legal risk.

While you might have a little bit of code that you're sharing, that
maybe other companies can leverage, you are also giving us baggage
that reduces our collaboration.  Now, anytime I'm even close to this
code, I have to think about not only the technical but now legal
ramifications of what I'm doing.  That means, I'm quite likely going to
have to just say "do whatever you want and leave me out of it" anytime
this code comes up in reviews or discussions.

-- References --

1. <a class="moz-txt-link-freetext" href="https://www.acm.org/code-of-ethics">https://www.acm.org/code-of-ethics</a>
2. <a class="moz-txt-link-freetext" href="https://www.opencompute.org/products#ocp-accepted-inspired-modal">https://www.opencompute.org/products#ocp-accepted-inspired-modal</a>
3. <a class="moz-txt-link-freetext" href="https://www.opencompute.org/projects/open-system-firmware">https://www.opencompute.org/projects/open-system-firmware</a>
4. <a class="moz-txt-link-freetext" href="https://www.zdnet.com/article/hp-to-begin-charging-for-firmware-updates-and-service-packs-for-servers/">https://www.zdnet.com/article/hp-to-begin-charging-for-firmware-updates-and-service-packs-for-servers/</a>
5. <a class="moz-txt-link-freetext" href="https://www.ibm.com/support/pages/management-power8-and-later-update-access-keys#q45">https://www.ibm.com/support/pages/management-power8-and-later-update-access-keys#q45</a>
6. <a class="moz-txt-link-freetext" href="https://www.opencompute.org/documents/ibm-white-paper-ownership-and-control-of-firmware-in-open-compute-project-devices">https://www.opencompute.org/documents/ibm-white-paper-ownership-and-control-of-firmware-in-open-compute-project-devices</a>
7. <a class="moz-txt-link-freetext" href="https://www.theguardian.com/technology/2021/apr/16/facebook-says-it-has-reached-net-zero-emissions">https://www.theguardian.com/technology/2021/apr/16/facebook-says-it-has-reached-net-zero-emissions</a>
8. <a class="moz-txt-link-freetext" href="https://www.itrenew.com/resources/the-tco-of-ocp/">https://www.itrenew.com/resources/the-tco-of-ocp/</a>
9. <a class="moz-txt-link-freetext" href="https://www.gnu.org/philosophy/free-sw.en.html">https://www.gnu.org/philosophy/free-sw.en.html</a>
10. <a class="moz-txt-link-freetext" href="https://en.wikipedia.org/wiki/Tivoization">https://en.wikipedia.org/wiki/Tivoization</a>
11. <a class="moz-txt-link-freetext" href="https://en.wikipedia.org/wiki/Digital_Millennium_Copyright_Act">https://en.wikipedia.org/wiki/Digital_Millennium_Copyright_Act</a>
12. <a class="moz-txt-link-freetext" href="https://www.eff.org/wp/unintended-consequences-16-years-under-dmca">https://www.eff.org/wp/unintended-consequences-16-years-under-dmca</a>

</pre>
    </blockquote>
  </body>
</html>

--------------RxlJmJ9R29eS2MKyN0zqNHnc--
