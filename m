Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 268F07CF5A9
	for <lists+openbmc@lfdr.de>; Thu, 19 Oct 2023 12:49:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W7LCm8Rh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SB4GF0MQJz3cQ4
	for <lists+openbmc@lfdr.de>; Thu, 19 Oct 2023 21:49:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W7LCm8Rh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c34; helo=mail-oo1-xc34.google.com; envelope-from=sunithaharish04@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SB4Fh2P3kz2xLW
	for <openbmc@lists.ozlabs.org>; Thu, 19 Oct 2023 21:48:39 +1100 (AEDT)
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-57e40f0189aso4147988eaf.1
        for <openbmc@lists.ozlabs.org>; Thu, 19 Oct 2023 03:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697712517; x=1698317317; darn=lists.ozlabs.org;
        h=in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNvLgxveQCKtqhEn91pNYjWUBn5698uJ3HfNlCmDGFc=;
        b=W7LCm8RhXf1jn1EAZ1Inl9FqZy1mH0VCIGJmU2diRz+763QB7j4XAy/f63+OvlUMrZ
         Y4CIMVcVqgxPFLUa/8eDRYySjkYCikIKs+hheTZdPxExPOATkOfNyN7i9eRzoemSdW3l
         uPVeKlABG84QHIJBOda4ydH4a/bk9sk86XpiiZiqeWxtEvKwMRputCJ6fCinDJpHQYv9
         NGkFYXIK+gNKCDR0IsaqqcRwux1yOt3/UF1hCJH7km2U1LPbMH5A6mHRh4E1V99+tcOG
         KSi+e/ounw3wxi9Gd+XiYJfvCl8UTrcbfjzgBqmdHr+NDGKtwimtMvtAplSVCHN1iqqz
         iqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697712517; x=1698317317;
        h=in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JNvLgxveQCKtqhEn91pNYjWUBn5698uJ3HfNlCmDGFc=;
        b=dHROc2xibfkVkB2iwoVmPGTU+tpHz8isvjsBCx/ZWTFOmxajXF82owIZSYYd3coc4j
         x5R5XmEOdpraq++CR0bJdUACOKxsjUY2vptNvZuR7Fw4RXYV640tQ9fi+d+3fvDnQ5GY
         8dsg6sugaGKO3S8rp88p+aGErLdOgwgZ/01PKeIoU2iyTgIJsq/rObcvAg+CNrPGFa4i
         vc/AMpjibFzqV45zEKyegGINHEal3CwYTX6qgShNJI2ucf6gbPqCqeTzXgCWP7naBUL4
         6WMgA9Y7CTfkDUghWVnuNCOqn8lo/+gwfnRpqpMYp6zOd9f2gsD95CULm/nm+5p58oj3
         f2Fg==
X-Gm-Message-State: AOJu0YxQyi1nvIPap+8e75kzjp29roPNGrD4k9evfAdxycB8KbSGxVL/
	PUBKEawKYqfawPWr8ZXYoWk=
X-Google-Smtp-Source: AGHT+IGk/lCGsb7k6wYgmIkLrnElwoC1rN31VCDuljgLLg3pQGXFmzQvy8oc87t5Q9NLuyJKHy/nyQ==
X-Received: by 2002:a05:6358:ed7:b0:141:162:b0cd with SMTP id 23-20020a0563580ed700b001410162b0cdmr1496646rwh.19.1697712516744;
        Thu, 19 Oct 2023 03:48:36 -0700 (PDT)
Received: from [192.168.0.108] ([106.51.173.182])
        by smtp.gmail.com with ESMTPSA id y7-20020aa78f27000000b006babcf86b84sm4846321pfr.34.2023.10.19.03.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 03:48:36 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------bWWxuzBGWDPZwO00ZGjTcwUe"
Message-ID: <95fbdd64-9177-4d5b-a847-e6367522cdd8@gmail.com>
Date: Thu, 19 Oct 2023 16:18:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: D-bus model proposal for pay for access features - LicenseService
 at OpenBMC
Content-Language: en-US
From: Sunitha Harish <sunithaharish04@gmail.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <20210504233843.hvuvmebaznanqnlv@thinkpad.fuzziesquirrel.com>
 <YJLXlNyk/c8IVf9e@heinlein> <0af0324d-c8a1-4ce8-80c3-f8f846cc930f@gmail.com>
 <ZR_9p11_v5wQAOKB@heinlein.vulture-banana.ts.net>
 <ub2mniaycgyvj6ujfwytknyvhrscnjgoewxjtvpgq37znlxszf@yzvbxgnre4iy>
 <2736a0cbaf79f00617a8e55a962eea505ac7a7ab.camel@codeconstruct.com.au>
 <dr2sdq6xt52ieidkgdit56uew5bgo2tedlk5e4uee3tobcez3x@t3mhaemftllv>
 <0a4277122b61695d802c25d089533d1bdefe64a8.camel@codeconstruct.com.au>
 <nsa67efkmr5y7v66ox4zcmrqz6h6jewbw47qarad4t32ubnaoh@ayzfcex6kpre>
 <762c3491-93df-4ac4-9a44-a3fb1b448936@gmail.com>
 <7xefpmuelqu2nv6iwkpaqqgeomdp7ru4uywejmqudeao7f5rbl@hqnhwttquefv>
 <3fbaa94e-391d-4d3a-95fb-259503e94dd3@gmail.com>
In-Reply-To: <3fbaa94e-391d-4d3a-95fb-259503e94dd3@gmail.com>
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
Cc: raviteja28031990@gmail.com, Ratan Gupta <ratankgupta31@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>, gmills@linux.vnet.ibm.com, abhilash.kollam@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------bWWxuzBGWDPZwO00ZGjTcwUe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 19-10-2023 15:56, Sunitha Harish wrote:
>
> On 18-10-2023 18:48, Brad Bishop wrote:
>> On Wed, Oct 18, 2023 at 12:51:47PM +0530, Sunitha Harish wrote:
>>>
>>> On 13-10-2023 21:33, Brad Bishop wrote:
>>>> On Fri, Oct 13, 2023 at 05:04:23PM +1030, Andrew Jeffery wrote:
>>>>> However, there is an escape hatch for project social issues. For
>>>>> example interested parties might choose to collaborate on the license
>>>>> manager implementation outside of the OpenBMC org, and package it
>>>>> through Yocto or OpenEmbedded.
>>>>
>>>> I've been thinking along similar lines lately and I like this 
>>>> idea.  For a license server and even in general I think less 
>>>> centralized control and less tightly coupled software would be a 
>>>> good direction to take.
>>> I am not very clear about this. The control and processing of the 
>>> license will not be in BMC scope. The host should manage it.
>>
>> The suggestion here is to:
>>
>> 1 - write your license server application
>> 2 - throw it up on Github somewhere other than openbmc
>> 3 - submit a recipe to meta-oe
>>
> Thank you for clarifying.
>> It's possible the meta-oe maintainers could reject your recipe for 
>> the same reasons as you've been rejected here (or any other variety 
>> of reasons).  In that case you could just make a meta layer with a 
>> single recipe and throw that up on github too.
>>
>> The downside to this approach is you shouldn't use projects like 
>> phosphor-logging, sdbusplus, or phosphor-dbus-interfaces or any other 
>> recipes that are provided by OpenBMC or in meta-phosphor. Certainly 
>> not if you want to get a recipe into meta-oe. 
>
> I think this would defeat the purpose of this proposal. We want to use 
> the BMC as a pass through entity for the licenses. It should be 
> handling the redfish commands (bmcweb) on LicenseService schema - 
> which is tightly coupled with the dbus. And the communication to the 
> host at our server is via PLDM/MCTP. So we can not exclude the openbmc 
> components. More over this new meta-oe work will turn out to be costly.
>
> @Ed/@Gunnar, are you interested in supporting the LicenseService 
> schema at bmcweb?
>
I see an old bmcweb commit - abandoned here Adding Support for License 
Service (I5c3625a9) · Gerrit Code Review (openbmc.org) 
<https://gerrit.openbmc.org/c/openbmc/bmcweb/+/54037> after some initial 
reviews from Ed. Seems like Intel/AMI had some features consuming the 
LicenseService?
>> IMO this isn't necessarily a bad thing, though.  This is what I meant 
>> by tightly coupled software - if you take this approach and avoid 
>> OpenBMC specific frameworks...who knows - if you make a an really 
>> awesome, useful piece of software - you might even get collaborators 
>> from outside OpenBMC.
>
> If the app which is planned now is processing/validating the licenses, 
> then it would turn out to be an awesome piece of software. But that is 
> not the intention. Lately, as per Andrew J and Manoj's review comments 
> - the design is taking a direction where the objects will be hosted at 
> PLDM itself and there is no need of a new application called 
> LicenseManager.
>
>
--------------bWWxuzBGWDPZwO00ZGjTcwUe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 19-10-2023 15:56, Sunitha Harish
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:3fbaa94e-391d-4d3a-95fb-259503e94dd3@gmail.com">
      <br>
      On 18-10-2023 18:48, Brad Bishop wrote:
      <br>
      <blockquote type="cite">On Wed, Oct 18, 2023 at 12:51:47PM +0530,
        Sunitha Harish wrote:
        <br>
        <blockquote type="cite">
          <br>
          On 13-10-2023 21:33, Brad Bishop wrote:
          <br>
          <blockquote type="cite">On Fri, Oct 13, 2023 at 05:04:23PM
            +1030, Andrew Jeffery wrote:
            <br>
            <blockquote type="cite">However, there is an escape hatch
              for project social issues. For
              <br>
              example interested parties might choose to collaborate on
              the license
              <br>
              manager implementation outside of the OpenBMC org, and
              package it
              <br>
              through Yocto or OpenEmbedded.
              <br>
            </blockquote>
            <br>
            I've been thinking along similar lines lately and I like
            this idea.  For a license server and even in general I think
            less centralized control and less tightly coupled software
            would be a good direction to take.
            <br>
          </blockquote>
          I am not very clear about this. The control and processing of
          the license will not be in BMC scope. The host should manage
          it.
          <br>
        </blockquote>
        <br>
        The suggestion here is to:
        <br>
        <br>
        1 - write your license server application
        <br>
        2 - throw it up on Github somewhere other than openbmc
        <br>
        3 - submit a recipe to meta-oe
        <br>
        <br>
      </blockquote>
      Thank you for clarifying.
      <br>
      <blockquote type="cite">It's possible the meta-oe maintainers
        could reject your recipe for the same reasons as you've been
        rejected here (or any other variety of reasons).  In that case
        you could just make a meta layer with a single recipe and throw
        that up on github too.
        <br>
        <br>
        The downside to this approach is you shouldn't use projects like
        phosphor-logging, sdbusplus, or phosphor-dbus-interfaces or any
        other recipes that are provided by OpenBMC or in meta-phosphor.
        Certainly not if you want to get a recipe into meta-oe. </blockquote>
      <br>
      I think this would defeat the purpose of this proposal. We want to
      use the BMC as a pass through entity for the licenses. It should
      be handling the redfish commands (bmcweb) on LicenseService schema
      - which is tightly coupled with the dbus. And the communication to
      the host at our server is via PLDM/MCTP. So we can not exclude the
      openbmc components. More over this new meta-oe work will turn out
      to be costly.
      <br>
      <br>
      @Ed/@Gunnar, are you interested in supporting the LicenseService
      schema at bmcweb?
      <br>
      <br>
    </blockquote>
    I see an old bmcweb commit - abandoned here <a
      href="https://gerrit.openbmc.org/c/openbmc/bmcweb/+/54037">Adding
      Support for License Service (I5c3625a9) · Gerrit Code Review
      (openbmc.org)</a> after some initial reviews from Ed. Seems like
    Intel/AMI had some features consuming the LicenseService?<br>
    <blockquote type="cite"
      cite="mid:3fbaa94e-391d-4d3a-95fb-259503e94dd3@gmail.com">
      <blockquote type="cite">IMO this isn't necessarily a bad thing,
        though.  This is what I meant by tightly coupled software - if
        you take this approach and avoid OpenBMC specific
        frameworks...who knows - if you make a an really awesome, useful
        piece of software - you might even get collaborators from
        outside OpenBMC.
        <br>
      </blockquote>
      <br>
      If the app which is planned now is processing/validating the
      licenses, then it would turn out to be an awesome piece of
      software. But that is not the intention. Lately, as per Andrew J
      and Manoj's review comments - the design is taking a direction
      where the objects will be hosted at PLDM itself and there is no
      need of a new application called LicenseManager.
      <br>
      <br>
      <br>
    </blockquote>
  </body>
</html>

--------------bWWxuzBGWDPZwO00ZGjTcwUe--
