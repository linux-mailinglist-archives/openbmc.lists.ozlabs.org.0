Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9460840D3BD
	for <lists+openbmc@lfdr.de>; Thu, 16 Sep 2021 09:24:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H97rd3ZVdz2yQH
	for <lists+openbmc@lfdr.de>; Thu, 16 Sep 2021 17:24:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gJzhRltE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=liuxiwei1013@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gJzhRltE; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H97r85QbCz303H
 for <openbmc@lists.ozlabs.org>; Thu, 16 Sep 2021 17:24:24 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id m9so4754711qtk.4
 for <openbmc@lists.ozlabs.org>; Thu, 16 Sep 2021 00:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=ctNQIpDjgwd3Ue7XW2ujnXhaC2PkUVTOTI69TMKCMPQ=;
 b=gJzhRltE48sqXdI/DU4GcjDorVOkm2nMIuQrW+Llad3MkYbz2J5o0kmKCh0Jutatlh
 H0HrvoJuDweSFPrDwf1zH368ldxvk1rT5lCNgo0FTl6l99iS2qFYsk7V9Y25SFMzYNI7
 qUgjeY0pZiHLZfNdTE3aMG4K2jieeRePym5BqYetJHmE8Ce3aleenWzFYqCUzRiHeqUH
 OoBRq7DW4FwK7++sQErgp4dDzhcOCeOz7kyQhMfo9j6JxKjbieYat5PNXo9DirfyQUn1
 ZuDDNaa8ZQUBO8va4e0cpeDJzzfU31HaU8PxpEXgrJ3j2UP9dNAG9LYYhch3aGtqyaHk
 jnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ctNQIpDjgwd3Ue7XW2ujnXhaC2PkUVTOTI69TMKCMPQ=;
 b=rAC8vSwvoqlxfGsBL9CgiDnGrM/XcQctnJz3gaVfzALisob8Py43eOZcVIFfQGoK62
 k+WFaja0aK8+0DBdJlLYsNggVl+6z4gOb6LA5haKegla07J5uCeA/tGL4jCPPEkMzp9j
 KRNEcIsCEZGc60aW4RKF2Jrc68UBcSNaazXj54gTtiYTSCKzQ3tGvsRDk0VIkJWj7Jrh
 3K0LB6EIsn+hX05/ra7Scs/shgsMLU6X2B5C9N2SmZ0Cd8gJ1l5dPgINrkzoX+XnhEzt
 SEPuAC/JAx9gVU+K08s8LAkQF0vw3ihfn6rijdeR1v3OO6pwebPNoIoJBFYJjMG1LWRq
 OFDw==
X-Gm-Message-State: AOAM5304V4km4AL/7LcJJ3hIGQ+QmzInWRUydZiEiBE55eE80xX+LGVl
 CkKSmcSckrAQD2puSxLIEHSsxPjC8K1buA5giJaXF0qLGas=
X-Google-Smtp-Source: ABdhPJyhtrd1nZmgmCqEhiQt5eF+6Ygz0hagEj06dCQp9R4T74aRMjAATMRaRIgjV6XPwpgP3r4VT5Iyr2RrshmoBwg=
X-Received: by 2002:ac8:4156:: with SMTP id e22mr3726545qtm.308.1631777060876; 
 Thu, 16 Sep 2021 00:24:20 -0700 (PDT)
MIME-Version: 1.0
From: George Liu <liuxiwei1013@gmail.com>
Date: Thu, 16 Sep 2021 15:24:09 +0800
Message-ID: <CANFuQ7BWedK3LNh4vy8uVN3Jk8GaG-GJ1BwMHDzpTv+kgzxc+Q@mail.gmail.com>
Subject: Question regarding phosphor-dbus-monitor repo
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Devender Rao <devenrao@in.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hey everyone:

I am learning phosphor-dbus-monitor recently, It is used to monitor
the attribute value or objectPath of D-Bus, and then execute the
corresponding callback method, and the premise is that needs to
configure in the YAML file.

The current default configuration has the realization of `OCC` and
`snmp`, and I have also seen the realization of other functions in the
ibm openbmc repo(eg: Fan, PowerSupply, etc).

I have the following doubts:
1. Today the architecture of openBmc is gradually discarding YAML
files right (because I think it requires templates and py paarsing to
support).
2. I think we can migrate the functions of this repo to the
corresponding repo (eg: the configuration of OCC can be migrated to
openpower-occ-control, and the configuration of snmp can be migrated
to phosphor-snmp).
3. Adapting to these YAML is a complicated process, and I suspect that
the original design idea was to aggregate all D-Bus monitoring into
this repo, but it does not currently achieve this goal (maybe my
understanding is wrong).
4. At present, most repos use D-Bus to monitor certain attributes,
objectPaths, etc, but they have not done YAML file adaptation in this
repo, but implemented in their respective repos (eg: PLDM,
phosphor-led-manager).

So, my thoughts is: If we transplant `OCC` & `snmp` and other
functions to their respective repos one day in the future, can this
repo be discarded?
Sorry, I am not sure if the maintainer has other plans, or there are
other advantages to using this repo? Maybe I missed something.

Looking forward to your reply :)

Thx - George Liu
