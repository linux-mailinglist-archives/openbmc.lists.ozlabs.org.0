Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BD62868C
	for <lists+openbmc@lfdr.de>; Thu, 23 May 2019 21:15:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458zj25nkVzDqZb
	for <lists+openbmc@lfdr.de>; Fri, 24 May 2019 05:15:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::82a; helo=mail-qt1-x82a.google.com;
 envelope-from=yoshiemuranaka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="krw0lDBl"; 
 dkim-atps=neutral
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458zhQ2ymYzDqWC
 for <openbmc@lists.ozlabs.org>; Fri, 24 May 2019 05:14:26 +1000 (AEST)
Received: by mail-qt1-x82a.google.com with SMTP id z5so1747388qtb.0
 for <openbmc@lists.ozlabs.org>; Thu, 23 May 2019 12:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Bbv2VnruS5SVK5+jOuNpOHlfXyiAfyPg/dHBeY8hm+U=;
 b=krw0lDBlSo46I+IU4m/7UKyxQI8euAhj9dk3Wt+oDZsliZd3XP6omA+pFKkEOyJgFc
 MhP1+xZ0Xre29kUCiC2xxqz9o3sdgNxKX0D+IcE+r8ySikybMaQbQPWqQeDOPsrqtkDG
 JgCLN9ucSDzRDQ4yK6NkNK+nkL5TPpO+OZDKd9qmGC04fyPKTbpw3hddTeAO9oZOfT8C
 vojLDlbAvu9BHPyLEIQqv+q5OnBdfGH6Zw0UrtG99g38q5t7Ev5rq9HyaRj8arBvEGfm
 bLSo6tqs1voVjAH4lzPPQjJkPh19G2tFtT6naMLuVmQvEoPMPKEywWaSMa7z5jhnLbBm
 +vYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Bbv2VnruS5SVK5+jOuNpOHlfXyiAfyPg/dHBeY8hm+U=;
 b=qXN78V1EBzV5/DveFREIQwFKrXFmI0zAQ6ZgmaVEDL9paB6oc9hfbOyzEuVrZk7SN2
 3kNpnUeMJdDRIchI70Y2QH8bSYtZOFbee+Q+dYzQcGTIspOMdYvIViKaiUR+2ty84KYE
 ktERKUFlCaj88hPmQegIzZ7wqFU1S3+aF7utXG0y8xZODKaCvNjvUzsZq30PlDnC3cnu
 9+Ebih1lXeRtCLNMCLnCrt9VTPJoPiXLYCfh8PGVbZyT+lFNhbbyHf/TQNfJnvIOL3lf
 6+xPaRaboY/YVx1hH1oqqCHr2Y5y1/cgngciBeCpOF1FBrO8HU44xKi6I6SCJvtMpv9G
 7i0g==
X-Gm-Message-State: APjAAAXZoSxatz7gnCunlSt4J5evJ6XDpQymgvhlNlWv/jSsHgR6PaXA
 7d2pUPVXzwyo4pGMdhOL5Ln+EPgYdICfiNcLOwu0sypN
X-Google-Smtp-Source: APXvYqyzag7V1D75fTGvND26u+IcRIt+51XO+JB/XYez6/uVlxzaMM/27y4xZqiLq0rKBPmziWvz2pRd9agkF5Sk5Fg=
X-Received: by 2002:ac8:5519:: with SMTP id j25mr32697726qtq.131.1558638862060; 
 Thu, 23 May 2019 12:14:22 -0700 (PDT)
MIME-Version: 1.0
From: Yoshie Muranaka <yoshiemuranaka@gmail.com>
Date: Thu, 23 May 2019 14:13:46 -0500
Message-ID: <CAOCY4Ee=6TGeFgeypJASOxQJE-1F5-oXCJnASN7PJifz=0G3Zw@mail.gmail.com>
Subject: OpenBMC GUI button style change
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000b4d067058992e3ee"
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

--000000000000b4d067058992e3ee
Content-Type: text/plain; charset="UTF-8"

Hi all,

We are planning to change all button styles in the GUI from
rounded to straight corners.

This will create more visual consistency between the components
in the GUI since there are elements, such as text fields and
dropdowns that are styled with straight corners.

Yoshie

--000000000000b4d067058992e3ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>We are planning to change all b=
utton styles in the GUI from=C2=A0</div><div>rounded to straight corners.</=
div><div><br></div><div>This will create more visual consistency between th=
e components</div>in the GUI since there are elements, such as text fields =
and<br>dropdowns that are styled with straight corners.<div><br></div><div>=
Yoshie</div></div>

--000000000000b4d067058992e3ee--
