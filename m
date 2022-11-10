Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5419F624C49
	for <lists+openbmc@lfdr.de>; Thu, 10 Nov 2022 21:59:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7Z3J1pn1z3cH9
	for <lists+openbmc@lfdr.de>; Fri, 11 Nov 2022 07:59:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=USATO2P5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com; envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=USATO2P5;
	dkim-atps=neutral
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7Z2h19Sjz3cH9
	for <openbmc@lists.ozlabs.org>; Fri, 11 Nov 2022 07:59:22 +1100 (AEDT)
Received: by mail-oi1-x22f.google.com with SMTP id q186so3101159oia.9
        for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2022 12:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=i8Lto0vgEGPzLq5ot3LFC/V5FjCWSnGWGWVArQyfLsU=;
        b=USATO2P5v5EfdQnFs5ha5C8R9kLoA8Z8PzUHb6nBkdWOTcwQE6TYmQ0QfMPCbI7tX7
         Gg+Xaz+Qq+oT5aYxbFV2xno8bV2Z5p+4ZFJu7yZze4qNR8082cugVIxO6MKygj+NhrbR
         GPWdOcxz2c0Whk7KEgDJkygthmWl0I5OCd9VGpr/Wf+W3gTrwqevX5JxH0cagdru2cF3
         X/lz5LSo/TUaLJi2bI/kz/bBP1z4Z8HIXQYckIzlc0feqWqH9Oj6XyPsKh6KB9eND7kW
         dOPZY9EPFuZl1rZ+qJav1yyeYl2b8Cd3ZlDekZQqgpExc7aIB6nK7z5RTTuVAS5CARhh
         VpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i8Lto0vgEGPzLq5ot3LFC/V5FjCWSnGWGWVArQyfLsU=;
        b=CkYue8IFOWQeAVq2BfecWFYbu7+WEkHfM2JHpQqouCzQ34grPREzBcXzgUHjtX1fnL
         YU6h+s7WqCwEMH+UqfY8HXvs1Ep2RaoF+EI/4P1N4bzdUO7qBZfI8UhzUTffjuOjwQA+
         lpr8fvJKZF4pYvdovIt+ALxBwLpLot/N1wRneaLVO6iMaFAsLXdCVcE84lALP8TcGrrP
         lLDO66f+dcKuGOE03VaL5I5xhYiTLMSsxru9e6s+udhh3JYlkFN7sP96VENuN19UzQ/l
         LaGKtsxZNbB07Mq+75sjtUcwcBdvKqAF965yAB5/kut+3dEXK9GhriqfTqF/IpSfbTyT
         eIDg==
X-Gm-Message-State: ACrzQf0DSeE9OI2o2PLxVhNlHnmkY1Cm5jbl0fensxlEtTQ6TwIL5Hey
	VVKmCopRjNWZzHVnc4uunvk9047H6CE=
X-Google-Smtp-Source: AMsMyM6g4T6vCsjp/pCvYg6XgRB79XPfJpKaOixnoF5I+XlAMFw9dt0ayXx+IkzYATvrKQTkuw1ZGQ==
X-Received: by 2002:a05:6808:152:b0:35a:3da7:e8ce with SMTP id h18-20020a056808015200b0035a3da7e8cemr1873274oie.190.1668113957451;
        Thu, 10 Nov 2022 12:59:17 -0800 (PST)
Received: from smtpclient.apple ([136.49.194.28])
        by smtp.gmail.com with ESMTPSA id k4-20020a05680808c400b0035a534b9237sm192819oij.29.2022.11.10.12.59.17
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Nov 2022 12:59:17 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: obmc-op-control-power_git.bb refactoring
Message-Id: <73130EC5-5B2A-4E79-9AAD-88D26C61D71F@gmail.com>
Date: Thu, 10 Nov 2022 14:59:16 -0600
To: OpenBMC List <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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

Some recent phosphor-state-manager (PSM) feedback indicated quite a bit =
of
confusion with the services involved in powering on and off the chassis. =
And
I'll have to admit, after getting to explain it in discord, it is a bit
confusing.

The PSM repository defines the needed systemd targets for PSM to =
function and
the generic services that could be applicable to any system. System =
specific
services are hosted in machine-specific layers and loaded into the =
appropriate
systemd targets as needed.

There are however a series of generic services for powering on/off the =
chassis
that are hosted outside[1] of PSM.

What makes these services especially confusing is that they are under a =
recipe
indicating they are only for openpower machines (op) but in reality they =
mostly
just operate against a generic d-bus object, =
/org/openbmc/control/power%i.

There are two options for supporting /org/openbmc/control/power%i, =
either
utilizing the old skeleton repo[2] or the new phosphor-power =
implementation.
We definitely want to continue to push people away from our skeleton =
repo (I'm
pretty sure that this op-pwrctl part of skeleton is the last one being =
used) but
I'm not looking to tackle that here.

What I would like to do is get the generic services that are not tied to =
any
specific chassis poweron implementation out of this[3] recipe and into =
PSM. I'd
also like to rename the service files and rename the recipe to remove =
the
"op" references.

Here's what I'm thinking:

Move these services to PSM and rename them as follows:
- op-power-start@.service -> phosphor-power-start@.service
- op-power-stop@.service -> phosphor-power-stop@.service
- op-powered-off@.service -> phosphor-powered-off@.service
- op-reset-chassis-on@.service -> phosphor-reset-chassis-on@.service

Leave in current location but rename (these rely on code from the =
skeleton repo):
- op-wait-power-off@.service -> phosphor-wait-power-off@.service
- op-wait-power-on@.service -> phosphor-wait-power-on@.service
- obmc-op-control-power_git.bb -> phosphor-skeleton-control-power_git.bb

I'd like the "skeleton" in the recipe name to hopefully keep people away =
from it
and remind ourselves to get rid of it at some point.

Thoughts or comments?
Andrew

[1]: =
https://github.com/openbmc/openbmc/tree/master/meta-phosphor/recipes-phosp=
hor/chassis/obmc-op-control-power
[2]: https://github.com/openbmc/skeleton/tree/master/op-pwrctl
[3]: =
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-phosp=
hor/chassis/obmc-op-control-power_git.bb=
