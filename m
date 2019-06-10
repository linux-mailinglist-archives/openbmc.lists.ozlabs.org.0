Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D55DA3B501
	for <lists+openbmc@lfdr.de>; Mon, 10 Jun 2019 14:29:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Msrl2sfnzDq9y
	for <lists+openbmc@lfdr.de>; Mon, 10 Jun 2019 22:29:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CzZ4SX5u"; 
 dkim-atps=neutral
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Mspp5XSFzDqPm
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jun 2019 22:27:44 +1000 (AEST)
Received: by mail-oi1-x234.google.com with SMTP id t76so6079938oih.4
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jun 2019 05:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Fp0UmtY8/KJj/1Y9ps7DGUixC/X6+hVKXAhLkB3Qgmw=;
 b=CzZ4SX5uB4k5ePWTp797BPdeXIbXG7FGN/Ad+sbZhKIIQzDMZ24Om6VcTtCQrvKBBH
 aQiplyuO//6s/BFOL8pGdIUrRIdzFiNyNrVbVCyo8GUT5529bCW79eaeqP24r0nQ2a81
 8Q1xGXfyW8gSVwkVne7EFoyfx28AjdMBnBSxkXIMKg02YPkMdEf4oBETYa4YNMly58oq
 ir6cdQJ2WG7PixlGwlpRTvGCtFqLeFJYX+CXrzb4FqgetrcuPBHAPvoKiJyGkrvAmR57
 5wittSuUiSe4n5muH+0a1QRXOtnxeta1+WPvsqKinamzZZnfS+R3sAd8eqYhnfOFImii
 sOhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Fp0UmtY8/KJj/1Y9ps7DGUixC/X6+hVKXAhLkB3Qgmw=;
 b=OzMTOUYWKgGpZ2tC3OHwDRYuj+QFQYxLpDcTTlG7S9QuB/lRhUYipi+RGF+egqlDnJ
 dtAHY//Ab0uYX2Y5ArTsR4uVw//9e108MVVG2l+0tq20yE8KWRfQ5kvbeyiMB+UUEabs
 GXImnsTsIvz/kJZO488fe4GgZA1wktJ6DPTU/HIxgcM8jClBLQsvZEbqAmxOH5XpI7Kd
 qUFyWGaCGsaYymDSKbDkBKUxfkRecZBQZ08GyRYSMZsiDiyR2EgngURI2Gnxqxjq+n4m
 nzRPA5mJRQ7wLB21H8DQb2/lFQjOnnoofdlmaIxV+1oRLmavBWHnJeG1BZnGFEFdpZS0
 YmMw==
X-Gm-Message-State: APjAAAXopttERUMokJoEIG6zYaxH/uDqdz7M1xY8zsvZexqwnD9/c4Ws
 GBdZjRCD3mKXuH3gosAUpPJl4gDRUwogTU+rY0c=
X-Google-Smtp-Source: APXvYqwj+Mkgi7AQDgbGN5m+e5fH01BZo38sLzP6HX426F5dtWc97rGOGKTwjpSP+Mpxt7aVjWUNxp91t/GBDXu2FXk=
X-Received: by 2002:aca:30cc:: with SMTP id w195mr5087175oiw.42.1560169660759; 
 Mon, 10 Jun 2019 05:27:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAJQj_PoNcJPQcT_uG9vN4nsi2512_xcjA5Oput+=xE2Ragqt6Q@mail.gmail.com>
In-Reply-To: <CAJQj_PoNcJPQcT_uG9vN4nsi2512_xcjA5Oput+=xE2Ragqt6Q@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 10 Jun 2019 07:27:25 -0500
Message-ID: <CALLMt=qf+vHae1cHRe2uU6rPHqH1f4Nm=wCa2H4rbSqVtMeVQA@mail.gmail.com>
Subject: Re: stable image archive
To: Simon Barber <simon.d.barber@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, Jun 9, 2019 at 12:28 PM Simon Barber <simon.d.barber@gmail.com> wro=
te:
>
> Is there an archive  of stable built and released images for openbmc ? As=
 part of my masters project I would like to run some pen tests against the =
the image, to compare with other BMCs out and in use.

Our tagged releases are built out here -
https://openpower.xyz/job/openbmc-build-tags/

You can always checkout the tag and build yourself if needed
(especially if you need an SDK since we don't keep those around).

>
> If  there is no stable release archive   is ipmi tool built as part of th=
e palmetto build, I can find reference to a set of diffs to add it to the b=
uild, but there has been a restructure since then, and so the diffs dont pa=
tch cleanly and i dont understand the structure enough yet to resolve the c=
onflicts., so do I need to build the sdk and then download and build openbm=
c/ipmitool
>
>
> Thanks.
>
> Simon
