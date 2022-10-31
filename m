Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4757613ABC
	for <lists+openbmc@lfdr.de>; Mon, 31 Oct 2022 16:53:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1HkV5vlbz3cBX
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 02:53:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=aezZtoIJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=edtanous@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=aezZtoIJ;
	dkim-atps=neutral
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1Hjw2jnqz3c16
	for <openbmc@lists.ozlabs.org>; Tue,  1 Nov 2022 02:53:07 +1100 (AEDT)
Received: by mail-wm1-x330.google.com with SMTP id f16-20020a05600c491000b003cf66a2e7c0so3638697wmp.5
        for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2022 08:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkDCJpOT93jOlK9tDa808dQf5eQpxXipfPB6QRaYr2g=;
        b=aezZtoIJ0ESSKlOYoceg2j1pIaqMNGZ+tFXn2osur63ps8q2Q7eU4t9BpQJDJCLoVU
         xLdfgo3e4fYQ1q4G5BYcP0ZLmaFH3J2i4Hfo/8Y7SYgOER16Y7X7CsX0ictaitJr2UbS
         Pkjuj3ALgP9YOswBVv5CfLPABjRP5lHHYpHjUTlBnGsRuev0KwotQ1PYhsmnGv9VsuuA
         JuyVszmxs/glNrOveCSpVTYKx35hjZGnHocXp9+OzPrP/uogFiTIgF/6uupAjlrZt5qS
         /B2RRBvz6o5w1bduvh6j+Y834of7IyhBJsNYhuznoIRQqhUoUll6Xo/CNLiBWkrLIcaR
         rLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkDCJpOT93jOlK9tDa808dQf5eQpxXipfPB6QRaYr2g=;
        b=Gmn9IQpojQ9txxyvkbMwmvs0RAqNOIkPLV9bsC8fe0KISmGlIpCR88iEUcJxbt9O9s
         fXEliA/ALWMsanw/rZxqgpedibDbg9aCxhJFt49jehWBsjqQw8J1mikA2tMJMa56ny4U
         weVuzbYhUXjazXF6yoW5ulOB1OjzPPfsYalZpjLNl2idzlSpDQqzp+ct5Rmp2xIF026X
         4l4/OtQln1Dv0GxSlvDJ6gK4VlgZFT+QCJluJZO2k6MLKIhWP5K19wLFSb2EFnOnX/OC
         bukT57u2Q6jrJ4UIU0uXDVySmTM85n4/CB5qbPKOL0qQ1N5p2M+1Mzz/3tftLuvcKFWo
         B8Iw==
X-Gm-Message-State: ACrzQf0cyxvtbnjdqTZ+xbKBNART/sb8sxSKGccMpmE+BVwKk7YQS67Y
	p8VhP0gCdxXLxWgS5I1Z3SNqTW0p6vxVv1VJHRCwTw==
X-Google-Smtp-Source: AMsMyM5ZAc6vs3AhotlE+y+43Rd/4cb1WtzUq6KOESJ7f93o4OrCu6jHO7OAt8CrPesBgY+KM28v1Jz2AP5WAiWkS/U=
X-Received: by 2002:a05:600c:6008:b0:3c6:c3fa:c173 with SMTP id
 az8-20020a05600c600800b003c6c3fac173mr9050353wmb.190.1667231582408; Mon, 31
 Oct 2022 08:53:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAC4LpBw+H2v5tHT8gAThLrmx8X-Oe6xVLhQ+STBXm0LXgGgv2Q@mail.gmail.com>
In-Reply-To: <CAC4LpBw+H2v5tHT8gAThLrmx8X-Oe6xVLhQ+STBXm0LXgGgv2Q@mail.gmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 31 Oct 2022 08:52:54 -0700
Message-ID: <CAH2-KxCURVzcjWL2feRS8BE_V5XVGLtR2e1WeTdWMXjpBL2d8Q@mail.gmail.com>
Subject: Re: Proposed bmcweb dump LogService "Name" change
To: Claire Weinan <cweinan@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Oct 25, 2022 at 6:19 PM Claire Weinan <cweinan@google.com> wrote:
>
> Hi All,
>
> I have opened a bmcweb code review (https://gerrit.openbmc.org/c/openbmc/=
bmcweb/+/57949) proposing a change to the "Name" property of dump LogServic=
es. This is best shown with examples:
>
> Example from /redfish/v1/Managers/bmc/LogServices/FaultLog:
> Before: "Name": "Dump LogService"
> After: "Name": "FaultLog Dump LogService"
>
> Example from /redfish/v1/Managers/bmc/LogServices/Dump:
> Before: "Name": "Dump LogService"
> After: "Name": "BMC Dump LogService"
>
> Example from /redfish/v1/Systems/system/LogServices/Dump:
> Before: "Name": "Dump LogService"
> After: "Name": "System Dump LogService"
>
> Are any Redfish clients currently matching on this "Name" value? If so, w=
ould it be feasible to change from checking if "Name" equals "Dump LogServi=
ce" to checking if "Name" contains "Dump LogService"?
>
> ---
> Details on the reasoning for changing to a more specific name:
>
> This allows a client to differentiate the dump types of various dump LogS=
ervices based on the "Name" property. (For example, the client might only b=
e interested in examining LogServices of one particular dump type.)
>
> From Redfish spec v1.16.0, section 9.6.7 "Name": "The Name property conve=
ys a human-readable moniker for a resource. The data type of the Name prope=
rty shall be string. The value of Name is NOT required to be unique across =
resource instances within a resource collection."
>
> Based on the above, the primary purpose of "Name" is to be a "human-reada=
ble moniker=E2=80=9D. I did not find a statement in the Redfish spec on whe=
ther it can be used for type matching.
> One type-related property in the LogService schema is "LogEntryType" -- h=
owever the possible values (Event, Multiple, OEM, SEL) aren't fine-grained =
enough to determine the exact dump type for this use case.

Please open a discussion in a DMTF forum to discuss this.  Not finding
a statement would imply that there's something that needs to be
changed in the redfish specification itself.

>
> So in the absence of another suitable LogService property for a client to=
 use to differentiate between dump types (and various OEM LogService types =
in general), we opt to use the "Name" property.

Lets get clarification from the standards body on how this feature is
intended to work (I believe there's already some discussion going on)
and go from there.  Depending on what the decision is, we can decide
what the next steps are, but as proposed, this would make the "Name"
field part of the unchangeable API.  When we've hit this issue before
in the case of sensors, we ended up making it a system-specific
decision.  I'm not sure that's the right approach here.

As an added comment, there are more than just OpenBMC systems out
there running Redfish, so if we actually want to use the Name field
for this purpose, it would need prefixed with "OpenBMC" to
differentiate it from other types of logs with similar naming.

>
> Best Regards,
> Claire Weinan
> --
>
> Claire Weinan
> Software Engineer
> cweinan@google.com
