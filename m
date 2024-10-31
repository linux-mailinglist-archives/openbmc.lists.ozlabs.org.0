Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 396339B757E
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2024 08:38:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XfG7J1Jy9z3byZ
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2024 18:38:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730360281;
	cv=none; b=miHEFRlFP1vWc5licuJVQAJDcLcZG9yK9+NWlh6AzPtCPHFWZPy422ZZaNKlVY8v2U1McHpx6e5OpZyTB9ot8Zf4l6f5a/L5ogQs9gTfCYwwj1rRpvEvslJ7zFxgsdI0KRnCxd6JrA8aOm9V4s5LYdLFCtrAmeUvKt2BgrizaYzllbTkSUgxPY7kePuLpD8i3TXgGEygeXfGr3ffrBfg1ZLxhtb+l6qgX2ZRKr7Qi/gEoDhvsrf/OVtuhXHkreEizUMCjEmm2pIVYGZkgwV54rBJwiN2fjtDJJiGiKyDj+URTmN3kTVm70kdUYWS5n4gykdYsQOEXsfzgwdEIndlRg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730360281; c=relaxed/relaxed;
	bh=EY8ssbqoQrNdWtnGuaVr0dDKDxoRsP7U5BLhdMX6Kh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XBxU3zbHehwbzMZ0iYxnOjJ0sxJHN3BtqknnK/vieCoBOHj+CkiezAru/cGN+CDC3rs/3BYZ5VWsQJuQHzgPRcPMQrfddyEkNpVUMPmZnSilwxrdLCa69103zq0ysjprOaQOkVxrf+nwwf/PSAQwRCqgfOiS2VGO0vosUArie2FECYlfHO6LDPmwCvlQpKX6yDmatRzho8zLNHr+5U0OiKAQLkh/2q0qK3tFbspl7bf0AInGgDBQiL0B7y9Lp9Z4VXxorAtjxO8vucpqgLpKI6JOL1NnkF0snAPuyTxvFGB4R7U0D+pb0tt8gBLiEoHm1bwUoi+dSWoTqKfQdvwCKg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=hdfMuWoc; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=yulei.sh@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=hdfMuWoc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=yulei.sh@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XfG7B1BKTz2yN8
	for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2024 18:37:56 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-720b2d8bb8dso457898b3a.1
        for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2024 00:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1730360273; x=1730965073; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EY8ssbqoQrNdWtnGuaVr0dDKDxoRsP7U5BLhdMX6Kh8=;
        b=hdfMuWocrI4HdKVnARsF4K/2DXG+qpu84HXui/E/4FBZ85AEAJSUC75Qy2npDA2arh
         keYE/0dC1+g3modH+0dHRzuxYItqcVEnEFe6S72YAbNInDXI7GzdNPBp7r6iFF7oySWm
         GmAOONx70t/wbY7fUnUiD1bL119euB5IIDtLP8tQEnsYDpHCIr2HRD0tFgklN7dsU94x
         QAaajhA4Bb8bqWgU9/93AHwlVdiw5koLO/kslN5E2fCpHO9LcUa1Gy3RhQNInI/2zb6H
         8EPu29mxyQWSchKjovy7qHeTgCohllVWB+JU6Lx0sewYNCYR7PbCFB2ra4ge9uW52MUI
         McBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730360273; x=1730965073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EY8ssbqoQrNdWtnGuaVr0dDKDxoRsP7U5BLhdMX6Kh8=;
        b=oF1HQ9SiYg9buLSA1iZ5TpUKvyYOydPmgKIQA6eKB7cDuMN3qptzGC8Xli5HtGOQfU
         fmhUh9fiHfGoeEy0kZMYub/SwWoLoVhuZDkm0B7Na8zxGRwmo0H118elpq/xLEP9nYls
         pDCrrawpIV1JICqypV0SaGGV4YINy06raNlvtZmXyZ30du3k86ZBM5fUM0iHfdbrXslT
         p2zc3iWea9GAUAQ+ONkW6eBVMxqIW065pN2a1a3MI60KACyvK1OIFup3NrxXriyINCAD
         KD/m9nIQS8cFMJOfyTMxH+czM6DOtyAabqdGK1PDgWto183GIC+/j8otasy5mMw9/GZH
         DHJw==
X-Gm-Message-State: AOJu0YxkDGh5g7akznrmpfLo4XkiTMDChiV5T8mrUosjh5k+OszNytSK
	Ct4RQjv6pz1Ii4PO9GUgON67+NOP1OedcFqxbw23FGj/3epmpbiA+3lY+xLpGZE9xEz6+JvpF9H
	0RPEn7ndsBAUMOjc36xIJ/63E4HafLwWKjGil0r/Xk/dwp/iTG0o=
X-Google-Smtp-Source: AGHT+IFdopUeUb1nySy5u78Nq9irKe1t56n6bp2ujjKc7iQDcac6sjNOZfWO66zmGmYTCBDa05Thb1/LR4x3QSZQhGU=
X-Received: by 2002:a05:6a00:4fcc:b0:71e:6046:87c2 with SMTP id
 d2e1a72fcca58-7206305a0a3mr22970574b3a.26.1730360273386; Thu, 31 Oct 2024
 00:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm54UE4SXfY30oUrr9vVa+=j_Ra971A7ZcBMyMN2TgTaXN8+w@mail.gmail.com>
 <ZyL-ZiXm1c-vozbh@heinlein.vulture-banana.ts.net>
In-Reply-To: <ZyL-ZiXm1c-vozbh@heinlein.vulture-banana.ts.net>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Thu, 31 Oct 2024 15:37:41 +0800
Message-ID: <CAGm54UEGs-tw=i=W78orPQAW-wmZHU2yW6EndP5RucHhdz6DQw@mail.gmail.com>
Subject: Re: mapper: should it add "default interfaces" and is it valid to
 implement no interfaces on an object?
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

On Thu, Oct 31, 2024 at 11:50=E2=80=AFAM Patrick Williams <patrick@stwcx.xy=
z> wrote:
>
> On Wed, Oct 30, 2024 at 03:00:01PM +0800, Lei Yu wrote:
>
> Based on the info from Matt, answering these questions.
>
> > So here are the questions:
> > 1. How to explain the above behavior of "D-Bus calls on default
> > interfaces", especially for 2 & 3?
>
> #2 seems like a bug in mapper?  When I run this on a sample from systemd
> I get good results:
>
> ```
> $ busctl --user call org.freedesktop.systemd1 /org/freedesktop/systemd1/u=
nit org.freedesktop.DBus.Properties GetAll s org.freedesktop.DBus.Propertie=
s
> a{sv} 0
> ```

Yup, on objects created by mapper for association, I get this error:
```
# busctl call xyz.openbmc_project.ObjectMapper
/xyz/openbmc_project/software/c172a378 org.freedesktop.DBus.Properties
GetAll s org.freedesktop.DBus.Properties
Call failed: Unknown object '/xyz/openbmc_project/software/c172a378'.
```
I do not know how to fix this in mapper though.

>
> > 2. Should mapper add "default interfaces" for all the objects and
> > their parents? If yes, it adds extra interfaces that are not
> > implemented; If no, it misses some interfaces that an object really
> > implements.
>
> I don't know that it is adding "default interfaces" really.  This code
> you linked to seems to be "assume these default interfaces will exist
> because they are a requirement of dbus".  The code appears to be an
> optimization to be able to advertise the path (and contained objects)
> before the bus introspection is complete.
>
> So, I think this is valid, isn't it?
>
> > 3. Is it valid for a D-Bus service to implement no interfaces on an obj=
ect?
>
> It appears that "no interfaces" isn't a thing.  "no interfaces other
> than the 3" is a thing.
>
> I'm not finding explicitly in the dbus specification[1] where Peer,
> Introspectable, and Properties are required (except that it is perhaps
> implied by the discussion about the Message Bus itself).  sd-bus appears
> to always add these though (you can find multiple references in the
> code)[2].
>
> Interestingly, another application I have running (Spotify) does *not*
> always have these 3 interfaces.  They're obviously using a different
> dbus library than sd-bus:
>
> ```
> $ busctl --user introspect org.mpris.MediaPlayer2.spotify /org/ayatana/No=
tificationItem
> NAME TYPE SIGNATURE RESULT/VALUE FLAGS
> $ busctl --user introspect org.mpris.MediaPlayer2.spotify /org/ayatana/No=
tificationItem/spotify_client
> NAME                                TYPE      SIGNATURE RESULT/VALUE     =
                        FLAGS
> org.freedesktop.DBus.Introspectable interface -         -                =
                        -
> ...
> ```
>
> So, the "assumption" that mapper has is perhaps only valid for sd-bus
> and not for other dbus libraries.

Then how do you think about mapper? Should we keep the current "assumption"=
?
I want to keep mapper's current behavior, but filter the default
interfaces in bmcweb
(https://gerrit.openbmc.org/c/openbmc/bmcweb/+/74593), which is a
smaller change and does not break anything, and the "default
interfaces" do not provide any properties anyway.

>
> [1]: https://dbus.freedesktop.org/doc/dbus-specification.html
> [2]: https://github.com/systemd/systemd/blob/6e492ae98abd9500a4310653dec0=
c3fced66c7da/src/libsystemd/sd-bus/bus-objects.c#L2472
>
> --
> Patrick Williams


--=20
BRs,
Lei YU
