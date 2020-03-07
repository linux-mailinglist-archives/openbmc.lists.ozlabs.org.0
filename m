Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6368317C977
	for <lists+openbmc@lfdr.de>; Sat,  7 Mar 2020 01:12:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Z4g649qFzDr5Y
	for <lists+openbmc@lfdr.de>; Sat,  7 Mar 2020 11:12:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.68; helo=mail-lf1-f68.google.com;
 envelope-from=obmc.developers@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Z4fM5ys4zDqwD
 for <openbmc@lists.ozlabs.org>; Sat,  7 Mar 2020 11:11:34 +1100 (AEDT)
Received: by mail-lf1-f68.google.com with SMTP id z9so3300798lfa.2
 for <openbmc@lists.ozlabs.org>; Fri, 06 Mar 2020 16:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=fsxnkijc+qcIQtctaQNczrdJE+7DJXU4L2q5d/iWa5c=;
 b=jZAwLTT4OUR5wBIHpa27DVDmAKgPCxfZKW6NVSoU1pBWqW/6YtNjjPbxn7rV2gpha3
 lnTNTSgROMwghVmWctt7YquegY9bnS6+mZukY3r/hJ2+BMLM+Gx1q92oO7jDuPn6Y2Lv
 1eQ3muRKlWm7s4BJd62S2l5fW65DpZuv2Urz9/GZHLmEcDbbdoeiZ+/Gem57CANbA7G8
 9faezig5f5szTwO/rqyAbtrfm0kXb8l+RasJDKL6d7hWMJ8mR2j3ldkugLPEPHwRec3P
 ycPOECU16J2f4srWcc2ozEJiWBujrfXjpyqrCvicFzXCraWXRJ0I6JldLGqo0V7P42Su
 e81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=fsxnkijc+qcIQtctaQNczrdJE+7DJXU4L2q5d/iWa5c=;
 b=A3Uoqf/Kee4MGq/4w5P5srG4BkzIbmciidLm61x5CcQjkPRvDVa+hPgcZMddASpAyT
 A4rQSfKfNs/m8XVJJ4tGVGH4fcDYXIiaZ545VkOpkhR0O21eZDrGDpg238VADyogsm+3
 2wHfXZoq5VlsGvTm/ADHAzJ4cRoAVBqUNCcHVXpata9QSc/LHOlLxv1AOOz6YlQewjMT
 nFar2wynQ6/G71iHLCQPj0+qDsGPmzCl4d7n7p3hQ69evSJz/kVAfZXXXgaRmnl28RKr
 rKCe6jFQLSKh1kTZAjpH3Sue+txx5eUy65Dy3GVW86HR8CAmo1vhHYYck244Fi2d1a/5
 U0XQ==
X-Gm-Message-State: ANhLgQ2II0aBwZAlP+REJllhj+lNkJhuuwgg0jasBYAMyO0Z5EhTL8pb
 YsGYQv0Giqfw4GONPRZY8ILHPuuueDfEWcTJEgghI+nQjdk=
X-Google-Smtp-Source: ADFU+vtpSkdPAtbAJMAHX48kgUzqYcskk2RKkpzcseb2pkuPJ78KL1ONfONu2GNjNkSdb9+viERQhp+4wN1tECf1mkk=
X-Received: by 2002:ac2:5e7b:: with SMTP id a27mr3302455lfr.61.1583539828598; 
 Fri, 06 Mar 2020 16:10:28 -0800 (PST)
MIME-Version: 1.0
From: Anony Mous <obmc.developers@gmail.com>
Date: Fri, 6 Mar 2020 16:07:52 -0800
Message-ID: <CABbLDjM5uw6Ug7hkc-m904Uf=2b+-B5wdnrBjOCOGGUmeXpXYQ@mail.gmail.com>
Subject: SDR, SEL, FRU Question
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000f8acda05a0389889"
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

--000000000000f8acda05a0389889
Content-Type: text/plain; charset="UTF-8"

To whom it may concern,

Where is the SDR (Sensor Data Record) repository (or SDR files), FRU (Field
Replaceable Units) files, and the SEL (System Event Log) files located with
respect to the BMC chip (AST2500)? Are they located on the BMC's local
memory (if any exists)? Or are they located on a memory/flash connected to
the BMC on the system? And how can you control where the SDR, FRU and SEL
files are stored at?

--000000000000f8acda05a0389889
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>To whom it may concern,</div><div><br></div>Where is =
the SDR (Sensor Data Record) repository (or SDR files), FRU (Field Replacea=
ble Units) files, and the SEL (System Event Log) files located with respect=
 to the BMC chip (AST2500)? Are they located on the BMC&#39;s local memory =
(if any exists)? Or are they located on a memory/flash connected to the BMC=
 on the system? And how can you control where the SDR, FRU and SEL files ar=
e stored at?</div>

--000000000000f8acda05a0389889--
