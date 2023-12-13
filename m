Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4053F812022
	for <lists+openbmc@lfdr.de>; Wed, 13 Dec 2023 21:44:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fcdlDquh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sr6sl2RMmz3cVt
	for <lists+openbmc@lfdr.de>; Thu, 14 Dec 2023 07:44:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fcdlDquh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72e; helo=mail-qk1-x72e.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sr6s80G6pz3brC
	for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2023 07:43:54 +1100 (AEDT)
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-77f3159d822so396966685a.2
        for <openbmc@lists.ozlabs.org>; Wed, 13 Dec 2023 12:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702500228; x=1703105028; darn=lists.ozlabs.org;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QOSWAQY/QN+g1Fge3zA/EDkEVcvvmBBFm+87a2hkK1g=;
        b=fcdlDquh8RW0EukuGgkqjB4Wwts8OpmVDLTgN67tVO++J0FLeQ8fgnL8QzdpFq9TeP
         5EP0ZDb2sQK4J1qGJH+jYP+4ZirMvBh53acCsxdEP37m5Zl2GIlr8TEadlgXnbDCscnh
         RKHSLetKqkFKIRv289kerE6fe66y4YD6eB7Dh35BmHeb0ubzAU1yNDf+R27Z5Has4AKB
         5QjjG4yF5UCPpHIUEaYXnLN6FSh+ubb7WQoLfzeP+WmSEXxVPgte0hOF/YzId2u+gTtR
         55VP4nK2rjDFnuTjT6+QZPdznN/OjNVF+0BE8kq8i2FTxsd1f/7+JEPEKTzOFPH4LyDO
         SArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702500228; x=1703105028;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QOSWAQY/QN+g1Fge3zA/EDkEVcvvmBBFm+87a2hkK1g=;
        b=Qpgv01xVqrkGDv/jWeY3ILgeeJlYq6uunyhgeN9mfvyJgnVjBb0Mlzofje4xY/CSdf
         +ihfyRHkiY1RXI3CZeop48sQULjLuLXV2Ytj8YSNN/sjrCf8BWq7GaTkzJuNmuxTFgkv
         FQfgSlk7lXuWeXa9kqMqtK0Y6v0vRGDPWstwLUyFjdjNAZMnKbpO/zlvQQL53JJ6OTeo
         YST/Sgw25DYi7+0WnTJSerclLMdXv+e4hX3rVF4pShRsNz8MMZozceAFFGl1RI9lHR7H
         XJ+XJC5cG+5XKO1db20IEXWAhgAuWKCm7WXV8FREV+hsQ6HcbyhBbtJ3h1DEeB7F+W0P
         6wlQ==
X-Gm-Message-State: AOJu0YxSDhPolcB4EY0piLcyG39oN25PESAmZTWcVAzhpSptgvjhGHuk
	cIGkGKNblW9v5juZDnlRHVb2wFd0tqq6ZA==
X-Google-Smtp-Source: AGHT+IGPpTnOKNxWXetCcZ3MwAwPxX0pGoPd0rU9Ada8zzOcoZT31nI/RnmwQmGcWuWaVNqm0wXHRA==
X-Received: by 2002:a05:620a:1462:b0:77f:ae3:223c with SMTP id j2-20020a05620a146200b0077f0ae3223cmr8963048qkl.103.1702500228378;
        Wed, 13 Dec 2023 12:43:48 -0800 (PST)
Received: from smtpclient.apple ([129.41.86.23])
        by smtp.gmail.com with ESMTPSA id re19-20020a05620a8e1300b0077f13650cb7sm4770075qkn.2.2023.12.13.12.43.48
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 13 Dec 2023 12:43:48 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Redundant BMC's
Message-Id: <E5183DEB-8B54-45AF-BE0F-6D470937B73D@gmail.com>
Date: Wed, 13 Dec 2023 14:43:37 -0600
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3774.200.91.1.1)
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

Greetings,

We at IBM are looking at implementing a server with redundant BMC's. The =
idea of
redundant BMC's is that if one fails (software or hardware related), the =
other
BMC takes over and there is no impact to the owner of the server =
(enterprise,
high availability market). One BMC is the "Active" BMC and the other is =
the
"Passive=E2=80=9D.

High level you have 2 or more chassis's in a single server. 2 of those =
chassis's
have BMC's running OpenBMC. The BMC's negotiate on startup which one =
will be the
Active BMC and which one will be the Passive. Both BMC's have full =
access to the
server hardware (fans, power supplies, VPD chips, ...) but only one can =
access
the hardware at one time (via hardware mux).

The Passive BMC will be running a subset of OpenBMC services. As it will =
need to
support firmware update, and other basic features, it will have bmcweb =
running.
But other services like fan or power control would not be running on the
Passive.

The Active BMC will utilize bmcweb aggregation to provide basic =
information
about the Passive BMC. Server management can only occur via the Active =
BMC.

As the user changes settings (BIOS, certificates, system policy, ...) =
via the
Active BMC, we need to ensure we replicate these settings over to the =
Passive.
We've done a bit of initial exploration into using corosync/pacemaker. =
It has
some potential but also feels a bit heavy for what we need. The thought =
is that
a role change where the Passive BMC becomes the Active BMC and the =
Active
becomes the Passive is mostly driven by our external software managers. =
There's
potential for some cases where the BMC's themselves drive the role =
changes but
most of our use cases are situations where something in the BMC hardware =
(or its
connections to the server) have failed and the BIOS firmware or Redfish
management client direct the Passive BMC to become the Active.

A roll-our-own data synchronization daemon (utilizing rsync) to monitor =
for file
changes with some basic rules on when to synch (immediate, synch points) =
doesn't
seem all that bad but there's probably a lot of unknown pitfalls =
something like
corosync/pacemaker already handle.

Just throwing this out there in case anyone is also working on this or =
has any
opinions on direction here.

Thanks,
Andrew=
