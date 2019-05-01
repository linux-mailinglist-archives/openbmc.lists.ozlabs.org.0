Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 099AD10B8C
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 18:45:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vPQ84v5LzDqP1
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 02:45:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c2b; helo=mail-yw1-xc2b.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="D1ZzuvyF"; 
 dkim-atps=neutral
Received: from mail-yw1-xc2b.google.com (mail-yw1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vPP825xRzDq9V
 for <openbmc@lists.ozlabs.org>; Thu,  2 May 2019 02:44:11 +1000 (AEST)
Received: by mail-yw1-xc2b.google.com with SMTP id q11so8737105ywb.0
 for <openbmc@lists.ozlabs.org>; Wed, 01 May 2019 09:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=2PFggUjQrFVe0OwaUCWrvXBL4r1F9y405gQYONup+jI=;
 b=D1ZzuvyFDlPOIEBlk0Sc5TS76ZBZSTM6xC5IFau9f04pFohKMGZsPMFV7Z3rd2O8C3
 d9V03z+6I7bWTGDU1ezyvRqIv+EfiCsgtpboFDe0plYOpPSCEnxh8CWLOTU/fiohGXxE
 mYZsBXmcLFpZdu6D0LhOC8eOuvc93R+tfGjWS0qBnUe6t9w27XKUsgVbZDBZR8zh9YyV
 zUblB3AgkSZS8resM+6SqjZ5hMR2GZM+WUF+v+0hDIbUuYK2GPiwqjIv5FwgtvfL/ozl
 Rtpr6Ol37+7WKEl+RG0IC6Rmo6OGZgYgmdvMI+e47vsPyAg/6rUEjK51H06v9j3FTXWO
 kg1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2PFggUjQrFVe0OwaUCWrvXBL4r1F9y405gQYONup+jI=;
 b=ZSqYxyhLJYN2dxrZONvPWKiNWQmK/UAaXSZ8r0yXFZ6mtvoMMdD9+MyV3AfZQYtezL
 /0kGP+mOaQ70DskwrzWbK8yZB/esCRlqA+ssvYMsz00DqE9Yp6SDbXqh7bsTu10E7SAr
 rU50OKtqyAa3FlP8seraiRUYo8QB+aHBMBjqCBL3To1KvUYvchf3Hx1vEgmWPAGLUb6k
 dB/vUyKgM3BzApOtvNHhYL0+T/gq4y5qs6EQ1ZXvCFKYhsw6GZr6NU4nKJCxdLX9o1Qo
 oKGRjJvwaS/jSNlosyGjv2mWnDzK2D5CKsNmxvp5aomNGe94XkiLOkon8h80Eak9x/Nr
 bFrw==
X-Gm-Message-State: APjAAAVAiFJhouFcrDzdn4BSCj1jZ7yBk2pmMOCDSoDbUsUv0aYrdY7D
 /xQaopSid+gau/RS7trorjUSGXfJEi6Wn30eMnwPHx2F
X-Google-Smtp-Source: APXvYqyHVDBKT3XOf2NHiUJ8RtlNCr9tc3zOiTFAYlrETUQTqY6f545VEfslq8rsPaAx4FqC6m5V3/pAfij+xnFm3Iw=
X-Received: by 2002:a81:3902:: with SMTP id g2mr48654059ywa.1.1556729048083;
 Wed, 01 May 2019 09:44:08 -0700 (PDT)
MIME-Version: 1.0
From: Jandra A <jandraara@gmail.com>
Date: Wed, 1 May 2019 11:43:57 -0500
Message-ID: <CAMTupoRYLd6CFXqxUcEg9JRnENZLLwXxB7K2OuYDNoZQex6Htw@mail.gmail.com>
Subject: Boot options - GUI Design Proposals
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000ec31840587d6395f"
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

--000000000000ec31840587d6395f
Content-Type: text/plain; charset="UTF-8"

Hello all,

We've created some initial design mockups for Boot options and we'd like
your feedback.

There are two main open questions that could impact the proposal:
1. Will we support booting from a user's laptop?
2. What is the value (for users) in being able to set different settings
for the next reboot and for all subsequent reboots after that?

Prototype:
https://ibm.invisionapp.com/share/8ENYRVXAPFD#/319095138_1-_Boot_Options_-_System_On

GitHub Issue: https://github.com/openbmc/phosphor-webui/issues/82

As a reminder: Use the right and left arrow keyboard to navigate through
the mockups. To comment, click on the bottom right of the screen where it
says '# Comments'

Thank you Deepak and Santosh for helping us develop and understanding for
this topic.

Regards,
GUI Design Team

--000000000000ec31840587d6395f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hello all,</div><di=
v><br></div><div>We&#39;ve created some initial design mockups for Boot opt=
ions and we&#39;d like your feedback.=C2=A0</div><div><br></div><div>There =
are two main open questions that could impact the proposal:</div><div>1. Wi=
ll we support booting from a user&#39;s laptop?=C2=A0</div><div>2. What is =
the value (for users) in being able to set different settings for the next =
reboot and for all subsequent reboots after that?=C2=A0</div><div><br></div=
><div>Prototype: <a href=3D"https://ibm.invisionapp.com/share/8ENYRVXAPFD#/=
319095138_1-_Boot_Options_-_System_On">https://ibm.invisionapp.com/share/8E=
NYRVXAPFD#/319095138_1-_Boot_Options_-_System_On</a>=C2=A0</div><div>GitHub=
 Issue:=C2=A0<a href=3D"https://github.com/openbmc/phosphor-webui/issues/82=
">https://github.com/openbmc/phosphor-webui/issues/82</a></div><div><br></d=
iv><div>As a reminder: Use the right and left arrow keyboard to navigate th=
rough the mockups. To comment, click on the bottom right of the screen wher=
e it says &#39;# Comments&#39;</div><div><br></div><div>Thank you Deepak an=
d Santosh for helping us develop and understanding for this topic.=C2=A0</d=
iv><div><br></div><div>Regards,</div><div>GUI Design Team=C2=A0</div></div>=
</div></div>

--000000000000ec31840587d6395f--
