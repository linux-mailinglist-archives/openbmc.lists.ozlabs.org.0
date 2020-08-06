Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5854723E428
	for <lists+openbmc@lfdr.de>; Fri,  7 Aug 2020 00:54:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BN3hK3CkYzDqss
	for <lists+openbmc@lfdr.de>; Fri,  7 Aug 2020 08:54:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::32c;
 helo=mail-ot1-x32c.google.com; envelope-from=jasonling@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=DBm0c4nF; dkim-atps=neutral
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BN3gb1McGzDqss
 for <openbmc@lists.ozlabs.org>; Fri,  7 Aug 2020 08:53:29 +1000 (AEST)
Received: by mail-ot1-x32c.google.com with SMTP id r21so153314ota.10
 for <openbmc@lists.ozlabs.org>; Thu, 06 Aug 2020 15:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FJANOZ3gAYfu//ltQK0+4GfSCqpHOW64N7/jiQLE5UI=;
 b=DBm0c4nF8klRQWTyzROUBLAM6mmZq55HHTK1MXOu9PIRh+T2fs9vVQQH7nII24dWdT
 AyA4dL++VdhOQjKSeyukRr0mhh53Yg7nDJg+qjHkvaDx/U9nE6pXFcItxFWfckJDwIxD
 Rfah+IVpP9o41sazroBekESdLc03xxO3PqYfyU+bnqngNxrtL8HRGMvSKhok2uHrpcJV
 MELUv/sND2YRPWZFQ1gyv69YydhVlXwtMbfNIF+Tuz76DuJkHHkg/h65DJIjcWp31PZ6
 ojbKgCb4TI1iOBS5hzd5xLrypq07zPdeD1dNXOWMNhHLPtAGqVoNsbiMogn2nACcgeB7
 y3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FJANOZ3gAYfu//ltQK0+4GfSCqpHOW64N7/jiQLE5UI=;
 b=spyO6hsV430ItAqNtZxAJbKEeSI9b9bz43GdzzCjbdl2R0WAlcSAgJaEz+wsOIlJaZ
 82Gpwo+zWBYCVHNgXOVtroz3pnl9wRLzil/ZHSs2Qdxh3IilXB/+GR2pZoM/BTBW4R6x
 m/ILgVDNcEyYzx5H0722DzAyhJiorXxKPogyh9OfLnH2b35UHk+CqRRj2/rEz3Kz3hOX
 2jeMOEKpPb7Y0pJDYRcZtU49qIakhKCuDo6D9aCz6pT57oAD4JGhgBPkF23jBS6lr8Zc
 pjYuW7jpWb8TrUeLGmEqIE5dMIO86oFgZ/6H2/tJjNrB3doGb1yEkXJxyQkKuhecARde
 1UiA==
X-Gm-Message-State: AOAM530IIVcTojPakOj06YW1j/T+K0mT9CvWn/SsLHM+8sdlW0Ulz2E6
 0cVaFSIdBmmkIf2ALWFYKi1ZSXoPLpic8zWn2EHjtOfU
X-Google-Smtp-Source: ABdhPJx4XoGp3JNnxvy3Tr5RasmhXqtJgBbnF1U8ITT8ZjjCsMx5zaE6alxWwRPLTA+I5qSQC4Qh4M55t0kAo7q+6MU=
X-Received: by 2002:a9d:450a:: with SMTP id w10mr9442699ote.327.1596754407111; 
 Thu, 06 Aug 2020 15:53:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAHBbfcUoAB_nmsaCh2-vAEAjE7Fuu3MNydHLUwBS7zkt7pcPkw@mail.gmail.com>
 <f1b0300f-06ac-c350-8fcc-24eae806cdb2@linux.intel.com>
In-Reply-To: <f1b0300f-06ac-c350-8fcc-24eae806cdb2@linux.intel.com>
From: Jason Ling <jasonling@google.com>
Date: Thu, 6 Aug 2020 15:52:50 -0700
Message-ID: <CAHBbfcUXLueZ3MZAP9b38B-fXyrNCMAeZcC7uk8uPrR5gw=3xQ@mail.gmail.com>
Subject: Re: dbus-sensors:hwmontemp: additional attribute proposal
To: James Feist <james.feist@linux.intel.com>
Content-Type: multipart/alternative; boundary="0000000000003b1f3005ac3d5baa"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000003b1f3005ac3d5baa
Content-Type: text/plain; charset="UTF-8"

Assuming that you mean "Omit Name attribute from the sensor configuration
definition and then change hwmontemp to require any Name.*"
This won't work since Entity-Manager requires Name (tried it,
entity-manager does indeed complain about not finding name).

My rationale for an omit list vs permit list
(1) if it's a permit list then everytime you add another temp you want to
monitor you need to add to this list..if you want to drop a temp then you
have to modify the list again.
(2) General assumption is that the primary use case is to display all named
temperatures which means a permit list is typically large
(3) adding a permit list also breaks all existing code. Everyone has to go
back into their json config and add all the sensor values to the list.

My rationale for using the value for the "Name" attribute rather than
labels or referencing sysfs attributes
(1) Looking at just the config , it's obvious as to what you're omitting.
(2) If it's label base, a label change in a driver would mean a breakage in
the userspace daemon. Not a big deal; but it can be annoying.
(3) if it's sysfs attribute based then it's my opinion that it's not as
readable.

--0000000000003b1f3005ac3d5baa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Assuming that you mean &quot;Omit Name attribute from=
 the sensor configuration definition and then change hwmontemp to require a=
ny Name.*&quot;</div><div>This won&#39;t work since Entity-Manager requires=
 Name (tried it, entity-manager does indeed complain about not finding name=
).</div><div><br></div><div>My rationale for an omit list vs permit list</d=
iv><div>(1) if it&#39;s a permit list then everytime=C2=A0you add another t=
emp you want to monitor you need to add to this list..if you want to drop a=
 temp then you have to modify the list again.</div><div>(2) General assumpt=
ion is that the primary use case is to display all named temperatures which=
 means a permit list is typically large</div><div>(3) adding a permit list =
also breaks all existing code. Everyone has to go back into their json conf=
ig and add all the sensor values to the list.</div><div><br></div><div>My r=
ationale for using the value for the &quot;Name&quot; attribute rather than=
 labels or referencing sysfs attributes</div><div>(1) Looking at just the c=
onfig , it&#39;s obvious as to what you&#39;re omitting.</div><div>(2) If i=
t&#39;s label base, a label change in a driver would mean a breakage in the=
 userspace daemon. Not a big deal; but it can be annoying.</div><div>(3) if=
 it&#39;s sysfs attribute based then it&#39;s my opinion that it&#39;s not =
as readable.</div><div><br></div><div><br></div></div>

--0000000000003b1f3005ac3d5baa--
