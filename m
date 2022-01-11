Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B7948A9F2
	for <lists+openbmc@lfdr.de>; Tue, 11 Jan 2022 09:55:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JY4Kg6scQz305L
	for <lists+openbmc@lfdr.de>; Tue, 11 Jan 2022 19:55:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gKrrAhLs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129;
 helo=mail-lf1-x129.google.com; envelope-from=hughsient@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gKrrAhLs; dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JY4KH5nvdz2xCM
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jan 2022 19:55:29 +1100 (AEDT)
Received: by mail-lf1-x129.google.com with SMTP id m1so20548657lfq.4
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jan 2022 00:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JlTD00xKR6MImsJoPfATIgAM6UVnvrLR6d0hk6wPYgo=;
 b=gKrrAhLs0RPY/mzmw9g5KwWf8d/fPi6obazBo8S97wqEzoMLJ1EWbP2Sc3aGLDmzev
 2LYrhtcR8VrcVwG9R+vxyQ8r5ToOWy+WnMTZjBarZVIH+be33PzQIJ/eLNiukArQBNc8
 CTAVP17IUsnkmj4ZlaeV36KyCgKcvqcfs5VroDhTDGnD/1rWHAmBqnvdM5PY7U7pkIwE
 LyPeNXBL5TEgATxV5z6TooxJkt8MZrwZiS+0zUH53xk91rnKBF121yr2gt3M28BrHTIt
 cau5CXEZIexCFlIsKFrmHeurBxcX2Cnbj6zG9V8QYyqyO7ExX9Y7+QPwzj1tpokofm4t
 lCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JlTD00xKR6MImsJoPfATIgAM6UVnvrLR6d0hk6wPYgo=;
 b=tsHZ/4j/feb8u73d7x6ctZb3ylyGHlmjDM67e99zKmGnsxqV53h/UOCHZKLFYlHLAm
 /b9xubu1kgWN4oOAoAPfIFSFIiyCSIzdRV/khO6OqvCpiBaRYCmdzb5ZC6xIGfakRus+
 hUKctNrgCc2UVHQpPhiQ4kj5s9Ln441ObKUIZFvK9mQrQTqwe86SoMpUYzlRUNmkyHWK
 3fMIfg7cvZjtxd5vabxA8YU29W6P/s1Qf8+YRhyUvUZJdiIpR4BPpTt2DeGAH530sU2P
 1zBpLahw6lwDkOeD3IYGOBXTeTA1uCBrorczMdSU1BQlXk08ZPIDNbUeXAGXgEq+0ILQ
 WR/A==
X-Gm-Message-State: AOAM530OcdAC9ACmP6m9Y7b/c3hWf5KkgAKmmVl80QbryMmOUrMaL4N/
 4WI3Fwow2Go2CkPNX44knL6/ZZXMkdrjnN4NgjE=
X-Google-Smtp-Source: ABdhPJz1XhXisosRXNFYt+tFWIwI74yiXs7IAX4NmZJ2wTu7Xjj1JToUZOb0wINht7oVokReTRmXH0DlWwXBoJV0HnU=
X-Received: by 2002:a05:651c:a0f:: with SMTP id
 k15mr2197701ljq.315.1641891325853; 
 Tue, 11 Jan 2022 00:55:25 -0800 (PST)
MIME-Version: 1.0
References: <MW4PR21MB19228AA5DAFEB23F82372330B0519@MW4PR21MB1922.namprd21.prod.outlook.com>
In-Reply-To: <MW4PR21MB19228AA5DAFEB23F82372330B0519@MW4PR21MB1922.namprd21.prod.outlook.com>
From: Richard Hughes <hughsient@gmail.com>
Date: Tue, 11 Jan 2022 08:55:12 +0000
Message-ID: <CAD2FfiHK5xynW+Jyguxsaxidt69mVnbDN9vEpYAUp9i8jO1=_A@mail.gmail.com>
Subject: Re: Firmware update for auxiliary components
To: Derek Mantey <derekma@microsoft.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 11 Jan 2022 at 01:31, Derek Mantey <derekma@microsoft.com> wrote:
> I tried to pull the changes in but ran into some build issues.

Ohh? If you share them I might be able to help. I know fwpud is quite
aggressive with some of it's deps, but they should be all up to date
in oe-meta.

> could you tell me a little more about the interfaces that the fwupd uses?

No problem; but I suspect the answer is "all of them" :)

>  Is it searching the device tree for devices that it can update?  Is it searching the busses directly?  Or is there a way to give hints for devices to update?

It does all of those things. In general, a "plugin" in fwupd just knows how to:

 * enumerate (discover) the device, e.g. looking at the ESRT, looking
at files in /sys, using udev to find a device, or claiming an
interface on a USB device
 * Install a blob of firmware on that device node
 * (optionally) switch the device into, and out-of bootloader mode

There's quite a lot more, but it's all basically optional -- there's a
little tutorial available here:
https://fwupd.github.io/libfwupdplugin/tutorial.html

In reality, the best way to see how it all works is to look at the
code, for instance,
https://github.com/fwupd/fwupd/blob/main/plugins/nvme/fu-nvme-device.c
is <500 lines on how to properly enumerate and update a NVMe drive.

> For example, we have a CPLD on our board (see the Open Compute DC-SCM spec).  We don't currently have that listed in our device tree as it is just sitting on a generic SPI bus.

The best way is to make it discoverable, as you don't need to add a
quirk file for each of the system boards that you want to support,
e.g. put it in an ACPI table or DT somewhere. If that's not possible,
you can add a "quirk" to fwupd to say "for this hardware do this",
e.g. https://github.com/fwupd/fwupd/blob/main/plugins/superio/superio.quirk#L55
although this isn't awesome as you have to update fwupd every time you
have a new board to support. Ideally you could ask an embedded
controller somewhere "what CPLDs are connected" and get back all the
data you need.

Richard
