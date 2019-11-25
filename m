Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDA1109532
	for <lists+openbmc@lfdr.de>; Mon, 25 Nov 2019 22:38:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ML526ZZ6zDqV1
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 08:38:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::229;
 helo=mail-oi1-x229.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Giwgedtm"; 
 dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ML4N6C9kzDqSv
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 08:38:12 +1100 (AEDT)
Received: by mail-oi1-x229.google.com with SMTP id a69so7396082oib.2
 for <openbmc@lists.ozlabs.org>; Mon, 25 Nov 2019 13:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tZ74/LU61bYWovGrMSShgAe6y2IgGwPHcMEfhfbswoU=;
 b=Giwgedtmmi3cuJpsi6GIVtm9gmooFLOZnzj0zcErlvf/7AdqrewFO+onkZsCXhEvBR
 247r4Al9jr+7qt6AuZnmuoF1txeLRbqH3O0wz+nBS4lJJU2ElCrts70wdWYn2ijkIExl
 g52Kv4T+lNWUPMpNmemiWXTRTlvrKnvvWaaz28i+US/4uhAdYSDu30TPA425LMoVpFBs
 1BCFWPo/fKVKYr9apRDhZJsX3c4UKv72M/bNgoLxinFNMJx45+F5yJsr4VCw8OigWlkL
 KUg0BLtjVZIhUdfbr28lnCwUUyvtUei1zz1QBSgKGc7AJlfWI9CO0+ubnI8sEEt9Xp2K
 2fHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tZ74/LU61bYWovGrMSShgAe6y2IgGwPHcMEfhfbswoU=;
 b=ZzuoNGjZjyssMw0dgaSv4NxYP8wqiVK93YYUVT/K2O8OM3YjgQh632s2EUaxvRFTYW
 qSShzH5tollisIlLurRuMzN7XnmgHfo6YT9PigtHQ/BJioAltcwbyCzj9zumddcuFVKi
 Yh5rZlL1v5RB5deN+43xJjSMWlNolrgCElp3QxJFn4ZApUkWkoWS+/aiMGL73DquhzPk
 hEQGcLhPN/eOYjfAnA4SZJ7OAEZqAyYV7HdKkdBm8A0K6elnwCoWVYk+uH1IKKjPjgv5
 HX3OA9588Ag2yPwu91ScPjDMA7STs+P1WLyjJRdHtP8tkJ2eY0GIYIinTrX3bbv2MlaL
 gEZQ==
X-Gm-Message-State: APjAAAUu7AfJOkM/1g2EKfChEt8RoYwbZC8AhIgkNQ789p/lJI2CuKKu
 W3Q1sXuHqlYDL5sVcKE9ff59I73n8dhrr9aYdKEdBX+o
X-Google-Smtp-Source: APXvYqxcpy/2JKiUhChQpzGk8RXNAivJuTCIqSwJpvDEfB2TcO27aZYHRck37rwfvYMy2ahqX0yF4pmM+onZ8dJITWM=
X-Received: by 2002:aca:280c:: with SMTP id 12mr861030oix.4.1574717889107;
 Mon, 25 Nov 2019 13:38:09 -0800 (PST)
MIME-Version: 1.0
References: <98ab5fc7-60e7-3e90-1e9e-bf7e220a2a50@linux.ibm.com>
In-Reply-To: <98ab5fc7-60e7-3e90-1e9e-bf7e220a2a50@linux.ibm.com>
From: Brandon Wyman <bjwyman@gmail.com>
Date: Mon, 25 Nov 2019 15:37:34 -0600
Message-ID: <CAK_vbW3xT8WL5qnBVV_m-HVY84DWYNCpH=ntYyLNzgyFJMzw0A@mail.gmail.com>
Subject: Re: BMCWeb auth primer
To: Joseph Reynolds <jrey@linux.ibm.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Nov 11, 2019 at 7:41 PM Joseph Reynolds <jrey@linux.ibm.com> wrote:
>
> Dear OpenBMC community and BMCWeb maintainers,
>
> I worked on BMCWeb, learned how it works, and put together this little
> primer on its authentication and authorization flows.  I think portions
> of it are generally useful to the community, and specifically useful to
> help guide BMC security work.  Certainly, I may want to refer back to it.
>
> The material is more-or-less in markdown format, but no promises.
>
> Take a peek, learn about auth security topics, correct my errors and
> omissions, and let me know your ideas how to incorporate this into the
> project.  Thank you!
>
> - Joseph
>

Would this have worked better as a gerrit commit, or a public gist
that you could point to?

>
> # BMCWeb auth primer
>
> This describes the BMCWeb server's authentication and authorization
> flows, showing how they relate to the usage shown in the [REDFISH
> cheatsheet][] and [REST cheatsheet][], to [Phosphor User Manager][], and
> to the [BMCWeb code][].
>
<SNIP>
