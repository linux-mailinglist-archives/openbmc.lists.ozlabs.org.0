Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD163731D5
	for <lists+openbmc@lfdr.de>; Tue,  4 May 2021 23:19:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZXld3KxJz301t
	for <lists+openbmc@lfdr.de>; Wed,  5 May 2021 07:19:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=VU+TXBk4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::132;
 helo=mail-il1-x132.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VU+TXBk4; dkim-atps=neutral
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZXlH73C4z2xg1
 for <openbmc@lists.ozlabs.org>; Wed,  5 May 2021 07:18:49 +1000 (AEST)
Received: by mail-il1-x132.google.com with SMTP id r5so9699ilb.2
 for <openbmc@lists.ozlabs.org>; Tue, 04 May 2021 14:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=xm5oWKN0eKPMHUAHUClq2qyvNYjfAkVnVEwebVTEn+Q=;
 b=VU+TXBk4IqFq2LmUG+6RZQtm7DpyP4kyZLK6/KsWY3LfJch/tJpaC7RYDjRAuPIiI6
 G/L1ASclgxFNKcTDo7x8cGy0sgB/+bBPECgU4QAGAb260F4MFbROr2aY0+Uf5jzaUQRX
 hXGXzv+kczA/rVLviSpxZBt4JbLOxW8ME917R2zgCiL38ezhHsMdtTyYBOanC4gAlqD2
 MzOUxvcWij0bRh4Ky4WrViRuM+JIY7MvrAbPFEcfbPkdYUWQK17ZeX+QrwQTfZk1azAG
 u0PBFe+GaUkIT9EENzxOYwgaZDpOiPN4FBnML5e+bS4DRq8npWledGgwc2caBMaZbus8
 ehCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=xm5oWKN0eKPMHUAHUClq2qyvNYjfAkVnVEwebVTEn+Q=;
 b=W9dUfZceLx6CLQF2Y5R0A3dtQMlb4s7pXzwhbCRxV6iR9FuS6yVr2rZte3F8UuuIX0
 IPZ6IrSv7bYWNuySgZUOXLPW1lLZ7ykzf0l2G/KNpb5x5ttXhq3ZoTmcViBVmzdQU35t
 aCseEDUXqgliMqi+JGbOwdTbwEL6UzijqdCpO11KYuX15UBrUIVsjt4xtB76Z2C57FjK
 A82aB4F3fJATBVs3OZ9bgFPf3CFNWFsH30pJkAlCD9aK34N7du2yICrBvrIyyrP+jQtc
 x2C6B66PNAWeN0X4RnKD9yCI0aiaOwUWibqW5eQGVN5c/STxcu+mVtpn/Qzh1uX9ALM6
 6dgQ==
X-Gm-Message-State: AOAM532BYr8VauOzb2iRq5wamqOswk4Hfsrjtmo/8NhOImlWjXNZKd8s
 sns9bAyrehR9qTdB8eq9c+k=
X-Google-Smtp-Source: ABdhPJz+iXZnjoVmyVanD03vcPMyPtHfFBXQVN1tnXE5lmA5kEfNghhiZAS2ZPjZELPMZ27WpkqQOQ==
X-Received: by 2002:a92:dc92:: with SMTP id c18mr16254159iln.252.1620163124085; 
 Tue, 04 May 2021 14:18:44 -0700 (PDT)
Received: from smtpclient.apple ([2601:281:c001:2359:bc23:9f88:a966:d3bf])
 by smtp.gmail.com with ESMTPSA id k6sm1613649ior.28.2021.05.04.14.18.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 May 2021 14:18:43 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: D-bus model proposal for pay for access features
From: Mike Jones <proclivis@gmail.com>
In-Reply-To: <CACWQX83=CG_H8YUvEYj4BpDWFPoYkVLdpxo6n9V5LneTeeM7Bw@mail.gmail.com>
Date: Tue, 4 May 2021 15:18:43 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <F3123217-EAD7-4613-9CBD-39EACB7791E9@gmail.com>
References: <CAMhqiMoFAHcUk0nO_xoOubcZqF_dPDFweqsttTULRJK38o1Ung@mail.gmail.com>
 <CACWQX83=CG_H8YUvEYj4BpDWFPoYkVLdpxo6n9V5LneTeeM7Bw@mail.gmail.com>
To: Ed Tanous <ed@tanous.net>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
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
Cc: Ratan Gupta <ratankgupta31@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On May 4, 2021, at 11:02 AM, Ed Tanous <ed@tanous.net> wrote:
>=20
>> Content-Type: text/html; charset=3D"UTF-8"
>=20
> First of all, please avoid sending html emails if you can. They don't
> render properly on everyone's workflows.
>=20
> On Fri, Apr 30, 2021 at 11:15 AM Ratan Gupta <ratankgupta31@gmail.com> =
wrote:
>>=20
>> Hi All,
>>=20
>> I would like to introduce a dbus model proposal around pay for access =
features.Normally IBM system ships with more hardware than was =
purchased, which can be unlocked later.
>=20
> It would be great to get a lot more background here.  On its nose,
> this seems like this polar opposite of open firmware and something
> that, if done wrong, could be very harmful to the goals of the
> project.  Assuming you did this, wouldn't anyone be able to simply
> recompile the code with the license checks disabled, load it on the
> system, and enable whatever they want without licenses?  That seems
> like something you didn't intend, and something that's less likely on
> closed source firmware, but probably needs considered in this design.
>=20
> As-is, I'm not sure which side of the line I come down on, but my two
> initial thoughts are:
> 1. I don't want to support it or help the code in any way, but IBM can
> check this into their own specific interfaces.

Given that Redfish is a big tree of interfaces, is there a provision for =
custom interfaces?

For example, suppose I wanted some special ADI interface for some ADI =
functionality (like tell me the duty cycle of the PWM of regulator foo), =
assume it is public info/code for this discussion, is there a way to =
hook into the hierarchy and add interfacing without updating the Redfish =
specification?

Like is there a way to query and ask what special stuff is there and =
access it? Or knowing a prior where to look to access it?

Are there OBMC principles on these kinds of extensions? Like it is =
allowed or not? Like one can bend the Redfish conventions or not?

I have to assume that somebody has the need to do non-standard =
interfacing.



> 2. This is harmful to the intent of OpenBMC and open source firmware
> as a whole, and shouldn't be supported in any capacity in the OpenBMC
> codebase.
>=20
> I think a lot more background and details than what was provided in
> the initial email are needed before jumping to "what does the dbus
> interface look like" type discussions.
>=20
> How would open firmware principals be retained if we're now supporting
> firmware locking down systems?
> Are patches allowed to circumvent the license checks?
> Does IBM intend to not allow loading self-compiled firmware on their
> systems to support this feature?
> What is and isn't allowed to be locked down?
> Can the license checks be entirely compiled out?
> Do these licenses appear on any public interfaces?  How do we ensure
> that the public interfaces aren't misused?  How do we keep standards
> compliance (or do we not care)?
> How does this affect our standing in things like OCP open system
> firmware groups?  Does this OpenBMC systems that enable this feature
> ineligible?
>=20
> Those are the questions I have off the top of my head, and to
> reiterate, this feels like the kind of thing that needs more than a
> one sentence background statement before diving directly into designs.
>=20
>>=20
>> Features could be 1) AIX enabled/disabled
>> 2) How many processors are enabled
>> 3) How much memory is enabled
>>=20
>> Proposed Model:
>>=20
>> The model consists of following main entities:1 - licenses - these =
objects represents the features.  There will be a license represnting
>> feature(one is to one relation ship) and these objects have state - =
active, inactive, unknown, etc.
>> These objects could implement the Delete interface for when a client =
wishes to disable the license/feature.
>>=20
>> 2 - manager - the manager object (distinct from freedesktop object =
manager) provides a method
>> interface to create new license objects.
>>=20
>> Alternate Dbus Model:
>>=20
>> 1 - Licenses: these objects represent an agreement.  These objects =
have an
>> association to one or more features, and these objects have state - =
active,inactive, unknown, etc.
>> These objects could implement the Delete interface for when a client =
wishes to disable the license.
>>=20
>> 2 - Features: these objects describe the features available.
>> Feature objects would be static and implementation/platform defined.  =
A BMC or host firmware update
>> could potentially add or remove the available features exposed as =
dbus objects.  At the moment the
>> only feature attribute I can think of is a name and the feature =
status.
>>=20
>> 3 Manager - the manager object (distinct from freedesktop object =
manager)
>> provides a method interface to create new license objects.
>>=20
>> The difference between two models areIn the alternate Dbus model we =
are keeping the feature Dbus object and the License have an associated =
features
>> In the proposed model we are only keeping the license D-bus object =
which represent the feature.
>>=20
>> Flow would be as below with the proposed model -1/ Manager object =
would be having interface like upload (License activation key)
>> 2/ On IBM systems we send this key to the host firmware which =
activates the features
>> 3/ Host Firmware sends the activated feature list to the BMC
>> 4/ BMC creates the licenses for the activated features
>>=20
>> I suspect an implementation of the above flow is highly IBM specific,
>> but I hope some of you have some feedback that might enable some =
collaboration.
>> If not - where should we put this application?
>>=20
>> Ratan

