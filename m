Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 387A67C7D68
	for <lists+openbmc@lfdr.de>; Fri, 13 Oct 2023 08:03:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l5vgwWL6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6GCR0Wzrz3cbx
	for <lists+openbmc@lfdr.de>; Fri, 13 Oct 2023 17:03:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l5vgwWL6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=sunithaharish04@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6GBs3Tmzz3bV2
	for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2023 17:02:59 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-690bccb0d8aso1465576b3a.0
        for <openbmc@lists.ozlabs.org>; Thu, 12 Oct 2023 23:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697176977; x=1697781777; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Vu2sdYqkW0+CSrOuTLX5k/4SI34C0qvMMCdxtwer/8=;
        b=l5vgwWL6DKEisx4dkVLcS86WfeplSO4qHoMv9ziBCJzspdXwvlimU+WS3BiKhToJR8
         3GPdjlLzd+aRy3A8/L5KwBJkCrh2I+kScx2dxCvN+Gtei+pjKKAA8LSuLKi+O4+ctAaG
         p6lZWB85Zo1VxZNHo3eZjsKMo2XrgJmEYUxOyB5HgWw47fOMAWNoO3fcLpOh5kUM65LM
         8gQV1hvLKab5r1576E5AvYXUpnYhVDnXbkfq+lJVgpsUomggrhLJDxWBYY3DG0a8LxnX
         RBIL6VBhTrAT0emGyFmb5gcbOJ1JSQd5bOc/o4d1uUmhecYH+5YUDPZnASIiLt6KF1UN
         jZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697176977; x=1697781777;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Vu2sdYqkW0+CSrOuTLX5k/4SI34C0qvMMCdxtwer/8=;
        b=XZUEjeYabHc3qxzqfJcAu2Z2Vv6imbCiU7w7MN4Mnq2o/4Ewp3StUVyIVv1pQwxWTF
         8zrAYYPF1Qat08+GiMjU7qFy9lCiYvBYEtVCPjk6HJahJcc7boAdrmm5Ta2k6Sa2++lc
         qYt3FcneQPktxgLRDstzhi0tItP88Co/gtrw7DBDHNLHWthv11KW8Q2nkUeL0lw8Mdq+
         koCmsesAkrkJ9XUvaAK4HEyv9bvQjiwuMV2s9k2ho9AvC4K4YciIHntYidi0eTfbvwgu
         Z2yZH/EfFz+QP5ejby3z/3DMjioblGBOoa50ELShJgr1OdV1+Qnj1A3WNRJOy98GuDgw
         sDTg==
X-Gm-Message-State: AOJu0Yxn5MjouKJg4bcB70IjCuiqBqBMbp0z0AipP5hv0ESWySsycvQA
	g9vR6AjMWcPIHPIoTHYaEO0=
X-Google-Smtp-Source: AGHT+IGhtmGS1QmYj571UPHsTosgVhhEpSPzBtlFiRzwiN44mM79nqVM7owuRiCFMtwoyied83BrRw==
X-Received: by 2002:a05:6a00:84b:b0:693:3cac:7897 with SMTP id q11-20020a056a00084b00b006933cac7897mr27612056pfk.9.1697176976821;
        Thu, 12 Oct 2023 23:02:56 -0700 (PDT)
Received: from ?IPV6:2620:1f7:3d44:7c4b::32:3cc? ([2620:1f7:3d44:7c4b::32:3cc])
        by smtp.gmail.com with ESMTPSA id y6-20020aa78046000000b006934350c3absm12708734pfm.109.2023.10.12.23.02.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 23:02:56 -0700 (PDT)
Message-ID: <f9c5dd5d-7b4c-4ca9-b6e2-6943ef21b71b@gmail.com>
Date: Fri, 13 Oct 2023 11:32:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: D-bus model proposal for pay for access features - LicenseService
 at OpenBMC
Content-Language: en-US
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
References: <CAMhqiMoFAHcUk0nO_xoOubcZqF_dPDFweqsttTULRJK38o1Ung@mail.gmail.com>
 <CACWQX83=CG_H8YUvEYj4BpDWFPoYkVLdpxo6n9V5LneTeeM7Bw@mail.gmail.com>
 <20210504233843.hvuvmebaznanqnlv@thinkpad.fuzziesquirrel.com>
 <YJLXlNyk/c8IVf9e@heinlein> <0af0324d-c8a1-4ce8-80c3-f8f846cc930f@gmail.com>
 <ZR_9p11_v5wQAOKB@heinlein.vulture-banana.ts.net>
 <ub2mniaycgyvj6ujfwytknyvhrscnjgoewxjtvpgq37znlxszf@yzvbxgnre4iy>
 <2736a0cbaf79f00617a8e55a962eea505ac7a7ab.camel@codeconstruct.com.au>
 <dr2sdq6xt52ieidkgdit56uew5bgo2tedlk5e4uee3tobcez3x@t3mhaemftllv>
From: Sunitha Harish <sunithaharish04@gmail.com>
In-Reply-To: <dr2sdq6xt52ieidkgdit56uew5bgo2tedlk5e4uee3tobcez3x@t3mhaemftllv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: raviteja28031990@gmail.com, Ratan Gupta <ratankgupta31@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>, abhilash.kollam@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 13-10-2023 09:43, Brad Bishop wrote:
> On Fri, Oct 13, 2023 at 12:32:09PM +1030, Andrew Jeffery wrote:
>> On Fri, 2023-10-06 at 13:17 -0400, Brad Bishop wrote:
>>> On Fri, Oct 06, 2023 at 07:29:27AM -0500, Patrick Williams wrote:
>>> > On Fri, Oct 06, 2023 at 10:21:01AM +0530, Sunitha Harish wrote:
>>> > > Hi Patrick,
>>> > >
>>> > > Re-starting this discussion with the design that is being worked at
>>> > > License Manager: Add license manager design (Ibd6c6f35) · Gerrit 
>>> Code
>>> > > Review (openbmc.org) 
>>> <https://gerrit.openbmc.org/c/openbmc/docs/+/64710>.
>>> >
>>> > I've already written enough on this topic.  You've not added much in
>>> > terms of what I've already written, so I'm not sure what more you 
>>> want
>>> > me to say.
>>>
>>> I just want to say that OEMs have many, many happy customers that 
>>> gladly
>>> pay for unlocking things.  They just don't typically hang out here 🙂.
>>> I just bought a BMC license key the other day for my ~8 year old
>>> Supermicro x10slh-f.  For what it is worth.  I know a lot of people 
>>> have
>>> a problem with charging for security fixes but this is bigger than just
>>> that.
>>>
>>
>> Brad: Given the interest, are you able to provide feedback on IBM's
>> design proposal?
>>
>> https://gerrit.openbmc.org/c/openbmc/docs/+/64710
>
> Hah - that's what I get for opening my mouth 🤣.  I wouldn't say I'm 
> interested.  I'm not sure why I felt compelled to respond - Maybe I 
> was just feeling chatty and wanted to support one of my fellow server 
> OEMs.
>
> Anyhow, I took a quick look and in general the proposal seems lacking 
> in details.  References to dbus objects and interfaces need to be 
> filled in with details.  "License data" needs to be explained - what 
> is it, in terms of Redfish and DBus?  Other vague statements about 
> Redfish need to be explained in specific terms of the new schema 
> (resources, actions, etc). Interactions between applications need to 
> be spelled out explicitly (more dbus interfaces?).  The resulting 
> Redfish data model is not apparent to me (I admit I've never looked at 
> the new schema, but I do know a thing or two about Redfish so ideally 
> I shouldn't need to?).  Much like the Redfish concern, the PLDM data 
> model needs to be expanded upon and explained in terms of a PLDM 
> specification.

Thank you Brad & Andrew, we will address your feedback and update the 
design document accordingly.

>
>> More broadly, setting aside Patrick's legal concerns,
>
> And they do seem like reasonable concerns, but I am not a lawyer. I 
> don't think engineers are going to be able to allay those concerns.
Yes. Based on Patrick's concerns - is it still a legal concern if BMC 
works as a mediator to forward the license to the host, without 
processing or installing the license at BMC? Host is not an OpenSource 
code, and any OEMs can do their proprietary implementations as needed.
>> I think for this
>> to go anywhere it has to be demonstrated that there's a group of people
>> needing a solution 
>
> Isn't this self-evident from the schema being adopted by the DMTF?
>
+1
>> and some collective interest in maintaining one. If
>> we can't get multiple parties to collaborate on a design then I don't
>> see a reason for trying to maintain it upstream.
>
> How many parties collaborated on getting FSI into Linux?   How many 
> parties are collaborating on <foocorp>-misc or <platform>-misc?  Are 
> those different somehow?
>
We are looking forward for the collaboration from the community on this 
feature.
>> From a personal perspective, the concept grinds badly against common
>> believes and values in open source software projects and I'm not going
>> to go out of my way to support it. 
>
> I'm sure it probably sounds like I'm advocating for this feature. I'm 
> really not.  I'm trying to generally improve my understanding of what 
> types of code submissions are welcome and what kinds are not through 
> questions.  Maybe I just need to stop looking for patterns where none 
> exist...

Thank you Brad for your views. Please continue.

If there are any technical concern about this feature, we will work on 
that as per the comments received on the design document. Legal concern 
can be resolved by finding out a way forward together as a community.

Thanks & regards,
Sunitha


