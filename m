Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F3060166A42
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2020 23:18:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Nprg2n4KzDqWL
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2020 09:18:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::232;
 helo=mail-oi1-x232.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=g6Q8pyTA; dkim-atps=neutral
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Npr10NbBzDqWH
 for <openbmc@lists.ozlabs.org>; Fri, 21 Feb 2020 09:17:52 +1100 (AEDT)
Received: by mail-oi1-x232.google.com with SMTP id i1so29180969oie.8
 for <openbmc@lists.ozlabs.org>; Thu, 20 Feb 2020 14:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:date:references
 :to:in-reply-to:message-id;
 bh=6GzEX3UflRMiFNIZaEgntoXM9niIFw8DvOBPlf6qWu4=;
 b=g6Q8pyTA7taTpulpJCat6LrpEBYluusG5lAjIoF2swt6+kHAyx3qexfuVZi/diQZSE
 vlCyBuEE9WNq8pu3QAXoMS9IfO1K72jPg8J8i60pTZ/Xd7f8lUSHFxaPb3rZQQpWly2s
 fH2RyQ+oj7CXuhk+TFalGqYhhSikQKtKllbVR32/R5IKXDoWxdhNZoeBZJOzeKkywjXw
 r7ebUFEmf/NM5y+CIJHUdm3xBhioJjTxMnwSBepFqgHdOWpakZ3pwD1Iz9Z0z1p+HJNB
 oI/2/NBIeHGwcKePBPNraJ4MrkyFTjofmRfex5B+p4zjs7Ad+AHmH+1FcrwURmjbnG9e
 kWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:date:references:to:in-reply-to:message-id;
 bh=6GzEX3UflRMiFNIZaEgntoXM9niIFw8DvOBPlf6qWu4=;
 b=OPxml9Bpp/99lmxmy0fFI8+958zOKrMYV2ESjagT/i10muTrQHCrSP7klz6OPWJU/D
 nMYTUMqBDxETCz0vuTyis6F3mbcueph55mdPfwuuFYOSvhEsZr//8o/Arh/snb5iOr81
 kp6l9zKvwqgPWZ5T3aOKJnplrrIHpRV6t+alC0CrZS3KBND1f1NzsRA2BJf3/8H8jCbP
 4YtKTuKa1kJjpE2JzFMHXAR6mQWG1NaJeliNourcHBzlh7PMFN2FROx2v77Lf7Y4Wkug
 HEMCYZknGfMduMDZpcik27Y+2xpsB/BW6T5gNln7nLxEE8c9ne0liKSWObrE5T3d7MBV
 I+Zw==
X-Gm-Message-State: APjAAAWSuP1a3x2xGqIOA29Dr3akL4CrkghTLUoRh5lE7icH6k4C1FrC
 qfwzW2XZSWRQpMoHp2d+jkER7sSqJNc=
X-Google-Smtp-Source: APXvYqzlljeM+I3ElSSNtFwP3cuxVZzKdGBVRPyjDXxX9Tg3W3ksBw5WbOoP7U+FhSVbvBIu9u9hbQ==
X-Received: by 2002:aca:acc4:: with SMTP id v187mr3808890oie.130.1582237068648; 
 Thu, 20 Feb 2020 14:17:48 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:8cd4:a5aa:a5cb:f899])
 by smtp.gmail.com with ESMTPSA id n64sm295417otn.35.2020.02.20.14.17.47
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Feb 2020 14:17:48 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: termination on hardware errors
Date: Thu, 20 Feb 2020 16:17:47 -0600
References: <6FBB6835-036E-4495-B28B-44D1210294DD@gmail.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
In-Reply-To: <6FBB6835-036E-4495-B28B-44D1210294DD@gmail.com>
Message-Id: <22F340D0-D82C-4569-93FA-02653A1118C3@gmail.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
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

For those interested, which measured by the response to this email, =
there
are tons of, here=E2=80=99s a link to the design doc :)

https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/29603

> On Feb 18, 2020, at 10:24 AM, Andrew Geissler <geissonator@gmail.com> =
wrote:
>=20
> We have a requirement from our manufacturing team that they be able to =
configure
> the BMC to fail the boot of a system if any error log is generated =
that calls
> out a piece of hardware. The idea being that if the firmware finds any =
issue
> with the hardware, manufacturing wants the system to halt and provide =
a clear
> indication of what that failure is so they can fix it prior to =
shipping the
> system.
>=20
> High level this will probably be a phosphor-settings field that =
phosphor-logging
> code would query when it gets an error log that has a inventory path =
in it.
> I'd like an external state to indicate when this event occurs. Maybe a =
new
> BMC state like Quiesce? (Quiesce is used by host when it is in fail =
state
> and has an easy mapping to the corresponding Redfish Quiesce)
>=20
> This is just a feeler email to see if anyone else has an interest in =
this type
> of function or if they have other ideas on how to fulfill this =
requirement.
>=20
> Andrew

