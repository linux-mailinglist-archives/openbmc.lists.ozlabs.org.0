Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC971D2050
	for <lists+openbmc@lfdr.de>; Wed, 13 May 2020 22:39:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MmkT36qNzDqh2
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 06:39:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22e;
 helo=mail-oi1-x22e.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lXUmBB6l; dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MmjX3bY2zDqZW
 for <openbmc@lists.ozlabs.org>; Thu, 14 May 2020 06:38:55 +1000 (AEST)
Received: by mail-oi1-x22e.google.com with SMTP id v128so5811400oia.7
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 13:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=H/0PbLp0PCmOlm24Pq3sM187oq2XZfykdUWkDqhp0ZU=;
 b=lXUmBB6l77CTndV9uEbeVHVfyDE5Fy7W9g77dossXQUhWp+IfVkt8PoNedauMPO0r5
 48foALWrOUX+rpyxit9uzrsQP3IqSjIERQcoXlJjglrsxrPq/e2hLkESFMBlOymKEjTH
 7/TyNMUo6bJmFQekWIGSw6ILU2YgZ0U78JzTd4mCxW1wvbO6euV/Ya6SXvNGk6fudO0e
 1EobxmDRg1MFegqnOuCKKtNjK4Ezl/3udID1EWHFVpIQ62xe1qUxYYuBOOqSowjfo7QS
 3frw+3T8zCUQzF1tRC8JPLWyNblJ5jc7gsKI6XqRBTPYluDUdSis/LH7AGukm8og5JDf
 yL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=H/0PbLp0PCmOlm24Pq3sM187oq2XZfykdUWkDqhp0ZU=;
 b=bbqnOHuNWF3vup2Ygkz8tUAoPNLAFGOGmDeKza+y4dK0KOI5rthqu3Y2u/8o2V8gm1
 TRDwnE1qwhFtKpDCtmtfU3Z6L2g0fRbzz0Ztj6WVrvWV+8y6up9AXhB0aSsLlDxhcA2D
 xIcIEtneA9rLaMC40w4G5VSjj84UmUZJERAWXFNETA09+mcRQzebKAwo23tT4Ckf2fTn
 q8q0Ehz0W5MCmfTDqkru79FAu8QocCGu9+1TRMcyNDFjN1BXvSanrjtE9WbdQst1ZtXw
 VFaE1X9Repb0aENHLlHeYfYnpUa+PNoX9yYQ7/W5Lkz90dA08Tu5GxcKD1XaYv6bfz5T
 zHCw==
X-Gm-Message-State: AOAM530t9d+pHEXtVIl0A/RLUtv2MBiqMyvbfqjsGUeNA9kCZgssLLcp
 rLeiSaGaPSerVc/t3Y46nD1i2xt20Hc=
X-Google-Smtp-Source: ABdhPJwgxYL88lt2zRWAct2cCBQeaTKkPuBcynyWAW+PcyW+drUWxgnYaDwb0UUPwBFAaFivHdqQVg==
X-Received: by 2002:aca:4c56:: with SMTP id z83mr3997943oia.159.1589402332519; 
 Wed, 13 May 2020 13:38:52 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:7f:8894:240f:4da1])
 by smtp.gmail.com with ESMTPSA id r11sm6169489oib.47.2020.05.13.13.38.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 May 2020 13:38:51 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Requirements for security audit logs?
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <87f78066-22d5-6f15-56a2-134388844a66@linux.ibm.com>
Date: Wed, 13 May 2020 15:38:51 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <4DD0C271-0081-4E9D-9733-F9DA101D7CF8@gmail.com>
References: <87f78066-22d5-6f15-56a2-134388844a66@linux.ibm.com>
To: Joseph Reynolds <jrey@linux.ibm.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On May 13, 2020, at 11:56 AM, Joseph Reynolds <jrey@linux.ibm.com> =
wrote:
>=20
> What are our requirements for Security Audit Logs?  The main idea is =
to add a new BMC logging service to hold security-relevant events.
>=20

Def hoping we can work this into our audit design:
https://github.com/openbmc/docs/blob/master/designs/phosphor-audit.md=20

I=E2=80=99m not sure how much progress has been made with implementation =
but
we spent a good chunk of time reviewing/discussing it and it seems to
hit a lot of the items below.

> Considerations:
> - The log holds *only* security-relevant entries (and no irrelevant =
entries).
> - Consumed by a security auditor (currently the Administrator Role).  =
The log is likely to contain sensitive and possibly personal information =
(such as IP addresses), so it must be protected from reading.  Perhaps =
only the admin can read this.
> - Entries must be available, so the admin should not be able to delete =
the log or any entries.
> - Log can be held on BMC persistent storage (like flash) or streamed =
off the BMC, just like any other log.
> - Low-level design: any BMC service can write a security log entry =
when it encounters a security-relevant event.  (In addition to its =
regular logging.)
> + Note that security holes exist.  I would like to keep these outside =
the scope of this initial discussion except to note that examples shown =
below ought to generate a security log entry. Examples:
> +A: root SSH access can do whatever it wants to the security log
> +B: factory reset clears the logs
>=20
> Examples of security-relevant events:
> Network:
> - New connections via HTTPS (se BMCWeb below), SSH, use of the serial =
line to access the BMC's shell, etc.
> BMCWeb:
> - All authentication attempts (login, basic auth, etc.)
> - When accounts are locked out or reset
> - Attempts to use REST APIs that require Administrator access. NOTE: =
This covers a large number of functions and may overlap with services =
provided by D-Bus daemons.  Example: LDAP config, local user config.  =
Example: when an admin uses their authority to change a user account =
password.
> Services:
> - Password changes (in phosphor-user-manager)
> - BMC rebooting or power on
> - Host state transitions
> - Firmware update (BMC or host)
> - BMC Factory reset
>=20
> We can consider a more formal set of requirements given by NIST SP =
800-92:
> https://en.wikipedia.org/wiki/NIST_Special_Publication_800-92
> with additional controls as specified by NIST SP 800-53.
>=20
> - Joseph
>=20
> This topic was previously discussed as agenda item 3 in the 2020-04-29 =
Security Working Group results
> =
https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDU=
WmAOI
>> 3. Requirements for security audit logs.  Access, deleting, APIs.
> There was general support for the ideas that the BMC should have =
dedicated security audit log that could not be deleted or cleared. This =
log would have only security-relevant events.
>=20

