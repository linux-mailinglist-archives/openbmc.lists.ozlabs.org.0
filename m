Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA63833D42
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 04:42:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Hx6h0PW8zDqTP
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 12:42:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::12f; helo=mail-it1-x12f.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SUnljCLc"; 
 dkim-atps=neutral
Received: from mail-it1-x12f.google.com (mail-it1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Hx6D3ryKzDqKW
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jun 2019 12:42:28 +1000 (AEST)
Received: by mail-it1-x12f.google.com with SMTP id e184so29982521ite.1
 for <openbmc@lists.ozlabs.org>; Mon, 03 Jun 2019 19:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DgUBnghKIUTiBuAZJwiKow/GIbkcZDZivDut29mwyq8=;
 b=SUnljCLc0oJ+M3tC/H2ToZurb/g/kEx2NICjMAyFbM2zjANCfZtCG4nNbZRut4P/2M
 D8DhRaCEGEhKYWOFsCXgUIcyCX6yIwzcXQPeURwNyFS2+Xl6lZWrzMceIR5blzuJQHG5
 faQWdjMO7+Mpq7IQvchelU9HvRdF4fomi4kgTW/4ClqF8EvncewH56SQcZ0j9FrNwdiL
 hIVWVi5Tbnd1x+FC95yAhEM/3cND+rthxr5aW4rMUWPczC25Yp07ZDg98qRWRjM0yjas
 4FenKMWD6jBrGo+NfD56+ei6K7aPIGqDYRTuxhC1Ct7iuRRTr1EK3GndqHgSpBPNqSbH
 h/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DgUBnghKIUTiBuAZJwiKow/GIbkcZDZivDut29mwyq8=;
 b=WCSUMyT6C3GChKPrVX554KFrZ7kXMvh7LyEaUZ/RGQ17aLMnWm8cl/VvL/kM4IvF/G
 iwBoUOgSldABeZlx8imvdlsATnKAhzPNRH3Z4qfNuY5IIoyw7ejmerlR1EqdFj4EAHRZ
 WP3FSu6EefdOYQ1n2xB2dvDDvG5SweuoSQFrpA378NWZ1/zK1YUYXjxPWTBx0Q2AYhzt
 O0owfVqzDnRCLlf/t4eqsif60jFUbF8djbCD4kCn6+I9BqYuoz+H/Gz1yzDiFmD8oun4
 XEKPTjOqKoa5Is5DfRAEqd8kY4S+pFgAjNulaEUxzzs1AH+2RZizz9QMZP+2bXeREQe3
 HkPw==
X-Gm-Message-State: APjAAAWhl2N1w09KsoFvbC0QF6shjtVxa4+Boed7ByGRLN7fHq+nxw2W
 CgwAIYgo4PuKtjtpVHd61kQLKXksR6+xMBZXC7o=
X-Google-Smtp-Source: APXvYqxAKROASiCdyBIRQ0DuukMcR+HiSMjsB7tsqyU5Ctii+XjXIV0M8ugVArdz4VeDXY6OnQ6IDIvZQjOuB0ofU9o=
X-Received: by 2002:a02:a384:: with SMTP id y4mr19268221jak.77.1559616144867; 
 Mon, 03 Jun 2019 19:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAARXrt=6mZtVuwdTxamjUWXJk5RXNKaNM9aVZE5nEyTjowVjEQ@mail.gmail.com>
 <CALLMt=pdm=Nk5sCZvZBORb+N5suT7-FK0xbvWUy3Qxg5KcttKA@mail.gmail.com>
In-Reply-To: <CALLMt=pdm=Nk5sCZvZBORb+N5suT7-FK0xbvWUy3Qxg5KcttKA@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 4 Jun 2019 10:42:14 +0800
Message-ID: <CAARXrtnR2S7KokkpT_mOTm1mB=2ruJ12ZjQrfQEe7hgK_9-iSA@mail.gmail.com>
Subject: Re: [Design] PSU firmware update
To: Andrew Geissler <geissonator@gmail.com>
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

> > And during updating:
> > 4. After the update is done on a PSU, the AC input and DC standby output shall
> > be checked.
>
> What happens if this fail? Auto roll back or just an error log?

I do not think there will be a way to roll back (and it could get failure on
rolling back as well).
So probably just log an error and do not update other PSUs, so that the
system's other PSUs are good.

> > The PSU firmware code update will re-use the current interfaces to upload,
> > verify, and activate the image.
>
> Yes, this ensures the existing Redfish firmware update API's implemented
> within bmcweb will also work for this without any changes required.

Yup.

> >    * When the PSU code update is completed, an informational event log shall be
> >      created.
> Is this a normal requirement when it comes to PSU's? We don't do this for BMC
> or PNOR.

I expect that an informational log is good to tell that something is done,
something like audit log.
But we could remove this requirement if it is not mandatory.
