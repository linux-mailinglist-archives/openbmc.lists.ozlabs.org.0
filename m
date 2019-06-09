Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDA43AAE7
	for <lists+openbmc@lfdr.de>; Sun,  9 Jun 2019 19:29:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45MNY46LR0zDqNr
	for <lists+openbmc@lfdr.de>; Mon, 10 Jun 2019 03:29:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::731; helo=mail-qk1-x731.google.com;
 envelope-from=simon.d.barber@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="m5Ix+Kky"; 
 dkim-atps=neutral
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45MNXT45cfzDqFF
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jun 2019 03:28:37 +1000 (AEST)
Received: by mail-qk1-x731.google.com with SMTP id t8so613967qkt.1
 for <openbmc@lists.ozlabs.org>; Sun, 09 Jun 2019 10:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=wDoM3wdIddbshNwT2rdKVLfE4gLoet5oCP5Y5NOUr1s=;
 b=m5Ix+KkyLV87hxx/L3kgLOz2S0Bfub4eyTXetM0iTiHCsdHJ/6lrHXILXlJlWPt7Ck
 426XQImj2fFdn551njLf2JKzhPRcyT5W05y4ytkZJueKBvPaBAeiafkfT4JoalMAMuOg
 ug/w/rGCKQBcATrOs5Z7Kq9Ge0pnF3pRJ54a3l+t9ZVRKe6zt3ETdajFD+muWqJurkQq
 AdZrJb7NEdHV5BAsOrBUI7wfNCcuiGFMZvLD2R4bzmANJUnj7hgNaxIAVurziiBg8gAT
 YAlebNyhjgyAsyDjcUrU7mRShnouuyccBE5Dthur+tb6h3NPg8kidGZpxJffgZ+Qr+eM
 5itQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=wDoM3wdIddbshNwT2rdKVLfE4gLoet5oCP5Y5NOUr1s=;
 b=oHKExnEEG91rRDm6kmTZq6/00VnfVbYxsB6kIBXCFpF0RX9kXmGmzGYoLHrzcgZuvd
 tjd798KwDsffxw0bHxkVMvL4PYMn3LXtO+HAlePZyLtP0AfIqikwGF4HgE/yhLCuC4tk
 8zauwxL1GSEGxC/50M3eKDLhoZcEh03yJl59QWaYLG6FJXt4VUShL6Go+OUiL5MaqWUr
 AN0770G+rvvv/Am3oHSuPrskbKGwUVkV0YAgqDevbbxX81wCxPLy9CaiZut4G5MNwm+1
 8hNQVFTo3da/rbp/m+OEyHx7cPo0pdA06lhhbLLOVegN9C+cA/iV4PblD8lgB7H4jfnT
 HrAA==
X-Gm-Message-State: APjAAAV1gXegZLmzg058Q3/572I48aE+Ubg96e4/On2Foa5cDZ3pUj1v
 YIQw/RNB9MFkq8R+i7KRpqCxnom+smgqpRHzzVst8IKR
X-Google-Smtp-Source: APXvYqxStYZUImp8Rqludg7+lLz+L/9AISF0kAax48GKuuFEVxTovy+cFwAkxDsP8zFljQW1MsP4IPVv+qaLVI1gZFk=
X-Received: by 2002:a37:9a4d:: with SMTP id c74mr52998426qke.123.1560101313977; 
 Sun, 09 Jun 2019 10:28:33 -0700 (PDT)
MIME-Version: 1.0
From: Simon Barber <simon.d.barber@gmail.com>
Date: Sun, 9 Jun 2019 18:28:22 +0100
Message-ID: <CAJQj_PoNcJPQcT_uG9vN4nsi2512_xcjA5Oput+=xE2Ragqt6Q@mail.gmail.com>
Subject: stable image archive
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000a2220c058ae76467"
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

--000000000000a2220c058ae76467
Content-Type: text/plain; charset="UTF-8"

Is there an archive  of stable built and released images for openbmc ? As
part of my masters project I would like to run some pen tests against the
the image, to compare with other BMCs out and in use.

If  there is no stable release archive   is ipmi tool built as part of the
palmetto build, I can find reference to a set of diffs to add it to the
build, but there has been a restructure since then, and so the diffs dont
patch cleanly and i dont understand the structure enough yet to resolve the
conflicts., so do I need to build the sdk and then download and build
openbmc/ipmitool


Thanks.

Simon

--000000000000a2220c058ae76467
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Is there an archive=C2=A0 of stable built=
 and released images for openbmc ? As part of my masters project I would li=
ke to run some pen tests against the the image, to compare with other BMCs =
out and in use.<br><br>If=C2=A0 there is no stable release archive=C2=A0=C2=
=A0 is ipmi tool built as part of the palmetto build, I can find reference =
to a set of diffs to add it to the build, but there has been a restructure =
since then, and so the diffs dont patch cleanly and i dont understand the s=
tructure enough yet to resolve the conflicts., so do I need to build the sd=
k and then download and build openbmc/ipmitool<br><br><br>Thanks.<br><br>Si=
mon<br></div></div>

--000000000000a2220c058ae76467--
