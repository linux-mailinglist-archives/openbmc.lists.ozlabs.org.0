Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 377154BDB2
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 18:08:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TVHM1XZ9zDqY1
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 02:08:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=derick.montague@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tzGSwZvK"; 
 dkim-atps=neutral
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TVGm2TFjzDqNm
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2019 02:07:59 +1000 (AEST)
Received: by mail-io1-xd2a.google.com with SMTP id i10so747842iol.13
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jun 2019 09:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AlbTXEkBSmUeHyHiRNroHBKnL8cQ+Xhjtg2W31dpMTU=;
 b=tzGSwZvKhe6JRPTXUPpe+Z45kh1Pi2tRWBi9lC4cucf12A6uvCWdBHWccl/+lGWikC
 HCHCaHHJxBkXkOzzUGB7qbo1c7PfFamYo1I1b1C3y9Y9+u7p0Vhwozq8xSXCGzeHFsz5
 +N2Lz7K+pQsuG4ZlslBaAr9APXq32Cp5nzrUqI2jqrTHMGkV5uavVQk4/w1KpvJaMe1s
 vJxZLnCb4GtAfvFEPv7YfIs2rTkb+Ps7fxvKgm7JNbj6N/Nc9U/FPGq9V1L6GbFINg/5
 92bET8DZuDXY21BAqdv+s0qtMs82PaWywBApR5WvngcarNVPqSbC8AsO2czWqzRwWst0
 U/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AlbTXEkBSmUeHyHiRNroHBKnL8cQ+Xhjtg2W31dpMTU=;
 b=lPwix8DdxkmkzfnA7PX+6eTfs4Zubi2fmZf6y9vFERz3u4WK5jjrlvhD+Z2KRS009J
 tPeZeNyjlVQ3fpqjfTuumoeNYsC4TJJbUvuEjWv7pjo7jIlBM2TpvhDN9gUMZXFXN44W
 7fSHrlh5wImTKtK/fZqiGxlg7PXiiJkZKtLDqDxxUTGp6f2cng/I6WRDZwltFx/RgsOw
 DwrSS7TOk3jSi9k/iPY14ZZ3hy4cjgtqTQupiCbGqq1rNFGz3vkHut1UcfdNdY/jnVA5
 xP0am1TMhya4rVeoRgJbFDLda5aTlUI4+W3d83XeSB8q584nWHWyQVb3JmNy6B2wxPqz
 t3ZQ==
X-Gm-Message-State: APjAAAXJonRBeeror6n4HrDL/9af1mSUlCcKI6S6un0MoT021IPoqGye
 A0q35ctjwSkIxeJuuKSXkH+He3DcTglZMTI0COI=
X-Google-Smtp-Source: APXvYqy7BIQHVqBEkNV4zCdG7STdRPpPRs3FWYfHe9xgv2cjSDtQFfH162crZLa+aUUoXuW2/mzBN4j6efXVF5ZDuAI=
X-Received: by 2002:a05:6602:220a:: with SMTP id
 n10mr11539977ion.205.1560960476404; 
 Wed, 19 Jun 2019 09:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAMTupoT_45Zbh04qoMv4RkKpVSBOh7VRfvrEwan9gf13XDNvhQ@mail.gmail.com>
In-Reply-To: <CAMTupoT_45Zbh04qoMv4RkKpVSBOh7VRfvrEwan9gf13XDNvhQ@mail.gmail.com>
From: Derick <derick.montague@gmail.com>
Date: Wed, 19 Jun 2019 11:07:45 -0500
Message-ID: <CAOUmYFQ8oFaOesTtc83cNa5tha+8aA0i9cCsYwxNPkKZUO5E6Q@mail.gmail.com>
Subject: Re: GUI workgroup meeting - Wednesday 10:30 AM CST
To: Jandra A <jandraara@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Agenda and notes for the 6/19/19 GUI Community workgroup can be found
at https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group#61919.

As a note, attendance has been solely IBM community members. We would love
to have others join. We are hoping that changing the time from 7:00 AM Central
to 10:00 AM Central will make that possible for people invested in the
GUI to attend.
Any and all feedback is appreciated!
