Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBB930B54E
	for <lists+openbmc@lfdr.de>; Tue,  2 Feb 2021 03:37:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DV89J5XPSzDqw8
	for <lists+openbmc@lfdr.de>; Tue,  2 Feb 2021 13:37:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82e;
 helo=mail-qt1-x82e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=J1qAxbvt; dkim-atps=neutral
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DV88Z0WFrzDqSY
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2021 13:36:44 +1100 (AEDT)
Received: by mail-qt1-x82e.google.com with SMTP id c1so13991627qtc.1
 for <openbmc@lists.ozlabs.org>; Mon, 01 Feb 2021 18:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2WDEmQOlXJ0Ugx1rPskojuxHH+Pe9pVMYW+KBdvRdz0=;
 b=J1qAxbvt3cF5go8ETAmldWld1AjNqvF04gWh2vaCy9PYCJ+co9C2m4lRjB5zY3EugJ
 Gd8eCUbRCMa00Y3zSV3JjVVfOgv7uayp+uwcLpo2iP5TW+0YAsHyJwOYMhOM5nq+QnG9
 /mmi71CIf1AnkMLEazBqf0jdcYoxelEPmvvv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2WDEmQOlXJ0Ugx1rPskojuxHH+Pe9pVMYW+KBdvRdz0=;
 b=TNwM6XxGnSS2uucuxRP+x6+7gH4iFYMpvBrge70KInG6xBkfKRzuUa6o0Ap6aMtBVv
 /LFXob/ahOeSalD5Q/pAG/XC7HyqFd+an8lTxlmGiGZ3Uyw2NO9M6ZAXTS8vwrX8nmce
 B0TIVbbYiRzq1ytOd4CCUoSMA6r0lr2uc0N5T+AA9rTAeb16c33q3xFq4GC3LiPQpiD+
 uKsEw/K9pRH+ltutis54+qkX6q/Atuja727svcFay+WIcc9czHWp2q3BA1AWG/x4NjC2
 frUJXJV/LUb9Z59KorREZSNNH2qDeiVOz9d0/Y3KcznglYtjqYMgGbtWMPLlftty+rz0
 prEg==
X-Gm-Message-State: AOAM530c2sdw0RfkK6ELEveLW8xL8jynXgah/NSFZslV+HjdlfwC9EEC
 caBV9P3vXSJcZ5AZ5W0rA+k2Sd/8S13P0ada+QBr5rDm
X-Google-Smtp-Source: ABdhPJy7ZEs9jPJqx8dmy5x4s3Iue6iRC7gxltaBYByqwDZTFilvlmT8ZU/6RszO1hx6dXFrAdeZcgMVt9hfVnZfBp0=
X-Received: by 2002:ac8:5953:: with SMTP id 19mr18040573qtz.263.1612233400663; 
 Mon, 01 Feb 2021 18:36:40 -0800 (PST)
MIME-Version: 1.0
References: <20210129175435.2241080-1-msbarth@linux.ibm.com>
 <93d77064-b5e9-4142-8dce-f6484d4541df@www.fastmail.com>
 <6e579a63-ddbd-66c3-5ce2-9369d1a5cd62@linux.ibm.com>
In-Reply-To: <6e579a63-ddbd-66c3-5ce2-9369d1a5cd62@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 2 Feb 2021 02:36:27 +0000
Message-ID: <CACPK8Xd2Eh3ktW0VMVv6uujASre964EbNQJNiHGB_dgQr=UO+w@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8] pmbus:max31785: Support revision "B"
To: Matthew Barth <msbarth@linux.ibm.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 1 Feb 2021 at 14:14, Matthew Barth <msbarth@linux.ibm.com> wrote:
>
>
> On 1/31/21 4:46 PM, Andrew Jeffery wrote:
> >
> > On Sat, 30 Jan 2021, at 04:24, Matthew Barth wrote:
> >> There was an issue in how the tach feedbacks of dual rotor fans were
> >> reported during any change in fan speeds with revision "A" of the
> >> MAX31785. When the fan speeds would transition to a new target speed,
> >> the rotor not wired to the TACH input when TACHSEL = 0 would report a
> >> speed of 0 until the new target was reached. This has been fixed,
> >> resulting in a revision "B" update where the MFR_REVISION of "B" is
> >> 0x3061.
> >>
> >> Signed-off-by: Matthew Barth <msbarth@linux.ibm.com>
> > Can you please send this upstream?
>
> Will do. Didn't realize this driver had got accepted upstream.

Thanks. I've merged the version that Guneter committed upstream.

Cheers,

Joel
