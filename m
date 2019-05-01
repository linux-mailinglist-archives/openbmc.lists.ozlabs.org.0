Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A0210AC3
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 18:10:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vNdz5XR4zDqQc
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 02:10:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::12d; helo=mail-it1-x12d.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="KvybN3SX"; 
 dkim-atps=neutral
Received: from mail-it1-x12d.google.com (mail-it1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vNd836ygzDqKb
 for <openbmc@lists.ozlabs.org>; Thu,  2 May 2019 02:09:25 +1000 (AEST)
Received: by mail-it1-x12d.google.com with SMTP id l140so9264935itb.0
 for <openbmc@lists.ozlabs.org>; Wed, 01 May 2019 09:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=nC+e/HrNrN5f4vnWsVg+VD7awXjnIhqCvv8DCYFSsPU=;
 b=KvybN3SX6ABPY/VUxKiXnHsFZwmiv7AM8Q1+H9ytkxz1efyr++YhumVV3kov56ibzr
 IsFDu9+mWukRQyot5VbHGJCofnZb+UYok3ECgAxTshhWBVyEIsehSCCfhWjA4s3iO2Q/
 yw4fbApiGguscy9OkgG1P1NxzaqYv9/IK56sNNcsfmHJk/2kxYbOIuwX5SZBcbrZRdNm
 hNavJyfp5vlwFXPHmSuggxHSkQuul1X91h8FAkRgqu8Z1qQa3CV/362E6ip7dpQJ5lZP
 dzYZhpj5obeefOqk4Vgir0B/PV1Fi3poTEMefjtIgyGvlmHgG6jETPh8o59nae4mfuWs
 Vf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=nC+e/HrNrN5f4vnWsVg+VD7awXjnIhqCvv8DCYFSsPU=;
 b=m4rUfElGafEs2qDagoYPn8CW1YDdCFhVFyoQD7OEEphJ7TeQTzsV5XcZtfQjBmyJnR
 R611H5cUMt2gve8RB1uhBAngribQEDitDBGXQbzSUNk5hQk/Tex8qGfb7Q4gIJjBWQ8u
 aLPeXRO7kN7SnHCTlM1FiBrKHHLY37ZYYIbAM/y8oNEvg1edNAwmRD0E1cQ26R0ByHTF
 rY6YRSqzqYjTZNdSoMXCl4G9Wjd+qS8cWvUIghDUasS4SZ2W7gkwQEqzs7DsggvLG1R2
 KS3TAfPFwcYAxl+4uc+TDdYYUrFtE9qY8gwiUOrfY5h+/H6N57Cx8zZMUeT2OP10V5wY
 jlrw==
X-Gm-Message-State: APjAAAXCXsmLy2rBOqpU+nrOdLu8IQgMWWd6/2qLaQwj/n1415R32dMH
 sQDuOHAgBs4Nb1VE+vqLL5ulz5xee/6lYEUKD4vdIvt6HO4j+Q==
X-Google-Smtp-Source: APXvYqy3X8q3S41GYezt4yOJSQroXA3uYHa/0TY+8/Y/Hm6sQ5mcNxadN0g7ylgPbWFQMlicDBGYFPPzZmR+bsPa1Jo=
X-Received: by 2002:a24:8c:: with SMTP id 134mr8645695ita.24.1556726961727;
 Wed, 01 May 2019 09:09:21 -0700 (PDT)
MIME-Version: 1.0
References: <ba0dfdabde4f7dae554fe0fdb68ee7d7@linux.vnet.ibm.com>
In-Reply-To: <ba0dfdabde4f7dae554fe0fdb68ee7d7@linux.vnet.ibm.com>
From: Nancy Yuen <yuenn@google.com>
Date: Wed, 1 May 2019 09:08:45 -0700
Message-ID: <CADfYTpG0dxhQEHHUdP+8ye0EL0_ZCSCqNrqHSaqkJ1bgjZAGPQ@mail.gmail.com>
Subject: Re: Security Working Group meeting Wednesday May 1
To: Openbmc <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000091587c0587d5bd35"
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

--00000000000091587c0587d5bd35
Content-Type: text/plain; charset="UTF-8"

Alex from Eclypsium will talk about the following:
- present demo of Eclypsium product
- technical details of product operation and limitation
- discuss overall what does hardware/firmware verification mean, how to
verify a device


On Mon, Apr 29, 2019 at 8:18 AM Joseph Reynolds <jrey@linux.ibm.com> wrote:

> This is a reminder of the OpenBMC Security Working Group meeting
> scheduled for this Wednesday May 1 at 10:00am PDT.
>
> Current topics:
> - development items with security impact
> - Eclypsium to talk about their research
>
> Access, agenda, and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group
>
> - Joseph
>
>

--00000000000091587c0587d5bd35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div class=3D"gmail_signature" data-smartmail=3D"gmai=
l_signature">Alex from Eclypsium will talk about the following:</div></div>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div>- pr=
esent demo of=C2=A0<span class=3D"gmail-il">Eclypsium</span>=C2=A0product</=
div><div>- technical details of product operation and limitation</div><div>=
- discuss overall what does hardware/firmware verification mean, how to ver=
ify a device</div></div><br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Apr 29, 2019 at 8:18 AM Joseph Reynol=
ds &lt;<a href=3D"mailto:jrey@linux.ibm.com">jrey@linux.ibm.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This is a re=
minder of the OpenBMC Security Working Group meeting <br>
scheduled for this Wednesday May 1 at 10:00am PDT.<br>
<br>
Current topics:<br>
- development items with security impact<br>
- Eclypsium to talk about their research<br>
<br>
Access, agenda, and notes are in the wiki:<br>
<a href=3D"https://github.com/openbmc/openbmc/wiki/Security-working-group" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/openbmc/wik=
i/Security-working-group</a><br>
<br>
- Joseph<br>
<br>
</blockquote></div>

--00000000000091587c0587d5bd35--
