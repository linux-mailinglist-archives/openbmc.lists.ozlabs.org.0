Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1963297724
	for <lists+openbmc@lfdr.de>; Fri, 23 Oct 2020 20:39:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHtKx5j7BzDr5b
	for <lists+openbmc@lfdr.de>; Sat, 24 Oct 2020 05:39:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::233;
 helo=mail-oi1-x233.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gEgojDVi; dkim-atps=neutral
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHtK96X8RzDqvp
 for <openbmc@lists.ozlabs.org>; Sat, 24 Oct 2020 05:38:20 +1100 (AEDT)
Received: by mail-oi1-x233.google.com with SMTP id k65so2329691oih.8
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2020 11:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=CgJm0gWCCqCh1M4qUoa84DKKMOHYIM6ztU2e0B+IV8I=;
 b=gEgojDViIrHvW8xAk4m/uUoRM65dEOiR5cP+wtwBOZiw4FhqrEsncSiMAqJIHt40HZ
 CwmrH9NC4nnySgAM0P9wC/Lcn1ElDCqgy+EGlUsNwwsG2XWw43448nlczHZ+pB1R8sum
 VMi0AMU9s4DLsL3z4oS8ZRYP9oqIHIJmQB+BIZCQZGr9mSUjTTVNz0eTKQO5zJ8QtfGK
 rYux4FWTVvAJ0xFAx/NR5a03oX+E/90wL2U0yJu2/HxUAFyDBA96M/5V6vzz3cTlNvDc
 uW4gCO/USFHCHU3kkbtrHcslrkt2/jdPRz0vUiJEfcMKuv22KcTCqPFdnfbdhTtQdiQ7
 skTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=CgJm0gWCCqCh1M4qUoa84DKKMOHYIM6ztU2e0B+IV8I=;
 b=eqg8Wsn3xcA4MaeyBFTeBM5tJHKZYJfL2k7pgYnaWgXdNyTEz6bmy4gdRdFL2NsI2X
 A8wZcQU+5dkF3yCa8m+2PMMlUHnzrC29SKUXwLu3H+x9H9I9HuLibbmu7B+s2nHyAI4J
 qryz8r5Tc8mRwH5EQn+fNOrW2jIlan7+t37/RkPVGiMIF/g0h7DNnzbFFRf/nQf9dHuq
 GDwalJjYBmvFrxFBP7slwJ4AMB78J/R7N9ofFHKNslEzTR5MpPTXrlgg/jOVLraynFct
 RXNBJgLCeYa7JX/h0zVPC/bh9VZ9BOGILhAGwQv+AI/Ij4t27NBxKMmX73aZCGfPike/
 ik/A==
X-Gm-Message-State: AOAM532oiZ0pkD17VcwSrAwoOgfZkIPm7xIcvEL6O5SwHbtTRuEFDL8E
 AE7rB2ZjoJvXzb/YXUrkk6+dhnVv6Sf1+A==
X-Google-Smtp-Source: ABdhPJz4/sU3DCIoFeem6RNZUOuIC5fRMsrmtuDMhLW9Jv/EOWA7JtBaLQcWgvLxnVanQnNBeyr4cg==
X-Received: by 2002:aca:dc44:: with SMTP id t65mr2836851oig.77.1603478296985; 
 Fri, 23 Oct 2020 11:38:16 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 (45-18-127-186.lightspeed.austtx.sbcglobal.net. [45.18.127.186])
 by smtp.gmail.com with ESMTPSA id m7sm568348otk.74.2020.10.23.11.38.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2020 11:38:16 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: openbmc:Error while running bitbake for raspberrypi-3
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <CAD+gp9CQeUk1tiFkq0kyzhZjXraacgYwCv232JqRdr+RGc-ABw@mail.gmail.com>
Date: Fri, 23 Oct 2020 13:38:15 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <1DCD1D9A-FF1C-4833-B525-4564C88352B8@gmail.com>
References: <CAD+gp9CHnvDk+sU05DhMpuOshST-cAx2LoU+kZJjjEHeKzztMA@mail.gmail.com>
 <CAD+gp9A2OLcJsRtSUH_32G+8fNMx2_8FRBTZjjMuLc+eLZt11Q@mail.gmail.com>
 <CAD+gp9CQeUk1tiFkq0kyzhZjXraacgYwCv232JqRdr+RGc-ABw@mail.gmail.com>
To: khader basha shaik <shaikkhaderbasha601@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Oct 23, 2020, at 6:24 AM, khader basha shaik =
<shaikkhaderbasha601@gmail.com> wrote:
>=20
> Hi Team,
>=20
> I tried with  =E2=80=9Cbitbake core-image-base=E2=80=9D  command but =
still not working. Unable to generate   the rpi-sdimg file.
>=20
> Thanks & Regards,
> Khader B Shaik
> On Fri, 23 Oct 2020 at 15:55, khader basha shaik =
<shaikkhaderbasha601@gmail.com> wrote:
> Hi Team,
>=20
> Any suggestions or input on this please.

Hi Khader, raspberry-pi is definitely looking for a maintainer in =
OpenBMC.

Your error reminded me of this, so may be as simply as doing something
like this commit:=20
https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/36144

There are also some commits out there that I know helped raspberry pi at
one point:
=
https://gerrit.openbmc-project.xyz/q/topic:%22raspberrypi%22+(status:open%=
20OR%20status:merged)

Andrew=
