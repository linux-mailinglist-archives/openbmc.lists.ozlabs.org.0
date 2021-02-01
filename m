Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC8230A066
	for <lists+openbmc@lfdr.de>; Mon,  1 Feb 2021 03:55:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DTXcZ2HxpzDrNZ
	for <lists+openbmc@lfdr.de>; Mon,  1 Feb 2021 13:55:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::833;
 helo=mail-qt1-x833.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=fg6JqOLi; dkim-atps=neutral
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DTXbc6dGszDqwW
 for <openbmc@lists.ozlabs.org>; Mon,  1 Feb 2021 13:54:32 +1100 (AEDT)
Received: by mail-qt1-x833.google.com with SMTP id t14so11269917qto.8
 for <openbmc@lists.ozlabs.org>; Sun, 31 Jan 2021 18:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HDWVU8Zea8TLt5DoHBy2XhwDDfQmFaGVOXbCh/HJPi8=;
 b=fg6JqOLilNSfpr4Xugz22iQkyjjB5MWiYlYI3bNQUiiy7faca7/jvTinXPy3XTh1Uj
 gR3y0nhgfvZJZjfnvk3AjImUY2wLvnDRHhp6cQIkeGNk1m+5Pkk75+pRR32ZIQbqc0zj
 r2n+mLu1Ag18daR7zelw+7qxk+HLCTjhgnAQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HDWVU8Zea8TLt5DoHBy2XhwDDfQmFaGVOXbCh/HJPi8=;
 b=EsHrWdepwxoXCZplulAurR0Vr6Jr6SnJtCcJ+23hE3Z5pnczi6Lj3nAVIFUGo6DOzm
 HU0mNQLCfB62gYRK6lVTTxRncoCmXH4qhqKxTs2k6l6XeKSS2dQEE+FvWWfbcsbxlUkz
 VgiUDwvOdaNGoC+hOPIjMAL1tZ9MXDUjaa+T9itQU2tFToCERHUSKqQIFKDZaoA+n7Gq
 v72CnzxN3XdErPShTRaNx0KPFlT18FonV5MIer9UpBMDywwLC2UQkYLLKmYe7r7TyMpx
 Drmk78USILbnqw4f8ih7MW6fH0PpJJqcTVtc+MhyJ0oPR8NhQjMcWQ65N2vRjOIm+RoL
 UymA==
X-Gm-Message-State: AOAM532RsLImSUP8t/iy4rqrdOdH4AzT07hC63op4NgW2dXFhokpwpAt
 LGybpGaO944xaj0doSreeowVf93hEtEHmw5FDvU=
X-Google-Smtp-Source: ABdhPJw3JpV+c8dv451/yWIRhbbSSrkf75Ecls76QF+g55w6q7ultnwN457zIuqdUkYG2jd/5vk1bAKPa1W3joDdbXQ=
X-Received: by 2002:a05:622a:143:: with SMTP id
 v3mr13730824qtw.363.1612148069048; 
 Sun, 31 Jan 2021 18:54:29 -0800 (PST)
MIME-Version: 1.0
References: <20210129175435.2241080-1-msbarth@linux.ibm.com>
 <93d77064-b5e9-4142-8dce-f6484d4541df@www.fastmail.com>
In-Reply-To: <93d77064-b5e9-4142-8dce-f6484d4541df@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 1 Feb 2021 02:54:17 +0000
Message-ID: <CACPK8XdfHZ4SSNdbNve--k10-6pFgpAELR+m=hOgT0pJ3LnhZg@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8] pmbus:max31785: Support revision "B"
To: Andrew Jeffery <andrew@aj.id.au>
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

On Sun, 31 Jan 2021 at 22:46, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Sat, 30 Jan 2021, at 04:24, Matthew Barth wrote:
> > There was an issue in how the tach feedbacks of dual rotor fans were
> > reported during any change in fan speeds with revision "A" of the
> > MAX31785. When the fan speeds would transition to a new target speed,
> > the rotor not wired to the TACH input when TACHSEL = 0 would report a
> > speed of 0 until the new target was reached. This has been fixed,
> > resulting in a revision "B" update where the MFR_REVISION of "B" is
> > 0x3061.
> >
> > Signed-off-by: Matthew Barth <msbarth@linux.ibm.com>
>
> Can you please send this upstream?

+1, I'll merge this into the openbmc tree once you've had it reviewed upstream.

Cheers,

Joel

>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
