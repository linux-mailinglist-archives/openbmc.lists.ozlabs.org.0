Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A778D30E06A
	for <lists+openbmc@lfdr.de>; Wed,  3 Feb 2021 18:03:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW7Kg70R8zDwvd
	for <lists+openbmc@lfdr.de>; Thu,  4 Feb 2021 04:03:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22f;
 helo=mail-oi1-x22f.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kXWfgC/F; dkim-atps=neutral
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW7Jq5fndzDwpn
 for <openbmc@lists.ozlabs.org>; Thu,  4 Feb 2021 04:02:17 +1100 (AEDT)
Received: by mail-oi1-x22f.google.com with SMTP id h192so609088oib.1
 for <openbmc@lists.ozlabs.org>; Wed, 03 Feb 2021 09:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=UcCqLwAxXZhqBGmrLVq5e88pX5zr54tmmdlXX0470/I=;
 b=kXWfgC/FSkK+1lG6ymbqtKOF0EXBFPZVNpJsz5wDidHHi9L/IALfkij7wW+upD6KO+
 r1HgQ9cIoyD3Y3hRwPHe5qiBwUhidybDpghvNwr3fHTGa/AGGfz94idLcae98GR1swmu
 HhjmoP/uOQFMi/EJumr8r9YNGiy+bTL5f6A+dQIRZFhDOA8bBQ7nTRhzntCuu9j2hcAg
 4IL6JQNlouL6f+9wq3SJbi7eu333Q2kRaSVNhrflg11YF+rcEOvDGoa3PDd0E6qWJFYm
 ALAb4Bb38f/Dohd+MsbKef9+saRv/wTSNNXtwlETy15iVXCsXCWhaBH42hg9fNMEpgBE
 Lg7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=UcCqLwAxXZhqBGmrLVq5e88pX5zr54tmmdlXX0470/I=;
 b=N46GnhRScaw7bCOS3PwxMrJSc3GfdGCrGm6VjrJmHOSF11LRs1JfULl4+11LJaBTLb
 3GG50MufltOGwMmr608uuNi9L+IuhrYMH4UfK38M0HFfFFxHjhjVwZ0wWnmp1OZ3zN8e
 9/tL73Z3OAUbIdNj8ygxFYmBZPpvA1m3Rsi7Sixq2dtmY6x4I2hXa/UdUDWBL2zUNYT2
 ICWPWesrYZRh/AwlvLW5Ydno1k7lSJrQQ7nF4nxN4eixNCOZI9V5AyHTOPKWniDJCoYB
 YVI4X1J9kO4ezc40/I7EEXuOelSXB1q0rRIGdaGvDvjVpR0fgznTNAsFG4KUy4bH6ODs
 HteQ==
X-Gm-Message-State: AOAM530j82U4JIdI+rNmN9vUY2NgwYl/zu6tkT5x0xFZDBL46gK5QF09
 wBBuCxGtG3+bmylTB+dVerxzN44dnHEXmQ==
X-Google-Smtp-Source: ABdhPJyp7Wn1+YWk9jAoMAtZhFYRfAXz+g/IHXcd/7e9dWTLcnanlzr4uLnP1uZUV50m9vPEZCZYQw==
X-Received: by 2002:aca:ecd3:: with SMTP id k202mr2364674oih.107.1612371733321; 
 Wed, 03 Feb 2021 09:02:13 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:45d8:fc2d:b56:fdd9])
 by smtp.gmail.com with ESMTPSA id s69sm551840oih.38.2021.02.03.09.02.12
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Feb 2021 09:02:12 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Redfish BIOS vs. PLDM BIOS
Message-Id: <147C026D-F12B-4D9F-A926-6F2DAD5E1B69@gmail.com>
Date: Wed, 3 Feb 2021 11:02:12 -0600
To: openbmc <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
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

We at IBM ran into an issue recently around BIOS entries.

We have a PLDM BIOS entry, pvm_stop_at_standby, which is used to tell =
the host
whether it should stop in a setup/standby state or continue to boot all =
the
way up to the operating systems.

We had identified a Redfish API[1] that fit with this function and =
mapped that
API to a D-Bus property which was then used by PLDM to fill in this BIOS
attribute.

Recently though we've been working on incorporating the =
bios-settings-mgr into
our code and into PLDM. That provides a generic Redfish API for setting =
these
BIOS values using key,value pairs.

The issue is that we now have a BIOS value, pvm_stop_at_standby, defined =
within
this generic schema that should not be set via the Redfish BIOS =
interface but
instead set via the Systems/system BootSource API we've been using all =
along.

We've found some other BIOS attributes like this as well, where PLDM has =
defined
something as a BIOS value but there is a non-BIOS interface in Redfish =
to
manipulate it. I believe this email thread from Ratan/Manoj is similar =
[2]

We were brainstorming a bit and the best solution seems to be to break =
up
the PLDM BIOS values. Either put the one's backed by non-BIOS Redfish =
API's into
a separate file or name them in a way they can be easily filtered. PLDM =
then
only reports the real BIOS values to bios-settings-mgr and therefore =
Redfish
will only shows this as settable via the generic BIOS Redfish interface.
=46rom a host perspective, they all look like BIOS values but how they =
are set
via Redfish would differ based on the the type of BIOS value noted =
above.

PLDM would need to support both the generic bios-settings-mgr BIOS =
values as
well as these other D-Bus backed ones.

Thoughts? Sampa is going to get a discord chat going but there's a lot =
of
background here so figured I'd send that out via email.

[1]
# pvm_stop_at_standby Enabled
curl -k -H "X-Auth-Token: $TOKEN" -X PATCH =
https://${BMC_IP}/redfish/v1/Systems/system -d =
'{"Boot":{"BootSourceOverrideEnabled": =
"Continuous","BootSourceOverrideTarget": "BiosSetup"}}'

# pvm_stop_at_standby Disabled
curl -k -H "X-Auth-Token: $TOKEN" -X PATCH =
https://${BMC_IP}/redfish/v1/Systems/system -d =
'{"Boot":{"BootSourceOverrideEnabled": =
"Disabled","BootSourceOverrideTarget": "None"}}'

[2]: =
https://lore.kernel.org/openbmc/b2b4c23a-0be4-8b76-20a2-dc689161490c@linux=
.vnet.ibm.com/=
